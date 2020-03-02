Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B101767C3
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 00:03:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC506E4E3;
	Mon,  2 Mar 2020 23:03:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0B986E4BB
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 23:03:30 +0000 (UTC)
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6302C21739;
 Mon,  2 Mar 2020 23:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583190210;
 bh=/GsCAO3U7fnxhRfomwC4LMeOapm1BCX2i9Dm0HCF5z8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cel2gpazJdtpABYqDP18UXg1P+Zg6Zotql5Ju9ExTs5nbD1EGaClPgsgeuDI2V8ZS
 993p6c6p0dtxqSjJ077/thRuTI+pmin0XZ+c7ov7azWTp2hkmlmGZP5uEm2dnejna8
 82aQ3vouZHnriKnbiuzPV5LEvim8IuVZXuxh0UZ8=
Date: Mon, 2 Mar 2020 15:03:29 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: erhard_f@mailbox.org
Subject: Re: [Bug 206697] #PF: supervisor read access in kernel mode, #PF:
 error_code(0x0000) - not-present page while building a large project
Message-Id: <20200302150329.773bfeb8a1e4bc02b0f06e49@linux-foundation.org>
In-Reply-To: <bug-206697-27-AARxZEfI7A@https.bugzilla.kernel.org/>
References: <bug-206697-27@https.bugzilla.kernel.org/>
 <bug-206697-27-AARxZEfI7A@https.bugzilla.kernel.org/>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, bugzilla-daemon@bugzilla.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Huang Rui <ray.huang@amd.com>, Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


(switched to email.  Please respond via emailed reply-to-all, not via the
bugzilla web interface).

On Mon, 02 Mar 2020 21:55:10 +0000 bugzilla-daemon@bugzilla.kernel.org wrote:

> https://bugzilla.kernel.org/show_bug.cgi?id=206697
> 
> --- Comment #2 from Erhard F. (erhard_f@mailbox.org) ---
> Created attachment 287765
>   --> https://bugzilla.kernel.org/attachment.cgi?id=287765&action=edit
> dmesg (kernel 5.6-rc4, Shuttle XPC FS51, Pentium 4)
> 
> Same on kernel 5.6-rc4:

Thanks.  This looks like a regression in the DRM code.  I've added
suitable Ccs.


> [...]
> [  908.356444] BUG: kernel NULL pointer dereference, address: 00000000
> [  908.356670] #PF: supervisor read access in kernel mode
> [  908.356823] #PF: error_code(0x0000) - not-present page
> [  908.356974] *pde = 00000000 
> [  908.357064] Oops: 0000 [#1] SMP
> [  908.357163] CPU: 0 PID: 53 Comm: kswapd0 Not tainted 5.6.0-rc4-Pentium4 #1
> [  908.357367] Hardware name:  /FS51, BIOS 6.00 PG 12/02/2003
> [  908.357535] EIP: __cpa_process_fault+0x205/0x226
> [  908.357674] Code: 2d 00 00 00 40 39 d0 76 1f 81 fa ff ff ff bf 76 17 c7 47
> 10 01 00 00 00 81 c3 00 00 00 40 c1 eb 0c 89 5f 18 31 f6 eb 19 8b 07 <ff> 30 53
> 68 56 ba 89 c9 e8 f8 68 00 00 0f 0b 83 c4 0c be f2 ff ff
> [  908.358228] EAX: 00000000 EBX: 00000000 ECX: 00000001 EDX: 00000000
> [  908.358411] ESI: 00000001 EDI: f5e6fd4c EBP: f5e6fcc4 ESP: f5e6fca0
> [  908.358598] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00010213
> [  908.358798] CR0: 80050033 CR2: 00000000 CR3: 00333000 CR4: 000006d0
> [  908.358981] Call Trace:
> [  908.359062]  ? _raw_spin_lock+0x22/0x2a
> [  908.359176]  ? lookup_address+0x1d/0x20
> [  908.359289]  __change_page_attr_set_clr+0x85/0x551
> [  908.359436]  ? __mutex_unlock_slowpath+0x20/0x1b6
> [  908.368244]  ? mutex_unlock+0xb/0xd
> [  908.377037]  ? _vm_unmap_aliases.part.0+0x11f/0x127
> [  908.385944]  change_page_attr_set_clr+0xdc/0x1af
> [  908.394889]  set_pages_array_wb+0x20/0x7b
> [  908.403630]  ttm_pages_put+0x22/0x71 [ttm]
> [  908.412159]  ttm_page_pool_free+0xf6/0x111 [ttm]
> [  908.420492]  ttm_pool_shrink_scan+0x9c/0xd1 [ttm]
> [  908.428885]  shrink_slab.constprop.0+0x248/0x38f
> [  908.437241]  shrink_node+0x533/0x6f2
> [  908.445492]  kswapd+0x4b9/0x62d
> [  908.453714]  ? kswapd+0x4b9/0x62d
> [  908.461937]  kthread+0xd1/0xd3
> [  908.470055]  ? try_to_free_pages+0x3d4/0x3d4
> [  908.478143]  ? kthread_delayed_work_timer_fn+0x6a/0x6a
> [  908.486242]  ret_from_fork+0x2e/0x38
> [  908.494256] Modules linked in: auth_rpcgss nfsv4 dns_resolver nfs lockd
> grace sunrpc ctr aes_generic libaes ccm hid_generic usbhid hid rt2500pci
> eeprom_93cx6 rt2x00pci rt2x00mmio rt2x00lib led_class mac80211 radeon evdev
> hwmon i2c_algo_bit drm_kms_helper cfbfillrect syscopyarea cfg80211 cfbimgblt
> sysfillrect sysimgblt fb_sys_fops cfbcopyarea firewire_ohci firewire_core fb
> rfkill font crc_itu_t 8139too libarc4 mii fbdev sr_mod cdrom ttm thermal fan
> ohci_pci drm 8250 snd_intel8x0 8250_base serial_core snd_ac97_codec ac97_bus
> ehci_pci ohci_hcd snd_pcm drm_panel_orientation_quirks ehci_hcd button
> backlight snd_timer usbcore sis_agp agpgart snd i2c_sis96x usb_common processor
> soundcore zstd zram zsmalloc
> [  908.522107] CR2: 0000000000000000
> [  908.531646] ---[ end trace f8cc5b63e4c76d19 ]---
> [  908.541190] EIP: __cpa_process_fault+0x205/0x226
> [  908.550708] Code: 2d 00 00 00 40 39 d0 76 1f 81 fa ff ff ff bf 76 17 c7 47
> 10 01 00 00 00 81 c3 00 00 00 40 c1 eb 0c 89 5f 18 31 f6 eb 19 8b 07 <ff> 30 53
> 68 56 ba 89 c9 e8 f8 68 00 00 0f 0b 83 c4 0c be f2 ff ff
> [  908.560958] EAX: 00000000 EBX: 00000000 ECX: 00000001 EDX: 00000000
> [  908.571156] ESI: 00000001 EDI: f5e6fd4c EBP: f5e6fcc4 ESP: f5e6fca0
> [  908.581412] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00010213
> [  908.591710] CR0: 80050033 CR2: 00000000 CR3: 00333000 CR4: 000006d0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
