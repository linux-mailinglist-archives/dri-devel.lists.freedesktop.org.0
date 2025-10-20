Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A06B2BF1D86
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 16:29:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6103E10E45B;
	Mon, 20 Oct 2025 14:29:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="adBc3eKx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="W2f/C3BA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Bpph9nEk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="M2U96Rof";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B1C810E45B
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 14:29:47 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AA5431F399;
 Mon, 20 Oct 2025 14:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760970581; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=+JcmXqY7X391yyMLFFw9/yksQUZUBp8SV3jL0bIoMfU=;
 b=adBc3eKxrrNYqUnX/01PrpLyTXtP7AAUhfGNatUfl+CO1JGfTlLGQOYu9fX1qi0pW+HLn2
 xYAMkUdM2S2DlUGsQvf5CDt9tTBUooG7MjCZMBU/V1d+lt0HIISKZbUgfbV6MMIYKDBSBt
 sE7Nc1SeSAF4wOPj4SS/bxZfE+qNSt0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760970581;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=+JcmXqY7X391yyMLFFw9/yksQUZUBp8SV3jL0bIoMfU=;
 b=W2f/C3BA3G3lIq2s3eMbmpPICyX6EpRCAaEGCryUe71Lw1VYt23GTeBbs3O+XfnV7fd6YP
 DVJOrgYm/YYzCpBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760970577; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=+JcmXqY7X391yyMLFFw9/yksQUZUBp8SV3jL0bIoMfU=;
 b=Bpph9nEkZGeAPh/MFnWAYf9qh6UaUVhhR1SL5a0eHHggiGeK+wOKcD9fNBDawAuDJGsDnY
 BQzUKPkPId9vjFtn1EbABGoXarG57C4e9u+/b/DbF0r1n4O5l22dBAQW+UqShyrbeayV3h
 4/E6w5T6cKyrUJsD92eu+/ZnomkFYWY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760970577;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=+JcmXqY7X391yyMLFFw9/yksQUZUBp8SV3jL0bIoMfU=;
 b=M2U96RofgOKI35vMPUP5sivWjBLIzRFYs1QVS+Tbmnu5bPWcql+u2kegRwvabyze/Nm7Gb
 2HQkpk/ApjMVqMDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 61AA113A8E;
 Mon, 20 Oct 2025 14:29:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id /SZcFlFH9mgRJAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 20 Oct 2025 14:29:37 +0000
Message-ID: <cc1e8193-6588-4e75-896e-b807f451fb4c@suse.de>
Date: Mon, 20 Oct 2025 16:29:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fbdev: bitblit: bound-check glyph index in bit_putcs*
To: Junjie Cao <junjie.cao@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>, Zsolt Kajtar <soci@c64.rulez.org>
Cc: Albin Babu Varghese <albinbabuvarghese20@gmail.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 syzbot+793cf822d213be1a74f2@syzkaller.appspotmail.com
References: <20251020134701.84082-1-junjie.cao@intel.com>
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
In-Reply-To: <20251020134701.84082-1-junjie.cao@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FROM_HAS_DN(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TAGGED_RCPT(0.00)[793cf822d213be1a74f2];
 FREEMAIL_TO(0.00)[intel.com,ffwll.ch,gmx.de,c64.rulez.org];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[10]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.freedesktop.org,googlegroups.com,syzkaller.appspotmail.com];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
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

Am 20.10.25 um 15:47 schrieb Junjie Cao:
> bit_putcs_aligned()/unaligned() derived the glyph pointer from the
> character value masked by 0xff/0x1ff, which may exceed the actual font's
> glyph count and read past the end of the built-in font array.
> Clamp the index to the actual glyph count before computing the address.
>
> This fixes a global out-of-bounds read reported by syzbot.
>
> Reported-by: syzbot+793cf822d213be1a74f2@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=793cf822d213be1a74f2
> Tested-by: syzbot+793cf822d213be1a74f2@syzkaller.appspotmail.com
> Signed-off-by: Junjie Cao <junjie.cao@intel.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for fixing the bug.

Best regards
Thomas

> ---
> v1: https://lore.kernel.org/linux-fbdev/5d237d1a-a528-4205-a4d8-71709134f1e1@suse.de/
> v1 -> v2:
>   - Fix indentation and add blank line after declarations with the .pl helper
>   - No functional changes
>
>   drivers/video/fbdev/core/bitblit.c | 16 ++++++++++++----
>   1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/video/fbdev/core/bitblit.c b/drivers/video/fbdev/core/bitblit.c
> index 9d2e59796c3e..085ffb44c51a 100644
> --- a/drivers/video/fbdev/core/bitblit.c
> +++ b/drivers/video/fbdev/core/bitblit.c
> @@ -79,12 +79,16 @@ static inline void bit_putcs_aligned(struct vc_data *vc, struct fb_info *info,
>   				     struct fb_image *image, u8 *buf, u8 *dst)
>   {
>   	u16 charmask = vc->vc_hi_font_mask ? 0x1ff : 0xff;
> +	unsigned int charcnt = vc->vc_font.charcount;
>   	u32 idx = vc->vc_font.width >> 3;
>   	u8 *src;
>   
>   	while (cnt--) {
> -		src = vc->vc_font.data + (scr_readw(s++)&
> -					  charmask)*cellsize;
> +		u16 ch = scr_readw(s++) & charmask;
> +
> +		if (ch >= charcnt)
> +			ch = 0;
> +		src = vc->vc_font.data + (unsigned int)ch * cellsize;
>   
>   		if (attr) {
>   			update_attr(buf, src, attr, vc);
> @@ -112,14 +116,18 @@ static inline void bit_putcs_unaligned(struct vc_data *vc,
>   				       u8 *dst)
>   {
>   	u16 charmask = vc->vc_hi_font_mask ? 0x1ff : 0xff;
> +	unsigned int charcnt = vc->vc_font.charcount;
>   	u32 shift_low = 0, mod = vc->vc_font.width % 8;
>   	u32 shift_high = 8;
>   	u32 idx = vc->vc_font.width >> 3;
>   	u8 *src;
>   
>   	while (cnt--) {
> -		src = vc->vc_font.data + (scr_readw(s++)&
> -					  charmask)*cellsize;
> +		u16 ch = scr_readw(s++) & charmask;
> +
> +		if (ch >= charcnt)
> +			ch = 0;
> +		src = vc->vc_font.data + (unsigned int)ch * cellsize;
>   
>   		if (attr) {
>   			update_attr(buf, src, attr, vc);

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


