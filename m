Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F5FA2BDA5
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 09:14:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D4A310EA3E;
	Fri,  7 Feb 2025 08:14:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ADSrBuGs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wB0qrvux";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ADSrBuGs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wB0qrvux";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B259210EA43
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 08:12:21 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7976C1F397;
 Fri,  7 Feb 2025 08:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738915940; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=piiWI8chHxxa9by9OlTILktk+QQD3VLU7ZCqVzys1oQ=;
 b=ADSrBuGsoHM1TD6EKQq0wRDWR1iv6TDF8y1q3Yzvvx033139jc7Afjh9ahSSCKb/dk1oyO
 R3kFUzTFhDGij9aOaudUySGWb5RCiIfVQnblOh9W+AEVwwq7A1a4ACue1vbsTkbeIlZ6wg
 7QSJv9Z32AaBeDsnlvPCQr80crXKdbY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738915940;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=piiWI8chHxxa9by9OlTILktk+QQD3VLU7ZCqVzys1oQ=;
 b=wB0qrvuxjp0F/j5QbPOsncK3YN7UwMujW/UMk4x72nnEHZ5pHVyhEMmJleePeeNyD+tvA8
 HJF+AGt5wh5AQBBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738915940; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=piiWI8chHxxa9by9OlTILktk+QQD3VLU7ZCqVzys1oQ=;
 b=ADSrBuGsoHM1TD6EKQq0wRDWR1iv6TDF8y1q3Yzvvx033139jc7Afjh9ahSSCKb/dk1oyO
 R3kFUzTFhDGij9aOaudUySGWb5RCiIfVQnblOh9W+AEVwwq7A1a4ACue1vbsTkbeIlZ6wg
 7QSJv9Z32AaBeDsnlvPCQr80crXKdbY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738915940;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=piiWI8chHxxa9by9OlTILktk+QQD3VLU7ZCqVzys1oQ=;
 b=wB0qrvuxjp0F/j5QbPOsncK3YN7UwMujW/UMk4x72nnEHZ5pHVyhEMmJleePeeNyD+tvA8
 HJF+AGt5wh5AQBBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5DD9B139CB;
 Fri,  7 Feb 2025 08:12:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ZneyFWTApWeKRQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 07 Feb 2025 08:12:20 +0000
Message-ID: <c4db73a2-12a7-41f4-a175-332c44f51bc4@suse.de>
Date: Fri, 7 Feb 2025 09:12:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 00/13] fbdev: core: Deduplicate cfb/sys drawing
 fbops
To: Zsolt Kajtar <soci@c64.rulez.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20250207041818.4031-1-soci@c64.rulez.org>
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
In-Reply-To: <20250207041818.4031-1-soci@c64.rulez.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[3]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Score: -4.30
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


Am 07.02.25 um 05:18 schrieb Zsolt Kajtar:
> In 68648ed1f58d98b8e8d994022e5e25331fbfe42a the drawing routines were
> duplicated to have separate I/O and system memory versions.
>
> Later the pixel reversing in 779121e9f17525769c04a00475fd85600c8c04eb
> was only added to the I/O version and not to system.
>
> That's unfortunate as reversing is not something only applicable for
> I/O memory and I happen to need both I/O and system version now.
>
> One option is to bring the system version up to date, but from the
> maintenance perspective it's better to not have two versions in the
> first place.

No it's not. Major code abstractions behind preprocessor tokens are 
terrible to maintain. It's also technically not possible to switch 
between system and I/O memory at will. These are very different things.

If you want that pixel-reversing feature in sys_ helpers, please 
implement it there.

Sorry, but NAK on this series.

Best regards
Thomas

>
> The drawing routines (based on the cfb version) were moved to header
> files. These are now included in both cfb and sys modules. The memory
> access and other minor differences were handled with a few macros.
>
> The last patch adds a separate config option for the system version.
>
> Zsolt Kajtar (13):
>    fbdev: core: Copy cfbcopyarea to fb_copyarea
>    fbdev: core: Make fb_copyarea generic
>    fbdev: core: Use generic copyarea for as cfb_copyarea
>    fbdev: core: Use generic copyarea for as sys_copyarea
>    fbdev: core: Copy cfbfillrect to fb_fillrect
>    fbdev: core: Make fb_fillrect generic
>    fbdev: core: Use generic fillrect for as cfb_fillrect
>    fbdev: core: Use generic fillrect for as sys_fillrect
>    fbdev: core: Copy cfbimgblt to fb_imageblit
>    fbdev: core: Make fb_imageblit generic
>    fbdev: core: Use generic imageblit for as cfb_imageblit
>    fbdev: core: Use generic imageblit for as sys_imageblit
>    fbdev: core: Split CFB and SYS pixel reversing configuration
>
>   drivers/video/fbdev/core/Kconfig        |  10 +-
>   drivers/video/fbdev/core/cfbcopyarea.c  | 427 +-----------------------
>   drivers/video/fbdev/core/cfbfillrect.c  | 363 +-------------------
>   drivers/video/fbdev/core/cfbimgblt.c    | 358 +-------------------
>   drivers/video/fbdev/core/fb_copyarea.h  | 421 +++++++++++++++++++++++
>   drivers/video/fbdev/core/fb_draw.h      |   6 +-
>   drivers/video/fbdev/core/fb_fillrect.h  | 359 ++++++++++++++++++++
>   drivers/video/fbdev/core/fb_imageblit.h | 356 ++++++++++++++++++++
>   drivers/video/fbdev/core/syscopyarea.c  | 358 +-------------------
>   drivers/video/fbdev/core/sysfillrect.c  | 315 +----------------
>   drivers/video/fbdev/core/sysimgblt.c    | 326 +-----------------
>   11 files changed, 1208 insertions(+), 2091 deletions(-)
>   create mode 100644 drivers/video/fbdev/core/fb_copyarea.h
>   create mode 100644 drivers/video/fbdev/core/fb_fillrect.h
>   create mode 100644 drivers/video/fbdev/core/fb_imageblit.h
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

