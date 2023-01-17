Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9336366E35C
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 17:21:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EED610E57D;
	Tue, 17 Jan 2023 16:21:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C41F10E194;
 Tue, 17 Jan 2023 16:21:39 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30HEkMoU031207; Tue, 17 Jan 2023 16:21:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=qcppdkim1;
 bh=CMUiND6SnIwB9sjI7rtmvilq/3s4ZbHzOgUy3H3Ysvw=;
 b=EpGbZkVM8UFskEvQtkAFp1RYc7fSmkfWGHZ4Fp4DxcTkAEh2++wPcnpL+ayBWR11o03D
 DqpmJejEIOVqsHXEiRxv8ZdkV3vwvuVzIEBHU+YHXTzgahT7w2SStmytAUD6AhrqIHBg
 Gexw1sloD7T+xFhMkD2bSsxiW8j9EZED0WRw2W7j3acnvKBAm5KNQS8lGz0WtKYyK3oK
 H479lWFEgdWM6n2Dgj74O3KFS9EWFwi0LQTZMXZEXNNYVH1+7SjKJjw7E/Ks2VlOT2Wy
 xeAH3YSAXLDjctu+/aYSnYZRHBzjBeDq08W3AQGtI5RhyTNFOmMDhhjgLaN5EuhUjWPj 5g== 
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n5r2qgta2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Jan 2023 16:21:37 +0000
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 30HGLXrR014792; 
 Tue, 17 Jan 2023 16:21:33 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 3n3nfk7sus-1;
 Tue, 17 Jan 2023 16:21:33 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30HGLXHX014786;
 Tue, 17 Jan 2023 16:21:33 GMT
Received: from kalyant-linux.qualcomm.com (kalyant-linux.qualcomm.com
 [10.204.66.210])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 30HGLXFh014783;
 Tue, 17 Jan 2023 16:21:33 +0000
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
 id B485F4B06; Tue, 17 Jan 2023 08:21:32 -0800 (PST)
From: Kalyan Thota <quic_kalyant@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH 1/3] drm/msm/disp/dpu1: allow reservation even if dspps are
 not available.
Date: Tue, 17 Jan 2023 08:21:26 -0800
Message-Id: <1673972488-30140-2-git-send-email-quic_kalyant@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1673972488-30140-1-git-send-email-quic_kalyant@quicinc.com>
References: <1673972488-30140-1-git-send-email-quic_kalyant@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 9EIWkcfpadbyPtSNePQk4K0Yh3mXvCIt
X-Proofpoint-GUID: 9EIWkcfpadbyPtSNePQk4K0Yh3mXvCIt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-17_08,2023-01-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301170131
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, robdclark@chromium.org,
 dianders@chromium.org, quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, dmitry.baryshkov@linaro.org, quic_vpolimer@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

if any topology requests for dspps and catalogue doesn't have the
allocation, avoid failing the reservation.

This can pave way to build logic allowing composer fallbacks
for all the color features that are handled in dspp.

Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 73b3442..c8899ae 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -343,7 +343,13 @@ static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
 		return true;
 
 	idx = lm_cfg->dspp - DSPP_0;
-	if (idx < 0 || idx >= ARRAY_SIZE(rm->dspp_blks)) {
+
+	if (idx < 0) {
+		DPU_DEBUG("lm doesn't have dspp, ignoring the request %d\n", lm_cfg->dspp);
+		return true;
+	}
+
+	if (idx >= ARRAY_SIZE(rm->dspp_blks)) {
 		DPU_ERROR("failed to get dspp on lm %d\n", lm_cfg->dspp);
 		return false;
 	}
-- 
2.7.4

