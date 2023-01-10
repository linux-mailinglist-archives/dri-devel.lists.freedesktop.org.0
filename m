Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B42B16644D1
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 16:30:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9D6F10E5E5;
	Tue, 10 Jan 2023 15:30:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5A46110E5E5;
 Tue, 10 Jan 2023 15:30:24 +0000 (UTC)
Received: from localhost.localdomain (unknown [124.16.138.125])
 by APP-05 (Coremail) with SMTP id zQCowAC32M2GhL1jH78NDA--.21443S2;
 Tue, 10 Jan 2023 23:30:14 +0800 (CST)
From: Jiasheng Jiang <jiasheng@iscas.ac.cn>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com, airlied@gmail.com,
 daniel@ffwll.ch, ville.syrjala@linux.intel.com, manasi.d.navare@intel.com,
 stanislav.lisovskiy@intel.com, lucas.demarchi@intel.com
Subject: [PATCH 2/2] drm/i915: Replace alloc*workqueue with DRM helpers
Date: Tue, 10 Jan 2023 23:30:13 +0800
Message-Id: <20230110153013.5702-1-jiasheng@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAC32M2GhL1jH78NDA--.21443S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zry5Zr45tFWUGF15AFy7Jrb_yoW8Cr45pF
 43CFyYyrW5JFsYgay5Aa1vvFy7C3y8t3WfCF17u3ZrZ3WYyrn8Aw1qy3Z8WFyDGF43XF4r
 AF97tFW29F1qyrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
 n2kIc2xKxwCY02Avz4vE14v_XrWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
 0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
 17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
 C0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY
 6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
 73UjIFyTuYvjfU0CJmUUUUU
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

Replace alloc*workqueue with DRM helpers in order to avoid memory leak.
Moreover, check the return value since the workqueue may be NULL and
cause NULL pointer dereference.

Fixes: c26a058680dc ("drm/i915: Use a high priority wq for nonblocking plane updates")
Fixes: 757fffcfdffb ("drm/i915: Put all non-blocking modesets onto an ordered wq")
Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
---
 drivers/gpu/drm/i915/display/intel_display.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 6c2686ecb62a..8acef38ca985 100644
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
 
-- 
2.25.1

