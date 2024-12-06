Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E299E65A3
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 05:33:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42B0910F006;
	Fri,  6 Dec 2024 04:33:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="eNBhurQk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B247E10E5F1;
 Fri,  6 Dec 2024 04:33:05 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HaKGW017356;
 Fri, 6 Dec 2024 04:32:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 swh/EPUOAzqpq3vVXKtELq1S070YQvbkbrh/sG+ry0Q=; b=eNBhurQk5AWUeniQ
 P768woWQNna/3digFWhy750aLKfvLoRJ2/MFEgTBXxaXYAjQRBzNsXnVcW1iExZv
 3wZEMlXyeWMUt0ro4WJ39A/h6LM6aCp8Cvc/DNQ17/TdCcxwYbVVco0DA5/SLHHm
 o7RdCcUPjNtEBB1zQ4TyKxuptVIk41O7OUNjXIvdfUSuICwPcP6GxIgVLuLz2tQw
 sDWeEwN8BImXbq7r1quv/93s2sKU3tfCz5rdg0yvKFWt53/ZkyMk7pPWvTenA4sN
 fjj+ozgDWQ+gW3ov6oUiE99TWHlpS0ry4mGavSRYAmdeVmjyEmxXJsC52au4leYF
 1jAiBg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bbnj2a31-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Dec 2024 04:32:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B64WXKB006058
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 6 Dec 2024 04:32:33 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Dec 2024 20:32:32 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 5 Dec 2024 20:31:47 -0800
Subject: [PATCH 16/45] drm/msm/dp: add support for programming p1 register
 block
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241205-dp_mst-v1-16-f8618d42a99a@quicinc.com>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
In-Reply-To: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, "Chandan
 Uddaraju" <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
CC: Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>,
 Tanmay Shah <tanmay@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733459543; l=2665;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=/2tvVLp5w4nRG4kg9Rujf5Yl55lR5+VFQW8i4loeBK4=;
 b=8Vu/KGNsJJtGOKz41yr3a333BfA/0GCiOzuO5RCOgW4SNkG+rmDj5IJgp8Cs6uuQsRfj3zout
 Wbb8zd7myuVDhqKZIyrTBM+JtsPdjai5RG4SYR83DLgRw5rE7zfC5un
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 7Dzsnc8cCvABcg9_Rs7tfRDislNwUvio
X-Proofpoint-ORIG-GUID: 7Dzsnc8cCvABcg9_Rs7tfRDislNwUvio
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 mlxscore=0 phishscore=0 impostorscore=0
 malwarescore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412060029
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

p1 register block is needed for the second mst stream.
Add support in the catalog to be able to program this block.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index b4c8856fb25d01dd1b30c5ec33ce821aafa9551d..ee7f2d0b23aa034428a01ef2c9752f51013c5e01 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -73,6 +73,7 @@ struct dss_io_data {
 	struct dss_io_region aux;
 	struct dss_io_region link;
 	struct dss_io_region p0;
+	struct dss_io_region p1;
 };
 
 struct msm_dp_catalog_private {
@@ -93,6 +94,8 @@ void msm_dp_catalog_snapshot(struct msm_dp_catalog *msm_dp_catalog, struct msm_d
 	msm_disp_snapshot_add_block(disp_state, dss->aux.len, dss->aux.base, "dp_aux");
 	msm_disp_snapshot_add_block(disp_state, dss->link.len, dss->link.base, "dp_link");
 	msm_disp_snapshot_add_block(disp_state, dss->p0.len, dss->p0.base, "dp_p0");
+
+	msm_disp_snapshot_add_block(disp_state, dss->p1.len, dss->p0.base, "dp_p1");
 }
 
 static inline u32 msm_dp_read_aux(struct msm_dp_catalog_private *catalog, u32 offset)
@@ -145,6 +148,26 @@ static inline u32 msm_dp_read_p0(struct msm_dp_catalog_private *catalog,
 	return readl_relaxed(catalog->io.p0.base + offset);
 }
 
+static inline void msm_dp_write_p1(struct msm_dp_catalog_private *catalog,
+				   u32 offset, u32 data)
+{
+	/*
+	 * To make sure interface reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	writel(data, catalog->io.p1.base + offset);
+}
+
+static inline u32 msm_dp_read_p1(struct msm_dp_catalog_private *catalog,
+				 u32 offset)
+{
+	/*
+	 * To make sure interface reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	return readl_relaxed(catalog->io.p1.base + offset);
+}
+
 static inline u32 msm_dp_read_link(struct msm_dp_catalog_private *catalog, u32 offset)
 {
 	return readl_relaxed(catalog->io.link.base + offset);
@@ -1137,6 +1160,12 @@ static int msm_dp_catalog_get_io(struct msm_dp_catalog_private *catalog)
 			DRM_ERROR("unable to remap p0 region: %pe\n", dss->p0.base);
 			return PTR_ERR(dss->p0.base);
 		}
+
+		dss->p1.base = msm_dp_ioremap(pdev, 4, &dss->p1.len);
+		if (IS_ERR(dss->p1.base)) {
+			DRM_ERROR("unable to remap p1 region: %pe\n", dss->p1.base);
+			return PTR_ERR(dss->p1.base);
+		}
 	}
 
 	return 0;

-- 
2.34.1

