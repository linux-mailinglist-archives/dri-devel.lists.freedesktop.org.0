Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C8022FDFB
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 01:33:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 750B66E0FF;
	Mon, 27 Jul 2020 23:32:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E44B389FD4;
 Mon, 27 Jul 2020 20:50:34 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f1f3e0d0000>; Mon, 27 Jul 2020 13:50:21 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 27 Jul 2020 13:50:34 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 27 Jul 2020 13:50:34 -0700
Received: from lenny.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 27 Jul
 2020 20:50:29 +0000
From: Daniel Dadap <ddadap@nvidia.com>
To: <dri-devel@lists.freedesktop.org>, <lukas@wunner.de>,
 <intel-gfx@lists.freedesktop.org>, <jani.nikula@linux.intel.com>,
 <joonas.lahtinen@linux.intel.com>, <rodrigo.vivi@intel.com>
Subject: [PATCH 5/6] i915: fail atomic commit when muxed away
Date: Mon, 27 Jul 2020 15:51:11 -0500
Message-ID: <20200727205112.27698-6-ddadap@nvidia.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200727205112.27698-1-ddadap@nvidia.com>
References: <ba78cd19-45ad-b17e-5174-256cc11f36c2%40nvidia.com>
 <20200727205112.27698-1-ddadap@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1595883021; bh=59T4gHQyf67sIQu9+jHG3Vk/zJuDG9Yb+zkpmwcbSGg=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 X-Originating-IP:X-ClientProxiedBy:Content-Type;
 b=d1izXNZRmvxqzmKSS1zvEOv0HB5/f1KWrY1PuQ3QEEuJZMJJyBjRKGtphEWy9vxnc
 8HmgTTulW+zl/eq4gXjS2h4Rl/k/nTN3itD/zRQcCmNgmCfkmENuF3MtAaYimcA5c7
 u8vaf5EhFwHuxAQgm9X6D+2HZ3lqmXEvL7kM8YyE7kKgVrliok79w0R2atHgdGYvQG
 kJLByhsxCVbSkqzcXA/Zx39hr+eC/CdgMrXej0tU2yIwQ7KWyt9OQDwz8TQQ+sMjwL
 qGCleO3UinuwDE4Hi/GvaCF6XTtO9bpZP9FBnLoDuPxx/5kLoaeIXvVCmb2Iw176S6
 4obCYlZugF+fQ==
X-Mailman-Approved-At: Mon, 27 Jul 2020 23:32:42 +0000
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
Cc: Daniel Dadap <ddadap@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Attempting to commit a modeset while mux-switched away can cause
problems due to DisplayPort links being unavailable while they are
physically disconnected. In order to avoid this, bail out of atomic
commit early if attempted while a display mux is switched away.

Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 346846609f45..4ad799e4b024 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -31,6 +31,7 @@
 #include <linux/module.h>
 #include <linux/dma-resv.h>
 #include <linux/slab.h>
+#include <linux/vga_switcheroo.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
@@ -15736,6 +15737,12 @@ static int intel_atomic_commit(struct drm_device *dev,
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	int ret = 0;
 
+	if (!vga_switcheroo_is_client_active(to_pci_dev(dev->dev))) {
+		drm_dbg_atomic(&dev_priv->drm,
+			"Atomic commit attempted while muxed away.\n");
+		return -EINVAL;
+	}
+
 	state->wakeref = intel_runtime_pm_get(&dev_priv->runtime_pm);
 
 	drm_atomic_state_get(&state->base);
-- 
2.18.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
