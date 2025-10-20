Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F456BF1D38
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 16:24:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A904710E456;
	Mon, 20 Oct 2025 14:24:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="DimUY5VD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+2nq8rFC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Aw68WIq7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0+J6D6TT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E3BA10E456
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 14:24:39 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D916A211B1;
 Mon, 20 Oct 2025 14:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760970274; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=DXu6Oiv5TScLPN1GMCbKMCa/lnAdU4Wi1ZJPc3fb6As=;
 b=DimUY5VD6C0avRjvRdC2m670pw5mn8svhq9vSciojMG7BTpEkKSyU9FyWpjtou9ecQZ9ct
 lDwQyMBa6o8FT5w2jO1yuDLW5FGBzsGNaGsm3Avm7FJYMwkmsks3A2azucw81a/W74g4h7
 TdcmynYfb3bN6Xfl7fwCe3umjn9hGC0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760970274;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=DXu6Oiv5TScLPN1GMCbKMCa/lnAdU4Wi1ZJPc3fb6As=;
 b=+2nq8rFCOns8Qsp+J/q5F6oa3CHslL4d4uFK5W/tUypjTEExrxzDvv/JedrJzBuznAaoiT
 2jDcmAdQ+fOmuwDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760970269; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=DXu6Oiv5TScLPN1GMCbKMCa/lnAdU4Wi1ZJPc3fb6As=;
 b=Aw68WIq7F0uxTZnpKyqixo26r4fcK4SCtKtFyRQAF0IxnStW36r9iG92KV5O7ysGvnJnFu
 q/xgV9iv1WY8qYYu/QJ6qezFuA87llnyuNZzLTbNm3vNjDGotTOQ+kEwLl+0QCtgBDvj3C
 EEKpyBTliogpUv5jTcQfuQQHiXEc8m8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760970269;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=DXu6Oiv5TScLPN1GMCbKMCa/lnAdU4Wi1ZJPc3fb6As=;
 b=0+J6D6TT2ttLnqw+zMLnwW3a9RA0N4ed0ZigAoKTf+NX3rBh6pKWYrb7D6Bj2A751S6S3p
 EOR1Z6D0e53DevBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9ED5A13A8E;
 Mon, 20 Oct 2025 14:24:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id dds6JR1G9mgfHwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 20 Oct 2025 14:24:29 +0000
Message-ID: <d6cdfa19-688e-4169-ab30-d71335caee35@suse.de>
Date: Mon, 20 Oct 2025 16:24:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/gud: rearrange gud_probe() to prepare for function
 splitting
To: Ruben Wauters <rubenru09@aol.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251020140147.5017-1-rubenru09.ref@aol.com>
 <20251020140147.5017-1-rubenru09@aol.com>
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
In-Reply-To: <20251020140147.5017-1-rubenru09@aol.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[aol.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[7]; MIME_TRACE(0.00)[0:+];
 MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[aol.com,gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email, suse.de:mid,
 imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -4.30
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

Hi,

looks good.

Am 20.10.25 um 15:56 schrieb Ruben Wauters:
> gud_probe() is currently very large and does many things, including
> pipeline setup and feature detection, as well as having USB functions.
>
> This patch re-orders the code in gud_probe() to make it more organised
> and easier to split apart in the future.
>
> Signed-off-by: Ruben Wauters <rubenru09@aol.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

If I'm not mistaken, you should by now have commit rights to the 
drm-misc repo. Give it a few more days for others to review and if 
nothing comes in, you're welcome to merge the patch into drm-misc-next.

Best regards
Thomas


> ---
> Changelog:
>
> v2
> - rename gud_get_properties to gud_plane_add_properties and move
>    function call to proper location
> - move usb_set_intfdata and block with dma setup to just under gdrm init
> - add proper spacing for init comments
> ---
>   drivers/gpu/drm/gud/gud_drv.c | 45 +++++++++++++++++++----------------
>   1 file changed, 24 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
> index b7345c8d823d..42135a48d92e 100644
> --- a/drivers/gpu/drm/gud/gud_drv.c
> +++ b/drivers/gpu/drm/gud/gud_drv.c
> @@ -249,7 +249,7 @@ int gud_usb_set_u8(struct gud_device *gdrm, u8 request, u8 val)
>   	return gud_usb_set(gdrm, request, 0, &val, sizeof(val));
>   }
>   
> -static int gud_get_properties(struct gud_device *gdrm)
> +static int gud_plane_add_properties(struct gud_device *gdrm)
>   {
>   	struct gud_property_req *properties;
>   	unsigned int i, num_properties;
> @@ -463,10 +463,6 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
>   		return PTR_ERR(gdrm);
>   
>   	drm = &gdrm->drm;
> -	drm->mode_config.funcs = &gud_mode_config_funcs;
> -	ret = drmm_mode_config_init(drm);
> -	if (ret)
> -		return ret;
>   
>   	gdrm->flags = le32_to_cpu(desc.flags);
>   	gdrm->compression = desc.compression & GUD_COMPRESSION_LZ4;
> @@ -483,11 +479,28 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
>   	if (ret)
>   		return ret;
>   
> +	usb_set_intfdata(intf, gdrm);
> +
> +	dma_dev = usb_intf_get_dma_device(intf);
> +	if (dma_dev) {
> +		drm_dev_set_dma_dev(drm, dma_dev);
> +		put_device(dma_dev);
> +	} else {
> +		dev_warn(dev, "buffer sharing not supported"); /* not an error */
> +	}
> +
> +	/* Mode config init */
> +	ret = drmm_mode_config_init(drm);
> +	if (ret)
> +		return ret;
> +
>   	drm->mode_config.min_width = le32_to_cpu(desc.min_width);
>   	drm->mode_config.max_width = le32_to_cpu(desc.max_width);
>   	drm->mode_config.min_height = le32_to_cpu(desc.min_height);
>   	drm->mode_config.max_height = le32_to_cpu(desc.max_height);
> +	drm->mode_config.funcs = &gud_mode_config_funcs;
>   
> +	/* Format init */
>   	formats_dev = devm_kmalloc(dev, GUD_FORMATS_MAX_NUM, GFP_KERNEL);
>   	/* Add room for emulated XRGB8888 */
>   	formats = devm_kmalloc_array(dev, GUD_FORMATS_MAX_NUM + 1, sizeof(*formats), GFP_KERNEL);
> @@ -587,6 +600,7 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
>   			return -ENOMEM;
>   	}
>   
> +	/* Pipeline init */
>   	ret = drm_universal_plane_init(drm, &gdrm->plane, 0,
>   				       &gud_plane_funcs,
>   				       formats, num_formats,
> @@ -598,12 +612,9 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
>   	drm_plane_helper_add(&gdrm->plane, &gud_plane_helper_funcs);
>   	drm_plane_enable_fb_damage_clips(&gdrm->plane);
>   
> -	devm_kfree(dev, formats);
> -	devm_kfree(dev, formats_dev);
> -
> -	ret = gud_get_properties(gdrm);
> +	ret = gud_plane_add_properties(gdrm);
>   	if (ret) {
> -		dev_err(dev, "Failed to get properties (error=%d)\n", ret);
> +		dev_err(dev, "Failed to add properties (error=%d)\n", ret);
>   		return ret;
>   	}
>   
> @@ -621,16 +632,7 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
>   	}
>   
>   	drm_mode_config_reset(drm);
> -
> -	usb_set_intfdata(intf, gdrm);
> -
> -	dma_dev = usb_intf_get_dma_device(intf);
> -	if (dma_dev) {
> -		drm_dev_set_dma_dev(drm, dma_dev);
> -		put_device(dma_dev);
> -	} else {
> -		dev_warn(dev, "buffer sharing not supported"); /* not an error */
> -	}
> +	drm_kms_helper_poll_init(drm);
>   
>   	drm_debugfs_add_file(drm, "stats", gud_stats_debugfs, NULL);
>   
> @@ -638,7 +640,8 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
>   	if (ret)
>   		return ret;
>   
> -	drm_kms_helper_poll_init(drm);
> +	devm_kfree(dev, formats);
> +	devm_kfree(dev, formats_dev);
>   
>   	drm_client_setup(drm, NULL);
>   

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


