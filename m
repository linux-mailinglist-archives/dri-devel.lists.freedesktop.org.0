Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2588C1C4EAD
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 08:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58A496E55C;
	Tue,  5 May 2020 06:59:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A2B89C6A;
 Mon,  4 May 2020 11:32:48 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id CAA0FA6325385DFE95C3;
 Mon,  4 May 2020 19:32:45 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.487.0; Mon, 4 May 2020
 19:32:38 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <robdclark@gmail.com>, <sean@poorly.run>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <jshekhar@codeaurora.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/msm/dpu: make _dpu_core_perf_crtc_update_bus() void
Date: Mon, 4 May 2020 19:32:01 +0800
Message-ID: <20200504113201.40302-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 05 May 2020 06:58:49 +0000
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
Cc: Jason Yan <yanaijie@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This function does not need to return an error so make it return void.
This fixes the following coccicheck warning:

drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c:178:5-8: Unneeded
variable: "ret". Return "0" on line 193

Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 11f2bebe3869..12df1955b1ef 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -167,7 +167,7 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 	return 0;
 }
 
-static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
+static void _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 		struct drm_crtc *crtc)
 {
 	struct dpu_core_perf_params perf = { 0 };
@@ -175,7 +175,6 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 					= dpu_crtc_get_client_type(crtc);
 	struct drm_crtc *tmp_crtc;
 	struct dpu_crtc_state *dpu_cstate;
-	int ret = 0;
 
 	drm_for_each_crtc(tmp_crtc, crtc->dev) {
 		if (tmp_crtc->enabled &&
@@ -190,7 +189,6 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 					dpu_cstate->new_perf.bw_ctl);
 		}
 	}
-	return ret;
 }
 
 /**
@@ -335,14 +333,8 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
 	trace_dpu_perf_crtc_update(crtc->base.id, new->bw_ctl,
 		new->core_clk_rate, stop_req, update_bus, update_clk);
 
-	if (update_bus) {
-		ret = _dpu_core_perf_crtc_update_bus(kms, crtc);
-		if (ret) {
-			DPU_ERROR("crtc-%d: failed to update bus bw vote\n",
-				  crtc->base.id);
-			return ret;
-		}
-	}
+	if (update_bus)
+		_dpu_core_perf_crtc_update_bus(kms, crtc);
 
 	/*
 	 * Update the clock after bandwidth vote to ensure
-- 
2.21.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
