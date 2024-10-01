Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 520D398B4A4
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 08:42:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE73910E118;
	Tue,  1 Oct 2024 06:42:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="vGPyMujR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A3910E16C;
 Tue,  1 Oct 2024 06:42:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 79E805C5467;
 Tue,  1 Oct 2024 06:42:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5FA0C4CED2;
 Tue,  1 Oct 2024 06:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727764924;
 bh=HrA0FS4948XEicEia3PCyLayl/fTTKaKl6RZjFgS3Ig=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=vGPyMujR7JdqN68+hQMRmR4Ebk5fbQEXO4huNQYVVLwLK1IgUOsEIo6Z1Nd6DEQFE
 Ote7QBpx1xwvLuiFd+PJxEP18WhOIV4sZQ9jpB3WS2VusLLNXO1ZimIp/RSs5VLubn
 DOasGYOJdBJgZAi7Ie0KCGI8no+qMK92j824DtbwcaTiVw1ZtjrwP4+XhSZcZWA1do
 Gs7G4x5X7VxpPINEofLkvZVv86mEEanC6VYHV2BmXQ5svSWeR6teQhGtkEzHTYl1d0
 IyIUn8byjWqZKaGIC157asSqPotgpC/TpIpEvsjGgJZW2gQbY7ax3gyUemxC8o1YGm
 1hUsEaqzy8jtA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id AD123CE837A;
 Tue,  1 Oct 2024 06:42:04 +0000 (UTC)
From: Mahadevan via B4 Relay <devnull+quic_mahap.quicinc.com@kernel.org>
Date: Tue, 01 Oct 2024 12:11:38 +0530
Subject: [PATCH v3 3/5] drm/msm: mdss: Add SA8775P support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241001-patchv3_1-v3-3-d23284f45977@quicinc.com>
References: <20241001-patchv3_1-v3-0-d23284f45977@quicinc.com>
In-Reply-To: <20241001-patchv3_1-v3-0-d23284f45977@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mahadevan <quic_mahap@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, 
 Jayaprakash Madisetty <quic_jmadiset@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727764922; l=1441;
 i=quic_mahap@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=ruvZ/JZN3a0k1YxDVXWN9QdOEvryLUlgOfek1XCd9T4=;
 b=tpEHKoAUPdGIt9ffNiIhwM8l0/IYuMQenm7IE5VG+crQh8ZvBrYoPc/Szc5kpNFsCRtqPwXFI
 IYdY/Nwuol+CUai2q7m+Clj6NxZiLITqF+Ao4twutrZ0vAFx8GnSs9d
X-Developer-Key: i=quic_mahap@quicinc.com; a=ed25519;
 pk=Xc9CA438o9mZKp4uZ8vZMclALnJ8XtlKn/n3Y42mMBI=
X-Endpoint-Received: by B4 Relay for quic_mahap@quicinc.com/20241001 with
 auth_id=236
X-Original-From: Mahadevan <quic_mahap@quicinc.com>
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
Reply-To: quic_mahap@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mahadevan <quic_mahap@quicinc.com>

Add Mobile Display Subsystem (MDSS) support for the SA8775P platform.

Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index faa88fd6eb4d6aec383a242b66a2b5125c91b3bc..8f1d42a43bd02dd79acf222a3423d11ff3b3cba3 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -573,6 +573,16 @@ static const struct msm_mdss_data qcm2290_data = {
 	.reg_bus_bw = 76800,
 };
 
+static const struct msm_mdss_data sa8775p_data = {
+	.ubwc_enc_version = UBWC_4_0,
+	.ubwc_dec_version = UBWC_4_0,
+	.ubwc_swizzle = 4,
+	.ubwc_static = 1,
+	.highest_bank_bit = 0,
+	.macrotile_mode = 1,
+	.reg_bus_bw = 74000,
+};
+
 static const struct msm_mdss_data sc7180_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
@@ -710,6 +720,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss" },
 	{ .compatible = "qcom,msm8998-mdss", .data = &msm8998_data },
 	{ .compatible = "qcom,qcm2290-mdss", .data = &qcm2290_data },
+	{ .compatible = "qcom,sa8775p-mdss", .data = &sa8775p_data },
 	{ .compatible = "qcom,sdm670-mdss", .data = &sdm670_data },
 	{ .compatible = "qcom,sdm845-mdss", .data = &sdm845_data },
 	{ .compatible = "qcom,sc7180-mdss", .data = &sc7180_data },

-- 
2.34.1


