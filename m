Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F329905B4B
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 20:43:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 059F110E0E9;
	Wed, 12 Jun 2024 18:43:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="Z0sdrmlJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp17.i.mail.ru (smtp17.i.mail.ru [95.163.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AE8A10E03A;
 Wed, 12 Jun 2024 18:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
 ; s=mailru;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=CEVnOCs2hSB6ab4esQW2X4lItVZ6fQ9H/RCZ0rpXcws=; t=1718217828; x=1718307828; 
 b=Z0sdrmlJcpowZMEX0WLNmM2B+p/2tBwB9Yo6jgaOxDlfJObr/OzuqV8fORHMg3M2WFuROvWIYVv
 BkaOfN6U/Cy+skT08+JU8gWLLETn3S8eADjAwnQA4GPAohzzVYQsbUEPc+ewLk5A7idpYTj0biOtk
 FnFaYKj4CcXr0ZU9t5E=;
Received: by smtp17.i.mail.ru with esmtpa (envelope-from <danila@jiaxyga.com>)
 id 1sHSwh-0000000D0R6-2wKS; Wed, 12 Jun 2024 21:43:45 +0300
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
Subject: [PATCH v2 0/4] Add MDSS and DPU support for QCOM SM7150 SoC
Date: Wed, 12 Jun 2024 21:43:32 +0300
Message-ID: <20240612184336.11794-1-danila@jiaxyga.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp17.i.mail.ru;
 auth=pass smtp.auth=danila@jiaxyga.com
 smtp.mailfrom=danila@jiaxyga.com
X-Mailru-Src: smtp
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD9AC8CA0B4439200FA28F1BD06D4CF66E6FBB893C35490C21C00894C459B0CD1B9E0A1FDF6F10A4B8583E6F0B08ED3DBBEF96DB77A3BD4E63F57EC9FF7D4E61EAD8472923344694FB0
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE775E4C393EFDC22A2EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006376F978168E59B07A5EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38B043BF0FB74779F36E4683DFBEAB3A01CC032503CFA2597D338758AAFAE1D69BCA471835C12D1D9774AD6D5ED66289B5278DA827A17800CE7BEE62E5629C982429FA2833FD35BB23D2EF20D2F80756B5F868A13BD56FB6657A471835C12D1D977725E5C173C3A84C332941D3B652364A4117882F4460429728AD0CFFFB425014E868A13BD56FB6657D81D268191BDAD3DC09775C1D3CA48CFFB176FB4559E527BBA3038C0950A5D36C8A9BA7A39EFB766D91E3A1F190DE8FDBA3038C0950A5D36D5E8D9A59859A8B6860B3362B5333A1D76E601842F6C81A1F004C906525384303E02D724532EE2C3F43C7A68FF6260569E8FC8737B5C2249957A4DEDD2346B42E827F84554CEF50127C277FBC8AE2E8B974A882099E279BDAAAE862A0553A39223F8577A6DFFEA7C789C969B8F27C422C4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A50D478F6E60EA37335002B1117B3ED69663492A9E997FF94D1E49B01306B5E3AD823CB91A9FED034534781492E4B8EEADB30A456A8F293845C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF1AB1EEBD33F20E9A0FB9B50CAC78E4F56DAA9F478E8F1324DC4E578C19C6D0CB8D4FFD5EE536539904A26A3878DC1330EC977B22DB5FCADCEB33B4587FF888A380EB2E67E8563E6454A6BD6C3A9AE7E002C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojP/c/PTD82AkY4uCJ69Pflw==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C7394981441996D2511AD5D1E693A2F4CD4B1000CD8E2D3270CE1AFCADBEB03443A6C7512C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
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

Changes in v2:
- Drop clock controller headers and use invented clocks instead in
patches 1 and 2 (Dmitry and Rob)
- Link to v1:
https://lore.kernel.org/all/20240611223743.113223-1-danila@jiaxyga.com/

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

 .../bindings/display/msm/qcom,sm7150-dpu.yaml | 143 ++++++
 .../display/msm/qcom,sm7150-mdss.yaml         | 458 ++++++++++++++++++
 .../msm/disp/dpu1/catalog/dpu_5_2_sm7150.h    | 349 +++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   1 +
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
 drivers/gpu/drm/msm/msm_mdss.c                |   8 +
 7 files changed, 961 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm7150-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h

-- 
2.45.2

