Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1374234E619
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 13:09:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE53A6E8AA;
	Tue, 30 Mar 2021 11:09:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F10A36E8AA
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 11:09:11 +0000 (UTC)
Received: from guri.fritz.box (unknown
 [IPv6:2a02:810a:880:f54:2d37:13aa:2f32:9c00])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 4EF281F452F2;
 Tue, 30 Mar 2021 12:09:10 +0100 (BST)
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] drm/mediatek: Switch the hdmi bridge ops to the atomic
 versions
Date: Tue, 30 Mar 2021 13:09:01 +0200
Message-Id: <20210330110902.14178-2-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210330110902.14178-1-dafna.hirschfeld@collabora.com>
References: <20210330110902.14178-1-dafna.hirschfeld@collabora.com>
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
Cc: chunkuang.hu@kernel.org, dafna.hirschfeld@collabora.com, airlied@linux.ie,
 dafna3@gmail.com, laurent.pinchart@ideasonboard.com,
 enric.balletbo@collabora.com, kernel@collabora.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The bridge operation '.enable' and the audio cb '.get_eld'
access hdmi->conn. In the future we will want to support
the flag DRM_BRIDGE_ATTACH_NO_CONNECTOR and then we will
not have direct access to the connector.
The atomic version '.atomic_enable' allows accessing the
current connector from the state.
This patch switches the bridge to the atomic version to
prepare access to the connector in later patches.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 8ee55f9e2954..f2c810b767ef 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1357,7 +1357,8 @@ static bool mtk_hdmi_bridge_mode_fixup(struct drm_bridge *bridge,
 	return true;
 }
 
-static void mtk_hdmi_bridge_disable(struct drm_bridge *bridge)
+static void mtk_hdmi_bridge_atomic_disable(struct drm_bridge *bridge,
+					   struct drm_bridge_state *old_bridge_state)
 {
 	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
 
@@ -1371,7 +1372,8 @@ static void mtk_hdmi_bridge_disable(struct drm_bridge *bridge)
 	hdmi->enabled = false;
 }
 
-static void mtk_hdmi_bridge_post_disable(struct drm_bridge *bridge)
+static void mtk_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
+						struct drm_bridge_state *old_state)
 {
 	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
 
@@ -1406,7 +1408,8 @@ static void mtk_hdmi_bridge_mode_set(struct drm_bridge *bridge,
 	drm_mode_copy(&hdmi->mode, adjusted_mode);
 }
 
-static void mtk_hdmi_bridge_pre_enable(struct drm_bridge *bridge)
+static void mtk_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
+					      struct drm_bridge_state *old_state)
 {
 	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
 
@@ -1426,7 +1429,8 @@ static void mtk_hdmi_send_infoframe(struct mtk_hdmi *hdmi,
 		mtk_hdmi_setup_vendor_specific_infoframe(hdmi, mode);
 }
 
-static void mtk_hdmi_bridge_enable(struct drm_bridge *bridge)
+static void mtk_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
+					  struct drm_bridge_state *old_state)
 {
 	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
 
@@ -1440,13 +1444,16 @@ static void mtk_hdmi_bridge_enable(struct drm_bridge *bridge)
 }
 
 static const struct drm_bridge_funcs mtk_hdmi_bridge_funcs = {
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.attach = mtk_hdmi_bridge_attach,
 	.mode_fixup = mtk_hdmi_bridge_mode_fixup,
-	.disable = mtk_hdmi_bridge_disable,
-	.post_disable = mtk_hdmi_bridge_post_disable,
+	.atomic_disable = mtk_hdmi_bridge_atomic_disable,
+	.atomic_post_disable = mtk_hdmi_bridge_atomic_post_disable,
 	.mode_set = mtk_hdmi_bridge_mode_set,
-	.pre_enable = mtk_hdmi_bridge_pre_enable,
-	.enable = mtk_hdmi_bridge_enable,
+	.atomic_pre_enable = mtk_hdmi_bridge_atomic_pre_enable,
+	.atomic_enable = mtk_hdmi_bridge_atomic_enable,
 };
 
 static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
