Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D76268717B3
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 09:12:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3356C112916;
	Tue,  5 Mar 2024 08:12:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="E5ACIHTI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B6CD112918
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 08:12:24 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-565b434f90aso7694766a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 00:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709626342; x=1710231142; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0Fm6lCHtlVIF1F+K0N/OPMuiMCrX8DVXWnanpZaecTQ=;
 b=E5ACIHTIiKxQeAHY9N+vDLu5ed2WPW/ut6RuHviqoCLOpqySsR39jMJcp0QiT1Rf1V
 HxBnBiLlm3iGj/UJCc3zQbkgoxxyorboiLWCOMKWaFuPiC5SIRizJA93LtHO80roPMV0
 9I+4tyK0SgZoDqpFGQ0ZMMYukheBFiFAq3ayVYGZegzfzMTxEVR4HRno5CpdDCmnlmGm
 SqIAbBdb8d55X3tDZ7gKOL0fGgorVi+gjRHdzgtn+6fGLBSVVUJzkKidpDDoX8wbOzvw
 mc2bVtELn2QFQ5IJpKyZl1OXIQ23cUzZeqmVz/ox/0cbsAEgDokTMM1RdMOfGSnPWC/j
 aJ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709626342; x=1710231142;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0Fm6lCHtlVIF1F+K0N/OPMuiMCrX8DVXWnanpZaecTQ=;
 b=AG6iUdscau2V4TqgZLVM590RdNVLNfwmVkdSBX7nZUSgnFzmvIAOwedCgcrUtBrpyV
 8BtBl6OuEG64u8XrjfI2+1OIw73DY5iKhEP9m9S7PlbjEqE5FHV5Z3YFFVf0onbzYvTb
 9oamcJ0P7QJHADe7+yC3QFUhzVZiRV2lCY7vxUEwumMvx+R3sO8bV+TQcssHM/mTmpVd
 AcUltM92oOHy5eBom0U02k4rv0n0LGcreLs3dOdq7ksGr7S+WjX475yQtKivBW+SrIlR
 ajXjOqgA0qaU8Jc+9TFd3IyNhJ015TkjJM8d8pkxUhC99z/EtI9FYY3KJB1JmVEazjd0
 jNDQ==
X-Gm-Message-State: AOJu0YwbpVGKC4sDqC5DdheaeyGPWDzJMGEmUGOi2IfPYIpgdfmYCQtC
 54slsvTPSCI32cLcliTWwYOfgjgeX8lwfD5hsGGAalYo4XMuFAVzwWfv7pLCzV4=
X-Google-Smtp-Source: AGHT+IFmQXq9OqnAqZ7n+ipcdaFFZ7KEXlOXnYPr+dCB5rotQlp6U8HU8sJNK8HhuEbg+62y8KfoNQ==
X-Received: by 2002:a17:907:367:b0:a43:f020:57ed with SMTP id
 rs7-20020a170907036700b00a43f02057edmr7581833ejb.73.1709626342374; 
 Tue, 05 Mar 2024 00:12:22 -0800 (PST)
Received: from [127.0.1.1] ([178.197.222.97]) by smtp.gmail.com with ESMTPSA id
 cq16-20020a056402221000b005672a346a8fsm2761557edb.57.2024.03.05.00.12.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 00:12:21 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 05 Mar 2024 09:12:01 +0100
Subject: [PATCH v2 6/7] backlight: lm3630a_bl: Simplify probe return on
 gpio request error
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240305-backlight-probe-v2-6-609b0cf24bde@linaro.org>
References: <20240305-backlight-probe-v2-0-609b0cf24bde@linaro.org>
In-Reply-To: <20240305-backlight-probe-v2-0-609b0cf24bde@linaro.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=961;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=YHeoQ29NKf22XZpaybrdYUUdK12wkL0lEB4GhWf8FTY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBl5tPaMO81r5PpyfYzgPlAboOMwxF1eOJg99FdH
 BQsx0i+aJqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZebT2gAKCRDBN2bmhouD
 17VTD/wMe9QVJLWWgoGJhpJgK0qfzqPtG2LHvEiQKHIc9p4TZH6iIk89FjqgbQmllt/sCIdLPzD
 5jCNPAb6QsYi5rBbHw9tXOW/fw/bA1XSeBdKReHR4xtnTd+Lp7ZEMe7thHzzhEXCEW+6AuW5Zh7
 vdcnvZPWJcVUV9QokX7gskQsHOTHg8M9L11ICQnn2kgJqtBvffsN4z7tRx0gFY2BFkV390IFTZa
 hHlBhzDWyYxYAp4I5M7OUld5ga37cX1lmBM8aWaC1lj+UoSNe1XCQPvo2mp/0U+hEZGCkCW9T5c
 d478MV6wl1sAsoVRUq1VmXpOYK8+oi8beiW5SF7YWtT5knT7Z99N/kfc/MPdrN8WqThf+6TE6oN
 Cehjm5fjzjvLxM6INXJn34dwTXkGgagvWLL9SQwrOtTMAx3h/PBIGINvCaOzapuZeDwCS4vfvp5
 CLS7LbPOYq/0XbEwySMM86UcHe7Is6dZHYqDXfMnEuxh5EPQUnDFiYrs01SINbxX5i/N8rT3ovc
 xaTofPHKif7mPAFTVBudQKQb0oQQwo14veJnxVLsXfapCKdnDEjrX4uqhtstonC6F3vNX9w97vX
 5gsi4DlkZSWtsii/UFMd1cohSPSSv9zx8VS2TAbTXmafKMfVKjf5caGdDisNEoGNN96UoujMDcp
 krxxRUqlxMNOQRA==
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

Code can be simpler: return directly when devm_gpiod_get_optional()
failed.

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/video/backlight/lm3630a_bl.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/video/backlight/lm3630a_bl.c b/drivers/video/backlight/lm3630a_bl.c
index 93fd6dbccc28..ac0a60e39e39 100644
--- a/drivers/video/backlight/lm3630a_bl.c
+++ b/drivers/video/backlight/lm3630a_bl.c
@@ -543,10 +543,8 @@ static int lm3630a_probe(struct i2c_client *client)
 
 	pchip->enable_gpio = devm_gpiod_get_optional(&client->dev, "enable",
 						GPIOD_OUT_HIGH);
-	if (IS_ERR(pchip->enable_gpio)) {
-		rval = PTR_ERR(pchip->enable_gpio);
-		return rval;
-	}
+	if (IS_ERR(pchip->enable_gpio))
+		return PTR_ERR(pchip->enable_gpio);
 
 	/* chip initialize */
 	rval = lm3630a_chip_init(pchip);

-- 
2.34.1

