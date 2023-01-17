Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C1366E361
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 17:22:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F17F10E581;
	Tue, 17 Jan 2023 16:21:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0185010E581;
 Tue, 17 Jan 2023 16:21:43 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30HFT4Q7023393; Tue, 17 Jan 2023 16:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=qcppdkim1;
 bh=VXFhZxrEOL9xAPAjX8pMsolOSKUDsJIMLskwVzWhLKk=;
 b=htZkIFWnPQqhiZ1vESd8mlwMdNlovXZKv78Jzpck+QS88+zBYtEJlqAPML7SnFS1BdgE
 FGGkxdyJHT8GXkSd0urAz/n8Jy+5ylA50WotQp9Ep/5c6/pRNnEnij53ZKqWs8kMmoIK
 OAZPrkKaHTo30Qb6/op93s/Dbaj2OH2IDnLUoQWtxnMhR2xnzTT2G26ExfPlhrh0kDHu
 xB1m0PVcIedDV95HUbzv7XxsvtSyPGoaJW285zv/r+rVu96o+Q6SZHlLr29aIOU+g0xB
 CdDTplIIUDXEHxSWuDiBS7pFKTEaIfMuW/xeJDwkrIGnnQ29yMqQNbh385m04P+r/K8b Ug== 
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n5b189vyr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Jan 2023 16:21:41 +0000
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 30HGK75h013659; 
 Tue, 17 Jan 2023 16:21:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 3n3nfk7sv4-1;
 Tue, 17 Jan 2023 16:21:38 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30HGLcp8014814;
 Tue, 17 Jan 2023 16:21:38 GMT
Received: from kalyant-linux.qualcomm.com (kalyant-linux.qualcomm.com
 [10.204.66.210])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 30HGLbwV014813;
 Tue, 17 Jan 2023 16:21:38 +0000
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
 id 3FC1B14F6; Tue, 17 Jan 2023 08:21:37 -0800 (PST)
From: Kalyan Thota <quic_kalyant@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH 3/3] drm/msm/disp/dpu1: fail atomic check if color feature is
 requested with no dspp
Date: Tue, 17 Jan 2023 08:21:28 -0800
Message-Id: <1673972488-30140-4-git-send-email-quic_kalyant@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1673972488-30140-1-git-send-email-quic_kalyant@quicinc.com>
References: <1673972488-30140-1-git-send-email-quic_kalyant@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: YsNLSAxH5T10RV4d8vIaIGkWrjUz8vqG
X-Proofpoint-ORIG-GUID: YsNLSAxH5T10RV4d8vIaIGkWrjUz8vqG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-17_08,2023-01-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 phishscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0
 mlxlogscore=864 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301170131
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

Fail atomic check if any color feature is requested with no
dspps allocated in the datapath so that composer can offload those
features.

Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 4170fbe..de8d799 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1147,6 +1147,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	int left_zpos_cnt = 0, right_zpos_cnt = 0;
 	struct drm_rect crtc_rect = { 0 };
 	bool needs_dirtyfb = dpu_crtc_needs_dirtyfb(crtc_state);
+	struct dpu_crtc_mixer *mixer = cstate->mixers;
 
 	pstates = kzalloc(sizeof(*pstates) * DPU_STAGE_MAX * 4, GFP_KERNEL);
 
@@ -1173,6 +1174,16 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 		_dpu_crtc_setup_lm_bounds(crtc, crtc_state);
 	}
 
+	if (crtc_state->color_mgmt_changed) {
+		for (i = 0; i < cstate->num_mixers; i++) {
+			if (!mixer[i].hw_dspp) {
+				DPU_DEBUG("%s: failed to get dspp for crtc%d state\n",
+						dpu_crtc->name, crtc->base.id);
+				return -EINVAL;
+			}
+		}
+	}
+
 	crtc_rect.x2 = mode->hdisplay;
 	crtc_rect.y2 = mode->vdisplay;
 
-- 
2.7.4

