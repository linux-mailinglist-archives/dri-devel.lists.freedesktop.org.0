Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A7B9D823E
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 10:29:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81F8410E3AC;
	Mon, 25 Nov 2024 09:29:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jp4SfiF1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49A4810E3AC
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 09:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732526967; x=1764062967;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=l/q2gxxyKo7+bYwAJ2zy18y5mBbZiypPDofxassGcHA=;
 b=Jp4SfiF1us9Sf1qbhKk9V7eeG384jQLYWuM7reovTNa6tq+mwPbxBqsq
 8R4WgW1qTnmVxQq3m1WCKmiPMFF0hwAuIlNHmW1vWmjLxapBH1v340OXB
 it2WPBOcsXJrOCtHcuEjraKeJggThSghW6Ly29QOtIXZYUQ/yH+qBDsrf
 f/KG4mFCbsfabfmU+3NWDAgK2asSST4QNIFPmVD9Y0cp6MYysQguCN7Fa
 UqSLnnC4YONOPQ67QmEAlYi9KMq5rqJ1aK2mUM1SAsxORHnwsBPNumA+m
 F1QYRU3JPVDdZ2F11MfmnygenFoqBBk3a8ruoO5tIrfgF5sTz3a0VwhXn Q==;
X-CSE-ConnectionGUID: +nsYVrC4Ts6MY6ksYIz/HA==
X-CSE-MsgGUID: hYIJJo2aTrq3csoy0pQrsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="50032650"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="50032650"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 01:29:27 -0800
X-CSE-ConnectionGUID: 7QBII2+CSEi2FEIoGsVC1w==
X-CSE-MsgGUID: vhG3nDZhRvSETyB5fdRrUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="91167848"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.243])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 01:29:21 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>, =?utf-8?Q?Ma=C3=ADra?= Canal
 <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>
Cc: arthurgrillo@riseup.net, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, nicolejadeyee@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Louis
 Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH RFC v2 11/18] drm/vkms: Introduce config for CRTC name
In-Reply-To: <20241122-google-remove-crtc-index-from-parameter-v2-11-81540742535a@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241122-google-remove-crtc-index-from-parameter-v2-0-81540742535a@bootlin.com>
 <20241122-google-remove-crtc-index-from-parameter-v2-11-81540742535a@bootlin.com>
Date: Mon, 25 Nov 2024 11:29:17 +0200
Message-ID: <87r06zy842.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, 22 Nov 2024, Louis Chauvet <louis.chauvet@bootlin.com> wrote:
> As a CRTC will be a directory in ConfigFS, add the name configuration for
> CRTC name so we will be able to reflect the configfs directory name in the
> drm name.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_config.c | 5 +++++
>  drivers/gpu/drm/vkms/vkms_config.h | 2 ++
>  drivers/gpu/drm/vkms/vkms_crtc.c   | 2 +-
>  3 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index a2539fb56b602569b75748fdf9c4784f104b0bff..3252f657ce515c0193a8c0e709bfe861feba0aca 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -37,6 +37,10 @@ struct vkms_config *vkms_config_alloc_default(bool enable_writeback, bool enable
>  	if (!crtc)
>  		goto err_alloc;
>  	crtc->writeback = enable_writeback;
> +	crtc->name = kzalloc(sizeof("Main CRTC"), GFP_KERNEL);
> +	if (!crtc->name)
> +		goto err_alloc;
> +	sprintf(crtc->name, "Main CRTC");

Ditto, kstrdup()

>  
>  	encoder = vkms_config_create_encoder(vkms_config);
>  	if (!encoder)
> @@ -219,6 +223,7 @@ void vkms_config_delete_crtc(struct vkms_config_crtc *vkms_config_crtc,
>  		}
>  	}
>  
> +	kfree(vkms_config_crtc->name);
>  	kfree(vkms_config_crtc);
>  }
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
> index 4223edd94ec270915dd658c0b5efd489554d33a5..4a4c16dea7855cf36060986ef247be698974fafc 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -29,6 +29,7 @@ struct vkms_config {
>   * struct vkms_config_crtc
>   *
>   * @link: Link to the others CRTCs
> + * @name: Name of the CRTC
>   * @possible_planes: List of planes that can be used with this CRTC
>   * @possible_encoders: List of encoders that can be used with this CRTC
>   * @crtc: Internal usage. This pointer should never be considered as valid. It can be used to
> @@ -38,6 +39,7 @@ struct vkms_config {
>  struct vkms_config_crtc {
>  	struct list_head link;
>  
> +	char *name;
>  	bool writeback;
>  	struct xarray possible_planes;
>  	struct xarray possible_encoders;
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> index 3825fba57c012f84cbe67114e053dcd7fcfa283d..25a3d97a362afd0d40f3e023d9cce985d447a880 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -292,7 +292,7 @@ struct vkms_crtc *vkms_crtc_init(struct vkms_device *vkms_device,
>  
>  	vkms_crtc = drmm_crtc_alloc_with_planes(dev, struct vkms_crtc, base,
>  						primary, cursor,
> -						&vkms_crtc_funcs, NULL);
> +						&vkms_crtc_funcs, config->name);
>  	if (IS_ERR(vkms_crtc)) {
>  		DRM_DEV_ERROR(dev->dev, "Failed to init CRTC\n");
>  		return vkms_crtc;

-- 
Jani Nikula, Intel
