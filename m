Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1618A83DD93
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 16:35:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3104910FB6A;
	Fri, 26 Jan 2024 15:35:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4594410FB90;
 Fri, 26 Jan 2024 15:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706283302; x=1737819302;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v5P9LknsSMwEz0Qt7ZtZ3UN1mTbKYgPS/ZK5RtrKAuA=;
 b=Dqa/HkYoUHhzTe8F5DLiRjN2cNTkg5jKGPZAWCg9ZFKEL4pQ5Fs3E5n6
 cwIDDHCQusT7S9sBxeBz7rANX5Lf4rqXNz4KbwbGbCd1NWD2bOOS/aafR
 cxyGOJOcD0KC8t2f88RfsB+3BDLZy2BgBk3NEtfy2pardFi9/xwkfaPjT
 dKFlb1HA8XDBSx8K5ehy/BLCW9BsbI7gdXgAXRMVFIW+CEZr44pGeEDQB
 Fw7AekcR1tO3cDVT6TAQqD7AXEb91aeAYOrp8gkk6s7NA4CigIUjOFVKq
 r7Jdfid3VdAHML2NRR3s+uWENBS2c/u7nlQ5BL+Y6NplyhZ1lGfK0wlHR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="2384764"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2384764"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 07:35:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="930399143"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="930399143"
Received: from tgl-lenovo-03.sh.intel.com ([10.239.87.93])
 by fmsmga001.fm.intel.com with ESMTP; 26 Jan 2024 07:34:57 -0800
From: wangxiaoming321 <xiaoming.wang@intel.com>
To: lucas.demarchi@intel.com, ogabbay@kernel.org,
 thomas.hellstrom@linux.intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/xe/display: Fix memleak in display initialization
Date: Fri, 26 Jan 2024 23:34:53 +0800
Message-Id: <20240126153453.997855-1-xiaoming.wang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240125063633.989944-1-xiaoming.wang@intel.com>
References: <20240125063633.989944-1-xiaoming.wang@intel.com>
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

intel_power_domains_init has been called twice in xe_device_probe:
xe_device_probe -> xe_display_init_nommio -> intel_power_domains_init(xe)
xe_device_probe -> xe_display_init_noirq -> intel_display_driver_probe_noirq
-> intel_power_domains_init(i915)

It needs remove one to avoid power_domains->power_wells double malloc.

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
 drivers/gpu/drm/xe/xe_display.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index 74391d9b11ae..e4db069f0db3 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -134,8 +134,6 @@ static void xe_display_fini_nommio(struct drm_device *dev, void *dummy)
 
 int xe_display_init_nommio(struct xe_device *xe)
 {
-	int err;
-
 	if (!xe->info.enable_display)
 		return 0;
 
@@ -145,10 +143,6 @@ int xe_display_init_nommio(struct xe_device *xe)
 	/* This must be called before any calls to HAS_PCH_* */
 	intel_detect_pch(xe);
 
-	err = intel_power_domains_init(xe);
-	if (err)
-		return err;
-
 	return drmm_add_action_or_reset(&xe->drm, xe_display_fini_nommio, xe);
 }
 
-- 
2.25.1

