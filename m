Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B71C3F626
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 11:18:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEF3410EA60;
	Fri,  7 Nov 2025 10:18:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id E18DA10EA60
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 10:18:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE1961515;
 Fri,  7 Nov 2025 02:18:42 -0800 (PST)
Received: from [10.57.72.216] (unknown [10.57.72.216])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DF9453F66E;
 Fri,  7 Nov 2025 02:18:47 -0800 (PST)
Message-ID: <e4484277-d362-4b47-900c-a77d1f2c29a9@arm.com>
Date: Fri, 7 Nov 2025 10:18:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] drm/panthor: Implement L2 power on/off via
 PWR_CONTROL
To: Karunika Choo <karunika.choo@arm.com>, dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <20251027161334.854650-1-karunika.choo@arm.com>
 <20251027161334.854650-5-karunika.choo@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251027161334.854650-5-karunika.choo@arm.com>
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

On 27/10/2025 16:13, Karunika Choo wrote:
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

One NIT below, but otherwise,

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
> v2:
>  * Updated GENMASK to GENMASK_U64 to address kernel test robot warnings
>    for 32-bit systems.
>  * Removed panthor_pwr_read_status() in favour of a simple gpu_read64()
>    operation on the PWR_STATUS register.
>  * Renamed panthor_pwr_info_show() to panthor_pwr_debug_info_show() for
>    more clarity.
>  * Added additional WARN_ON for an invalid domain when requesting power
>    domain transition.
>  * Made panthor_pwr_domain_transition()'s expected val logic more
>    readable and clearer.
>  * Wait on domain power transition instead of failing the operation.
>  * Fixed inconsistent error return value vs kerneldoc.
>  * Removed confusing drm_dbg in delegate_domain() in favor of a comment.
>  * Add unwind to panthor_pwr_delegate_domains().
>  * Moved child domain handling logic from panthor_pwr_l2_power_off()
>    into panthor_pwr_domain_force_off().
>  * Added additional clarification regarding delegation and retraction of
>    power domains.
>  * Minor formatting and readability changes and remove unnecessary
>    checks.
> ---
>  drivers/gpu/drm/panthor/panthor_pwr.c  | 378 +++++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_pwr.h  |   4 +
>  drivers/gpu/drm/panthor/panthor_regs.h |   1 +
>  3 files changed, 383 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_pwr.c b/drivers/gpu/drm/panthor/panthor_pwr.c
> index da64fe006a8b..cd529660a276 100644
> --- a/drivers/gpu/drm/panthor/panthor_pwr.c
> +++ b/drivers/gpu/drm/panthor/panthor_pwr.c
> @@ -23,6 +23,14 @@
>  	 PWR_IRQ_COMMAND_NOT_ALLOWED | \
>  	 PWR_IRQ_COMMAND_INVALID)
> 
> +#define PWR_ALL_CORES_MASK		GENMASK_U64(63, 0)
> +
> +#define PWR_DOMAIN_MAX_BITS		16
> +
> +#define PWR_TRANSITION_TIMEOUT_US	(2ULL * USEC_PER_SEC)
> +
> +#define PWR_RETRACT_TIMEOUT_US		(2ULL * USEC_PER_MSEC)
> +
>  /**
>   * struct panthor_pwr - PWR_CONTROL block management data.
>   */
> @@ -59,6 +67,323 @@ static void panthor_pwr_irq_handler(struct panthor_device *ptdev, u32 status)
>  }
>  PANTHOR_IRQ_HANDLER(pwr, PWR, panthor_pwr_irq_handler);
> 
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
> +}
> +
> +static u8 get_domain_subdomain(struct panthor_device *ptdev, u32 domain)
> +{
> +	if ((domain == PWR_COMMAND_DOMAIN_SHADER) && has_rtu(ptdev))

NIT: Extra brackets

Thanks,
Steve

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
> +	ret = gpu_read64_poll_timeout(ptdev, pwrtrans_reg, val, !(PWR_ALL_CORES_MASK & val), 100,
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
> +static void panthor_pwr_debug_info_show(struct panthor_device *ptdev)
> +{
> +	drm_info(&ptdev->base, "GPU_FEATURES:    0x%016llx", gpu_read64(ptdev, GPU_FEATURES));
> +	drm_info(&ptdev->base, "PWR_STATUS:      0x%016llx", gpu_read64(ptdev, PWR_STATUS));
> +	drm_info(&ptdev->base, "L2_PRESENT:      0x%016llx", gpu_read64(ptdev, PWR_L2_PRESENT));
> +	drm_info(&ptdev->base, "L2_PWRTRANS:     0x%016llx", gpu_read64(ptdev, PWR_L2_PWRTRANS));
> +	drm_info(&ptdev->base, "L2_READY:        0x%016llx", gpu_read64(ptdev, PWR_L2_READY));
> +	drm_info(&ptdev->base, "TILER_PRESENT:   0x%016llx", gpu_read64(ptdev, PWR_TILER_PRESENT));
> +	drm_info(&ptdev->base, "TILER_PWRTRANS:  0x%016llx", gpu_read64(ptdev, PWR_TILER_PWRTRANS));
> +	drm_info(&ptdev->base, "TILER_READY:     0x%016llx", gpu_read64(ptdev, PWR_TILER_READY));
> +	drm_info(&ptdev->base, "SHADER_PRESENT:  0x%016llx", gpu_read64(ptdev, PWR_SHADER_PRESENT));
> +	drm_info(&ptdev->base, "SHADER_PWRTRANS: 0x%016llx", gpu_read64(ptdev, PWR_SHADER_PWRTRANS));
> +	drm_info(&ptdev->base, "SHADER_READY:    0x%016llx", gpu_read64(ptdev, PWR_SHADER_READY));
> +}
> +
> +static int panthor_pwr_domain_transition(struct panthor_device *ptdev, u32 cmd, u32 domain,
> +					 u64 mask, u32 timeout_us)
> +{
> +	u32 ready_reg = get_domain_ready_reg(domain);
> +	u32 pwr_cmd = PWR_COMMAND_DEF(cmd, domain, get_domain_subdomain(ptdev, domain));
> +	u64 expected_val = 0;
> +	u64 val;
> +	int ret = 0;
> +
> +	if (drm_WARN_ON(&ptdev->base, !is_valid_domain(domain)))
> +		return -EINVAL;
> +
> +	switch (cmd) {
> +	case PWR_COMMAND_POWER_DOWN:
> +		expected_val = 0;
> +		break;
> +	case PWR_COMMAND_POWER_UP:
> +		expected_val = mask;
> +		break;
> +	default:
> +		drm_err(&ptdev->base, "Invalid power domain transition command (0x%x)", cmd);
> +		return -EINVAL;
> +	}
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
> +		drm_err(&ptdev->base,
> +			"timeout waiting on %s power domain transition, cmd(0x%x), arg(0x%llx)",
> +			get_domain_name(domain), pwr_cmd, mask);
> +		panthor_pwr_debug_info_show(ptdev);
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
> +	const u64 pwr_status = gpu_read64(ptdev, PWR_STATUS);
> +	const u64 delegated_mask = PWR_STATUS_DOMAIN_DELEGATED(domain);
> +	const u64 allow_mask = PWR_STATUS_DOMAIN_ALLOWED(domain);
> +	u64 val;
> +	int ret;
> +
> +	if (drm_WARN_ON(&ptdev->base, domain == PWR_COMMAND_DOMAIN_L2))
> +		return -EPERM;
> +
> +	ret = gpu_read64_poll_timeout(ptdev, PWR_STATUS, val, !(PWR_STATUS_RETRACT_PENDING & val),
> +				      0, PWR_RETRACT_TIMEOUT_US);
> +	if (ret) {
> +		drm_err(&ptdev->base, "%s domain retract pending", get_domain_name(domain));
> +		return ret;
> +	}
> +
> +	if (!(pwr_status & delegated_mask)) {
> +		drm_dbg(&ptdev->base, "%s domain already retracted", get_domain_name(domain));
> +		return 0;
> +	}
> +
> +	panthor_pwr_write_command(ptdev, pwr_cmd, 0);
> +
> +	/*
> +	 * On successful retraction
> +	 * allow-flag will be set with delegated-flag being cleared.
> +	 */
> +	ret = gpu_read64_poll_timeout(ptdev, PWR_STATUS, val,
> +				      ((delegated_mask | allow_mask) & val) == allow_mask, 10,
> +				      PWR_TRANSITION_TIMEOUT_US);
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
> +	const u64 pwr_status = gpu_read64(ptdev, PWR_STATUS);
> +	const u64 allow_mask = PWR_STATUS_DOMAIN_ALLOWED(domain);
> +	const u64 delegated_mask = PWR_STATUS_DOMAIN_DELEGATED(domain);
> +	u64 val;
> +	int ret;
> +
> +	if (drm_WARN_ON(&ptdev->base, domain == PWR_COMMAND_DOMAIN_L2))
> +		return -EPERM;
> +
> +	/* Already delegated, exit early */
> +	if (pwr_status & delegated_mask)
> +		return 0;
> +
> +	/* Check if the command is allowed before delegating. */
> +	if (!(pwr_status & allow_mask)) {
> +		drm_warn(&ptdev->base, "Delegating %s domain not allowed", get_domain_name(domain));
> +		return -EPERM;
> +	}
> +
> +	ret = panthor_pwr_domain_wait_transition(ptdev, domain, PWR_TRANSITION_TIMEOUT_US);
> +	if (ret)
> +		return ret;
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
> +		goto err_retract_shader;
> +
> +	return 0;
> +
> +err_retract_shader:
> +	retract_domain(ptdev, PWR_COMMAND_DOMAIN_SHADER);
> +
> +	return ret;
> +}
> +
> +/**
> + * panthor_pwr_domain_force_off - Forcefully power down a domain.
> + * @ptdev: Device.
> + * @domain: Domain to forcefully power down.
> + *
> + * This function will attempt to retract and power off the requested power
> + * domain. However, if retraction fails, the operation is aborted. If power off
> + * fails, the domain will remain retracted and under the host control.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +static int panthor_pwr_domain_force_off(struct panthor_device *ptdev, u32 domain)
> +{
> +	const u64 domain_ready = gpu_read64(ptdev, get_domain_ready_reg(domain));
> +	int ret;
> +
> +	/* Domain already powered down, early exit. */
> +	if (!domain_ready)
> +		return 0;
> +
> +	/* Domain has to be in host control to issue power off command. */
> +	ret = retract_domain(ptdev, domain);
> +	if (ret)
> +		return ret;
> +
> +	return panthor_pwr_domain_power_off(ptdev, domain, domain_ready, PWR_TRANSITION_TIMEOUT_US);
> +}
> +
>  void panthor_pwr_unplug(struct panthor_device *ptdev)
>  {
>  	unsigned long flags;
> @@ -103,6 +428,59 @@ int panthor_pwr_init(struct panthor_device *ptdev)
>  	return 0;
>  }
> 
> +void panthor_pwr_l2_power_off(struct panthor_device *ptdev)
> +{
> +	const u64 l2_allow_mask = PWR_STATUS_DOMAIN_ALLOWED(PWR_COMMAND_DOMAIN_L2);
> +	const u64 pwr_status = gpu_read64(ptdev, PWR_STATUS);
> +
> +	/* Abort if L2 power off constraints are not satisfied */
> +	if (!(pwr_status & l2_allow_mask)) {
> +		drm_warn(&ptdev->base, "Power off L2 domain not allowed");
> +		return;
> +	}
> +
> +	/* It is expected that when halting the MCU, it would power down its
> +	 * delegated domains. However, an unresponsive or hung MCU may not do
> +	 * so, which is why we need to check and retract the domains back into
> +	 * host control to be powered down in the right order before powering
> +	 * down the L2.
> +	 */
> +	if (panthor_pwr_domain_force_off(ptdev, PWR_COMMAND_DOMAIN_TILER))
> +		return;
> +
> +	if (panthor_pwr_domain_force_off(ptdev, PWR_COMMAND_DOMAIN_SHADER))
> +		return;
> +
> +	panthor_pwr_domain_power_off(ptdev, PWR_COMMAND_DOMAIN_L2, ptdev->gpu_info.l2_present,
> +				     PWR_TRANSITION_TIMEOUT_US);
> +}
> +
> +int panthor_pwr_l2_power_on(struct panthor_device *ptdev)
> +{
> +	const u32 pwr_status = gpu_read64(ptdev, PWR_STATUS);
> +	const u32 l2_allow_mask = PWR_STATUS_DOMAIN_ALLOWED(PWR_COMMAND_DOMAIN_L2);
> +	int ret;
> +
> +	if ((pwr_status & l2_allow_mask) == 0) {
> +		drm_warn(&ptdev->base, "Power on L2 domain not allowed");
> +		return -EPERM;
> +	}
> +
> +	ret = panthor_pwr_domain_power_on(ptdev, PWR_COMMAND_DOMAIN_L2, ptdev->gpu_info.l2_present,
> +					  PWR_TRANSITION_TIMEOUT_US);
> +	if (ret)
> +		return ret;
> +
> +	/* Delegate control of the shader and tiler power domains to the MCU as
> +	 * it can better manage which shader/tiler cores need to be powered up
> +	 * or can be powered down based on currently running jobs.
> +	 *
> +	 * If the shader and tiler domains are already delegated to the MCU,
> +	 * this call would just return early.
> +	 */
> +	return panthor_pwr_delegate_domains(ptdev);
> +}
> +
>  void panthor_pwr_suspend(struct panthor_device *ptdev)
>  {
>  	if (!ptdev->pwr)
> diff --git a/drivers/gpu/drm/panthor/panthor_pwr.h b/drivers/gpu/drm/panthor/panthor_pwr.h
> index b325e5b7eba3..3c834059a860 100644
> --- a/drivers/gpu/drm/panthor/panthor_pwr.h
> +++ b/drivers/gpu/drm/panthor/panthor_pwr.h
> @@ -10,6 +10,10 @@ void panthor_pwr_unplug(struct panthor_device *ptdev);
> 
>  int panthor_pwr_init(struct panthor_device *ptdev);
> 
> +void panthor_pwr_l2_power_off(struct panthor_device *ptdev);
> +
> +int panthor_pwr_l2_power_on(struct panthor_device *ptdev);
> +
>  void panthor_pwr_suspend(struct panthor_device *ptdev);
> 
>  void panthor_pwr_resume(struct panthor_device *ptdev);
> diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
> index 5469eec02178..18702d7001e2 100644
> --- a/drivers/gpu/drm/panthor/panthor_regs.h
> +++ b/drivers/gpu/drm/panthor/panthor_regs.h
> @@ -72,6 +72,7 @@
> 
>  #define GPU_FEATURES					0x60
>  #define   GPU_FEATURES_RAY_INTERSECTION			BIT(2)
> +#define   GPU_FEATURES_RAY_TRAVERSAL			BIT(5)
> 
>  #define GPU_TIMESTAMP_OFFSET				0x88
>  #define GPU_CYCLE_COUNT					0x90
> --
> 2.49.0
> 

