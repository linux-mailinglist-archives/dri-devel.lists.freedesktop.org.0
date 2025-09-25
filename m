Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C0BBA0111
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 16:47:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25BFC10E0E7;
	Thu, 25 Sep 2025 14:47:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="d6y+UXt+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0eKSrFn2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="d6y+UXt+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0eKSrFn2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED63010E0E7
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 14:47:39 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6BA3E536E;
 Thu, 25 Sep 2025 14:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758811658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=XfACKdaEextsnU1IjQPu9My2DyVza6MjzkBQxya+Rgc=;
 b=d6y+UXt+iHAsEZ51kEuJHBaURP3wuqIdf4ynordN35VOppEmBkH4wglnZm4IOlfnv44x3V
 5FU3ttdAHPCuaA3PDlZ02E7au/QyBz2xO1dFfBanEd7deVDHmv8Fya2tE0rKp4lL2erFze
 EG9Zs1dQFtN3KNJ22MUtaZ6x1gv1s5E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758811658;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=XfACKdaEextsnU1IjQPu9My2DyVza6MjzkBQxya+Rgc=;
 b=0eKSrFn2Ny/jWFWrtqx9aJAryXJZZS2jnxa0XuiJ/Gqgx9PB0p2b3/KNsE7XdoedVyZow3
 rBwyI6xVRWJVu4DQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758811658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=XfACKdaEextsnU1IjQPu9My2DyVza6MjzkBQxya+Rgc=;
 b=d6y+UXt+iHAsEZ51kEuJHBaURP3wuqIdf4ynordN35VOppEmBkH4wglnZm4IOlfnv44x3V
 5FU3ttdAHPCuaA3PDlZ02E7au/QyBz2xO1dFfBanEd7deVDHmv8Fya2tE0rKp4lL2erFze
 EG9Zs1dQFtN3KNJ22MUtaZ6x1gv1s5E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758811658;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=XfACKdaEextsnU1IjQPu9My2DyVza6MjzkBQxya+Rgc=;
 b=0eKSrFn2Ny/jWFWrtqx9aJAryXJZZS2jnxa0XuiJ/Gqgx9PB0p2b3/KNsE7XdoedVyZow3
 rBwyI6xVRWJVu4DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2A4D0132C9;
 Thu, 25 Sep 2025 14:47:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id JTSDBgpW1WiORwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 25 Sep 2025 14:47:38 +0000
Message-ID: <1247a6b2-b850-4a73-9df2-981ea23b5af4@suse.de>
Date: Thu, 25 Sep 2025 16:47:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] tty: vt: Fix vc_origin buffer copy overflow in
 fbcon_prepare_logo()
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Wang ShaoBo <bobo.shaobowang@huawei.com>, deller@gmx.de
Cc: leijitang@huawei.com, qianqiang.liu@163.com, daniel.vetter@ffwll.ch,
 linux-kernel@vger.kernel.org, xiexiuqi@huawei.com,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>
References: <20250925091525.767477-1-bobo.shaobowang@huawei.com>
 <e735d76b-e73a-4f1a-9918-8b0b6b1d8ea1@suse.de>
Content-Language: en-US
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
In-Reply-To: <e735d76b-e73a-4f1a-9918-8b0b6b1d8ea1@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_TO(0.00)[huawei.com,gmx.de];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 RCVD_TLS_ALL(0.00)[]; RCPT_COUNT_SEVEN(0.00)[9];
 FREEMAIL_ENVRCPT(0.00)[163.com,gmx.de];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[huawei.com,163.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
 MID_RHS_MATCH_FROM(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 URIBL_BLOCKED(0.00)[huawei.com:email,qemu.org:url,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,huawei.com:email]
X-Spam-Flag: NO
X-Spam-Level: 
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



Am 25.09.25 um 16:24 schrieb Thomas Zimmermann:
> Hi
>
> Am 25.09.25 um 11:15 schrieb Wang ShaoBo:
>> I got some KASAN report as below:
>>
>> BUG: KASAN: slab-use-after-free in fbcon_prepare_logo+0x61e/0xc90
>> Read of size 14 at addr ffff88812c9a4c38 by task syz.0.3549/19016
>>
>> CPU: 0 PID: 19016 Comm: syz.0.3549 Not tainted 6.6.0+ #80
>> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
>> BIOS rel-1.14.0-0-g155821a1990b-prebuilt.qemu.org 04/01/2014
>> Call Trace:
>>   <TASK>
>>   dump_stack_lvl+0x72/0xa0
>>   print_address_description.constprop.0+0x6b/0x3d0
>>   ? fbcon_prepare_logo+0x61e/0xc90
>>   print_report+0xba/0x280
>>   ? fbcon_prepare_logo+0x61e/0xc90
>>   ? kasan_addr_to_slab+0xd/0xa0
>>   ? fbcon_prepare_logo+0x61e/0xc90
>>   kasan_report+0xaf/0xe0
>>   ? fbcon_prepare_logo+0x61e/0xc90
>>   kasan_check_range+0x100/0x1c0
>>   __asan_memcpy+0x23/0x60
>>   fbcon_prepare_logo+0x61e/0xc90
>>   fbcon_init+0xeb9/0x1db0
>>   ? __pfx_drm_fb_helper_set_par+0x10/0x10
>>   visual_init+0x310/0x5c0
>>   do_bind_con_driver.isra.0+0x627/0xbd0
>>   store_bind+0x60b/0x710
>>   ? __pfx_store_bind+0x10/0x10
>>   dev_attr_store+0x5a/0x90
>>   ? __pfx_dev_attr_store+0x10/0x10
>>   sysfs_kf_write+0x145/0x1b0
>>   kernfs_fop_write_iter+0x367/0x580
>>   ? __pfx_sysfs_kf_write+0x10/0x10
>>   new_sync_write+0x1b1/0x2d0
>>   ? __pfx_new_sync_write+0x10/0x10
>>   ? rb_commit+0x121/0x910
>>   ? avc_policy_seqno+0xe/0x20
>>   ? selinux_file_permission+0x129/0x5d0
>>   ? security_file_permission+0xa8/0x700
>>   vfs_write+0x71a/0x960
>>   ksys_write+0x12e/0x260
>>
>> fbcon_init()
>>     -> vc_resize()
>>     //success resize vc_origin buffer size=224=7(cols)*2*16(rows)
>>     -> bcon_prepare_logo(vc, info, old_cols, old_rows,
>>                              new_cols, new_rows)
>>     //old_cols=256，old_rows=4，new_cols=7，new_rows=16
>>
>> There happened to be a vc_origin buffer copy overflow error in
>> fbcon_prepare_logo(), scrolling screen down when using old cols
>> after vc resize would trigger out of lower bound of vc_origin buffer.
>>
>> Fixes: 6104c37094e7 ("fbcon: Make fbcon a built-time depency for fbdev")
>
> That's probably not the broken commit. According to 'git blame', the 
> broken code dates back to the initial git import. During the pre-git 
> days, the change at [1] might be have introduced he issue.
>
> Maybe drop the Fixes tag entirely.
>
> [1] 
> https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git/commit/?id=458a55138545b8b098feb29aaf2e509f8fbab4b3
>
>> Signed-off-by: Wang ShaoBo <bobo.shaobowang@huawei.com>
>
> This looks like a sensible change to me, although I can't claim to 
> fully understand what the function does.
>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> Best regards
> Thomas
>
>> ---
>>   drivers/video/fbdev/core/fbcon.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/video/fbdev/core/fbcon.c 
>> b/drivers/video/fbdev/core/fbcon.c
>> index ac3c99ed92d1..6fa81d0297a0 100644
>> --- a/drivers/video/fbdev/core/fbcon.c
>> +++ b/drivers/video/fbdev/core/fbcon.c
>> @@ -610,6 +610,8 @@ static void fbcon_prepare_logo(struct vc_data 
>> *vc, struct fb_info *info,
>>           /* We can scroll screen down */
>>           r = q - step - cols;
>>           for (cnt = rows - logo_lines; cnt > 0; cnt--) {
>> +            if (r < (unsigned short *) vc->vc_origin)
>> +                break;
>>               scr_memcpyw(r + step, r, vc->vc_size_row);
>>               r -= cols;
>>           }
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


