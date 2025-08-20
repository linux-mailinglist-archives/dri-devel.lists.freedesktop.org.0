Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68434B2DE92
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 16:02:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA5C510E748;
	Wed, 20 Aug 2025 14:02:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="l2XvW7LP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7357A10E74D
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 14:02:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5619A43B90;
 Wed, 20 Aug 2025 14:02:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D82ADC4CEE7;
 Wed, 20 Aug 2025 14:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755698546;
 bh=K3NEYHCQpJ1kDmGIWdG9eDLnXkdpgxdjpAhoq0rNdq4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=l2XvW7LP3E46eF/beH/ZdNih0mOHhbb7/pwUHrv5sN4bb3NaLFefCNQTDnRyr7/ah
 Mpjr0BCUxkvfCZ1ZQv41BJJ/IqGTQqnv4ZvQyiMA92s6UwwYghQvUpRF6QlU67yZY7
 5VLY1f9dF5vL5aFdAaJea/7WYr6sVU0xqQ7M9WlZIMxauVRWZkg1CNv5afg/pidRqI
 K4/41SzVuvxUqSy3x9ZUXQEyf2n9omgvXao5sE3BaF1KffSTZG/GHN3xqQtcSr7T9G
 WY5ZErRBt1Z5WjUC7oEnFFVO71Hc8OZMXcXyCh5bc/IUFjyPOrrnGwCWojcLbrkDSE
 gSjLN1N/y2cwg==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 20 Aug 2025 16:01:49 +0200
Subject: [PATCH v2 09/14] drm/tidss: dispc: Switch VID_REG_GET to using a mask
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-drm-tidss-field-api-v2-9-43cab671c648@kernel.org>
References: <20250820-drm-tidss-field-api-v2-0-43cab671c648@kernel.org>
In-Reply-To: <20250820-drm-tidss-field-api-v2-0-43cab671c648@kernel.org>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2081; i=mripard@kernel.org;
 h=from:subject:message-id; bh=K3NEYHCQpJ1kDmGIWdG9eDLnXkdpgxdjpAhoq0rNdq4=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBlLrwZp8FjueuJ54uPav+u7Vi73DpD9ESZmXcoUw/7SI
 Ghhwce1HVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAiNkKMDTtydMUPx//LdrE1
 0vqpmfukOG5dr5LNpfJNu52fu1z9v9fta2Pfro4Vph0Rkos2VXT/Y2y49OnU74+pL8tKNyi4230
 UkvAyWsbYzRgzrznvqYuRpMcUZseys+7x/Q9z4qbKvlRmfQ4A
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

The VID_REG_GET function takes the start and end bits as parameter and
will generate a mask out of them.

This makes it difficult to share the masks between callers, since we now
need two arguments and to keep them consistent.

Let's change VID_REG_GET to take the mask as an argument instead, and
let the caller create the mask. Eventually, this mask will be moved to a
define.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 1b2791e8c04c463552ad370f48dce8eae5b94702..b4928cfbb6f7ca9a03371c5e599e2029baae333f 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -619,13 +619,12 @@ void tidss_disable_oldi(struct tidss_device *tidss, u32 hw_videoport)
 		u32 _reg = dispc_read(_dispc, _idx);			\
 		FIELD_MODIFY((mask), &_reg, (val));			\
 		dispc_write(_dispc, _idx, _reg);			\
 	})
 
-#define VID_REG_GET(dispc, hw_plane, idx, start, end)			\
-	((u32)FIELD_GET(GENMASK((start), (end)),			\
-			dispc_vid_read((dispc), (hw_plane), (idx))))
+#define VID_REG_GET(dispc, hw_plane, idx, mask)				\
+	((u32)FIELD_GET((mask), dispc_vid_read((dispc), (hw_plane), (idx))))
 
 #define VID_REG_FLD_MOD(dispc, hw_plane, idx, val, start, end)		\
 	({								\
 		struct dispc_device *_dispc = (dispc);			\
 		u32 _hw_plane = (hw_plane);				\
@@ -2307,11 +2306,12 @@ void dispc_plane_enable(struct dispc_device *dispc, u32 hw_plane, bool enable)
 	VID_REG_FLD_MOD(dispc, hw_plane, DISPC_VID_ATTRIBUTES, !!enable, 0, 0);
 }
 
 static u32 dispc_vid_get_fifo_size(struct dispc_device *dispc, u32 hw_plane)
 {
-	return VID_REG_GET(dispc, hw_plane, DISPC_VID_BUF_SIZE_STATUS, 15, 0);
+	return VID_REG_GET(dispc, hw_plane, DISPC_VID_BUF_SIZE_STATUS,
+			   GENMASK(15, 0));
 }
 
 static void dispc_vid_set_mflag_threshold(struct dispc_device *dispc,
 					  u32 hw_plane, u32 low, u32 high)
 {

-- 
2.50.1

