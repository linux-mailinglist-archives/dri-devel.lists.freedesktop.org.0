Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4009D8E9F
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 23:39:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0320810E0A8;
	Mon, 25 Nov 2024 22:39:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="dtT3Yhja";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A6A510E0A8
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 22:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WROCxlqoiJhEeQ478LkOeAF+oZmjtSUJgu3DBXtMWmM=; b=dtT3Yhja8j2ccplALLWMHelaK2
 Ewqx9LdpUQEuP9wOvLvQYx1qhejBljV1p2Qy5dobGKVMuT9x2DaD8BmtmkXrZIOzTpBNA1HGKQ7sL
 0in7rYf2nKIaVaU2epY38wobjYNT8NgEfD/9sYLorFeyanjbEysKd51eTfJjF1BNg9Cdl0vfaFWoP
 tN2s6NQD00TDvH+4Hc6aIJ3uLbSrGVC3KVk8knk1F2k7/vEUmHL3w7AjKCsDGYlHqphGv2CLUvnxT
 54wSdgC7UeHZghq1v9m4fvjoCfjVEZPoKr3EC+h1T3qfMPBfGDLWXpn7qyMM/sdZcs705uEVldjIZ
 kndQ8aEw==;
Received: from [187.36.213.55] (helo=[192.168.1.103])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tFhjn-00Ct0k-B9; Mon, 25 Nov 2024 23:39:23 +0100
Message-ID: <ffce2bf6-543b-4489-9e81-d6e76025035c@igalia.com>
Date: Mon, 25 Nov 2024 19:39:14 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] drm/vkms: Switch to managed for crtc
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, nicolejadeyee@google.com
References: <20241122-google-vkms-managed-v5-0-1ab60403e960@bootlin.com>
 <20241122-google-vkms-managed-v5-3-1ab60403e960@bootlin.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20241122-google-vkms-managed-v5-3-1ab60403e960@bootlin.com>
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

Hi Louis,

On 22/11/24 13:27, Louis Chauvet wrote:
> The current VKMS driver uses managed function to create crtc, but
> don't use it to properly clean the crtc workqueue. It is not an
> issue yet, but in order to support multiple devices easily,
> convert this code to use drm and device managed helpers.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
 > --->   drivers/gpu/drm/vkms/vkms_crtc.c | 14 ++++++++++++++
>   drivers/gpu/drm/vkms/vkms_drv.c  |  9 ---------
>   2 files changed, 14 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> index 28a57ae109fcc05af3fe74f94518c462c09119e3..ace8d293f7da611110c1e117b6cf2f3c9e9b4381 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -6,6 +6,7 @@
>   #include <drm/drm_atomic_helper.h>
>   #include <drm/drm_probe_helper.h>
>   #include <drm/drm_vblank.h>
> +#include <drm/drm_managed.h>
>   
>   #include "vkms_drv.h"
>   
> @@ -270,6 +271,14 @@ static const struct drm_crtc_helper_funcs vkms_crtc_helper_funcs = {
>   	.atomic_disable	= vkms_crtc_atomic_disable,
>   };
>   
> +static void vkms_crtc_destroy_workqueue(struct drm_device *dev,
> +					void *raw_vkms_out)
> +{
> +	struct vkms_output *vkms_out = raw_vkms_out;
> +
> +	destroy_workqueue(vkms_out->composer_workq);
> +}
> +
>   int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
>   		   struct drm_plane *primary, struct drm_plane *cursor)
>   {
> @@ -300,5 +309,10 @@ int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
>   	if (!vkms_out->composer_workq)
>   		return -ENOMEM;
>   
> +	ret = drmm_add_action_or_reset(dev, vkms_crtc_destroy_workqueue,
> +				       vkms_out);
> +	if (ret)
> +		return ret;
> +

Small nit: no need for `if (ret)` here. Anyway,

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra

>   	return ret;
>   }
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index fa3331f612e34e0a48cef34effc169dea46d77df..c54504e590a18ae8af07cc1cc48179c38c4e6c0f 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -54,14 +54,6 @@ MODULE_PARM_DESC(enable_overlay, "Enable/Disable overlay support");
>   
>   DEFINE_DRM_GEM_FOPS(vkms_driver_fops);
>   
> -static void vkms_release(struct drm_device *dev)
> -{
> -	struct vkms_device *vkms = drm_device_to_vkms_device(dev);
> -
> -	if (vkms->output.composer_workq)
> -		destroy_workqueue(vkms->output.composer_workq);
> -}
> -
>   static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
>   {
>   	struct drm_device *dev = old_state->dev;
> @@ -109,7 +101,6 @@ static const struct drm_debugfs_info vkms_config_debugfs_list[] = {
>   
>   static const struct drm_driver vkms_driver = {
>   	.driver_features	= DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_GEM,
> -	.release		= vkms_release,
>   	.fops			= &vkms_driver_fops,
>   	DRM_GEM_SHMEM_DRIVER_OPS,
>   	DRM_FBDEV_SHMEM_DRIVER_OPS,
> 

