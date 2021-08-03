Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C852C3DEB2A
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 12:42:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA0436E52F;
	Tue,  3 Aug 2021 10:42:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D3D589F47;
 Tue,  3 Aug 2021 10:42:27 +0000 (UTC)
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 03 Aug 2021 03:42:27 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 03 Aug 2021 03:42:25 -0700
X-QCInternal: smtphost
Received: from kalyant-linux.qualcomm.com ([10.204.66.210])
 by ironmsg02-blr.qualcomm.com with ESMTP; 03 Aug 2021 16:11:50 +0530
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
 id 904134BA3; Tue,  3 Aug 2021 03:41:48 -0700 (PDT)
From: Kalyan Thota <kalyan_t@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc: Kalyan Thota <kalyan_t@codeaurora.org>, linux-kernel@vger.kernel.org,
 robdclark@gmail.com, dianders@chromium.org, mkrishn@codeaurora.org,
 saiprakash.ranjan@codeaurora.org, rnayak@codeaurora.org,
 stable@vger.kernel.org
Subject: [v2] drm/msm/disp/dpu1: add safe lut config in dpu driver
Date: Tue,  3 Aug 2021 03:41:47 -0700
Message-Id: <1627987307-29347-1-git-send-email-kalyan_t@codeaurora.org>
X-Mailer: git-send-email 2.7.4
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

Add safe lut configuration for all the targets in dpu
driver as per QOS recommendation.

Issue reported on SC7280:

With wait-for-safe feature in smmu enabled, RT client
buffer levels are checked to be safe before smmu invalidation.
Since display was always set to unsafe it was delaying the
invalidaiton process thus impacting the performance on NRT clients
such as eMMC and NVMe.

Validated this change on SC7280, With this change eMMC performance
has improved significantly.

Changes in v1:
- Add fixes tag (Sai)
- CC stable kernel (Dimtry)

Fixes: cfacf946a464d4(drm/msm/disp/dpu1: add support for display for SC7280 target)
Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
Tested-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org> (sc7280, sc7180)
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index d01c4c9..2e482cd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -974,6 +974,7 @@ static const struct dpu_perf_cfg sdm845_perf_data = {
 	.amortizable_threshold = 25,
 	.min_prefill_lines = 24,
 	.danger_lut_tbl = {0xf, 0xffff, 0x0},
+	.safe_lut_tbl = {0xfff0, 0xf000, 0xffff},
 	.qos_lut_tbl = {
 		{.nentry = ARRAY_SIZE(sdm845_qos_linear),
 		.entries = sdm845_qos_linear
@@ -1001,6 +1002,7 @@ static const struct dpu_perf_cfg sc7180_perf_data = {
 	.min_dram_ib = 1600000,
 	.min_prefill_lines = 24,
 	.danger_lut_tbl = {0xff, 0xffff, 0x0},
+	.safe_lut_tbl = {0xfff0, 0xff00, 0xffff},
 	.qos_lut_tbl = {
 		{.nentry = ARRAY_SIZE(sc7180_qos_linear),
 		.entries = sc7180_qos_linear
@@ -1028,6 +1030,7 @@ static const struct dpu_perf_cfg sm8150_perf_data = {
 	.min_dram_ib = 800000,
 	.min_prefill_lines = 24,
 	.danger_lut_tbl = {0xf, 0xffff, 0x0},
+	.safe_lut_tbl = {0xfff8, 0xf000, 0xffff},
 	.qos_lut_tbl = {
 		{.nentry = ARRAY_SIZE(sm8150_qos_linear),
 		.entries = sm8150_qos_linear
@@ -1056,6 +1059,7 @@ static const struct dpu_perf_cfg sm8250_perf_data = {
 	.min_dram_ib = 800000,
 	.min_prefill_lines = 35,
 	.danger_lut_tbl = {0xf, 0xffff, 0x0},
+	.safe_lut_tbl = {0xfff0, 0xff00, 0xffff},
 	.qos_lut_tbl = {
 		{.nentry = ARRAY_SIZE(sc7180_qos_linear),
 		.entries = sc7180_qos_linear
@@ -1084,6 +1088,7 @@ static const struct dpu_perf_cfg sc7280_perf_data = {
 	.min_dram_ib = 1600000,
 	.min_prefill_lines = 24,
 	.danger_lut_tbl = {0xffff, 0xffff, 0x0},
+	.safe_lut_tbl = {0xff00, 0xff00, 0xffff},
 	.qos_lut_tbl = {
 		{.nentry = ARRAY_SIZE(sc7180_qos_macrotile),
 		.entries = sc7180_qos_macrotile
-- 
2.7.4

