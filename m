Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5C8B385E6
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 17:13:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 686DC10E848;
	Wed, 27 Aug 2025 15:13:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IBrC+iO4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E451810E849
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 15:13:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 65D88601DA;
 Wed, 27 Aug 2025 15:13:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFD29C4CEEB;
 Wed, 27 Aug 2025 15:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756307580;
 bh=IUaQn0XWbrijEey97sd6Zt/C2swsiVJ+8FwifczVmyc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=IBrC+iO48o0B97niiVfx3anc481X5q9Emv+H0K3yJbR5sKy9RHTw43bC+ggt+YotB
 lAHNjMVqqa0gojDQhMpdvEMzLR5mktj7kUyolz7tfsKDEtNUervHlpHG1lxUAaieI6
 ZukwmB6o0MiX99AnzdWyQGD6eXR+kNPVIcYMVNTAhrblgHqpnGHpohP25nfK8NMW6s
 fXpAfJvLmGlTNQLX143tSs4PwhB8fgZB27JcAAU8e9fEgTeftPZB/mFXvEuW9948pj
 x9DjjAh4DIR0IKdSkZHwFawG3cVIDW00edvkpiAZ4o87uD/cMRfHxNzL5ij/aliJjh
 VuqhhS3oJVVAw==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 27 Aug 2025 17:12:37 +0200
Subject: [PATCH v3 06/14] drm/tidss: dispc: Get rid of FLD_MOD
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-drm-tidss-field-api-v3-6-7689b664cc63@kernel.org>
References: <20250827-drm-tidss-field-api-v3-0-7689b664cc63@kernel.org>
In-Reply-To: <20250827-drm-tidss-field-api-v3-0-7689b664cc63@kernel.org>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4304; i=mripard@kernel.org;
 h=from:subject:message-id; bh=IUaQn0XWbrijEey97sd6Zt/C2swsiVJ+8FwifczVmyc=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnrFVIPuOyUSz+w4dKl+LJCo7c5O3YG3uXb9n7ewg65+
 LZJTAk9HVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAiJ2sZG1b3qbZtl/NTP/NU
 59DXwG0H+GK5uRXUFlitX5hmW/Rtt5DaU2GpPb8D5znIcvn3WL9dz1ifkPnjcd3JBkcHjvrHV0T
 i1J9Y33/aeeH5HGmlNf/u1bUWJkW+8TdzlFmze+3+9xblb0oA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

The FLD_MOD function is an equivalent to what FIELD_MODIFY + GENMASK
provide, so let's drop it and switch to the latter.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 36 ++++++++++++++----------------------
 1 file changed, 14 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index b4ba342ac241a603db447d6c5ae147c981013be2..4eeeae6e0a0ecc8bb5bbc5f455e9fab6b913097a 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -592,29 +592,21 @@ void tidss_disable_oldi(struct tidss_device *tidss, u32 hw_videoport)
 /*
  * TRM gives bitfields as start:end, where start is the higher bit
  * number. For example 7:0
  */
 
-#define FLD_MOD(orig, val, start, end)					\
-	({								\
-		int _start = (start), _end = (end);			\
-		u32 _masked_val = (orig) & ~GENMASK(_start, _end);	\
-		u32 _new_val = _masked_val | FIELD_PREP(GENMASK(_start, _end), (val)); \
-		_new_val;						\
-	})
-
 #define REG_GET(dispc, idx, start, end)					\
 	((u32)FIELD_GET(GENMASK((start), (end)),			\
 			dispc_read((dispc), (idx))))
 
 #define REG_FLD_MOD(dispc, idx, val, start, end)			\
 	({								\
 		struct dispc_device *_dispc = (dispc);			\
 		u32 _idx = (idx);					\
-		u32 _curr = dispc_read(_dispc, _idx);			\
-		u32 _new = FLD_MOD(_curr, (val), (start), (end));	\
-		dispc_write(_dispc, _idx, _new);			\
+		u32 _reg = dispc_read(_dispc, _idx);			\
+		FIELD_MODIFY(GENMASK((start), (end)), &_reg, (val));	\
+		dispc_write(_dispc, _idx, _reg);			\
 	})
 
 #define VID_REG_GET(dispc, hw_plane, idx, start, end)			\
 	((u32)FIELD_GET(GENMASK((start), (end)),			\
 			dispc_vid_read((dispc), (hw_plane), (idx))))
@@ -622,13 +614,13 @@ void tidss_disable_oldi(struct tidss_device *tidss, u32 hw_videoport)
 #define VID_REG_FLD_MOD(dispc, hw_plane, idx, val, start, end)		\
 	({								\
 		struct dispc_device *_dispc = (dispc);			\
 		u32 _hw_plane = (hw_plane);				\
 		u32 _idx = (idx);					\
-		u32 _curr = dispc_vid_read(_dispc, _hw_plane, _idx);	\
-		u32 _new = FLD_MOD(_curr, (val), (start), (end));	\
-		dispc_vid_write(_dispc, _hw_plane, _idx, _new);		\
+		u32 _reg = dispc_vid_read(_dispc, _hw_plane, _idx);	\
+		FIELD_MODIFY(GENMASK((start), (end)), &_reg, (val));	\
+		dispc_vid_write(_dispc, _hw_plane, _idx, _reg);		\
 	})
 
 #define VP_REG_GET(dispc, vp, idx, start, end)				\
 	((u32)FIELD_GET(GENMASK((start), (end)),			\
 			dispc_vp_read((dispc), (vp), (idx))))
@@ -636,23 +628,23 @@ void tidss_disable_oldi(struct tidss_device *tidss, u32 hw_videoport)
 #define VP_REG_FLD_MOD(dispc, vp, idx, val, start, end)			\
 	({								\
 		struct dispc_device *_dispc = (dispc);			\
 		u32 _vp = (vp);						\
 		u32 _idx = (idx);					\
-		u32 _curr = dispc_vp_read(_dispc, _vp, _idx);		\
-		u32 _new = FLD_MOD(_curr, (val), (start), (end));	\
-		dispc_vp_write(_dispc, _vp, _idx, _new);		\
+		u32 _reg = dispc_vp_read(_dispc, _vp, _idx);		\
+		FIELD_MODIFY(GENMASK((start), (end)), &_reg, (val));	\
+		dispc_vp_write(_dispc, _vp, _idx, _reg);		\
 	})
 
 #define OVR_REG_FLD_MOD(dispc, ovr, idx, val, start, end)		\
 	({								\
 		struct dispc_device *_dispc = (dispc);			\
-		u32 _ovr = (ovr);						\
+		u32 _ovr = (ovr);					\
 		u32 _idx = (idx);					\
-		u32 _curr = dispc_ovr_read(_dispc, _ovr, _idx);		\
-		u32 _new = FLD_MOD(_curr, (val), (start), (end));	\
-		dispc_ovr_write(_dispc, _ovr, _idx, _new);		\
+		u32 _reg = dispc_ovr_read(_dispc, _ovr, _idx);		\
+		FIELD_MODIFY(GENMASK((start), (end)), &_reg, (val));	\
+		dispc_ovr_write(_dispc, _ovr, _idx, _reg);		\
 	})
 
 static dispc_irq_t dispc_vp_irq_from_raw(u32 stat, u32 hw_videoport)
 {
 	dispc_irq_t vp_stat = 0;
@@ -1145,11 +1137,11 @@ static void dispc_enable_am65x_oldi(struct dispc_device *dispc, u32 hw_videoport
 		dev_warn(dispc->dev, "%s: %d port width not supported\n",
 			 __func__, fmt->data_width);
 
 	oldi_cfg |= BIT(7); /* DEPOL */
 
-	oldi_cfg = FLD_MOD(oldi_cfg, fmt->am65x_oldi_mode_reg_val, 3, 1);
+	FIELD_MODIFY(GENMASK(3, 1), &oldi_cfg, fmt->am65x_oldi_mode_reg_val);
 
 	oldi_cfg |= BIT(12); /* SOFTRST */
 
 	oldi_cfg |= BIT(0); /* ENABLE */
 

-- 
2.50.1

