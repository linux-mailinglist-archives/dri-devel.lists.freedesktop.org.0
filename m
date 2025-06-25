Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A52C4AE83F1
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 15:11:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA90B10E722;
	Wed, 25 Jun 2025 13:11:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tcoi9vqZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D26610E724;
 Wed, 25 Jun 2025 13:11:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DC28D5C49D3;
 Wed, 25 Jun 2025 13:08:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74E41C4CEEA;
 Wed, 25 Jun 2025 13:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750857070;
 bh=5kd46EYzLSIP7jQo4nPGykrQoZ5gksu592EDZaqeOcE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=tcoi9vqZ71DsEC7MtmEMv0kufQW4aGgdq1gGExDixPAemvBvIcUH1Z9nHPV7Zk5RR
 +Ri23cL0jv1l6eZ9hjq8VLLgQh5F3z/eUBgYP+Z3FxBv+ouabfOenA7PPQq+YqTeuo
 FV5DuYGKrGVFzoAQ5258yeVhzDhvoO3MHa6Sf/teRjlK734v0JgnDPRWVX0DW4o8MD
 EaLy+ZxgGPPN0rPe/Gek6vU3SUFv4Ph5wU6XnvDxAGFvGh30BH4ADMGxFdgka5Hnc8
 DPBKCQEDUfc82TYlrSKPbSBwk8MeWc0MRoV87JFqIfraXVvq8pDwOKPCgYpQQAdk+J
 ljf+o/6jiDKmQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 25 Jun 2025 15:10:19 +0200
Subject: [PATCH v5 11/14] soc: qcom: ubwc: Fix SM6125's ubwc_swizzle value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-topic-ubwc_central-v5-11-e256d18219e2@oss.qualcomm.com>
References: <20250625-topic-ubwc_central-v5-0-e256d18219e2@oss.qualcomm.com>
In-Reply-To: <20250625-topic-ubwc_central-v5-0-e256d18219e2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750857014; l=1051;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=boHkhEcS8ujsO8eosjmO/xq6FDYpSswaBWnJ0yziTTc=;
 b=CzQ//fue3SaXzkihq3Hg7cLtcchvyzO9heR+nRPgSf4915aF09zCmmnZiFPlW7Hx/V2XmkQVu
 qPhj8GQkJ5zAFuOTrOmCqLue6zycPK9syGflyzggBoJfFlaQnqeCZ8R
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

The value of 7 (a.k.a. GENMASK(2, 0), a.k.a. disabling levels 1-3 of
swizzling) is what we want on this platform (and others with a UBWC
1.0 encoder).

Fix it to make mesa happy (the hardware doesn't care about the 2 higher
bits, as they weren't consumed on this platform).

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index ef2dfaa6730f7f5cb08bac3cff6486e5f3f99570..49ec20901f607b77fb297764b97d75c0537b1db2 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -103,7 +103,7 @@ static const struct qcom_ubwc_cfg_data sm6115_data = {
 static const struct qcom_ubwc_cfg_data sm6125_data = {
 	.ubwc_enc_version = UBWC_1_0,
 	.ubwc_dec_version = UBWC_3_0,
-	.ubwc_swizzle = 1,
+	.ubwc_swizzle = 7,
 	.highest_bank_bit = 14,
 };
 

-- 
2.50.0

