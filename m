Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C71B1788A
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 23:56:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 969D710E2C4;
	Thu, 31 Jul 2025 21:56:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cKbb/AEc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A2AD10E2C4
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 21:56:40 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-3b78d729bb8so177755f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 14:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753998999; x=1754603799; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/y6q5jhYnsLkBnsKrFlWmlkmeeZ+sBL03mECmYcjFMU=;
 b=cKbb/AEc+zlfg5t3ZftH7OksSC9HrrEgR8ckVx4TSay9Tpko0pZXNSc+3Pi/DgfBtG
 qt0BuERlKDli+LYWbhh23zg9h6RTSSqCd9nsIKNUzzC2nKqOtTNcpVlGomU6GOZrXaX7
 beXgp28nkoC+44Vzbx9rEzZQNEqYS5+3P/DcOK4PY8+kFTufFTG6Oro/93M1ueyHYKke
 0KVyv0WgaDRTlwdhhWCo4m30bMXC3+NdC2lYiSivINVOQl0bIUqi/Gv7VM5kJWLDA8Uf
 OTwrzfJIsJiNKJ5LyxiWMqSku6UDBl5kdTQr4LE6HsIvyGk1+e5Jy/X5IQuErT4c7DmJ
 pfZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753998999; x=1754603799;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/y6q5jhYnsLkBnsKrFlWmlkmeeZ+sBL03mECmYcjFMU=;
 b=Z6pZURXIKq87Zz1Fg8zLyGtxCPB8bCuS0lv2dSs0v1zi43e5pyf5Se4z02Qj9eMYPj
 aWMUraxXfDyhGc6GVZv5Aye4RRv9Pe6F3/wdDnYJ6qi210ILtkhriLXa6OH+S0EPh4fD
 8Cyvj7MxPgEYLxUpXNSTExSn73Ry+wtMoO98rbCycAV3epP4Y6d6JsyMFYJkQf0El+AX
 Aa7gy0+GwrFvICNXAK4FhjdmggU4zuXd/xLYpLLQo0hcEHVHF0U2zRs7GPUhPVpCcJxL
 j+AigVDGrcAc24R8wVQDeNL0Arrd8ZrJE8jTlKn1Hhzs/FkrJoD7BjWG0XJFYkX9nmX4
 CNaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmMDUsBNMWr1poKqq5gxevklrmoPy69iqd4RkV62LBxdRgCZUO5qpJ/MVJkMvUKAfxa28T3JiWi8s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxusK9MqKTL3yBgbop8w8yV4tEzhp57uQ9INiSsKPxD85/LH73E
 gK4JcLtmkfftQH4qYgTTHVjvffLE49pa8Kt+7hqHf8F0Lamk0liN+YI=
X-Gm-Gg: ASbGncuBzzwFHRflu6ZuULDwVOVnVM2q+X5/WojAcke4P/e7J7x9dFbvrVoI9AbyYtZ
 2D4hTLDYsfQXaXMYbcTgypneguGRLerJcMuiEw3fNW7Cdibuyil9TtPbvqJlsaMunL8nRWMoDq8
 TfZq13VpR8OnlD5dZmpR34/Y6XsAEtSSfnHyUoZwnbckSJa+HWn+eCkAIV7Ent6y5D/I69c36op
 3u7lTkF0N97hIHJbLGBDxj/3stIKp8Spp9r6up9bwYLWbNcfCIPKxLYTa3Fv+UL8ddOhdeJOGV8
 TExwBFfG+vXaJMs0zJjynoawWjvgVlcTnBOKaZvQSA5sKcek+jFgy9Ocd2BAYylQg0y6skj67lN
 qobWcCBk68H1AeUBHqg7qdCluqXFFKAUl0jnh4ucw
X-Google-Smtp-Source: AGHT+IE1tY/6E/jfgp/CpzL9rt3r5x2G3oGCNcS2F8KmXHu4NjoZ32DkfrrbPshw5F+ilCUo4y7TGg==
X-Received: by 2002:a5d:5f8c:0:b0:3b7:fbe3:66c2 with SMTP id
 ffacd0b85a97d-3b7fbe36a82mr2729336f8f.50.1753998998731; 
 Thu, 31 Jul 2025 14:56:38 -0700 (PDT)
Received: from alex-x1e.localdomain ([84.226.118.249])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4589536abb1sm86622565e9.4.2025.07.31.14.56.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 14:56:38 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/3] dt-bindings: display: panel: samsung,
 atna40cu11: document ATNA40CU11
Date: Thu, 31 Jul 2025 23:55:08 +0200
Message-ID: <20250731215635.206702-2-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250731215635.206702-1-alex.vinarskis@gmail.com>
References: <20250731215635.206702-1-alex.vinarskis@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The Samsung ATNA40CU11 panel is a 14" AMOLED eDP panel. It is
similar to the ATNA33XC20 except that it is larger and has a
different resolution. It is found in some arm64 laptops, eg.
Asus Zenbook A14 UX3407RA.

Raw panel edid:

00 ff ff ff ff ff ff 00 4c 83 9d 41 00 00 00 00
00 20 01 04 b5 1e 13 78 03 cf d1 ae 51 3e b6 23
0b 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 cb fe 40 64 b0 08 38 77 20 08
88 00 2e bd 10 00 00 1b 00 00 00 fd 00 30 78 da
da 42 01 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 fe
00 41 54 4e 41 34 30 43 55 31 31 2d 30 20 01 2a

70 20 79 02 00 20 00 0c 4c 83 00 9d 41 00 00 00
00 00 20 00 21 00 1d b8 0b 6c 07 40 0b 08 07 00
ee ea 50 ec d3 b6 3d 42 0b 01 45 54 40 5e d0 60
18 10 23 78 26 00 09 07 06 03 00 00 00 50 00 00
22 00 14 e7 f3 09 85 3f 0b 63 00 1f 00 07 00 07
07 17 00 07 00 07 00 81 00 1f 73 1a 00 00 03 03
30 78 00 a0 74 02 60 02 78 00 00 00 00 8d e3 05
80 00 e6 06 05 01 74 60 02 00 00 00 00 00 91 90

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 .../devicetree/bindings/display/panel/samsung,atna33xc20.yaml   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
index e36659340ef3..5e2ce200025f 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
@@ -21,6 +21,8 @@ properties:
           - enum:
               # Samsung 13" 3K (2880×1920 pixels) eDP AMOLED panel
               - samsung,atna30dw01
+              # Samsung 14" WQXGA+ (2880x1800 pixels) eDP AMOLED panel
+              - samsung,atna40cu11
               # Samsung 14" WQXGA+ (2880×1800 pixels) eDP AMOLED panel
               - samsung,atna40yk20
               # Samsung 14.5" WQXGA+ (2880x1800 pixels) eDP AMOLED panel
-- 
2.48.1

