Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F237B4067C
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 16:19:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BF0E10E13A;
	Tue,  2 Sep 2025 14:19:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MpeFAaSq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D49AE10E13A
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 14:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756822788; x=1788358788;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=JeqjB1DzpHfgnA0ruAWQDhRcY4X/W9H5V/BMetRj4Bs=;
 b=MpeFAaSqJjkywGtiXvvltyjKm1bvlmJNA+fqpbFcWUy0Cei+OwfyQuqY
 16lmxNioLiyZEyOEQwvc3r1skRNBNeqVxXplfs8yFeV4HZNUIQukowIUu
 BFcb1dO0AtsIgvSwrP7xww13JBQQNsYqRNngBzOazJH2RncAfAcnYjQdy
 LFO4UJ2nyIFgLQX6TFMXqY4bVDFXVIgUq3hugx/lgE7kkEmUkuydAIMY5
 8bLpvuH7eH1BDRK/CSGq9+R+2lAqzi3dBDX6I9ewyvHpF0PDBPyt+bwaK
 vmGdL2Zb4pDo7O94rW2AbvfoVgvptoMVDcnuWi7HLvMoAXRoZ8Ne2aEtZ w==;
X-CSE-ConnectionGUID: s5y3nX9dQO61Ma9DufKKCg==
X-CSE-MsgGUID: ULr5aL/CRhGWKC9jeGVD5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="70479745"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="70479745"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 07:19:47 -0700
X-CSE-ConnectionGUID: 90+d7GsNSxi4ddSR73v/8w==
X-CSE-MsgGUID: k0Erm2EQSnegL7RJmepx9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="176597686"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO stinkbox)
 ([10.245.245.118])
 by orviesa005.jf.intel.com with SMTP; 02 Sep 2025 07:19:43 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 02 Sep 2025 17:19:42 +0300
Date: Tue, 2 Sep 2025 17:19:42 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>
Subject: Re: [PATCH v2 06/37] drm/vkms: Convert vkms_crtc_atomic_check() to
 use new plane state
Message-ID: <aLb8_mwWKezSjPES@intel.com>
References: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
 <20250902-drm-no-more-existing-state-v2-6-de98fc5f6d66@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250902-drm-no-more-existing-state-v2-6-de98fc5f6d66@kernel.org>
X-Patchwork-Hint: comment
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

On Tue, Sep 02, 2025 at 11:35:05AM +0200, Maxime Ripard wrote:
> The vkms_crtc_atomic_check() function calls the deprecated
> drm_atomic_get_existing_plane_state() helper for its internal mode
> checking logic.
> 
> During atomic_check, the existing state is the new state and
> drm_atomic_get_existing_plane_state() can thus be replaced by
> drm_atomic_get_new_plane_state().
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> 
> ---
> To: Louis Chauvet <louis.chauvet@bootlin.com>
> Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Melissa Wen <melissa.srw@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/vkms/vkms_crtc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> index e60573e0f3e9510252e1f198b00e28bcc7987620..48237f32ac3b8f78b1495e8fbcc630be863ec7e4 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -183,11 +183,11 @@ static int vkms_crtc_atomic_check(struct drm_crtc *crtc,
>  	ret = drm_atomic_add_affected_planes(crtc_state->state, crtc);
>  	if (ret < 0)
>  		return ret;
>  
>  	drm_for_each_plane_mask(plane, crtc->dev, crtc_state->plane_mask) {
> -		plane_state = drm_atomic_get_existing_plane_state(crtc_state->state, plane);
> +		plane_state = drm_atomic_get_new_plane_state(crtc_state->state, plane);

Looks like a bunch of these drivers could also use another cleanup
to plumb the drm_atomic_state straight through instead of digging
it up again via the foo_state->state footgun.

>  		WARN_ON(!plane_state);
>  
>  		if (!plane_state->visible)
>  			continue;
>  
> @@ -199,11 +199,11 @@ static int vkms_crtc_atomic_check(struct drm_crtc *crtc,
>  		return -ENOMEM;
>  	vkms_state->num_active_planes = i;
>  
>  	i = 0;
>  	drm_for_each_plane_mask(plane, crtc->dev, crtc_state->plane_mask) {
> -		plane_state = drm_atomic_get_existing_plane_state(crtc_state->state, plane);
> +		plane_state = drm_atomic_get_new_plane_state(crtc_state->state, plane);
>  
>  		if (!plane_state->visible)
>  			continue;
>  
>  		vkms_state->active_planes[i++] =
> 
> -- 
> 2.50.1

-- 
Ville Syrjälä
Intel
