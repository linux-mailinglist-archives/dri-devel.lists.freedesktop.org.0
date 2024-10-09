Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E157995EEF
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 07:24:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1248510E205;
	Wed,  9 Oct 2024 05:24:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="S8IupSCb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 590AF10E646
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 05:24:41 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-7e9e38dd5f1so4790874a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2024 22:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1728451481; x=1729056281;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7A6H+KzAjmDQU5CdelmQUCc3Y+xjatMunsXRFdXtofI=;
 b=S8IupSCbtDq6Ep8IGCKrs8KQjQmkRuwkF7/De6BwkVzmF+j1iIEY9yxaffOYz84O+o
 Fyiz9XvXjS6z2l6FvG29FI2oqrzzPO33LE0mNWl0oLEcN49z3LIUcunNPDqk6UnLHEJo
 LgzKDrUDvHBF/UvgXDw1nLzQ9aXsoCWK35veE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728451481; x=1729056281;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7A6H+KzAjmDQU5CdelmQUCc3Y+xjatMunsXRFdXtofI=;
 b=AqJbFcQtf3UgFfc3o8deCgbRWwwzLj4sf8J5l4QLw1QixIRXiVVj9mTerwav3Gr8ES
 ogXZe3TLdePKKbDmGz8yzLn9xNVV8upwlCaeE5H3gJskeR1PLykGo4e8zo3nj0OUlXCl
 VIrZnGQSEBYbhVs+V2bxXQyEPduS9HSogVUGqk/l32tV+vnMRuonrgX/+dpNPKjn6inR
 NnWrWSMyWmcX62ALTtoyauPCHgKsqeu9yddijTCWgHCyAcnv27Rz9fjpMHTpuEdbBpLV
 CFOWHd3/HYdm8JRxb/GhRnxBq1IwbMcBZxD7Y42ni/D1LbAQXkkovzhHL4ydGz3gy3Ej
 r4Xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMIxEpFkKVWH79zdYIV0wzD4G7xxVtWyNvbBfzcDudeFQUGh6+wJxViyzB8YoUXx++InVZ+IM8s3w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxWQksnUj1jq8/6mvStpmTgmZ2cBxtGN+N9h+xXZEmKyiKjR2Ml
 AUIoBP3rKs6ZyqSWCqqZV2BKYuPyrv5BxZ8Xh/eshA43D29PIKY092wu5xkqBA5jCW2G62VtMGP
 1YA==
X-Google-Smtp-Source: AGHT+IEKD21DoJeYdl5yUlTRJTAGnxFTDW05PgaoJ5dAAeoH/tToyjk8YeS0tkwuwuWsScTJVYPC5Q==
X-Received: by 2002:a05:6a21:3944:b0:1cf:3d14:6921 with SMTP id
 adf61e73a8af0-1d8a3c5a65bmr2666769637.35.1728451480803; 
 Tue, 08 Oct 2024 22:24:40 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com
 ([2401:fa00:1:10:3386:622d:881d:c6f1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71e008f3705sm5077341b3a.109.2024.10.08.22.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2024 22:24:40 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Fei Shao <fshao@chromium.org>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH] drm/bridge: panel: Use devm_drm_bridge_add()
Date: Wed,  9 Oct 2024 13:23:31 +0800
Message-ID: <20241009052402.411978-1-fshao@chromium.org>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the mtk_dsi driver, its DSI host attach callback calls
devm_drm_of_get_bridge() to get the next bridge. If that next bridge is
a panel bridge, a panel_bridge object is allocated and managed by the
panel device.

Later, if the attach callback fails with -EPROBE_DEFER from subsequent
component_add(), the panel device invoking the callback at probe time
also fails, and all device-managed resources are freed accordingly.

This exposes a drm_bridge bridge_list corruption due to the unbalanced
lifecycle between the DSI host and the panel devices: the panel_bridge
object managed by panel device is freed, while drm_bridge_remove() is
bound to DSI host device and never gets called.
The next drm_bridge_add() will trigger UAF against the freed bridge list
object and result in kernel panic.

This bug is observed on a MediaTek MT8188-based Chromebook with MIPI DSI
outputting to a DSI panel (DT is WIP for upstream).

As a fix, using devm_drm_bridge_add() with the panel device in the panel
path seems reasonable. This also implies a chain of potential cleanup
actions:

1. Removing drm_bridge_remove() means devm_drm_panel_bridge_release()
   becomes hollow and can be removed.

2. devm_drm_panel_bridge_add_typed() is almost emptied except for the
   `bridge->pre_enable_prev_first` line. Itself can be also removed if
   we move the line into drm_panel_bridge_add_typed(). (maybe?)

3. drm_panel_bridge_add_typed() now calls all the needed devm_* calls,
   so it's essentially the new devm_drm_panel_bridge_add_typed().

4. drmm_panel_bridge_add() needs to be updated accordingly since it
   calls drm_panel_bridge_add_typed(). But now there's only one bridge
   object to be freed, and it's already being managed by panel device.
   I wonder if we still need both drmm_ and devm_ version in this case.
   (maybe yes from DRM PoV, I don't know much about the context)

This is a RFC patch since I'm not sure if my understanding is correct
(for both the fix and the cleanup). It fixes the issue I encountered,
but I don't expect it to be picked up directly due to the redundant
commit message and the dangling devm_drm_panel_bridge_release().
I plan to resend the official patch(es) once I know what I supposed to
do next.

For reference, here's the KASAN report from the device:
==================================================================
 BUG: KASAN: slab-use-after-free in drm_bridge_add+0x98/0x230
 Read of size 8 at addr ffffff80c4e9e100 by task kworker/u32:1/69

 CPU: 1 UID: 0 PID: 69 Comm: kworker/u32:1 Not tainted 6.12.0-rc1-next-20241004-kasan-00030-g062135fa4046 #1
 Hardware name: Google Ciri sku0/unprovisioned board (DT)
 Workqueue: events_unbound deferred_probe_work_func
 Call trace:
  dump_backtrace+0xfc/0x140
  show_stack+0x24/0x38
  dump_stack_lvl+0x40/0xc8
  print_report+0x140/0x700
  kasan_report+0xcc/0x130
  __asan_report_load8_noabort+0x20/0x30
  drm_bridge_add+0x98/0x230
  devm_drm_panel_bridge_add_typed+0x174/0x298
  devm_drm_of_get_bridge+0xe8/0x190
  mtk_dsi_host_attach+0x130/0x2b0
  mipi_dsi_attach+0x8c/0xe8
  hx83102_probe+0x1a8/0x368
  mipi_dsi_drv_probe+0x6c/0x88
  really_probe+0x1c4/0x698
  __driver_probe_device+0x160/0x298
  driver_probe_device+0x7c/0x2a8
  __device_attach_driver+0x2a0/0x398
  bus_for_each_drv+0x198/0x200
  __device_attach+0x1c0/0x308
  device_initial_probe+0x20/0x38
  bus_probe_device+0x11c/0x1f8
  deferred_probe_work_func+0x80/0x250
  worker_thread+0x9b4/0x2780
  kthread+0x274/0x350
  ret_from_fork+0x10/0x20

 Allocated by task 69:
  kasan_save_track+0x40/0x78
  kasan_save_alloc_info+0x44/0x58
  __kasan_kmalloc+0x84/0xa0
  __kmalloc_node_track_caller_noprof+0x228/0x450
  devm_kmalloc+0x6c/0x288
  devm_drm_panel_bridge_add_typed+0xa0/0x298
  devm_drm_of_get_bridge+0xe8/0x190
  mtk_dsi_host_attach+0x130/0x2b0
  mipi_dsi_attach+0x8c/0xe8
  hx83102_probe+0x1a8/0x368
  mipi_dsi_drv_probe+0x6c/0x88
  really_probe+0x1c4/0x698
  __driver_probe_device+0x160/0x298
  driver_probe_device+0x7c/0x2a8
  __device_attach_driver+0x2a0/0x398
  bus_for_each_drv+0x198/0x200
  __device_attach+0x1c0/0x308
  device_initial_probe+0x20/0x38
  bus_probe_device+0x11c/0x1f8
  deferred_probe_work_func+0x80/0x250
  worker_thread+0x9b4/0x2780
  kthread+0x274/0x350
  ret_from_fork+0x10/0x20

 Freed by task 69:
  kasan_save_track+0x40/0x78
  kasan_save_free_info+0x58/0x78
  __kasan_slab_free+0x48/0x68
  kfree+0xd4/0x750
  devres_release_all+0x144/0x1e8
  really_probe+0x48c/0x698
  __driver_probe_device+0x160/0x298
  driver_probe_device+0x7c/0x2a8
  __device_attach_driver+0x2a0/0x398
  bus_for_each_drv+0x198/0x200
  __device_attach+0x1c0/0x308
  device_initial_probe+0x20/0x38
  bus_probe_device+0x11c/0x1f8
  deferred_probe_work_func+0x80/0x250
  worker_thread+0x9b4/0x2780
  kthread+0x274/0x350
  ret_from_fork+0x10/0x20

 The buggy address belongs to the object at ffffff80c4e9e000
  which belongs to the cache kmalloc-4k of size 4096
 The buggy address is located 256 bytes inside of
  freed 4096-byte region [ffffff80c4e9e000, ffffff80c4e9f000)

 The buggy address belongs to the physical page:
 head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
 flags: 0x8000000000000040(head|zone=2)
 page_type: f5(slab)
 page: refcount:1 mapcount:0 mapping:0000000000000000
 index:0x0 pfn:0x104e98
 raw: 8000000000000040 ffffff80c0003040 dead000000000122 0000000000000000
 raw: 0000000000000000 0000000000040004 00000001f5000000 0000000000000000
 head: 8000000000000040 ffffff80c0003040 dead000000000122 0000000000000000
 head: 0000000000000000 0000000000040004 00000001f5000000 0000000000000000
 head: 8000000000000003 fffffffec313a601 ffffffffffffffff 0000000000000000
 head: 0000000000000008 0000000000000000 00000000ffffffff 0000000000000000
 page dumped because: kasan: bad access detected

 Memory state around the buggy address:
  ffffff80c4e9e000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffffff80c4e9e080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 >ffffff80c4e9e100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                    ^
  ffffff80c4e9e180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffffff80c4e9e200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
===================================================================

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 drivers/gpu/drm/bridge/panel.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 6e88339dec0f..352723c59c70 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -303,7 +303,7 @@ struct drm_bridge *drm_panel_bridge_add_typed(struct drm_panel *panel,
 	panel_bridge->bridge.ops = DRM_BRIDGE_OP_MODES;
 	panel_bridge->bridge.type = connector_type;
 
-	drm_bridge_add(&panel_bridge->bridge);
+	devm_drm_bridge_add(panel->dev, &panel_bridge->bridge);
 
 	return &panel_bridge->bridge;
 }
@@ -327,7 +327,6 @@ void drm_panel_bridge_remove(struct drm_bridge *bridge)
 
 	panel_bridge = drm_bridge_to_panel_bridge(bridge);
 
-	drm_bridge_remove(bridge);
 	devm_kfree(panel_bridge->panel->dev, bridge);
 }
 EXPORT_SYMBOL(drm_panel_bridge_remove);
@@ -359,8 +358,6 @@ static void devm_drm_panel_bridge_release(struct device *dev, void *res)
 
 	if (!bridge)
 		return;
-
-	drm_bridge_remove(bridge);
 }
 
 /**
-- 
2.47.0.rc1.288.g06298d1525-goog

