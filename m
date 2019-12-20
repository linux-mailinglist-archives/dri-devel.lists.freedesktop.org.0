Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBE61283EC
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2019 22:35:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A76A86E158;
	Fri, 20 Dec 2019 21:35:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B83F66E150
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 21:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576877751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TOvm3NUAN5xhMAZfJ/KvucmHPAjs1I5k5iVlMMPPJBU=;
 b=gfOlEeWAfxsyPODNAoA7meC0JCzUh/AVIemCs9fYnvPxEMlcK7eT8Yge2amuXUQeH6oXCw
 UgtKkkBIavAXL4D8BVOB5M0pnZO2tQLP9skv7q8nOSBAZI2FTvCxbb91/VyiWxNPIDeAhB
 p02ZdazgJBjMZKacpHgP7oqoECZmzf0=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-B4lp39VyOMe4asCatgidwA-1; Fri, 20 Dec 2019 16:35:48 -0500
Received: by mail-qk1-f200.google.com with SMTP id a200so6793444qkc.18
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 13:35:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=TOvm3NUAN5xhMAZfJ/KvucmHPAjs1I5k5iVlMMPPJBU=;
 b=tkstLkE+YEt2lnlbEj1xTvFAjz5v9+iTgNlHx6DM20hR+Bdz7uzywgTg8j8eISAzxm
 QwwDwJEjcN2SHJ41NK8wppG/bAVxuBOTdJnZ6aeL0o8XUoc4zrnTdP8BZB/XpZgoKcFx
 QY3jJSutD0/RLUbCkcGc1PdFLj8nDA9Fksj5bVLrU+dufVzMnShWbiXohneDIxjU8/uV
 ufPBUWzqFJZo4MXYuzsX/XdNYsrVBXXjfKKmbdi28vOFNKxlTUWS28bPjzS5Kk9UUMH+
 BFMqqQmoMqq1PAzkeX2Cu6SdxZe2fBObOOkb5X7mVfF32c7UXbuCOLyt3m5tgUOW9K/4
 ChXQ==
X-Gm-Message-State: APjAAAXbzDxcYowIA5efq113lHyVZboCCMh79MzkgtmU/lT44amhhQ+Q
 PK68/vFnVRO+KjbJuWAHr6mf9Pclo4tM9caF62dcrbZkgZk/Wg5mNqaVkkWCkZwn8PLrHqC2a9S
 LiHwu+RgCnldPPdM7BN1ha68FeIMD
X-Received: by 2002:a05:620a:166a:: with SMTP id
 d10mr15374484qko.37.1576877747633; 
 Fri, 20 Dec 2019 13:35:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqwCjsR5shJTV2T48pR6qQLWq6aev0IpOZ3orpvRmib0o4L9dwHDexBGgrISVr1ejfDYKFSGTw==
X-Received: by 2002:a05:620a:166a:: with SMTP id
 d10mr15374463qko.37.1576877747187; 
 Fri, 20 Dec 2019 13:35:47 -0800 (PST)
Received: from dhcp-10-20-1-90.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id t29sm2683854qkm.27.2019.12.20.13.35.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2019 13:35:46 -0800 (PST)
Message-ID: <78e9ebfb314efc592bff859daf836e368d2c5eef.camel@redhat.com>
Subject: Re: [PATCH v9 01/18] drm/dp_mst: Add PBN calculation for DSC modes
From: Lyude Paul <lyude@redhat.com>
To: mikita.lipski@amd.com, amd-gfx@lists.freedesktop.org
Date: Fri, 20 Dec 2019 16:35:45 -0500
In-Reply-To: <20191213200854.31545-2-mikita.lipski@amd.com>
References: <20191213200854.31545-1-mikita.lipski@amd.com>
 <20191213200854.31545-2-mikita.lipski@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.34.2 (3.34.2-1.fc31)
MIME-Version: 1.0
X-MC-Unique: B4lp39VyOMe4asCatgidwA-1
X-Mimecast-Spam-Score: 0
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
Cc: David Francis <David.Francis@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Actually, one comment on this that should be very simple to add

On Fri, 2019-12-13 at 15:08 -0500, mikita.lipski@amd.com wrote:
> From: David Francis <David.Francis@amd.com>
> 
> With DSC, bpp can be fractional in multiples of 1/16.
> 
> Change drm_dp_calc_pbn_mode to reflect this, adding a new
> parameter bool dsc. When this parameter is true, treat the
> bpp parameter as having units not of bits per pixel, but
> 1/16 of a bit per pixel
> 
> v2: Don't add separate function for this
> v3: In the equation divide bpp by 16 as it is expected
> not to leave any remainder
> 
> Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
> Signed-off-by: David Francis <David.Francis@amd.com>
> Signed-off-by: Mikita Lipski <mikita.lipski@amd.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  2 +-
>  drivers/gpu/drm/drm_dp_mst_topology.c              | 12 +++++++++++-
>  drivers/gpu/drm/i915/display/intel_dp_mst.c        |  3 ++-
>  drivers/gpu/drm/nouveau/dispnv50/disp.c            |  2 +-
>  drivers/gpu/drm/radeon/radeon_dp_mst.c             |  2 +-
>  drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c | 10 ++++++----
>  include/drm/drm_dp_mst_helper.h                    |  3 +--
>  7 files changed, 23 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 455c51c38720..9fc03fc1017d 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -4967,7 +4967,7 @@ static int dm_encoder_helper_atomic_check(struct
> drm_encoder *encoder,
>  								    is_y420);
>  		bpp = convert_dc_color_depth_into_bpc(color_depth) * 3;
>  		clock = adjusted_mode->clock;
> -		dm_new_connector_state->pbn = drm_dp_calc_pbn_mode(clock,
> bpp);
> +		dm_new_connector_state->pbn = drm_dp_calc_pbn_mode(clock, bpp,
> false);
>  	}
>  	dm_new_connector_state->vcpi_slots =
> drm_dp_atomic_find_vcpi_slots(state,
>  									   mst
> _mgr,
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> b/drivers/gpu/drm/drm_dp_mst_topology.c
> index ae5809a1f19a..363e7e58e7e7 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -4342,10 +4342,11 @@ EXPORT_SYMBOL(drm_dp_check_act_status);
>   * drm_dp_calc_pbn_mode() - Calculate the PBN for a mode.
>   * @clock: dot clock for the mode
>   * @bpp: bpp for the mode.
> + * @dsc: DSC mode. If true, bpp has units of 1/16 of a bit per pixel
>   *
>   * This uses the formula in the spec to calculate the PBN value for a mode.
>   */
> -int drm_dp_calc_pbn_mode(int clock, int bpp)
> +int drm_dp_calc_pbn_mode(int clock, int bpp, bool dsc)
>  {
>  	/*
>  	 * margin 5300ppm + 300ppm ~ 0.6% as per spec, factor is 1.006
> @@ -4356,7 +4357,16 @@ int drm_dp_calc_pbn_mode(int clock, int bpp)
>  	 * peak_kbps *= (1006/1000)
>  	 * peak_kbps *= (64/54)
>  	 * peak_kbps *= 8    convert to bytes
> +	 *
> +	 * If the bpp is in units of 1/16, further divide by 16. Put this
> +	 * factor in the numerator rather than the denominator to avoid
> +	 * integer overflow
>  	 */
> +
> +	if (dsc)
> +		return DIV_ROUND_UP_ULL(mul_u32_u32(clock * (bpp / 16), 64 *
> 1006),
> +					8 * 54 * 1000 * 1000);
> +
>  	return DIV_ROUND_UP_ULL(mul_u32_u32(clock * bpp, 64 * 1006),
>  				8 * 54 * 1000 * 1000);
>  }
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index 03d1cba0b696..92be17711287 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -61,7 +61,8 @@ static int intel_dp_mst_compute_link_config(struct
> intel_encoder *encoder,
>  		crtc_state->pipe_bpp = bpp;
>  
>  		crtc_state->pbn = drm_dp_calc_pbn_mode(adjusted_mode-
> >crtc_clock,
> -						       crtc_state->pipe_bpp);
> +						       crtc_state->pipe_bpp,
> +						       false);
>  
>  		slots = drm_dp_atomic_find_vcpi_slots(state, &intel_dp-
> >mst_mgr,
>  						      port, crtc_state->pbn);
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index 549486f1d937..1c9e23d5a6fd 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -782,7 +782,7 @@ nv50_msto_atomic_check(struct drm_encoder *encoder,
>  			const int bpp = connector->display_info.bpc * 3;
>  			const int clock = crtc_state->adjusted_mode.clock;
>  
> -			asyh->dp.pbn = drm_dp_calc_pbn_mode(clock, bpp);
> +			asyh->dp.pbn = drm_dp_calc_pbn_mode(clock, bpp,
> false);
>  		}
>  
>  		slots = drm_dp_atomic_find_vcpi_slots(state, &mstm->mgr,
> diff --git a/drivers/gpu/drm/radeon/radeon_dp_mst.c
> b/drivers/gpu/drm/radeon/radeon_dp_mst.c
> index ee28f5b3785e..28eef9282874 100644
> --- a/drivers/gpu/drm/radeon/radeon_dp_mst.c
> +++ b/drivers/gpu/drm/radeon/radeon_dp_mst.c
> @@ -518,7 +518,7 @@ static bool radeon_mst_mode_fixup(struct drm_encoder
> *encoder,
>  
>  	mst_enc = radeon_encoder->enc_priv;
>  
> -	mst_enc->pbn = drm_dp_calc_pbn_mode(adjusted_mode->clock, bpp);
> +	mst_enc->pbn = drm_dp_calc_pbn_mode(adjusted_mode->clock, bpp, false);
>  
>  	mst_enc->primary->active_device = mst_enc->primary->devices & mst_enc-
> >connector->devices;
>  	DRM_DEBUG_KMS("setting active device to %08x from %08x %08x for
> encoder %d\n",
> diff --git a/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
> b/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
> index af2b2de65316..73fc1c485283 100644
> --- a/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
> +++ b/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
> @@ -18,15 +18,17 @@ int igt_dp_mst_calc_pbn_mode(void *ignored)
>  		int rate;
>  		int bpp;
>  		int expected;
> +		bool dsc;
>  	} test_params[] = {
> -		{ 154000, 30, 689 },
> -		{ 234000, 30, 1047 },
> -		{ 297000, 24, 1063 },
> +		{ 154000, 30, 689, false },
> +		{ 234000, 30, 1047, false },
> +		{ 297000, 24, 1063, false },

Mind adding one or two test_params that actually use dsc here?

>  	};
>  
>  	for (i = 0; i < ARRAY_SIZE(test_params); i++) {
>  		pbn = drm_dp_calc_pbn_mode(test_params[i].rate,
> -					   test_params[i].bpp);
> +					   test_params[i].bpp,
> +					   test_params[i].dsc);
>  		FAIL(pbn != test_params[i].expected,
>  		     "Expected PBN %d for clock %d bpp %d, got %d\n",
>  		     test_params[i].expected, test_params[i].rate,
> diff --git a/include/drm/drm_dp_mst_helper.h
> b/include/drm/drm_dp_mst_helper.h
> index d5fc90b30487..68656913cfe5 100644
> --- a/include/drm/drm_dp_mst_helper.h
> +++ b/include/drm/drm_dp_mst_helper.h
> @@ -719,8 +719,7 @@ bool drm_dp_mst_port_has_audio(struct
> drm_dp_mst_topology_mgr *mgr,
>  struct edid *drm_dp_mst_get_edid(struct drm_connector *connector, struct
> drm_dp_mst_topology_mgr *mgr, struct drm_dp_mst_port *port);
>  
>  
> -int drm_dp_calc_pbn_mode(int clock, int bpp);
> -
> +int drm_dp_calc_pbn_mode(int clock, int bpp, bool dsc);
>  
>  bool drm_dp_mst_allocate_vcpi(struct drm_dp_mst_topology_mgr *mgr,
>  			      struct drm_dp_mst_port *port, int pbn, int
> slots);
-- 
Cheers,
	Lyude Paul

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
