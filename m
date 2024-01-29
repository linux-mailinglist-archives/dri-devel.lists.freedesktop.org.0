Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9193E8406B4
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 14:21:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F5E10F07A;
	Mon, 29 Jan 2024 13:20:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBCC010F72F
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 13:20:15 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5102e2ab56eso1864955e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 05:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706534354; x=1707139154; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IWwiTr/qnDAzOyN1ZIeUmWZuI8cqSNjnEru1E8IQTAs=;
 b=twxQo/Zk9Xha+TtFPu4YaHA4LiSVAMIFZ6z+3Nh6P95WA4rDLdOhrPy5pd2hD8bq/3
 7kvXqZbyyy8XmT3mSxjL953g86cctOdCfVCYSTG4q32JePZx+BM5SkIy2UhDrH9VAXAS
 9km0Q/5fRYarRB1yKSeE4Sokl0QhusHVTw9fEYmPiMDiBt7Km3/5ev9GboW0KMgp88aJ
 W0iL9VLnTcOvJnzjHNBGoz7HAdYVteOuIS+y/vLnHT3PNCbbfqCv7ssLrmRL727MMejP
 1S8GeXrVn5Gn3d7hofPij4gj0/6zrFgxp4GfsW+L9vXxg6+pH6xeXb1lpMlZRnaF6TLf
 JQnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706534354; x=1707139154;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IWwiTr/qnDAzOyN1ZIeUmWZuI8cqSNjnEru1E8IQTAs=;
 b=f3Rvbj4F4vkvbj9v8E5t2MtVGKb3JmpAys1qkRR1Hx8s2GfCRxuhLF2yC7Pdx0cc2A
 oQaBRPcF7o5dF/ofeSK9jee+i5OmcTWytnTteGKKJ/oBNvVPuMmT+XZejTIR0M5vnU3o
 HUL3iuZz1Tl1H2NAAjV2ytqFNuuO2Tzph/+lwLYZx3V00ERLQnuUOWY3FysgY1+0OBDa
 rrWQfFInsEK9r3ROpfSbk7OTVX7Rx24oDziS7bjDJ6t1chbGE/g3cA49IzSKMO4UL6TX
 +G82mu7LbbwpiuOEPTdrDYZ5bW/xY5Cr3MmHl0M4p9yzELp23GLnmlSVcqgqjyKxXS6B
 eUHA==
X-Gm-Message-State: AOJu0Yzw+WzcZqXb5fyolpm7ox25WwGgXJZe5qClkKz5C/ELPEc95BSN
 MNWeiHIB9C9FqkWDWr1qArvsMeNBx0GKglBqVQlLSIiHHYhfOGmIeT/bglC5bT8sVIIrQgXTZ80
 a
X-Google-Smtp-Source: AGHT+IFibSkzWPlNZYum7bt73woOcQnisCcMtVsGtkcNtFgHDXqPazyhHfU3ryc8HU16VuNT5kBpIA==
X-Received: by 2002:a05:6512:3241:b0:510:2582:5590 with SMTP id
 c1-20020a056512324100b0051025825590mr2972920lfr.12.1706534354353; 
 Mon, 29 Jan 2024 05:19:14 -0800 (PST)
Received: from [127.0.1.1] ([79.115.23.25]) by smtp.gmail.com with ESMTPSA id
 q15-20020a17090622cf00b00a359afad88dsm1591658eja.10.2024.01.29.05.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jan 2024 05:19:13 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 29 Jan 2024 15:18:57 +0200
Subject: [PATCH 4/5] drm/msm/dp: Try looking for link-frequencies into the
 port@0's endpoint first
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240129-x1e80100-display-v1-4-0d9eb8254df0@linaro.org>
References: <20240129-x1e80100-display-v1-0-0d9eb8254df0@linaro.org>
In-Reply-To: <20240129-x1e80100-display-v1-0-0d9eb8254df0@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1044; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=4NAUUPZm5ur5JuJjuRYW2tY5EYsPBHl/ThB5Q5y9Hf4=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlt6XIM+Gy/wq9U3eInsS2wKTzhV6qPJQrmy9gF
 d0quBpgXMeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZbelyAAKCRAbX0TJAJUV
 VgFaD/9lPl9ej3uDJTPjZl7MlJOKfbL2lTxybs+rMdOroPikktBYVb/nexVm3A202QLAsSvZj1B
 zhJ2Guz7azWmoqXs1Sp8Ec/nad4IECJHOc3iUs73+K+qJRSwU2VbGZuHt9VxcWQxI+qqLwRFtRa
 FHATWGmn9zQd5EHoGXswmnQ7y4K1XSxhl0qDnSJ/TmEzHjV3s07ti/s+VU0UYTfva7dF3LPOH/g
 1XDQExXZzZrEJLIuLVhY3WGFUNKWdfiaK0VQPs6sdmw3KokUZPfM/80G08svBsQf77gv4HHaqw9
 nF/ppWGfKoE33BsRpauJ2eto3ESSAdU7UVH1AMrvrcIhh31f5aVkrbTE+GXDOJWfJSgVv6ui40F
 eBnfTvKPleLgSuWZCdYKtKCP1tyeiJfjy0PE3Co3rNVXt5PpY40SPqkyGnN9UqRS6TElnkDy4WE
 NcTjY/qxOUswEBDLWHU3dSLDxh89CivyCuW5g0yQnXOV+2qAoki/tFRwvPlhmx5q6RDIJUu/F8l
 N6fQmErWFDfrJ7ecbMob9K5etuhoCypH09IRW1nRYQ0mMDncUJEE/lEXFYkuUNhXasi+S9kCBCv
 O07trgD03O/sYWVVBNksV0wadeUSEsUdcM9BPuqC1G+kEu6sk3oqQI4Ur9nyWxD3I03JPe6aZBV
 N9YwAS2fNbPm6OQ==
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Abel Vesa <abel.vesa@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

On platforms where the endpoint used is on port@0, looking for port@1
instead results in just ignoring the max link-frequencies altogether.
Look at port@0 first, then, if not found, look for port@1.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_parser.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index 7032dcc8842b..eec5b8b83f4b 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -97,7 +97,11 @@ static u32 dp_parser_link_frequencies(struct device_node *of_node)
 	u64 frequency = 0;
 	int cnt;
 
-	endpoint = of_graph_get_endpoint_by_regs(of_node, 1, 0); /* port@1 */
+	endpoint = of_graph_get_endpoint_by_regs(of_node, 0, 0); /* port@0 */
+
+	if (!endpoint)
+		endpoint = of_graph_get_endpoint_by_regs(of_node, 1, 0); /* port@1 */
+
 	if (!endpoint)
 		return 0;
 

-- 
2.34.1

