Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4841777529
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 11:59:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0E1B10E0F7;
	Thu, 10 Aug 2023 09:59:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7240710E4B0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 09:59:29 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3fbea14700bso6276375e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 02:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691661568; x=1692266368;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pFjv0YOMmIbvyG8xqF6MV8pbiE5lmY0sXRy/BYvrEBo=;
 b=Ixv+70gHE3pXTx6L1vFwOTkx9NxE+MKxfvU8Gye31lmOvdXqpN5Awm3Ohj4Ide3L5P
 kVHLouP2pqOpQTLtumMbA1pccky5zo1J8O9YkNpQl4PK1ba9YtHItke0tuwuxX+O7T6w
 5PYhicbGlowNDu/SF5iBjzJ1FKidEZMEQiXHB8k2avq3zqTohFlL7lfE7rxEdLiHHUvg
 WwkkU17wMdiGUIGBH2i0x/decbBaTqkwBUzk0x6nhoXxHeAYFp5Wr1DqXzL5ZEPXLXiU
 79PaWkoNQVGHJ9QSQEu8tzNAIiMQG7PETG9Zg4zjMxViDZxXr3zrQASAnuhU/MBVsCrd
 Xc3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691661568; x=1692266368;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pFjv0YOMmIbvyG8xqF6MV8pbiE5lmY0sXRy/BYvrEBo=;
 b=b4odxU5WwdeZwHSooP0hH7ZR1tqI9zoaaX8S4A72ZBmVBlI9rg/2KMJmcvCPuV6XxA
 eeucGqE/ivzD8ZPD1++4mBrQGrwJU/FgVA/Jxb/hKoJF94dnhyxrQM2k1xNpGx5tJIJL
 jm/BxPr+ntI6rI0PUWSCClIp//x/03jl6NBEk/gVFHeGQwuXMMfVofoy2eEH90y5lKVI
 blOHdV+ofdZUTYT/7v16w0kSoBm4PhkNqWZqQqnRBbcPWmn1xTYDZ87RmA6GBdAOFrl/
 89smPZC8FlNpg7NcYe9HilRDf9H0jZplJoRCFQjSJ6kru2330BB3vts58ide+djwzBzO
 M/Ug==
X-Gm-Message-State: AOJu0Yx/EhU609WYUYuLLarhM27x7y1e1rPsVhDPkbLc3EwZC2H7inI4
 X0qfCCgLtUojtnQyUbYgqlFrow==
X-Google-Smtp-Source: AGHT+IGCwl1K+ldtgkSe4CgL2aTR/qcXURd710H4UgjL8wBL0DGcfhLJc5LyBskohd3Gj4g1bUGl5g==
X-Received: by 2002:a05:600c:253:b0:3fe:6f7:60aa with SMTP id
 19-20020a05600c025300b003fe06f760aamr1408658wmj.12.1691661568032; 
 Thu, 10 Aug 2023 02:59:28 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113]) by smtp.gmail.com with ESMTPSA id
 v1-20020adff681000000b00313e2abfb8dsm1610969wrp.92.2023.08.10.02.59.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Aug 2023 02:59:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Qiang Yu <yuq825@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lima@lists.freedesktop.org
Subject: [PATCH 2/2] drm/lima: fix Wvoid-pointer-to-enum-cast warning
Date: Thu, 10 Aug 2023 11:59:23 +0200
Message-Id: <20230810095923.123388-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810095923.123388-1-krzysztof.kozlowski@linaro.org>
References: <20230810095923.123388-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andi Shyti <andi.shyti@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

'id' is an enum, thus cast of pointer on 64-bit compile test with W=1
causes:

  lima_drv.c:387:13: error: cast to smaller integer type 'enum lima_gpu_id' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/lima/lima_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lima_drv.c
index 10fd9154cc46..884181708de8 100644
--- a/drivers/gpu/drm/lima/lima_drv.c
+++ b/drivers/gpu/drm/lima/lima_drv.c
@@ -384,7 +384,7 @@ static int lima_pdev_probe(struct platform_device *pdev)
 	}
 
 	ldev->dev = &pdev->dev;
-	ldev->id = (enum lima_gpu_id)of_device_get_match_data(&pdev->dev);
+	ldev->id = (uintptr_t)of_device_get_match_data(&pdev->dev);
 
 	platform_set_drvdata(pdev, ldev);
 
-- 
2.34.1

