Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C832AE1970
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 13:01:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA42410EB43;
	Fri, 20 Jun 2025 11:01:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="DtFCICrf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TMJLbxT0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LgNWGdYK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0vt0H32l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CA5910EB4A
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 11:01:26 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B371F1F38D;
 Fri, 20 Jun 2025 11:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750417284; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=rS40jZFiDpkw75Neq1Zu1fmqKj0S511i6aJ2qFu8IE0=;
 b=DtFCICrf6K7PVKzNvhmithFJw+CXmOENLM3f4gWD3MNEjrWIh5HzRaaoXopukgUYABVWW5
 29/BFiZz+5bgwu+VgknshnaorZJ0xyBFwZDtesIFincKJtqdi5XHUD4yQNeM04/4clj5Y6
 lJDcnhi7Aqyuk92KoHZMNQ9tuTXeJAw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750417284;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=rS40jZFiDpkw75Neq1Zu1fmqKj0S511i6aJ2qFu8IE0=;
 b=TMJLbxT0t3gpve1iekrnidQTDxmbuB0dASwn/a5+ffgFTdgvVBrTgI0dTvdGc0evnJ7f3n
 jJ3QV2gZDA731FBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750417283; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=rS40jZFiDpkw75Neq1Zu1fmqKj0S511i6aJ2qFu8IE0=;
 b=LgNWGdYKfnjSYNlL984+zcn4gVvqBH3fYhdWhFzSmY7znim7dCdfzJiKSjhTlpKwF++wvl
 dwaQqtl5fYftQG4iLWpc+Eh8PidcquekWLR49gAuwhBnIams5NTewROkmVNg/vDtvUslMj
 4WgngR1PQJjESw8sl9VBSSioAnqqLik=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750417283;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=rS40jZFiDpkw75Neq1Zu1fmqKj0S511i6aJ2qFu8IE0=;
 b=0vt0H32lfCVmL0tUExIxditv7B2Z7evOEFU/NVJ4Nykozqi9gibzj6rRJqnr3jM4m9B4Vr
 NEOq0kV3kWUGSuCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 57C24136BA;
 Fri, 20 Jun 2025 11:01:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +y3VE4M/VWgJDwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 20 Jun 2025 11:01:23 +0000
Message-ID: <95f59f54-0f7b-4268-8811-ccc4af565368@suse.de>
Date: Fri, 20 Jun 2025 13:01:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/sysfb: simpledrm: Add support for interconnect
 paths
To: Luca Weiss <luca.weiss@fairphone.com>, Hans de Goede
 <hdegoede@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>, Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250620-simple-drm-fb-icc-v1-0-d92142e8f74f@fairphone.com>
 <20250620-simple-drm-fb-icc-v1-2-d92142e8f74f@fairphone.com>
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
In-Reply-To: <20250620-simple-drm-fb-icc-v1-2-d92142e8f74f@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[fairphone.com,redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,gmx.de];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[15];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]; RCVD_TLS_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TAGGED_RCPT(0.00)[dt];
 MID_RHS_MATCH_FROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:email,
 imap1.dmz-prg2.suse.org:helo, suse.de:mid]
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

Am 20.06.25 um 12:31 schrieb Luca Weiss:
> Some devices might require keeping an interconnect path alive so that
> the framebuffer continues working. Add support for that by setting the
> bandwidth requirements appropriately for all provided interconnect
> paths.
>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   drivers/gpu/drm/sysfb/simpledrm.c | 83 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 83 insertions(+)
>
> diff --git a/drivers/gpu/drm/sysfb/simpledrm.c b/drivers/gpu/drm/sysfb/simpledrm.c
> index a1c3119330deffc9e122b83941f3697e5b87f277..9643f7c1734ab558d52779d7c45465dbe1d85762 100644
> --- a/drivers/gpu/drm/sysfb/simpledrm.c
> +++ b/drivers/gpu/drm/sysfb/simpledrm.c
> @@ -9,6 +9,7 @@
>   #include <linux/platform_device.h>
>   #include <linux/pm_domain.h>
>   #include <linux/regulator/consumer.h>
> +#include <linux/interconnect.h>

Alphabetical sorting please.

Apart from this nitpick, the patch looks good. For the update:

Reviewed-by: Thomas Zimmermann <tzimmermann>

Best regards
Thomas

>   
>   #include <drm/clients/drm_client_setup.h>
>   #include <drm/drm_atomic.h>
> @@ -225,6 +226,10 @@ struct simpledrm_device {
>   	struct device **pwr_dom_devs;
>   	struct device_link **pwr_dom_links;
>   #endif
> +#if defined CONFIG_OF && defined CONFIG_INTERCONNECT
> +	unsigned int icc_count;
> +	struct icc_path **icc_paths;
> +#endif
>   
>   	/* modesetting */
>   	u32 formats[DRM_SYSFB_PLANE_NFORMATS(1)];
> @@ -547,6 +552,81 @@ static int simpledrm_device_attach_genpd(struct simpledrm_device *sdev)
>   }
>   #endif
>   
> +#if defined CONFIG_OF && defined CONFIG_PM_GENERIC_DOMAINS
> +/*
> + * Generic interconnect path handling code.
> + */
> +static void simpledrm_device_detach_icc(void *res)
> +{
> +	struct simpledrm_device *sdev = res;
> +	int i;
> +
> +	for (i = sdev->icc_count - 1; i >= 0; i--) {
> +		if (!IS_ERR_OR_NULL(sdev->icc_paths[i]))
> +			icc_put(sdev->icc_paths[i]);
> +	}
> +}
> +
> +static int simpledrm_device_attach_icc(struct simpledrm_device *sdev)
> +{
> +	struct device *dev = sdev->sysfb.dev.dev;
> +	int ret, count, i;
> +
> +	count = of_count_phandle_with_args(dev->of_node, "interconnects",
> +							 "#interconnect-cells");
> +	if (count < 0)
> +		return 0;
> +
> +	/* An interconnect path consists of two elements */
> +	if (count % 2) {
> +		drm_err(&sdev->sysfb.dev,
> +			"invalid interconnects value\n");
> +		return -EINVAL;
> +	}
> +	sdev->icc_count = count / 2;
> +
> +	sdev->icc_paths = devm_kcalloc(dev, sdev->icc_count,
> +					       sizeof(*sdev->icc_paths),
> +					       GFP_KERNEL);
> +	if (!sdev->icc_paths)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < sdev->icc_count; i++) {
> +		sdev->icc_paths[i] = of_icc_get_by_index(dev, i);
> +		if (IS_ERR_OR_NULL(sdev->icc_paths[i])) {
> +			ret = PTR_ERR(sdev->icc_paths[i]);
> +			if (ret == -EPROBE_DEFER)
> +				goto err;
> +			drm_err(&sdev->sysfb.dev, "failed to get interconnect path %u: %d\n",
> +				i, ret);
> +			continue;
> +		}
> +
> +		ret = icc_set_bw(sdev->icc_paths[i], 0, UINT_MAX);
> +		if (ret) {
> +			drm_err(&sdev->sysfb.dev, "failed to set interconnect bandwidth %u: %d\n",
> +				i, ret);
> +			continue;
> +		}
> +	}
> +
> +	return devm_add_action_or_reset(dev, simpledrm_device_detach_icc, sdev);
> +
> +err:
> +	while (i) {
> +		--i;
> +		if (!IS_ERR_OR_NULL(sdev->icc_paths[i]))
> +			icc_put(sdev->icc_paths[i]);
> +	}
> +	return ret;
> +}
> +#else
> +static int simpledrm_device_attach_icc(struct simpledrm_device *sdev)
> +{
> +	return 0;
> +}
> +#endif
> +
>   /*
>    * Modesetting
>    */
> @@ -633,6 +713,9 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
>   	if (ret)
>   		return ERR_PTR(ret);
>   	ret = simpledrm_device_attach_genpd(sdev);
> +	if (ret)
> +		return ERR_PTR(ret);
> +	ret = simpledrm_device_attach_icc(sdev);
>   	if (ret)
>   		return ERR_PTR(ret);
>   
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

