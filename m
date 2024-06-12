Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E35905B51
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 20:44:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6693310E03A;
	Wed, 12 Jun 2024 18:44:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="K2k2gvUz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp17.i.mail.ru (smtp17.i.mail.ru [95.163.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C9B10E03A;
 Wed, 12 Jun 2024 18:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
 ; s=mailru;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=eRpIh3MFWWqDMzGpIXCuBn+ib8JMfonjDSqndcF6t/A=; t=1718217849; x=1718307849; 
 b=K2k2gvUzMkJkSHIEuT4CRgmbxkWkilbF3/wPypR/xiC3JKxGfy2NQ212Osn5CnStmIhs6zLmLLs
 J9xkkm4E0cp0LmJqrUBHp23C00tb/IoPXrFIu0jNAdCQvSh/a5Xu6lHS+/Z6RoFvyf1a/8Gc0waT6
 vtJSq11kD2X3l4HlErQ=;
Received: by smtp17.i.mail.ru with esmtpa (envelope-from <danila@jiaxyga.com>)
 id 1sHSx4-0000000D0R6-0Mqj; Wed, 12 Jun 2024 21:44:07 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quic_rmccann@quicinc.com, konrad.dybcio@linaro.org,
 neil.armstrong@linaro.org, jonathan@marek.ca, swboyd@chromium.org,
 quic_khsieh@quicinc.com, quic_jesszhan@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Danila Tikhonov <danila@jiaxyga.com>
Subject: [PATCH v2 2/4] drm/msm: mdss: Add SM7150 support
Date: Wed, 12 Jun 2024 21:43:34 +0300
Message-ID: <20240612184336.11794-3-danila@jiaxyga.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240612184336.11794-1-danila@jiaxyga.com>
References: <20240612184336.11794-1-danila@jiaxyga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp17.i.mail.ru;
 auth=pass smtp.auth=danila@jiaxyga.com
 smtp.mailfrom=danila@jiaxyga.com
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9AC8CA0B4439200FA9F827F83B79F671BF8FDA50EA86A90BE00894C459B0CD1B9B94C71BE9E53DE1283E6F0B08ED3DBBEF2B593887A7F923157EC9FF7D4E61EADEC456C66D2279EA7
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE743D95D1474A4F818EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637EDC9855826FBDF5A8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D833B2EA5C37C23AF9C0955C639EDBD42EF62CE15361E7A91ACC7F00164DA146DAFE8445B8C89999728AA50765F790063741F7343E26298569389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC878444BBB7636F62AF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947CDA7BFA4571439BB2302FCEF25BFAB3454AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C386712D2D5FBAF151BA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CFED8438A78DFE0A9E1DD303D21008E298D5E8D9A59859A8B652D31B9D28593E5175ECD9A6C639B01B78DA827A17800CE74F0F518E68DBD4F843847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 0D63561A33F958A5E201E877967942C55002B1117B3ED6967B9C4122E6252D7C108A05421C070DB8823CB91A9FED034534781492E4B8EEADC8D8B8CB12567299C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF5D9EAA1F3B2412C60966FDD54634C9BCDB82958D3C65BB9F29905A44C27CE191A7F6D8DEE3A50DD404A26A3878DC13300E9362EA79C879C2EB33B4587FF888A363DB507CBEF059A254A6BD6C3A9AE7E002C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojP/c/PTD82AlKHUozd4dVHg==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C73949812BC0DB2261ED53631356DD24693B53BC0BC8E9E4773051228DFC58918DFEC9C32C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
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

Add support for MDSS on SM7150.

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index fab6ad4e5107c..d90b9471ba6ff 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -632,6 +632,13 @@ static const struct msm_mdss_data sm6350_data = {
 	.reg_bus_bw = 76800,
 };
 
+static const struct msm_mdss_data sm7150_data = {
+	.ubwc_enc_version = UBWC_2_0,
+	.ubwc_dec_version = UBWC_2_0,
+	.highest_bank_bit = 1,
+	.reg_bus_bw = 76800,
+};
+
 static const struct msm_mdss_data sm8150_data = {
 	.ubwc_enc_version = UBWC_3_0,
 	.ubwc_dec_version = UBWC_3_0,
@@ -713,6 +720,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sm6125-mdss", .data = &sm6125_data },
 	{ .compatible = "qcom,sm6350-mdss", .data = &sm6350_data },
 	{ .compatible = "qcom,sm6375-mdss", .data = &sm6350_data },
+	{ .compatible = "qcom,sm7150-mdss", .data = &sm7150_data },
 	{ .compatible = "qcom,sm8150-mdss", .data = &sm8150_data },
 	{ .compatible = "qcom,sm8250-mdss", .data = &sm8250_data },
 	{ .compatible = "qcom,sm8350-mdss", .data = &sm8350_data },
-- 
2.45.2

