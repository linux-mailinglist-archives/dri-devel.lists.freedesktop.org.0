Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C04A3D643
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 11:16:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B210C10E188;
	Thu, 20 Feb 2025 10:15:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="1e4O61VT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JQAA2851";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1e4O61VT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JQAA2851";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D203710E188
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 10:15:57 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 90EB81F388;
 Thu, 20 Feb 2025 10:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740046556; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=vBMJeHovOTak5px0QrF08hZtxv0mYCqz+HUuFKaiVvs=;
 b=1e4O61VTajmUk6t+YuAjj5D4Qv6dAZlruFSZdJRg/e/qgLzNNY/AUO0nBbmI5zTJacqC7B
 yVbE12ushZSOiz2xWIRG0UxvswZhUwPhVFK5rVu3Rt3/3+lrffOjyVUV9tIktUrv/+Zogq
 9IakgedQUOqaVz1C/CnDnXQqbEUooHo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740046556;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=vBMJeHovOTak5px0QrF08hZtxv0mYCqz+HUuFKaiVvs=;
 b=JQAA2851z8HNa6SuLbEXuqbguACllgCkPZoF5eE/Z44X//5ErjN3C5SfvosLxDdqE6D7Wx
 +CAsufVjvfiPzoAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740046556; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=vBMJeHovOTak5px0QrF08hZtxv0mYCqz+HUuFKaiVvs=;
 b=1e4O61VTajmUk6t+YuAjj5D4Qv6dAZlruFSZdJRg/e/qgLzNNY/AUO0nBbmI5zTJacqC7B
 yVbE12ushZSOiz2xWIRG0UxvswZhUwPhVFK5rVu3Rt3/3+lrffOjyVUV9tIktUrv/+Zogq
 9IakgedQUOqaVz1C/CnDnXQqbEUooHo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740046556;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=vBMJeHovOTak5px0QrF08hZtxv0mYCqz+HUuFKaiVvs=;
 b=JQAA2851z8HNa6SuLbEXuqbguACllgCkPZoF5eE/Z44X//5ErjN3C5SfvosLxDdqE6D7Wx
 +CAsufVjvfiPzoAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5469913301;
 Thu, 20 Feb 2025 10:15:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 5OxEE9wAt2eMBQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 20 Feb 2025 10:15:56 +0000
Message-ID: <be52d165-eea7-4e93-aa12-23490d6170cc@suse.de>
Date: Thu, 20 Feb 2025 11:15:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/tiny: add driver for Apple Touch Bars in x86 Macs
To: Aditya Garg <gargaditya08@live.com>
Cc: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, Kerem Karabay <kekrby@gmail.com>,
 Atharva Tiwari <evepolonium@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <4BAFD886-84E0-4C4C-94B3-90BF911ED0E7@live.com>
 <F16BB9EB-632C-4BC4-A8BA-492BF32E43C1@live.com>
 <d9304ed0-911b-4877-a15c-981b3335bbf9@suse.de>
 <B9CB6BD4-A013-41AD-8094-C0B45A8201BF@live.com>
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
In-Reply-To: <B9CB6BD4-A013-41AD-8094-C0B45A8201BF@live.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_TLS_ALL(0.00)[]; ARC_NA(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,live.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TO_DN_EQ_ADDR_SOME(0.00)[];
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[live.com]; MID_RHS_MATCH_FROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
 RCPT_COUNT_SEVEN(0.00)[9]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
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

Am 20.02.25 um 11:11 schrieb Aditya Garg:
> Hi
>
>
>>
>>> + ret = drm_dev_register(drm, 0);
>>> + if (ret)
>>> + return dev_err_probe(dev, ret, "Failed to register DRM device\n");
>> This call does not belong to the mode-setting pipeline and belongs into appletbdrm_probe().
>>
>>> +
>>> + return 0;
>>> +}
>>> +
>>> +static int appletbdrm_probe(struct usb_interface *intf,
>>> +     const struct usb_device_id *id)
>>> +{
>>> + struct usb_endpoint_descriptor *bulk_in, *bulk_out;
>>> + struct device *dev = &intf->dev;
>>> + struct appletbdrm_device *adev;
>>> + int ret;
>>> +
>>> + ret = usb_find_common_endpoints(intf->cur_altsetting, &bulk_in, &bulk_out, NULL, NULL);
>>> + if (ret)
>>> + return dev_err_probe(dev, ret, "Failed to find bulk endpoints\n");
>>> +
>>> + adev = devm_drm_dev_alloc(dev, &appletbdrm_drm_driver, struct appletbdrm_device, drm);
>>> + if (IS_ERR(adev))
>>> + return PTR_ERR(adev);
>>> +
>>> + adev->dev = dev;
>>> + adev->in_ep = bulk_in->bEndpointAddress;
>>> + adev->out_ep = bulk_out->bEndpointAddress;
>>> +
>>> + usb_set_intfdata(intf, adev);
>> Rather set the DRM device here and fetch it in the callbacks below. At some point, we might be able to share some of those helpers among drivers.
>>
> FWIW
>
> Moving register drm device here results in these errors in journalctl:
>
> Feb 20 15:02:46 MacBook kernel: appletbdrm: loading out-of-tree module taints kernel.
> Feb 20 15:02:46 MacBook kernel: appletbdrm: module verification failed: signature and/or required key missing - tainting kernel
> Feb 20 15:02:46 MacBook kernel: BUG: kernel NULL pointer dereference, address: 0000000000000030
> Feb 20 15:02:46 MacBook kernel: #PF: supervisor read access in kernel mode
> Feb 20 15:02:46 MacBook kernel: #PF: error_code(0x0000) - not-present page
> Feb 20 15:02:46 MacBook kernel: PGD 0 P4D 0
> Feb 20 15:02:46 MacBook kernel: Oops: Oops: 0000 [#1] PREEMPT SMP PTI
> Feb 20 15:02:46 MacBook kernel: CPU: 10 UID: 0 PID: 3530 Comm: modprobe Tainted: G         C OE      6.13.3-1-t2-noble #1
> Feb 20 15:02:46 MacBook kernel: Tainted: [C]=CRAP, [O]=OOT_MODULE, [E]=UNSIGNED_MODULE
> Feb 20 15:02:46 MacBook kernel: Hardware name: Apple Inc. MacBookPro16,1/Mac-E1008331FDC96864, BIOS 2069.80.3.0.0 (iBridge: 22.16.13051.0.0,0) 01/07/2025
> Feb 20 15:02:46 MacBook kernel: RIP: 0010:drm_dev_register+0x1c/0x290
> Feb 20 15:02:46 MacBook kernel: Code: 90 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f 44 00 00 55 48 89 e5 41 57 41 56 41 55 49 89 f5 41 54 53 48 89 fb 48 83 ec 08 <4c> 8b 77 30 49 83 3e 00 0f 84 09 02 00 00 48 83 7b 20 00 0f 84 0e
> Feb 20 15:02:46 MacBook kernel: RSP: 0018:ffffbf4344cbb670 EFLAGS: 00010282
> Feb 20 15:02:46 MacBook kernel: RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
> Feb 20 15:02:46 MacBook kernel: RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> Feb 20 15:02:46 MacBook kernel: RBP: ffffbf4344cbb6a0 R08: 0000000000000000 R09: 0000000000000000
> Feb 20 15:02:46 MacBook kernel: R10: 0000000000000000 R11: 0000000000000000 R12: ffff992a8f114020
> Feb 20 15:02:46 MacBook kernel: R13: 0000000000000000 R14: ffff992a8f115ad8 R15: ffff992a8f114000
> Feb 20 15:02:46 MacBook kernel: FS:  000073572877c080(0000) GS:ffff992deed00000(0000) knlGS:0000000000000000
> Feb 20 15:02:46 MacBook kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> Feb 20 15:02:46 MacBook kernel: CR2: 0000000000000030 CR3: 000000011dd12003 CR4: 00000000003726f0
> Feb 20 15:02:46 MacBook kernel: Call Trace:
> Feb 20 15:02:46 MacBook kernel:  <TASK>
> Feb 20 15:02:46 MacBook kernel:  ? show_regs+0x6c/0x80
> Feb 20 15:02:46 MacBook kernel:  ? __die+0x24/0x80
> Feb 20 15:02:46 MacBook kernel:  ? page_fault_oops+0x175/0x5d0
> Feb 20 15:02:46 MacBook kernel:  ? do_user_addr_fault+0x4b2/0x870
> Feb 20 15:02:46 MacBook kernel:  ? exc_page_fault+0x85/0x1c0
> Feb 20 15:02:46 MacBook kernel:  ? asm_exc_page_fault+0x27/0x30
> Feb 20 15:02:46 MacBook kernel:  ? drm_dev_register+0x1c/0x290
> Feb 20 15:02:46 MacBook kernel:  appletbdrm_probe+0x4eb/0x5f0 [appletbdrm]
> Feb 20 15:02:46 MacBook kernel:  usb_probe_interface+0x168/0x3d0
> Feb 20 15:02:46 MacBook kernel:  really_probe+0xee/0x3c0
> Feb 20 15:02:46 MacBook kernel:  __driver_probe_device+0x8c/0x180
> Feb 20 15:02:46 MacBook kernel:  driver_probe_device+0x24/0xd0
> Feb 20 15:02:46 MacBook kernel:  __driver_attach+0x10b/0x210
> Feb 20 15:02:46 MacBook kernel:  ? __pfx___driver_attach+0x10/0x10
> Feb 20 15:02:46 MacBook kernel:  bus_for_each_dev+0x8a/0xf0
> Feb 20 15:02:46 MacBook kernel:  driver_attach+0x1e/0x30
> Feb 20 15:02:46 MacBook kernel:  bus_add_driver+0x14e/0x290
> Feb 20 15:02:46 MacBook kernel:  driver_register+0x5e/0x130
> Feb 20 15:02:46 MacBook kernel:  usb_register_driver+0x87/0x170
> Feb 20 15:02:46 MacBook kernel:  ? __pfx_appletbdrm_usb_driver_init+0x10/0x10 [appletbdrm]
> Feb 20 15:02:46 MacBook kernel:  appletbdrm_usb_driver_init+0x23/0xff0 [appletbdrm]
> Feb 20 15:02:46 MacBook kernel:  do_one_initcall+0x5b/0x340
> Feb 20 15:02:46 MacBook kernel:  do_init_module+0x97/0x2a0
> Feb 20 15:02:46 MacBook kernel:  load_module+0x2293/0x25c0
> Feb 20 15:02:46 MacBook kernel:  init_module_from_file+0x97/0xe0
> Feb 20 15:02:46 MacBook kernel:  ? init_module_from_file+0x97/0xe0
> Feb 20 15:02:46 MacBook kernel:  idempotent_init_module+0x110/0x300
> Feb 20 15:02:46 MacBook kernel:  __x64_sys_finit_module+0x77/0x100
> Feb 20 15:02:46 MacBook kernel:  x64_sys_call+0x1f37/0x2650
> Feb 20 15:02:46 MacBook kernel:  do_syscall_64+0x7e/0x170
> Feb 20 15:02:46 MacBook kernel:  ? ksys_read+0x72/0xf0
> Feb 20 15:02:46 MacBook kernel:  ? arch_exit_to_user_mode_prepare.isra.0+0x22/0xd0
> Feb 20 15:02:46 MacBook kernel:  ? syscall_exit_to_user_mode+0x38/0x1d0
> Feb 20 15:02:46 MacBook kernel:  ? do_syscall_64+0x8a/0x170
> Feb 20 15:02:46 MacBook kernel:  ? __do_sys_newfstatat+0x44/0x90
> Feb 20 15:02:46 MacBook kernel:  ? ext4_llseek+0xc0/0x120
> Feb 20 15:02:46 MacBook kernel:  ? arch_exit_to_user_mode_prepare.isra.0+0x22/0xd0
> Feb 20 15:02:46 MacBook kernel:  ? syscall_exit_to_user_mode+0x38/0x1d0
> Feb 20 15:02:46 MacBook kernel:  ? do_syscall_64+0x8a/0x170
> Feb 20 15:02:46 MacBook kernel:  ? do_syscall_64+0x8a/0x170
> Feb 20 15:02:46 MacBook kernel:  ? count_memcg_events.constprop.0+0x2a/0x50
> Feb 20 15:02:46 MacBook kernel:  ? handle_mm_fault+0xaf/0x2e0
> Feb 20 15:02:46 MacBook kernel:  ? do_user_addr_fault+0x5d5/0x870
> Feb 20 15:02:46 MacBook kernel:  ? arch_exit_to_user_mode_prepare.isra.0+0x22/0xd0
> Feb 20 15:02:46 MacBook kernel:  ? irqentry_exit_to_user_mode+0x2d/0x1d0
> Feb 20 15:02:46 MacBook kernel:  ? irqentry_exit+0x43/0x50
> Feb 20 15:02:46 MacBook kernel:  ? exc_page_fault+0x96/0x1c0
> Feb 20 15:02:46 MacBook kernel:  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> Feb 20 15:02:46 MacBook kernel: RIP: 0033:0x735727f2725d
> Feb 20 15:02:46 MacBook kernel: Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 8b bb 0d 00 f7 d8 64 89 01 48
> Feb 20 15:02:46 MacBook kernel: RSP: 002b:00007fffd9f88d18 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
> Feb 20 15:02:46 MacBook kernel: RAX: ffffffffffffffda RBX: 000062610c6eb8e0 RCX: 0000735727f2725d
> Feb 20 15:02:46 MacBook kernel: RDX: 0000000000000000 RSI: 00006260e7b3be52 RDI: 0000000000000003
> Feb 20 15:02:46 MacBook kernel: RBP: 00007fffd9f88dd0 R08: 0000000000000040 R09: 00007fffd9f88e50
> Feb 20 15:02:46 MacBook kernel: R10: 0000735728003b20 R11: 0000000000000246 R12: 00006260e7b3be52
> Feb 20 15:02:46 MacBook kernel: R13: 0000000000040000 R14: 000062610c6e4920 R15: 0000000000000000
> Feb 20 15:02:46 MacBook kernel:  </TASK>
>
> The following change was done:
>
> @@ -13,6 +13,7 @@
>   
>   #include <drm/drm_atomic.h>
>   #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_client_setup.h>
>   #include <drm/drm_crtc.h>
>   #include <drm/drm_damage_helper.h>
>   #include <drm/drm_drv.h>
> @@ -596,7 +597,6 @@ static int appletbdrm_setup_mode_config(struct appletbdrm_device *adev)
>   	 * as the height is actually the width of the framebuffer and vice
>   	 * versa
>   	 */
> -
>   	drm->mode_config.min_width = 0;
>   	drm->mode_config.min_height = 0;
>   	drm->mode_config.max_width = max(adev->height, DRM_SHADOW_PLANE_MAX_WIDTH);
> @@ -635,10 +635,6 @@ static int appletbdrm_setup_mode_config(struct appletbdrm_device *adev)
>   
>   	drm_mode_config_reset(drm);
>   
> -	ret = drm_dev_register(drm, 0);
> -	if (ret)
> -		return dev_err_probe(dev, ret, "Failed to register DRM device\n");
> -
>   	return 0;
>   }
>   
> @@ -648,6 +644,7 @@ static int appletbdrm_probe(struct usb_interface *intf,
>   	struct usb_endpoint_descriptor *bulk_in, *bulk_out;
>   	struct device *dev = &intf->dev;
>   	struct appletbdrm_device *adev;
> +	struct drm_device *drm;

Because you apparently never initialize this variable.

>   	int ret;
>   
>   	ret = usb_find_common_endpoints(intf->cur_altsetting, &bulk_in, &bulk_out, NULL, NULL);
> @@ -676,7 +673,17 @@ static int appletbdrm_probe(struct usb_interface *intf,
>   	if (ret)
>   		return dev_err_probe(dev, ret, "Failed to clear display\n");
>   
> -	return appletbdrm_setup_mode_config(adev);
> +	ret = appletbdrm_setup_mode_config(adev);
> +	if (ret)
> +		return ret;
> +
> +	ret = drm_dev_register(drm, 0);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to register DRM device\n");
> +
> +	drm_client_setup(drm, NULL);

You won't need a DRM client on the touch bar. Just clearing the display 
should be enough.

Best regards
Thomas

> +
> +	return 0;
>   }
>   
>   static void appletbdrm_disconnect(struct usb_interface *intf)
>
>>> +
>>> + ret = appletbdrm_get_information(adev);
>>> + if (ret)
>>> + return dev_err_probe(dev, ret, "Failed to get display information\n");
>>> +
>>> + ret = appletbdrm_signal_readiness(adev);
>>> + if (ret)
>>> + return dev_err_probe(dev, ret, "Failed to signal readiness\n");
>>> +
>>> + ret = appletbdrm_clear_display(adev);
>>> + if (ret)
>>> + return dev_err_probe(dev, ret, "Failed to clear display\n");
>> Clearing the display is not something usually done in probe. But I guess there's no better place. I'd do this as the final call in probe; after registering the device.  That way, it acts a bit like an in-kernel DRM client.
>>
>> Best regards
>> Thomas
>>
>>> +
>>> + return appletbdrm_setup_mode_config(adev);
>>> +}
>>> +
>>> +static void appletbdrm_disconnect(struct usb_interface *intf)
>>> +{
>>> + struct appletbdrm_device *adev = usb_get_intfdata(intf);
>>> + struct drm_device *drm = &adev->drm;
>>> +
>>> + drm_dev_unplug(drm);
>>> + drm_atomic_helper_shutdown(drm);
>>> +}
>>> +
>>> +static void appletbdrm_shutdown(struct usb_interface *intf)
>>> +{
>>> + struct appletbdrm_device *adev = usb_get_intfdata(intf);
>>> +
>>> + /*
>>> +  * The framebuffer needs to be cleared on shutdown since its content
>>> +  * persists across boots
>>> +  */
>>> + drm_atomic_helper_shutdown(&adev->drm);
>>> +}
>>> +
>>> +static const struct usb_device_id appletbdrm_usb_id_table[] = {
>>> + { USB_DEVICE_INTERFACE_CLASS(0x05ac, 0x8302, USB_CLASS_AUDIO_VIDEO) },
>>> + {}
>>> +};
>>> +MODULE_DEVICE_TABLE(usb, appletbdrm_usb_id_table);
>>> +
>>> +static struct usb_driver appletbdrm_usb_driver = {
>>> + .name = "appletbdrm",
>>> + .probe = appletbdrm_probe,
>>> + .disconnect = appletbdrm_disconnect,
>>> + .shutdown = appletbdrm_shutdown,
>>> + .id_table = appletbdrm_usb_id_table,
>>> +};
>>> +module_usb_driver(appletbdrm_usb_driver);
>>> +
>>> +MODULE_AUTHOR("Kerem Karabay <kekrby@gmail.com>");
>>> +MODULE_DESCRIPTION("Apple Touch Bar DRM Driver");
>>> +MODULE_LICENSE("GPL");
> Regards
> Aditya
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

