Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB70A24A16
	for <lists+dri-devel@lfdr.de>; Sat,  1 Feb 2025 16:58:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9056110E113;
	Sat,  1 Feb 2025 15:58:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A35BA10E113
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Feb 2025 15:58:50 +0000 (UTC)
X-CSE-ConnectionGUID: y2m+J6VtQomP5ceMAG0x6A==
X-CSE-MsgGUID: L8OgIuffRcaZ81niYHHAfA==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 02 Feb 2025 00:58:49 +0900
Received: from localhost.localdomain (unknown [10.226.92.62])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id CBC8E401439D;
 Sun,  2 Feb 2025 00:58:35 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] drm/msm: Use of_get_available_child_by_name()
Date: Sat,  1 Feb 2025 15:58:28 +0000
Message-ID: <20250201155830.39366-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Simplify zap_shader_load_mdt() by using of_get_available_child_by_name().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
This patch is only compile tested and depend upon[1]
[1] https://lore.kernel.org/all/20250201093126.7322-1-biju.das.jz@bp.renesas.com/
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 1238f3265978..bbbc7428cb11 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -45,8 +45,8 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
 		return -EINVAL;
 	}
 
-	np = of_get_child_by_name(dev->of_node, "zap-shader");
-	if (!of_device_is_available(np)) {
+	np = of_get_available_child_by_name(dev->of_node, "zap-shader");
+	if (!np) {
 		zap_available = false;
 		return -ENODEV;
 	}
-- 
2.43.0

