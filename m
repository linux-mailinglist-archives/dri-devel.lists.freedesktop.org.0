Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B9874FCA3
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 03:20:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8531F10E47A;
	Wed, 12 Jul 2023 01:20:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B73110E47A;
 Wed, 12 Jul 2023 01:20:30 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36C1FnDV007365; Wed, 12 Jul 2023 01:20:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=G0/sniQ3HnbGKhMLwwvXLmSCxyPmvLJZM3Ms2qmw1D8=;
 b=CCb0JopnoV0jw6YHiiPJR6WvW9d7yCa7HlfRQyuz4K3Rc60whbzsLcxkIl9SJdX17yCd
 te8Ty+IN39a2lfMVxjNpM1PkHruD4ND3cE4c7vf7P6Ky+OGpHFaa3CfAxCNEEp6Q69ja
 JiG23bWF6EfSSpdeFjvnjp88dfDCJjF3bZ/BztM+EvCFtUvJhPVjvojhaed4u9jdCxMN
 Lg9MGXlnDbNewDLNgMWWtMMNkX7qmvFLbMbdjqAGLDrRskkzJGxgHgERXgEU3EXsLEV5
 c270B+fEEuzbC5pIVp7eOF0niPSh70k9drlOhjlIk8GNfw/yavytr8OrlcYNkvlubLFv KA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rse45gdhk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jul 2023 01:20:24 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36C1KNXv003514
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jul 2023 01:20:23 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Tue, 11 Jul 2023 18:20:23 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>
Subject: [PATCH v5 4/5] drm/msm/dpu: rename enable_compression() to
 program_intf_cmd_cfg()
Date: Tue, 11 Jul 2023 18:20:02 -0700
Message-ID: <20230712012003.2212-5-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230712012003.2212-1-quic_abhinavk@quicinc.com>
References: <20230712012003.2212-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: NZzqBNcL_xKjAYJuC7sXP2UFigkVassk
X-Proofpoint-ORIG-GUID: NZzqBNcL_xKjAYJuC7sXP2UFigkVassk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-11_14,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 suspectscore=0 mlxscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307120008
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
Cc: quic_jesszhan@quicinc.com, andersson@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rename the intf's enable_compression() op to program_intf_cmd_cfg()
and allow it to accept a struct intf_cmd_mode_cfg to program
all the bits at once. This can be re-used by widebus later on as
well as it touches the same register.

changes in v5:
	- rename struct intf_cmd_mode_cfg to dpu_hw_intf_cmd_mode_cfg
	- remove couple of comments

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 8 ++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 8 +++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h          | 9 +++++++--
 3 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index b856c6286c85..df88358e7037 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -50,6 +50,7 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
 			to_dpu_encoder_phys_cmd(phys_enc);
 	struct dpu_hw_ctl *ctl;
 	struct dpu_hw_intf_cfg intf_cfg = { 0 };
+	struct dpu_hw_intf_cmd_mode_cfg cmd_mode_cfg = {};
 
 	ctl = phys_enc->hw_ctl;
 	if (!ctl->ops.setup_intf_cfg)
@@ -68,8 +69,11 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
 				phys_enc->hw_intf,
 				phys_enc->hw_pp->idx);
 
-	if (intf_cfg.dsc != 0 && phys_enc->hw_intf->ops.enable_compression)
-		phys_enc->hw_intf->ops.enable_compression(phys_enc->hw_intf);
+	if (intf_cfg.dsc != 0)
+		cmd_mode_cfg.data_compress = true;
+
+	if (phys_enc->hw_intf->ops.program_intf_cmd_cfg)
+		phys_enc->hw_intf->ops.program_intf_cmd_cfg(phys_enc->hw_intf, &cmd_mode_cfg);
 }
 
 static void dpu_encoder_phys_cmd_pp_tx_done_irq(void *arg, int irq_idx)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 7392880d736c..8ec6505d9e78 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -513,11 +513,13 @@ static void dpu_hw_intf_disable_autorefresh(struct dpu_hw_intf *intf,
 
 }
 
-static void dpu_hw_intf_enable_compression(struct dpu_hw_intf *ctx)
+static void dpu_hw_intf_program_intf_cmd_cfg(struct dpu_hw_intf *ctx,
+					     struct dpu_hw_intf_cmd_mode_cfg *cmd_mode_cfg)
 {
 	u32 intf_cfg2 = DPU_REG_READ(&ctx->hw, INTF_CONFIG2);
 
-	intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
+	if (cmd_mode_cfg->data_compress)
+		intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
 
 	DPU_REG_WRITE(&ctx->hw, INTF_CONFIG2, intf_cfg2);
 }
@@ -544,7 +546,7 @@ static void _setup_intf_ops(struct dpu_hw_intf_ops *ops,
 	}
 
 	if (mdss_rev->core_major_ver >= 7)
-		ops->enable_compression = dpu_hw_intf_enable_compression;
+		ops->program_intf_cmd_cfg = dpu_hw_intf_program_intf_cmd_cfg;
 }
 
 struct dpu_hw_intf *dpu_hw_intf_init(const struct dpu_intf_cfg *cfg,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
index bd6f54208d44..77f80531782b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
@@ -48,6 +48,10 @@ struct dpu_hw_intf_status {
 	u32 line_count;		/* current line count including blanking */
 };
 
+struct dpu_hw_intf_cmd_mode_cfg {
+	u8 data_compress;	/* enable data compress between dpu and dsi */
+};
+
 /**
  * struct dpu_hw_intf_ops : Interface to the interface Hw driver functions
  *  Assumption is these functions will be called after clocks are enabled
@@ -70,7 +74,7 @@ struct dpu_hw_intf_status {
  * @get_autorefresh:            Retrieve autorefresh config from hardware
  *                              Return: 0 on success, -ETIMEDOUT on timeout
  * @vsync_sel:                  Select vsync signal for tear-effect configuration
- * @enable_compression:         Enable data compression
+ * @program_intf_cmd_cfg:       Program the DPU to interface datapath for command mode
  */
 struct dpu_hw_intf_ops {
 	void (*setup_timing_gen)(struct dpu_hw_intf *intf,
@@ -108,7 +112,8 @@ struct dpu_hw_intf_ops {
 	 */
 	void (*disable_autorefresh)(struct dpu_hw_intf *intf, uint32_t encoder_id, u16 vdisplay);
 
-	void (*enable_compression)(struct dpu_hw_intf *intf);
+	void (*program_intf_cmd_cfg)(struct dpu_hw_intf *intf,
+				     struct dpu_hw_intf_cmd_mode_cfg *cmd_mode_cfg);
 };
 
 struct dpu_hw_intf {
-- 
2.40.1

