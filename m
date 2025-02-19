Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63ECDA3CDD0
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 00:48:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D659610E8BD;
	Wed, 19 Feb 2025 23:48:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="GdiNPkgN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id B4B0410E2B2;
 Wed, 19 Feb 2025 13:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Huuvv
 E5ZoWF1UAGvFneCadtnRZGO01ETPd9/BIZRpBI=; b=GdiNPkgNIWJq9fxfCpCgQ
 bQ1qbXV4JfrXThmi+r3MCVsIWpF5HckJQy3bnBRp+n83HrvehZpfEFN57v+L+uej
 ri2TxtBfhnc+b7DkfRoUF/DePXhvnaGnuAVpvnmzUA3xcgUmi93lngAdOI8lsFD5
 +9bu5JNfV9insVqH5dAohg=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [])
 by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id
 _____wB3yiyy17VnoJLHNA--.52215S4; 
 Wed, 19 Feb 2025 21:08:03 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, airlied@gmail.com,
 simona@ffwll.ch, gustavo.sousa@intel.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Haoxiang Li <haoxiang_li2024@163.com>, stable@vger.kernel.org
Subject: [PATCH] drm/i915/display: Add check for alloc_ordered_workqueue() and
 alloc_workqueue()
Date: Wed, 19 Feb 2025 21:08:00 +0800
Message-Id: <20250219130800.2638016-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wB3yiyy17VnoJLHNA--.52215S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrKw4kKFy7ArykKF47tr4rAFb_yoWkKrbEkF
 WrZr1xGry5C3ZruF1UCrn3uryFvr4Yyry8AryxtryYyr47Kw10vrWkZr15Xw1rAFy3AFWq
 93W8WF1kAws7WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRNvtCUUUUUU==
X-Originating-IP: [183.174.60.14]
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/1tbiqBH4bme10+BHjQAAsE
X-Mailman-Approved-At: Wed, 19 Feb 2025 23:48:37 +0000
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
and alloc_workqueue() to catch potential exception.

Fixes: 40053823baad ("drm/i915/display: move modeset probe/remove functions to intel_display_driver.c")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/gpu/drm/i915/display/intel_display_driver.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index 50ec0c3c7588..dfe5b779aefd 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -245,6 +245,11 @@ int intel_display_driver_probe_noirq(struct intel_display *display)
 						WQ_UNBOUND, WQ_UNBOUND_MAX_ACTIVE);
 	display->wq.cleanup = alloc_workqueue("i915_cleanup", WQ_HIGHPRI, 0);
 
+	if (!display->wq.modeset || !display->wq.flip || !display->wq.cleanup) {
+		ret = -ENOMEM;
+		goto cleanup_vga_client_pw_domain_dmc;
+	}
+
 	intel_mode_config_init(display);
 
 	ret = intel_cdclk_init(display);
-- 
2.25.1

