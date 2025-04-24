Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 812CDA9A215
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 08:29:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C717710E442;
	Thu, 24 Apr 2025 06:29:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="e3cCKNQ3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F1F710E442;
 Thu, 24 Apr 2025 06:29:19 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0FEm6010648;
 Thu, 24 Apr 2025 06:29:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=iFHSC3ADFpg
 QSR1BRPKVYViSqg10EkYFgqiZUGXGuu8=; b=e3cCKNQ3JxuZ9hPX6tF5kSqaJV4
 2nqVy5Spja42DGkAyYJWOSlxZT5NO0sRHC0vhOdO4L3SCTo6nZVkEW39rrcNwmAM
 UbEudzzFH8umDFws1G25KJO8xAqosMVTlL2cJtzIJNdHug8tGTd2fQti83iSmXQv
 kdNV5WDKkwoF4Sm0dcEWQwKcL1BD1wRUzD5r0I7lajrw41mtESEhTJmWaX81vFcj
 ZyXCh9z5Z8069D+qbgROzdKGNtF35zSnDh8/v5h2+l0iDFo04Zax4ZttDRkmdH1w
 yGZxeUtoAbpW+lYMaaeMY7of/lYCtOqcilGS0MCN9Ae81AaCnfkURX94sBg==
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0cg8k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Apr 2025 06:29:10 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 53O6OZq0003918; 
 Thu, 24 Apr 2025 06:29:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4644wn021j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Apr 2025 06:29:06 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 53O6OarF003972;
 Thu, 24 Apr 2025 06:24:36 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com
 [10.213.99.91])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 53O6OZlo003943
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Apr 2025 06:24:36 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
 id D05C859E; Thu, 24 Apr 2025 11:54:33 +0530 (+0530)
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
Subject: [PATCH v5 09/11] drm/bridge: anx7625: fix drm_bridge ops flags to
 support hot-plugging
Date: Thu, 24 Apr 2025 11:54:29 +0530
Message-Id: <20250424062431.2040692-10-quic_amakhija@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250424062431.2040692-1-quic_amakhija@quicinc.com>
References: <20250424062431.2040692-1-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: rqTerOt6rprXIZ-kTCerwmgAj_nBPuRX
X-Proofpoint-ORIG-GUID: rqTerOt6rprXIZ-kTCerwmgAj_nBPuRX
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=6809da36 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=IFNFO8iCMOh0I8FUMx0A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA0MCBTYWx0ZWRfX+8MyAGETbyC0
 Wf2UNkBaWzeCpZ2h2RgDhx5jRvoyraUT9XD/qD7FqozaZmom702XuFao8K5sFD6gnhIPaVleLLX
 lEgqj+ilvZ1RV8iK6ztfkolLCz+16ERSitOr+eJksPH2foXJDUHhERCBLIInxpMsSlo01hTaTCY
 rH+khpsPccOWmMUxZf6+4sqaMEhtMEYHYwR9zUowNd6L0gM2o4Zb5WcaEOvM5BhvZdaU5gbQxNm
 np3d6au/8Orhr/ZaK3mMdF3bv2QxSrDnwi2VXUlaMDjS9YhXUDYquYEFrtxQ8KZruugATF+j3Db
 rTU3NoGizn0D08eknfGTod8AkKArpg/sXal37i/+oj2oFbtxoR+eAuGeWAG5aqyG5zboDK1ajNz
 MDB5VRW3VDmH6EL/7CIvsslYhqCJYVr59g99MtKe+ucDGf84I762eMyO79iY99ae60Fc2TKt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_02,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240040
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

The anx7625_link_bridge() checks if a device is not a panel
bridge and add DRM_BRIDGE_OP_HPD and DRM_BRIDGE_OP_DETECT
flags to the drm_bridge->ops. However, on port 1 of the anx7625
bridge, any device added is always treated as a panel bridge,
preventing connector_detect() from being called. To resolve
this, instead of just checking if it is a panel bridge, verify
the type of device based on aux whether it is a DisplayPort or
eDP panel. If the device is not of the eDP type, add
DRM_BRIDGE_OP_HPD and DRM_BRIDGE_OP_DETECT flags to the to
the drm_bridge->ops.

Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 99ef3f27ae42..a32ebe1fa0cd 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -2608,9 +2608,8 @@ static int anx7625_link_bridge(struct drm_dp_aux *aux)
 	platform->bridge.of_node = dev->of_node;
 	if (!anx7625_of_panel_on_aux_bus(dev))
 		platform->bridge.ops |= DRM_BRIDGE_OP_EDID;
-	if (!platform->pdata.panel_bridge)
-		platform->bridge.ops |= DRM_BRIDGE_OP_HPD |
-					DRM_BRIDGE_OP_DETECT;
+	if (!platform->pdata.panel_bridge || !anx7625_of_panel_on_aux_bus(dev))
+		platform->bridge.ops |= DRM_BRIDGE_OP_HPD | DRM_BRIDGE_OP_DETECT;
 	platform->bridge.type = platform->pdata.panel_bridge ?
 				    DRM_MODE_CONNECTOR_eDP :
 				    DRM_MODE_CONNECTOR_DisplayPort;
-- 
2.34.1

