Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEB9C0C700
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 09:50:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3195A10E3C8;
	Mon, 27 Oct 2025 08:50:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=erik.faye-lund@collabora.com header.b="kS2O+6IE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 954A410E3C8
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 08:50:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1761555008; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=VvqASYriyXeZcqKMMJ7V/Qgq2FEip03qQi0CvyYmE9MEjHS5cfp6TScYedT8KjE0z+GY5O231DmDVsK/vXN6lkqk1GZ2NF7KiwQfmiSQbKSxz/uREj9yTmjBKXGyFOe9ylTl/meNthMweIe6+74fPIJXtXIrNQmzfpxLg+KxPW4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1761555008;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=JIowyNHMdDhVK/3NnczVgQntH0ERfxLdGqqxIX6HlEQ=; 
 b=fgsKJf80LUtk+QIsmjpAUwaMBGBtOlUQLfYqJsqaRhev+TNrrhW9nKAE7j2yzC84Y6jbueC7gr3lnRVQaNldGqNIiZ9tsOXNgSFnlj6hkGjKG0K3+5uZij1y+pbchTHPU5qUszRQaQTUG1YOvcxAldP07gLDuX1rcgUgJguJG0E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=erik.faye-lund@collabora.com;
 dmarc=pass header.from=<erik.faye-lund@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761555008; 
 s=zohomail; d=collabora.com; i=erik.faye-lund@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=JIowyNHMdDhVK/3NnczVgQntH0ERfxLdGqqxIX6HlEQ=;
 b=kS2O+6IElaTFmNfcOmJriICCP2BYj+0br+o1UMM8q4j8/UIt8/SXlWtl6JkVU0dp
 l8NJpegjwLxln07y7bjdJZ7DdgbSZJSvkh+/rI+v5OjgW/sibAgxK1rjQ/uhoz6VYTw
 naVWMkZs9/mUCjywfd4jMwmO/we68/pAoO5AdBIE=
Received: by mx.zohomail.com with SMTPS id 1761555004914101.78322787146067;
 Mon, 27 Oct 2025 01:50:04 -0700 (PDT)
Message-ID: <e4134813f828a33a06f720f9162d3c11c181f44b.camel@collabora.com>
Subject: Re: [PATCH v2 4/8] drm/panthor: Implement L2 power on/off via
 PWR_CONTROL
From: Erik Faye-Lund <erik.faye-lund@collabora.com>
To: Karunika Choo <karunika.choo@arm.com>, dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>, Steven
 Price	 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten
 Lankhorst	 <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 linux-kernel@vger.kernel.org
Date: Mon, 27 Oct 2025 09:50:00 +0100
In-Reply-To: <20251024202117.3241292-5-karunika.choo@arm.com>
References: <20251024202117.3241292-1-karunika.choo@arm.com>
 <20251024202117.3241292-5-karunika.choo@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.0 (by Flathub.org) 
MIME-Version: 1.0
X-ZohoMailClient: External
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

On Fri, 2025-10-24 at 21:21 +0100, Karunika Choo wrote:
> This patch adds common helpers to issue power commands, poll
> transitions, and validate domain state, then wires them into the L2
> on/off paths.
>=20
> The L2 power-on sequence now delegates control of the SHADER and
> TILER
> domains to the MCU when allowed, while the L2 itself is never
> delegated.
> On power-off, dependent domains beneath the L2 are checked, and if
> necessary, retracted and powered down to maintain proper domain
> ordering.
>=20
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
> ---
> v2:
> =C2=A0* Updated GENMASK to GENMASK_U64 to address kernel test robot
> warnings
> =C2=A0=C2=A0 for 32-bit systems.
> =C2=A0* Removed panthor_pwr_read_status() in favour of a simple
> gpu_read64()
> =C2=A0=C2=A0 operation on the PWR_STATUS register.
> =C2=A0* Renamed panthor_pwr_info_show() to panthor_pwr_debug_info_show()
> for
> =C2=A0=C2=A0 more clarity.
> =C2=A0* Added additional WARN_ON for an invalid domain when requesting
> power
> =C2=A0=C2=A0 domain transition.
> =C2=A0* Made panthor_pwr_domain_transition()'s expected val logic more
> =C2=A0=C2=A0 readable and clearer.
> =C2=A0* Wait on domain power transition instead of failing the operation.
> =C2=A0* Fixed inconsistent error return value vs kerneldoc.
> =C2=A0* Removed confusing drm_dbg in delegate_domain() in favor of a
> comment.
> =C2=A0* Add unwind to panthor_pwr_delegate_domains().
> =C2=A0* Moved child domain handling logic from panthor_pwr_l2_power_off()
> =C2=A0=C2=A0 into panthor_pwr_domain_force_off().
> =C2=A0* Added additional clarification regarding delegation and retractio=
n
> of
> =C2=A0=C2=A0 power domains.
> =C2=A0* Minor formatting and readability changes and remove unnecessary
> =C2=A0=C2=A0 checks.
> ---
> =C2=A0drivers/gpu/drm/panthor/panthor_pwr.c=C2=A0 | 378
> +++++++++++++++++++++++++
> =C2=A0drivers/gpu/drm/panthor/panthor_pwr.h=C2=A0 |=C2=A0=C2=A0 4 +
> =C2=A0drivers/gpu/drm/panthor/panthor_regs.h |=C2=A0=C2=A0 1 +
> =C2=A03 files changed, 383 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/panthor/panthor_pwr.c
> b/drivers/gpu/drm/panthor/panthor_pwr.c
> index da64fe006a8b..cd529660a276 100644
> --- a/drivers/gpu/drm/panthor/panthor_pwr.c
> +++ b/drivers/gpu/drm/panthor/panthor_pwr.c
> @@ -23,6 +23,14 @@
> =C2=A0	 PWR_IRQ_COMMAND_NOT_ALLOWED | \
> =C2=A0	 PWR_IRQ_COMMAND_INVALID)
>=20
> +#define PWR_ALL_CORES_MASK		GENMASK_U64(63, 0)
> +
> +#define PWR_DOMAIN_MAX_BITS		16
> +
> +#define PWR_TRANSITION_TIMEOUT_US	(2ULL * USEC_PER_SEC)
> +
> +#define PWR_RETRACT_TIMEOUT_US		(2ULL * USEC_PER_MSEC)
> +
> =C2=A0/**
> =C2=A0 * struct panthor_pwr - PWR_CONTROL block management data.
> =C2=A0 */
> @@ -59,6 +67,323 @@ static void panthor_pwr_irq_handler(struct
> panthor_device *ptdev, u32 status)
> =C2=A0}
> =C2=A0PANTHOR_IRQ_HANDLER(pwr, PWR, panthor_pwr_irq_handler);
>=20
> +static void panthor_pwr_write_command(struct panthor_device *ptdev,
> u32 command, u64 args)
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
> +	return get_domain_base(domain) + (PWR_L2_READY -
> PWR_L2_PRESENT);
> +}
> +
> +static u32 get_domain_pwrtrans_reg(u32 domain)
> +{
> +	return get_domain_base(domain) + (PWR_L2_PWRTRANS -
> PWR_L2_PRESENT);
> +}
> +
> +static bool is_valid_domain(u32 domain)
> +{
> +	return get_domain_base(domain) !=3D 0;
> +}
> +
> +static bool has_rtu(struct panthor_device *ptdev)
> +{
> +	return ptdev->gpu_info.gpu_features &
> GPU_FEATURES_RAY_TRAVERSAL;
> +}
> +
> +static u8 get_domain_subdomain(struct panthor_device *ptdev, u32
> domain)
> +{
> +	if ((domain =3D=3D PWR_COMMAND_DOMAIN_SHADER) && has_rtu(ptdev))
> +		return PWR_COMMAND_SUBDOMAIN_RTU;
> +
> +	return 0;
> +}
> +
> +static int panthor_pwr_domain_wait_transition(struct panthor_device
> *ptdev, u32 domain,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 timeout_us)
> +{
> +	u32 pwrtrans_reg =3D get_domain_pwrtrans_reg(domain);
> +	u64 val;
> +	int ret =3D 0;
> +
> +	ret =3D gpu_read64_poll_timeout(ptdev, pwrtrans_reg, val,
> !(PWR_ALL_CORES_MASK & val), 100,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 timeout_us);
> +	if (ret) {
> +		drm_err(&ptdev->base, "%s domain power in
> transition, pwrtrans(0x%llx)",
> +			get_domain_name(domain), val);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void panthor_pwr_debug_info_show(struct panthor_device
> *ptdev)
> +{
> +	drm_info(&ptdev->base, "GPU_FEATURES:=C2=A0=C2=A0=C2=A0 0x%016llx",
> gpu_read64(ptdev, GPU_FEATURES));
> +	drm_info(&ptdev->base, "PWR_STATUS:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x%01=
6llx",
> gpu_read64(ptdev, PWR_STATUS));
> +	drm_info(&ptdev->base, "L2_PRESENT:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x%01=
6llx",
> gpu_read64(ptdev, PWR_L2_PRESENT));
> +	drm_info(&ptdev->base, "L2_PWRTRANS:=C2=A0=C2=A0=C2=A0=C2=A0 0x%016llx"=
,
> gpu_read64(ptdev, PWR_L2_PWRTRANS));
> +	drm_info(&ptdev->base, "L2_READY:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0x%016llx",
> gpu_read64(ptdev, PWR_L2_READY));
> +	drm_info(&ptdev->base, "TILER_PRESENT:=C2=A0=C2=A0 0x%016llx",
> gpu_read64(ptdev, PWR_TILER_PRESENT));
> +	drm_info(&ptdev->base, "TILER_PWRTRANS:=C2=A0 0x%016llx",
> gpu_read64(ptdev, PWR_TILER_PWRTRANS));
> +	drm_info(&ptdev->base, "TILER_READY:=C2=A0=C2=A0=C2=A0=C2=A0 0x%016llx"=
,
> gpu_read64(ptdev, PWR_TILER_READY));
> +	drm_info(&ptdev->base, "SHADER_PRESENT:=C2=A0 0x%016llx",
> gpu_read64(ptdev, PWR_SHADER_PRESENT));
> +	drm_info(&ptdev->base, "SHADER_PWRTRANS: 0x%016llx",
> gpu_read64(ptdev, PWR_SHADER_PWRTRANS));
> +	drm_info(&ptdev->base, "SHADER_READY:=C2=A0=C2=A0=C2=A0 0x%016llx",
> gpu_read64(ptdev, PWR_SHADER_READY));
> +}
> +
> +static int panthor_pwr_domain_transition(struct panthor_device
> *ptdev, u32 cmd, u32 domain,
> +					 u64 mask, u32 timeout_us)
> +{
> +	u32 ready_reg =3D get_domain_ready_reg(domain);
> +	u32 pwr_cmd =3D PWR_COMMAND_DEF(cmd, domain,
> get_domain_subdomain(ptdev, domain));
> +	u64 expected_val =3D 0;
> +	u64 val;
> +	int ret =3D 0;
> +
> +	if (drm_WARN_ON(&ptdev->base, !is_valid_domain(domain)))
> +		return -EINVAL;
> +
> +	switch (cmd) {
> +	case PWR_COMMAND_POWER_DOWN:
> +		expected_val =3D 0;
> +		break;
> +	case PWR_COMMAND_POWER_UP:
> +		expected_val =3D mask;
> +		break;
> +	default:
> +		drm_err(&ptdev->base, "Invalid power domain
> transition command (0x%x)", cmd);
> +		return -EINVAL;
> +	}
> +
> +	ret =3D panthor_pwr_domain_wait_transition(ptdev, domain,
> timeout_us);
> +	if (ret)
> +		return ret;
> +
> +	/* domain already in target state, return early */
> +	if ((gpu_read64(ptdev, ready_reg) & mask) =3D=3D expected_val)
> +		return 0;
> +
> +	panthor_pwr_write_command(ptdev, pwr_cmd, mask);
> +
> +	ret =3D gpu_read64_poll_timeout(ptdev, ready_reg, val, (mask &
> val) =3D=3D expected_val, 100,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 timeout_us);
> +	if (ret) {
> +		drm_err(&ptdev->base,
> +			"timeout waiting on %s power domain
> transition, cmd(0x%x), arg(0x%llx)",
> +			get_domain_name(domain), pwr_cmd, mask);
> +		panthor_pwr_debug_info_show(ptdev);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +#define panthor_pwr_domain_power_off(__ptdev, __domain, __mask,
> __timeout_us)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 \
> +	panthor_pwr_domain_transition(__ptdev,
> PWR_COMMAND_POWER_DOWN, __domain, __mask, \
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __timeout_us)
> +
> +#define panthor_pwr_domain_power_on(__ptdev, __domain, __mask,
> __timeout_us) \
> +	panthor_pwr_domain_transition(__ptdev, PWR_COMMAND_POWER_UP,
> __domain, __mask, __timeout_us)
> +
> +/**
> + * retract_domain() - Retract control of a domain from MCU
> + * @ptdev: Device.
> + * @domain: Domain to retract the control
> + *
> + * Retracting L2 domain is not expected since it won't be delegated.
> + *
> + * Return: 0 on success or retracted already.
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -EPERM if domain is L=
2.
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 A negative error code=
 otherwise.
> + */
> +static int retract_domain(struct panthor_device *ptdev, u32 domain)
> +{
> +	const u32 pwr_cmd =3D PWR_COMMAND_DEF(PWR_COMMAND_RETRACT,
> domain, 0);
> +	const u64 pwr_status =3D gpu_read64(ptdev, PWR_STATUS);
> +	const u64 delegated_mask =3D
> PWR_STATUS_DOMAIN_DELEGATED(domain);
> +	const u64 allow_mask =3D PWR_STATUS_DOMAIN_ALLOWED(domain);
> +	u64 val;
> +	int ret;
> +
> +	if (drm_WARN_ON(&ptdev->base, domain =3D=3D
> PWR_COMMAND_DOMAIN_L2))
> +		return -EPERM;
> +
> +	ret =3D gpu_read64_poll_timeout(ptdev, PWR_STATUS, val,
> !(PWR_STATUS_RETRACT_PENDING & val),
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0, PWR_RETRACT_TIMEOUT_US);
> +	if (ret) {
> +		drm_err(&ptdev->base, "%s domain retract pending",
> get_domain_name(domain));
> +		return ret;
> +	}
> +
> +	if (!(pwr_status & delegated_mask)) {
> +		drm_dbg(&ptdev->base, "%s domain already retracted",
> get_domain_name(domain));
> +		return 0;
> +	}
> +
> +	panthor_pwr_write_command(ptdev, pwr_cmd, 0);
> +
> +	/*
> +	 * On successful retraction
> +	 * allow-flag will be set with delegated-flag being cleared.
> +	 */
> +	ret =3D gpu_read64_poll_timeout(ptdev, PWR_STATUS, val,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((delegated_mask | allow_mask)
> & val) =3D=3D allow_mask, 10,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PWR_TRANSITION_TIMEOUT_US);
> +	if (ret) {
> +		drm_err(&ptdev->base, "Retracting %s domain timeout,
> cmd(0x%x)",
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
> + * *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 on success or delegated alrea=
dy.
> + * *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -EPERM if domain is L2.
> + * *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 A negative error code otherwise=
.
> + */
> +static int delegate_domain(struct panthor_device *ptdev, u32 domain)
> +{
> +	const u32 pwr_cmd =3D PWR_COMMAND_DEF(PWR_COMMAND_DELEGATE,
> domain, 0);
> +	const u64 pwr_status =3D gpu_read64(ptdev, PWR_STATUS);
> +	const u64 allow_mask =3D PWR_STATUS_DOMAIN_ALLOWED(domain);
> +	const u64 delegated_mask =3D
> PWR_STATUS_DOMAIN_DELEGATED(domain);
> +	u64 val;
> +	int ret;
> +
> +	if (drm_WARN_ON(&ptdev->base, domain =3D=3D
> PWR_COMMAND_DOMAIN_L2))
> +		return -EPERM;
> +
> +	/* Already delegated, exit early */
> +	if (pwr_status & delegated_mask)
> +		return 0;
> +
> +	/* Check if the command is allowed before delegating. */
> +	if (!(pwr_status & allow_mask)) {
> +		drm_warn(&ptdev->base, "Delegating %s domain not
> allowed", get_domain_name(domain));
> +		return -EPERM;
> +	}
> +
> +	ret =3D panthor_pwr_domain_wait_transition(ptdev, domain,
> PWR_TRANSITION_TIMEOUT_US);
> +	if (ret)
> +		return ret;
> +
> +	panthor_pwr_write_command(ptdev, pwr_cmd, 0);
> +
> +	/*
> +	 * On successful delegation
> +	 * allow-flag will be cleared with delegated-flag being set.
> +	 */
> +	ret =3D gpu_read64_poll_timeout(ptdev, PWR_STATUS, val,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((delegated_mask | allow_mask)
> & val) =3D=3D delegated_mask,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10,
> PWR_TRANSITION_TIMEOUT_US);
> +	if (ret) {
> +		drm_err(&ptdev->base, "Delegating %s domain timeout,
> cmd(0x%x)",
> +			get_domain_name(domain), pwr_cmd);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int panthor_pwr_delegate_domains(struct panthor_device
> *ptdev)
> +{
> +	int ret;
> +
> +	if (!ptdev->pwr)
> +		return 0;
> +
> +	ret =3D delegate_domain(ptdev, PWR_COMMAND_DOMAIN_SHADER);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D delegate_domain(ptdev, PWR_COMMAND_DOMAIN_TILER);
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
> + * This function will attempt to retract and power off the requested
> power
> + * domain. However, if retraction fails, the operation is aborted.
> If power off
> + * fails, the domain will remain retracted and under the host
> control.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +static int panthor_pwr_domain_force_off(struct panthor_device
> *ptdev, u32 domain)
> +{
> +	const u64 domain_ready =3D gpu_read64(ptdev,
> get_domain_ready_reg(domain));
> +	int ret;
> +
> +	/* Domain already powered down, early exit. */
> +	if (!domain_ready)
> +		return 0;
> +
> +	/* Domain has to be in host control to issue power off
> command. */
> +	ret =3D retract_domain(ptdev, domain);
> +	if (ret)
> +		return ret;
> +
> +	return panthor_pwr_domain_power_off(ptdev, domain,
> domain_ready, PWR_TRANSITION_TIMEOUT_US);
> +}
> +
> =C2=A0void panthor_pwr_unplug(struct panthor_device *ptdev)
> =C2=A0{
> =C2=A0	unsigned long flags;
> @@ -103,6 +428,59 @@ int panthor_pwr_init(struct panthor_device
> *ptdev)
> =C2=A0	return 0;
> =C2=A0}
>=20
> +void panthor_pwr_l2_power_off(struct panthor_device *ptdev)
> +{
> +	const u64 l2_allow_mask =3D
> PWR_STATUS_DOMAIN_ALLOWED(PWR_COMMAND_DOMAIN_L2);
> +	const u64 pwr_status =3D gpu_read64(ptdev, PWR_STATUS);
> +
> +	/* Abort if L2 power off constraints are not satisfied */
> +	if (!(pwr_status & l2_allow_mask)) {
> +		drm_warn(&ptdev->base, "Power off L2 domain not
> allowed");
> +		return;
> +	}
> +
> +	/* It is expected that when halting the MCU, it would power
> down its
> +	 * delegated domains. However, an unresponsive or hung MCU
> may not do
> +	 * so, which is why we need to check and retract the domains
> back into
> +	 * host control to be powered down in the right order before
> powering
> +	 * down the L2.
> +	 */
> +	if (panthor_pwr_domain_force_off(ptdev,
> PWR_COMMAND_DOMAIN_TILER))
> +		return;
> +
> +	if (panthor_pwr_domain_force_off(ptdev,
> PWR_COMMAND_DOMAIN_SHADER))
> +		return;
> +
> +	panthor_pwr_domain_power_off(ptdev, PWR_COMMAND_DOMAIN_L2,
> ptdev->gpu_info.l2_present,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 PWR_TRANSITION_TIMEOUT_US);
> +}
> +
> +int panthor_pwr_l2_power_on(struct panthor_device *ptdev)
> +{
> +	const u32 pwr_status =3D gpu_read64(ptdev, PWR_STATUS);
> +	const u32 l2_allow_mask =3D
> PWR_STATUS_DOMAIN_ALLOWED(PWR_COMMAND_DOMAIN_L2);
> +	int ret;
> +
> +	if ((pwr_status & l2_allow_mask) =3D=3D 0) {
> +		drm_warn(&ptdev->base, "Power on L2 domain not
> allowed");
> +		return -EPERM;
> +	}
> +
> +	ret =3D panthor_pwr_domain_power_on(ptdev,
> PWR_COMMAND_DOMAIN_L2, ptdev->gpu_info.l2_present,
> +					=C2=A0
> PWR_TRANSITION_TIMEOUT_US);
> +	if (ret)
> +		return ret;
> +
> +	/* Delegate control of the shader and tiler power domains to
> the MCU as
> +	 * it can better manage which shader/tiler cores need to be
> powered up
> +	 * or can be powered down based on currently running jobs.
> +	 *
> +	 * If the shader and tiler domains are already delegated to
> the MCU,
> +	 * this call would just return early.
> +	 */
> +	return panthor_pwr_delegate_domains(ptdev);
> +}
> +
> =C2=A0void panthor_pwr_suspend(struct panthor_device *ptdev)
> =C2=A0{
> =C2=A0	if (!ptdev->pwr)
> diff --git a/drivers/gpu/drm/panthor/panthor_pwr.h
> b/drivers/gpu/drm/panthor/panthor_pwr.h
> index b325e5b7eba3..3c834059a860 100644
> --- a/drivers/gpu/drm/panthor/panthor_pwr.h
> +++ b/drivers/gpu/drm/panthor/panthor_pwr.h
> @@ -10,6 +10,10 @@ void panthor_pwr_unplug(struct panthor_device
> *ptdev);
>=20
> =C2=A0int panthor_pwr_init(struct panthor_device *ptdev);
>=20
> +void panthor_pwr_l2_power_off(struct panthor_device *ptdev);
> +
> +int panthor_pwr_l2_power_on(struct panthor_device *ptdev);
> +
> =C2=A0void panthor_pwr_suspend(struct panthor_device *ptdev);
>=20
> =C2=A0void panthor_pwr_resume(struct panthor_device *ptdev);
> diff --git a/drivers/gpu/drm/panthor/panthor_regs.h
> b/drivers/gpu/drm/panthor/panthor_regs.h
> index 5469eec02178..18702d7001e2 100644
> --- a/drivers/gpu/drm/panthor/panthor_regs.h
> +++ b/drivers/gpu/drm/panthor/panthor_regs.h
> @@ -72,6 +72,7 @@
>=20
> =C2=A0#define GPU_FEATURES					0x60
> =C2=A0#define=C2=A0=C2=A0
> GPU_FEATURES_RAY_INTERSECTION			BIT(2)
> +#define=C2=A0=C2=A0 GPU_FEATURES_RAY_TRAVERSAL			BIT(5)

This seems out of place in this commit, which is about power stuff...
