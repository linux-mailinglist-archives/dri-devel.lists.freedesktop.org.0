Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD43D8BF966
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 11:13:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C03A91128A4;
	Wed,  8 May 2024 09:13:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OaXi/cLH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F70D1128A4;
 Wed,  8 May 2024 09:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715159626; x=1746695626;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=klBkLhyD/TIqiC8931eKaEuMvRbhN90D355twxqXUsQ=;
 b=OaXi/cLHZsxLyB6a+B1UhcyZrNpJFGVOLBod84gHjqI7p+FeilRGwn5u
 MzrffDUVX+21AbA5uffEmiAzyfxbjG0xsD/IxjbfQ5nQBIvLbXiXGPQKP
 6ZpUPOYjJfv3NvDVPJgW7RpiqDw4UN8kUtnOTDUo3rqKpnNFmO1II7E0s
 F+vvC/kN4arH6I7txWGNTJrF+riZ0YiNnDSNxk5ekT+g2teUICpsQGLO0
 ddgy4Vb8GZesh607dMyyjOzzhPiefffBAVUroSYK1QO7oqoPI3uidstRm
 Y51cAROJVDqo6cedeVBf5EEnXcRLH59OlH536/c1LFjPSQjwAXw8qOB2h g==;
X-CSE-ConnectionGUID: k0L7K8MeRISgOrEuBgsyhg==
X-CSE-MsgGUID: +HHKAYN6QyqCyUu6ngWu2g==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="13955909"
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; d="scan'208";a="13955909"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 02:13:45 -0700
X-CSE-ConnectionGUID: xlAUvHplRwGwJS7blNx1vQ==
X-CSE-MsgGUID: Nl9+D1kuQ+2ZvNQlJR5CBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; d="scan'208";a="29399576"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 localhost) ([10.245.246.76])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 02:13:42 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH 2/5] drm/amdgpu: Use drm_crtc_vblank_crtc()
In-Reply-To: <20240408190611.24914-2-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240408190611.24914-1-ville.syrjala@linux.intel.com>
 <20240408190611.24914-2-ville.syrjala@linux.intel.com>
Date: Wed, 08 May 2024 12:13:39 +0300
Message-ID: <874jb8ll8c.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Mon, 08 Apr 2024, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Replace the open coded drm_crtc_vblank_crtc() with the real
> thing.
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

FWIW,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c          | 8 ++------
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
>  2 files changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_vkms.c
> index 8baa2e0935cc..258703145161 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> @@ -65,9 +65,7 @@ static enum hrtimer_restart amdgpu_vkms_vblank_simulate=
(struct hrtimer *timer)
>=20=20
>  static int amdgpu_vkms_enable_vblank(struct drm_crtc *crtc)
>  {
> -	struct drm_device *dev =3D crtc->dev;
> -	unsigned int pipe =3D drm_crtc_index(crtc);
> -	struct drm_vblank_crtc *vblank =3D &dev->vblank[pipe];
> +	struct drm_vblank_crtc *vblank =3D drm_crtc_vblank_crtc(crtc);
>  	struct amdgpu_vkms_output *out =3D drm_crtc_to_amdgpu_vkms_output(crtc);
>  	struct amdgpu_crtc *amdgpu_crtc =3D to_amdgpu_crtc(crtc);
>=20=20
> @@ -91,10 +89,8 @@ static bool amdgpu_vkms_get_vblank_timestamp(struct dr=
m_crtc *crtc,
>  					     ktime_t *vblank_time,
>  					     bool in_vblank_irq)
>  {
> -	struct drm_device *dev =3D crtc->dev;
> -	unsigned int pipe =3D crtc->index;
>  	struct amdgpu_vkms_output *output =3D drm_crtc_to_amdgpu_vkms_output(cr=
tc);
> -	struct drm_vblank_crtc *vblank =3D &dev->vblank[pipe];
> +	struct drm_vblank_crtc *vblank =3D drm_crtc_vblank_crtc(crtc);
>  	struct amdgpu_crtc *amdgpu_crtc =3D to_amdgpu_crtc(crtc);
>=20=20
>  	if (!READ_ONCE(vblank->enabled)) {
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 71d2d44681b2..662d2d83473b 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -528,7 +528,7 @@ static void dm_vupdate_high_irq(void *interrupt_param=
s)
>  	if (acrtc) {
>  		vrr_active =3D amdgpu_dm_crtc_vrr_active_irq(acrtc);
>  		drm_dev =3D acrtc->base.dev;
> -		vblank =3D &drm_dev->vblank[acrtc->base.index];
> +		vblank =3D drm_crtc_vblank_crtc(&acrtc->base);
>  		previous_timestamp =3D atomic64_read(&irq_params->previous_timestamp);
>  		frame_duration_ns =3D vblank->time - previous_timestamp;

--=20
Jani Nikula, Intel
