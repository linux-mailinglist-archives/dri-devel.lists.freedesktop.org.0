Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC76820AD4F
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 09:36:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB37A6E415;
	Fri, 26 Jun 2020 07:36:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCC9C6EA42
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 10:22:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3BC2FAC91;
 Thu, 25 Jun 2020 10:22:23 +0000 (UTC)
Received: from localhost (webern.olymp [local])
 by webern.olymp (OpenSMTPD) with ESMTPA id fff887b2;
 Thu, 25 Jun 2020 11:22:21 +0100 (WEST)
Date: Thu, 25 Jun 2020 11:22:21 +0100
From: Luis Henriques <lhenriques@suse.de>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: Warning triggered in drm_dp_delayed_destroy_work workqueue
Message-ID: <20200625102221.GA66817@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Approved-At: Fri, 26 Jun 2020 07:36:15 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi!

I've been seeing this warning occasionally, not sure if it has been
reported yet.  It's not a regression as I remember seeing it in, at least,
5.7.

Anyway, here it is:

------------[ cut here ]------------
sysfs group 'power' not found for kobject 'i2c-7'
WARNING: CPU: 1 PID: 17996 at fs/sysfs/group.c:279 sysfs_remove_group+0x74/0x80
Modules linked in: ccm(E) dell_rbtn(E) iwlmvm(E) mei_wdt(E) mac80211(E) libarc4(E) uvcvideo(E) dell_laptop(E) videobuf2_vmalloc(E) intel_rapl_>
 soundcore(E) intel_soc_dts_iosf(E) rng_core(E) battery(E) acpi_pad(E) sparse_keymap(E) acpi_thermal_rel(E) intel_pch_thermal(E) int3402_therm>
 sysfillrect(E) intel_lpss(E) sysimgblt(E) fb_sys_fops(E) idma64(E) scsi_mod(E) virt_dma(E) mfd_core(E) drm(E) fan(E) thermal(E) i2c_hid(E) hi>
CPU: 1 PID: 17996 Comm: kworker/1:1 Tainted: G            E     5.8.0-rc2+ #36
Hardware name: Dell Inc. Precision 5510/0N8J4R, BIOS 1.14.2 05/25/2020
Workqueue: events drm_dp_delayed_destroy_work [drm_kms_helper]
RIP: 0010:sysfs_remove_group+0x74/0x80
Code: ff 5b 48 89 ef 5d 41 5c e9 79 bc ff ff 48 89 ef e8 01 b8 ff ff eb cc 49 8b 14 24 48 8b 33 48 c7 c7 90 ac 8b 93 e8 de b1 d4 ff <0f> 0b 5b>
RSP: 0000:ffffb12d40c13c38 EFLAGS: 00010282
RAX: 0000000000000000 RBX: ffffffff936e6a60 RCX: 0000000000000027
RDX: 0000000000000027 RSI: 0000000000000086 RDI: ffff8e37de097b68
RBP: 0000000000000000 R08: ffff8e37de097b60 R09: ffffffff93fb4624
R10: 0000000000000904 R11: 000000000001002c R12: ffff8e37d3081c18
R13: ffff8e375f1450a8 R14: 0000000000000000 R15: ffff8e375f145410
FS:  0000000000000000(0000) GS:ffff8e37de080000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 00000004ab20a001 CR4: 00000000003606e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 device_del+0x97/0x3f0
 cdev_device_del+0x15/0x30
 put_i2c_dev+0x7b/0x90 [i2c_dev]
 i2cdev_detach_adapter+0x33/0x60 [i2c_dev]
 notifier_call_chain+0x47/0x70
 blocking_notifier_call_chain+0x3d/0x60
 device_del+0x8f/0x3f0
 device_unregister+0x16/0x60
 i2c_del_adapter+0x247/0x300
 drm_dp_port_set_pdt+0x90/0x2c0 [drm_kms_helper]
 drm_dp_delayed_destroy_work+0x2be/0x340 [drm_kms_helper]
 process_one_work+0x1ae/0x370
 worker_thread+0x50/0x3a0
 ? process_one_work+0x370/0x370
 kthread+0x11b/0x140
 ? kthread_associate_blkcg+0x90/0x90
 ret_from_fork+0x22/0x30
---[ end trace 16486ad3c2627482 ]---
------------[ cut here ]------------

Cheers,
--
Luis
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
