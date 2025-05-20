Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F582ABD60D
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 13:08:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D268B10E4DA;
	Tue, 20 May 2025 11:08:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mz2UvUl8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50C1710E4AB;
 Tue, 20 May 2025 11:08:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 255544ACEB;
 Tue, 20 May 2025 11:08:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57BDAC4CEF0;
 Tue, 20 May 2025 11:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747739290;
 bh=4tmWDYzvwj1y9lI2C+vGP8GIEw9zo2mq6d+/a/gWS+4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=mz2UvUl8hwY45sYLWcsd1nfOkmQ00ptodHBAHSKQf7/2hgHu+I7CP3ln+Z28Ckk1N
 3pFIjQvVxHIYZ9PsrBuKQP73GOXQoDu9CQKP/fws3GLeLQNL26vB+DoSMTa+mYQC4E
 bUzNrHGtE2JJhmAJzQdG2hhiKg2mY1cy/vktHx6dlfcVnlKz39VyOPxZ63dyESMcJJ
 CmaZDwWPWUVJQ52Rg9Yl4RbnLf32vA1ok2H6pWBiycxF5EPB3XSeu3WW/I9nqmLduI
 JYrEYASRDUypvpH07hg1qgUUo5cx/QOLZfv3FF7QGpqMpfqn8DNZVGdX3SzwBRO2nD
 JOjcDFpc/PwVQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 20 May 2025 13:07:16 +0200
Subject: [PATCH RFT v4 11/14] soc: qcom: ubwc: Fix SM6125's ubwc_swizzle value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-topic-ubwc_central-v4-11-2a461d32234a@oss.qualcomm.com>
References: <20250520-topic-ubwc_central-v4-0-2a461d32234a@oss.qualcomm.com>
In-Reply-To: <20250520-topic-ubwc_central-v4-0-2a461d32234a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747739236; l=1051;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=mePTO5eShzpvP9SrgetoPs6IstbtUBqJ1f/YlpNYkRE=;
 b=pj+eCR0Bv1vvctSiINqmF37dsAz5nSPdwDZ/8fHKqbHc/ikYRsEUX4g6M8D2XoQikQ0A6rmoj
 7prJdtpg3SDAYUxcwiJS0+yPHImUjtCYFEsE6BhWr8rmSKeu2vDAW5q
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
index 7d220259829f0e57268f30b323ae985cf44672f4..7002744631341796d08fa197efa2202b3018cc3e 100644
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
2.49.0

