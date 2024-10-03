Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B8B98F099
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 15:39:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EACB10E35E;
	Thu,  3 Oct 2024 13:39:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mJH6eAaA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FF9410E35E
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 13:39:11 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-42cddc969daso1439325e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Oct 2024 06:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727962749; x=1728567549; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LpHq/J3IDjcJ8gOiWjTgx9yKmnZmG2Gq7uWBdxkjTTQ=;
 b=mJH6eAaABCjHrwtdRIZTpUv43uuIOlGM+Xsi/6IUYCevPPSE4H3e3tvDnwRiL/uA9T
 HUDf3BDohKH/78+IqpegEmJFqXVbFdRctgk+XKycN0fE+TLYxvYkzy+MUU3uShfJmCUX
 9kMRxIE2GZ1yH5H1QZ0qAHxFtIH8PzFLE/X/HdPHQmwcCttPbAhnbs6AF8XYzpBPwuHB
 OGcFJCjY+2/q28Ta2Y1WmVFdi3CH8hTdy+9xPFidu+ovug+yEhmmmiHGfGGfSZXsUk3e
 zZWgi++Ird1xbDA27YfaUuhPwuVyMWnRejCqJmODXLvCiGDZgHFsdqeCEK/bbFqZy0rS
 GJ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727962749; x=1728567549;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LpHq/J3IDjcJ8gOiWjTgx9yKmnZmG2Gq7uWBdxkjTTQ=;
 b=xRS/Rw3VDfQ4g5ou1sdbeI0D6OMPv9rB8dEhNNr2zdP/w3q5EOrtEAlKZ8ry1ynFHt
 t4HJMEC7xDGEXhgD7uoSz9SFeD5MtBpc6kTdBi6cl+sCur1ntQ7B3WSv0BTDGDCRJdsW
 4n9ODEPsqE32tlox/TRj4/e1m9gu1egWngnLFdhj+7eGpM1a+bMEmzBHeHNfSYJ23+Kx
 R6LOVaNXpn3MMMJ1F2kyRfJQICmm2mkp7xCTFILXQLgRrI4xfXuRFxnHU6S2RywuhKEA
 XnDeqhYmqQPijZypqE40E6bNN0E008pLyHw79eHTQz9i8FpLfDsdBmSB/3Xs4GJQqOEI
 dsRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3Zb5wMjtIL2mucUi6/HgOxagWnbt9L3PToM2gV2Z5dRate/KcC/tamRRkPGIL1LeEz8f2x9XnqPQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEF8+u3JBlG9qUmIrRyEVLSLue/jn15aTgEdieKRIYKxZPtXkS
 WruBJrg0H2BQo8F1zdktW1da0EMOG+LXKjqf3e1mpCpnElgUhVL0UCTqx0m+fJQ=
X-Google-Smtp-Source: AGHT+IFWTXK0ViIYWsLrZXvGf6PeZh68dHrkAm4tox/WVbjEwPOH8BVhinIYArqYc8wFTmujgq+B0Q==
X-Received: by 2002:a05:600c:4f06:b0:42c:aeee:e603 with SMTP id
 5b1f17b1804b1-42f778f3858mr24685985e9.7.1727962749567; 
 Thu, 03 Oct 2024 06:39:09 -0700 (PDT)
Received: from krzk-bin.. ([178.197.211.167]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42f8025b583sm15906875e9.12.2024.10.03.06.39.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 06:39:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] drm/bridge: tc358768: switch to bus-width
Date: Thu,  3 Oct 2024 15:39:04 +0200
Message-ID: <20241003133904.69244-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241003133904.69244-1-krzysztof.kozlowski@linaro.org>
References: <20241003133904.69244-1-krzysztof.kozlowski@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

"data-lines" property is way too similar to "data-lanes".  It is also
duplicating "bus-width" from video-interfaces.yaml schema.  "data-lines"
was deprecated in the bindings and "bus-width" is preferred, so parse it
instead while keeping things backwards compatible.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/bridge/tc358768.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
index 0e8813278a2f..fc96fa5aab54 100644
--- a/drivers/gpu/drm/bridge/tc358768.c
+++ b/drivers/gpu/drm/bridge/tc358768.c
@@ -443,7 +443,9 @@ static int tc358768_dsi_host_attach(struct mipi_dsi_host *host,
 	ret = -EINVAL;
 	ep = of_graph_get_endpoint_by_regs(host->dev->of_node, 0, 0);
 	if (ep) {
-		ret = of_property_read_u32(ep, "data-lines", &priv->pd_lines);
+		ret = of_property_read_u32(ep, "bus-width", &priv->pd_lines);
+		if (ret)
+			ret = of_property_read_u32(ep, "data-lines", &priv->pd_lines);
 
 		of_node_put(ep);
 	}
-- 
2.43.0

