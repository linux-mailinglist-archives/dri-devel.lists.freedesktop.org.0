Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aO+jIpWKrmmzFwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 09:53:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FD2235B40
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 09:53:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46E0410E4AB;
	Mon,  9 Mar 2026 08:53:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E862B10E4AA
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 08:53:36 +0000 (UTC)
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.103.14])
 by APP-03 (Coremail) with SMTP id rQCowADX+N9_iq5pkiwjCg--.65307S4;
 Mon, 09 Mar 2026 16:53:29 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Icenowy Zheng <uwu@icenowy.me>, Han Gao <rabenda.cn@gmail.com>,
 Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH -next 2/2] drm: verisilicon: add support for cursor planes
Date: Mon,  9 Mar 2026 16:53:02 +0800
Message-ID: <20260309085302.3132732-3-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260309085302.3132732-1-zhengxingda@iscas.ac.cn>
References: <20260309085302.3132732-1-zhengxingda@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowADX+N9_iq5pkiwjCg--.65307S4
X-Coremail-Antispam: 1UD129KBjvAXoW3tF48AFy3Aw17Gr4fCF45ZFb_yoW8Gw15to
 WxXa13Gw4kt3Z7KrZ0yw48tw1rZFs7Wrs0k3y0gFW8Za4DJwn0vFW7WryY9FWxtr1Fyr4D
 uw4vy3ZFqF1UCan3n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjp_UUUO77AC8VAFwI0_Wr0E3s1l1xkIjI8I6I8E6xAIw20EY4v20xva
 j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7IE14v26r15M28IrcIa0x
 kI8VCY1x0267AKxVW8JVW5JwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84AC
 jcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJw
 A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
 0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
 IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
 Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
 xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
 JVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
 kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY
 6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
 vEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVj
 vjDU0xZFpf9x0JUczV8UUUUU=
X-Originating-IP: [112.94.103.14]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
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
X-Rspamd-Queue-Id: 01FD2235B40
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:uwu@icenowy.me,m:rabenda.cn@gmail.com,m:zhengxingda@iscas.ac.cn,m:rabendacn@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[zhengxingda@iscas.ac.cn,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhengxingda@iscas.ac.cn,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,icenowy.me,gmail.com,iscas.ac.cn];
	NEURAL_HAM(-0.00)[-0.989];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,iscas.ac.cn:mid,iscas.ac.cn:email,icenowy.me:email]
X-Rspamd-Action: no action

Verisilicon display controllers support hardware cursors per output
port.

Add support for them as cursor planes.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 drivers/gpu/drm/verisilicon/Makefile          |   3 +-
 drivers/gpu/drm/verisilicon/vs_crtc.c         |  11 +-
 drivers/gpu/drm/verisilicon/vs_cursor_plane.c | 273 ++++++++++++++++++
 .../drm/verisilicon/vs_cursor_plane_regs.h    |  44 +++
 drivers/gpu/drm/verisilicon/vs_plane.h        |   1 +
 .../drm/verisilicon/vs_primary_plane_regs.h   |   5 +-
 6 files changed, 333 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/verisilicon/vs_cursor_plane.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_cursor_plane_regs.h

diff --git a/drivers/gpu/drm/verisilicon/Makefile b/drivers/gpu/drm/verisilicon/Makefile
index fd8d805fbcde1..426f4bcaa834d 100644
--- a/drivers/gpu/drm/verisilicon/Makefile
+++ b/drivers/gpu/drm/verisilicon/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-verisilicon-dc-objs := vs_bridge.o vs_crtc.o vs_dc.o vs_drm.o vs_hwdb.o vs_plane.o vs_primary_plane.o
+verisilicon-dc-objs := vs_bridge.o vs_crtc.o vs_dc.o vs_drm.o vs_hwdb.o \
+	vs_plane.o vs_primary_plane.o vs_cursor_plane.o
 
 obj-$(CONFIG_DRM_VERISILICON_DC) += verisilicon-dc.o
diff --git a/drivers/gpu/drm/verisilicon/vs_crtc.c b/drivers/gpu/drm/verisilicon/vs_crtc.c
index f494017130006..5c9714a3e69a7 100644
--- a/drivers/gpu/drm/verisilicon/vs_crtc.c
+++ b/drivers/gpu/drm/verisilicon/vs_crtc.c
@@ -159,7 +159,7 @@ struct vs_crtc *vs_crtc_init(struct drm_device *drm_dev, struct vs_dc *dc,
 			     unsigned int output)
 {
 	struct vs_crtc *vcrtc;
-	struct drm_plane *primary;
+	struct drm_plane *primary, *cursor;
 	int ret;
 
 	vcrtc = drmm_kzalloc(drm_dev, sizeof(*vcrtc), GFP_KERNEL);
@@ -175,9 +175,16 @@ struct vs_crtc *vs_crtc_init(struct drm_device *drm_dev, struct vs_dc *dc,
 		return ERR_PTR(PTR_ERR(primary));
 	}
 
+	/* Create our cursor plane */
+	cursor = vs_cursor_plane_init(drm_dev, dc);
+	if (IS_ERR(cursor)) {
+		drm_err(drm_dev, "Couldn't create the cursor plane\n");
+		return ERR_CAST(cursor);
+	}
+
 	ret = drmm_crtc_init_with_planes(drm_dev, &vcrtc->base,
 					 primary,
-					 NULL,
+					 cursor,
 					 &vs_crtc_funcs,
 					 NULL);
 	if (ret) {
diff --git a/drivers/gpu/drm/verisilicon/vs_cursor_plane.c b/drivers/gpu/drm/verisilicon/vs_cursor_plane.c
new file mode 100644
index 0000000000000..4c86519458077
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_cursor_plane.c
@@ -0,0 +1,273 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Institute of Software, Chinese Academy of Sciences (ISCAS)
+ *
+ * Authors:
+ * Icenowy Zheng <zhengxingda@iscas.ac.cn>
+ */
+
+#include <linux/regmap.h>
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_plane.h>
+#include <drm/drm_print.h>
+
+#include "vs_crtc.h"
+#include "vs_plane.h"
+#include "vs_dc.h"
+#include "vs_hwdb.h"
+#include "vs_cursor_plane_regs.h"
+
+#define VSDC_CURSOR_LOCATION_MAX_POSITIVE BIT_MASK(15)
+#define VSDC_CURSOR_LOCATION_MAX_NEGATIVE BIT_MASK(5)
+
+static bool vs_cursor_plane_check_coord(int32_t coord)
+{
+	if (coord >= 0)
+		return coord <= VSDC_CURSOR_LOCATION_MAX_POSITIVE;
+	else
+		return (-coord) <= VSDC_CURSOR_LOCATION_MAX_NEGATIVE;
+}
+
+static int vs_cursor_plane_atomic_check(struct drm_plane *plane,
+					struct drm_atomic_state *state)
+{
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
+	struct drm_crtc *crtc = new_plane_state->crtc;
+	struct drm_framebuffer *fb = new_plane_state->fb;
+	struct drm_crtc_state *crtc_state = NULL;
+	struct vs_crtc *vcrtc;
+	struct vs_dc *dc;
+	int ret;
+
+	if (crtc)
+		crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+
+	ret = drm_atomic_helper_check_plane_state(new_plane_state,
+						  crtc_state,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  true, true);
+	if (ret)
+		return ret;
+
+	if (!crtc)
+		return 0; /* Skip validity check */
+
+	vcrtc = drm_crtc_to_vs_crtc(crtc);
+	dc = vcrtc->dc;
+
+	/* Only certain square sizes is supported */
+	switch (new_plane_state->crtc_w) {
+	case 32:
+	case 64:
+	case 128:
+	case 256:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (new_plane_state->crtc_w > dc->identity.max_cursor_size)
+		return -EINVAL;
+
+	if (new_plane_state->crtc_w != new_plane_state->crtc_h)
+		return -EINVAL;
+
+	/* Check if the cursor is inside the register fields' range */
+	if (!vs_cursor_plane_check_coord(new_plane_state->crtc_x) ||
+	    !vs_cursor_plane_check_coord(new_plane_state->crtc_y))
+		return -EINVAL;
+
+	if (fb) {
+		/* Only ARGB8888 is supported */
+		if (drm_WARN_ON_ONCE(plane->dev,
+				     fb->format->format != DRM_FORMAT_ARGB8888))
+			return -EINVAL;
+
+		/* Extra line padding isn't supported */
+		if (fb->pitches[0] !=
+		    drm_format_info_min_pitch(fb->format, 0,
+					      new_plane_state->crtc_w))
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void vs_cursor_plane_commit(struct vs_dc *dc, unsigned int output)
+{
+	regmap_set_bits(dc->regs, VSDC_CURSOR_CONFIG(output),
+			VSDC_CURSOR_CONFIG_COMMIT |
+			VSDC_CURSOR_CONFIG_IMG_UPDATE);
+}
+
+static void vs_cursor_plane_atomic_enable(struct drm_plane *plane,
+					   struct drm_atomic_state *atomic_state)
+{
+	struct drm_plane_state *state = drm_atomic_get_new_plane_state(atomic_state,
+								       plane);
+	struct drm_crtc *crtc = state->crtc;
+	struct vs_crtc *vcrtc = drm_crtc_to_vs_crtc(crtc);
+	unsigned int output = vcrtc->id;
+	struct vs_dc *dc = vcrtc->dc;
+
+	regmap_update_bits(dc->regs, VSDC_CURSOR_CONFIG(output),
+			   VSDC_CURSOR_CONFIG_FMT_MASK,
+			   VSDC_CURSOR_CONFIG_FMT_ARGB8888);
+
+	vs_cursor_plane_commit(dc, output);
+}
+
+static void vs_cursor_plane_atomic_disable(struct drm_plane *plane,
+					    struct drm_atomic_state *atomic_state)
+{
+	struct drm_plane_state *state = drm_atomic_get_old_plane_state(atomic_state,
+								       plane);
+	struct drm_crtc *crtc = state->crtc;
+	struct vs_crtc *vcrtc = drm_crtc_to_vs_crtc(crtc);
+	unsigned int output = vcrtc->id;
+	struct vs_dc *dc = vcrtc->dc;
+
+	regmap_update_bits(dc->regs, VSDC_CURSOR_CONFIG(output),
+			   VSDC_CURSOR_CONFIG_FMT_MASK,
+			   VSDC_CURSOR_CONFIG_FMT_OFF);
+
+	vs_cursor_plane_commit(dc, output);
+}
+
+static void vs_cursor_plane_atomic_update(struct drm_plane *plane,
+					   struct drm_atomic_state *atomic_state)
+{
+	struct drm_plane_state *state = drm_atomic_get_new_plane_state(atomic_state,
+								       plane);
+	struct drm_framebuffer *fb = state->fb;
+	struct drm_crtc *crtc = state->crtc;
+	struct vs_dc *dc;
+	struct vs_crtc *vcrtc;
+	unsigned int output;
+	dma_addr_t dma_addr;
+
+	if (!state->visible) {
+		vs_cursor_plane_atomic_disable(plane, atomic_state);
+		return;
+	}
+
+	vcrtc = drm_crtc_to_vs_crtc(crtc);
+	output = vcrtc->id;
+	dc = vcrtc->dc;
+
+	switch (state->crtc_w) {
+	case 32:
+		regmap_update_bits(dc->regs, VSDC_CURSOR_CONFIG(output),
+				   VSDC_CURSOR_CONFIG_SIZE_MASK,
+				   VSDC_CURSOR_CONFIG_SIZE_32);
+		break;
+	case 64:
+		regmap_update_bits(dc->regs, VSDC_CURSOR_CONFIG(output),
+				   VSDC_CURSOR_CONFIG_SIZE_MASK,
+				   VSDC_CURSOR_CONFIG_SIZE_64);
+		break;
+	case 128:
+		regmap_update_bits(dc->regs, VSDC_CURSOR_CONFIG(output),
+				   VSDC_CURSOR_CONFIG_SIZE_MASK,
+				   VSDC_CURSOR_CONFIG_SIZE_128);
+		break;
+	case 256:
+		regmap_update_bits(dc->regs, VSDC_CURSOR_CONFIG(output),
+				   VSDC_CURSOR_CONFIG_SIZE_MASK,
+				   VSDC_CURSOR_CONFIG_SIZE_256);
+		break;
+	}
+
+	dma_addr = vs_fb_get_dma_addr(fb, &state->src);
+
+	regmap_write(dc->regs, VSDC_CURSOR_ADDRESS(output),
+		     lower_32_bits(dma_addr));
+
+	/*
+	 * The X_OFF and Y_OFF fields define which point does the LOCATION
+	 * register represent in the cursor image, and LOCATION register
+	 * values are unsigned. To for positive left-top  coordinates the
+	 * offset is set to 0 and the location is set to the coordinate, for
+	 * negative coordinates the location is set to 0 and the offset
+	 * is set to the opposite number of the coordinate to offset the
+	 * cursor image partly off-screen.
+	 */
+	if (state->crtc_x >= 0) {
+		regmap_update_bits(dc->regs, VSDC_CURSOR_CONFIG(output),
+				   VSDC_CURSOR_CONFIG_X_OFF_MASK, 0);
+		regmap_update_bits(dc->regs, VSDC_CURSOR_LOCATION(output),
+				   VSDC_CURSOR_LOCATION_X_MASK,
+				   VSDC_CURSOR_LOCATION_X(state->crtc_x));
+	} else {
+		regmap_update_bits(dc->regs, VSDC_CURSOR_CONFIG(output),
+				   VSDC_CURSOR_CONFIG_X_OFF_MASK,
+				   -state->crtc_x);
+		regmap_update_bits(dc->regs, VSDC_CURSOR_LOCATION(output),
+				   VSDC_CURSOR_LOCATION_X_MASK, 0);
+	}
+
+	if (state->crtc_y >= 0) {
+		regmap_update_bits(dc->regs, VSDC_CURSOR_CONFIG(output),
+				   VSDC_CURSOR_CONFIG_Y_OFF_MASK, 0);
+		regmap_update_bits(dc->regs, VSDC_CURSOR_LOCATION(output),
+				   VSDC_CURSOR_LOCATION_Y_MASK,
+				   VSDC_CURSOR_LOCATION_Y(state->crtc_y));
+	} else {
+		regmap_update_bits(dc->regs, VSDC_CURSOR_CONFIG(output),
+				   VSDC_CURSOR_CONFIG_Y_OFF_MASK,
+				   -state->crtc_y);
+		regmap_update_bits(dc->regs, VSDC_CURSOR_LOCATION(output),
+				   VSDC_CURSOR_LOCATION_Y_MASK, 0);
+	}
+
+	vs_cursor_plane_commit(dc, output);
+}
+
+static const struct drm_plane_helper_funcs vs_cursor_plane_helper_funcs = {
+	.atomic_check	= vs_cursor_plane_atomic_check,
+	.atomic_update	= vs_cursor_plane_atomic_update,
+	.atomic_enable	= vs_cursor_plane_atomic_enable,
+	.atomic_disable	= vs_cursor_plane_atomic_disable,
+};
+
+static const struct drm_plane_funcs vs_cursor_plane_funcs = {
+	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
+	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
+	.disable_plane		= drm_atomic_helper_disable_plane,
+	.reset			= drm_atomic_helper_plane_reset,
+	.update_plane		= drm_atomic_helper_update_plane,
+};
+
+static const u32 vs_cursor_plane_formats[] = {
+	DRM_FORMAT_ARGB8888,
+};
+
+struct drm_plane *vs_cursor_plane_init(struct drm_device *drm_dev,
+				       struct vs_dc *dc)
+{
+	struct drm_plane *plane;
+
+	plane = drmm_universal_plane_alloc(drm_dev, struct drm_plane, dev, 0,
+					   &vs_cursor_plane_funcs,
+					   vs_cursor_plane_formats,
+					   ARRAY_SIZE(vs_cursor_plane_formats),
+					   NULL,
+					   DRM_PLANE_TYPE_CURSOR,
+					   NULL);
+
+	if (IS_ERR(plane))
+		return plane;
+
+	drm_plane_helper_add(plane, &vs_cursor_plane_helper_funcs);
+
+	return plane;
+}
diff --git a/drivers/gpu/drm/verisilicon/vs_cursor_plane_regs.h b/drivers/gpu/drm/verisilicon/vs_cursor_plane_regs.h
new file mode 100644
index 0000000000000..99693f2c95b94
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_cursor_plane_regs.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2025 Icenowy Zheng <uwu@icenowy.me>
+ *
+ * Based on vs_dc_hw.h, which is:
+ *   Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
+ */
+
+#ifndef _VS_CURSOR_PLANE_REGS_H_
+#define _VS_CURSOR_PLANE_REGS_H_
+
+#include <linux/bits.h>
+
+#define VSDC_CURSOR_CONFIG(n)		(0x1468 + 0x1080 * (n))
+#define VSDC_CURSOR_CONFIG_FMT_MASK	GENMASK(1, 0)
+#define VSDC_CURSOR_CONFIG_FMT_ARGB8888	(0x2 << 0)
+#define VSDC_CURSOR_CONFIG_FMT_OFF	(0x0 << 0)
+#define VSDC_CURSOR_CONFIG_IMG_UPDATE	BIT(2)
+#define VSDC_CURSOR_CONFIG_COMMIT	BIT(3)
+#define VSDC_CURSOR_CONFIG_SIZE_MASK	GENMASK(7, 5)
+#define VSDC_CURSOR_CONFIG_SIZE_32	(0x0 << 5)
+#define VSDC_CURSOR_CONFIG_SIZE_64	(0x1 << 5)
+#define VSDC_CURSOR_CONFIG_SIZE_128	(0x2 << 5)
+#define VSDC_CURSOR_CONFIG_SIZE_256	(0x3 << 5)
+#define VSDC_CURSOR_CONFIG_Y_OFF_MASK	GENMASK(12, 8)
+#define VSDC_CURSOR_CONFIG_Y_OFF(v)	((v) << 8)
+#define VSDC_CURSOR_CONFIG_X_OFF_MASK	GENMASK(20, 16)
+#define VSDC_CURSOR_CONFIG_X_OFF(v)	((v) << 16)
+
+#define VSDC_CURSOR_ADDRESS(n)		(0x146C + 0x1080 * (n))
+
+#define VSDC_CURSOR_LOCATION(n)		(0x1470 + 0x1080 * (n))
+#define VSDC_CURSOR_LOCATION_X_MASK	GENMASK(14, 0)
+#define VSDC_CURSOR_LOCATION_X(v)	((v) << 0)
+#define VSDC_CURSOR_LOCATION_Y_MASK	GENMASK(30, 16)
+#define VSDC_CURSOR_LOCATION_Y(v)	((v) << 16)
+
+#define VSDC_CURSOR_BACKGROUND(n)	(0x1474 + 0x1080 * (n))
+#define VSDC_CURSOR_BACKGRUOND_DEFAULT	0x00FFFFFF
+
+#define VSDC_CURSOR_FOREGROUND(n)	(0x1478 + 0x1080 * (n))
+#define VSDC_CURSOR_FOREGRUOND_DEFAULT	0x00AAAAAA
+
+#endif /* _VS_CURSOR_PLANE_REGS_H_ */
diff --git a/drivers/gpu/drm/verisilicon/vs_plane.h b/drivers/gpu/drm/verisilicon/vs_plane.h
index 41875ea3d66a5..60b5b3a1bc22a 100644
--- a/drivers/gpu/drm/verisilicon/vs_plane.h
+++ b/drivers/gpu/drm/verisilicon/vs_plane.h
@@ -68,5 +68,6 @@ dma_addr_t vs_fb_get_dma_addr(struct drm_framebuffer *fb,
 			      const struct drm_rect *src_rect);
 
 struct drm_plane *vs_primary_plane_init(struct drm_device *dev, struct vs_dc *dc);
+struct drm_plane *vs_cursor_plane_init(struct drm_device *dev, struct vs_dc *dc);
 
 #endif /* _VS_PLANE_H_ */
diff --git a/drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h b/drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h
index cbb125c46b390..61a48c2faa1b2 100644
--- a/drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h
+++ b/drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h
@@ -1,9 +1,12 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (C) 2025 Icenowy Zheng <uwu@icenowy.me>
+ * Copyright (C) 2026 Institute of Software, Chinese Academy of Sciences (ISCAS)
  *
  * Based on vs_dc_hw.h, which is:
  *   Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
+ *
+ * Authors:
+ * Icenowy Zheng <zhengxingda@iscas.ac.cn>
  */
 
 #ifndef _VS_PRIMARY_PLANE_REGS_H_
-- 
2.52.0

