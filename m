Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF6A82B3BA
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 18:14:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E8DF10E91F;
	Thu, 11 Jan 2024 17:14:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2144C10E91F;
 Thu, 11 Jan 2024 17:14:31 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40BExWNr013063; Thu, 11 Jan 2024 17:14:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:mime-version:content-type; s=
 qcppdkim1; bh=6bMyPUPE14ZybsNMO3LzBjdI9wYqf9xHh7+eqo87zh4=; b=Qy
 hCROXAiOmFs9zDawFuEWnagFrvfRbOlWk5La93QCW2tuiLNwx32vTXkbvjdhg1RZ
 xciEFpbtZY6bdhXNfXcLnPxdOQr/mggpn4Gg+D3hhA6V6F2pJGhoO0fwmnPYoFaQ
 HzOkTkFhHFvlKbyshi9j8NdGY1BzQTqbs+xRg3CQMMStHFSFjm65rc11g9BTbxvF
 ZRWf/EqIKMIqZBArN+DHcLXbgntrBxM6OV8WIDsm2bO1kWTkuvYOk4KnlIWgIB9T
 711eIrwHHbxmYItTuuIrP148S7sRp2VeLO/XVWqd2gtOy24kLF9MywKfB6V1P2Iv
 Fbe0X4v6aLxHI01nwWLA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vjjjj0b90-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Jan 2024 17:14:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40BHEOIw012875
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Jan 2024 17:14:24 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 11 Jan 2024 09:14:23 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v1] drm/msm/dp: remove mdss_dp_test_bit_depth_to_bpc()
Date: Thu, 11 Jan 2024 09:14:15 -0800
Message-ID: <1704993255-12753-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: ZpaN76iMHrE9ikFhkyKykw1A9ybkz516
X-Proofpoint-GUID: ZpaN76iMHrE9ikFhkyKykw1A9ybkz516
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 phishscore=0 mlxscore=0 spamscore=0 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401110135
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

mdss_dp_test_bit_depth_to_bpc() can be replace by
mdss_dp_test_bit_depth_to_bpp() / 3. Hence remove it.

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_debug.c |  2 +-
 drivers/gpu/drm/msm/dp/dp_link.h  | 23 -----------------------
 2 files changed, 1 insertion(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
index 3bba901..534079e 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.c
+++ b/drivers/gpu/drm/msm/dp/dp_debug.c
@@ -105,7 +105,7 @@ static int dp_test_data_show(struct seq_file *m, void *data)
 		seq_printf(m, "vdisplay: %d\n",
 				debug->link->test_video.test_v_height);
 		seq_printf(m, "bpc: %u\n",
-				dp_link_bit_depth_to_bpc(bpc));
+				dp_link_bit_depth_to_bpp(bpc) / 3);
 	} else {
 		seq_puts(m, "0");
 	}
diff --git a/drivers/gpu/drm/msm/dp/dp_link.h b/drivers/gpu/drm/msm/dp/dp_link.h
index 9dd4dd9..83da170 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.h
+++ b/drivers/gpu/drm/msm/dp/dp_link.h
@@ -112,29 +112,6 @@ static inline u32 dp_link_bit_depth_to_bpp(u32 tbd)
 	}
 }
 
-/**
- * dp_test_bit_depth_to_bpc() - convert test bit depth to bpc
- * @tbd: test bit depth
- *
- * Returns the bits per comp (bpc) to be used corresponding to the
- * bit depth value. This function assumes that bit depth has
- * already been validated.
- */
-static inline u32 dp_link_bit_depth_to_bpc(u32 tbd)
-{
-	switch (tbd) {
-	case DP_TEST_BIT_DEPTH_6:
-		return 6;
-	case DP_TEST_BIT_DEPTH_8:
-		return 8;
-	case DP_TEST_BIT_DEPTH_10:
-		return 10;
-	case DP_TEST_BIT_DEPTH_UNKNOWN:
-	default:
-		return 0;
-	}
-}
-
 void dp_link_reset_phy_params_vx_px(struct dp_link *dp_link);
 u32 dp_link_get_test_bits_depth(struct dp_link *dp_link, u32 bpp);
 int dp_link_process_request(struct dp_link *dp_link);
-- 
2.7.4

