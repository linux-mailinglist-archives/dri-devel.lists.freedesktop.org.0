Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36418B0B620
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 14:30:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A9710E36D;
	Sun, 20 Jul 2025 12:30:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hnDdl3mq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 373ED10E36D
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 12:30:14 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-455f151fe61so1528025e9.0
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 05:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753014612; x=1753619412; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WOmXIHslm007FzsXzToQ9K53LoS29sfzMlaZ0QeflvU=;
 b=hnDdl3mqonmOtIiMie2BoXG9sJNK7T0EUKg8PJe0ZrFUFA2OcfzKor2WLabhrN6AW+
 20YGsxX/ZtzK0Az/BGAqiluZ/or6pRoQ6QFtdY4+OHYrW+96RCOWp45D6iDp8lXhYijn
 eJHVa+QA3guulnVApkIL5plqkrliwlgR2oljt8Q0Ify03RTYb43grAOiDZLD8o3uCiaa
 kexyJ/u04t0InhxZNpTvKEHIBkpWOgFvS8I1/CmAMesLutijXWvuRBLaReqVpB5R9vDz
 x2VBZ0lEPKEjNo1QjDcSVuLi4zy56JGKZpYL7xMGE3/g9Uhi+DZGvJcWpyIddgfoctsa
 hsLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753014612; x=1753619412;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WOmXIHslm007FzsXzToQ9K53LoS29sfzMlaZ0QeflvU=;
 b=YPsXAGdRXyIjF0PeMu7bw77OMJHOqcktUSFLm9msVVIR4sXJORhiHLKmgwr7618EXs
 hSmALKHJZ9cdKdsL4+jmYFdqBw43O1n63bUNXqIxeNKYZx5KW42RpMWJfwMSdTJUQOiq
 Uvqua0AKwigIj8pcWG1DdCYBT7NiLtuwGVII7/RgTz/FtAaAnJH9/dZOoF2K8k1cwPEf
 gwWwH4TnuNUJ+epg3tLXTquRPrYLJCbn6XMQIfbjZro9HKex7J0FBWHMdvW1GYbOZuoh
 ySPZ6frxDHhzaI3F62YrZqJMcCLzFOuNxq549ajlEEAldB6JQfHv4ZlKwsHPF1Gk6YQE
 +ZMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrd2GnH+O++hk+oRFzhzXaylWvV0z2bMzsfEQjCXG/QStZsb0C84nhv4fZCz3Po1F9g9WvveRWm1I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxiSDJMXf1aVTHBQra7V2eBcuMf5atwtMjvepPUsG8lMnWsOYFx
 pnLaxlKBtpuTdlxkFYRFSuJdikYTGd2GawSw+eYLBDViQYP7XsDAzh1l7WANqZ9M7R8=
X-Gm-Gg: ASbGncuE7a9YpRgKeKfnuAdqmkRJnZCTX4xa103zBVgmm73sSS04PBoS+QU5dwwGv7V
 XQH3HeUb2XY8YKAEW78a4s6OXa4ToVcfI/el6ZJbNcTPtTnChInvO+yhuD8O85QXLn99Z7OvOrr
 ng2vPXiJ8DXnVeISzKt7Qy7G0M61FVXOs0bf0Tt+iwYrBJsUjt4U8wbdJ3SLZXNOAaqFDjOPjuS
 utIVUX1cYX+gg+7TMKHz/NWwAd5QgWiwgE40cjM0Am4h6/B/qGXpEtjZTdKVRaWAC748aStQCOP
 ZkYEWoEenTTen62AaaN86OslQwdCf/h9dijgp6cWbIOFvJa4iPxMZNB+8gxkBlbF/B4KY0VzyZw
 20gMXzQrQcVw8zYh0Pd1w48gdT/mC7gUeqC0SEoQL4PU=
X-Google-Smtp-Source: AGHT+IF1jb/t3lMEYkuVgJjgGXy7n6gJqv+86XFthlPcTDAu6sCMAg/ieEjC5qGzPo+xE85GYYxQBw==
X-Received: by 2002:a05:600c:3591:b0:453:9b3:5b70 with SMTP id
 5b1f17b1804b1-4562e23d1ebmr67166885e9.8.1753014612459; 
 Sun, 20 Jul 2025 05:30:12 -0700 (PDT)
Received: from kuoka.. ([178.197.222.89]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e8ab7a1sm131396955e9.34.2025.07.20.05.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jul 2025 05:30:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Kevin Tang <kevin.tang@unisoc.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 stable@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: display: sprd,
 sharkl3-dpu: Fix missing clocks constraints
Date: Sun, 20 Jul 2025 14:30:04 +0200
Message-ID: <20250720123003.37662-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=973;
 i=krzysztof.kozlowski@linaro.org; 
 h=from:subject; bh=lrVr6vyO/GU3pnxEMXTf5/aN2EXpLcZcEs388mBJkEI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBofOFL04wCWPK1JMPYGESdpRjENFrgPOAvPGkpY
 xCwQQkWfu+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaHzhSwAKCRDBN2bmhouD
 1x9WD/0c9aIWe7bwg6zEBRiI80exn32zI0JiolaPNhMaTwhqjLrrmYp3+NdbgjCQCOTVxjRkUdn
 pz5HBCu6MBE7Yi9GVGdAxeZMi51UywuDupAmA7dssM8ZpmdRNQLQn5ExISOj64Dn6rN0BcdVjGT
 xblZd32kRtFzI20IFQNzAiGhTtzMYyO57saKQJDIbKFYuYwxjimgkQFp/muc/aBEID/Ynza9PSO
 /gOyOyjzzV4f0APpL3vQhgg5gRXcLVqpJNl0a5XJ2RCtYlx1HLli3x0FYQxu7aXFDJdfTTHlON8
 ho1hDAFLZyZjQRM6PAs1aVGjYjmLbkonywGjPDGf3P8YkfnMH95XQjTzKtpFwEWHyRQpA8D/XDV
 KdyX2/56W7OuCbfSnYUCPCEygMZr/xk7iUiUaYgX4hXiHwOTlwZ8N7YfEHh86W2rxkwhJKttzrh
 drtPn5x9l0zbzBIGiv1/5wZ741vOqBe26o2gm1Bz/LIuZGo4N+crTHrzbZ6yVYGjIWHoTFG6Sn9
 OGK4XS8F9GoTvSdA1w63RPyBc+nSR8Kw0bfdzUNtbVKXMa1maAUmWrehcrhYNKl7wKsvaGGq7E7
 G9d5SinQagBmL54VEoQYFEydP+u0WVjs+mVjzKYnmjDcskdSRuiK0KO0ShHV1z4Vei6O+yR40g7
 31ylTJUR0XYBl1g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

'minItems' alone does not impose upper bound, unlike 'maxItems' which
implies lower bound.  Add missing clock constraint so the list will have
exact number of items (clocks).

Fixes: 8cae15c60cf0 ("dt-bindings: display: add Unisoc's dpu bindings")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml
index 4ebea60b8c5b..8c52fa0ea5f8 100644
--- a/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml
@@ -25,7 +25,7 @@ properties:
     maxItems: 1
 
   clocks:
-    minItems: 2
+    maxItems: 2
 
   clock-names:
     items:
-- 
2.48.1

