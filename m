Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1A11A3695
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 17:07:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A1D46EBDA;
	Thu,  9 Apr 2020 15:07:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from conuserg-07.nifty.com (conuserg-07.nifty.com [210.131.2.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EB376EBDA;
 Thu,  9 Apr 2020 15:07:29 +0000 (UTC)
Received: from grover.flets-west.jp (softbank126125134031.bbtec.net
 [126.125.134.31]) (authenticated)
 by conuserg-07.nifty.com with ESMTP id 039F6Zj6025357;
 Fri, 10 Apr 2020 00:06:36 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 039F6Zj6025357
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1586444797;
 bh=3FWc8C25LITNQQg0scvue6NeZtoknDzBN+lCFDj1JxY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EOfo+Iv88S2F74NASApAzGboR82EULxA/WbLaWS1Sl3Uf3q91pcLBNWTeKeX9pUAv
 X+75wDSUj+frCAPA2h4WrKgenfG7uo8M9EiFlyj1+IhUW5iVaipT24ng/soW0coUWj
 sYtgbj5GFQk5W0s5xEzV3K7GLPta6E78A6Y8VzekpTb7qV/px7uoCP8VQJZA/XF3gm
 7i+/0um1vVt+w0P30BIbdMognQ1+KCNt9H19zUBeKjvf3A3f3pNJWmprhLOlDyvmft
 tD31ALtzXKnY7RwE1ywOKbbeOvCOJ8dCignjBz+Hno0nZBPWXYhNt0njIaWzWcv2AT
 CfUQSWTMhfsYQ==
X-Nifty-SrcIP: [126.125.134.31]
From: Masahiro Yamada <masahiroy@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915: remove gvt/Makefile
Date: Fri, 10 Apr 2020 00:06:27 +0900
Message-Id: <20200409150627.29205-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200409150627.29205-1-masahiroy@kernel.org>
References: <20200409150627.29205-1-masahiroy@kernel.org>
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
Cc: David Airlie <airlied@linux.ie>, Masahiro Yamada <masahiroy@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Including subdirectory Makefile from the driver main Makefile does not
buy us much because this is not real isolation.

Having a single Makefile at the top of the module is clearer, and
it is what this driver almost does.

Move all gvt objects to the i915 main Makefile.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 drivers/gpu/drm/i915/Makefile     | 28 ++++++++++++++++++++++++----
 drivers/gpu/drm/i915/gvt/Makefile |  8 --------
 2 files changed, 24 insertions(+), 12 deletions(-)
 delete mode 100644 drivers/gpu/drm/i915/gvt/Makefile

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 6cd1f6253814..74e965882a98 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -275,10 +275,30 @@ i915-$(CONFIG_DRM_I915_SELFTEST) += \
 # virtual gpu code
 i915-y += i915_vgpu.o
 
-ifeq ($(CONFIG_DRM_I915_GVT),y)
-i915-y += intel_gvt.o
-include $(src)/gvt/Makefile
-endif
+i915-$(CONFIG_DRM_I915_GVT) += \
+	intel_gvt.o \
+	gvt/gvt.o \
+	gvt/aperture_gm.o \
+	gvt/handlers.o \
+	gvt/vgpu.o \
+	gvt/trace_points.o \
+	gvt/firmware.o \
+	gvt/interrupt.o \
+	gvt/gtt.o \
+	gvt/cfg_space.o \
+	gvt/opregion.o \
+	gvt/mmio.o \
+	gvt/display.o \
+	gvt/edid.o \
+	gvt/execlist.o \
+	gvt/scheduler.o \
+	gvt/sched_policy.o \
+	gvt/mmio_context.o \
+	gvt/cmd_parser.o \
+	gvt/debugfs.o \
+	gvt/fb_decoder.o \
+	gvt/dmabuf.o \
+	gvt/page_track.o
 
 obj-$(CONFIG_DRM_I915) += i915.o
 obj-$(CONFIG_DRM_I915_GVT_KVMGT) += gvt/kvmgt.o
diff --git a/drivers/gpu/drm/i915/gvt/Makefile b/drivers/gpu/drm/i915/gvt/Makefile
deleted file mode 100644
index 4d70f4689479..000000000000
--- a/drivers/gpu/drm/i915/gvt/Makefile
+++ /dev/null
@@ -1,8 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-GVT_DIR := gvt
-GVT_SOURCE := gvt.o aperture_gm.o handlers.o vgpu.o trace_points.o firmware.o \
-	interrupt.o gtt.o cfg_space.o opregion.o mmio.o display.o edid.o \
-	execlist.o scheduler.o sched_policy.o mmio_context.o cmd_parser.o debugfs.o \
-	fb_decoder.o dmabuf.o page_track.o
-
-i915-y					+= $(addprefix $(GVT_DIR)/, $(GVT_SOURCE))
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
