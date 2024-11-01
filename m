Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE4E9B8E89
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 11:04:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C357F10E42C;
	Fri,  1 Nov 2024 10:04:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="jJpaPK5J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5EC310E42C
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2024 10:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KcBKVA3P3us9yCSAuJYdZ3kBwWfL0seMrbogM04O8Bg=; b=jJpaPK5JS4X/e2ThD4y/L/sODr
 vTK/YJ6Q1MnGr1zzKEfLRdtfmxXSYeEzJOFj0andOXWnxjJ7SoUvFA7RwOCIxOpYvB5Pkj6ZZyd0Z
 vOg95kwf0Rf0vzAJekmpddSQbSpmd5idyLqhWMFURUzXmkYcMJ/TiZwLfymk0yauU8HAll0MsOC+k
 HbvsyQ6NJt/+vQp+Kr+exmMwZIFopGky8Bd8itb8oMrIF4T01Um56TrRzH5QAZ3HiXfcZE+FwLh4I
 nvH2ePTExByl3kMY9z7VOPzvnfCjQpHwyM0Ve4jOlVs8S435Lpfk1aH/l548xy2RD1K7cDSVcFEKJ
 qZBaWsIQ==;
Received: from [187.36.213.55] (helo=[192.168.1.103])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1t6oVy-000O9S-3P; Fri, 01 Nov 2024 11:04:22 +0100
Message-ID: <3a433ba3-2c61-45ac-9204-62216677c23d@igalia.com>
Date: Fri, 1 Nov 2024 07:04:13 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/vkms: Drop unnecessary call to drm_crtc_cleanup()
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20241031183835.3633-1-jose.exposito89@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20241031183835.3633-1-jose.exposito89@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi José,

On 31/10/24 15:38, José Expósito wrote:
> CRTC creation uses drmm_crtc_init_with_planes(), which automatically
> handles cleanup. However, an unnecessary call to drm_crtc_cleanup() is
> still present in the vkms_output_init() error path.
> 
> Fixes: 99cc528ebe92 ("drm/vkms: Use drmm_crtc_init_with_planes()")
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra

> ---
>   drivers/gpu/drm/vkms/vkms_output.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index 0a5a185aa0b0..25a99fde126c 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -92,7 +92,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
>   				 DRM_MODE_CONNECTOR_VIRTUAL);
>   	if (ret) {
>   		DRM_ERROR("Failed to init connector\n");
> -		goto err_connector;
> +		return ret;
>   	}
>   
>   	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
> @@ -131,8 +131,5 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
>   err_encoder:
>   	drm_connector_cleanup(connector);
>   
> -err_connector:
> -	drm_crtc_cleanup(crtc);
> -
>   	return ret;
>   }

