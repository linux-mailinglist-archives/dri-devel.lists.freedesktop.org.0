Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D012E7F78
	for <lists+dri-devel@lfdr.de>; Thu, 31 Dec 2020 11:49:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 835C989B29;
	Thu, 31 Dec 2020 10:49:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 551 seconds by postgrey-1.36 at gabe;
 Thu, 31 Dec 2020 10:49:42 UTC
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED81C89B29
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Dec 2020 10:49:42 +0000 (UTC)
Received: from zn.tnic (p200300ec2f124d0039872c1ff537e51e.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f12:4d00:3987:2c1f:f537:e51e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 3FB361EC03CE;
 Thu, 31 Dec 2020 11:40:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1609411226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=CGkbQx8XNG4AbiKIqB1M2Nix3gUxwKOdRh7rCPC0lPo=;
 b=Du14qV8NhI+jvQSZPVMf7m1OkWfoD82DOgwVBMHS7wcG+FKICMIOYh23/f+hnIhieypDp+
 PekXfY5JvXY6NcBK84HiHb77dnbEvN12OdLIPgreloRNjax0hA7RO5yAfGRgrwTPDYwxTn
 HCbHU8WkZx8DVPeVlAlmQGerFEEe68k=
Date: Thu, 31 Dec 2020 11:40:20 +0100
From: Borislav Petkov <bp@alien8.de>
To: Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: 5.11-rc1 TTM list corruption
Message-ID: <20201231104020.GA4504@zn.tnic>
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: lkml <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi folks,

got this when trying to suspend my workstation to disk, it was still
responsive so I could catch the splat:

[22020.334381] ------------[ cut here ]------------
[22020.339057] list_del corruption. next->prev should be ffffffff8b7a9a40, but was ffff8881020bced0
[22020.347764] WARNING: CPU: 12 PID: 13134 at lib/list_debug.c:54 __list_del_entry_valid+0x8a/0x90
[22020.356397] Modules linked in: fuse essiv authenc nft_counter nf_tables libcrc32c nfnetlink loop dm_crypt dm_mod amd64_edac edac_mce_amd kvm_amd snd_hda_codec_realtek snd_hda_codec_generic led_class kvm ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_hda_core snd_pcm snd_timer irqbypass crct10dif_pclmul snd crc32_pclmul crc32c_intel ghash_clmulni_intel pcspkr k10temp soundcore gpio_amdpt gpio_generic acpi_cpufreq radeon aesni_intel glue_helper crypto_simd cryptd pinctrl_amd
[22020.400855] CPU: 12 PID: 13134 Comm: hib.sh Not tainted 5.11.0-rc1+ #2
[22020.400857] Hardware name: Micro-Star International Co., Ltd. MS-7B79/X470 GAMING PRO (MS-7B79), BIOS 1.70 01/23/2019
[22020.400858] RIP: 0010:__list_del_entry_valid+0x8a/0x90
[22020.400861] Code: 46 00 0f 0b 31 c0 c3 48 89 f2 48 89 fe 48 c7 c7 78 30 0f 82 e8 24 6c 46 00 0f 0b 31 c0 c3 48 c7 c7 b8 30 0f 82 e8 13 6c 46 00 <0f> 0b 31 c0 c3 cc 48 85 d2 89 f8 74 20 48 8d 0c 16 0f b6 16 48 ff
[22020.400863] RSP: 0018:ffffc90001fbbcf8 EFLAGS: 00010292
[22020.441503] RAX: 0000000000000054 RBX: ffffffff8b7a9a40 RCX: 0000000000000000
[22020.441505] RDX: ffff8887fef26600 RSI: ffff8887fef17450 RDI: ffff8887fef17450
[22020.441505] RBP: 0000000000003f82 R08: ffff8887fef17450 R09: ffffc90001fbbb38
[22020.441506] R10: 0000000000000001 R11: 0000000000000001 R12: 0000000000000000
[22020.441507] R13: 0000000000000080 R14: 0000000000000480 R15: 000000000000019b
[22020.441508] FS:  00007f51c72f9740(0000) GS:ffff8887fef00000(0000) knlGS:0000000000000000
[22020.490045] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[22020.490046] CR2: 00005557afb81018 CR3: 000000012099e000 CR4: 00000000003506e0
[22020.490047] Call Trace:
[22020.490048]  ttm_pool_shrink+0x61/0xd0
[22020.508965]  ttm_pool_shrinker_scan+0xa/0x20
[22020.508966]  shrink_slab.part.0.constprop.0+0x1a1/0x330
[22020.508970]  drop_slab_node+0x37/0x50
[22020.522011]  drop_slab+0x33/0x60
[22020.522012]  drop_caches_sysctl_handler+0x70/0x80
[22020.522015]  proc_sys_call_handler+0x140/0x220
[22020.534286]  new_sync_write+0x10b/0x190
[22020.534289]  vfs_write+0x1b7/0x290
[22020.534291]  ksys_write+0x60/0xe0
[22020.544762]  do_syscall_64+0x33/0x40
[22020.544765]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[22020.553320] RIP: 0033:0x7f51c73eaff3
[22020.553322] Code: 8b 15 a1 ee 0c 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b7 0f 1f 00 64 8b 04 25 18 00 00 00 85 c0 75 14 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 55 c3 0f 1f 40 00 48 83 ec 28 48 89 54 24 18
[22020.553324] RSP: 002b:00007ffd0a748ef8 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
[22020.553325] RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 00007f51c73eaff3
[22020.553326] RDX: 0000000000000002 RSI: 000056039fd0ee70 RDI: 0000000000000001
[22020.553327] RBP: 000056039fd0ee70 R08: 000000000000000a R09: 0000000000000001
[22020.553327] R10: 000056039fd0e770 R11: 0000000000000246 R12: 0000000000000002
[22020.611218] R13: 00007f51c74bb6a0 R14: 0000000000000002 R15: 00007f51c74bb8a0
[22020.611220] ---[ end trace f7ea94a6ddb98f71 ]---

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
