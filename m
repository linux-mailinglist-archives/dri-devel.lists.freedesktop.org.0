Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2317942A8DE
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 17:53:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F6F589E50;
	Tue, 12 Oct 2021 15:53:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 507 seconds by postgrey-1.36 at gabe;
 Tue, 12 Oct 2021 15:53:40 UTC
Received: from torino.frehi.be (torino.frehi.be
 [IPv6:2001:41d0:305:2100::9623])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72DF589E50
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 15:53:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by torino.frehi.be (Postfix) with ESMTP id EA7431FAA58;
 Tue, 12 Oct 2021 17:45:11 +0200 (CEST)
Received: from torino.frehi.be ([127.0.0.1])
 by localhost (torino.frehi.be [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id BbNA2ecM6q7v; Tue, 12 Oct 2021 17:45:09 +0200 (CEST)
Received: from [IPv6:2a02:1812:170e:7e00:163:775c:3111:e97c]
 (ptr-g1yij6vdlbrzqxdseik.18120a2.ip6.access.telenet.be
 [IPv6:2a02:1812:170e:7e00:163:775c:3111:e97c])
 by torino.frehi.be (Postfix) with ESMTPSA id 497661FAA56;
 Tue, 12 Oct 2021 17:45:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=frehi.be;
 s=torino-201912; t=1634053509;
 bh=cBNkBItdysMVyXv98F7oemkkShJX6LrrQF4r9Kp5M9k=;
 h=Subject:From:To:Cc:Date:From;
 b=JHHQU0xnuuaCBRySASDesexFhgmLijZDfE3AFrP39bFC/D1Dr+tQJ/aFqc5yNMkZe
 vAKEcgPbS6+wGREy0u5AWzGN7SW0uf9hjKSiHtISi8Ugs5QpyxhdqByc1VkqFEviUi
 P2sdsF4/47jfxylhYCDfbSocjGYGk0QfEMVA8InOJyc2vPZrLOXGq/hKYyGwAR2dEx
 ibBxPjjiXOE+9JhtF1Me5syD0bWI9XKYLOz/HRnxfbm2qldc1/Fpae2uJnT6AYuvOa
 c4T3BGmCQORiDAP0R26/yc4QrH9SfBm+rBu2NCMdqH1Ryh9JsMhMRpZzdHfaVKcuBS
 Nz/lzvQ8VZgnA==
Message-ID: <836645f60d21bce825bfe773253445d62d24519a.camel@frehi.be>
Subject: 5.14.9: warning at drivers/gpu/drm/ttm/ttm_bo.c:409 with amdgpu
From: Frederik Himpe <frederik@frehi.be>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Date: Tue, 12 Oct 2021 17:45:08 +0200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.0-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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

With Linux 5.14 kernel series, I often get this warning:

okt 12 16:36:05 piranha kernel: ------------[ cut here ]------------
okt 12 16:36:05 piranha kernel: WARNING: CPU: 11 PID: 1 at drivers/gpu/drm/ttm/ttm_bo.c:409 ttm_bo_release+0x2d1/0x300 [ttm]
okt 12 16:36:05 piranha kernel: Modules linked in: xt_recent ip6t_REJECT nf_reject_ipv6 xt_multiport xt_comment ip6_tables xt_hashlimit xt_mark xt_CT xt_NFLOG nfnetlink_log xt_LOG nf_log_syslog nf_conntrack_tftp nf_conntrack_sip nf_connt>
okt 12 16:36:05 piranha kernel:  gpu_sched radeon ppdev snd_hda_codec drm_ttm_helper ttm aesni_intel snd_hda_core evdev crypto_simd snd_hwdep drm_kms_helper snd_pcm cryptd wmi_bmof pcspkr rapl efi_pstore snd_timer bfq cec ccp snd rc_core>
okt 12 16:36:05 piranha kernel: CPU: 11 PID: 1 Comm: systemd Not tainted 5.14.0-2-amd64 #1  Debian 5.14.9-2
okt 12 16:36:05 piranha kernel: Hardware name: Micro-Star International Co., Ltd. MS-7A34/B350 PC MATE (MS-7A34), BIOS A.J0 01/23/2019
okt 12 16:36:05 piranha kernel: RIP: 0010:ttm_bo_release+0x2d1/0x300 [ttm]
okt 12 16:36:05 piranha kernel: Code: 65 23 00 00 e9 83 fd ff ff e8 3b 0e 31 ce e9 bc fd ff ff 49 8b 7e 98 b9 4c 1d 00 00 31 d2 be 01 00 00 00 e8 a1 32 31 ce eb a2 <0f> 0b e9 50 fd ff ff e8 d3 13 31 ce e9 fd fe ff ff be 03 00 00 00
okt 12 16:36:05 piranha kernel: RSP: 0018:ffffa84d8003be18 EFLAGS: 00010202
okt 12 16:36:05 piranha kernel: RAX: 0000000000000001 RBX: ffffa84d8003be60 RCX: 0000000000000000
okt 12 16:36:05 piranha kernel: RDX: 0000000000000001 RSI: ffff95e4abf95b00 RDI: ffff95e482cde9b8
okt 12 16:36:05 piranha kernel: RBP: ffff95e486f05288 R08: ffff95e482cde9b8 R09: 0000000000000064
okt 12 16:36:05 piranha kernel: R10: 0000000000000010 R11: ffff95e4f8c23a10 R12: ffff95e4d28f2a18
okt 12 16:36:05 piranha kernel: R13: ffff95e482cde858 R14: ffff95e482cde9b8 R15: 0000000000000000
okt 12 16:36:05 piranha kernel: FS:  00007f269dee6900(0000) GS:ffff95e78eec0000(0000) knlGS:0000000000000000
okt 12 16:36:05 piranha kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
okt 12 16:36:05 piranha kernel: CR2: 0000563fbde29530 CR3: 00000001045ee000 CR4: 00000000003506e0
okt 12 16:36:05 piranha kernel: Call Trace:
okt 12 16:36:05 piranha kernel:  amdgpu_bo_unref+0x1a/0x30 [amdgpu]
okt 12 16:36:05 piranha kernel:  amdgpu_gem_object_free+0x30/0x50 [amdgpu]
okt 12 16:36:05 piranha kernel:  drm_gem_dmabuf_release+0x36/0x50 [drm]
okt 12 16:36:05 piranha kernel:  dma_buf_release+0x3a/0x80
okt 12 16:36:05 piranha kernel:  __dentry_kill+0x106/0x180
okt 12 16:36:05 piranha kernel:  __fput+0xe3/0x240
okt 12 16:36:05 piranha kernel:  task_work_run+0x65/0xa0
okt 12 16:36:05 piranha kernel:  exit_to_user_mode_prepare+0x173/0x180
okt 12 16:36:05 piranha kernel:  syscall_exit_to_user_mode+0x23/0x40
okt 12 16:36:05 piranha kernel:  ? __x64_sys_close+0xe/0x40
okt 12 16:36:05 piranha kernel:  do_syscall_64+0x48/0xc0
okt 12 16:36:05 piranha kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xae
okt 12 16:36:05 piranha kernel: RIP: 0033:0x7f269e79b8bb
okt 12 16:36:05 piranha kernel: Code: 0f 05 48 3d 00 f0 ff ff 77 45 c3 0f 1f 40 00 48 83 ec 18 89 7c 24 0c e8 83 fb ff ff 8b 7c 24 0c 41 89 c0 b8 03 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 35 44 89 c7 89 44 24 0c e8 e1 fb ff ff 8b 44
okt 12 16:36:05 piranha kernel: RSP: 002b:00007fffc3c46910 EFLAGS: 00000293 ORIG_RAX: 0000000000000003
okt 12 16:36:05 piranha kernel: RAX: 0000000000000000 RBX: 00007f269dee66d0 RCX: 00007f269e79b8bb
okt 12 16:36:05 piranha kernel: RDX: 0000000000000002 RSI: 0000000563fbdd73 RDI: 0000000000000019
okt 12 16:36:05 piranha kernel: RBP: 0000000000000019 R08: 0000000000000000 R09: 0000563fbbf5f8ca
okt 12 16:36:05 piranha kernel: R10: 0000000000000000 R11: 0000000000000293 R12: 0000000000000000
okt 12 16:36:05 piranha kernel: R13: 0000000000000000 R14: 0000563fbbf61108 R15: 0000563fbde422a0
okt 12 16:36:05 piranha kernel: ---[ end trace 807bb557a05dc0c6 ]---

It seems to happen often at shutdown but also shortly after boot. I'm
also experiencing frequent hangs on this system, but I don't know
whether these are related to this warning.

The graphics card is:
1c:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc. [AMD/ATI] Pitcairn PRO [Radeon HD 7850 / R7 265 / R9 270 1024SP] [1002:6819]

and I'm using these boot options:
radeon.si_support=0 amdgpu.si_support=1

This seems to be the same problem as reported here for 5.15-rc4:
https://bugzilla.kernel.org/show_bug.cgi?id=214621


-- 
Frederik Himpe <frederik@frehi.be>
