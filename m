Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 886AB5093DE
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 01:50:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA45410F2CD;
	Wed, 20 Apr 2022 23:50:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3EEA10E73B;
 Wed, 20 Apr 2022 23:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650498624; x=1682034624;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=Rqhqw1LAXWJ4fQh1Y5yzILMWP+UUd5n4s2RdnUZtbak=;
 b=ZBpIo2dEY8pk5zdEtEDEZsD9nOvSoW24FIw4IAbJmp23dFb2M7Wdx4tx
 YjJwS5XSzxLTWNR47QzJJ6pESvJIH8uMZ0z/xZsrWi714yxGeRyoCmbsW
 nkFBgLtynEVFS+15owF/3d7RiMIBBw3jD2NGS3wdmz8GW/5wuMU/1YT2r g=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 20 Apr 2022 16:50:22 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 16:50:22 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 20 Apr 2022 16:50:09 -0700
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 20 Apr 2022 16:50:08 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH v3 13/18] drm/msm/dpu: move _dpu_plane_get_qos_lut to
 dpu_hw_util file
Date: Wed, 20 Apr 2022 16:49:42 -0700
Message-ID: <1650498587-14749-14-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1650498587-14749-1-git-send-email-quic_abhinavk@quicinc.com>
References: <1650498587-14749-1-git-send-email-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: markyacoub@chromium.org, liviu.dudau@arm.com,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, laurent.pinchart@ideasonboard.com,
 dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

_dpu_plane_get_qos_lut() is not specific to just dpu_plane.
It can take any fill level and return the LUT matching it.
This can be used even for other modules like dpu_writeback.

Move _dpu_plane_get_qos_lut() to the common dpu_hw_util file
and rename it to _dpu_hw_get_qos_lut().

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |  4 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 27 +--------------------------
 3 files changed, 30 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
index aad8511..512316f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
@@ -422,3 +422,28 @@ void dpu_hw_csc_setup(struct dpu_hw_blk_reg_map *c,
 	DPU_REG_WRITE(c, csc_reg_off + 0x3c, data->csc_post_bv[1]);
 	DPU_REG_WRITE(c, csc_reg_off + 0x40, data->csc_post_bv[2]);
 }
+
+/**
+ * _dpu_hw_get_qos_lut - get LUT mapping based on fill level
+ * @tbl:		Pointer to LUT table
+ * @total_fl:		fill level
+ * Return: LUT setting corresponding to the fill level
+ */
+u64 _dpu_hw_get_qos_lut(const struct dpu_qos_lut_tbl *tbl,
+		u32 total_fl)
+{
+	int i;
+
+	if (!tbl || !tbl->nentry || !tbl->entries)
+		return 0;
+
+	for (i = 0; i < tbl->nentry; i++)
+		if (total_fl <= tbl->entries[i].fl)
+			return tbl->entries[i].lut;
+
+	/* if last fl is zero, use as default */
+	if (!tbl->entries[i-1].fl)
+		return tbl->entries[i-1].lut;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
index a200df1..e4a65eb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
@@ -9,6 +9,7 @@
 #include <linux/io.h>
 #include <linux/slab.h>
 #include "dpu_hw_mdss.h"
+#include "dpu_hw_catalog.h"
 
 #define REG_MASK(n)                     ((BIT(n)) - 1)
 
@@ -339,4 +340,7 @@ void dpu_hw_csc_setup(struct dpu_hw_blk_reg_map  *c,
 		u32 csc_reg_off,
 		const struct dpu_csc_cfg *data, bool csc10);
 
+u64 _dpu_hw_get_qos_lut(const struct dpu_qos_lut_tbl *tbl,
+		u32 total_fl);
+
 #endif /* _DPU_HW_UTIL_H */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 08b8c64..9d2f036 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -280,31 +280,6 @@ static int _dpu_plane_calc_fill_level(struct drm_plane *plane,
 }
 
 /**
- * _dpu_plane_get_qos_lut - get LUT mapping based on fill level
- * @tbl:		Pointer to LUT table
- * @total_fl:		fill level
- * Return: LUT setting corresponding to the fill level
- */
-static u64 _dpu_plane_get_qos_lut(const struct dpu_qos_lut_tbl *tbl,
-		u32 total_fl)
-{
-	int i;
-
-	if (!tbl || !tbl->nentry || !tbl->entries)
-		return 0;
-
-	for (i = 0; i < tbl->nentry; i++)
-		if (total_fl <= tbl->entries[i].fl)
-			return tbl->entries[i].lut;
-
-	/* if last fl is zero, use as default */
-	if (!tbl->entries[i-1].fl)
-		return tbl->entries[i-1].lut;
-
-	return 0;
-}
-
-/**
  * _dpu_plane_set_qos_lut - set QoS LUT of the given plane
  * @plane:		Pointer to drm plane
  * @fb:			Pointer to framebuffer associated with the given plane
@@ -333,7 +308,7 @@ static void _dpu_plane_set_qos_lut(struct drm_plane *plane,
 			lut_usage = DPU_QOS_LUT_USAGE_MACROTILE;
 	}
 
-	qos_lut = _dpu_plane_get_qos_lut(
+	qos_lut = _dpu_hw_get_qos_lut(
 			&pdpu->catalog->perf.qos_lut_tbl[lut_usage], total_fl);
 
 	trace_dpu_perf_set_qos_luts(pdpu->pipe - SSPP_VIG0,
-- 
2.7.4

