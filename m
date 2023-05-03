Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 630316F4E7A
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 03:19:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 384C810E17A;
	Wed,  3 May 2023 01:19:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 850A810E17A;
 Wed,  3 May 2023 01:19:40 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3430bCdE010835; Wed, 3 May 2023 01:19:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=OF2VnFdhujCmFeGKI2HLEe3SKiyrivuVS+bVyj+o/To=;
 b=RPFcXOKoPD7c3+aqIQeh+XFFMey51GxhWzyi0n/T08wSR/3AHIEdT1HeWetGLrwiFdM4
 43yU2huxdz3MSrK9suOgNW2hE0b94lStRLz/cy6XOsGkaEZAXAJO9sjO1+chzAkmq0em
 NwE0ShVYGrQi+3bIyj0C2tCJLJz0j0wQgIgvpwkcyVBJgxmhWY5+fNgwJCU0rjdaRnKU
 Ka5ANiW5jx/hNPTVZC3CoZzosycCFxPJRBp8PRo3eGopKqSDBuQ8OSeZfDrqFx8FKUnb
 hYHo5ZnqK09A9EH6js5hF+3wod7ey5k9PNkJNbh4q4pB61R3ycGEO/3c53SUv8TETTcY vg== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qawcta91u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 May 2023 01:19:37 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3431JbAt030947
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 3 May 2023 01:19:37 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Tue, 2 May 2023 18:19:36 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Tue, 2 May 2023 18:19:14 -0700
Subject: [PATCH 3/4] drm/msm/dpu: Add has_data_compress to dpu_caps
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230405-add-dsc-support-v1-3-6bc6f03ae735@quicinc.com>
References: <20230405-add-dsc-support-v1-0-6bc6f03ae735@quicinc.com>
In-Reply-To: <20230405-add-dsc-support-v1-0-6bc6f03ae735@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1683076776; l=4545;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=EyX2HzVpF+s4qNGJ4/Ak1aWEbr+vHD9TC8TKXecgFpk=;
 b=oku0BFAA/Zgs0lcXAVjTY8m6C9g+nzbJHSmVdF9irFDROflHUBieYaoJhMvtlqjZE1xQ7tofZ
 gZ8kgPYJ5B7ADn4XEgZELEBWanTF+0n69oG+dt2hAzX2Z5cW37Tsx5k
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: DemErI50akr63HF1reAwx-2cIhLVzVyt
X-Proofpoint-GUID: DemErI50akr63HF1reAwx-2cIhLVzVyt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-02_14,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 adultscore=0 mlxlogscore=764 impostorscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305030009
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add data_compress feature to DPU HW catalog.

In DPU 7.x and later, there is a DATA_COMPRESS register that must be set
within the DPU INTF block for DSC to work.

As core_rev (and related macros) was removed from the dpu_kms struct, the
most straightforward way to indicate the presence of this register would be
to have a flag in dpu_caps.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 2 ++
 6 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index f98c2a5b0e87..4160a35ff20f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -15,6 +15,7 @@ static const struct dpu_caps sm8350_dpu_caps = {
 	.has_dim_layer = true,
 	.has_idle_pc = true,
 	.has_3d_merge = true,
+	.has_data_compress = true,
 	.max_linewidth = 4096,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 3fd0498ab420..23230841a0d1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -13,6 +13,7 @@ static const struct dpu_caps sc7280_dpu_caps = {
 	.qseed_type = DPU_SSPP_SCALER_QSEED4,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
+	.has_data_compress = true,
 	.max_linewidth = 2400,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index ce583eb14b06..c990406e4bca 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -15,6 +15,7 @@ static const struct dpu_caps sc8280xp_dpu_caps = {
 	.has_dim_layer = true,
 	.has_idle_pc = true,
 	.has_3d_merge = true,
+	.has_data_compress = true,
 	.max_linewidth = 5120,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 3950e7b946a5..7094640e2fbf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -15,6 +15,7 @@ static const struct dpu_caps sm8450_dpu_caps = {
 	.has_dim_layer = true,
 	.has_idle_pc = true,
 	.has_3d_merge = true,
+	.has_data_compress = true,
 	.max_linewidth = 5120,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 1b3f5424aea8..970049559e02 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -15,6 +15,7 @@ static const struct dpu_caps sm8550_dpu_caps = {
 	.has_dim_layer = true,
 	.has_idle_pc = true,
 	.has_3d_merge = true,
+	.has_data_compress = true,
 	.max_linewidth = 5120,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index b410a85c109c..c5bbd4ad6da8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -380,6 +380,7 @@ struct dpu_rotation_cfg {
  * @has_dim_layer      dim layer feature status
  * @has_idle_pc        indicate if idle power collapse feature is supported
  * @has_3d_merge       indicate if 3D merge is supported
+ * @has_data_compress  indicate if data compression is supported
  * @max_linewidth      max linewidth for sspp
  * @pixel_ram_size     size of latency hiding and de-tiling buffer in bytes
  * @max_hdeci_exp      max horizontal decimation supported (max is 2^value)
@@ -393,6 +394,7 @@ struct dpu_caps {
 	bool has_dim_layer;
 	bool has_idle_pc;
 	bool has_3d_merge;
+	bool has_data_compress;
 	/* SSPP limits */
 	u32 max_linewidth;
 	u32 pixel_ram_size;

-- 
2.40.1

