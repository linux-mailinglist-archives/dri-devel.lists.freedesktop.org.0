Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEI3I36jqWkZBgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 16:38:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 353AC214AAB
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 16:38:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3488D10EC46;
	Thu,  5 Mar 2026 15:38:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91CC910EC36
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 15:38:32 +0000 (UTC)
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.103.14])
 by APP-03 (Coremail) with SMTP id rQCowAC3195so6lpFrziCQ--.13220S6;
 Thu, 05 Mar 2026 23:38:27 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Icenowy Zheng <uwu@icenowy.me>, Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH drm-misc-next v3 4/4] drm: verisilicon: fill plane's vs_format
 in atomic_check
Date: Thu,  5 Mar 2026 23:38:17 +0800
Message-ID: <20260305153817.157841-5-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260305153817.157841-1-zhengxingda@iscas.ac.cn>
References: <20260305153817.157841-1-zhengxingda@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowAC3195so6lpFrziCQ--.13220S6
X-Coremail-Antispam: 1UD129KBjvJXoWxXw1fCF18Xw47Cr17XF1DWrg_yoW7JF17pr
 4DAFyUKr4rArW8Gr9rJw4kta9xuan3GryIgrWkGwnavF15trW3Cw1DJrZ3CFs8JrZrGw4x
 tanaywsxAw42yF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBE14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
 1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0D
 M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
 v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
 F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r1q6r
 43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_
 Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x
 0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8
 JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIx
 AIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUQFxUUUUUU
 =
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
X-Rspamd-Queue-Id: 353AC214AAB
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
	FROM_NEQ_ENVFROM(0.00)[zhengxingda@iscas.ac.cn,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.975];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Move the conversion from drm_format to vs_format to atomic_check, which
is before the point of no return and can properly bail out.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
Changes in v3:
- Move the code filling vs_format to after drm_atomic_helper_check_plane_state()
  call.
- Add drm_WARN_ON_ONCE when filling vs_format fails.
- Add code copying vs_format in vs_plane_duplicate_state (because it no
  longer memdup's the whole struct vs_plane_state).

Changes in v2:
- Add non-NULL check for drm_plane_state->fb.

 drivers/gpu/drm/verisilicon/vs_plane.c        |  7 +++-
 drivers/gpu/drm/verisilicon/vs_plane.h        |  2 ++
 .../gpu/drm/verisilicon/vs_primary_plane.c    | 35 +++++++++++++------
 3 files changed, 32 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/verisilicon/vs_plane.c b/drivers/gpu/drm/verisilicon/vs_plane.c
index e92b869fb90ca..902c6f66c975f 100644
--- a/drivers/gpu/drm/verisilicon/vs_plane.c
+++ b/drivers/gpu/drm/verisilicon/vs_plane.c
@@ -129,17 +129,22 @@ dma_addr_t vs_fb_get_dma_addr(struct drm_framebuffer *fb,
 
 struct drm_plane_state *vs_plane_duplicate_state(struct drm_plane *plane)
 {
-	struct vs_plane_state *vs_state;
+	struct vs_plane_state *vs_state, *vs_state_old;
 
 	if (drm_WARN_ON(plane->dev, !plane->state))
 		return NULL;
 
+	vs_state_old = to_vs_plane_state(plane->state);
+
 	vs_state = kzalloc_obj(*vs_state, GFP_KERNEL);
 	if (!vs_state)
 		return NULL;
 
 	__drm_atomic_helper_plane_duplicate_state(plane, &vs_state->base);
 
+	memcpy(&vs_state->format, &vs_state_old->format,
+	       sizeof(struct vs_format));
+
 	return &vs_state->base;
 }
 
diff --git a/drivers/gpu/drm/verisilicon/vs_plane.h b/drivers/gpu/drm/verisilicon/vs_plane.h
index 48ed8fc754d18..f18c36ef4cd90 100644
--- a/drivers/gpu/drm/verisilicon/vs_plane.h
+++ b/drivers/gpu/drm/verisilicon/vs_plane.h
@@ -65,6 +65,8 @@ struct vs_format {
 
 struct vs_plane_state {
 	struct drm_plane_state base;
+
+	struct vs_format format;
 };
 
 static inline struct vs_plane_state *to_vs_plane_state(struct drm_plane_state *state)
diff --git a/drivers/gpu/drm/verisilicon/vs_primary_plane.c b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
index 421d6f9dc547b..3d45101838aeb 100644
--- a/drivers/gpu/drm/verisilicon/vs_primary_plane.c
+++ b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
@@ -25,17 +25,31 @@ static int vs_primary_plane_atomic_check(struct drm_plane *plane,
 {
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
+	struct vs_plane_state *new_vs_plane_state = to_vs_plane_state(new_plane_state);
+	struct drm_framebuffer *fb = new_plane_state->fb;
 	struct drm_crtc *crtc = new_plane_state->crtc;
 	struct drm_crtc_state *crtc_state = NULL;
+	int ret;
 
 	if (crtc)
 		crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 
-	return drm_atomic_helper_check_plane_state(new_plane_state,
-						   crtc_state,
-						   DRM_PLANE_NO_SCALING,
-						   DRM_PLANE_NO_SCALING,
-						   false, true);
+	ret = drm_atomic_helper_check_plane_state(new_plane_state,
+						  crtc_state,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  false, true);
+	if (ret)
+		return ret;
+
+	if (fb) {
+		ret = drm_format_to_vs_format(fb->format->format,
+					      &new_vs_plane_state->format);
+		if (drm_WARN_ON_ONCE(plane->dev, ret))
+			return ret;
+	}
+
+	return 0;
 }
 
 static void vs_primary_plane_commit(struct vs_dc *dc, unsigned int output)
@@ -84,11 +98,11 @@ static void vs_primary_plane_atomic_update(struct drm_plane *plane,
 {
 	struct drm_plane_state *state = drm_atomic_get_new_plane_state(atomic_state,
 								       plane);
+	struct vs_plane_state *vs_state = to_vs_plane_state(state);
 	struct drm_framebuffer *fb = state->fb;
 	struct drm_crtc *crtc = state->crtc;
 	struct vs_dc *dc;
 	struct vs_crtc *vcrtc;
-	struct vs_format fmt;
 	unsigned int output;
 	dma_addr_t dma_addr;
 
@@ -101,16 +115,15 @@ static void vs_primary_plane_atomic_update(struct drm_plane *plane,
 	output = vcrtc->id;
 	dc = vcrtc->dc;
 
-	drm_format_to_vs_format(state->fb->format->format, &fmt);
-
 	regmap_update_bits(dc->regs, VSDC_FB_CONFIG(output),
 			   VSDC_FB_CONFIG_FMT_MASK,
-			   VSDC_FB_CONFIG_FMT(fmt.color));
+			   VSDC_FB_CONFIG_FMT(vs_state->format.color));
 	regmap_update_bits(dc->regs, VSDC_FB_CONFIG(output),
 			   VSDC_FB_CONFIG_SWIZZLE_MASK,
-			   VSDC_FB_CONFIG_SWIZZLE(fmt.swizzle));
+			   VSDC_FB_CONFIG_SWIZZLE(vs_state->format.swizzle));
 	regmap_assign_bits(dc->regs, VSDC_FB_CONFIG(output),
-			   VSDC_FB_CONFIG_UV_SWIZZLE_EN, fmt.uv_swizzle);
+			   VSDC_FB_CONFIG_UV_SWIZZLE_EN,
+			   vs_state->format.uv_swizzle);
 
 	dma_addr = vs_fb_get_dma_addr(fb, &state->src);
 
-- 
2.52.0

