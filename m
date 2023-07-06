Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B30274A4E5
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 22:28:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 239A010E4AD;
	Thu,  6 Jul 2023 20:27:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83FFF10E4AC;
 Thu,  6 Jul 2023 20:27:54 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 366JklQA031714; Thu, 6 Jul 2023 20:27:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=p15hj/n9Ks0fLsFKrqRNyan4d2irE1I2jec0Kpnoc1A=;
 b=bqvJoFpW71nCQ6u/Jktp5vq9D/iQ7xBGTmnyLwTUD8QN3jcqmpltPJou7sH0XoAv7ufX
 x+Wnob4M0/2FdGOq/10lrwMzN5rK+focHKlAT56W8LnxHnFxkQzY9UJ3VV2le1quidhC
 BBAtkUQu/k8I6W3XM+IR9ICH4Fe8aZjRYcKgxy0Y9N0Lc8ooYHY0yxvzGTRjqUKYW2xb
 y2O9mmiJvv0N1RLprNGBETN2I50bTWO8M5gc2RuEjyl6QhXHOCudsiek/1A0BD1pu/l4
 IAuR3hn3gEabvW7DoV8NdYItjvLw3nAgX5ot3OnXhgm2KudR2acOaDffbhLEVW1wGUw8 0w== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rn2cpcc6k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jul 2023 20:27:47 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 366KRkFr012357
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 6 Jul 2023 20:27:46 GMT
Received: from hu-rmccann-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 6 Jul 2023 13:27:45 -0700
From: Ryan McCann <quic_rmccann@quicinc.com>
Date: Thu, 6 Jul 2023 13:26:47 -0700
Subject: [PATCH v3 1/6] drm/msm: Update dev core dump to not print
 backwards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230622-devcoredump_patch-v3-1-83601b72eb67@quicinc.com>
References: <20230622-devcoredump_patch-v3-0-83601b72eb67@quicinc.com>
In-Reply-To: <20230622-devcoredump_patch-v3-0-83601b72eb67@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.13-dev-8a804
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688675265; l=1175;
 i=quic_rmccann@quicinc.com; s=20230622; h=from:subject:message-id;
 bh=spf8P6JJVhZzx19aCNUdDvZTBd91BGOkV8kKkMp6IzA=;
 b=zX3H4Drt6HFFhSWpBsXufxPO6LYm5cHcxBzKq5VnKK7k59pHkJR+e2Fpz6+eQrT7kY6EM6/iM
 Z6Y+EFZkmHbAO5eAURa2Q25QIwsO/L5r35urXxawJSRHA/aAhVXWkPF
X-Developer-Key: i=quic_rmccann@quicinc.com; a=ed25519;
 pk=d/uP3OwPGpj/bTtiHvV1RBZ2S6q4AL6j1+A5y+dmbTI=
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: -yoH6IdhF_0_5CAOtroltiWy_xRGTT3I
X-Proofpoint-ORIG-GUID: -yoH6IdhF_0_5CAOtroltiWy_xRGTT3I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-06_15,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0 mlxlogscore=862
 lowpriorityscore=0 suspectscore=0 impostorscore=0 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307060179
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

