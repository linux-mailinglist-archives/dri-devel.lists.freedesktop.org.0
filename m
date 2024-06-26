Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E339184A4
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 16:43:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88FFA10E8E0;
	Wed, 26 Jun 2024 14:43:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="BNgNNh09";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="p9jvFE6y";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YIatmv/p";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="r1noKhJz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5325A10E2CB;
 Wed, 26 Jun 2024 14:43:18 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 73E031FB5C;
 Wed, 26 Jun 2024 14:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1719412996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=V2PRcsaRZQeSJLSrUbeR75m0IOIxxXlKKX0TYw9wUW0=;
 b=BNgNNh091JnO0f5ChUI4NqtzyH+7sAAk8nk6zU47sAGzh+Fa98iiBu5muCiNvrsN/WaDcD
 3JHSblJQ45tfdn1014jwvcEdcX3t+odxTm0rpt1dLG6GJzAKhPvbe9ZNsexXR0rUGGnCsw
 4d+0SoI8SUBq2PSMlHdBwfIRizzSkqU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1719412996;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=V2PRcsaRZQeSJLSrUbeR75m0IOIxxXlKKX0TYw9wUW0=;
 b=p9jvFE6y39kg7R045roU/dHfbIVW4CkVXLH/KWZ8FcB0Dz9hEqUsGIW77sQoHMSf3Id9ek
 09fNEkwjRu7AkKBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1719412995; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=V2PRcsaRZQeSJLSrUbeR75m0IOIxxXlKKX0TYw9wUW0=;
 b=YIatmv/pBAY6RohOA+3whraK/xU007HprNhKczPMgRE4w4YhaDE3kIj78pXwAxvKQr0LzP
 yAvI98cxBnH0/21KulCpHgonRnnENNAs2kxckUCwOWkbJ8r6wX7hbP5Byc5sqnwuntZAJs
 vO5zBS9pQ4lPCRDvAcpBIBabQXvhRQ4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1719412995;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=V2PRcsaRZQeSJLSrUbeR75m0IOIxxXlKKX0TYw9wUW0=;
 b=r1noKhJz96i/TmHuHzbhExrlmTmiUup4xQDX/Ntwp6gSh15ZstfkoijGatCjcnZlMXf9Hb
 WDOgHXgmg8qhObCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 61CC4139C2;
 Wed, 26 Jun 2024 14:43:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id BHkzFgIpfGb+WQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 26 Jun 2024 14:43:14 +0000
Message-ID: <1cff31c5-766a-4b17-a7b2-a523253b0a2e@suse.de>
Date: Wed, 26 Jun 2024 16:43:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] drm/radeon: remove load callback
To: Wu Hoi Pok <wuhoipok@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240624151122.23724-1-wuhoipok@gmail.com>
 <20240624151122.23724-2-wuhoipok@gmail.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20240624151122.23724-2-wuhoipok@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: -4.29
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.29 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_TO(0.00)[gmail.com]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[9]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
 MID_RHS_MATCH_FROM(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[radeon_device.dev:url,
 imap1.dmz-prg2.suse.org:helo]
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

Hi

Am 24.06.24 um 17:10 schrieb Wu Hoi Pok:
> Remove ".load" callback form "kms_driver", and move "struct drm_device"
> into radeon_device. Patch 2 to 7 follows up with changing the way of
> accessing drm_device, from "rdev->ddev" to "rdev_to_drm(rdev)" which is
> "&rdev->ddev".

This is not going to build, so it cannot go in.

This should be the final patch. First add rdev_to_drm() and convert the 
driver to use it (that's one patch). Then change radeon_device.dev from 
a pointer to a value in a second patch.

Best regards
Thomas


>
> Signed-off-by: Wu Hoi Pok <wuhoipok@gmail.com>
> ---
>   drivers/gpu/drm/radeon/radeon.h     | 11 ++++++++---
>   drivers/gpu/drm/radeon/radeon_drv.c | 27 ++++++++++++++++++---------
>   drivers/gpu/drm/radeon/radeon_drv.h |  1 -
>   drivers/gpu/drm/radeon/radeon_kms.c | 18 ++++++------------
>   4 files changed, 32 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
> index 0999c8eaae94..69bb30ced189 100644
> --- a/drivers/gpu/drm/radeon/radeon.h
> +++ b/drivers/gpu/drm/radeon/radeon.h
> @@ -2297,7 +2297,7 @@ typedef void (*radeon_wreg_t)(struct radeon_device*, uint32_t, uint32_t);
>   
>   struct radeon_device {
>   	struct device			*dev;
> -	struct drm_device		*ddev;
> +	struct drm_device		ddev;
>   	struct pci_dev			*pdev;
>   #ifdef __alpha__
>   	struct pci_controller		*hose;
> @@ -2440,10 +2440,13 @@ struct radeon_device {
>   	u64 gart_pin_size;
>   };
>   
> +static inline struct drm_device *rdev_to_drm(struct radeon_device *rdev)
> +{
> +	return &rdev->ddev;
> +}
> +
>   bool radeon_is_px(struct drm_device *dev);
>   int radeon_device_init(struct radeon_device *rdev,
> -		       struct drm_device *ddev,
> -		       struct pci_dev *pdev,
>   		       uint32_t flags);
>   void radeon_device_fini(struct radeon_device *rdev);
>   int radeon_gpu_wait_for_idle(struct radeon_device *rdev);
> @@ -2818,6 +2821,8 @@ struct radeon_device *radeon_get_rdev(struct ttm_device *bdev);
>   
>   /* KMS */
>   
> +int radeon_driver_load_kms(struct radeon_device *dev, unsigned long flags);
> +
>   u32 radeon_get_vblank_counter_kms(struct drm_crtc *crtc);
>   int radeon_enable_vblank_kms(struct drm_crtc *crtc);
>   void radeon_disable_vblank_kms(struct drm_crtc *crtc);
> diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
> index 7bf08164140e..ae9cadceba83 100644
> --- a/drivers/gpu/drm/radeon/radeon_drv.c
> +++ b/drivers/gpu/drm/radeon/radeon_drv.c
> @@ -259,7 +259,8 @@ static int radeon_pci_probe(struct pci_dev *pdev,
>   			    const struct pci_device_id *ent)
>   {
>   	unsigned long flags = 0;
> -	struct drm_device *dev;
> +	struct drm_device *ddev;
> +	struct radeon_device *rdev;
>   	int ret;
>   
>   	if (!ent)
> @@ -300,28 +301,37 @@ static int radeon_pci_probe(struct pci_dev *pdev,
>   	if (ret)
>   		return ret;
>   
> -	dev = drm_dev_alloc(&kms_driver, &pdev->dev);
> -	if (IS_ERR(dev))
> -		return PTR_ERR(dev);
> +	rdev = devm_drm_dev_alloc(&pdev->dev, &kms_driver, typeof(*rdev), ddev);
> +	if (IS_ERR(rdev))
> +		return PTR_ERR(rdev);
> +
> +	rdev->dev  = &pdev->dev;
> +	rdev->pdev = pdev;
> +	ddev = rdev_to_drm(rdev);
> +	ddev->dev_private = rdev;
>   
>   	ret = pci_enable_device(pdev);
>   	if (ret)
>   		goto err_free;
>   
> -	pci_set_drvdata(pdev, dev);
> +	pci_set_drvdata(pdev, ddev);
> +
> +	ret = radeon_driver_load_kms(rdev, flags);
> +	if (ret)
> +		goto err_agp;
>   
> -	ret = drm_dev_register(dev, ent->driver_data);
> +	ret = drm_dev_register(ddev, flags);
>   	if (ret)
>   		goto err_agp;
>   
> -	radeon_fbdev_setup(dev->dev_private);
> +	radeon_fbdev_setup(ddev->dev_private);
>   
>   	return 0;
>   
>   err_agp:
>   	pci_disable_device(pdev);
>   err_free:
> -	drm_dev_put(dev);
> +	drm_dev_put(ddev);
>   	return ret;
>   }
>   
> @@ -569,7 +579,6 @@ static const struct drm_ioctl_desc radeon_ioctls_kms[] = {
>   static const struct drm_driver kms_driver = {
>   	.driver_features =
>   	    DRIVER_GEM | DRIVER_RENDER | DRIVER_MODESET,
> -	.load = radeon_driver_load_kms,
>   	.open = radeon_driver_open_kms,
>   	.postclose = radeon_driver_postclose_kms,
>   	.unload = radeon_driver_unload_kms,
> diff --git a/drivers/gpu/drm/radeon/radeon_drv.h b/drivers/gpu/drm/radeon/radeon_drv.h
> index 02a65971d140..6c1eb75a951b 100644
> --- a/drivers/gpu/drm/radeon/radeon_drv.h
> +++ b/drivers/gpu/drm/radeon/radeon_drv.h
> @@ -117,7 +117,6 @@
>   long radeon_drm_ioctl(struct file *filp,
>   		      unsigned int cmd, unsigned long arg);
>   
> -int radeon_driver_load_kms(struct drm_device *dev, unsigned long flags);
>   void radeon_driver_unload_kms(struct drm_device *dev);
>   int radeon_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv);
>   void radeon_driver_postclose_kms(struct drm_device *dev,
> diff --git a/drivers/gpu/drm/radeon/radeon_kms.c b/drivers/gpu/drm/radeon/radeon_kms.c
> index a16590c6247f..d2df194393af 100644
> --- a/drivers/gpu/drm/radeon/radeon_kms.c
> +++ b/drivers/gpu/drm/radeon/radeon_kms.c
> @@ -91,7 +91,7 @@ void radeon_driver_unload_kms(struct drm_device *dev)
>   /**
>    * radeon_driver_load_kms - Main load function for KMS.
>    *
> - * @dev: drm dev pointer
> + * @rdev: radeon dev pointer
>    * @flags: device flags
>    *
>    * This is the main load function for KMS (all asics).
> @@ -101,24 +101,18 @@ void radeon_driver_unload_kms(struct drm_device *dev)
>    * (crtcs, encoders, hotplug detect, etc.).
>    * Returns 0 on success, error on failure.
>    */
> -int radeon_driver_load_kms(struct drm_device *dev, unsigned long flags)
> +int radeon_driver_load_kms(struct radeon_device *rdev, unsigned long flags)
>   {
> -	struct pci_dev *pdev = to_pci_dev(dev->dev);
> -	struct radeon_device *rdev;
> +	struct pci_dev *pdev = rdev->pdev;
> +	struct drm_device *dev = rdev_to_drm(rdev);
>   	int r, acpi_status;
>   
> -	rdev = kzalloc(sizeof(struct radeon_device), GFP_KERNEL);
> -	if (rdev == NULL) {
> -		return -ENOMEM;
> -	}
> -	dev->dev_private = (void *)rdev;
> -
>   #ifdef __alpha__
>   	rdev->hose = pdev->sysdata;
>   #endif
>   
>   	if (pci_find_capability(pdev, PCI_CAP_ID_AGP))
> -		rdev->agp = radeon_agp_head_init(dev);
> +		rdev->agp = radeon_agp_head_init(rdev_to_drm(rdev));
>   	if (rdev->agp) {
>   		rdev->agp->agp_mtrr = arch_phys_wc_add(
>   			rdev->agp->agp_info.aper_base,
> @@ -147,7 +141,7 @@ int radeon_driver_load_kms(struct drm_device *dev, unsigned long flags)
>   	 * properly initialize the GPU MC controller and permit
>   	 * VRAM allocation
>   	 */
> -	r = radeon_device_init(rdev, dev, pdev, flags);
> +	r = radeon_device_init(rdev, flags);
>   	if (r) {
>   		dev_err(dev->dev, "Fatal error during GPU init\n");
>   		goto out;

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

