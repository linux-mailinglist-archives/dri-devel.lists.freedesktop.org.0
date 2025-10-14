Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4686DBD964A
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 14:40:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61FEE10E5F7;
	Tue, 14 Oct 2025 12:40:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="U5vyzsD3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C27110E5EF
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 12:40:02 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-46e4ad36541so55301515e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 05:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760445601; x=1761050401; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=sxgfIdENtrsIjMM2UdQCTeBKGZOKjcZiEo3cUFxAXcY=;
 b=U5vyzsD3PJMtorzstyO+HwCsTr5KU9Zyii6LVPz74lY3LXzl2wtItS8ahWBuq9oqnN
 +eRVjnJlvqF8GNihJ5hcGLviQkZ6nPE4l7U0sDE7LWil0kVcaXFjv6V3ErsSy1Kl6Qi8
 hQK1s4Xi0qGIx525S1+li7L6I2FhzhYterbxxd3pYVNeIToqvM92NX4ckSVSmP8taO0W
 TWEFmQY+eSeq7zJ/A9T+QZGOeKCqkx3+puB1XGrvTrY9sdnzYYulo3C7cHBTgrTd24KG
 IwgtfhwJGSevzPtgcKlBi8XHd1rru2RgvI88+cKit9eSCUXkLFem+/naA/lgny6UTQUV
 aUXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760445601; x=1761050401;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sxgfIdENtrsIjMM2UdQCTeBKGZOKjcZiEo3cUFxAXcY=;
 b=YR02ac/GccUdJrRL3kiAm4XAKu66lys+QnqlcqzHDmRlZNI4qtOIGhdDDjQ3eXmqbe
 NnmCXQirgBOu7PczIZjWMGhLUX+b6na84fmCvA+UC0/Tq4/wA2+m3FkEJr+Qwdd6ilKK
 n5O4jbDgDkrgRJZVOuJo3tqt3GrD3a4sbcd/r3S6yJI+KoerRfuJi64RrFCvrkF9oolJ
 ANh4Mxa4vJviUfFp1DbEc3E++EkWOJWD6XCXfHRYM5nOgyE72FFvT5DTEq0lFSoAatYo
 E2vFjOrY7obrfqoJSHyHuTZL+Wqzv4B3XBRAvZzx4zFatniRrkV8Pcg4JUUO74SWqTcs
 IaZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8xL3RqZUCIPrGbvAhxz4IUQsBTkiS9QgRa+IKhPUOUhzU80nba/ePm2z1lHcijwqOFANjQAlbejY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3T8OFpWaXYraYVXq846pCUBBVDKLK5XwycbuaERJ3chj2svUA
 avINknbOupCTqEsUrGbqjLxBNI2ZLrF5QCgvkXYcp4BhmURjEfXQrATkCUfx0Wb96/Y=
X-Gm-Gg: ASbGncsqGV0Bpnyb6akIULSWXn5mRSblW0uHUmB8hJZsanXFdHxSbQZoWkNJQ9fso5G
 fQCRRMWxV7RV6S9/r5xPPh+YQFyrhwiNcasC3GJLKTU9/PDCOVr8eePfOjQl4WiHZbET4KiEy9a
 IoSZJI5CGaUeMY9diTdylve6qJfhfb+L/2zrUNlwWxSRIuRuh4xpZGCAQZaC+/mGyjkaVI9vMHR
 ENIaXHjqgouJV1K95myoS4oGUOETjBQkeAwS22gztyOaUtB9P9xrIi0/phzPCnaNDFxeIEtcovu
 r20LcXe/7zFnsuZ/myl3rmkVu79hQjziSj7qBQcURyEMKSFwJzGghGMy1OiEsRi+Qf87XoRcptL
 pwwmABXWe9g9sEILZQddbQ35OSz1DDWuh/kHPwayUL7gTqvIAmxEscQ==
X-Google-Smtp-Source: AGHT+IH024kthWWng9VVuStRjupMvWSg7lIHOdFe/7RjnG2kPxkkxrcaV4rPLSgdMQ/hfIsogbXDew==
X-Received: by 2002:a05:600c:c4a4:b0:46e:1d01:11dd with SMTP id
 5b1f17b1804b1-46fa9a89444mr163805485e9.2.1760445600684; 
 Tue, 14 Oct 2025 05:40:00 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.169]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb482b9easm245813815e9.1.2025.10.14.05.39.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 05:39:58 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 14 Oct 2025 15:38:31 +0300
Subject: [PATCH v2 6/7] drm/msm/dp: Add support for Glymur
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-glymur-display-v2-6-ff935e2f88c5@linaro.org>
References: <20251014-glymur-display-v2-0-ff935e2f88c5@linaro.org>
In-Reply-To: <20251014-glymur-display-v2-0-ff935e2f88c5@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1827; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=BDhxfQSATkvz5PZ4qM3SXapXE8VjPOJ1bFOc4+xtjJc=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBo7kSIX67Zq3tsYRsWCfhopNDqKPVvETlIfD1W6
 4ePvOkV2P2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaO5EiAAKCRAbX0TJAJUV
 VoSsD/9c8jG5AXRyE0vUUUPGQ7sK6F5ou4qaOoBv3ATYVnIwMEgjUdvv2gLOt2eMHIJ+gemHKSp
 gp78ksd0knDi5n+aT3m74sVTvm3NIzu8Mefer8b0KzmXvMtf/inL1CwLo3VIxgzUHzsNVl0ltEv
 SLw/G9zaj43iCqw/hgpuGOlpkONE9mktmkGKUHqDZvclAmmjxi3nzL2uDfdfL2g8Bim9P0Dr9cd
 V+iGCOogdKRPg/n/ZgViXWKAqXDX+ISYo8S7BA5yXOF/9ALDaKrbUzXZ0u8Q7VqRWO/cMhPMcHy
 JSW1TcaWQOZF8FX3H8QojPdtPcBbwUyavynx8GXuTBOtGJRJ4R0i4lR1poz0NMuZPoSxOC3wDzt
 PyEnCa1ZIE4MKbcLEj481EOBBbA++T/xyrWhlVIJCz+MEVMl0MXsaPSapnNF9oFce3alzL1EEvs
 UVqFRDYMturZ3Dw7RI1esR1vQIFdRIIKllez86KG/16sID3j6zejfjWV1uMidqxdeUWroO0jri8
 SVy/c6GBMZ0DkPsS8HpEmzu1kKHd76rQdYaTxYYzVyKjwoYz+zi3iDiGrsxdN9KXpvtBlNnN22I
 gJ1FpIS/8X4qXCu8G2ebruZHlkSBfRwkg6TmXcMjrVEMe8WgzohKzpBl1p2qKuyr8XscVb6k7hy
 nJ2w2fq0zH47GzA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
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

The Qualcomm Glymur platform comes with 4 DisplayPort controllers, which
have a different core revision compared to all previous platforms.

Describe them and add the compatible.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d87d47cc7ec3eb757ac192c411000bc50b824c59..9bd9cd5c1e03cc17598b222177b6682bbcd89f0c 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -130,6 +130,14 @@ struct msm_dp_desc {
 	bool wide_bus_supported;
 };
 
+static const struct msm_dp_desc msm_dp_desc_glymur[] = {
+	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
+	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
+	{ .io_start = 0x0af64000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
+	{ .io_start = 0x0af6c000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported = true },
+	{}
+};
+
 static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
 	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
 	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
@@ -187,6 +195,7 @@ static const struct msm_dp_desc msm_dp_desc_x1e80100[] = {
 };
 
 static const struct of_device_id msm_dp_dt_match[] = {
+	{ .compatible = "qcom,glymur-dp", .data = &msm_dp_desc_glymur },
 	{ .compatible = "qcom,sa8775p-dp", .data = &msm_dp_desc_sa8775p },
 	{ .compatible = "qcom,sc7180-dp", .data = &msm_dp_desc_sc7180 },
 	{ .compatible = "qcom,sc7280-dp", .data = &msm_dp_desc_sc7280 },

-- 
2.48.1

