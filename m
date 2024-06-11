Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2C0904715
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 00:38:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB40D10E109;
	Tue, 11 Jun 2024 22:38:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="Nu92UMhW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="Rvlu9iNV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fallback20.i.mail.ru (fallback20.i.mail.ru [79.137.243.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED04010E109
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 22:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com;
 s=mailru; 
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=q465KjNLlaqfXehHF1lQ3qSlJHHi1ol1302Tu4eHISs=; 
 t=1718145489;x=1718235489; 
 b=Nu92UMhW/fU8SfS61Wbu87/SntkVjH0ptw576YL/Foj592B3HzIGRjKRAFr0E++c937rHQFix+aXPPToS1Dm+dBUS/I73OeHTueSs+yN7QPgU2JNWI8EGz9eLd/95fu3JBb3FII5POKc+J3ouDqfkq3d5Jc/4wzzH4CcyrFrUU0=;
Received: from [10.12.4.16] (port=49598 helo=smtp47.i.mail.ru)
 by fallback20.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
 id 1sHA7y-0082KG-3B; Wed, 12 Jun 2024 01:38:06 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
 ; s=mailru;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=q465KjNLlaqfXehHF1lQ3qSlJHHi1ol1302Tu4eHISs=; t=1718145486; x=1718235486; 
 b=Rvlu9iNV0vhFVphvYz7cT4TqNOcoc7SfI5hN/rQ2DwNBIfjPZfJCF4Lw4xwlxVwRcO0Cm1kMW86
 3ywjA6jUFSDUWyR+VZ49FmOuEy1FAJU9OL3DyaepGSGlyPJDLn7Zgie2rS/RmDz+VAlquGfn8nN7E
 Zk6arxQDaaDH7mfzoeU=;
Received: by smtp47.i.mail.ru with esmtpa (envelope-from <danila@jiaxyga.com>)
 id 1sHA7g-00000000PfZ-34et; Wed, 12 Jun 2024 01:37:49 +0300
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
Subject: [PATCH 0/4] Add MDSS and DPU support for QCOM SM7150 SoC
Date: Wed, 12 Jun 2024 01:37:39 +0300
Message-ID: <20240611223743.113223-1-danila@jiaxyga.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9AC8CA0B4439200FA19AE3EA0235AE0E7243ECEBF822142BF00894C459B0CD1B9054E99E2303B0F4206104296DCCA83D23ADDAAA15180D00842442993E2508E0AED199C4BD4F2E418
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE76F334650EE2FF367EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637D4360D888D8F9BE48638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8C830C08864248EFF408FF9FAEF290F8B959B0FD907FC7628CC7F00164DA146DAFE8445B8C89999728AA50765F790063767B9C6E70FBE8DD8389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8D166953D3EA3826BF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947C81F3E54FD4568659040F9FF01DFDA4A84AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C342AF7BC6F74C2E4EBA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CFCF36E64A7E3F8E581DD303D21008E298D5E8D9A59859A8B6E5E764EB5D94DBD475ECD9A6C639B01B78DA827A17800CE7A2A9C9A00CC75FB0731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A551121299F6AF5FC35002B1117B3ED6967FE38823A68FEDEB19AC5B239BAD4335823CB91A9FED034534781492E4B8EEAD3C056C6FCE5AFF8EC79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF2C982FF745AD991C757DF1C1EB24435DF5EB9327AD5597441B72035E72316101BA297A5F7262141F04A26A3878DC1330B3CABD56E102364DE3725B7D062D8D432F718A81146ACCDC54A6BD6C3A9AE7E002C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojbL9S8ysBdXjGnEhxYo9Dy2v5g1r6TYqA
X-Mailru-Sender: 9EB879F2C80682A09F26F806C73949810CCDD7C2C42388EEEDE2FBCE1621770A210F76142C63B1F9E007F3DA729AB7E52C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: 78E4E2B564C1792B
X-77F55803: 6242723A09DB00B4D68C2164A06637339A6B427C6964551950E2488A9AE31CF1049FFFDB7839CE9E30D7A70BAF70B54938887F26BBCF9E746A249D9C47DC5DA7B54F5986990BB350
X-7FA49CB5: 0D63561A33F958A5495DF175377E5151B83B1CCCC43D4C00E95ECE4F6ADB247E8941B15DA834481FA18204E546F3947CB6837AF49FA6FBC5F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F79006376C0B0C0B9C247A4E389733CBF5DBD5E9B5C8C57E37DE458BD96E472CDF7238E0725E5C173C3A84C3FCABA7B5202078F435872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj7p5wIdCuWKPNVJvlberUSw==
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

This series adds MDSS and DPU support for SM7150.

To: Rob Clark <robdclark@gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sean Paul <sean@poorly.run>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Ryan McCann <quic_rmccann@quicinc.com>
To: Stephen Boyd <swboyd@chromium.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Jonathan Marek <jonathan@marek.ca>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>

Danila Tikhonov (4):
  dt-bindings: display/msm: Add SM7150 MDSS
  drm/msm: mdss: Add SM7150 support
  dt-bindings: display/msm: Add SM7150 DPU
  drm/msm/dpu: Add SM7150 support

 .../bindings/display/msm/qcom,sm7150-dpu.yaml | 145 ++++++
 .../display/msm/qcom,sm7150-mdss.yaml         | 460 ++++++++++++++++++
 .../msm/disp/dpu1/catalog/dpu_5_2_sm7150.h    | 349 +++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   1 +
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
 drivers/gpu/drm/msm/msm_mdss.c                |   8 +
 7 files changed, 965 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm7150-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h

-- 
2.45.2

