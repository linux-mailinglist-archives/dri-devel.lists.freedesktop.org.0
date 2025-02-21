Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B43A3F85D
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 16:25:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D68010EA97;
	Fri, 21 Feb 2025 15:25:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wnPd1mJv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4058F10EA96
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 15:24:58 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-ab7c4350826so36622066b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 07:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740151497; x=1740756297; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2YV1kRNxec3hf47euA082/GCXKE5VaU0R53exCWfzts=;
 b=wnPd1mJvaXkux8UcOESLMKkHzesnFesmnK1F13vlQhMSk1wm9rGLUkygwJC36DRzK4
 XUVc8Iv51Pp3FOzgf9qEl1VTXD4c63RCCQyE6IBtLSoX1VC8ChJtr8XKnwYhH/GKU8CM
 9V2XTgFcc33vcmBW2cEmzxOKWOmjsgos0dgtHwvoRRL8NYclvPz5AZyfKY/g1h7sPngG
 vsvBFQWwPfyUWvmKXZx8QPzaWoEFD5thA7Lw0o+ecA5ie+3vBhK21hBpU8GK6FN8TEWZ
 wsLIxhKTTd4REhneF2mlh+NizMrdVAKnUZH9wF/pHO2w2FuClhrS6qb+Uj9L5BViRgPz
 wsvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740151497; x=1740756297;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2YV1kRNxec3hf47euA082/GCXKE5VaU0R53exCWfzts=;
 b=vYOOFaKdisI+mM6jQ5uJC/MbT0VclsJr1K4W32Is8afUSyWSzQaHjI/uwnePkohgY4
 cZtKhQoLQcSeEw9SUpKgGYEkLOOpX35Vk0oUJKaOLCRsswfOXhQ03ma1z1US7iSg7Plb
 XvazBsEl5IcKcZfjgvowiXaZmVRC9Y29RMUR2EgbkyArxlTkBznjXRKYEiL6kfiJ+Auo
 UOuRTYFaXHHv+1h20KaL0H4eR9JU9C01JORSDHvP2PVuYqMafkHhxuD1eXzUTUPjEFTj
 VIBsxUgESurVsqmKUmnOeCFqsXX4wy5AaXciWAzOzDS0Cm7ab/6lBygqkoIltr+Q0Jzp
 11xQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlpWWY55BDY/QUgRlQevwGeDgyIVu8qnCCQ6vO6p1BKNlE/sMZ/JxRoZ/nxQwaiTMnkyXnihfPK4E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxp/JiaPeS6knSCA/TKV4kDI6TCXBVd/rJW3H+Sp//n6FoZdWjp
 jgKg7SEnHMF24wC4p3dl7Upvq9Q9a3xOyDleY5SAW0CQ2x0bfmq3T6/Mnz5metQ=
X-Gm-Gg: ASbGnctay2+7okgtLAUMRmS6ANY3rb0ESs4seaXP/fz8hJw5y4Um9HfUt6PCcsQQsBL
 ug+T+NefdGoWS4PoDDpK2ynBmh6twZ2gJfKNFl06RJ7T+Y+iev3yZjXsMjziyxA+SfUrxEdiy6J
 V+MdnnfZiPqHBITSn6qHKf+Xmy8VGJHZCYwTCMSoToCJ7DfnvIi11/FFqR4XxnQXCO0sUfy6gHl
 6N39D9wKZP8djV/1QLuRmtgx7AO3de3UiwQnOqCImlcuENO2I2HBx3OxH3WmW1Bdd1MTk0cgZh/
 e7mOtoId6sBbBPLPTKzHEze0mDnd0fIm4ofpoyKrDKqblqxisNKFvwTo86/D/E2rvbUwl7wVMWu
 J
X-Google-Smtp-Source: AGHT+IFy7EJuGr6YFVXKBajfG+1j7y8/7XeV4koN/V1krFCJVQBIIqPb4EzGvROCXQyRnjjcFYi9VQ==
X-Received: by 2002:a17:907:1c0d:b0:ab7:c28f:de59 with SMTP id
 a640c23a62f3a-abc09d2deb1mr120158266b.13.1740151496644; 
 Fri, 21 Feb 2025 07:24:56 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl.
 [78.11.220.99]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbaa56026fsm865456666b.113.2025.02.21.07.24.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 07:24:56 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 21 Feb 2025 16:24:13 +0100
Subject: [PATCH v3 03/21] dt-bindings: display/msm: dsi-phy-7nm: Add SM8750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-b4-sm8750-display-v3-3-3ea95b1630ea@linaro.org>
References: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
In-Reply-To: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Clark <robdclark@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=918;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=g6ZcIsYl2/jMWfZyQs4pXVAtZzsF1td/uQveud5buEk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnuJquIDPKcX+Rx7v0CVf58SDbQy7/9H36p4/X/
 QyftRnNPe+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7iargAKCRDBN2bmhouD
 16XdD/0T1kAqTkR8/1WysMoQpb12phv708f+gdkkG4acV50G9LWjjqz+b2Ded/v8aPyeo+UTkA2
 /t4MDCbN28qtDRJnlqyQfB/SnUxsBePMyNVKJ8J39/4FhyW0EHHm5aFJTGSoBI0WZYJEjoz2WIN
 ouNcGnvv4jN0SSe0abH0SQMf57qDYiDy09m0gVfxJrXCdlZjFaf1KsCy3gQA7Yj0ZskTbRl9up8
 tOLm2OLtDMa3GdZ8DimxLq9iT0qTzXJETfBaCQwptWuW5LbviyZ3YrTH3gz/afgIrjATO0q1p/h
 I4D3ZbeZokDfAvu+bEmXFeHeym1hu3gbSIaBrjMwheSryMTruJfoYmvmtOM1vUTAVupDGg+DLOg
 zk7pAt8Tn2AeuuFVk2qXVjxR4aJYD6AjTUTToZukc1/xeYSJnG1aIDCdKksNufm2LnKVn5DD9lP
 NRU5esfanBdvwmUvDpivrs6BDEFiLY/eHCHhjOTsVWs63nQ+Gf0aV0kvKVjtnJGZIPwTvhsMlM1
 zi7s72NCqzbxD7dHbeS0LOEf9Sxf9m2EiUvFnJeubyWbIE8KwG0MWnBqnEycbBaXiwBMh2BjTZB
 KUKyfNPhkOIRoWP5Mb+mq+i/786xSoWann2Y9gDp4MPmLVE3estoqc2ZcQUrs4swL9N9zE2aanB
 +pisvvLP96aBSaw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Add DSI PHY v7.0 for Qualcomm SM8750 SoC which is quite different from
previous (SM8650) generation.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 321470435e654f1d569fc54f6a810e3f70fb168c..4ac262d3feb1293c65633f3b804b4f34c518400c 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -23,6 +23,7 @@ properties:
       - qcom,sm8450-dsi-phy-5nm
       - qcom,sm8550-dsi-phy-4nm
       - qcom,sm8650-dsi-phy-4nm
+      - qcom,sm8750-dsi-phy-3nm
 
   reg:
     items:

-- 
2.43.0

