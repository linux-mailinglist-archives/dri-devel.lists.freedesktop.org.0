Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EA174BB18
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 03:25:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 842D610E171;
	Sat,  8 Jul 2023 01:25:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6376410E062;
 Sat,  8 Jul 2023 01:25:05 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3681OwqJ006456; Sat, 8 Jul 2023 01:24:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=r2Tj6BcfUU9gAxO+emjkYoS6dJrkoyX76TkLgIDwaWE=;
 b=kFbC9XWK5aXiJtlt8lepcqoDWMi/4AQWXNFdxC4CCyZ16cqDLBsPX+CWBD9HnXmsxsIY
 TBHzkH87ngEmBgwokRgtTXt9+fROKyF7PruS6fDbmuJ/FsVs5OD7ktgPVubk3U3WCCL5
 rWutdX3DNiFbeg7FrACDRGRcnTIwQD9L6GZUtwoF20dwan551Nf4RM06ickREh9oyfue
 YPnFh70U9rbKi5JVJe2JJqcq97Yhusz9DndoeZPWahlce8SVse/O0IkIL16E4L3VLY3T
 6ErM+R2mZfXmg0w6/Hs7TjhNQppXzYVYX1sxX17+4qFl8jsZBBUnhlbFGU8watRQDU8S xg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rpwgm018t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 08 Jul 2023 01:24:57 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3681OvsX031912
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 8 Jul 2023 01:24:57 GMT
Received: from hu-rmccann-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Fri, 7 Jul 2023 18:24:56 -0700
From: Ryan McCann <quic_rmccann@quicinc.com>
Date: Fri, 7 Jul 2023 18:24:40 -0700
Subject: [PATCH v5 1/6] drm/msm: Update dev core dump to not print
 backwards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230622-devcoredump_patch-v5-1-67e8b66c4723@quicinc.com>
References: <20230622-devcoredump_patch-v5-0-67e8b66c4723@quicinc.com>
In-Reply-To: <20230622-devcoredump_patch-v5-0-67e8b66c4723@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.13-dev-8a804
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688779496; l=1231;
 i=quic_rmccann@quicinc.com; s=20230622; h=from:subject:message-id;
 bh=9ZCH0KRgL2wUCDIMEq2mQZvZe83s5dNQp/i82vPu2/g=;
 b=xKCoH+46RlsuvDv5H0LJJiJK7CIh/mMSfZGUokwaE1FTtN08mD+z0qazYMChwI5Vh0OiiJYRc
 bN2IN5+FtRQAbI87inm61CY5cqTCl4YAMAeU1YZSbm2PZwYl7soZ1W5
X-Developer-Key: i=quic_rmccann@quicinc.com; a=ed25519;
 pk=d/uP3OwPGpj/bTtiHvV1RBZ2S6q4AL6j1+A5y+dmbTI=
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: henU8d0v1dduPlDRRC-G8kLuVK1txtkF
X-Proofpoint-ORIG-GUID: henU8d0v1dduPlDRRC-G8kLuVK1txtkF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-07_16,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=862 mlxscore=0
 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307080011
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
Cc: Rob Clark <robdclark@chromium.org>, Ryan McCann <quic_rmccann@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Device core dump add block method adds hardware blocks to dumping queue
with stack behavior which causes the hardware blocks to be printed in
reverse order. Change the addition to dumping queue data structure
from "list_add" to "list_add_tail" for FIFO queue behavior.

Fixes: 98659487b845 ("drm/msm: add support to take dpu snapshot")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Ryan McCann <quic_rmccann@quicinc.com>
---
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
index acfe1b31e079..add72bbc28b1 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
@@ -192,5 +192,5 @@ void msm_disp_snapshot_add_block(struct msm_disp_state *disp_state, u32 len,
 	new_blk->base_addr = base_addr;
 
 	msm_disp_state_dump_regs(&new_blk->state, new_blk->size, base_addr);
-	list_add(&new_blk->node, &disp_state->blocks);
+	list_add_tail(&new_blk->node, &disp_state->blocks);
 }

-- 
2.25.1

