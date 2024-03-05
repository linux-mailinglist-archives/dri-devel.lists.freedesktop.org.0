Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E6B871A8B
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 11:18:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2F861129D9;
	Tue,  5 Mar 2024 10:18:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="oQFQAhRt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BJ+wf17h";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oQFQAhRt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BJ+wf17h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEFAD1129D9
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 10:18:08 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 01E3F76B98;
 Tue,  5 Mar 2024 10:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709633887; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=XHoj87o+0g5i2kqapJljsWDPdSV/f39cRJJacqXEtVs=;
 b=oQFQAhRtRdn5iXITsoHlVkGlrrUD0V0IpHNoUCBZ+lHHf1t9WnhIzyM1uQ/t1BjT13G9pM
 4RYOR4QUtYh8wtjkKrD+Tc0N9BiAqiDwye+l6tc0cohaaYkpnLM05YL77k7gXb3z/YFjmg
 3/9WOtYsi9qRNpQxjSfn6WxVP3Ei81c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709633887;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=XHoj87o+0g5i2kqapJljsWDPdSV/f39cRJJacqXEtVs=;
 b=BJ+wf17hzmMpd+lCtUbE4ZviDv2CGpkauSuYwJtv4xwQuWd6JZZDJyDFANcnpgACPTBmVK
 8F93PXYOdL1cnFAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709633887; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=XHoj87o+0g5i2kqapJljsWDPdSV/f39cRJJacqXEtVs=;
 b=oQFQAhRtRdn5iXITsoHlVkGlrrUD0V0IpHNoUCBZ+lHHf1t9WnhIzyM1uQ/t1BjT13G9pM
 4RYOR4QUtYh8wtjkKrD+Tc0N9BiAqiDwye+l6tc0cohaaYkpnLM05YL77k7gXb3z/YFjmg
 3/9WOtYsi9qRNpQxjSfn6WxVP3Ei81c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709633887;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=XHoj87o+0g5i2kqapJljsWDPdSV/f39cRJJacqXEtVs=;
 b=BJ+wf17hzmMpd+lCtUbE4ZviDv2CGpkauSuYwJtv4xwQuWd6JZZDJyDFANcnpgACPTBmVK
 8F93PXYOdL1cnFAQ==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id A567513A5D;
 Tue,  5 Mar 2024 10:18:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id BGl7Jl7x5mUHdwAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Tue, 05 Mar 2024 10:18:06 +0000
Message-ID: <a4a77ad1-1f3c-45ca-9385-436a8bfe5bc3@suse.de>
Date: Tue, 5 Mar 2024 11:18:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbmon: prevent division by zero in
 fb_videomode_from_videomode()
Content-Language: en-US
To: Roman Smirnov <r.smirnov@omp.ru>, Daniel Vetter <daniel@ffwll.ch>,
 Helge Deller <deller@gmx.de>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>, Karina Yankevich
 <k.yankevich@omp.ru>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org
References: <20240305082040.7445-1-r.smirnov@omp.ru>
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
In-Reply-To: <20240305082040.7445-1-r.smirnov@omp.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=oQFQAhRt;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=BJ+wf17h
X-Spamd-Result: default: False [-2.30 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 XM_UA_NO_VERSION(0.01)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmx.de];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim]; BAYES_HAM(-0.00)[30.91%];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 RCPT_COUNT_SEVEN(0.00)[9];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
 FREEMAIL_TO(0.00)[omp.ru,ffwll.ch,gmx.de];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 01E3F76B98
X-Spam-Level: 
X-Spam-Score: -2.30
X-Spam-Flag: NO
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

Am 05.03.24 um 09:20 schrieb Roman Smirnov:
> The expression htotal * vtotal can have a zero value
> on overflow. It is necessary to prevent division by
> zero like in fb_var_to_videomode().
>
> Found by Linux Verification Center (linuxtesting.org) with Svace.
>
> Signed-off-by: Roman Smirnov <r.smirnov@omp.ru>
> Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> ---
>   drivers/video/fbdev/core/fbmon.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/video/fbdev/core/fbmon.c b/drivers/video/fbdev/core/fbmon.c
> index 79e5bfbdd34c..bd98b138da6a 100644
> --- a/drivers/video/fbdev/core/fbmon.c
> +++ b/drivers/video/fbdev/core/fbmon.c
> @@ -1311,7 +1311,7 @@ int fb_get_mode(int flags, u32 val, struct fb_var_screeninfo *var, struct fb_inf
>   int fb_videomode_from_videomode(const struct videomode *vm,
>   				struct fb_videomode *fbmode)
>   {
> -	unsigned int htotal, vtotal;
> +	unsigned int htotal, vtotal, hfreq;
>   
>   	fbmode->xres = vm->hactive;
>   	fbmode->left_margin = vm->hback_porch;
> @@ -1345,7 +1345,8 @@ int fb_videomode_from_videomode(const struct videomode *vm,
>   		 vm->vsync_len;
>   	/* prevent division by zero */
>   	if (htotal && vtotal) {
> -		fbmode->refresh = vm->pixelclock / (htotal * vtotal);
> +		hfreq = vm->pixelclock / htotal;
> +		fbmode->refresh = hfreq / vtotal;

I think this can change the end result because of integer rounding on 
the intermediate result. Maybe use

   if (htotal && vtotal && (vm->pixelclock / htotal >= vtotal))

for the test. That rules out overflowing multiplication and sets refresh 
to 0 in such cases.

Best regards
Thomas

>   	/* a mode must have htotal and vtotal != 0 or it is invalid */
>   	} else {
>   		fbmode->refresh = 0;

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

