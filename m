Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B331F9A2585
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 16:50:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB6EE10E150;
	Thu, 17 Oct 2024 14:50:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zf+1jE7j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8228D10E150
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 14:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729176604; x=1760712604;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3LHGBokEilCQEvGzizalyOMkKlpJPXej/x0GkXUwbUw=;
 b=Zf+1jE7jtTqqLUJVzImLyPdinAnxtoNanMnycY/aHnMTd4wRU0zvOkyG
 jsxXxD09fulxo2J1lxaauUgXLgfHtg8UVrySJCPpnOF7BcareddzuT1Mh
 pJ98ODCOSMYkgJedqtdE+LbmV4lR+j27xTRmxdpZWNkDJQqXlorCdseGS
 K61JqI8nBSMP//Tt9DgR0yM32dzln/JHBH1mH8ehAtz5iw3kCoGP8CceS
 wI5HpHVkJGAToJz7du6kBsrBpOBwivljHGgfTbdiFRITxGiraE6vhlRQO
 G4/GDoZF0kCvtuWR0A4F21x+X0OxZ4eyvdMZyHWpawOr5UUE8ys2FL7Rm A==;
X-CSE-ConnectionGUID: YEqXAXihRBO9btUwynFnEw==
X-CSE-MsgGUID: VjsDEKlhRkqr0oOwv38L5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28815548"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28815548"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 07:50:03 -0700
X-CSE-ConnectionGUID: ORuMYUcoTXuU+xmZydRGkg==
X-CSE-MsgGUID: gRA/Q56aQ4uHlpbNOaJx6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="78179886"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 07:50:01 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>, stable@vger.kernel.org,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH] accel/ivpu: Fix NOC firewall interrupt handling
Date: Thu, 17 Oct 2024 16:49:58 +0200
Message-ID: <20241017144958.79327-1-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
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

From: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>

The NOC firewall interrupt means that the HW prevented
unauthorized access to a protected resource, so there
is no need to trigger device reset in such case.

To facilitate security testing add firewall_irq_counter
debugfs file that tracks firewall interrupts.

Fixes: 8a27ad81f7d3 ("accel/ivpu: Split IP and buttress code")
Cc: <stable@vger.kernel.org> # v6.11+
Signed-off-by: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_debugfs.c | 9 +++++++++
 drivers/accel/ivpu/ivpu_hw.c      | 1 +
 drivers/accel/ivpu/ivpu_hw.h      | 1 +
 drivers/accel/ivpu/ivpu_hw_ip.c   | 5 ++++-
 4 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_debugfs.c b/drivers/accel/ivpu/ivpu_debugfs.c
index 8958145c49adb..8180b95ed69dc 100644
--- a/drivers/accel/ivpu/ivpu_debugfs.c
+++ b/drivers/accel/ivpu/ivpu_debugfs.c
@@ -116,6 +116,14 @@ static int reset_pending_show(struct seq_file *s, void *v)
 	return 0;
 }
 
+static int firewall_irq_counter_show(struct seq_file *s, void *v)
+{
+	struct ivpu_device *vdev = seq_to_ivpu(s);
+
+	seq_printf(s, "%d\n", atomic_read(&vdev->hw->firewall_irq_counter));
+	return 0;
+}
+
 static const struct drm_debugfs_info vdev_debugfs_list[] = {
 	{"bo_list", bo_list_show, 0},
 	{"fw_name", fw_name_show, 0},
@@ -125,6 +133,7 @@ static const struct drm_debugfs_info vdev_debugfs_list[] = {
 	{"last_bootmode", last_bootmode_show, 0},
 	{"reset_counter", reset_counter_show, 0},
 	{"reset_pending", reset_pending_show, 0},
+	{"firewall_irq_counter", firewall_irq_counter_show, 0},
 };
 
 static int dvfs_mode_get(void *data, u64 *dvfs_mode)
diff --git a/drivers/accel/ivpu/ivpu_hw.c b/drivers/accel/ivpu/ivpu_hw.c
index 09ada8b500b99..4e1054f3466e8 100644
--- a/drivers/accel/ivpu/ivpu_hw.c
+++ b/drivers/accel/ivpu/ivpu_hw.c
@@ -252,6 +252,7 @@ int ivpu_hw_init(struct ivpu_device *vdev)
 	platform_init(vdev);
 	wa_init(vdev);
 	timeouts_init(vdev);
+	atomic_set(&vdev->hw->firewall_irq_counter, 0);
 
 	return 0;
 }
diff --git a/drivers/accel/ivpu/ivpu_hw.h b/drivers/accel/ivpu/ivpu_hw.h
index dc5518248c405..fc4dbfc980c81 100644
--- a/drivers/accel/ivpu/ivpu_hw.h
+++ b/drivers/accel/ivpu/ivpu_hw.h
@@ -51,6 +51,7 @@ struct ivpu_hw_info {
 	int dma_bits;
 	ktime_t d0i3_entry_host_ts;
 	u64 d0i3_entry_vpu_ts;
+	atomic_t firewall_irq_counter;
 };
 
 int ivpu_hw_init(struct ivpu_device *vdev);
diff --git a/drivers/accel/ivpu/ivpu_hw_ip.c b/drivers/accel/ivpu/ivpu_hw_ip.c
index b9b16f4041434..029dd065614b2 100644
--- a/drivers/accel/ivpu/ivpu_hw_ip.c
+++ b/drivers/accel/ivpu/ivpu_hw_ip.c
@@ -1073,7 +1073,10 @@ static void irq_wdt_mss_handler(struct ivpu_device *vdev)
 
 static void irq_noc_firewall_handler(struct ivpu_device *vdev)
 {
-	ivpu_pm_trigger_recovery(vdev, "NOC Firewall IRQ");
+	atomic_inc(&vdev->hw->firewall_irq_counter);
+
+	ivpu_dbg(vdev, IRQ, "NOC Firewall interrupt detected, counter %d\n",
+		 atomic_read(&vdev->hw->firewall_irq_counter));
 }
 
 /* Handler for IRQs from NPU core */
-- 
2.45.1

