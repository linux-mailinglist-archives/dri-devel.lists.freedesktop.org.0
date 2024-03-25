Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6136D889C15
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 12:10:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FCDF10E793;
	Mon, 25 Mar 2024 11:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="J6WmZemg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6623B10E77F
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 11:09:56 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a46ba938de0so568572066b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 04:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711364994; x=1711969794; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ALpBomvj7h++qduRiPAlY6JUwZx9tyV38eEVHtgwhRk=;
 b=J6WmZemgYHVJuuJPzd2itk7kiaT1kBYK8brPtAz9RP6ELiHbSJnhgDOpgGty1gerVY
 64RKmJQy5wHWlIP6mgp5CMKIMoxpNPbFH7ahDrxXLEwaylcNIgYK2A279XAUy94cm6xA
 zvgCxHVvbVviwpGt4+it3YjIN/Rm8R+tn1kVQAd9eC3UTTlo+79zYNYlKqEyqJCU3Apv
 VyqPl9nVZqpgqocnegpzIxolZNKdJbCoqH5076C9THYLDbSVDdqlPqJ5F0E1fanE++hP
 btLqtIbqxUur5AM9PAdLrw3HNdy+M0jGQNSFKJh5t+IkNuxIPj7JPlzvSLCH+tqyzXbI
 9OUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711364994; x=1711969794;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ALpBomvj7h++qduRiPAlY6JUwZx9tyV38eEVHtgwhRk=;
 b=KZkWQrKAV8/jTxmL7Oq/sVuwYKuyS0pn8y+GqCUHfu8kqzFxZ9+B+55VpNlXDc6IcW
 zWD1CMSvDuh/Te9mIR9SjWQd35fEj5iGpk3ttdO7CDi1gsx44tAB8qi8IOXVLY5uzuSk
 ++F6MVUWs2R7i0j5zLzjg5DW6Z29HrEIhSXYt3pjDmcQtvv0Lvdegqz7G7S6dmEG0FaQ
 afqOVtVy9suiZ0u7aajOyNdfSzMzJwNSjLJ5WNHQLHHPTbCbk6MYQVegIBPazrrYnshl
 W/kG4fVzHqcOXSPsVAU0vLvBh3tLKnMHYrXyjjegd9DpqNXMphc5su4M/yO6gSpiT1ed
 A30Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXijJQ5eZy8zDDXSkf1hTbeNS4jIvLLa57H09iB/p9f7+MkiuOhL/zfSUypAyDdvVTZVkaWUNUcQ9Ac5K1EMJsZzTJwqq1bhiHOE4cKnUjT
X-Gm-Message-State: AOJu0YyPd9C/5tzJ281Ozg1ZxG99AZY3qKzco6Cux/hq5GpV+zLnjZjY
 RBQMw2m/hTwDrubar0K9lszlcSPjS0wd5cnvRzad0cqziEBUGpvh5vVKXUtcYKU=
X-Google-Smtp-Source: AGHT+IHTN6DQHKMcMFkMHcH41yhpPoygiYbtAqR88ncB2YWUNCJzDz7yqSQ1t/HPH6gmW2ko0LDR/w==
X-Received: by 2002:a17:907:a088:b0:a4a:3403:343c with SMTP id
 hu8-20020a170907a08800b00a4a3403343cmr1950743ejc.31.1711364994351; 
 Mon, 25 Mar 2024 04:09:54 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 bw26-20020a170906c1da00b00a4650ec48d0sm2972367ejb.140.2024.03.25.04.09.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 04:09:53 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 25 Mar 2024 12:09:47 +0100
Subject: [PATCH v11 1/7] dt-bindings: arm: amlogic: Document the MNT Reform
 2 CM4 adapter with a BPI-CM4 Module
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240325-amlogic-v6-4-upstream-dsi-ccf-vim3-v11-1-04f55de44604@linaro.org>
References: <20240325-amlogic-v6-4-upstream-dsi-ccf-vim3-v11-0-04f55de44604@linaro.org>
In-Reply-To: <20240325-amlogic-v6-4-upstream-dsi-ccf-vim3-v11-0-04f55de44604@linaro.org>
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Nicolas Belin <nbelin@baylibre.com>, 
 Jagan Teki <jagan@amarulasolutions.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=886;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=N3wP+RQ7VRT4++7kCDqamWluNf4gtoR05YTHGQbChM4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmAVt86XeBshGAsC/W5VtvCbe/DoZodm4H3bJEm+JB
 zIV1/QuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZgFbfAAKCRB33NvayMhJ0WewD/
 0WgBP29RRzC8rjfiULD0LJYiLhZkvw77UYyaHeYHtPBrXItWG3Qk810jaJOq4MZUVGkZyWlhZp0We2
 SJs5rZxZNqNF0JwHDuDfrWgiyn6uWFimoLJli2jnyPadMwHFIqgEHSzf3wVU9igmUC08vVrUwDHPa2
 YM/elkPKAYphEAIz4gNl6OskajHTgRTh24p3dP93sVkKN8LGoeC5+/GpE0ycNHxkD4mo9mGynz92K5
 +p0xwSRUK3WSmNDXQ/AxnZ7/uc/HRNk7PAiR8+Nafic0rf9yElFYpYhmk/Wk2yfJapkPGqH3+friKt
 W3QilPmyYO3nhV6djOApbC/K5i9lBfjxnEPeLw4y1ULfRBsLygDNi79zb1jCTdeAtz6bp4vGVf8WIz
 FPcB7dSdVBqrYMwH+wjZZgZSNoa/JxbyLtboRh8B7K/RgsgtaKxZbnra+cRR479hCii8TOH8qHfR38
 GSJVzS9NPRb5b2fEBZ9+bVUOrRegB6pR6mLue0TjFBAp/cPBBNZmPEvKs/nzURJnoDcoYMJubp4S6J
 J37idTx1I8WMSvIV0fdzbwjskU18g2se3voQgPXhOL6OZxrTEKX+Xzijrsv+Xf0olQ4uPxJibydWF6
 Ui2F7n+val4hewIvamm2jh14mmUTqZfydQ2TbtAooj7fmKrro/ssTPPxzyPg==
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

The MNT Reform 2 CM4 adapter can be populated with any Raspberry Pi CM4
compatible module such as a BPI-CM4 Module, document that.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 949537cea6be..b66b93b8bfd3 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -157,6 +157,7 @@ properties:
         items:
           - enum:
               - bananapi,bpi-cm4io
+              - mntre,reform2-cm4
           - const: bananapi,bpi-cm4
           - const: amlogic,a311d
           - const: amlogic,g12b

-- 
2.34.1

