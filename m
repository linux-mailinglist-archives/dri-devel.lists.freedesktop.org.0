Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DD385111D
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 11:37:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B31110EC0A;
	Mon, 12 Feb 2024 10:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SnlZTQC4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 579F710EC92
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 10:37:42 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-3392b12dd21so1852058f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 02:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707734261; x=1708339061; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=l//IawktcLxFuHTi9Dw1EphxGuzZkjg0PydJszp+tyk=;
 b=SnlZTQC4ApwjajBEnknWK7oUYh/iAaWNaokRLOIoBOQhM2328QjyBzbwsTSIwmFZjx
 gcpHQfOVhm6zN3AgzbhRWbpGf23MlYIFIbX9DG0Gc2aL0FAu6a4K7l3CfjhmXQMdjX5k
 OPsvxXKV1MYs2w4nM58AV7aaaF2GtjfTKDB4ayKFuJeIZBGrSVdFqybHcMxlUeTkWXMr
 cVBGazfM3gu2bOH0NZOScwh+zyTdwQ4vwWnXxQ2SiM1xGpYggwMv7XcjPZ2OZRKML368
 TWfl4NQzBqpzxATcqHiVyPeEXhMbr+zxEK3y4Vwadk8E2pQ4pNqQxaEuBciwNGIDChlP
 QyoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707734261; x=1708339061;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l//IawktcLxFuHTi9Dw1EphxGuzZkjg0PydJszp+tyk=;
 b=oOS4uwRyp/eb6H6rRMNs8f1k3SRI5ouml4FAw0Z9uMMKjo+FCG6YlclHHOnb108gP6
 89T6S+Ihs8JEgxdelJ8Xuek9SYr3nuzKN5KFjnjfuWs3Qb6nP/ClPx87q8ZPJ8LjtO4K
 98n/17JIM8u5q+Zlxz3PCBpewpDJ759j//YD4VXGFOv6bf7hjNMeeQMJUcc4vkMwlDUa
 ItXc8eAMfP7yD28SRrri8me0uDbh/tvJ0YSDc/q36cd0aax1rp3FCvr9G+1PBYAc9qPE
 gZNkAeiSs++vK1D04c6S00ltU4QdE5Cn20Bdp12X5ox9hd67LZwybNEYsLkaaECcY7mz
 4uMQ==
X-Gm-Message-State: AOJu0Yy1pl0xUAdQXOe8uX/x/lWWzzfZG0zlq5NhQV565qBkLOdjPxXB
 KXqbxXQB9TUXKvYJHQD8oxGve8RVKNE3b1qf6f7ID4myx0XbQR+3WK+eo2D3V8A=
X-Google-Smtp-Source: AGHT+IFS1kyaqi59Sq4sbHwfhZaM4vSRVkJasewtYqg3ymYFV2vzhk7HV8qNF7o623nwigY+UtksMA==
X-Received: by 2002:a5d:668e:0:b0:33b:86b2:4753 with SMTP id
 l14-20020a5d668e000000b0033b86b24753mr831543wru.60.1707734260790; 
 Mon, 12 Feb 2024 02:37:40 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX5Z5e4thGVZ0XYwT5oUWLMWlGYOu4APYzF3QKbdm7cECar9GGsjlAzte7P08Ri4/Nn7Cymp9eVCOh3C0iM8t8sQA+x2QF472Qii3VkM5BZRkHaS5+idmhPqorNkyPca7/dokY56hh3cW9QH+affoY6sqqE+sy4ZTfPTCRr7x8yj0u0TDgvwkoPoe9uRtMfAo3fLBNKMOOucukvRB88MEPsaM2U9qkWKrklGjxqzg839GZKhf9PeBsW39klP3bGoXgNan784l37hEfUYXWN88AXncxzGd9RbnBAtDxCbyYtMj2o7xgnD77DpN8wXDd0I0V7ezIiaPrwMhHuk91UvvI2zX7vNFVZ5KJlaqxCc10ab0r3jXjyP2CatdRdcR4QXlrdcYhcSWfQHOGY7NGBhd30qjx+ZcDG3WWVX4wyCehuZAXRfPWoC8mSiNTaAC4a3PEGmqCvvpe6QfEz23CZH35Okp1XlhjwvZTh9bUKeoMC8GGSDUKFvVXz5WPRap9FqlnO4bUhX9ZciZybn14pipxd6XsMoUV3N8UFgi3xf2OGTmwz0CKjr10T2vAn1zIXCIFPY9IR6dDoUFR1oBOWCzdLdA5jbfPggzTiLAQZZM+BIo8kGmbQpBRbMrpXwqpZfOPEWIIvE42p2rEgfpUO/ZGMWxjVS0Gt1mVk93uH5qiz/2PA8eFTkGNd6z5wWlTmg7ZGpRlr+jZ3Iy5peqMPZw/Kiw8M20DPDxngPysjIqDCcPzSQrCfx1RZc6VecOQ6aCFA1UftMv42RRrtHBm7QytkQXwwLrcyx0WWlBoonrjOkWDRvXcppFqRXB1pb+DtA4trqj64DMwnfP6EAVqyNpH8URbBgFXRuSx2zDM=
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a056000128e00b0033b50e0d493sm6404188wrx.59.2024.02.12.02.37.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Feb 2024 02:37:40 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 12 Feb 2024 11:37:34 +0100
Subject: [PATCH 5/5] arm64: dts: qcom: sm8650-qrd: enable GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240212-topic-sm8650-gpu-v1-5-708a40b747b5@linaro.org>
References: <20240212-topic-sm8650-gpu-v1-0-708a40b747b5@linaro.org>
In-Reply-To: <20240212-topic-sm8650-gpu-v1-0-708a40b747b5@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=664;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=jW5Pmwyiyt0EctipedoZYrVc+M07RjmnZ7TahgJiz1g=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlyfTtC1eUyCpWXSGg3HNlUKaNEUr0nG03anA/hgKO
 zzX5WziJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZcn07QAKCRB33NvayMhJ0YhQD/
 407ifGaKrAuCPyeCKqQoExWof/bYBnZb7brk6gA8IEiOOYGEuz70ujEGHlzTeaLZc3ORR/yWTdvBwQ
 GoXmFU5en+1QE5XV812SeJNRhBtbuaMjhZzeUAngg9BBtoUbFpngPdCWhusklV3TwBu/KDrTKKARvR
 BA7HG03dGnjLQreVxrpOBG4Q4bQ8Tfy0wZfTeWwsIxSIlCXsmePc5IlmjBc5vk+znBf4kQL5GkeQ0H
 rXINYSrd9Ksjku5909Z3tqy02GqLo5MlOy8hQsDATRBlIvhOgAR1t1/LO/TDvz1bzn8DoOdt/0h832
 YbZG2PwbufXXkbc4Yd2QjMmusDDJemVCZMjXv/pfDk3BheHfJ73yxsdZfTxF1JDHGLYkIaGuKH7LIg
 2PtTPW82HYUyJHosfS9L0jal22AD9Z+HNu0PJ5v7Lrsg2LxlnI+wlJOCnNnrIjL8h9s575rowHRTvQ
 KOcDb6uuuCBjTS3fdkFerDcpL1dRIpbOGip9JQCvqMDntIpIvJ06uT7lngPi9BXbDk2fMbTGoiZw0Y
 Ar8yy60DLKinoFOM6xeU7sJNT+L6INUEK6HB8CiLnj2q9W1Xn8MXxVw3nepfNU81YqC5RmWwnrRZHi
 bcr9xiE0wYBuuYyrBdc9cMSplxLv6rflu+Pr068oYIWQeeKnUHV3GgT2aL9Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

Add path of the GPU firmware for the SM8650-QRD board

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
index 8515498553bf..7151f3dc67c4 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
@@ -525,6 +525,14 @@ &ipa {
 	status = "okay";
 };
 
+&gpu {
+	status = "okay";
+
+	zap-shader {
+		firmware-name = "qcom/sm8650/gen70900_zap.mbn";
+	};
+};
+
 &mdss {
 	status = "okay";
 };

-- 
2.34.1

