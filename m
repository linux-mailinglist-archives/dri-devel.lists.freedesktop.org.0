Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 610953D2CBC
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 21:29:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B63E36EA37;
	Thu, 22 Jul 2021 19:28:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 407 seconds by postgrey-1.36 at gabe;
 Thu, 22 Jul 2021 19:28:57 UTC
Received: from hosting.gsystem.sk (hosting.gsystem.sk [212.5.213.30])
 by gabe.freedesktop.org (Postfix) with ESMTP id 57B376EA37;
 Thu, 22 Jul 2021 19:28:57 +0000 (UTC)
Received: from [192.168.0.2] (188-167-68-178.dynamic.chello.sk
 [188.167.68.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by hosting.gsystem.sk (Postfix) with ESMTPSA id 50A927A003B;
 Thu, 22 Jul 2021 21:22:08 +0200 (CEST)
From: Ondrej Zary <linux@zary.sk>
To: Christian =?iso-8859-1?q?K=F6nig?= <christian.koenig@amd.com>
Subject: nouveau broken again on Riva TNT2 in 5.14.0-rc2
Date: Thu, 22 Jul 2021 21:22:05 +0200
User-Agent: KMail/1.9.10
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <202107222122.05546.linux@zary.sk>
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
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,
nouveau is broken again:

[   58.795794] BUG: kernel NULL pointer dereference, address: 0000017c
[   58.795835] #PF: supervisor read access in kernel mode
[   58.795844] #PF: error_code(0x0000) - not-present page
[   58.795851] *pde = 00000000
[   58.795862] Oops: 0000 [#1] SMP
[   58.795875] CPU: 0 PID: 1730 Comm: Xorg Not tainted 5.14.0-rc2+ #391
[   58.795886] Hardware name: VIA Technologies, Inc. VT82C694X/694X, BIOS 6.00 PG 02/19/2002
[   58.795894] EIP: nouveau_bo_wr16+0x8/0x27 [nouveau]
[   58.796716] Code: 85 ff 74 0d 80 7d f3 00 74 07 80 a6 c0 01 00 00 fe 89 f0 e8 e5 ee ff ff 8d 65 f4 89 f8 5b 5e 5f 5d c3 55 01 d2 89 e5 53 89 c3 <03> 93 7c 01 00 00 0f b7 c1 f6 83 84 01 00 00 80 74 07 e8 8a bc 72
[   58.796728] EAX: 00000000 EBX: 00000000 ECX: 00000000 EDX: 00000000
[   58.796736] ESI: 00000020 EDI: c18bc600 EBP: c7c49d88 ESP: c7c49d84
[   58.796744] DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068 EFLAGS: 00210246
[   58.796754] CR0: 80050033 CR2: 0000017c CR3: 07e12000 CR4: 00000690
[   58.796762] Call Trace:
[   58.796774]  nv04_crtc_cursor_set+0x148/0x1d8 [nouveau]
[   58.796952]  ? ttm_bo_reserve.constprop.16+0x1c/0x1c [nouveau]
[   58.797122]  drm_mode_cursor_common+0x13b/0x1ad
[   58.797150]  ? ttm_bo_reserve.constprop.16+0x1c/0x1c [nouveau]
[   58.797322]  drm_mode_cursor_ioctl+0x2e/0x36
[   58.797335]  ? drm_mode_setplane+0x203/0x203
[   58.797346]  drm_ioctl_kernel+0x66/0x99
[   58.797366]  drm_ioctl+0x211/0x2d8
[   58.797377]  ? drm_mode_setplane+0x203/0x203
[   58.797389]  ? __cond_resched+0x1e/0x22
[   58.797409]  ? mutex_lock+0xb/0x24
[   58.797422]  ? rpm_resume.part.14+0x6f/0x362
[   58.797447]  ? ktime_get_mono_fast_ns+0x5e/0xf2
[   58.797469]  ? __pm_runtime_resume+0x5b/0x63
[   58.797480]  nouveau_drm_ioctl+0x65/0x81 [nouveau]
[   58.797662]  ? nouveau_cli_work+0xc3/0xc3 [nouveau]
[   58.797838]  vfs_ioctl+0x1a/0x24
[   58.797850]  __ia32_sys_ioctl+0x6ea/0x704
[   58.797861]  ? doublefault_shim+0x120/0x120
[   58.797872]  ? exit_to_user_mode_prepare+0x9e/0x10c
[   58.797900]  do_int80_syscall_32+0x53/0x6e
[   58.797910]  entry_INT80_32+0xf0/0xf0
[   58.797923] EIP: 0xb7f04092
[   58.797932] Code: 00 00 00 e9 90 ff ff ff ff a3 24 00 00 00 68 30 00 00 00 e9 80 ff ff ff ff a3 e8 ff ff ff 66 90 00 00 00 00 00 00 00 00 cd 80 <c3> 8d b4 26 00 00 00 00 8d b6 00 00 00 00 8b 1c 24 c3 8d b4 26 00
[   58.797943] EAX: ffffffda EBX: 0000000e ECX: c01c64a3 EDX: bf9a15c0
[   58.797952] ESI: 00997850 EDI: c01c64a3 EBP: 0000000e ESP: bf9a1574
[   58.797959] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS: 00200292
[   58.797972] Modules linked in: i2c_dev nouveau wmi hwmon drm_ttm_helper psmouse serio_raw via_agp sg parport_pc 8139cp parport
[   58.798016] CR2: 000000000000017c
[   58.798147] ---[ end trace 732829d39ed65de9 ]---


d02117f8efaa5fbc37437df1ae955a147a2a424a is the first bad commit

-- 
Ondrej Zary
