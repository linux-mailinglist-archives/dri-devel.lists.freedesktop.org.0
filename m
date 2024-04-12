Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 663EE8A28A9
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 10:03:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9644F10E186;
	Fri, 12 Apr 2024 08:02:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="xvjDsa3L";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NqLLus18";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xvjDsa3L";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NqLLus18";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D690310E186
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Apr 2024 08:02:55 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2432D22BDD;
 Fri, 12 Apr 2024 08:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712908974; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hLSsBOZsCpBNTQp9+1wq3ZNhrUmjHB37zIOTdH7fz8w=;
 b=xvjDsa3L9Pw/KiSKx6789RUxTug+07Rq+ULbN8Je01iYiq7jSjYcnRgvQgdqXSW3Kc9BT1
 Z8YMuMmTjIKXzDCtnE1dSmIKSK4QO7Wqt8iSdjgYS+4t2QTbvuZ4bk6/OcCdY6oJ72dMSa
 T0sJSv6LdAMtf30NaVMFoPc4rWRFqK4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712908974;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hLSsBOZsCpBNTQp9+1wq3ZNhrUmjHB37zIOTdH7fz8w=;
 b=NqLLus180Q0zFgZ9Lx8ttdMMG8DDPVyIBX/5QcLtjZZmYxsKuIHEvoDFtXM2lR11tdU1W7
 y1Eqj7nfanHYErDQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xvjDsa3L;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=NqLLus18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712908974; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hLSsBOZsCpBNTQp9+1wq3ZNhrUmjHB37zIOTdH7fz8w=;
 b=xvjDsa3L9Pw/KiSKx6789RUxTug+07Rq+ULbN8Je01iYiq7jSjYcnRgvQgdqXSW3Kc9BT1
 Z8YMuMmTjIKXzDCtnE1dSmIKSK4QO7Wqt8iSdjgYS+4t2QTbvuZ4bk6/OcCdY6oJ72dMSa
 T0sJSv6LdAMtf30NaVMFoPc4rWRFqK4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712908974;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hLSsBOZsCpBNTQp9+1wq3ZNhrUmjHB37zIOTdH7fz8w=;
 b=NqLLus180Q0zFgZ9Lx8ttdMMG8DDPVyIBX/5QcLtjZZmYxsKuIHEvoDFtXM2lR11tdU1W7
 y1Eqj7nfanHYErDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0430513942;
 Fri, 12 Apr 2024 08:02:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 9zBmO63qGGafdQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 12 Apr 2024 08:02:53 +0000
Message-ID: <0e57d2c2-6206-4c05-8960-ea188892a857@suse.de>
Date: Fri, 12 Apr 2024 10:02:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/gma500: Check power status before accessing lid data
 in opregion
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 dri-devel@lists.freedesktop.org
Cc: Enrico Bartky <enrico.bartky@gmail.com>
References: <20240412072409.27650-1-patrik.r.jakobsson@gmail.com>
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
In-Reply-To: <20240412072409.27650-1-patrik.r.jakobsson@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.50 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 XM_UA_NO_VERSION(0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[gmail.com,lists.freedesktop.org];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FREEMAIL_CC(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; MID_RHS_MATCH_FROM(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TAGGED_RCPT(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; RCPT_COUNT_THREE(0.00)[3];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim, suse.de:email,
 imap1.dmz-prg2.suse.org:helo, imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 2432D22BDD
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -4.50
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

the issue of hanging during boot is still resent.

Best regards
Thomas

Am 12.04.24 um 09:24 schrieb Patrik Jakobsson:
> Due to changes in the order of initialization the psb_lid_timer_func
> could get called without the device being powered. Fix this by checking
> the power status before accessing the opregion.
>
> Cc: Enrico Bartky <enrico.bartky@gmail.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> ---
>   drivers/gpu/drm/gma500/psb_lid.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/gma500/psb_lid.c b/drivers/gpu/drm/gma500/psb_lid.c
> index 58a7fe392636..eeb91d11336e 100644
> --- a/drivers/gpu/drm/gma500/psb_lid.c
> +++ b/drivers/gpu/drm/gma500/psb_lid.c
> @@ -10,6 +10,7 @@
>   #include "psb_drv.h"
>   #include "psb_intel_reg.h"
>   #include "psb_reg.h"
> +#include "power.h"
>   
>   static void psb_lid_timer_func(struct timer_list *t)
>   {
> @@ -20,9 +21,12 @@ static void psb_lid_timer_func(struct timer_list *t)
>   	u32 __iomem *lid_state = dev_priv->opregion.lid_state;
>   	u32 pp_status;
>   
> -	if (readl(lid_state) == dev_priv->lid_last_state)
> +	if (!gma_power_begin(dev, false))
>   		goto lid_timer_schedule;
>   
> +	if (readl(lid_state) == dev_priv->lid_last_state)
> +		goto power_end;
> +
>   	if ((readl(lid_state)) & 0x01) {
>   		/*lid state is open*/
>   		REG_WRITE(PP_CONTROL, REG_READ(PP_CONTROL) | POWER_TARGET_ON);
> @@ -36,6 +40,7 @@ static void psb_lid_timer_func(struct timer_list *t)
>   			psb_intel_lvds_set_brightness(dev, 100);
>   		} else {
>   			DRM_DEBUG("LVDS panel never powered up");
> +			gma_power_end(dev);
>   			return;
>   		}
>   	} else {
> @@ -48,6 +53,9 @@ static void psb_lid_timer_func(struct timer_list *t)
>   	}
>   	dev_priv->lid_last_state =  readl(lid_state);
>   
> +power_end:
> +	gma_power_end(dev);
> +
>   lid_timer_schedule:
>   	spin_lock_irqsave(&dev_priv->lid_lock, irq_flags);
>   	if (!timer_pending(lid_timer)) {

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

