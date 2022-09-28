Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E19B5ED5ED
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 09:23:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E53010E2E3;
	Wed, 28 Sep 2022 07:23:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 209CE10E2BF;
 Wed, 28 Sep 2022 07:19:28 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28S7Abku028860;
 Wed, 28 Sep 2022 07:19:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=O9hgHb8+fOlzcHV44iEHkJrs6lWrqSeu/CKj2wc7fcg=;
 b=fIOEXwLmTNI2xexclZB7uaKHV8Ipr7ACYcjL5+5aPmZiBATi9H6E48OIJ9fusFxjMAAQ
 oACv5vHv7NCwQ7WK4EbZI9JjERE5n7krTkXZSREmcYvRcliQXwVMNx8rNYmoVdzdaent
 5/LoWAL9wRIjLcYsfh9MYH4jYvZMMpnbg1pxa8+ZiwCeLArIgsdEgz+4mPyO1FlDDgUF
 F49lvpDcAdNs+EW8/Wzp2WmkY4Mp5iGmNDWh70ybrIgMJ0brurEgekAFtclesRtqhq19
 cZvk6wI8Nm0A3JU7wPOoBDLrLQ9474CxUzHaXONHlkhxLw7vxP/Tx/oC0UihK1PNpt73 2w== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jvbf0gs3v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Sep 2022 07:19:24 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28S7JNoq010629
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Sep 2022 07:19:23 GMT
Received: from hyd-lnxbld559.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Wed, 28 Sep 2022 00:19:18 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: freedreno <freedreno@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>
Subject: [PATCH 1/2] drm/msm/a6xx: Replace kcalloc() with kvzalloc()
Date: Wed, 28 Sep 2022 12:48:59 +0530
Message-ID: <20220928124830.1.I8ea24a8d586b4978823b848adde000f92f74d5c2@changeid>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 7hPNQeTt59QRMJ-ilRfg0CsJzF7oGOHo
X-Proofpoint-ORIG-GUID: 7hPNQeTt59QRMJ-ilRfg0CsJzF7oGOHo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-28_02,2022-09-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 mlxscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 clxscore=1011 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209280043
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
Cc: Jonathan Marek <jonathan@marek.ca>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>, David Airlie <airlied@linux.ie>,
 Matthias Kaehlcke <mka@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to reduce chance of allocation failure while capturing a6xx
gpu state, use kvzalloc() instead of kcalloc() in state_kcalloc().

Indirectly, this patch helps to fix leaking memory allocated for
gmu_debug object.

Fixes: b859f9b009b (drm/msm/gpu: Snapshot GMU debug buffer)
Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---

 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 55f4433..3c112a6 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -91,7 +91,7 @@ struct a6xx_state_memobj {
 static void *state_kcalloc(struct a6xx_gpu_state *a6xx_state, int nr, size_t objsize)
 {
 	struct a6xx_state_memobj *obj =
-		kzalloc((nr * objsize) + sizeof(*obj), GFP_KERNEL);
+		kvzalloc((nr * objsize) + sizeof(*obj), GFP_KERNEL);
 
 	if (!obj)
 		return NULL;
@@ -819,7 +819,7 @@ static struct msm_gpu_state_bo *a6xx_snapshot_gmu_bo(
 
 	snapshot->iova = bo->iova;
 	snapshot->size = bo->size;
-	snapshot->data = kvzalloc(snapshot->size, GFP_KERNEL);
+	snapshot->data = state_kcalloc(a6xx_state, 1, snapshot->size);
 	if (!snapshot->data)
 		return NULL;
 
@@ -1034,14 +1034,8 @@ static void a6xx_gpu_state_destroy(struct kref *kref)
 	struct a6xx_gpu_state *a6xx_state = container_of(state,
 			struct a6xx_gpu_state, base);
 
-	if (a6xx_state->gmu_log)
-		kvfree(a6xx_state->gmu_log->data);
-
-	if (a6xx_state->gmu_hfi)
-		kvfree(a6xx_state->gmu_hfi->data);
-
 	list_for_each_entry_safe(obj, tmp, &a6xx_state->objs, node)
-		kfree(obj);
+		kvfree(obj);
 
 	adreno_gpu_state_destroy(state);
 	kfree(a6xx_state);
-- 
2.7.4

