Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BD7904717
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 00:38:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BAAE10E240;
	Tue, 11 Jun 2024 22:38:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="HGU4TVoC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="aP9cJoks";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fallback25.i.mail.ru (fallback25.i.mail.ru [79.137.243.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A4C410E240
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 22:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com;
 s=mailru; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=eRpIh3MFWWqDMzGpIXCuBn+ib8JMfonjDSqndcF6t/A=; 
 t=1718145490;x=1718235490; 
 b=HGU4TVoCMr4AKpyR/OR4g4SDzuiPp7/nnKqSle5FNy3PG21BouqvAUHNgcIKJcGE2/B+WMJhdPNZmIMfPgNhT2nhUmzTEv6/dMObj1dS7P5R/ez+QPRv+IyGrfsdcidrMXP2xYfeT4vo9k+WRCJJKc/sHOE7krHY3Kv1CXt+FLw=;
Received: from [10.12.4.16] (port=39526 helo=smtp47.i.mail.ru)
 by fallback25.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
 id 1sHA7z-00A4aE-L9; Wed, 12 Jun 2024 01:38:07 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
 ; s=mailru;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=eRpIh3MFWWqDMzGpIXCuBn+ib8JMfonjDSqndcF6t/A=; t=1718145487; x=1718235487; 
 b=aP9cJoksQNPnE34UZxWssmMrr7u00patp/kLUf1wolPHdf7WB+6dJquY6DfdqwFlnrMVr7gow1w
 QtseIytqnPbMxKkOV7UsAZGTRzSLz7lWnUpxFcE91DUQsxr8Zyqie2JbuaE/3L9uIpZ7tWHeN3MCx
 yqx/kY4MYoANJf07obo=;
Received: by smtp47.i.mail.ru with esmtpa (envelope-from <danila@jiaxyga.com>)
 id 1sHA7p-00000000PfZ-38Zs; Wed, 12 Jun 2024 01:37:58 +0300
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
Subject: [PATCH 2/4] drm/msm: mdss: Add SM7150 support
Date: Wed, 12 Jun 2024 01:37:41 +0300
Message-ID: <20240611223743.113223-3-danila@jiaxyga.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240611223743.113223-1-danila@jiaxyga.com>
References: <20240611223743.113223-1-danila@jiaxyga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9AC8CA0B4439200FA19AE3EA0235AE0E7243ECEBF822142BF00894C459B0CD1B91EDCABB2D24DAD0706104296DCCA83D2C49B26D9E6003A6142442993E2508E0A4B72E82432766FBE
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7B72EF797F6622CCCEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637F10563012BA5CCB0EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38B043BF0FB74779F36663338178768A9428A9198D403BF298922E228ABFAF08E40A471835C12D1D9774AD6D5ED66289B5278DA827A17800CE77FFCE1C639F4728C9FA2833FD35BB23D2EF20D2F80756B5F868A13BD56FB6657A471835C12D1D977725E5C173C3A84C34C82C86BFC697D19117882F4460429728AD0CFFFB425014E868A13BD56FB6657D81D268191BDAD3DC09775C1D3CA48CF8A2765277F08B644BA3038C0950A5D36C8A9BA7A39EFB766D91E3A1F190DE8FDBA3038C0950A5D36D5E8D9A59859A8B6F99AF4D8A163DCE876E601842F6C81A1F004C906525384303E02D724532EE2C3F43C7A68FF6260569E8FC8737B5C2249D52CD31C43BF465FE827F84554CEF50127C277FBC8AE2E8B60CDF180582EB8FBAAAE862A0553A39223F8577A6DFFEA7CC96613F75B7D048DC4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A5EB3A812288640D845002B1117B3ED696E7F120D56C2CC2DBB91D2EB2DEE3878C823CB91A9FED034534781492E4B8EEAD0BC323893F80E328C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF84C6C6127F70BC2361AC497ABC5D612C3E6DDA12274720E63548CB40E6E4ACA5327C9FD717F3371804A26A3878DC1330FF4D0B398E4CABB0E3725B7D062D8D43C74F081665EB98D254A6BD6C3A9AE7E002C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj7p5wIdCuWKPCRWIniVMZ5w==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C73949810CCDD7C2C42388EED4570605F44DF53777E74459BB8928F03A31FC50C687317C2C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4D68C2164A06637339A6B427C69645519E5274E29527F1965049FFFDB7839CE9E30D7A70BAF70B54947069D61A5D20384E7B98EC691DB374BB58A7D2132441C45
X-7FA49CB5: 0D63561A33F958A5B8DC047D36E15633B15DFB844DF73D4F42D4C7DEC6D90F558941B15DA834481FA18204E546F3947CBA7556051D6825FBF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637889750A55773577B389733CBF5DBD5E9B5C8C57E37DE458BD96E472CDF7238E0725E5C173C3A84C3FCABA7B5202078F435872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj7p5wIdCuWKN6IIR/dqZ/ig==
X-Mailru-MI: 8000000000000800
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

