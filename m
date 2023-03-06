Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B69F86AB93F
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 10:06:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0947310E098;
	Mon,  6 Mar 2023 09:06:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCC1910E1BC
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 09:06:44 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:b745:671d:a946:57fa])
 by xavier.telenet-ops.be with bizsmtp
 id Ux6a2900J4LuvSS01x6aeG; Mon, 06 Mar 2023 10:06:42 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1pZ6nC-00B4Fr-6Q;
 Mon, 06 Mar 2023 10:06:34 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1pZ6ni-000HC1-5x;
 Mon, 06 Mar 2023 10:06:34 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Vinod Koul <vkoul@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: [PATCH] drm/msm/dpu: Fix bit-shifting UB in DPU_HW_VER() macro
Date: Mon,  6 Mar 2023 10:06:33 +0100
Message-Id: <20230306090633.65918-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
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
Cc: linux-arm-msm@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With gcc-5 and CONFIG_UBSAN_SHIFT=y:

    drivers/gpu/drm/msm/msm_mdss.c: In function 'msm_mdss_enable':
    drivers/gpu/drm/msm/msm_mdss.c:296:2: error: case label does not reduce to an integer constant
      case DPU_HW_VER_800:
      ^
    drivers/gpu/drm/msm/msm_mdss.c:299:2: error: case label does not reduce to an integer constant
      case DPU_HW_VER_810:
      ^
    drivers/gpu/drm/msm/msm_mdss.c:300:2: error: case label does not reduce to an integer constant
      case DPU_HW_VER_900:
      ^

This happens because for major revisions 8 or greather, the non-sign bit
of the major revision number is shifted into bit 31 of a signed integer,
which is undefined behavior.

Fix this by casting the major revision number to unsigned int.

Fixes: efcd0107727c4f04 ("drm/msm/dpu: add support for SM8550")
Fixes: 4a352c2fc15aec1e ("drm/msm/dpu: Introduce SC8280XP")
Fixes: 100d7ef6995d1f86 ("drm/msm/dpu: add support for SM8450")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index ddab9caebb18c40d..bbd3cbdd77956c5d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -19,8 +19,9 @@
  */
 #define MAX_BLOCKS    12
 
-#define DPU_HW_VER(MAJOR, MINOR, STEP) (((MAJOR & 0xF) << 28)    |\
-		((MINOR & 0xFFF) << 16)  |\
+#define DPU_HW_VER(MAJOR, MINOR, STEP)			\
+		((((unsigned int)MAJOR & 0xF) << 28) |	\
+		((MINOR & 0xFFF) << 16) |		\
 		(STEP & 0xFFFF))
 
 #define DPU_HW_MAJOR(rev)		((rev) >> 28)
-- 
2.34.1

