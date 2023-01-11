Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8613F6650D7
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 02:02:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B51E910E6B1;
	Wed, 11 Jan 2023 01:02:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8E4C810E6B1;
 Wed, 11 Jan 2023 01:02:03 +0000 (UTC)
Received: from localhost.localdomain (unknown [124.16.138.125])
 by APP-05 (Coremail) with SMTP id zQCowABXd8yCCr5jPQwfDA--.49261S2;
 Wed, 11 Jan 2023 09:01:56 +0800 (CST)
From: Jiasheng Jiang <jiasheng@iscas.ac.cn>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com, airlied@gmail.com,
 daniel@ffwll.ch, ville.syrjala@linux.intel.com, manasi.d.navare@intel.com,
 stanislav.lisovskiy@intel.com, lucas.demarchi@intel.com
Subject: [PATCH 2/2 v2] drm/i915: Replace alloc*workqueue with DRM helpers
Date: Wed, 11 Jan 2023 09:01:53 +0800
Message-Id: <20230111010153.5920-1-jiasheng@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowABXd8yCCr5jPQwfDA--.49261S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zry5Zr48JF4UAFyrJryfXrb_yoW5Jr4UpF
 45uFyYyFW5JFsagay3Aa1jvFy7CayrJ3WfCF17u3ZFv3W5Arn8AwsYvFy5KFyDCF45Xr45
 AF97KrWI9F1qkrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUv014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
 0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
 8cxan2IY04v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
 8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8
 ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
 0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
 Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUb
 XdbUUUUUU==
X-Originating-IP: [124.16.138.125]
X-CM-SenderInfo: pmld2xxhqjqxpvfd2hldfou0/
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
Cc: intel-gfx@lists.freedesktop.org, Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace alloc*workqueue with DRM helpers in order to avoid memory leak
Because in `drivers/gpu/drm/i915/i915_driver.c`, if
intel_modeset_init_noirq fails, its workqueues will not be destroyed.
And drop the destroy_workqueue in intel_modeset_driver_remove_noirq to
avoid double free.
Moreover, check the return value since the workqueue may be NULL and
cause NULL pointer dereference.

Fixes: c26a058680dc ("drm/i915: Use a high priority wq for nonblocking plane updates")
Fixes: 757fffcfdffb ("drm/i915: Put all non-blocking modesets onto an ordered wq")
Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
---
Changelog:

v1 -> v2:

1. Drop the destroy_workqueue in intel_modeset_driver_remove_noirq.
---
 drivers/gpu/drm/i915/display/intel_display.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 6c2686ecb62a..5cbec0af1773 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -41,6 +41,7 @@
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_privacy_screen_consumer.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_rect.h>
@@ -8654,9 +8655,16 @@ int intel_modeset_init_noirq(struct drm_i915_private *i915)
 
 	intel_dmc_ucode_init(i915);
 
-	i915->display.wq.modeset = alloc_ordered_workqueue("i915_modeset", 0);
-	i915->display.wq.flip = alloc_workqueue("i915_flip", WQ_HIGHPRI |
-						WQ_UNBOUND, WQ_UNBOUND_MAX_ACTIVE);
+	ret = drmm_alloc_ordered_workqueue(&i915->drm,
+					   i915->display.wq.modeset, "i915_modeset", 0);
+	if (ret)
+		goto cleanup_vga_client_pw_domain_dmc;
+
+	ret = drmm_alloc_workqueue(&i915->drm, i915->display.wq.flip,
+				   "i915_flip", WQ_HIGHPRI | WQ_UNBOUND,
+				   WQ_UNBOUND_MAX_ACTIVE);
+	if (ret)
+		goto cleanup_vga_client_pw_domain_dmc;
 
 	intel_mode_config_init(i915);
 
@@ -9004,9 +9012,6 @@ void intel_modeset_driver_remove_noirq(struct drm_i915_private *i915)
 
 	intel_gmbus_teardown(i915);
 
-	destroy_workqueue(i915->display.wq.flip);
-	destroy_workqueue(i915->display.wq.modeset);
-
 	intel_fbc_cleanup(i915);
 }
 
-- 
2.25.1

