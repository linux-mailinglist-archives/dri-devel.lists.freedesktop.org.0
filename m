Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2D7703FA7
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 23:26:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E59F310E28B;
	Mon, 15 May 2023 21:25:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59E4110E289;
 Mon, 15 May 2023 21:25:55 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34FIk1QL019625; Mon, 15 May 2023 21:25:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=GKwOpKyWVG/xkHNc8HBR8YglbUSi7PdRQRZW98ECMdg=;
 b=RRCyo+es0OCd06Uf+d6eFtKvtna4Y2oylzasR8axZqpNCISX5yHe4NXGNhasvcZXWEA6
 PqfzVhJUL4FkCj0dwHxwfC5HWWyppB8bJY8fTTah24orJJDDKyNCQYphat8kBM4gEeQX
 y+s8q4l+r0igBWDmHWY31oWCwDexZidmk4SuAl59+8JCv79gT1uLOGSC/rQ28OuQCCKr
 Vw3FxY8bT7iAQ+ESdHkB4Jed9UrGbAvCLXhbdEJXGLhmBtHXnoOMnzEdVF9oTKTN9T9h
 TM99G7KC4BrKpTYTbV8O/ZetryKc7uSuMEFtg7JbgoZ011DPdYJSlhGp/5DRZN6nnbG5 fw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qkt9w07mq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 May 2023 21:25:49 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34FLPmcx009949
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 May 2023 21:25:48 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Mon, 15 May 2023 14:25:47 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v9 2/8] drm/msm/dpu: add DPU_PINGPONG_DSC feature bit for DPU
 < 7.0.0
Date: Mon, 15 May 2023 14:25:22 -0700
Message-ID: <1684185928-24195-3-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1684185928-24195-1-git-send-email-quic_khsieh@quicinc.com>
References: <1684185928-24195-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: R_X1DvSa1qynLpkiLt8hk4AU7Pb2qmJc
X-Proofpoint-ORIG-GUID: R_X1DvSa1qynLpkiLt8hk4AU7Pb2qmJc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-15_19,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 mlxlogscore=949 suspectscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305150176
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DPU < 7.0.0 requires the PINGPONG block to be involved during
DSC setting up. Since DPU >= 7.0.0, enabling and starting the DSC
encoder engine was moved to INTF with the help of the flush mechanism.
Add a DPU_PINGPONG_DSC feature bit to restrict the availability of
dpu_hw_pp_setup_dsc() and dpu_hw_pp_dsc_{enable,disable}() on the
PINGPONG block to DPU < 7.0.0 hardware, as the registers are not
available on DPU 7.0.0 and higher anymore.
Add DPU_PINGPONG_DSC to PINGPONG_SDM845_MASK, PINGPONG_SDM845_TE2_MASK
and PINGPONG_SM8150_MASK which is used for all DPU < 7.0 chipsets.

changes in v6:
-- split patches and rearrange to keep catalog related files at this patch

changes in v9:
-- delete add BIT(DPU_PINGPONG_DSC)  to PINGPONG_SDM845_TE2_MASK

changes in v7:
-- rewording commit text as suggested at review comments

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 4 +++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 82b58c6..f2a1535 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -76,13 +76,13 @@
 	(BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
 
 #define PINGPONG_SDM845_MASK \
-	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_TE))
+	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_TE) | BIT(DPU_PINGPONG_DSC))
 
 #define PINGPONG_SDM845_TE2_MASK \
 	(PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE2))
 
 #define PINGPONG_SM8150_MASK \
-	(BIT(DPU_PINGPONG_DITHER))
+	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
 #define CTL_SC7280_MASK \
 	(BIT(DPU_CTL_ACTIVE_CFG) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 6ee48f0..83854e8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -144,7 +144,8 @@ enum {
  * @DPU_PINGPONG_TE2        Additional tear check block for split pipes
  * @DPU_PINGPONG_SPLIT      PP block supports split fifo
  * @DPU_PINGPONG_SLAVE      PP block is a suitable slave for split fifo
- * @DPU_PINGPONG_DITHER,    Dither blocks
+ * @DPU_PINGPONG_DITHER     Dither blocks
+ * @DPU_PINGPONG_DSC        PP block supports DSC
  * @DPU_PINGPONG_MAX
  */
 enum {
@@ -153,6 +154,7 @@ enum {
 	DPU_PINGPONG_SPLIT,
 	DPU_PINGPONG_SLAVE,
 	DPU_PINGPONG_DITHER,
+	DPU_PINGPONG_DSC,
 	DPU_PINGPONG_MAX
 };
 
-- 
2.7.4

