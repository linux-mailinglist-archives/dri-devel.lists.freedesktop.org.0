Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D3596B24F
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 09:05:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB7F10E67B;
	Wed,  4 Sep 2024 07:04:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="xigZQo4z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YS+CuWEV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xigZQo4z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YS+CuWEV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1F6510E1C6
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 07:04:53 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 584A5219F7;
 Wed,  4 Sep 2024 07:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725433492; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=qAfiMb8PzWc6PDv+M5VtGS4/QibLHTViSE2wGIH70po=;
 b=xigZQo4zpgxXmAz6aGO+Vf1rFiroILj//ydtpotmDG9lSiwI8n8ihNXA5jdwsp4Lhh2kqi
 V3/u4d8otqUE8LbD9G8nNJ8HDi8O/voSKbbGf3NCkxme04/TJF0TjH4pF8VRIYEXeDibOA
 rrKHy4cFmBzf85CtLuARs1w/fL0mTQY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725433492;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=qAfiMb8PzWc6PDv+M5VtGS4/QibLHTViSE2wGIH70po=;
 b=YS+CuWEVygDqe5XMop/8lSnvYvxpOoDyLokyfkBVkWbt2P3475H0B4kp0pk6XqeT9A5ZGz
 Bd/v3GDFMv5y5YDA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xigZQo4z;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=YS+CuWEV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725433492; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=qAfiMb8PzWc6PDv+M5VtGS4/QibLHTViSE2wGIH70po=;
 b=xigZQo4zpgxXmAz6aGO+Vf1rFiroILj//ydtpotmDG9lSiwI8n8ihNXA5jdwsp4Lhh2kqi
 V3/u4d8otqUE8LbD9G8nNJ8HDi8O/voSKbbGf3NCkxme04/TJF0TjH4pF8VRIYEXeDibOA
 rrKHy4cFmBzf85CtLuARs1w/fL0mTQY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725433492;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=qAfiMb8PzWc6PDv+M5VtGS4/QibLHTViSE2wGIH70po=;
 b=YS+CuWEVygDqe5XMop/8lSnvYvxpOoDyLokyfkBVkWbt2P3475H0B4kp0pk6XqeT9A5ZGz
 Bd/v3GDFMv5y5YDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1AEB8139E2;
 Wed,  4 Sep 2024 07:04:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id krH6BJQG2GYdaAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 04 Sep 2024 07:04:52 +0000
Message-ID: <55807c28-ea6b-4743-b29e-7f3607a2a2c1@suse.de>
Date: Wed, 4 Sep 2024 09:04:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 21/43] drm/fbdev-dma: Implement damage handling and
 deferred I/O
To: Linus Walleij <linus.walleij@linaro.org>
Cc: javierm@redhat.com, deller@gmx.de, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20240419083331.7761-1-tzimmermann@suse.de>
 <20240419083331.7761-22-tzimmermann@suse.de>
 <CACRpkdb+hb9AGavbWpY-=uQQ0apY9en_tWJioPKf_fAbXMP4Hg@mail.gmail.com>
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
In-Reply-To: <CACRpkdb+hb9AGavbWpY-=uQQ0apY9en_tWJioPKf_fAbXMP4Hg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 584A5219F7
X-Spam-Score: -6.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-6.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCVD_TLS_ALL(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[7]; FUZZY_BLOCKED(0.00)[rspamd.com];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[redhat.com,gmx.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
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

Hi Linus

Am 04.09.24 um 00:53 schrieb Linus Walleij:
> On Fri, Apr 19, 2024 at 10:35 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
>> Add support for damage handling and deferred I/O to fbdev-dma. This
>> enables fbdev-dma to support all DMA-memory-based DRM drivers, even
>> such with a dirty callback in their framebuffers.
>>
>> The patch adds the code for deferred I/O and also sets a dedicated
>> helper for struct fb_ops.fb_mmap that support coherent mappings.
>>
>> v3:
>> - init fb_ops with FB_GEN_DEFAULT_DEFERRED_DMAMEM_OPS() (Javier)
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> For some reason this makes the Versatile Express crash in QEMU
> (I can retest on real hardware if necessary):
>
> 8<--- cut here ---
> Unable to handle kernel paging request at virtual address 18095000 when write
> [18095000] *pgd=00000000
> Internal error: Oops: 805 [#1] SMP ARM
> CPU: 0 PID: 75 Comm: S08_ledflash Not tainted 6.9.0-rc6+ #44
> Hardware name: ARM-Versatile Express
> PC is at mmioset+0x34/0xac
> LR is at 0x0
> pc : [<809c2a54>]    lr : [<00000000>]    psr: 20000013
> sp : f8dddc38  ip : 18095000  fp : 00000000
> r10: 81109a18  r9 : 81238b04  r8 : 00000000
> r7 : 00440dc0  r6 : ed4f32a0  r5 : ed4f32a0  r4 : 00000001
> r3 : 00000000  r2 : 00000fc0  r1 : 00000000  r0 : 18095000
> Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
> Control: 10c5387d  Table: 81d6406a  DAC: 00000051
> Register r0 information: non-paged memory
> Register r1 information: NULL pointer
> Register r2 information: non-paged memory
> Register r3 information: NULL pointer
> Register r4 information: non-paged memory
> Register r5 information: non-slab/vmalloc memory
> Register r6 information: non-slab/vmalloc memory
> Register r7 information: non-paged memory
> Register r8 information: NULL pointer
> Register r9 information: non-slab/vmalloc memory
> Register r10 information: non-slab/vmalloc memory
> Register r11 information: NULL pointer
> Register r12 information: non-paged memory
> Process S08_ledflash (pid: 75, stack limit = 0x(ptrval))
> Stack: (0xf8dddc38 to 0xf8dde000)
> dc20:                                                       00000801 802af888
> dc40: 80a0fb80 00440dc0 00000801 811fad80 00000000 f8dddd28 ed4f32a0 811fa680
> dc60: 00000000 802b0c30 ee1d2140 ee1d215c 95ff4385 00000001 00000001 00000001
> dc80: 00000000 00000000 ffffffff 8196a70b 000000b0 00000064 0000006c 00000000
> dca0: 00000001 00000002 00000001 811fa798 00000801 811fa940 80a0fb80 00000cc0
> dcc0: 00000001 00000001 00000000 f8dddd28 811fa93c 811fa680 00000002 802b0c30
> dce0: ee1d2140 00440dc0 00000000 00000000 00000001 00000000 811fad80 00440dc0
> dd00: 00000001 00000000 00000000 83201100 00440dc0 00000000 00000000 802afa18
> dd20: 00000bdc 00000bd8 811fad80 00000000 811fad80 00000000 00000000 00000000
> dd40: adf00ec5 816d5fa8 816d5fa8 821c3c00 00000000 7ebc2000 7ebe3000 00000000
> dd60: f8ddde44 8028cfa0 816d5fa8 8288df50 8169cf00 821c3c00 7ebc2000 7ebe3000
> dd80: f8ddde44 8028e1e8 00000001 80bbe932 f8ddde44 f8dddde8 f8ddde44 8288df50
> dda0: 83201100 809cf474 f8ddde44 8169cf00 00000020 8169cf94 821c3c94 7ebe3000
> ddc0: 7ebe2fff fffffff4 00000000 816d5fa8 821c3c00 8169cf00 81d65fa8 809cdbb0
> dde0: 8288df50 81ffa910 7ebe3000 82890b00 00000000 00000000 00000000 00000000
> de00: 00000000 00000000 adf00ec5 00000000 00000000 8169cf00 8288df50 83201100
> de20: 821c3c00 81ffa910 f8ddde44 8011f6e4 00000000 00000000 821c3c7c 8169cf7c
> de40: 83200880 821c3c40 7ebc2000 7ebe2fff 82890b0c 76ea4000 ffffffff 00000000
> de60: 00000000 0f000a01 f8ddde68 f8ddde68 adf00ec5 00000000 00000000 00000000
> de80: 00000000 01200000 83201100 00000000 00000000 8011e2ac 00000000 83200d7c
> dea0: 83201020 83200e70 83200e80 00000000 f8dddf30 83200880 00000000 00000000
> dec0: 00000000 00000000 00000000 82182f38 adf00ec5 00000000 01200000 f8dddf30
> dee0: 00000000 00000000 00000000 00000078 000cb21c 8011fe24 00000020 00000000
> df00: 828a5d80 80a10140 adf00ec5 01200011 00000000 00000000 00000000 f8dddf30
> df20: 00000000 00000078 000cb21c 801203d4 01200000 00000000 00000000 76f46468
> df40: 00000000 00000000 00000011 00000000 00000000 00000000 00000000 00000000
> df60: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> df80: 00000003 adf00ec5 76f46468 00000000 76f468c0 00000078 80100290 83201100
> dfa0: 000cb21c 80100060 76f46468 00000000 01200011 00000000 00000000 00000000
> dfc0: 76f46468 00000000 76f468c0 00000078 00000000 76e81000 76f46400 000cb21c
> dfe0: 00000078 7ebe2938 76e0854d 76dae7e6 20000030 01200011 00000000 00000000
> Call trace:
>   mmioset from prep_new_page+0x160/0x194
>   prep_new_page from get_page_from_freelist+0x10f4/0x110c
>   get_page_from_freelist from __alloc_pages+0x15c/0x280
>   __alloc_pages from __pte_alloc+0x28/0x1bc
>   __pte_alloc from copy_page_range+0xc10/0xd28
>   copy_page_range from copy_mm+0x5cc/0x850
>   copy_mm from copy_process+0x508/0xd8c
>   copy_process from kernel_clone+0x94/0x338
>   kernel_clone from sys_clone+0x94/0xb0
>   sys_clone from ret_fast_syscall+0x0/0x1c
> Exception stack(0xf8dddfa8 to 0xf8dddff0)
> dfa0:                   76f46468 00000000 01200011 00000000 00000000 00000000
> dfc0: 76f46468 00000000 76f468c0 00000078 00000000 76e81000 76f46400 000cb21c
> dfe0: 00000078 7ebe2938 76e0854d 76dae7e6
> Code: e92d4100 e1a08001 e1a0e003 e2522040 (a8ac410a)
> ---[ end trace 0000000000000000 ]---
>
> I bisected down to this commit and reverting the commit solves the issue.

Thanks for bisecting. Simply reverting isn't an option as that would 
break many other drivers.

Is it only the pl111 driver? If nothing else works, we could give it a 
dedicated fbdev emulation.

Best regards
Thomas

>
> What is special about the Versatile Express graphics is that it uses a special
> dedicated video RAM, looks like this in the device tree
>
>
>          reserved-memory {
>                  #address-cells = <1>;
>                  #size-cells = <1>;
>                  ranges;
>
>                  /* Chipselect 3 is physically at 0x4c000000 */
>                  vram: vram@4c000000 {
>                          /* 8 MB of designated video RAM */
>                          compatible = "shared-dma-pool";
>                          reg = <0x4c000000 0x00800000>;
>                          no-map;
>                  };
>          };
> (...)
>           clcd@1f000 {
>                        compatible = "arm,pl111", "arm,primecell";
> (...)
>                        memory-region = <&vram>;
>
> This gets picked up in the driver
> drivers/gpu/drm/pl111/pl111_drv.c
> like this:
>
>          ret = of_reserved_mem_device_init(dev);
>          if (!ret) {
>                  dev_info(dev, "using device-specific reserved memory\n");
>                  priv->use_device_memory = true;
>          }
>
> Yours,
> Linus Walleij

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

