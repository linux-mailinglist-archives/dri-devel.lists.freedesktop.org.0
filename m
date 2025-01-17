Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 849E1A14910
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 06:05:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01C9B10EA4A;
	Fri, 17 Jan 2025 05:05:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="vuoR90O+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12EA610EA4A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 05:05:41 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2165448243fso38409035ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 21:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1737090281; x=1737695081; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/4ePeYcN434CLaylzSV66qRhHXhWDJvP3PT0WC2jlSI=;
 b=vuoR90O+1njtYh7Llcrklh8PNy6SpCzQpUGS0Qqx232fUH1bExlRahXWMxgU05j17f
 gZ/ZG56hC+WNWfa/XzaO03WwfU3fdOyKr2ayxEEYJ14qnLhwnb93RKhUz//lv4wm4UgW
 hwYeC+lu5F11pPwK8DIL+7+7ERvWouDpRqSR0f5Rmxtrz4iy//WiiDDxPMxUL1Cv/PqT
 UJdfuE3vtucE6zRQA0GtuqX0IXP7JEhhdHuDOOTs4/RAF3I+WUSYzvK0TY+W28TSVOzK
 MUcWx0sVtxiyxFw85KwMs9rssPWB2qoROL4epMBDsEKOPe0d/Bf7xUm6nbO8QSWxwJ4f
 2VrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737090281; x=1737695081;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/4ePeYcN434CLaylzSV66qRhHXhWDJvP3PT0WC2jlSI=;
 b=w38u7Tcevcok9MPx+rY22LcdoRZ3HXBT429zdHt+S6EZpjM4gowpyztt6KqfUQ23pB
 XMSpAjXiBTTTDM9VtwFFE7gkobbUaVFyRcvtzW3CJpVF20VxXE4/zFhXIF5uFJCsTGM8
 8McbBR5HJOkBOy3i8Xn3hpM2PS9jrZws7EXBCqEqhpuzYO8qBzBXUc5ivMfsE6omP6Rf
 Tn9dE68tLW/4tM2c6TPIHHMpBP+9tsg5Utcf27/wa9IBaLqXSYOVMKpyey//bULatU6F
 GUj8IBX70Ry9jYZoxjfpMuwu+mNzocbfC+CnR74rIVnHa05Abrbnce6dsHCgBrCzL60s
 rYnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRmqUwvreswyXoHvA3Up1EXoBayjbRId1feTbMSQ3CTpVpSRCgP4K51XYHAsCzbfFq5KBR9AW9cZ0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyq2NRCBq0JoDDQPBUHN0OBkUA3lrd5iAQC2u/uJvbt0GHBafCv
 Ho5aWRXIzGhpX+LIFLM8WSmdVHiA5x263GTkOPaTxf3IIhPLq25pGPqY5tljcAKoM4/lNR6Te7c
 J
X-Gm-Gg: ASbGncs75bq3JSgE5LP5HPomghGYb6I5nvb7HKKo+QVcykUEQfK7JxpE4Rf741B9tH2
 YiNxI2TwHjovZRRUGgxxNLV3/JwjU4wKa1+qhJg3RN/I9FyPHrjqhRs/NdQGY9vIFlL+xetqsoT
 +X9Ws9dMQg/rRcF2B/8RjDLKc9ZMUlXcPrFUlpFZUgwEjCwFq37UWKPmm9gcKC8F3YWLkRbOPLT
 G6oezqFTQZpQpazx0U/FgRcC87Mv+uYcPITupkrDTALihkOWPrdovTUhzka0eGGE3zbi6xYOjiM
 s+lAF+W33jVQS6V3mJpu/v5KzJO9
X-Google-Smtp-Source: AGHT+IGEqIhzpwYphXCTBsJIWLk7lTuO2EadhL79KZEolQvGUF6PJBddhpz/nyLjiAPwm1N+/V5dsA==
X-Received: by 2002:a17:903:41c5:b0:212:63db:bb15 with SMTP id
 d9443c01a7336-21c355eec18mr24112535ad.38.1737090280764; 
 Thu, 16 Jan 2025 21:04:40 -0800 (PST)
Received: from dgp100339560-01.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-a9bcdcf6154sm753708a12.33.2025.01.16.21.04.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 21:04:40 -0800 (PST)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH v2 1/4] dt-bindings: display: panel: Add compatible for
 KINGDISPLAY KD110N11-51IE
Date: Fri, 17 Jan 2025 13:04:33 +0800
Message-Id: <20250117050433.934184-1-yelangyan@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
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

The KINGDISPLAY KD110N11-51IE is a 10.95" WUXGA TFT LCD panel,
which fits in nicely with the existing panel-boe-tv101wum-nl6
driver. Hence, we add a new compatible with panel specific config.

Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
---
 .../devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
index 7a9f49e40e75..c771f517952d 100644
--- a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
+++ b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
@@ -34,6 +34,8 @@ properties:
       - starry,2081101qfh032011-53g
         # STARRY ili9882t 10.51" WUXGA TFT LCD panel
       - starry,ili9882t
+        # KINGDISPLAY KD110N11-51IE 10.95" WUXGA TFT LCD panel
+      - kingdisplay,kd110n11-51ie
 
   reg:
     maxItems: 1
-- 
2.34.1

