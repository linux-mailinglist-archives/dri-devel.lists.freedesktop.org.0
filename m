Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHB1I3+jqWl5BQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 16:38:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E0E214AB3
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 16:38:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32FC510EC45;
	Thu,  5 Mar 2026 15:38:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B0B210EC2B
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 15:38:32 +0000 (UTC)
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.103.14])
 by APP-03 (Coremail) with SMTP id rQCowAC3195so6lpFrziCQ--.13220S4;
 Thu, 05 Mar 2026 23:38:25 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Icenowy Zheng <uwu@icenowy.me>, Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH drm-misc-next v3 2/4] drm: verisilicon: subclass
 drm_plane_state
Date: Thu,  5 Mar 2026 23:38:15 +0800
Message-ID: <20260305153817.157841-3-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260305153817.157841-1-zhengxingda@iscas.ac.cn>
References: <20260305153817.157841-1-zhengxingda@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowAC3195so6lpFrziCQ--.13220S4
X-Coremail-Antispam: 1UD129KBjvJXoWxJF1ftr1UJF4UXrWDZF4Utwb_yoWrurWfpr
 srAFy5Kr45Aw4DG3srJw1jy39xua18KryIgrZ7GwnavF15try3uF1ktr93uF43JrW7Gw13
 tan2kr4DCr4ayrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBl14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
 x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
 ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I2
 62IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcV
 AFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG
 0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_Jw0_GFyl42
 xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
 GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI4
 8JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4U
 MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I
 8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUj5Ef7UUUUU==
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
X-Rspamd-Queue-Id: 31E0E214AB3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.89 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:uwu@icenowy.me,m:zhengxingda@iscas.ac.cn,s:lists@lfdr.de];
	DMARC_NA(0.00)[iscas.ac.cn];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[zhengxingda@iscas.ac.cn,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhengxingda@iscas.ac.cn,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.973];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Create a subclass of drm_plane_state to store hardware-specific state
information (e.g. hardware plane format settings) in the future.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
Changes in v3:
- Switch to drm_WARN_ON().
- Stop to memdup the state.
- Move the code freeing the existing plane state to the branch checking
  whether it's not NULL.
- Rename the typecast function to `to_vs_plane_state()`.

Changes in v2:
- Add the #include clause for atomic state helpers, which was wrongly
  placed in the previous patch in v1.
- Switch to kzalloc_obj helper for allocating the state.

 drivers/gpu/drm/verisilicon/vs_plane.c        | 42 +++++++++++++++++++
 drivers/gpu/drm/verisilicon/vs_plane.h        | 14 +++++++
 .../gpu/drm/verisilicon/vs_primary_plane.c    |  6 +--
 3 files changed, 59 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/verisilicon/vs_plane.c b/drivers/gpu/drm/verisilicon/vs_plane.c
index fa88ed14e41d7..e92b869fb90ca 100644
--- a/drivers/gpu/drm/verisilicon/vs_plane.c
+++ b/drivers/gpu/drm/verisilicon/vs_plane.c
@@ -6,9 +6,11 @@
 #include <linux/errno.h>
 #include <linux/printk.h>
 
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_print.h>
 
 #include "vs_plane.h"
 
@@ -124,3 +126,43 @@ dma_addr_t vs_fb_get_dma_addr(struct drm_framebuffer *fb,
 
 	return dma_addr;
 }
+
+struct drm_plane_state *vs_plane_duplicate_state(struct drm_plane *plane)
+{
+	struct vs_plane_state *vs_state;
+
+	if (drm_WARN_ON(plane->dev, !plane->state))
+		return NULL;
+
+	vs_state = kzalloc_obj(*vs_state, GFP_KERNEL);
+	if (!vs_state)
+		return NULL;
+
+	__drm_atomic_helper_plane_duplicate_state(plane, &vs_state->base);
+
+	return &vs_state->base;
+}
+
+void vs_plane_destroy_state(struct drm_plane *plane,
+			    struct drm_plane_state *state)
+{
+	__drm_atomic_helper_plane_destroy_state(state);
+	kfree(state);
+}
+
+/* Called during init to allocate the plane's atomic state. */
+void vs_plane_reset(struct drm_plane *plane)
+{
+	struct vs_plane_state *vs_state;
+
+	if (plane->state) {
+		__drm_atomic_helper_plane_destroy_state(plane->state);
+		kfree(plane->state);
+	}
+
+	vs_state = kzalloc_obj(*vs_state, GFP_KERNEL);
+	if (!vs_state)
+		return;
+
+	__drm_atomic_helper_plane_reset(plane, &vs_state->base);
+}
diff --git a/drivers/gpu/drm/verisilicon/vs_plane.h b/drivers/gpu/drm/verisilicon/vs_plane.h
index a88cc19f2202e..48ed8fc754d18 100644
--- a/drivers/gpu/drm/verisilicon/vs_plane.h
+++ b/drivers/gpu/drm/verisilicon/vs_plane.h
@@ -63,10 +63,24 @@ struct vs_format {
 	bool uv_swizzle;
 };
 
+struct vs_plane_state {
+	struct drm_plane_state base;
+};
+
+static inline struct vs_plane_state *to_vs_plane_state(struct drm_plane_state *state)
+{
+	return container_of(state, struct vs_plane_state, base);
+}
+
 int drm_format_to_vs_format(u32 drm_format, struct vs_format *vs_format);
 dma_addr_t vs_fb_get_dma_addr(struct drm_framebuffer *fb,
 			      const struct drm_rect *src_rect);
 
+struct drm_plane_state *vs_plane_duplicate_state(struct drm_plane *plane);
+void vs_plane_destroy_state(struct drm_plane *plane,
+			    struct drm_plane_state *state);
+void vs_plane_reset(struct drm_plane *plane);
+
 struct drm_plane *vs_primary_plane_init(struct drm_device *dev, struct vs_dc *dc);
 
 #endif /* _VS_PLANE_H_ */
diff --git a/drivers/gpu/drm/verisilicon/vs_primary_plane.c b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
index e8fcb5958615c..bad0bc5e3242d 100644
--- a/drivers/gpu/drm/verisilicon/vs_primary_plane.c
+++ b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
@@ -145,10 +145,10 @@ static const struct drm_plane_helper_funcs vs_primary_plane_helper_funcs = {
 };
 
 static const struct drm_plane_funcs vs_primary_plane_funcs = {
-	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
-	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
+	.atomic_destroy_state	= vs_plane_destroy_state,
+	.atomic_duplicate_state	= vs_plane_duplicate_state,
 	.disable_plane		= drm_atomic_helper_disable_plane,
-	.reset			= drm_atomic_helper_plane_reset,
+	.reset			= vs_plane_reset,
 	.update_plane		= drm_atomic_helper_update_plane,
 };
 
-- 
2.52.0

