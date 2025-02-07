Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26163A2C0EA
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 11:50:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6466410EAB6;
	Fri,  7 Feb 2025 10:50:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pumSJnkr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 927E010EAB1
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 10:50:45 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-38dcab4b0e1so412044f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2025 02:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738925444; x=1739530244; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=va1zoX8mtnqXVu53ncI+bFuzSEXb1z3Cq8WHUrR/Cog=;
 b=pumSJnkrLplWswujKXsBnAUywm/3hF7E4bM4phr/jWh56LRP4Rl2C5BVvoXmhf8oOZ
 JrfaepHlWk1VwCKmoEfx7H9spD8t5M5YgoLhW/EZKVJ7Kp/4BpbNVwNfaS/FasqMyou6
 Ezj9QZumSbJwbnYu1ZLiJv0hG/r4WGQJJZc/7GlanYrYRC9woA+Z1rbRFMWi4ixr/mLc
 O3fdLmY8BIxK2Ft4JJ30nxrBuHtFiA0vfQa1OjXO/I97hH8dBF81QrtyckRB/Vue9y3S
 jHpOv75EOgt4M6vbKN3C5SB06n04Bd9Pa5EZKbHozsTnjGPpfoJgPSfUQYVJN+2dtAOf
 RRow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738925444; x=1739530244;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=va1zoX8mtnqXVu53ncI+bFuzSEXb1z3Cq8WHUrR/Cog=;
 b=GB2Yl0zeu3JTJai9b6VdTfl3qO2vx4XEVml+8cycAQICh9Ato7u1JdwhuuXHD3ShVY
 5q5UxfRZ18QK6Fheu7dHT7q6eDN3H3LZHiqgIbbBNBTqRy4cW1TyZKhR4dGyf5yhzsVj
 zVEcaKb7cuHOeFXLj0+kxG2cpSJ52jZURzKKrhVaCSFxgCjBWeVTtgyJ1a7tvH+qHWis
 3kdDoUJd5Ohe4f5JH1YR7WMud0UoWLabKiaK0G+N5QqJ6KiuiWGgvjH2hwRUce7flM69
 DFET32S6XjgJMRIgYL8NJYCme8adSN1kYBTpwYlV4Hchy6Fk3rLI6w2Sp7g+MiI1wHFr
 iV1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0WhXz3Hp4f5ZBsrLtd8L7h3sXVLfR5KlXKt7YQhKVN2s08/rjxjNR66E0kBQtB1nlb9mpEStjtmg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxdkn5F1KM6R7rDhv1jmRx6xjI5UMoEoM/0W1wMjopP+yPokKQd
 VGmaxMNN1QfC8wR2j50nT5k/xCqMfkBtSqSS4fntFqvUHr5yL4R1E+SGNDBoAV8=
X-Gm-Gg: ASbGncubVZzckDH7CuJTk7SFX1G4AzKpsVGvDpNPpRzmE3ZxF6Rgq41ZUZI6oo+QsNE
 mnww3FaBkI0nDY6rTWD6qov3GKevVSE+wJoS5QEmEWxEbHNMaq2is6W0YRjT69ZleRhoEJoGbRt
 Hl4aACiZ6NaQeZRCq2cE/J9MuDWCIJVj9/yCPoLq10zbHrjUxdvZXANKodmUHjc2vM1X4jE7fj/
 omn1bMikdOhObFk7UdPzB+EyQAoxDuKJAdQXXv+7G8arqnOQJdJMmIru8xvoCR0u9DKAjdg+4bT
 HZGnD/e6/eQqw/Hr0Fu4YW+RY8H4BB224Ors
X-Google-Smtp-Source: AGHT+IH0nDMeXu8DQFB/6kIi0idKBW0FDxI3OK8PYJEXcr3iUgCGEvXoxJDBPA0VnCXYsvIwIKwvTw==
X-Received: by 2002:a5d:64c4:0:b0:38d:c56e:f1fd with SMTP id
 ffacd0b85a97d-38dc8db1e7cmr1979122f8f.15.1738925444107; 
 Fri, 07 Feb 2025 02:50:44 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390daf4480sm85968635e9.27.2025.02.07.02.50.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 02:50:43 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 07 Feb 2025 11:50:38 +0100
Subject: [PATCH 2/2] dt-bindings: display: qcom,sm8650-mdss: only document
 the mdp0-mem interconnect path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v1-2-852b1d6aee46@linaro.org>
References: <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v1-0-852b1d6aee46@linaro.org>
In-Reply-To: <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v1-0-852b1d6aee46@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=951;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=lZqVKRzTEdObAW6fXjwuLR5X8ri06xq7SpagYA8tR3A=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnpeWAdfoAyR2ZBdAem7bRneP4BOUAPpgFn20p6tVp
 fmlUIOKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ6XlgAAKCRB33NvayMhJ0eDxEA
 CxBWsrpVjDnUs2AYfGWNgmI+G9lezzka4e/yYhivAyaGnNxzF6tO1nX5o1EhVwXLRc9a3VjGVhe7Q6
 pUF0EFjB2YpohqMsPnb9HxnalBbTGSoFfwuhFu/5rb/pkAJPI20yrQfBSRoDoM7suMjaLgWu1RS85h
 SsNe+ODsPDjzhGV1Vg1zqHZM1HnUAis5WlzTSXJ6jelCvwK61n2aN6xCa2uQ3FNmcLhQ2EOXy82Wus
 x7gqiQyy818Cbr+DoOzI4HC+YFO1Q2VpHVVGWSBfLgukz/BVb3XbF/MLZxHYVK2vp0V1q2euohvPWr
 RE/5VWoBzftcloZf1EiHuMekyZzT5OmXYl9jjNaTckFZ7x6j2SZT1L+BaMH9tYcEzxppxWJB1TUwNR
 KJIT3wjjZPrVTVUzz8t0/a87Ut6ifB8CvIDf1imLap/RiEVGBwBmrNrUpPKs76itGqODmmocm2h5FO
 7hqwXP+N9uqnC1yMTkSsaK6xbfGuI0iav9r/0puk64xggFMNoWmQgxnkgHXwyi5rWc4Dp9UbxIw2QS
 1cIl4o+LHfEQmdXEl5i2MuIxc7MDa/G/Co4jz4ITFeJ7hX5vLXJho+R4nZn11r2HrpWa1W/GHrT+Eo
 PVPYwtZPVxFBbCvPqxyjmbh3axyz2Qg0DF1PH1IpdQDODFySKwZ0f7lkSoyg==
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

The mdp1-mem is not supported on the SM8650 SoCs, so only support a single
mdp0-mem interconnect entry.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
index 24cece1e888bd35f169dc3764966685de4b6da1d..cee581513c519924712c7e0fc055099f886d0a99 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
@@ -29,10 +29,10 @@ properties:
     maxItems: 1
 
   interconnects:
-    maxItems: 2
+    maxItems: 1
 
   interconnect-names:
-    maxItems: 2
+    maxItems: 1
 
 patternProperties:
   "^display-controller@[0-9a-f]+$":

-- 
2.34.1

