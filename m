Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE35BF0AAC
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 12:50:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F67510E410;
	Mon, 20 Oct 2025 10:50:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3E26610E410
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 10:50:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC9CE1063;
 Mon, 20 Oct 2025 03:50:28 -0700 (PDT)
Received: from [10.57.36.117] (unknown [10.57.36.117])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 604583F63F;
 Mon, 20 Oct 2025 03:50:34 -0700 (PDT)
Message-ID: <022e2ea5-74e3-4d53-9afe-8ead71853ee4@arm.com>
Date: Mon, 20 Oct 2025 11:50:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 06/10] drm/panthor: Implement L2 power on/off via
 PWR_CONTROL
To: Karunika Choo <karunika.choo@arm.com>, dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <20251014094337.1009601-1-karunika.choo@arm.com>
 <20251014094337.1009601-7-karunika.choo@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251014094337.1009601-7-karunika.choo@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/10/2025 10:43, Karunika Choo wrote:
> This patch adds common helpers to issue power commands, poll
> transitions, and validate domain state, then wires them into the L2
> on/off paths.
> 
> The L2 power-on sequence now delegates control of the SHADER and TILER
> domains to the MCU when allowed, while the L2 itself is never delegated.
> On power-off, dependent domains beneath the L2 are checked, and if
> necessary, retracted and powered down to maintain proper domain
> ordering.
> 
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_pwr.c | 390 +++++++++++++++++++++++++-
>  1 file changed, 388 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_pwr.c b/drivers/gpu/drm/panthor/panthor_pwr.c
> index d07ad5b7953a..594181aba847 100644
> --- a/drivers/gpu/drm/panthor/panthor_pwr.c
> +++ b/drivers/gpu/drm/panthor/panthor_pwr.c
> @@ -23,6 +23,14 @@
>  	 PWR_IRQ_COMMAND_NOT_ALLOWED | \
>  	 PWR_IRQ_COMMAND_INVALID)
>  
> +#define PWR_ALL_CORES_MASK		GENMASK(63, 0)

This isn't 32bit safe (I think that's what the kernel test robot is
complaining about). Use GENMASK_U64().

> +
> +#define PWR_DOMAIN_MAX_BITS		16
> +
> +#define PWR_TRANSITION_TIMEOUT_US	2000000
> +
> +#define PWR_RETRACT_TIMEOUT_US		2000
> +
>  /**
>   * struct panthor_pwr - PWR_CONTROL block management data.
>   */
> @@ -59,6 +67,302 @@ static void panthor_pwr_irq_handler(struct panthor_device *ptdev, u32 status)
>  }
>  PANTHOR_IRQ_HANDLER(pwr, PWR, panthor_pwr_irq_handler);
>  
> +static u64 panthor_pwr_read_status(struct panthor_device *ptdev)
> +{
> +	return gpu_read64(ptdev, PWR_STATUS);
> +}
> +
> +static void panthor_pwr_write_command(struct panthor_device *ptdev, u32 command, u64 args)
> +{
> +	if (args)
> +		gpu_write64(ptdev, PWR_CMDARG, args);
> +
> +	gpu_write(ptdev, PWR_COMMAND, command);
> +}
> +
> +static const char *get_domain_name(u8 domain)
> +{
> +	switch (domain) {
> +	case PWR_COMMAND_DOMAIN_L2:
> +		return "L2";
> +	case PWR_COMMAND_DOMAIN_TILER:
> +		return "Tiler";
> +	case PWR_COMMAND_DOMAIN_SHADER:
> +		return "Shader";
> +	case PWR_COMMAND_DOMAIN_BASE:
> +		return "Base";
> +	case PWR_COMMAND_DOMAIN_STACK:
> +		return "Stack";
> +	}
> +	return "Unknown";
> +}
> +
> +static u32 get_domain_base(u8 domain)
> +{
> +	switch (domain) {
> +	case PWR_COMMAND_DOMAIN_L2:
> +		return PWR_L2_PRESENT;
> +	case PWR_COMMAND_DOMAIN_TILER:
> +		return PWR_TILER_PRESENT;
> +	case PWR_COMMAND_DOMAIN_SHADER:
> +		return PWR_SHADER_PRESENT;
> +	case PWR_COMMAND_DOMAIN_BASE:
> +		return PWR_BASE_PRESENT;
> +	case PWR_COMMAND_DOMAIN_STACK:
> +		return PWR_STACK_PRESENT;
> +	}
> +	return 0;
> +}
> +
> +static u32 get_domain_ready_reg(u32 domain)
> +{
> +	return get_domain_base(domain) + (PWR_L2_READY - PWR_L2_PRESENT);
> +}
> +
> +static u32 get_domain_pwrtrans_reg(u32 domain)
> +{
> +	return get_domain_base(domain) + (PWR_L2_PWRTRANS - PWR_L2_PRESENT);
> +}
> +
> +static bool is_valid_domain(u32 domain)
> +{
> +	return get_domain_base(domain) != 0;
> +}
> +
> +static bool has_rtu(struct panthor_device *ptdev)
> +{
> +	return ptdev->gpu_info.gpu_features & GPU_FEATURES_RAY_TRAVERSAL;

Ok, I see why you added GPU_FEATURES_RAY_TRAVERSAL in a previous patch.
It might be ok then to just explain in the commit message why that
definition was included. Or you could move it to this patch where the
usage is.

> +}
> +
> +static u8 get_domain_subdomain(struct panthor_device *ptdev, u32 domain)
> +{
> +	if ((domain == PWR_COMMAND_DOMAIN_SHADER) && has_rtu(ptdev))
> +		return PWR_COMMAND_SUBDOMAIN_RTU;
> +
> +	return 0;
> +}
> +
> +static int panthor_pwr_domain_wait_transition(struct panthor_device *ptdev, u32 domain,
> +					      u32 timeout_us)
> +{
> +	u32 pwrtrans_reg = get_domain_pwrtrans_reg(domain);
> +	u64 val;
> +	int ret = 0;
> +
> +	ret = gpu_read64_poll_timeout(ptdev, pwrtrans_reg, val,
> +				      !(PWR_ALL_CORES_MASK & val), 100,
> +				      timeout_us);
> +	if (ret) {
> +		drm_err(&ptdev->base, "%s domain power in transition, pwrtrans(0x%llx)",
> +			get_domain_name(domain), val);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void panthor_pwr_info_show(struct panthor_device *ptdev)
> +{
> +	drm_info(&ptdev->base, "GPU_FEATURES:    0x%016llx", ptdev->gpu_info.gpu_features);
> +	drm_info(&ptdev->base, "PWR_STATUS:      0x%016llx", gpu_read64(ptdev, PWR_STATUS));
> +	drm_info(&ptdev->base, "L2_PRESENT:      0x%016llx", gpu_read64(ptdev, PWR_L2_PRESENT));
> +	drm_info(&ptdev->base, "L2_PWRTRANS:     0x%016llx", gpu_read64(ptdev, PWR_L2_PWRTRANS));
> +	drm_info(&ptdev->base, "L2_READY:        0x%016llx", gpu_read64(ptdev, PWR_L2_READY));
> +	drm_info(&ptdev->base, "TILER_PRESENT:   0x%016llx", gpu_read64(ptdev, PWR_TILER_PRESENT));
> +	drm_info(&ptdev->base, "TILER_PWRTRANS:  0x%016llx", gpu_read64(ptdev, PWR_TILER_PWRTRANS));
> +	drm_info(&ptdev->base, "TILER_READY:     0x%016llx", gpu_read64(ptdev, PWR_TILER_READY));
> +	drm_info(&ptdev->base, "SHADER_PRESENT:  0x%016llx", gpu_read64(ptdev, PWR_SHADER_PRESENT));
> +	drm_info(&ptdev->base, "SHADER_PWRTRANS: 0x%016llx",
> +		 gpu_read64(ptdev, PWR_SHADER_PWRTRANS));
> +	drm_info(&ptdev->base, "SHADER_READY:    0x%016llx", gpu_read64(ptdev, PWR_SHADER_READY));

Minor comments:

 * Put SHADER_PWRTRANS on one line - wrapping that differently just
makes it harder to read.

 * Using the cached value for GPU_FEATURES is likely to lead to
confusion. You're not using the cached _PRESENT values. This is
debugging for when things have gone wrong, so if the FEATURES value has
changed (e.g. the bus to the GPU is misbehaving) that would be a good
thing to immediately see.

 * It might be worth a comment saying these are printed for debugging -
I was about to complain this was too verbose until I spotted that the
only call sites are when something has gone wrong.

> +}
> +
> +static int panthor_pwr_domain_transition(struct panthor_device *ptdev, u32 cmd, u32 domain,
> +					 u64 mask, u32 timeout_us)
> +{
> +	u32 ready_reg = get_domain_ready_reg(domain);
> +	u32 pwr_cmd = PWR_COMMAND_DEF(cmd, domain, get_domain_subdomain(ptdev, domain));
> +	u64 expected_val = cmd == PWR_COMMAND_POWER_DOWN ? 0 : mask;

Yuk. Can we have a readable 'if' instead please? ;)

> +	u64 val;
> +	int ret = 0;
> +
> +	if (!is_valid_domain(domain))
> +		return -EINVAL;

Do we ever expect this to happen? I'd suggest a WARN_ON() here as this
looks like a programming mistake if it happens.

> +
> +	if (cmd != PWR_COMMAND_POWER_DOWN && cmd != PWR_COMMAND_POWER_UP) {
> +		drm_err(&ptdev->base, "Invalid power domain transition command (0x%x)", cmd);
> +		return -EINVAL;
> +	}

Indeed combining with this 'if' we can have something like:

	switch (cmd) {
	case PWR_COMMAND_POWER_DOWN:
		expected_val = 0;
		break;
	case PWR_COMMAND_POWER_UP:
		expected_val = mask;
		break;
	default:
		drm_err(...);
		return -EINVAL;
	}

which IMHO is much easier to read.

> +
> +	ret = panthor_pwr_domain_wait_transition(ptdev, domain, timeout_us);
> +	if (ret)
> +		return ret;
> +
> +	/* domain already in target state, return early */
> +	if ((gpu_read64(ptdev, ready_reg) & mask) == expected_val)
> +		return 0;
> +
> +	panthor_pwr_write_command(ptdev, pwr_cmd, mask);
> +
> +	ret = gpu_read64_poll_timeout(ptdev, ready_reg, val, (mask & val) == expected_val, 100,
> +				      timeout_us);
> +	if (ret) {
> +		drm_err(&ptdev->base, "timeout waiting on %s power %s, cmd(0x%x), arg(0x%llx)",
> +			get_domain_name(domain), cmd == PWR_COMMAND_POWER_DOWN ? "down" : "up",

I'd avoid this sort of ternary expression. If someone updates this
function with a third action they're going to forget to update this. So
either drop the pretty "up/down" text, assign the direction string in a
switch above, or provide a helper function which decodes the command.

Or if you really want to stick with something like this then
str_down_up(cmd == PWR_COMMAND_POWER_DOWN) which at least helps the
linker with deduping.

> +			pwr_cmd, mask);
> +		panthor_pwr_info_show(ptdev);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +#define panthor_pwr_domain_power_off(__ptdev, __domain, __mask, __timeout_us)            \
> +	panthor_pwr_domain_transition(__ptdev, PWR_COMMAND_POWER_DOWN, __domain, __mask, \
> +				      __timeout_us)
> +
> +#define panthor_pwr_domain_power_on(__ptdev, __domain, __mask, __timeout_us) \
> +	panthor_pwr_domain_transition(__ptdev, PWR_COMMAND_POWER_UP, __domain, __mask, __timeout_us)
> +
> +/**
> + * retract_domain() - Retract control of a domain from MCU
> + * @ptdev: Device.
> + * @domain: Domain to retract the control
> + *
> + * Retracting L2 domain is not expected since it won't be delegated.
> + *
> + * Return: 0 on success or retracted already.
> + *         -EPERM if domain is L2.
> + *         A negative error code otherwise.
> + */
> +static int retract_domain(struct panthor_device *ptdev, u32 domain)
> +{
> +	const u32 pwr_cmd = PWR_COMMAND_DEF(PWR_COMMAND_RETRACT, domain, 0);
> +	const u32 pwr_status_reg = panthor_pwr_read_status(ptdev);
> +	const u32 delegated_mask = PWR_STATUS_DOMAIN_DELEGATED(domain);
> +	const u32 allow_mask = PWR_STATUS_DOMAIN_ALLOWED(domain);
> +	u64 val;
> +	int ret;
> +
> +	if (WARN_ON(domain == PWR_COMMAND_DOMAIN_L2))
> +		return -EINVAL;

The kerneldoc says -EPERM is the domain is L2.

> +
> +	if (WARN_ON(pwr_status_reg & PWR_STATUS_DOMAIN_DELEGATED(PWR_COMMAND_DOMAIN_L2)))
> +		return -EPERM;

But this is testing for the L2 being delegated? I'm not sure how this
could happen, but maybe this should be WARN_ON_ONCE() as it doesn't seem
like something that we're going to manage to resolve.

> +
> +	if (!(pwr_status_reg & delegated_mask)) {
> +		drm_dbg(&ptdev->base, "%s domain already retracted",
> +			get_domain_name(domain));
> +		return 0;
> +	}
> +
> +	ret = gpu_read64_poll_timeout(ptdev, PWR_STATUS, val,
> +				      !(PWR_STATUS_RETRACT_PENDING & val), 0,
> +				      PWR_RETRACT_TIMEOUT_US);
> +	if (ret) {
> +		drm_err(&ptdev->base, "%s domain retract pending",
> +			get_domain_name(domain));
> +		return ret;
> +	}
> +
> +	panthor_pwr_write_command(ptdev, pwr_cmd, 0);
> +
> +	/*
> +	 * On successful retraction
> +	 * allow-flag will be set with delegated-flag being cleared.
> +	 */
> +	ret = gpu_read64_poll_timeout(ptdev, PWR_STATUS, val,
> +				      ((delegated_mask | allow_mask) & val) == allow_mask,
> +				      10, PWR_TRANSITION_TIMEOUT_US);
> +	if (ret) {
> +		drm_err(&ptdev->base, "Retracting %s domain timeout, cmd(0x%x)",
> +			get_domain_name(domain), pwr_cmd);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * delegate_domain() - Delegate control of a domain to MCU
> + * @ptdev: Device.
> + * @domain: Domain to delegate the control
> + *
> + * Delegating L2 domain is prohibited.
> + *
> + * Return:
> + * *       0 on success or delegated already.
> + * *       -EPERM if domain is L2.
> + * *       A negative error code otherwise.
> + */
> +static int delegate_domain(struct panthor_device *ptdev, u32 domain)
> +{
> +	const u32 pwr_cmd = PWR_COMMAND_DEF(PWR_COMMAND_DELEGATE, domain, 0);
> +	const u32 pwr_status_reg = panthor_pwr_read_status(ptdev);
> +	const u32 pwrtrans_reg = get_domain_pwrtrans_reg(domain);
> +	const u32 allow_mask = PWR_STATUS_DOMAIN_ALLOWED(domain);
> +	const u32 delegated_mask = PWR_STATUS_DOMAIN_DELEGATED(domain);
> +	u64 val;
> +	int ret;
> +
> +	if (WARN_ON_ONCE(domain == PWR_COMMAND_DOMAIN_L2))
> +		return -EINVAL;

Why WARN_ON_ONCE? This is a programming error. Return code doesn't match
kerneldoc.

> +
> +	if (pwr_status_reg & delegated_mask) {
> +		drm_dbg(&ptdev->base, "%s domain already delegated",
> +			get_domain_name(domain));
> +		return 0;
> +	}
> +
> +	/* Check if the command is allowed before delegating. */
> +	if (unlikely(!(pwr_status_reg & allow_mask))) {
> +		drm_warn(&ptdev->base, "Delegating %s domain not allowed",
> +			 get_domain_name(domain));
> +		return -EPERM;
> +	}

We usually only use unlikely() on hot paths.

> +
> +	if (unlikely(gpu_read64(ptdev, pwrtrans_reg))) {
> +		drm_warn(&ptdev->base, "%s domain power in transition",
> +			 get_domain_name(domain));
> +		return -EPERM;

-EPERM seems wrong, -EBUSY perhaps?

> +	}
> +
> +	panthor_pwr_write_command(ptdev, pwr_cmd, 0);
> +
> +	/*
> +	 * On successful delegation
> +	 * allow-flag will be cleared with delegated-flag being set.
> +	 */
> +	ret = gpu_read64_poll_timeout(ptdev, PWR_STATUS, val,
> +				      ((delegated_mask | allow_mask) & val) == delegated_mask,
> +				      10, PWR_TRANSITION_TIMEOUT_US);
> +	if (ret) {
> +		drm_err(&ptdev->base, "Delegating %s domain timeout, cmd(0x%x)",
> +			get_domain_name(domain), pwr_cmd);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int panthor_pwr_delegate_domains(struct panthor_device *ptdev)
> +{
> +	int ret;
> +
> +	if (!ptdev->pwr)
> +		return 0;
> +
> +	ret = delegate_domain(ptdev, PWR_COMMAND_DOMAIN_SHADER);
> +	if (ret)
> +		return ret;
> +
> +	ret = delegate_domain(ptdev, PWR_COMMAND_DOMAIN_TILER);
> +	if (ret)
> +		return ret;

Given nothing actually handles these errors currently, do we have any
problems if the shader cores are delegated, but the tiler cores fail? Do
we need to unwind?

Generally the error handling seems a bit shaky here.

> +
> +	return 0;
> +}
> +
>  void panthor_pwr_unplug(struct panthor_device *ptdev)
>  {
>  	unsigned long flags;
> @@ -110,12 +414,94 @@ int panthor_pwr_reset_soft(struct panthor_device *ptdev)
>  
>  int panthor_pwr_l2_power_off(struct panthor_device *ptdev)
>  {
> -	return 0;
> +	const u32 l2_allow_mask = PWR_STATUS_DOMAIN_ALLOWED(PWR_COMMAND_DOMAIN_L2);
> +	const u32 l2_pwrtrans_reg = get_domain_pwrtrans_reg(PWR_COMMAND_DOMAIN_L2);
> +	unsigned long child_domain_mask = {
> +		BIT(PWR_COMMAND_DOMAIN_SHADER) |
> +		BIT(PWR_COMMAND_DOMAIN_TILER)
> +	};

What's with the braces?

> +	u32 pwr_status, child_domain;
> +	int ret = 0;
> +
> +	if (unlikely(!ptdev->pwr))
> +		return -ENODEV;
> +
> +	pwr_status = panthor_pwr_read_status(ptdev);
> +
> +	/* Abort if L2 power off constraints are not satisfied */
> +	if (!(pwr_status & l2_allow_mask)) {
> +		drm_warn(&ptdev->base, "Power off L2 domain not allowed");
> +		return 0;
> +	}
> +
> +	if (gpu_read64(ptdev, l2_pwrtrans_reg)) {
> +		drm_warn(&ptdev->base, "L2 Power in transition");
> +		return 0;

Isn't this an error? How are we handling this? Shouldn't we attempt to
wait for the transition to complete?

> +	}
> +
> +	/* It is expected that when halting the MCU, it would power down its
> +	 * delegated domains. However, an unresponsive or hung MCU may not do
> +	 * so, which is why we need to check and retract the domains back into
> +	 * host control to be powered down before powering down the L2.
> +	 */
> +	for_each_set_bit(child_domain, &child_domain_mask, PWR_DOMAIN_MAX_BITS) {

This feels overkill for two bits... Can we not just put this in a helper
function and call it for both domains?

> +		u64 domain_ready = gpu_read64(ptdev, get_domain_ready_reg(child_domain));
> +
> +		if (domain_ready && (pwr_status & PWR_STATUS_DOMAIN_DELEGATED(child_domain))) {
> +			drm_warn(&ptdev->base,
> +				 "L2 power off: Delegated %s domain not powered down by MCU",
> +				 get_domain_name(child_domain));
> +			ret = retract_domain(ptdev, child_domain);
> +			if (ret) {
> +				drm_err(&ptdev->base, "Failed to retract %s domain",
> +					get_domain_name(child_domain));
> +				panthor_pwr_info_show(ptdev);
> +				return ret;
> +			}
> +		}
> +
> +		ret = panthor_pwr_domain_power_off(ptdev, child_domain, domain_ready,
> +						   PWR_TRANSITION_TIMEOUT_US);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return panthor_pwr_domain_power_off(ptdev, PWR_COMMAND_DOMAIN_L2,
> +					    ptdev->gpu_info.l2_present,
> +					    PWR_TRANSITION_TIMEOUT_US);

Does this implicitly 'retract' the shader/tiler power domains? If so I
think it's worth a comment. Otherwise it looks like we don't actually
know the status of whether the shader/tiler power domains are retracted
or not.

Thanks,
Steve

>  }
>  
>  int panthor_pwr_l2_power_on(struct panthor_device *ptdev)
>  {
> -	return 0;
> +	const u32 pwr_status = panthor_pwr_read_status(ptdev);
> +	const u32 l2_allow_mask = PWR_STATUS_DOMAIN_ALLOWED(PWR_COMMAND_DOMAIN_L2);
> +	const u32 l2_pwrtrans_reg = get_domain_pwrtrans_reg(PWR_COMMAND_DOMAIN_L2);
> +	int ret;
> +
> +	if (!ptdev->pwr)
> +		return 0;
> +
> +	if ((pwr_status & l2_allow_mask) == 0) {
> +		drm_warn(&ptdev->base, "Power on L2 domain not allowed");
> +		return -EPERM;
> +	}
> +
> +	if (gpu_read64(ptdev, l2_pwrtrans_reg)) {
> +		drm_warn(&ptdev->base, "L2 Power is in transition");
> +		return -EINVAL;
> +	}
> +
> +	ret = panthor_pwr_domain_power_on(ptdev, PWR_COMMAND_DOMAIN_L2,
> +					  ptdev->gpu_info.l2_present,
> +					  PWR_TRANSITION_TIMEOUT_US);
> +	if (ret)
> +		return ret;
> +
> +	/* Delegate control of the shader and tiler power domains to the MCU as
> +	 * it can better manage which shader/tiler cores need to be powered up
> +	 * or can be powered down based on currently running jobs.
> +	 */
> +	return panthor_pwr_delegate_domains(ptdev);
>  }
>  
>  void panthor_pwr_suspend(struct panthor_device *ptdev)

