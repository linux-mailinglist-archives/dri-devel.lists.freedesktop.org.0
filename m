Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1621A5BC0EE
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 03:10:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B2B10E40D;
	Mon, 19 Sep 2022 01:10:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0BC510E40D
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 01:09:49 +0000 (UTC)
Received: from sobremesa.fritz.box (unknown
 [IPv6:2a02:8010:65b5:0:bbb0:f8ec:7bc9:dbe4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 4776666015BB;
 Mon, 19 Sep 2022 02:09:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663549788;
 bh=CrUaLqT9yNlkX56zUcsccBN1IY+YaCtI4qMNnTvMaaQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XeIPjO6C2YUUAMMFsRf4nRWRQzeHEDoKvqHUGvYL+CFNi5z74yb4o+YRi2lUZNXq0
 dB+57eefgSkmzGC+bFFLbRglgIkEOa6cHGEv7ZzE/kt1uTKbxOCw9rDJ4qPd7sLxpu
 dxY8hxrLGL9uy4xlLeCCQzeKQkN6Tn7mPfb3ms9icjGdFZ4ynLwZ0NNEErbOWgylid
 MKmpbbAxpafQNf7zwuDj4D0celBSmsE3Bo2tQ1A3g72SWlAoMNkGzkzGu2TO+ZnVny
 bq2IP7OxTrYprl0szLakBBnNDaqchjVkaqkYHc2RBOLFHHzTRg49tfs5vHg2p122ZP
 7qlSAr0TSCcTQ==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: narmstrong@baylibre.com, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/meson: reorder driver deinit sequence to fix
 use-after-free bug
Date: Mon, 19 Sep 2022 02:09:38 +0100
Message-Id: <20220919010940.419893-2-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220919010940.419893-1-adrian.larumbe@collabora.com>
References: <20220919010940.419893-1-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: adrian.larumbe@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Unloading the driver triggers the following KASAN warning:

[  +0.006275] =============================================================
[  +0.000029] BUG: KASAN: use-after-free in __list_del_entry_valid+0xe0/0x1a0
[  +0.000026] Read of size 8 at addr ffff000020c395e0 by task rmmod/2695

[  +0.000019] CPU: 5 PID: 2695 Comm: rmmod Tainted: G         C O      5.19.0-rc6-lrmbkasan+ #1
[  +0.000013] Hardware name: Hardkernel ODROID-N2Plus (DT)
[  +0.000008] Call trace:
[  +0.000007]  dump_backtrace+0x1ec/0x280
[  +0.000013]  show_stack+0x24/0x80
[  +0.000008]  dump_stack_lvl+0x98/0xd4
[  +0.000011]  print_address_description.constprop.0+0x80/0x520
[  +0.000011]  print_report+0x128/0x260
[  +0.000007]  kasan_report+0xb8/0xfc
[  +0.000008]  __asan_report_load8_noabort+0x3c/0x50
[  +0.000010]  __list_del_entry_valid+0xe0/0x1a0
[  +0.000009]  drm_atomic_private_obj_fini+0x30/0x200 [drm]
[  +0.000172]  drm_bridge_detach+0x94/0x260 [drm]
[  +0.000145]  drm_encoder_cleanup+0xa4/0x290 [drm]
[  +0.000144]  drm_mode_config_cleanup+0x118/0x740 [drm]
[  +0.000143]  drm_mode_config_init_release+0x1c/0x2c [drm]
[  +0.000144]  drm_managed_release+0x170/0x414 [drm]
[  +0.000142]  drm_dev_put.part.0+0xc0/0x124 [drm]
[  +0.000143]  drm_dev_put+0x20/0x30 [drm]
[  +0.000142]  meson_drv_unbind+0x1d8/0x2ac [meson_drm]
[  +0.000028]  take_down_aggregate_device+0xb0/0x160
[  +0.000016]  component_del+0x18c/0x360
[  +0.000009]  meson_dw_hdmi_remove+0x28/0x40 [meson_dw_hdmi]
[  +0.000015]  platform_remove+0x64/0xb0
[  +0.000009]  device_remove+0xb8/0x154
[  +0.000009]  device_release_driver_internal+0x398/0x5b0
[  +0.000009]  driver_detach+0xac/0x1b0
[  +0.000009]  bus_remove_driver+0x158/0x29c
[  +0.000009]  driver_unregister+0x70/0xb0
[  +0.000008]  platform_driver_unregister+0x20/0x2c
[  +0.000008]  meson_dw_hdmi_platform_driver_exit+0x1c/0x30 [meson_dw_hdmi]
[  +0.000012]  __do_sys_delete_module+0x288/0x400
[  +0.000011]  __arm64_sys_delete_module+0x5c/0x80
[  +0.000009]  invoke_syscall+0x74/0x260
[  +0.000009]  el0_svc_common.constprop.0+0xcc/0x260
[  +0.000009]  do_el0_svc+0x50/0x70
[  +0.000007]  el0_svc+0x68/0x1a0
[  +0.000012]  el0t_64_sync_handler+0x11c/0x150
[  +0.000008]  el0t_64_sync+0x18c/0x190

[  +0.000018] Allocated by task 0:
[  +0.000007] (stack is not available)

[  +0.000011] Freed by task 2695:
[  +0.000008]  kasan_save_stack+0x2c/0x5c
[  +0.000011]  kasan_set_track+0x2c/0x40
[  +0.000008]  kasan_set_free_info+0x28/0x50
[  +0.000009]  ____kasan_slab_free+0x128/0x1d4
[  +0.000008]  __kasan_slab_free+0x18/0x24
[  +0.000007]  slab_free_freelist_hook+0x108/0x230
[  +0.000011]  kfree+0x110/0x35c
[  +0.000008]  release_nodes+0xf0/0x16c
[  +0.000009]  devres_release_group+0x180/0x270
[  +0.000008]  component_unbind+0x128/0x1e0
[  +0.000010]  component_unbind_all+0x1b8/0x264
[  +0.000009]  meson_drv_unbind+0x1a0/0x2ac [meson_drm]
[  +0.000025]  take_down_aggregate_device+0xb0/0x160
[  +0.000009]  component_del+0x18c/0x360
[  +0.000009]  meson_dw_hdmi_remove+0x28/0x40 [meson_dw_hdmi]
[  +0.000012]  platform_remove+0x64/0xb0
[  +0.000008]  device_remove+0xb8/0x154
[  +0.000009]  device_release_driver_internal+0x398/0x5b0
[  +0.000009]  driver_detach+0xac/0x1b0
[  +0.000009]  bus_remove_driver+0x158/0x29c
[  +0.000008]  driver_unregister+0x70/0xb0
[  +0.000008]  platform_driver_unregister+0x20/0x2c
[  +0.000008]  meson_dw_hdmi_platform_driver_exit+0x1c/0x30 [meson_dw_hdmi]
[  +0.000011]  __do_sys_delete_module+0x288/0x400
[  +0.000010]  __arm64_sys_delete_module+0x5c/0x80
[  +0.000008]  invoke_syscall+0x74/0x260
[  +0.000008]  el0_svc_common.constprop.0+0xcc/0x260
[  +0.000008]  do_el0_svc+0x50/0x70
[  +0.000007]  el0_svc+0x68/0x1a0
[  +0.000009]  el0t_64_sync_handler+0x11c/0x150
[  +0.000009]  el0t_64_sync+0x18c/0x190

[  +0.000014] The buggy address belongs to the object at ffff000020c39000
               which belongs to the cache kmalloc-4k of size 4096
[  +0.000008] The buggy address is located 1504 bytes inside of
               4096-byte region [ffff000020c39000, ffff000020c3a000)

[  +0.000016] The buggy address belongs to the physical page:
[  +0.000009] page:fffffc0000830e00 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x20c38
[  +0.000013] head:fffffc0000830e00 order:3 compound_mapcount:0 compound_pincount:0
[  +0.000008] flags: 0xffff00000010200(slab|head|node=0|zone=0|lastcpupid=0xffff)
[  +0.000019] raw: 0ffff00000010200 fffffc0000fd4808 fffffc0000126208 ffff000000002e80
[  +0.000009] raw: 0000000000000000 0000000000020002 00000001ffffffff 0000000000000000
[  +0.000008] page dumped because: kasan: bad access detected

[  +0.000011] Memory state around the buggy address:
[  +0.000008]  ffff000020c39480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[  +0.000007]  ffff000020c39500: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[  +0.000007] >ffff000020c39580: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[  +0.000007]                                                        ^
[  +0.000007]  ffff000020c39600: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[  +0.000007]  ffff000020c39680: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[  +0.000006] ==================================================================

The reason this is happening is unloading meson-dw-hdmi will cause the
component API to take down the aggregate device, which in turn will cause
all devres-managed memory to be freed, including the struct dw_hdmi
allocated in dw_hdmi_probe. This struct embeds a struct drm_bridge that is
added at the end of the function, and which is later on picked up in
meson_encoder_hdmi_init.

However, when attaching the bridge to the encoder created in
meson_encoder_hdmi_init, it's linked to the encoder's bridge chain, from
where it never leaves, even after devres_release_group is called when the
driver's components are unbound and the embedding structure freed.

Then, when calling drm_dev_put in the aggregate driver's unbind function,
drm_bridge_detach is called for every single bridge linked to the encoder,
including the one whose memory had already been deallocated.

Fix by calling component_unbind_all after drm_dev_put.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/meson/meson_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index ef386d7b9450..8da454a17b77 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -385,9 +385,9 @@ static void meson_drv_unbind(struct device *dev)
 	drm_dev_unregister(drm);
 	drm_kms_helper_poll_fini(drm);
 	drm_atomic_helper_shutdown(drm);
-	component_unbind_all(dev, drm);
 	free_irq(priv->vsync_irq, drm);
 	drm_dev_put(drm);
+	component_unbind_all(dev, drm);
 
 	if (priv->afbcd.ops)
 		priv->afbcd.ops->exit(priv);
-- 
2.37.0

