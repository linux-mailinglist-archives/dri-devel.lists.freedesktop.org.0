Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D629ED6CA
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 20:51:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E2C210EC08;
	Wed, 11 Dec 2024 19:51:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="N6kXBbX5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF9510E62B;
 Wed, 11 Dec 2024 19:51:03 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BBHD9Wf027271;
 Wed, 11 Dec 2024 19:50:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=MvF/3cEEO+ynWM7AIi6l4o
 oMXkmQJX7gLsYFNHiZfbo=; b=N6kXBbX59DaNQUS87RC5F0Y22/tjwfVNde0IqV
 ytj8dRK5Z6J6A4Yy8p2SdhfAK/jexHWwtpfp3QY0zOc/AaolBXt+54Z6d92N8gt0
 SN+F6j6YBwlTDwzN0tLZy5FIkeBbm0/tREn0DEu7OJVFPyHUVPfx3V1ySBJqFqOv
 4UoP9yn2HydLano1XtfAB2grocUFDze9FEXetQwp3yJ4ebAQxHF3lE63CazxtBwN
 I3LP+HcvVKaySbDZ1CpwtSHoKYsXI/Lz1R8kCwTe0QLHR8qd8xFvc0lyCISImZ7h
 +9QGzSln3BdCelid+MqWAUNcjVhSduD/+Acrq/dKtuQyjeMQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43etn8v083-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Dec 2024 19:50:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BBJow5L022678
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Dec 2024 19:50:58 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 11 Dec 2024 11:50:57 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Wed, 11 Dec 2024 11:50:26 -0800
Subject: [PATCH v2] drm/msm/dpu: check dpu_plane_atomic_print_state() for
 valid sspp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241211-check-state-before-dump-v2-1-62647a501e8c@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAAHtWWcC/4WNQQ6CMBBFr0Jm7Zi2AQVX3sOwKMNUJgYKLRAN4
 e5WLuDyveS/v0HkIBzhlm0QeJUofkhgThlQZ4cno7SJwSiTa6MqpI7phXG2M2PDzgfGdulHNFb
 pwhIXLq8grcfATt5H+VEn7iTOPnyOo1X/7P/mqlHj1VZt2dBF5aW7T4uQDHQm30O97/sXK4oUU
 cAAAAA=
X-Change-ID: 20241209-check-state-before-dump-2a015ace5f49
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Stephen
 Boyd" <swboyd@chromium.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733946657; l=2856;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=fyJgyGt1CiaeIn2+VN6b1zneVUnJ3D4ZvGoNZMQvU3k=;
 b=IoKRQXDJwrwrnUTWJPB0i6A31PvQtkMtCi8KKkky0EqvmrHTTzCrTcF2+gnjwnAWACKV6MhQo
 4cwxWyhA/b9BZ5+C5rpe3rEGydrf7kzDtCNakmgvP5C1FDKUeXB/iD4
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: chqW7dXoVeI_8K3WVzQX75NEPwAk413t
X-Proofpoint-GUID: chqW7dXoVeI_8K3WVzQX75NEPwAk413t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412110141
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

Similar to the r_pipe sspp protect, add a check to protect
the pipe state prints to avoid NULL ptr dereference for cases when
the state is dumped without a corresponding atomic_check() where the
pipe->sspp is assigned.

Fixes: 31f7148fd370 ("drm/msm/dpu: move pstate->pipe initialization to dpu_plane_atomic_check")
Reported-by: Stephen Boyd <swboyd@chromium.org>
Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/67
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
To: Rob Clark <robdclark@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sean Paul <sean@poorly.run>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: Stephen Boyd <swboyd@chromium.org>
---
Changes in v2:
- move pstate->stage out of the pipe->sspp check
- add reported-by credits for Stephen
- Link to v1: https://lore.kernel.org/r/20241209-check-state-before-dump-v1-1-7a9d8bc6048f@quicinc.com
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 3ffac24333a2a5b01135d4ece418432d4a74dc04..703e58901d53f26eba69566c2784655015c6a584 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1335,12 +1335,15 @@ static void dpu_plane_atomic_print_state(struct drm_printer *p,
 
 	drm_printf(p, "\tstage=%d\n", pstate->stage);
 
-	drm_printf(p, "\tsspp[0]=%s\n", pipe->sspp->cap->name);
-	drm_printf(p, "\tmultirect_mode[0]=%s\n", dpu_get_multirect_mode(pipe->multirect_mode));
-	drm_printf(p, "\tmultirect_index[0]=%s\n",
-		   dpu_get_multirect_index(pipe->multirect_index));
-	drm_printf(p, "\tsrc[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->src_rect));
-	drm_printf(p, "\tdst[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->dst_rect));
+	if (pipe->sspp) {
+		drm_printf(p, "\tsspp[0]=%s\n", pipe->sspp->cap->name);
+		drm_printf(p, "\tmultirect_mode[0]=%s\n",
+			   dpu_get_multirect_mode(pipe->multirect_mode));
+		drm_printf(p, "\tmultirect_index[0]=%s\n",
+			   dpu_get_multirect_index(pipe->multirect_index));
+		drm_printf(p, "\tsrc[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->src_rect));
+		drm_printf(p, "\tdst[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->dst_rect));
+	}
 
 	if (r_pipe->sspp) {
 		drm_printf(p, "\tsspp[1]=%s\n", r_pipe->sspp->cap->name);

---
base-commit: 9d6a414ad31e8eb296cd6f2c1834b2c6994960a0
change-id: 20241209-check-state-before-dump-2a015ace5f49

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>

