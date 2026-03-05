Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yL8lKlc6qWkd3QAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:09:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 208EC20D382
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:09:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58AD610EB54;
	Thu,  5 Mar 2026 08:09:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4877B10EB54
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 08:09:55 +0000 (UTC)
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.103.14])
 by APP-01 (Coremail) with SMTP id qwCowAA33mlMOqlpp6pHCQ--.1877S2;
 Thu, 05 Mar 2026 16:09:48 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Icenowy Zheng <uwu@icenowy.me>, Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH drm-misc-next v2 3/3] drm: verisilicon: fill plane's vs_format
 in atomic_check
Date: Thu,  5 Mar 2026 16:09:46 +0800
Message-ID: <20260305080947.3656864-1-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260305075926.3642501-1-zhengxingda@iscas.ac.cn>
References: <20260305075926.3642501-1-zhengxingda@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAA33mlMOqlpp6pHCQ--.1877S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXw1fCF18WryUJFyDWFy5XFb_yoW5Zw1rpr
 4DAFyrKr4ftrWUWr9rJr4DtFZxu3Z3GryIgrWDGwnaqF15t343CF1kJrZ3CFs8JrW7Gw4x
 tanayrnxAw42yaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
 tVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
 v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
 c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
 MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUZYFZUUU
 UU=
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
X-Rspamd-Queue-Id: 208EC20D382
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
	NEURAL_HAM(-0.00)[-0.976];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:mid,iscas.ac.cn:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Move the conversion from drm_format to vs_format to atomic_check, which
is before the point of no return and can properly bail out.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
Changes in v2:
- Add non-NULL check for drm_plane_state->fb.

 drivers/gpu/drm/verisilicon/vs_plane.h        |  2 ++
 .../gpu/drm/verisilicon/vs_primary_plane.c    | 21 ++++++++++++-------
 2 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/verisilicon/vs_plane.h b/drivers/gpu/drm/verisilicon/vs_plane.h
index 12848a72af576..df4b248b52954 100644
--- a/drivers/gpu/drm/verisilicon/vs_plane.h
+++ b/drivers/gpu/drm/verisilicon/vs_plane.h
@@ -65,6 +65,8 @@ struct vs_format {
 
 struct vs_plane_state {
 	struct drm_plane_state base;
+
+	struct vs_format format;
 };
 
 static inline struct vs_plane_state *state_to_vs_plane_state(struct drm_plane_state *state)
diff --git a/drivers/gpu/drm/verisilicon/vs_primary_plane.c b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
index bad0bc5e3242d..ca41c8053ae12 100644
--- a/drivers/gpu/drm/verisilicon/vs_primary_plane.c
+++ b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
@@ -25,12 +25,20 @@ static int vs_primary_plane_atomic_check(struct drm_plane *plane,
 {
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
+	struct vs_plane_state *new_vs_plane_state = state_to_vs_plane_state(new_plane_state);
 	struct drm_crtc *crtc = new_plane_state->crtc;
+	struct drm_framebuffer *fb = new_plane_state->fb;
 	struct drm_crtc_state *crtc_state;
+	int ret;
 
-	if (!crtc)
+	if (!crtc || !fb)
 		return 0;
 
+	ret = drm_format_to_vs_format(fb->format->format,
+				      &new_vs_plane_state->format);
+	if (ret)
+		return ret;
+
 	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
@@ -88,11 +96,11 @@ static void vs_primary_plane_atomic_update(struct drm_plane *plane,
 {
 	struct drm_plane_state *state = drm_atomic_get_new_plane_state(atomic_state,
 								       plane);
+	struct vs_plane_state *vs_state = state_to_vs_plane_state(state);
 	struct drm_framebuffer *fb = state->fb;
 	struct drm_crtc *crtc = state->crtc;
 	struct vs_dc *dc;
 	struct vs_crtc *vcrtc;
-	struct vs_format fmt;
 	unsigned int output;
 	dma_addr_t dma_addr;
 
@@ -105,16 +113,15 @@ static void vs_primary_plane_atomic_update(struct drm_plane *plane,
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

