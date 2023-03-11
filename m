Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69ACB6B5F16
	for <lists+dri-devel@lfdr.de>; Sat, 11 Mar 2023 18:36:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA69D10E29C;
	Sat, 11 Mar 2023 17:36:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD90910E197
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Mar 2023 17:36:02 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id cn21so2853588edb.0
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Mar 2023 09:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678556161;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4SdFkCAcFYqQLXuQPZJF9uuUIlYRjbN5Fnk2tHbR0J8=;
 b=nca4nmWy7yHFMhDtV3c+p/Kye64HqiZQuzZIXlLLzjri/qA6FSvaLyfCYSlKh3GCuk
 BLGlxDwoiuDwDLgIXFYWi4QQOT6fsTUT9h9nJnarMgheiTCTlQDvKfNwDYC8eLfrWmDF
 BbXu7JEEuwW1m3w6tk2DCDKSnImHgssZDSECgzHDGyGmQjU/xlGj0nS2Ojer3sFAX35+
 B0YtRFHG7Zov4jJRXj8MU308l+XRztSSV3+zHCxQPqqk0t5FHG5bQJFpTO2gPGRM0PkU
 npOPbc0IAAKbsFEv+XxwK+Lj/azJqSz+uk77N/qyeHmyhQdnn1qndci4TL7dWrKirSYQ
 BiwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678556161;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4SdFkCAcFYqQLXuQPZJF9uuUIlYRjbN5Fnk2tHbR0J8=;
 b=LKweG05T6FvsEBV5EVULuA8N4JfvVLADR+pHWfaSxCFxyUTvM+jiSFcrU6nBsF9ZWD
 ZISk3E/sAUcVfNJffWaKaPFV4EYQGZoCst8HcXQO7MXJl9feJrA8zkxcQ7Hag6Ri0CLY
 ji87quIBPNUb0Tqe+4j+UZAI1f8o0e4QqspONcT/hLaq6kiGuDylEze/JCxFUBnqC6MG
 WiUrJrj7Jb+ueM+8fvcwyihqRxawHNaZ6OeIVA6u3MIgLV17707RbOCGxCqSg1+5bjFW
 FWA9KA8wDX++Paqw49bS44ZXlhGlE6gTfQtZcnLyAjIOrfGtcf0RUQTubQEy+rxFj9gc
 2vRQ==
X-Gm-Message-State: AO0yUKXaYvkILRJkJdduJb43BUG4nvKnf786r4tLVNfN+BBGctGmZ+CA
 cveP4ZmCS3OAn1Mz78MpwIYt2w==
X-Google-Smtp-Source: AK7set86+WXFwkkusoMVVsyn8I7uNiBN0R7q/0pN4r39ds7FYdWwNeye1wjlNOjhatU/gopp2H8RKw==
X-Received: by 2002:a17:907:3e91:b0:8b2:b711:5e62 with SMTP id
 hs17-20020a1709073e9100b008b2b7115e62mr34928132ejc.52.1678556161242; 
 Sat, 11 Mar 2023 09:36:01 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:6927:e94d:fc63:9d6e])
 by smtp.gmail.com with ESMTPSA id
 o26-20020a1709061b1a00b009240a577b38sm245423ejg.14.2023.03.11.09.36.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Mar 2023 09:36:00 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] backlight: arcxcnn_bl: drop of_match_ptr for ID table
Date: Sat, 11 Mar 2023 18:35:56 +0100
Message-Id: <20230311173556.263086-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230311173556.263086-1-krzysztof.kozlowski@linaro.org>
References: <20230311173556.263086-1-krzysztof.kozlowski@linaro.org>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver will match mostly by DT table (even thought there is regular
ID table) so there is little benefit in of_match_ptr (this also allows
ACPI matching via PRP0001, even though it might not be relevant here).

  drivers/video/backlight/arcxcnn_bl.c:378:34: error: ‘arcxcnn_dt_ids’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/video/backlight/arcxcnn_bl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/backlight/arcxcnn_bl.c b/drivers/video/backlight/arcxcnn_bl.c
index e610d7a1d13d..088bcca547dd 100644
--- a/drivers/video/backlight/arcxcnn_bl.c
+++ b/drivers/video/backlight/arcxcnn_bl.c
@@ -390,7 +390,7 @@ MODULE_DEVICE_TABLE(i2c, arcxcnn_ids);
 static struct i2c_driver arcxcnn_driver = {
 	.driver = {
 		.name = "arcxcnn_bl",
-		.of_match_table = of_match_ptr(arcxcnn_dt_ids),
+		.of_match_table = arcxcnn_dt_ids,
 	},
 	.probe_new = arcxcnn_probe,
 	.remove = arcxcnn_remove,
-- 
2.34.1

