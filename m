Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0A0B2DE94
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 16:02:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A335410E74E;
	Wed, 20 Aug 2025 14:02:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TlqKMyud";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2515810E750
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 14:02:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 875F161441;
 Wed, 20 Aug 2025 14:02:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B068C4CEEB;
 Wed, 20 Aug 2025 14:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755698551;
 bh=NV11js6s9srfec80XO+Hoq/5LAEC7NyYVUkzDZjiUhM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=TlqKMyudO837wMokfWbMnB2MQD6MHiLbu7e1S6l2duTSlFQ0tdNROEYwBDFK2lnKH
 MbVtALB3k0OBm6fBBNV7Qgxf2XtvNq4QytUaMD9Xyg+FHSIbLWo9zsW0o3XaJ6z0Uk
 1am30rIfK/AcQnDWODi05LDhJfU+QpwL1LYAyiIIE50etDrgAQypNARnkl4dIqcKGi
 rqseBkHF/CD9EWkhb2ur78oTo2O3Yk+U8VMXm9RT6e+NVsH0mLMXeKpGlIkCkiZF3X
 XQ/NFV/B1Fv3qFcO+pga9yhpK7QyKOCLjORmLE4ScBGD2Jz9pAaNUlbPCQsKNFP5lL
 vrywwxFuzlN3Q==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 20 Aug 2025 16:01:51 +0200
Subject: [PATCH v2 11/14] drm/tidss: dispc: Switch VP_REG_GET to using a mask
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-drm-tidss-field-api-v2-11-43cab671c648@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2215; i=mripard@kernel.org;
 h=from:subject:message-id; bh=NV11js6s9srfec80XO+Hoq/5LAEC7NyYVUkzDZjiUhM=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBlLrwbvNbWQlagPSvmeddCVNcvy2+kEp+WVDVYF2f93v
 UxTSrnSMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACZy5QRjw5ulf1wzst/2L16a
 UWq/XIBx31kpqSiBhFCffUbzci8m3ZD/XaD6/ZX1VMXGE5c2C1xYzFin2dsxUyhUYDVLgZVuhFn
 kvC5m1ijn3emhR1tFCtt3RL9rivEuMZJMfWyazGV7JSwnDQA=
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

The VP_REG_GET function takes the start and end bits as parameter and
will generate a mask out of them.

This makes it difficult to share the masks between callers, since we now
need two arguments and to keep them consistent.

Let's change VP_REG_GET to take the mask as an argument instead, and let
the caller create the mask. Eventually, this mask will be moved to a
define.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 8c0949203ace147e403ea43ab468c3a56d170156..45422fb6038a255b8ba1246762f39a4284e5b1d5 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -632,13 +632,12 @@ void tidss_disable_oldi(struct tidss_device *tidss, u32 hw_videoport)
 		u32 _reg = dispc_vid_read(_dispc, _hw_plane, _idx);	\
 		FIELD_MODIFY((mask), &_reg, (val));			\
 		dispc_vid_write(_dispc, _hw_plane, _idx, _reg);		\
 	})
 
-#define VP_REG_GET(dispc, vp, idx, start, end)				\
-	((u32)FIELD_GET(GENMASK((start), (end)),			\
-			dispc_vp_read((dispc), (vp), (idx))))
+#define VP_REG_GET(dispc, vp, idx, mask)				\
+	((u32)FIELD_GET((mask), dispc_vp_read((dispc), (vp), (idx))))
 
 #define VP_REG_FLD_MOD(dispc, vp, idx, val, start, end)			\
 	({								\
 		struct dispc_device *_dispc = (dispc);			\
 		u32 _vp = (vp);						\
@@ -1273,16 +1272,17 @@ void dispc_vp_unprepare(struct dispc_device *dispc, u32 hw_videoport)
 	}
 }
 
 bool dispc_vp_go_busy(struct dispc_device *dispc, u32 hw_videoport)
 {
-	return VP_REG_GET(dispc, hw_videoport, DISPC_VP_CONTROL, 5, 5);
+	return VP_REG_GET(dispc, hw_videoport, DISPC_VP_CONTROL,
+			  GENMASK(5, 5));
 }
 
 void dispc_vp_go(struct dispc_device *dispc, u32 hw_videoport)
 {
-	WARN_ON(VP_REG_GET(dispc, hw_videoport, DISPC_VP_CONTROL, 5, 5));
+	WARN_ON(VP_REG_GET(dispc, hw_videoport, DISPC_VP_CONTROL, GENMASK(5, 5)));
 	VP_REG_FLD_MOD(dispc, hw_videoport, DISPC_VP_CONTROL, 1, 5, 5);
 }
 
 enum c8_to_c12_mode { C8_TO_C12_REPLICATE, C8_TO_C12_MAX, C8_TO_C12_MIN };
 

-- 
2.50.1

