Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 372377A41FE
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 09:17:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E1C10E1D5;
	Mon, 18 Sep 2023 07:16:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 8.mo560.mail-out.ovh.net (8.mo560.mail-out.ovh.net
 [188.165.52.147])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A91FA10E4AE
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 12:19:08 +0000 (UTC)
Received: from director9.ghost.mail-out.ovh.net (unknown [10.109.156.164])
 by mo560.mail-out.ovh.net (Postfix) with ESMTP id B372F22C43
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 12:19:06 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-wcl26 (unknown [10.110.171.185])
 by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 310891FE9D;
 Wed, 13 Sep 2023 12:19:05 +0000 (UTC)
Received: from foxhound.fi ([37.59.142.95])
 by ghost-submission-6684bf9d7b-wcl26 with ESMTPSA
 id AjfFB7moAWVcSQwAZu02Bw
 (envelope-from <jose.pekkarinen@foxhound.fi>); Wed, 13 Sep 2023 12:19:05 +0000
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001570f04b8-d8ce-4485-bc59-0a46056bb914,
 DC2EF514C16DA978A4B56AB6E34F69DC0F88BBA7)
 smtp.auth=jose.pekkarinen@foxhound.fi
X-OVh-ClientIp: 91.157.108.232
From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: airlied@gmail.com,
	daniel@ffwll.ch,
	skhan@linuxfoundation.org
Subject: [PATCH] drm/tests: provide exit function
Date: Wed, 13 Sep 2023 15:19:00 +0300
Message-Id: <20230913121900.11814-1-jose.pekkarinen@foxhound.fi>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12158030146281776806
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrudeikedghedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomheplfhoshorucfrvghkkhgrrhhinhgvnhcuoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqeenucggtffrrghtthgvrhhnpeeftdelueetieetvdettdetueeivedujeefffdvteefkeelhefhleelfeetteejjeenucfkphepuddvjedrtddrtddruddpledurdduheejrddutdekrddvfedvpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdfovfetjfhoshhtpehmohehiedtpdhmohguvgepshhmthhpohhuth
X-Mailman-Approved-At: Mon, 18 Sep 2023 07:16:21 +0000
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
Cc: javierm@redhat.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mairacanal@riseup.net,
 =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@foxhound.fi>,
 mripard@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Similarly to the drm_exec_test module, the drm_modes_test
shows the following output on dmesg on load:

[ 5556.674834] KTAP version 1
[ 5556.674841] 1..1
[ 5556.675317]     KTAP version 1
[ 5556.675321]     # Subtest: drm_modes_analog_tv
[ 5556.675323]     # module: drm_modes_test
[ 5556.675327]     1..4
[ 5556.683731] ==================================================================
[ 5556.683777] BUG: KASAN: slab-use-after-free in drm_dev_put.part.0+0x4b/0x90 [drm]
[ 5556.683882] Read of size 8 at addr ffff88812db30428 by task kunit_try_catch/75921
[ 5556.683882]
[ 5556.683882] CPU: 1 PID: 75921 Comm: kunit_try_catch Tainted: G        W        N 6.6.0-rc1-dirty #2
[ 5556.683882] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 0.0.0 02/06/2015
[ 5556.683882] Call Trace:
[ 5556.683882]  <TASK>
[ 5556.683882]  dump_stack_lvl+0x43/0x60
[ 5556.683882]  print_report+0xcf/0x660
[ 5556.683882]  ? __virt_addr_valid+0xd9/0x160
[ 5556.683882]  ? drm_dev_put.part.0+0x4b/0x90 [drm]
[ 5556.683882]  kasan_report+0xda/0x110
[ 5556.683882]  ? drm_dev_put.part.0+0x4b/0x90 [drm]
[ 5556.683882]  drm_dev_put.part.0+0x4b/0x90 [drm]
[ 5556.683882]  release_nodes+0x83/0x160
[ 5556.683882]  devres_release_all+0xe6/0x130
[ 5556.683882]  ? __pfx_devres_release_all+0x10/0x10
[ 5556.683882]  ? mutex_unlock+0x80/0xd0
[ 5556.683882]  ? __pfx_mutex_unlock+0x10/0x10
[ 5556.683882]  device_unbind_cleanup+0x16/0xc0
[ 5556.683882]  device_release_driver_internal+0x28b/0x2e0
[ 5556.683882]  bus_remove_device+0x124/0x1d0
[ 5556.683882]  device_del+0x23d/0x580
[ 5556.683882]  ? __pfx_device_del+0x10/0x10
[ 5556.683882]  ? kasan_set_track+0x21/0x30
[ 5556.683882]  ? _raw_spin_lock_irqsave+0x98/0xf0
[ 5556.683882]  platform_device_del.part.0+0x19/0xe0
[ 5556.683882]  kunit_remove_resource+0xfa/0x140 [kunit]
[ 5556.683882]  kunit_cleanup+0x47/0xa0 [kunit]
[ 5556.683882]  ? __pfx_kunit_try_run_case_cleanup+0x10/0x10 [kunit]
[ 5556.683882]  ? __pfx_kunit_generic_run_threadfn_adapter+0x10/0x10 [kunit]
[ 5556.683882]  kunit_generic_run_threadfn_adapter+0x29/0x50 [kunit]
[ 5556.683882]  kthread+0x184/0x1c0
[ 5556.683882]  ? __pfx_kthread+0x10/0x10
[ 5556.683882]  ret_from_fork+0x30/0x50
[ 5556.683882]  ? __pfx_kthread+0x10/0x10
[ 5556.683882]  ret_from_fork_asm+0x1b/0x30
[ 5556.683882]  </TASK>
[ 5556.683882]
[ 5556.683882] Allocated by task 75920:
[ 5556.683882]  kasan_save_stack+0x2f/0x50
[ 5556.683882]  kasan_set_track+0x21/0x30
[ 5556.683882]  __kasan_kmalloc+0xa6/0xb0
[ 5556.683882]  __kmalloc+0x5d/0x160
[ 5556.683882]  kunit_kmalloc_array+0x1c/0x50 [kunit]
[ 5556.683882]  drm_test_modes_init+0xda/0x260 [drm_modes_test]
[ 5556.683882]  kunit_try_run_case+0x6e/0x100 [kunit]
[ 5556.683882]  kunit_generic_run_threadfn_adapter+0x29/0x50 [kunit]
[ 5556.683882]  kthread+0x184/0x1c0
[ 5556.683882]  ret_from_fork+0x30/0x50
[ 5556.683882]  ret_from_fork_asm+0x1b/0x30
[ 5556.683882]
[ 5556.683882] Freed by task 75921:
[ 5556.683882]  kasan_save_stack+0x2f/0x50
[ 5556.683882]  kasan_set_track+0x21/0x30
[ 5556.683882]  kasan_save_free_info+0x27/0x40
[ 5556.683882]  ____kasan_slab_free+0x166/0x1c0
[ 5556.683882]  slab_free_freelist_hook+0x9f/0x1e0
[ 5556.683882]  __kmem_cache_free+0x187/0x2d0
[ 5556.683882]  kunit_remove_resource+0xfa/0x140 [kunit]
[ 5556.683882]  kunit_cleanup+0x47/0xa0 [kunit]
[ 5556.683882]  kunit_generic_run_threadfn_adapter+0x29/0x50 [kunit]
[ 5556.683882]  kthread+0x184/0x1c0
[ 5556.683882]  ret_from_fork+0x30/0x50
[ 5556.683882]  ret_from_fork_asm+0x1b/0x30
[ 5556.683882]
[ 5556.683882] The buggy address belongs to the object at ffff88812db30400
[ 5556.683882]  which belongs to the cache kmalloc-256 of size 256
[ 5556.683882] The buggy address is located 40 bytes inside of
[ 5556.683882]  freed 256-byte region [ffff88812db30400, ffff88812db30500)
[ 5556.683882]
[ 5556.683882] The buggy address belongs to the physical page:
[ 5556.683882] page:00000000b3a5f157 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x12db30
[ 5556.683882] head:00000000b3a5f157 order:2 entire_mapcount:0 nr_pages_mapped:0 pincount:0
[ 5556.683882] ksm flags: 0x17ffffc0000840(slab|head|node=0|zone=2|lastcpupid=0x1fffff)
[ 5556.683882] page_type: 0xffffffff()
[ 5556.683882] raw: 0017ffffc0000840 ffff888100042b40 ffffea00053e2000 dead000000000003
[ 5556.683882] raw: 0000000000000000 0000000080200020 00000001ffffffff 0000000000000000
[ 5556.683882] page dumped because: kasan: bad access detected
[ 5556.683882]
[ 5556.683882] Memory state around the buggy address:
[ 5556.683882]  ffff88812db30300: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[ 5556.683882]  ffff88812db30380: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[ 5556.683882] >ffff88812db30400: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[ 5556.683882]                                   ^
[ 5556.683882]  ffff88812db30480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[ 5556.683882]  ffff88812db30500: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[ 5556.683882] ==================================================================
[ 5556.687191] Disabling lock debugging due to kernel taint
[ 5556.689341]     not ok 1 drm_test_modes_analog_tv_ntsc_480i
[ 5556.700913]     ok 2 drm_test_modes_analog_tv_ntsc_480i_inlined
[ 5556.713501]     ok 3 drm_test_modes_analog_tv_pal_576i
[ 5556.724240]     ok 4 drm_test_modes_analog_tv_pal_576i_inlined
[ 5556.724260] # drm_modes_analog_tv: pass:3 fail:1 skip:0 total:4
[ 5556.724270] # Totals: pass:3 fail:1 skip:0 total:4
[ 5556.724279] not ok 8 drm_modes_analog_tv

Unlike the drm_exec_test, this time it is required
to guarantee that de drm mode is destroyed on the
test that is created, otherwise it will trigger the
following output:

[  876.491050] KTAP version 1
[  876.491057] 1..1
[  876.491467]     KTAP version 1
[  876.491469]     # Subtest: drm_modes_analog_tv
[  876.491473]     # module: drm_modes_test
[  876.491477]     1..4
[  876.502373] ==================================================================
[  876.502386] BUG: KASAN: slab-use-after-free in drm_dev_put.part.0+0x1b/0x90 [drm]
[  876.502531] Write of size 4 at addr ffff8881330b8004 by task kunit_try_catch/13563
[  876.502536]
[  876.502539] CPU: 6 PID: 13563 Comm: kunit_try_catch Tainted: G                 N 6.6.0-rc1+ #3
[  876.502546] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 0.0.0 02/06/2015
[  876.502550] Call Trace:
[  876.502554]  <TASK>
[  876.502557]  dump_stack_lvl+0x43/0x60
[  876.502568]  print_report+0xcf/0x660
[  876.502577]  ? __virt_addr_valid+0xd9/0x160
[  876.502586]  ? drm_dev_put.part.0+0x1b/0x90 [drm]
[  876.502737]  kasan_report+0xda/0x110
[  876.502744]  ? drm_dev_put.part.0+0x1b/0x90 [drm]
[  876.502831]  kasan_check_range+0xfc/0x1b0
[  876.502831]  drm_dev_put.part.0+0x1b/0x90 [drm]
[  876.502831]  drm_test_modes_exit+0xa8/0x160 [drm_modes_test]
[  876.502831]  ? __pfx_drm_test_modes_exit+0x10/0x10 [drm_modes_test]
[  876.502831]  ? __pfx__raw_spin_lock_irqsave+0x10/0x10
[  876.502831]  ? __pfx_set_cpus_allowed_ptr+0x10/0x10
[  876.502831]  ? __pfx_kunit_generic_run_threadfn_adapter+0x10/0x10 [kunit]
[  876.502831]  kunit_try_run_case_cleanup+0x5f/0x70 [kunit]
[  876.502831]  ? __pfx_kunit_try_run_case_cleanup+0x10/0x10 [kunit]
[  876.502831]  kunit_generic_run_threadfn_adapter+0x29/0x50 [kunit]
[  876.502831]  kthread+0x184/0x1c0
[  876.502831]  ? __pfx_kthread+0x10/0x10
[  876.502831]  ret_from_fork+0x30/0x50
[  876.502831]  ? __pfx_kthread+0x10/0x10
[  876.502831]  ret_from_fork_asm+0x1b/0x30
[  876.502831]  </TASK>
[  876.502831]
[  876.502831] Allocated by task 13562:
[  876.502831]  kasan_save_stack+0x2f/0x50
[  876.502831]  kasan_set_track+0x21/0x30
[  876.502831]  __kasan_kmalloc+0xa6/0xb0
[  876.502831]  __kmalloc+0x5d/0x160
[  876.502831]  __devm_drm_dev_alloc+0x21/0xb0 [drm]
[  876.502831]  __drm_kunit_helper_alloc_drm_device_with_driver+0x15/0x60 [drm_kunit_helpers]
[  876.502831]  drm_test_modes_init+0x112/0x260 [drm_modes_test]
[  876.502831]  kunit_try_run_case+0x6e/0x100 [kunit]
[  876.502831]  kunit_generic_run_threadfn_adapter+0x29/0x50 [kunit]
[  876.502831]  kthread+0x184/0x1c0
[  876.502831]  ret_from_fork+0x30/0x50
[  876.502831]  ret_from_fork_asm+0x1b/0x30
[  876.502831]
[  876.502831] Freed by task 13563:
[  876.502831]  kasan_save_stack+0x2f/0x50
[  876.502831]  kasan_set_track+0x21/0x30
[  876.502831]  kasan_save_free_info+0x27/0x40
[  876.502831]  ____kasan_slab_free+0x166/0x1c0
[  876.502831]  slab_free_freelist_hook+0x9f/0x1e0
[  876.502831]  __kmem_cache_free+0x187/0x2d0
[  876.502831]  release_nodes+0x83/0x160
[  876.502831]  devres_release_all+0xe6/0x130
[  876.502831]  device_unbind_cleanup+0x16/0xc0
[  876.502831]  device_release_driver_internal+0x28b/0x2e0
[  876.502831]  bus_remove_device+0x124/0x1d0
[  876.502831]  device_del+0x23d/0x580
[  876.502831]  platform_device_del.part.0+0x19/0xe0
[  876.502831]  kunit_release_action+0x1d7/0x230 [kunit]
[  876.502831]  drm_kunit_helper_free_device+0x1d/0x50 [drm_kunit_helpers]
[  876.502831]  drm_test_modes_exit+0x7f/0x160 [drm_modes_test]
[  876.502831]  kunit_try_run_case_cleanup+0x5f/0x70 [kunit]
[  876.502831]  kunit_generic_run_threadfn_adapter+0x29/0x50 [kunit]
[  876.502831]  kthread+0x184/0x1c0
[  876.502831]  ret_from_fork+0x30/0x50
[  876.502831]  ret_from_fork_asm+0x1b/0x30
[  876.502831]
[  876.502831] Last potentially related work creation:
[  876.502831]  kasan_save_stack+0x2f/0x50
[  876.502831]  __kasan_record_aux_stack+0xaf/0xc0
[  876.502831]  __call_rcu_common.constprop.0+0x9b/0x990
[  876.502831]  netlink_release+0x6d3/0xb70
[  876.502831]  __sock_release+0x66/0x120
[  876.502831]  sock_close+0x11/0x20
[  876.502831]  __fput+0x1db/0x450
[  876.502831]  __x64_sys_close+0x51/0x90
[  876.502831]  do_syscall_64+0x5b/0xc0
[  876.502831]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
[  876.502831]
[  876.502831] The buggy address belongs to the object at ffff8881330b8000
[  876.502831]  which belongs to the cache kmalloc-2k of size 2048
[  876.502831] The buggy address is located 4 bytes inside of
[  876.502831]  freed 2048-byte region [ffff8881330b8000, ffff8881330b8800)
[  876.502831]
[  876.502831] The buggy address belongs to the physical page:
[  876.502831] page:000000007d194834 refcount:1 mapcount:0 mapping:0000000000000000 index:0xffff8881330bf000 pfn:0x1330b8
[  876.502831] head:000000007d194834 order:3 entire_mapcount:0 nr_pages_mapped:0 pincount:0
[  876.502831] flags: 0x17ffffc0000840(slab|head|node=0|zone=2|lastcpupid=0x1fffff)
[  876.502831] page_type: 0xffffffff()
[  876.502831] raw: 0017ffffc0000840 ffff888100042f00 dead000000000100 dead000000000122
[  876.502831] raw: ffff8881330bf000 0000000080080007 00000001ffffffff 0000000000000000
[  876.502831] page dumped because: kasan: bad access detected
[  876.502831]
[  876.502831] Memory state around the buggy address:
[  876.502831]  ffff8881330b7f00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  876.502831]  ffff8881330b7f80: 00 00 00 00 fc fc fc fc fc fc fc fc fc fc fc fc
[  876.502831] >ffff8881330b8000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[  876.502831]                    ^
[  876.502831]  ffff8881330b8080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[  876.502831]  ffff8881330b8100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[  876.502831] ==================================================================
[  876.503733] Disabling lock debugging due to kernel taint

Applying the patch, the output will look like:

[ 1098.895487] KTAP version 1
[ 1098.895499] 1..1
[ 1098.896132]     KTAP version 1
[ 1098.896139]     # Subtest: drm_modes_analog_tv
[ 1098.896144]     # module: drm_modes_test
[ 1098.896150]     1..4
[ 1098.906634]     ok 1 drm_test_modes_analog_tv_ntsc_480i
[ 1098.920305]     ok 2 drm_test_modes_analog_tv_ntsc_480i_inlined
[ 1098.931438]     ok 3 drm_test_modes_analog_tv_pal_576i
[ 1098.941509]     ok 4 drm_test_modes_analog_tv_pal_576i_inlined
[ 1098.941533] # drm_modes_analog_tv: pass:4 fail:0 skip:0 total:4
[ 1098.941546] # Totals: pass:4 fail:0 skip:0 total:4
[ 1098.941556] ok 1 drm_modes_analog_tv

Signed-off-by: José Pekkarinen <jose.pekkarinen@foxhound.fi>
---
 drivers/gpu/drm/tests/drm_modes_test.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_modes_test.c b/drivers/gpu/drm/tests/drm_modes_test.c
index 1e9f63fbfead..059c790810d6 100644
--- a/drivers/gpu/drm/tests/drm_modes_test.c
+++ b/drivers/gpu/drm/tests/drm_modes_test.c
@@ -36,6 +36,19 @@ static int drm_test_modes_init(struct kunit *test)
 	return 0;
 }
 
+static void drm_test_modes_exit(struct kunit *test)
+{
+	struct drm_test_modes_priv *priv = test->priv;
+
+	drm_kunit_helper_free_device(test, priv->dev);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->dev);
+
+	drm_dev_put(priv->drm);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->drm);
+
+	kunit_kfree(test, priv);
+}
+
 static void drm_test_modes_analog_tv_ntsc_480i(struct kunit *test)
 {
 	struct drm_test_modes_priv *priv = test->priv;
@@ -64,6 +77,7 @@ static void drm_test_modes_analog_tv_ntsc_480i(struct kunit *test)
 
 	KUNIT_EXPECT_EQ(test, mode->vdisplay, 480);
 	KUNIT_EXPECT_EQ(test, mode->vtotal, 525);
+	drm_mode_destroy(priv->drm, mode);
 }
 
 static void drm_test_modes_analog_tv_ntsc_480i_inlined(struct kunit *test)
@@ -141,6 +155,7 @@ static struct kunit_case drm_modes_analog_tv_tests[] = {
 static struct kunit_suite drm_modes_analog_tv_test_suite = {
 	.name = "drm_modes_analog_tv",
 	.init = drm_test_modes_init,
+	.exit = drm_test_modes_exit,
 	.test_cases = drm_modes_analog_tv_tests,
 };
 
-- 
2.39.2

