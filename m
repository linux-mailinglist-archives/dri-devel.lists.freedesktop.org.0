Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB48BAD373B
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 14:50:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 757B610E054;
	Tue, 10 Jun 2025 12:50:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="F7GQc7RQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4FA710E054;
 Tue, 10 Jun 2025 12:50:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8CECF4A6E1;
 Tue, 10 Jun 2025 12:50:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35285C4CEF1;
 Tue, 10 Jun 2025 12:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749559817;
 bh=7QpkMQMXtn6bcXn+GLCixu8zGcxbjjq8un/lPEBMnVI=;
 h=From:Date:Subject:To:Cc:From;
 b=F7GQc7RQ+F0IJCdqY94Kv4ovWFYpciWBNBN3n3ToM1BxxreW8XTNXdwe+ckHm8Xww
 T7IJkYouR8gd+16bN9SOt+mFg/BBfT4RiDAhEeJrtuCeRc7/QUiourBnp4xWvFn4mj
 QE0VQ1vxJq9lezeoj3KXQEC4HzFlX1vK6wFKOX4Z6nIpURA5lILlEYUc1WN/r08hn8
 6d4ha6j40uuJhkS7zG0Z+7s77vuR+Cyd33mjYGPIV2Hs1Vfq8pnvtngi6IVPcxXIVu
 ZJ54mptB0ckWWz9y9wvnbFmXxlFB0kLmjqkBcwNlcZQEsULOX8+CtPH/FQ+vUaEJqV
 /WzEIkVzWTOvg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 10 Jun 2025 14:50:03 +0200
Subject: [PATCH] drm/msm/dpu: Fill in min_prefill_lines for SC8180X
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-topic-dpu_8180_mpl-v1-1-f480cd22f11c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPopSGgC/x3M3QpAQBBA4VfRXNuatdHyKpIwgyk/2y5S8u42l
 9/FOQ8E9sIBquQBz5cE2bcInSYwzN02sRKKhgyzHAuN6tidDIrc2VptsV3dokpjjLXcIxFBDJ3
 nUe5/Wjfv+wEw8pW8ZAAAAA==
X-Change-ID: 20250610-topic-dpu_8180_mpl-933388eb0ddd
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749559812; l=1066;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=iE/yOryfr8u/J14k5vdj37MOoWRLYDlk7LCl9lLaqKE=;
 b=/3ym+TuMMf6qgrZEIiGeqXTPB8s739mqTCyW2nxcn3cXJjZHUCFEee6La/zDxv7RuGt7gJz63
 8iBtDMZZ6PEADjErF4GBzqzz8j7nVQW1dwSyHNPfIOEMYE/ncI4qhkn
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Based on the downstream release, predictably same value as for SM8150.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index d6f8b1030c68a428a144428b422b63b960c2fdba..6c04f41f9bacc3be2d2259d3b3e2099934f473f7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -383,6 +383,7 @@ static const struct dpu_perf_cfg sc8180x_perf_data = {
 	.min_core_ib = 2400000,
 	.min_llcc_ib = 800000,
 	.min_dram_ib = 800000,
+	.min_prefill_lines = 24,
 	.danger_lut_tbl = {0xf, 0xffff, 0x0},
 	.safe_lut_tbl = {0xfff0, 0xf000, 0xffff},
 	.qos_lut_tbl = {

---
base-commit: b27cc623e01be9de1580eaa913508b237a7a9673
change-id: 20250610-topic-dpu_8180_mpl-933388eb0ddd

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

