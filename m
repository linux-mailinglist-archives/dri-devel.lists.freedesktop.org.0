Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EED4DAA8FC1
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 11:43:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A184910E3A9;
	Mon,  5 May 2025 09:43:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="VEDrzv9S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B89E10E3C0;
 Mon,  5 May 2025 09:43:08 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5451P1R2007478;
 Mon, 5 May 2025 09:42:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=w9wc5Wg0EqJ
 6gaT+U9svwLFe1TGsiH4UbeCk8j4ooIY=; b=VEDrzv9S4TYOkNy9zOsPcsWUB5J
 e1sgGM9l8j1mk7Am1QztlOR8fCElVH/JOSRE8gfZ2wyBfx05tCL8MCgsi+KOCzip
 4ErdSJ+iPT0rolh1aWXb8HsBfwnHuUe6vHBFpm0fo+zKdClKDVaBn5+nwubGYLBw
 ryx7LvpZk/7vcYUkdrTXxfsyDhaKVG1/2qr8tX9K9JKMao9w8XCWN3CjUCe1JNR6
 X6H2oMTaiXSYr9KLPebHIdSLVhU4L0ZPEdW4mFe+qDNxdY0hR1lK5JMBGR7N3rUM
 I+ezDsp91uhTtU85uwlJRzNV8jPx6LKeo/US6WKdkeE2wfuw1OGN9Qb1EMQ==
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbh7bn6f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 May 2025 09:42:52 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5459gnI4012603; 
 Mon, 5 May 2025 09:42:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46dc7m5jtk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 May 2025 09:42:49 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5459gm2e012567;
 Mon, 5 May 2025 09:42:48 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com
 [10.213.99.91])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5459gmBh012565
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 May 2025 09:42:48 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
 id BEA21596; Mon,  5 May 2025 15:12:47 +0530 (+0530)
From: Ayushi Makhija <quic_amakhija@quicinc.com>
To: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Ayushi Makhija <quic_amakhija@quicinc.com>, robdclark@gmail.com,
 dmitry.baryshkov@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com
Subject: [PATCH v6 08/11] drm/bridge: anx7625: enable HPD interrupts
Date: Mon,  5 May 2025 15:12:42 +0530
Message-Id: <20250505094245.2660750-4-quic_amakhija@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250505094245.2660750-1-quic_amakhija@quicinc.com>
References: <20250505094245.2660750-1-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=fMY53Yae c=1 sm=1 tr=0 ts=6818881c cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=vM26emnricbxrc0035IA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: RTh_yHdwjdBBAxOQbQc9RRWP6XrTssFX
X-Proofpoint-ORIG-GUID: RTh_yHdwjdBBAxOQbQc9RRWP6XrTssFX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDA5MiBTYWx0ZWRfX2aVKgCs1P3G5
 7R11YDK5Dh6gML1g6kGpPEBznGIQ3xFP31lhHBNXtDJ/HQuSwrO61JWyiOKe77XaUI7FIT+rXug
 wmdE87w0YMyZo/wbD89HCW+rn6rA7qgpDAP/ouYUWrq5XvEYW2eyjyEJA2CyBx1CqrfbSMHpLuf
 VduztMnjbzukS77AZw9nd7Kswb1OnGUVXkwiRXBdnxbrk8eUbBSc3vDX6ABX1ProoTNKI1x4Hh4
 p8GfdZ8fMYnPNeXelCTu8ilmNgE2L749xDAqlXYoEwuewttXQ7ChR0hdb1RBFC23vGdz5Si4idI
 vY9d0inLTeZWu0MBscND1/Fn9/eKF0bnTBGKd3TagsY8DzAKmfKQdO8WxdSxtsBWZQQ1ZQYGPoi
 XqiaJWRRWwTfgdwrJUFRjU+PKkDUdig6IqcAmlSeLQUtNdi1EAuwRLBREYHUXX45RGPMlSEc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_04,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 mlxscore=0
 adultscore=0 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505050092
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

When the device enters the suspend state, it prevents
HPD interrupts from occurring. To address this, implement
.hpd_enable() and .hpd_disable() callbacks functions of
the drm_bridge.

Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 0b97b66de577..99ef3f27ae42 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -2474,6 +2474,22 @@ static const struct drm_edid *anx7625_bridge_edid_read(struct drm_bridge *bridge
 	return anx7625_edid_read(ctx);
 }
 
+static void anx7625_bridge_hpd_enable(struct drm_bridge *bridge)
+{
+	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
+	struct device *dev = ctx->dev;
+
+	pm_runtime_get_sync(dev);
+}
+
+static void anx7625_bridge_hpd_disable(struct drm_bridge *bridge)
+{
+	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
+	struct device *dev = ctx->dev;
+
+	pm_runtime_put_sync(dev);
+}
+
 static const struct drm_bridge_funcs anx7625_bridge_funcs = {
 	.attach = anx7625_bridge_attach,
 	.detach = anx7625_bridge_detach,
@@ -2487,6 +2503,8 @@ static const struct drm_bridge_funcs anx7625_bridge_funcs = {
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.detect = anx7625_bridge_detect,
 	.edid_read = anx7625_bridge_edid_read,
+	.hpd_enable = anx7625_bridge_hpd_enable,
+	.hpd_disable = anx7625_bridge_hpd_disable,
 };
 
 static int anx7625_register_i2c_dummy_clients(struct anx7625_data *ctx,
-- 
2.34.1

