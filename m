Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 145DCADAD81
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 12:35:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0527410E329;
	Mon, 16 Jun 2025 10:35:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="HIu2nVG5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WD/t+h+P";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HIu2nVG5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WD/t+h+P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF3B910E329
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 10:35:05 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6DD0D1F456;
 Mon, 16 Jun 2025 10:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750070104; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=clhWd0hp84y4IW6UM2+OzdBBA8i/DDCrmUgLvUJC5Pg=;
 b=HIu2nVG5OfLF8redHj3QRSPHETtzoWm3hcJ8dSJotH3viiiOHqNAOntcvLQkJf/lqIm5PI
 5JWiOfpbtbuyTVYlfekjLp/GHh5pj3iympKyLcej50KYNxd2MyD7mCTMy2EUrYBcJPwm0+
 N9fKYp3qKvM+3+tUV9GQhBqOeVJBJ8M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750070104;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=clhWd0hp84y4IW6UM2+OzdBBA8i/DDCrmUgLvUJC5Pg=;
 b=WD/t+h+PTAWxbZHjJ8bW3h62HcDxc52g3+qIrcEHaFFxyw+4b7Cc4ojH5wSU1ubYJhjxSX
 Pgsu3yps64eAeVAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750070104; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=clhWd0hp84y4IW6UM2+OzdBBA8i/DDCrmUgLvUJC5Pg=;
 b=HIu2nVG5OfLF8redHj3QRSPHETtzoWm3hcJ8dSJotH3viiiOHqNAOntcvLQkJf/lqIm5PI
 5JWiOfpbtbuyTVYlfekjLp/GHh5pj3iympKyLcej50KYNxd2MyD7mCTMy2EUrYBcJPwm0+
 N9fKYp3qKvM+3+tUV9GQhBqOeVJBJ8M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750070104;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=clhWd0hp84y4IW6UM2+OzdBBA8i/DDCrmUgLvUJC5Pg=;
 b=WD/t+h+PTAWxbZHjJ8bW3h62HcDxc52g3+qIrcEHaFFxyw+4b7Cc4ojH5wSU1ubYJhjxSX
 Pgsu3yps64eAeVAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C5C7B139E2;
 Mon, 16 Jun 2025 10:35:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id rIx9LlfzT2ihYgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 16 Jun 2025 10:35:03 +0000
Message-ID: <146a906f-03e8-4153-9bc8-73dd74cfdc7e@suse.de>
Date: Mon, 16 Jun 2025 12:35:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/fbdev-client: Skip DRM clients if modesetting is
 absent
To: Thierry Reding <thierry.reding@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20250613122838.2082334-1-thierry.reding@gmail.com>
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
In-Reply-To: <20250613122838.2082334-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCPT_COUNT_SEVEN(0.00)[7];
 FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org];
 ARC_NA(0.00)[]; TAGGED_RCPT(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 MID_RHS_MATCH_FROM(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,nvidia.com:email]
X-Spam-Level: 
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



Am 13.06.25 um 14:28 schrieb Thierry Reding:
> From: Thierry Reding <treding@nvidia.com>
>
> Recent generations of Tegra have moved the display components outside of
> host1x, leading to a device that has no CRTCs attached and hence doesn't
> support any of the modesetting functionality. When this is detected, the
> driver clears the DRIVER_MODESET and DRIVER_ATOMIC flags for the device.
>
> Unfortunately, this causes the following errors during boot:
>
>      [      15.418958] ERR KERN drm drm: [drm] *ERROR* Failed to register client: -95
>      [      15.425311] WARNING KERN drm drm: [drm] Failed to set up DRM client; error -95
>
> These originate from the fbdev client checking for the presence of the
> DRIVER_MODESET flag and returning -EOPNOTSUPP. However, if a driver does
> not support DRIVER_MODESET this is entirely expected and the error isn't
> helpful.
>
> Prevent this misleading error message by setting up the DRM clients only
> if modesetting is enabled.
>
> Changes in v2:
> - use DRIVER_MODESET check to avoid registering any clients
>
> Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/clients/drm_client_setup.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/clients/drm_client_setup.c b/drivers/gpu/drm/clients/drm_client_setup.c
> index e17265039ca8..e460ad354de2 100644
> --- a/drivers/gpu/drm/clients/drm_client_setup.c
> +++ b/drivers/gpu/drm/clients/drm_client_setup.c
> @@ -2,6 +2,7 @@
>   
>   #include <drm/clients/drm_client_setup.h>
>   #include <drm/drm_device.h>
> +#include <drm/drm_drv.h>
>   #include <drm/drm_fourcc.h>
>   #include <drm/drm_print.h>
>   
> @@ -31,6 +32,10 @@ MODULE_PARM_DESC(active,
>    */
>   void drm_client_setup(struct drm_device *dev, const struct drm_format_info *format)
>   {
> +	if (!drm_core_check_feature(dev, DRIVER_MODESET)) {
> +		drm_dbg(dev, "driver does not support mode-setting, skipping DRM clients\n");
> +		return;
> +	}
>   
>   #ifdef CONFIG_DRM_FBDEV_EMULATION
>   	if (!strcmp(drm_client_default, "fbdev")) {

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

