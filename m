Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4387D6DF79E
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 15:48:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 052EF10E7EC;
	Wed, 12 Apr 2023 13:48:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D8DF10E7EC
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 13:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EaF+IRHMeKaDW7N5a2FpFMZwuLFcLlvfJIbEB4VtUE8=; b=V2G/cSYLDmTFOzRruuW6F0GF8z
 YGpSkBvB7iX9Kg3SRLxAqPYTAy7KCbE1UdRCyM/FRjUBRHFt9+7EiUvdpYLF0MJw7yUl0QKOjNoJK
 0DBZ+wbAayLX+vKNfWrdjrLzXqJW/GGHwlJkcF8vPIQ6TmCz41e9j/xFehpZMyRJ+3STV/MJ8A/pe
 CpmJr4WmzcNT/0Z3iN9zpeXeaVn6u/zIipq7R81uVdeSIckvfuheUP7WxJW+KZczOE3MljBiUb/ws
 rsPHcf8ukUH5x6brBo53PX5CFLqKRPtnJmlNXpoazJpjkQ1MhiCOBh8T2NxjH+yyzfk58SqtuqjkX
 5VP40oaw==;
Received: from [177.34.168.16] (helo=[192.168.0.4])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pmapK-00Gr2n-Un; Wed, 12 Apr 2023 15:47:59 +0200
Message-ID: <4e697e1c-03ef-bc7a-d122-b85eaa54a46d@igalia.com>
Date: Wed, 12 Apr 2023 10:47:50 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 1/2] drm/vkms: Use drmm_crtc_init_with_planes()
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
References: <20230116205800.1266227-1-mcanal@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20230116205800.1266227-1-mcanal@igalia.com>
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
Cc: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/16/23 17:58, Maíra Canal wrote:
> Use drmm_crtc_init_with_planes() instead of drm_crtc_init_with_planes()
> to get rid of the explicit destroy hook in struct drm_crtc_funcs.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

Pushed to drm-misc (drm-misc-next).

Best Regards,
- Maíra Canal

> ---
>   drivers/gpu/drm/vkms/vkms_crtc.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> index 57bbd32e9beb..515f6772b866 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -161,7 +161,6 @@ static void vkms_atomic_crtc_reset(struct drm_crtc *crtc)
>   
>   static const struct drm_crtc_funcs vkms_crtc_funcs = {
>   	.set_config             = drm_atomic_helper_set_config,
> -	.destroy                = drm_crtc_cleanup,
>   	.page_flip              = drm_atomic_helper_page_flip,
>   	.reset                  = vkms_atomic_crtc_reset,
>   	.atomic_duplicate_state = vkms_atomic_crtc_duplicate_state,
> @@ -282,8 +281,8 @@ int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
>   	struct vkms_output *vkms_out = drm_crtc_to_vkms_output(crtc);
>   	int ret;
>   
> -	ret = drm_crtc_init_with_planes(dev, crtc, primary, cursor,
> -					&vkms_crtc_funcs, NULL);
> +	ret = drmm_crtc_init_with_planes(dev, crtc, primary, cursor,
> +					 &vkms_crtc_funcs, NULL);
>   	if (ret) {
>   		DRM_ERROR("Failed to init CRTC\n");
>   		return ret;
