Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4E5A99EFE
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 04:56:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 966E610E703;
	Thu, 24 Apr 2025 02:56:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="LKodL/4w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 397 seconds by postgrey-1.36 at gabe;
 Thu, 24 Apr 2025 02:55:59 UTC
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0EFCE10E703;
 Thu, 24 Apr 2025 02:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=ZyWGd
 L4fQntO+YSj4uhZTWjk9DIBPdHQjqeylVNy+pc=; b=LKodL/4w1+PguPYD/a3LM
 SjgoRzu9HO0CRJT7QC+pduMeRqc/IC5iSvLCYK8vK16Dego7BtrD7pwNObI6ExLH
 MAuT7PpH+VlN/yHbinMKwsdpkl48RooPbuUhdgmVoq0+ClJ1UynBEXuvV9WloZwf
 MeFZBi1SkGVYnVqC6BbxAc=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [])
 by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id
 _____wB3U1csqAloHYubCA--.21713S4; 
 Thu, 24 Apr 2025 10:55:42 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, airlied@gmail.com, simona@ffwll.ch,
 gustavo.sousa@intel.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Haoxiang Li <haoxiang_li2024@163.com>, stable@vger.kernel.org
Subject: [PATCH v2 RESEND] drm/i915/display: Add check for
 alloc_ordered_workqueue() and alloc_workqueue()
Date: Thu, 24 Apr 2025 10:55:39 +0800
Message-Id: <20250424025539.3504019-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wB3U1csqAloHYubCA--.21713S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxAF4xGw1xAF18WrykKryfZwb_yoW5Ar1xpw
 4fXFyUArW5XFs2kay7Xa18uFyxW3409w15GF1fC3Wqq3WUAw4jg3W0kFyUXryDGF1xXF1f
 AFWqyF429r1DCF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pimhF7UUUUU=
X-Originating-IP: [183.174.60.14]
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/1tbiqAQ5bmgJpmBSsgAAs8
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

Add check for the return value of alloc_ordered_workqueue()
and alloc_workqueue(). Furthermore, if some allocations fail,
cleanup works are added to avoid potential memory leak problem.

Fixes: 40053823baad ("drm/i915/display: move modeset probe/remove functions to intel_display_driver.c")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
Changes in v2:
- Split the compound conditional statement into separate
  conditional statements to facilitate cleanup works.
- Add cleanup works to destory work queues if allocations fail,
  and modify the later goto destination to do the full excercise.
- modify the patch description. Thanks, Jani!
---
 .../drm/i915/display/intel_display_driver.c   | 30 +++++++++++++++----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index 31740a677dd8..ac94561715dc 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -241,31 +241,45 @@ int intel_display_driver_probe_noirq(struct intel_display *display)
 	intel_dmc_init(display);
 
 	display->wq.modeset = alloc_ordered_workqueue("i915_modeset", 0);
+	if (!display->wq.modeset) {
+		ret = -ENOMEM;
+		goto cleanup_vga_client_pw_domain_dmc;
+	}
+
 	display->wq.flip = alloc_workqueue("i915_flip", WQ_HIGHPRI |
 						WQ_UNBOUND, WQ_UNBOUND_MAX_ACTIVE);
+	if (!display->wq.flip) {
+		ret = -ENOMEM;
+		goto cleanup_wq_modeset;
+	}
+
 	display->wq.cleanup = alloc_workqueue("i915_cleanup", WQ_HIGHPRI, 0);
+	if (!display->wq.cleanup) {
+		ret = -ENOMEM;
+		goto cleanup_wq_flip;
+	}
 
 	intel_mode_config_init(display);
 
 	ret = intel_cdclk_init(display);
 	if (ret)
-		goto cleanup_vga_client_pw_domain_dmc;
+		goto cleanup_wq_cleanup;
 
 	ret = intel_color_init(display);
 	if (ret)
-		goto cleanup_vga_client_pw_domain_dmc;
+		goto cleanup_wq_cleanup;
 
 	ret = intel_dbuf_init(i915);
 	if (ret)
-		goto cleanup_vga_client_pw_domain_dmc;
+		goto cleanup_wq_cleanup;
 
 	ret = intel_bw_init(i915);
 	if (ret)
-		goto cleanup_vga_client_pw_domain_dmc;
+		goto cleanup_wq_cleanup;
 
 	ret = intel_pmdemand_init(display);
 	if (ret)
-		goto cleanup_vga_client_pw_domain_dmc;
+		goto cleanup_wq_cleanup;
 
 	intel_init_quirks(display);
 
@@ -273,6 +287,12 @@ int intel_display_driver_probe_noirq(struct intel_display *display)
 
 	return 0;
 
+cleanup_wq_cleanup:
+	destroy_workqueue(display->wq.cleanup);
+cleanup_wq_flip:
+	destroy_workqueue(display->wq.flip);
+cleanup_wq_modeset:
+	destroy_workqueue(display->wq.modeset);
 cleanup_vga_client_pw_domain_dmc:
 	intel_dmc_fini(display);
 	intel_power_domains_driver_remove(display);
-- 
2.25.1

