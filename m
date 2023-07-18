Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3D27574DD
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 09:02:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADC0110E16C;
	Tue, 18 Jul 2023 07:02:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22C2310E16C
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 07:02:05 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3143ccb0f75so5348827f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 00:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689663723; x=1692255723;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=j6Xn2Nym15wdt3Gsh/k8fd5yRhovhKcNX6yue5YH2mI=;
 b=TOlKrTAIPqpBVjSOj/cJGUbIz3vNQhTgpCINIgJSCL8MJvSQ9PV3IeGkg6b6+5wYiz
 Lb2qqH01mnItGbPN8U2yugo6IudYPwcCe0rfc2mfm0PoDSu7ZF+u+2lAGJfkQhFoUsPm
 sSiuK4eK0x0bbicBTnaciG13WveA1riz83DFCKkFPuWwxCugCGyimGvXgE1RCnL6q9M3
 Ob4wx4mRXQFw/T6PlB94oclisKZFC4oX7Hye7d3/0fveFmRv0FQqqIE0E6oXF6dcYEe2
 Sg3qnWst5fTw6INVAX2d+bLiQGAyn0cg8F+mqORe06eJlHCgsCQ/CzFWe4G6UZpTTthe
 gAHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689663723; x=1692255723;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j6Xn2Nym15wdt3Gsh/k8fd5yRhovhKcNX6yue5YH2mI=;
 b=etJO7bSLRaCINRPcY8ZKqSMb4rLMSKyX+SC1S8/7tgFLJD+d/j8rkk2BZfIaP37P9l
 Q0WnvkAdasQRsJemYKgk919Q38JW9B21O+HzwlJr6eN/jdb47eP0CYjZWrql4roKIncy
 dEK4CJyT7O4dWEgNv5ewsAaCxELpEil1OcdEJJvEOSkkWL67Nh+8fmX5P9XgTmB4kp3Q
 Jz4pCxvXlmmA7+lDa7nObTclrYT+zhXegEmHoP5NrSBSry/98N4ML2+QHdIoSgUv9kkT
 yhEZPZILi6cN/Oy27GQNcQu7btJSRs21mF3Lo7SCT1iTs1t7cFyf0wRDeev+SVnA524+
 eAlQ==
X-Gm-Message-State: ABy/qLZNcp3eN8cvw4U8ihZwcMdZGM5LupnjqRiNDHI8snsJYYDzYLQn
 kyhnIliuPaDUDGvpLFeyDo+Mew==
X-Google-Smtp-Source: APBJJlGlm1EuZA5YRI7QwlUl/G00TjllCRC97QoeQcg9WNYyBUjCyukkqtjh8GS6QPkbAw4Gnqq1iQ==
X-Received: by 2002:a05:6000:90e:b0:314:37ac:c896 with SMTP id
 cw14-20020a056000090e00b0031437acc896mr15110467wrb.44.1689663722952; 
 Tue, 18 Jul 2023 00:02:02 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 i12-20020adffdcc000000b003142e438e8csm1463707wrs.26.2023.07.18.00.02.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jul 2023 00:02:01 -0700 (PDT)
Date: Tue, 18 Jul 2023 10:01:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sui Jingfeng <suijingfeng@loongson.cn>
Subject: [PATCH] drm: loongson: Add a check for lsdc_bo_create() errors
Message-ID: <0da6859b-40cc-4b3e-b8b6-fed157517083@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The lsdc_bo_create() function can fail so add a check for that.

Fixes: f39db26c5428 ("drm: Add kms driver for loongson display controller")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/loongson/lsdc_ttm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/loongson/lsdc_ttm.c b/drivers/gpu/drm/loongson/lsdc_ttm.c
index bb0c8fd43a75..bf79dc55afa4 100644
--- a/drivers/gpu/drm/loongson/lsdc_ttm.c
+++ b/drivers/gpu/drm/loongson/lsdc_ttm.c
@@ -496,6 +496,8 @@ struct lsdc_bo *lsdc_bo_create_kernel_pinned(struct drm_device *ddev,
 	int ret;
 
 	lbo = lsdc_bo_create(ddev, domain, size, true, NULL, NULL);
+	if (IS_ERR(lbo))
+		return ERR_CAST(lbo);
 
 	ret = lsdc_bo_reserve(lbo);
 	if (unlikely(ret)) {
-- 
2.39.2

