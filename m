Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FF82948A5
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 09:12:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDAB16E974;
	Wed, 21 Oct 2020 07:12:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6197A6E977
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 07:12:49 +0000 (UTC)
IronPort-SDR: rlkjwQSZN1NZgc1wGKpvUufKyJyPJUmsoFcDNtDbm7fkltZpgVbJ6F6uqFiJFN5h2+2MOGRP3o
 j+QcbX/wEcxA==
X-IronPort-AV: E=McAfee;i="6000,8403,9780"; a="155111557"
X-IronPort-AV: E=Sophos;i="5.77,400,1596524400"; d="scan'208";a="155111557"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2020 00:12:48 -0700
IronPort-SDR: eDvY7crxTu0+py1S5tNfCS0Nt7FhkTOmGogUl63mveDwK5Ue1BcC1WqZxBIaq/C4GXJjAT3gIY
 xJWBDh5YrtEg==
X-IronPort-AV: E=Sophos;i="5.77,400,1596524400"; d="scan'208";a="533420487"
Received: from egaralis-mobl1.ger.corp.intel.com (HELO [10.252.55.31])
 ([10.252.55.31])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2020 00:12:47 -0700
Subject: Re: [PATCH] drm: add client cap to expose low power modes
To: Ken Huang <kenbshuang@google.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
References: <20201021065404.1336797-1-kenbshuang@google.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <dbf29495-c42a-9125-129c-85f68cdbac09@linux.intel.com>
Date: Wed, 21 Oct 2020 09:12:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <20201021065404.1336797-1-kenbshuang@google.com>
Content-Language: en-US
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
Cc: Adrian Salido <salidoa@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Op 21-10-2020 om 08:54 schreef Ken Huang:
> From: Adrian Salido <salidoa@google.com>
>
> Some displays may support Low Power modes, however, these modes may
> require special handling as they would usually require lower OPR
> content on framebuffers. Add a drm mode flag to specify display
> capability to support low power mode, and add a drm client cap for
> it. If a client doesn't support the capability, that will filter it
> out for the client.
>
> Signed-off-by: Adrian Salido <salidoa@google.com>
> Signed-off-by: Ken Huang <kenbshuang@google.com>
> ---
>  drivers/gpu/drm/drm_connector.c |  4 ++++
>  drivers/gpu/drm/drm_ioctl.c     |  5 +++++
>  include/drm/drm_file.h          |  7 +++++++
>  include/uapi/drm/drm.h          | 10 ++++++++++
>  include/uapi/drm/drm_mode.h     |  3 +++
>  5 files changed, 29 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 717c4e7271b0..46a29b156ffa 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -2318,6 +2318,10 @@ drm_mode_expose_to_userspace(const struct drm_display_mode *mode,
>  		}
>  	}
>  
> +	if (!file_priv->low_power_modes_allowed &&
> +	    (mode->flags & DRM_MODE_FLAG_LOW_POWER))
> +		return false;
> +
>  	return true;
>  }
>  
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index 789ee65ac1f5..e7e025698b3b 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -362,6 +362,11 @@ drm_setclientcap(struct drm_device *dev, void *data, struct drm_file *file_priv)
>  			return -EINVAL;
>  		file_priv->writeback_connectors = req->value;
>  		break;
> +	case DRM_CLIENT_CAP_LOW_POWER_MODES:
> +		if (req->value > 1)
> +			return -EINVAL;
> +		file_priv->low_power_modes_allowed = req->value;
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index 716990bace10..2fa66c32f066 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -212,6 +212,13 @@ struct drm_file {
>  	 */
>  	bool was_master;
>  
> +	/**
> +	 * @low_power_modes_allowed:
> +	 *
> +	 * True if the client understands how to work with low power modes
> +	 */
> +	bool low_power_modes_allowed;
> +
>  	/**
>  	 * @is_master:
>  	 *
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 808b48a93330..12f39a628bb5 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -698,6 +698,16 @@ struct drm_get_cap {
>   */
>  #define DRM_CLIENT_CAP_WRITEBACK_CONNECTORS	5
>  
> +/**
> + * DRM_CLIENT_CAP_LOW_POWER_MODES
> + *
> + * If set to 1, the DRM core will expose modes that support Lower Power at the
> + * potential cost of reduced fidelity. Special care must be taken by clients
> + * that work with these modes, (ex. framebuffer contents are expected to
> + * have reduced OPRs)
> + */
> +#define DRM_CLIENT_CAP_LOW_POWER_MODES	6
> +
>  /** DRM_IOCTL_SET_CLIENT_CAP ioctl argument type */
>  struct drm_set_client_cap {
>  	__u64 capability;
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 863eda048265..71137280b1e6 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -124,6 +124,8 @@ extern "C" {
>  #define  DRM_MODE_FLAG_PIC_AR_256_135 \
>  			(DRM_MODE_PICTURE_ASPECT_256_135<<19)
>  
> +#define  DRM_MODE_FLAG_LOW_POWER		(1<<23)
> +
>  #define  DRM_MODE_FLAG_ALL	(DRM_MODE_FLAG_PHSYNC |		\
>  				 DRM_MODE_FLAG_NHSYNC |		\
>  				 DRM_MODE_FLAG_PVSYNC |		\
> @@ -136,6 +138,7 @@ extern "C" {
>  				 DRM_MODE_FLAG_HSKEW |		\
>  				 DRM_MODE_FLAG_DBLCLK |		\
>  				 DRM_MODE_FLAG_CLKDIV2 |	\
> +				 DRM_MODE_FLAG_LOW_POWER |	\
>  				 DRM_MODE_FLAG_3D_MASK)
>  
>  /* DPMS flags */

Hey,

The wording seems to be a bit generic, with just the description I have no idea how to implement this in userspace, do you have an implementation as well?

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
