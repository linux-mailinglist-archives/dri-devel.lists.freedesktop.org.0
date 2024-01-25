Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAB883BA0B
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 07:37:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1904410E199;
	Thu, 25 Jan 2024 06:36:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF79310E199;
 Thu, 25 Jan 2024 06:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706164604; x=1737700604;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iKNSG8qLy9+IU6XC8XCWUQXo7YjyxS4FMfRu28VsM1M=;
 b=AToutqrMfL7EvHv2rtx/VayYjrM+gtVBtdI/mB3hVz91FHLWqNx/xvSO
 R5HCcjMlaqlPtKb1Sv4U8o3O8dj273t8vGmyXWxEL/9pveYP/ecq7xXoz
 qyX58fZixWOmvBmk8/lxMCy6N7Joe+dXibCcRWgkbbKJ0IlJ7dqJOJ1LJ
 xOa1XTWSEIaCsChSP/yfzY9eygW+mgDb7qPej8qcWExoOdDbhgFw6oqfY
 +hNpvNW1EsuHlLRDILSTI82S010k7biKC/NJ0Bjhn+nQYL9O2gW3+hVLH
 KDLbc6dUld9qYEudFxj5bxEKUdSxWi01CTZG3wHcDs3aKX1jHcAj4BLh2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="433228396"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="433228396"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 22:36:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="820699476"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="820699476"
Received: from tgl-lenovo-03.sh.intel.com ([10.239.87.93])
 by orsmga001.jf.intel.com with ESMTP; 24 Jan 2024 22:36:38 -0800
From: wangxiaoming321 <xiaoming.wang@intel.com>
To: lucas.demarchi@intel.com, ogabbay@kernel.org,
 thomas.hellstrom@linux.intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/xe/display: Fix memleak in display initialization
Date: Thu, 25 Jan 2024 14:36:33 +0800
Message-Id: <20240125063633.989944-1-xiaoming.wang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <y>
References: <y>
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
Cc: wangxiaoming321 <xiaoming.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the call stack xe_device_probe ->  xe_display_init_nommio -> intel_power_domains_init
Power_domains  hasn't been cleaned up if return error,
which has do the clean in i915_driver_late_release call from i915_driver_probe.

unreferenced object 0xffff88811150ee00 (size 512):
  comm "systemd-udevd", pid 506, jiffies 4294674198 (age 3605.560s)
  hex dump (first 32 bytes):
    10 b4 9d a0 ff ff ff ff ff ff ff ff ff ff ff ff  ................
    ff ff ff ff ff ff ff ff 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<ffffffff8134b901>] __kmem_cache_alloc_node+0x1c1/0x2b0
    [<ffffffff812c98b2>] __kmalloc+0x52/0x150
    [<ffffffffa08b0033>] __set_power_wells+0xc3/0x360 [xe]
    [<ffffffffa08562fc>] xe_display_init_nommio+0x4c/0x70 [xe]
    [<ffffffffa07f0d1c>] xe_device_probe+0x3c/0x5a0 [xe]
    [<ffffffffa082e48f>] xe_pci_probe+0x33f/0x5a0 [xe]
    [<ffffffff817f2187>] local_pci_probe+0x47/0xa0
    [<ffffffff817f3db3>] pci_device_probe+0xc3/0x1f0
    [<ffffffff8192f2a2>] really_probe+0x1a2/0x410
    [<ffffffff8192f598>] __driver_probe_device+0x78/0x160
    [<ffffffff8192f6ae>] driver_probe_device+0x1e/0x90
    [<ffffffff8192f92a>] __driver_attach+0xda/0x1d0
    [<ffffffff8192c95c>] bus_for_each_dev+0x7c/0xd0
    [<ffffffff8192e159>] bus_add_driver+0x119/0x220
    [<ffffffff81930d00>] driver_register+0x60/0x120
    [<ffffffffa05e50a0>] 0xffffffffa05e50a0

Signed-off-by: wangxiaoming321 <xiaoming.wang@intel.com>
---
 drivers/gpu/drm/xe/xe_display.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index 74391d9b11ae..2725afba4afb 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -146,8 +146,10 @@ int xe_display_init_nommio(struct xe_device *xe)
 	intel_detect_pch(xe);
 
 	err = intel_power_domains_init(xe);
-	if (err)
+	if (err) {
+		intel_power_domains_cleanup(xe);
 		return err;
+	}
 
 	return drmm_add_action_or_reset(&xe->drm, xe_display_fini_nommio, xe);
 }
-- 
2.25.1

