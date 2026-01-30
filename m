Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id nGV7NxTkfGkwPQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 18:02:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73697BCC86
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 18:02:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D9F010E15E;
	Fri, 30 Jan 2026 17:02:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ax0vA9rB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FBE810E0AD;
 Fri, 30 Jan 2026 17:02:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6C21D60018;
 Fri, 30 Jan 2026 17:02:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 591AAC4CEF7;
 Fri, 30 Jan 2026 17:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769792522;
 bh=qJet0Ig2FvrgFUoZlVTlRYNLrADIS9xbqjTzK2rlbQQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Ax0vA9rBHx992xEkSvk2bT/UQ+6nECLsD/+xpRTXEszqJS5bIBgp0kIbeZyDjSxaE
 SZ6T4gR2dgo18+7TQYtWgMb2Yo0t9z68Ef4r0wzMvIyYiSU7ID6Qf/z7o3MsJQDenm
 50iM5vLyGS1enArgpWdZdyB4LtkGpJ4ITtxbQWXvSPSJXJ+w4ZwUBTXWxWjMWkPkoJ
 o+PGR7yRZ4NHEboxjz1bgMOuvQFYQavsyyQ3pa8TTaFSR+JK3uTD646nxXSdLgACxp
 nCbVLV4mYUCp/Nis4/N3sOVC9w60Ri6Qn89zkqD0zHfWLFaRw0WP/20r6MSzblF4/+
 3/eGIGBXlGe9A==
Message-ID: <c87b2e28-b1f0-4e08-9a6e-70b545a432bb@kernel.org>
Date: Fri, 30 Jan 2026 11:02:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] drm/amd/display: Implement prepare_vblank_enable
 callback
To: sunpeng.li@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Harry.Wentland@amd.com, simona@ffwll.ch, airlied@gmail.com,
 jani.nikula@linux.intel.com, ville.syrjala@linux.intel.com
References: <20260127194143.176248-1-sunpeng.li@amd.com>
 <20260127194143.176248-2-sunpeng.li@amd.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260127194143.176248-2-sunpeng.li@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,ffwll.ch,gmail.com,linux.intel.com];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[superm1@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: 73697BCC86
X-Rspamd-Action: no action

On 1/27/26 1:41 PM, sunpeng.li@amd.com wrote:
> From: Leo Li <sunpeng.li@amd.com>
> 
> [Why]
> 
> APU DCN generations since DCN3.5 have the capability to power down
> almost all of the DCN hw block during idle periods. This is referred to
> as  IPS -- idle power states. In combination with a panel remote-buffer
> feature (like PSR or Panel Replay), IPS can save additional power.
> 
> Once DCN is in an IPS, no register access can occur. This includes
> control registers for vblank interrupts; IPS must first be exited.
> 
> Transitioning in or out of IPS requires synchronization with the rest of
> DC, as it powers up or down DCN, and may communicate with other MCUs on
> the SOC to do so. This is done via the dc_lock mutex.
> 
> While calling enable_vblank, the DRM vblank core holds spinlocks that
> prevent blocking operations. Yet acquiring the dc_lock mutex is
> blocking. Thus, IPS can not be exited piror to programming vblank
> interrupt registers from within enable_vblank. At least not in a
> race-free way.
> 
> Prior to this change, amdgpu_dm was exiting IPS(*) without holding the
> dc_lock, opening the door for races:
> https://gitlab.freedesktop.org/drm/amd/-/issues/5233
> 
> (*) From touching the interrupt registers. All register reads today have
> an implicit IPS exit, see dm_read_reg_func()
> 
> To solve this, the prepare_vblank_enable callback can be implemented to
> exit IPS, as it is called from process context.
> 
> [How]
> 
> Implement the prepare_vblank_enable callback for amdgpu_dm. In it,
> the dc_lock mutex is acquired, and IPS is exited.
> 
> Note that the only place that should unconditionally IPS allow is the
> vblank disable path. All other paths shall check whether IPS was
> previously allowed. If so, they can re-allow after all programming is
> complete. They also need to hold the dc_lock for the duration of the IPS
> disallow to re-allow. (This is not the for all of amdgpu_dm today,
> cleanup will come in future patches.)
> 
> v2: Add missing semicolon, add docstring for prepare_vbl_disallow_idle
> v3: Do prepare work (IPS exit) directly, instead of routing through DRM
> v4: Fix build error on CONFIG_DRM_AMD_SECURE_DISPLAY not set
> 
> Signed-off-by: Leo Li <sunpeng.li@amd.com>
> ---
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 37 ++++++++++++------
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  9 +++++
>   .../drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c |  8 ++--
>   .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    | 38 +++++++++++++++++--
>   4 files changed, 75 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 740711ac1037c..d0c412260be0c 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -9681,7 +9681,8 @@ static void update_stream_irq_parameters(
>   	spin_unlock_irqrestore(&adev_to_drm(adev)->event_lock, flags);
>   }
>   
> -static void amdgpu_dm_handle_vrr_transition(struct dm_crtc_state *old_state,
> +static void amdgpu_dm_handle_vrr_transition(struct amdgpu_display_manager *dm,
> +					    struct dm_crtc_state *old_state,
>   					    struct dm_crtc_state *new_state)
>   {
>   	bool old_vrr_active = amdgpu_dm_crtc_vrr_active(old_state);
> @@ -9696,8 +9697,11 @@ static void amdgpu_dm_handle_vrr_transition(struct dm_crtc_state *old_state,
>   		 * We also need vupdate irq for the actual core vblank handling
>   		 * at end of vblank.
>   		 */
> -		WARN_ON(amdgpu_dm_crtc_set_vupdate_irq(new_state->base.crtc, true) != 0);
> -		WARN_ON(drm_crtc_vblank_get(new_state->base.crtc) != 0);
> +		scoped_guard(mutex, &dm->dc_lock) {
> +			dc_exit_ips_for_hw_access(dm->dc);
> +			WARN_ON(amdgpu_dm_crtc_set_vupdate_irq(new_state->base.crtc, true) != 0);
> +			WARN_ON(drm_crtc_vblank_get(new_state->base.crtc) != 0);
> +		}
>   		drm_dbg_driver(new_state->base.crtc->dev, "%s: crtc=%u VRR off->on: Get vblank ref\n",
>   				 __func__, new_state->base.crtc->base.id);
>   	} else if (old_vrr_active && !new_vrr_active) {
> @@ -10122,7 +10126,11 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
>   		 */
>   		if (acrtc_attach->base.state->event &&
>   		    acrtc_state->active_planes > 0) {
> -			drm_crtc_vblank_get(pcrtc);
> +
> +			scoped_guard(mutex, &dm->dc_lock) {
> +				dc_exit_ips_for_hw_access(dm->dc);
> +				drm_crtc_vblank_get(pcrtc);

drm_crtc_vblank_get() can potentially fail, should you be checking that 
here and showing a warning?

> +			}
>   
>   			spin_lock_irqsave(&pcrtc->dev->event_lock, flags);
>   
> @@ -10138,13 +10146,19 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
>   					&acrtc_state->stream->vrr_infopacket;
>   		}
>   	} else if (cursor_update && acrtc_state->active_planes > 0) {
> -		spin_lock_irqsave(&pcrtc->dev->event_lock, flags);
> -		if (acrtc_attach->base.state->event) {
> -			drm_crtc_vblank_get(pcrtc);
> -			acrtc_attach->event = acrtc_attach->base.state->event;
> -			acrtc_attach->base.state->event = NULL;
> +
> +		scoped_guard(mutex, &dm->dc_lock) {
> +			dc_exit_ips_for_hw_access(dm->dc);
> +
> +			spin_lock_irqsave(&pcrtc->dev->event_lock, flags);
> +			if (acrtc_attach->base.state->event) {
> +				drm_crtc_vblank_get(pcrtc);
> +				acrtc_attach->event =
> +					acrtc_attach->base.state->event;
> +				acrtc_attach->base.state->event = NULL;
> +			}
> +			spin_unlock_irqrestore(&pcrtc->dev->event_lock, flags);
>   		}
> -		spin_unlock_irqrestore(&pcrtc->dev->event_lock, flags);
>   	}
>   
>   	/* Update the planes if changed or disable if we don't have any. */
> @@ -10976,7 +10990,8 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
>   			manage_dm_interrupts(adev, acrtc, dm_new_crtc_state);
>   		}
>   		/* Handle vrr on->off / off->on transitions */
> -		amdgpu_dm_handle_vrr_transition(dm_old_crtc_state, dm_new_crtc_state);
> +		amdgpu_dm_handle_vrr_transition(dm, dm_old_crtc_state,
> +						dm_new_crtc_state);
>   
>   #ifdef CONFIG_DEBUG_FS
>   		if (new_crtc_state->active &&
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> index bd0403005f370..b2fbdaa7c5c9c 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> @@ -585,6 +585,15 @@ struct amdgpu_display_manager {
>   	 */
>   	uint32_t active_vblank_irq_count;
>   
> +	/**
> +	 * @prepare_vbl_disallow_idle:
> +	 *
> +	 * Set to true when idle has been disallowed. Set to false when vblank
> +	 * interrupts have been enabled. i.e. idle re-allow on vblank disable is
> +	 * blocked if this is true.
> +	 */
> +	bool prepare_vbl_disallow_idle;
> +
>   #if defined(CONFIG_DRM_AMD_SECURE_DISPLAY)
>   	/**
>   	 * @secure_display_ctx:
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
> index e20aa74380665..2d2eda804735a 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
> @@ -547,10 +547,8 @@ int amdgpu_dm_crtc_set_crc_source(struct drm_crtc *crtc, const char *src_name)
>   	struct drm_crtc_commit *commit;
>   	struct dm_crtc_state *crtc_state;
>   	struct drm_device *drm_dev = crtc->dev;
> -#if defined(CONFIG_DRM_AMD_SECURE_DISPLAY)
>   	struct amdgpu_device *adev = drm_to_adev(drm_dev);
>   	struct amdgpu_display_manager *dm = &adev->dm;
> -#endif
>   	struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
>   	struct drm_dp_aux *aux = NULL;
>   	bool enable = false;
> @@ -656,7 +654,11 @@ int amdgpu_dm_crtc_set_crc_source(struct drm_crtc *crtc, const char *src_name)
>   	 */
>   	enabled = amdgpu_dm_is_valid_crc_source(cur_crc_src);
>   	if (!enabled && enable) {
> -		ret = drm_crtc_vblank_get(crtc);
> +		scoped_guard(mutex, &dm->dc_lock) {
> +			dc_exit_ips_for_hw_access(dm->dc);
> +			ret = drm_crtc_vblank_get(crtc);
> +		}
> +
>   		if (ret)
>   			goto cleanup;
>   	}
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> index 697e232acebfb..5edc035ec152a 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> @@ -258,8 +258,8 @@ static void amdgpu_dm_crtc_vblank_control_worker(struct work_struct *work)
>   	else if (dm->active_vblank_irq_count)
>   		dm->active_vblank_irq_count--;
>   
> -	if (dm->active_vblank_irq_count > 0)
> -		dc_allow_idle_optimizations(dm->dc, false);
> +	/* prepare_vblank_enable must disallow idle first */
> +	ASSERT(dm->dc->idle_optimizations_allowed == false);
>   
>   	/*
>   	 * Control PSR based on vblank requirements from OS
> @@ -277,7 +277,13 @@ static void amdgpu_dm_crtc_vblank_control_worker(struct work_struct *work)
>   			vblank_work->acrtc->dm_irq_params.allow_sr_entry);
>   	}
>   
> -	if (dm->active_vblank_irq_count == 0) {
> +	/*
> +	 * If this worker runs disable between prepare_vblank and enable_vblank,
> +	 * we need to block idle re-allow. Leave it to the next vblank disable
> +	 * to re-allow idle.
> +	 */
> +	if (dm->active_vblank_irq_count == 0 &&
> +	    !READ_ONCE(dm->prepare_vbl_disallow_idle)) {
>   		dc_post_update_surfaces_to_stream(dm->dc);
>   
>   		r = amdgpu_dpm_pause_power_profile(adev, true);
> @@ -308,6 +314,8 @@ static inline int amdgpu_dm_crtc_set_vblank(struct drm_crtc *crtc, bool enable)
>   	int irq_type;
>   	int rc = 0;
>   
> +	ASSERT(dm->dc->idle_optimizations_allowed == false);
> +
>   	if (enable && !acrtc->base.enabled) {
>   		drm_dbg_vbl(crtc->dev,
>   				"Reject vblank enable on unconfigured CRTC %d (enabled=%d)\n",
> @@ -399,6 +407,9 @@ static inline int amdgpu_dm_crtc_set_vblank(struct drm_crtc *crtc, bool enable)
>   	}
>   #endif
>   
> +	/* Ensure compiler emits the write before worker is queued */
> +	WRITE_ONCE(dm->prepare_vbl_disallow_idle, false);
> +
>   	if (amdgpu_in_reset(adev))
>   		return 0;
>   
> @@ -423,6 +434,26 @@ static inline int amdgpu_dm_crtc_set_vblank(struct drm_crtc *crtc, bool enable)
>   	return 0;
>   }
>   
> +static int amdgpu_prepare_enable_vblank(struct drm_crtc *crtc)
> +{
> +	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
> +	struct amdgpu_display_manager *dm = &adev->dm;
> +
> +	guard(mutex)(&adev->dm.dc_lock);
> +
> +	if (dm->dc->idle_optimizations_allowed) {
> +		/*
> +		 * Prevent the disable worker from re-allowing idle until
> +		 * interrupts are enabled. Ensure compiler emits the write
> +		 * before disallowing idle.
> +		 */
> +		WRITE_ONCE(dm->prepare_vbl_disallow_idle, true);
> +		dc_exit_ips_for_hw_access(dm->dc);
> +	}
> +
> +	return 0;
> +}
> +
>   int amdgpu_dm_crtc_enable_vblank(struct drm_crtc *crtc)
>   {
>   	return amdgpu_dm_crtc_set_vblank(crtc, true);
> @@ -590,6 +621,7 @@ static const struct drm_crtc_funcs amdgpu_dm_crtc_funcs = {
>   	.verify_crc_source = amdgpu_dm_crtc_verify_crc_source,
>   	.get_crc_sources = amdgpu_dm_crtc_get_crc_sources,
>   	.get_vblank_counter = amdgpu_get_vblank_counter_kms,
> +	.prepare_enable_vblank = amdgpu_prepare_enable_vblank,
>   	.enable_vblank = amdgpu_dm_crtc_enable_vblank,
>   	.disable_vblank = amdgpu_dm_crtc_disable_vblank,
>   	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,

