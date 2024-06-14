Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E91019093DA
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 23:59:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28CE910E2B7;
	Fri, 14 Jun 2024 21:59:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="0RcbboLY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp52.i.mail.ru (smtp52.i.mail.ru [95.163.41.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB1B710E2B7;
 Fri, 14 Jun 2024 21:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
 ; s=mailru;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=I2zbsAWu1Eu4d9TVubFHniQywRxerjHH7psUQOZnDvo=; t=1718402371; x=1718492371; 
 b=0RcbboLYTp0QzruLrRzWhuR+jlTf2egha8v7OlRonb8SDvwEP4/BMoO+TVDtG45oCLtvRxK/MNn
 8NQfCB8nPKPxWWHLGaTT8xLdEAuzSWqKh0eGYGg4dgA57K1uUkIg8OnYJFqDNeb0Rk/tCkK5IVNf4
 39S1LPRWJV7AsNJBpvA=;
Received: by smtp52.i.mail.ru with esmtpa (envelope-from <danila@jiaxyga.com>)
 id 1sIExE-0000000DQt7-25AF; Sat, 15 Jun 2024 00:59:29 +0300
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
Subject: [PATCH v3 4/4] drm/msm: mdss: Add SM7150 support
Date: Sat, 15 Jun 2024 00:58:55 +0300
Message-ID: <20240614215855.82093-5-danila@jiaxyga.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240614215855.82093-1-danila@jiaxyga.com>
References: <20240614215855.82093-1-danila@jiaxyga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp52.i.mail.ru;
 auth=pass smtp.auth=danila@jiaxyga.com
 smtp.mailfrom=danila@jiaxyga.com
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9AC8CA0B4439200FAAADCB0684E75543E0F6F500DBE411A6A00894C459B0CD1B957E878E1563405FABC1E996D91BF8BA8C68F1F964767349531FC8F41566DE797ED199C4BD4F2E418
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE77E3A0F9856B9FFCDEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637E0FC02D497BF09508638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D87E69E8B52EFAA2BE1367D1A1BD11C48D18B0279F5742E92BCC7F00164DA146DAFE8445B8C89999728AA50765F790063773DCDF0198120BE8389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC87AE820D2C17D0E56F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947C0085B890FD2717DAC0837EA9F3D197644AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C3FF9AE5E544BDEAB7BA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CFED8438A78DFE0A9E1DD303D21008E298D5E8D9A59859A8B64854413538E1713F75ECD9A6C639B01B78DA827A17800CE7F45C1E71A9DFFA2A731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A5912CCC39EECD253D5002B1117B3ED69610DFD3996B318639ED71F038FC046993823CB91A9FED034534781492E4B8EEAD5C5DFC4BFF39B799F36E2E0160E5C55395B8A2A0B6518DF68C46860778A80D548E8926FB43031F38
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFA8EFB69FF7C29CD09E85BF36D4CEF49B484DD084CAA8D5E092318233B267D6ABB0F06D2F9487D0FCBC11D93875BCBCAC82A0A51DF04A9D670A7495B692C6454F62E6511AD6502DA154A6BD6C3A9AE7E002C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojF87fI4pLnoCDdWDki0eGcw==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C7394981DFB41304B3586333741D06F8E7BD5C496106ADDF343002E43FFA6A7CB58086992C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

