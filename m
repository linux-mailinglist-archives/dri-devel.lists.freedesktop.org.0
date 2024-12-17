Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 179349F4A24
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 12:43:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BC4910E2F0;
	Tue, 17 Dec 2024 11:43:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="R9ra5zre";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Hy6ZSPnb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="R9ra5zre";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Hy6ZSPnb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B76D610E2F0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 11:43:13 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2D95921108;
 Tue, 17 Dec 2024 11:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1734435792; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1NeDjgNIaRz/ypDh3ro3ChrRyiBzrs4DhsbJbbosa7k=;
 b=R9ra5zrezNiCmXRUd4E3AA8Th3jQm4lxiv3fdclLrpoK5PxmtmvZJeomJc48X16Nk5gqEt
 FJA6eJrgo2+ttq7X7tJYRirjtj4uBgVgycOhgSNlbz6Sy624z1p5fUNbEodA/WBl2mSM/J
 HIKjZyO9kI7NF4Z6Pc4s4YGhogCLWXc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1734435792;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1NeDjgNIaRz/ypDh3ro3ChrRyiBzrs4DhsbJbbosa7k=;
 b=Hy6ZSPnbTRbDzL6WGdWC/QZiugXQID0sfPAXul3E4sWAa8qHEZqZ/oiiSiJMrQwdz8Pzfg
 kPx4jL/wAfo5evCg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=R9ra5zre;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Hy6ZSPnb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1734435792; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1NeDjgNIaRz/ypDh3ro3ChrRyiBzrs4DhsbJbbosa7k=;
 b=R9ra5zrezNiCmXRUd4E3AA8Th3jQm4lxiv3fdclLrpoK5PxmtmvZJeomJc48X16Nk5gqEt
 FJA6eJrgo2+ttq7X7tJYRirjtj4uBgVgycOhgSNlbz6Sy624z1p5fUNbEodA/WBl2mSM/J
 HIKjZyO9kI7NF4Z6Pc4s4YGhogCLWXc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1734435792;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1NeDjgNIaRz/ypDh3ro3ChrRyiBzrs4DhsbJbbosa7k=;
 b=Hy6ZSPnbTRbDzL6WGdWC/QZiugXQID0sfPAXul3E4sWAa8qHEZqZ/oiiSiJMrQwdz8Pzfg
 kPx4jL/wAfo5evCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F37E213A3C;
 Tue, 17 Dec 2024 11:43:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id YdUMOs9jYWcoWgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 17 Dec 2024 11:43:11 +0000
Message-ID: <30beb4da-50be-4e28-a19e-5d7f9680c7ea@suse.de>
Date: Tue, 17 Dec 2024 12:43:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: a bochs-drm (?) oops on head
To: "Dr. David Alan Gilbert" <linux@treblig.org>,
 Hans de Goede <hdegoede@redhat.com>
Cc: kraxel@redhat.com, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>
References: <Z18dbfDAiFadsSdg@gallifrey>
 <b2e2a217-dced-472f-9084-9822f7e6803c@suse.de> <Z2AvS_8xgBhnF4CW@gallifrey>
 <51a183c7-de10-4419-b540-b7c2ab23520a@suse.de> <Z2Bk6-fxzw2dj5Eq@gallifrey>
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
In-Reply-To: <Z2Bk6-fxzw2dj5Eq@gallifrey>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 2D95921108
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_FIVE(0.00)[6];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
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

(cc'ing Hans, who implemented deferred console takeover)

Hi

Am 16.12.24 um 18:35 schrieb Dr. David Alan Gilbert:
> * Thomas Zimmermann (tzimmermann@suse.de) wrote:
>> Hi
>>
>>
>> Am 16.12.24 um 14:46 schrieb Dr. David Alan Gilbert:
>> [...]
>>>> The attached patch fixes the problem for me. Could you please test and
>>>> report back the results.
>>> That gets me a different oops; this was run with:
>>> qemu-system-x86_64  -M pc -cpu host --enable-kvm -smp 4 -m 2G -kernel /discs/fast/kernel/arch/x86/boot/bzImage -append "console=tty0 console=ttyS0 root=/dev/vdb1 single" -drive if=virtio,file=/discs/more/images/debian12-64scan.qcow2
>>>
>>> It looks to me if it made the mistake of trying to print something in the middle of being removed:
>>  From the stack trace below, I'd say it is the one at [1]. But I fail to
>> reproduce the problem.
>>
>> Could you please send me the complete output of dmesg after the system
>> finished booting?
> Sure; this is as far as it gets until it hits the vga oops that stops it:

I was able to reproduce it a single time. My setup is

- CONFIG_DEBUG_TEST_DRIVER_REMOVE=y
- CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER=y
- startup with vgacon
- 'quiet' on kernel command line (important!)

and then I got the segfault you report.

With the provided stack trace and log, I think I got some idea what is 
happened

>
> [    0.000000][    T0] Linux version 6.13.0-rc2+ (dg@dalek) (gcc (GCC) 14.2.1 20240912 (Red Hat 14.2.1-3), GNU ld version 2.43.1-4.fc41) #373 SMP PREEMPT_DYNAMIC Mon Dec 16 13:25:32 GMT 2024
> [    0.000000][    T0] Command line: console=tty0 console=ttyS0 root=/dev/vdb1 single
[...]
> [   74.077481][    T1] SPI driver abt-y030xx067a has no spi_device_id for abt,y030xx067a
> [   74.088805][    T1] SPI driver panel-ilitek-ili9322 has no spi_device_id for dlink,dir-685-panel
> [   74.090492][    T1] SPI driver panel-ilitek-ili9322 has no spi_device_id for ilitek,ili9322
> [   74.094556][    T1] SPI driver panel-innolux-ej030na has no spi_device_id for innolux,ej030na
> [   74.106367][    T1] SPI driver nt39016 has no spi_device_id for kingdisplay,kd035g6-54nt
> [   74.116623][    T1] SPI driver s6d27a1-panel has no spi_device_id for samsung,s6d27a1
> [   74.120701][    T1] SPI driver panel-samsung-s6e63m0 has no spi_device_id for samsung,s6e63m0

> [   74.177273][    T1] bochs-drm 0000:00:02.0: vgaarb: deactivate vga console

This comes from the first iteration in really_probe() [1]. This is the 
bochs instance that will be removed. It should install fbcon, but that 
gets deferred.

[1] https://elixir.bootlin.com/linux/v6.12.5/source/drivers/base/dd.c#L631

> [   74.179388][    T1] [drm] Found bochs VGA, ID 0xb0c5.
> [   74.180931][    T1] [drm] Framebuffer size 16384 kB @ 0xfd000000, mmio @ 0xfebf0000.
> [   74.199314][    T1] [drm] Initialized bochs-drm 1.0.0 for 0000:00:02.0 on minor 2
> [   74.265834][    T1] fbcon: bochs-drmdrmfb (fb1) is primary device
> [   74.265882][    T1] fbcon: Remapping primary device, fb1, to tty 1-63
> [   79.736367][    T1] bochs-drm 0000:00:02.0: [drm] fb1: bochs-drmdrmfb frame buffer device

End of first bochs instance here..

> [   79.800872][    T1] bochs-drm 0000:00:02.0: vgaarb: deactivate vga console

The second instance of bochs starts here and tries to deactivate the 
console a second time. Notice that we didn't have any "Console is " or 
"Taking over console" messages.

> [   79.802400][    T1] BUG: kernel NULL pointer dereference, address: 000000000000020c

I've not been able to figure out what is a offset 0x20c (524 decimal). 
None of the structs involved appears to have any fields starting at this 
offset. The nearest case is vc_hi_font_mask, [2] which is at +520. Could 
be related to aligned memory access. get_color() would read that field. 
[3] vc_num at +512 is another candidate.

[2] 
https://elixir.bootlin.com/linux/v6.13-rc2/source/include/linux/console_struct.h#L124
[3] 
https://elixir.bootlin.com/linux/v6.13-rc2/source/drivers/video/fbdev/core/fbcon.c#L302

> [   79.802448][    T1] #PF: supervisor write access in kernel mode
> [   79.802498][    T1] #PF: error_code(0x0002) - not-present page
> [   79.802545][    T1] PGD 0 P4D 0
> [   79.802622][    T1] Oops: Oops: 0002 [#1] PREEMPT SMP DEBUG_PAGEALLOC NOPTI
> [   79.802669][    T1] CPU: 2 UID: 0 PID: 1 Comm: swapper/0 Tainted: G        W        N 6.13.0-rc2+ #373 5a5c0ce8f09b0b72067981f01985e201a0118bb6
> [   79.802669][    T1] Tainted: [W]=WARN, [N]=TEST
> [   79.802669][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-3.fc41 04/01/2014
> [   79.802669][    T1] RIP: 0010:fbcon_cursor+0xa9/0x3c0
> [   79.802669][    T1] Code: c0 05 00 00 66 89 44 24 06 e8 f3 35 2a fd 0f b7 bb c0 05 00 00 e8 27 b8 e9 fc 49 8d bc 24 0c 02 00 00 49 89 c7 e8 d7 3d 2a fd <45> 89 bc 24 0c 02 00 00 48 8d bd e0 05 00 00 e8 c3 3b 2a fd 44 8b
> [   79.802669][    T1] RSP: 0018:ffffb70f800136c0 EFLAGS: 00010046
> [   79.802669][    T1] RAX: 0000000000000000 RBX: ffff9d4fc10a8800 RCX: 0000000000000000
> [   79.802669][    T1] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> [   79.802669][    T1] RBP: ffff9d4fc54ba800 R08: 0000000000000000 R09: 0000000000000000
> [   79.802669][    T1] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
> [   79.802669][    T1] R13: 0000000000000000 R14: ffff9d4fc54bade8 R15: 0000000000000032
> [   79.802669][    T1] FS:  0000000000000000(0000) GS:ffff9d503d200000(0000) knlGS:0000000000000000
> [   79.802669][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   79.802669][    T1] CR2: 000000000000020c CR3: 0000000056520000 CR4: 0000000000350ef0
> [   79.802669][    T1] Call Trace:
> [   79.802669][    T1]  <TASK>
> [   79.802669][    T1]  ? __die+0x23/0x80
> [   79.802669][    T1]  ? page_fault_oops+0x21c/0x240
> [   79.802669][    T1]  ? do_user_addr_fault+0x893/0x1180
> [   79.802669][    T1]  ? srso_return_thunk+0x5/0x7f
> [   79.802669][    T1]  ? exc_page_fault+0x3f/0x180
> [   79.802669][    T1]  ? exc_page_fault+0x87/0x180
> [   79.802669][    T1]  ? asm_exc_page_fault+0x26/0x40

> [   79.802669][    T1]  ? fbcon_cursor+0xa9/0x3c0
> [   79.802669][    T1]  hide_cursor+0x66/0x1c0
> [   79.802669][    T1]  vt_console_print+0x9b1/0xa40

I think we get here via steps [4] to [8].

[4] 
https://elixir.bootlin.com/linux/v6.13-rc2/source/drivers/pci/vgaarb.c#L173
[5] 
https://elixir.bootlin.com/linux/v6.13-rc2/source/drivers/tty/vt/vt.c#L3287
[6] 
https://elixir.bootlin.com/linux/v6.13-rc2/source/drivers/tty/vt/vt.c#L861
[7] 
https://elixir.bootlin.com/linux/v6.13-rc2/source/drivers/tty/vt/vt.c#L846
[8] 
https://elixir.bootlin.com/linux/v6.13-rc2/source/drivers/video/fbdev/core/fbcon.c#L1322

When vt_console_print() invokes the call at [9], it apparently replaces 
the deferred console implementation (maybe ?) and
then the next line [5] operates on a NULL pointer somewhere.

[9] 
https://elixir.bootlin.com/linux/v6.13-rc2/source/drivers/tty/vt/vt.c#L3286

Best regards
Thomas


-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

