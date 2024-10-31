Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 170FF9B82BD
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 19:43:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB9510E90D;
	Thu, 31 Oct 2024 18:43:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="puFaYlxX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E309710E90D
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 18:43:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 62BA2FF805;
 Thu, 31 Oct 2024 18:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1730400197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VsTHOm+NWP4BjSQVtsW8n2E1wPttB+19xqsC8SoC5nU=;
 b=puFaYlxXCiq9fLS4yVt0sYr7svq8GEuGKgCqab46unRHyuCepv/eDBk2aOlCuY41Bzkr5s
 68IILRex1aQxMiPcx73+Vm0/cT5vhF1BNHlfJhaowJ4hpgTk3fP0lYS5pP7cKkMgTI8fQ0
 sv58ZAuaT2e3SH5QB5k6oi84ji1RkSkxVOz/HbgBvRyLGqt1v9VAFljYyqb+NA9UoCy3S9
 iS+IkxWZkM3Riv31fi+I0D39Rjn9ciqXS4UIy/fcggCKskh22pJcmS8DjWYR2Cnw8zgeHW
 qF6sDDF63oWZ2qRDdGEmZs/OPQhVnpJeA2fceFO6U+5zDn9FSh7NsAC2storug==
Date: Thu, 31 Oct 2024 19:43:15 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/vkms: Drop unnecessary call to drm_crtc_cleanup()
Message-ID: <ZyPPw6m827Ef1_eQ@louis-chauvet-laptop>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?=
 <jose.exposito89@gmail.com>, 
 hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241031183835.3633-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241031183835.3633-1-jose.exposito89@gmail.com>
X-GND-Sasl: louis.chauvet@bootlin.com
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

On 31/10/24 - 19:38, José Expósito wrote:
> CRTC creation uses drmm_crtc_init_with_planes(), which automatically
> handles cleanup. However, an unnecessary call to drm_crtc_cleanup() is
> still present in the vkms_output_init() error path.

Thanks!

I discussed about this with Maíra on Monday, I agree with this patch!

I will test your patch next week (checkpatch, sparse, CI) before adding
my Acked-by. One less cleanup line in configFS work, thanks!

Thanks,
Louis Chauvet
 
> Fixes: 99cc528ebe92 ("drm/vkms: Use drmm_crtc_init_with_planes()")
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> ---
>  drivers/gpu/drm/vkms/vkms_output.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index 0a5a185aa0b0..25a99fde126c 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -92,7 +92,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
>  				 DRM_MODE_CONNECTOR_VIRTUAL);
>  	if (ret) {
>  		DRM_ERROR("Failed to init connector\n");
> -		goto err_connector;
> +		return ret;
>  	}
>  
>  	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
> @@ -131,8 +131,5 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
>  err_encoder:
>  	drm_connector_cleanup(connector);
>  
> -err_connector:
> -	drm_crtc_cleanup(crtc);
> -
>  	return ret;
>  }
> -- 
> 2.47.0
> 
