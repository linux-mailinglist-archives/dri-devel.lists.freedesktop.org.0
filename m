Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F15AF0CBD
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 09:38:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 940F710E308;
	Wed,  2 Jul 2025 07:38:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="GCJLlQ96";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1JCKLVk2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VWm92vTb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vxyUkx6B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0473710E308
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 07:38:32 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 641031F445;
 Wed,  2 Jul 2025 07:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751441911; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=riCapoqq0VlUAltgWjjftkGcPXlfvx7MXVrHr5p55Zw=;
 b=GCJLlQ96j767NsD+YRuCaWWiQi2EEHS4CJfMdv/EXq250TFJ1HVa77KJgU6K//9ooe6iA9
 rcbRlySnI2ynAxesDEoPTcXsUpQ9HapvVnS6MUdvyRcBbgSQRZ/6lSGYRlsY2D8UwzbI2s
 okUGTUCU01GPBb4znTuxyMEhFE/GI/E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751441911;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=riCapoqq0VlUAltgWjjftkGcPXlfvx7MXVrHr5p55Zw=;
 b=1JCKLVk2CSZbv77w2hNJwVFemFzkEfI+bEqWWUZoB3M3qnTVaAt2dFoh/50VC/h77gLTsn
 sPCnI1FbC148ZSDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751441910; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=riCapoqq0VlUAltgWjjftkGcPXlfvx7MXVrHr5p55Zw=;
 b=VWm92vTb6PuU9St9w0UT7zK6D85HKjM8oF8r9nQjZh/SUqvGqHpliVAdH3dQqrwDqMkhxp
 OQSJVFDWyQbEUZsNmI7zf3ihF4gTevwRkPmI0ziUDzcuaaU/qvz7c5tXrwRUEpJbHNpBVZ
 lHXrLs2R4IeVGIv/BJbMk8bDtct4Ohc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751441910;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=riCapoqq0VlUAltgWjjftkGcPXlfvx7MXVrHr5p55Zw=;
 b=vxyUkx6BCvyWWIPmqWmpwMLDJu/BSqWMRPfsdFbWLLQgdOoIoTOkmJRNJ2X/wkNj1d5Tp0
 CXvKxIjAPNxfPHCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1690713A24;
 Wed,  2 Jul 2025 07:38:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id V5cZBPbhZGhrPgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 02 Jul 2025 07:38:30 +0000
Message-ID: <d1a180d8-77fb-4416-8c6a-7f39315f8f0c@suse.de>
Date: Wed, 2 Jul 2025 09:38:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] drm/vkms: convert to use faux_device
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org
Cc: Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>
References: <2025070147-antics-pleat-edd2@gregkh>
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
In-Reply-To: <2025070147-antics-pleat-edd2@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCPT_COUNT_SEVEN(0.00)[11]; RCVD_TLS_ALL(0.00)[];
 ARC_NA(0.00)[]; TAGGED_RCPT(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 MID_RHS_MATCH_FROM(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[bootlin.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,lists.freedesktop.org,redhat.com];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email, suse.de:mid,
 patchwork.freedesktop.org:url, lists.freedesktop.org:email,
 imap1.dmz-prg2.suse.org:helo, ffwll.ch:email, bootlin.com:email,
 linuxfoundation.org:email, intel.com:email]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.80
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

Am 01.07.25 um 12:49 schrieb Greg Kroah-Hartman:
> The vkms driver does not need to create a platform device, as there is
> no real platform resources associated it,  it only did so because it was
> simple to do that in order to get a device to use for resource
> management of drm resources.  Change the driver to use the faux device
> instead as this is NOT a real platform device.
>
> Tested-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Melissa Wen <melissa.srw@gmail.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
> v5: - rebased against 6.16-rc4
>      - added reviewed-by and tested-by lines
>      - was somehow dropped from drm trees, resending to make sure it
>        isn't lost

Also see my comment in the vgem change. The patches will go in soon 
after "drm/gem-shmem: Do not map s/g table by default". [1] Thanks for 
the update.

Best regards
Thomas

[1] https://patchwork.freedesktop.org/series/150968/

>
> v4: - first version of the patch, was part of a larger patch series that
>        has been mostly all applied to the tree.
>
>   drivers/gpu/drm/vkms/vkms_drv.c | 28 ++++++++++++++--------------
>   drivers/gpu/drm/vkms/vkms_drv.h |  4 ++--
>   2 files changed, 16 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index a24d1655f7b8..e8472d9b6e3b 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -10,7 +10,7 @@
>    */
>   
>   #include <linux/module.h>
> -#include <linux/platform_device.h>
> +#include <linux/device/faux.h>
>   #include <linux/dma-mapping.h>
>   
>   #include <drm/clients/drm_client_setup.h>
> @@ -149,27 +149,27 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
>   static int vkms_create(struct vkms_config *config)
>   {
>   	int ret;
> -	struct platform_device *pdev;
> +	struct faux_device *fdev;
>   	struct vkms_device *vkms_device;
>   	const char *dev_name;
>   
>   	dev_name = vkms_config_get_device_name(config);
> -	pdev = platform_device_register_simple(dev_name, -1, NULL, 0);
> -	if (IS_ERR(pdev))
> -		return PTR_ERR(pdev);
> +	fdev = faux_device_create(dev_name, NULL, NULL);
> +	if (!fdev)
> +		return -ENODEV;
>   
> -	if (!devres_open_group(&pdev->dev, NULL, GFP_KERNEL)) {
> +	if (!devres_open_group(&fdev->dev, NULL, GFP_KERNEL)) {
>   		ret = -ENOMEM;
>   		goto out_unregister;
>   	}
>   
> -	vkms_device = devm_drm_dev_alloc(&pdev->dev, &vkms_driver,
> +	vkms_device = devm_drm_dev_alloc(&fdev->dev, &vkms_driver,
>   					 struct vkms_device, drm);
>   	if (IS_ERR(vkms_device)) {
>   		ret = PTR_ERR(vkms_device);
>   		goto out_devres;
>   	}
> -	vkms_device->platform = pdev;
> +	vkms_device->faux_dev = fdev;
>   	vkms_device->config = config;
>   	config->dev = vkms_device;
>   
> @@ -203,9 +203,9 @@ static int vkms_create(struct vkms_config *config)
>   	return 0;
>   
>   out_devres:
> -	devres_release_group(&pdev->dev, NULL);
> +	devres_release_group(&fdev->dev, NULL);
>   out_unregister:
> -	platform_device_unregister(pdev);
> +	faux_device_destroy(fdev);
>   	return ret;
>   }
>   
> @@ -231,19 +231,19 @@ static int __init vkms_init(void)
>   
>   static void vkms_destroy(struct vkms_config *config)
>   {
> -	struct platform_device *pdev;
> +	struct faux_device *fdev;
>   
>   	if (!config->dev) {
>   		DRM_INFO("vkms_device is NULL.\n");
>   		return;
>   	}
>   
> -	pdev = config->dev->platform;
> +	fdev = config->dev->faux_dev;
>   
>   	drm_dev_unregister(&config->dev->drm);
>   	drm_atomic_helper_shutdown(&config->dev->drm);
> -	devres_release_group(&pdev->dev, NULL);
> -	platform_device_unregister(pdev);
> +	devres_release_group(&fdev->dev, NULL);
> +	faux_device_destroy(fdev);
>   
>   	config->dev = NULL;
>   }
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index a74a7fc3a056..5a46016e1890 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -197,13 +197,13 @@ struct vkms_config;
>    * struct vkms_device - Description of a VKMS device
>    *
>    * @drm - Base device in DRM
> - * @platform - Associated platform device
> + * @faux_dev - Associated faux device
>    * @output - Configuration and sub-components of the VKMS device
>    * @config: Configuration used in this VKMS device
>    */
>   struct vkms_device {
>   	struct drm_device drm;
> -	struct platform_device *platform;
> +	struct faux_device *faux_dev;
>   	const struct vkms_config *config;
>   };
>   

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

