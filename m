Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1964892D5D
	for <lists+dri-devel@lfdr.de>; Sat, 30 Mar 2024 21:57:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5681410E3AD;
	Sat, 30 Mar 2024 20:57:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ss9cfKqO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA33610E2C4
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 20:57:29 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4155c1727ceso2709005e9.1
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 13:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711832248; x=1712437048; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gOcnmbZfU1ZiQoZSbx6LjXgQfqNdNpX1u85iKsWkJ+o=;
 b=ss9cfKqOZbD176vk0CWB/IIk7V0/BxkCX4W224f26qlCkYjAURxt0IzG+yFe4NVIGN
 xBDjv+kYELjEqo9vGSmdca6FN8PDj9qkTb8tT9dyc2QM7jczkMPO5QY6xIZjNcDmkVyX
 ekNItfPbQn/EqymjoBWNcUxJGKVqJ49qj30Tn8VOT8AnCqT+PjgbKeLOsVAxbWhKopaH
 Ts7bMqCGKYvZIBLE2r6MAEuRZAiM60hATBRBhqK7TiyG5rWx/cuo97OwgVXhUPIrRrTl
 VZ2uFPCANhpCWvLAjXqu7alciS2g7Q1W/X8QxJNly0W112/DCWHJ6xmi1H4kt8dL3fCY
 EtWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711832248; x=1712437048;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gOcnmbZfU1ZiQoZSbx6LjXgQfqNdNpX1u85iKsWkJ+o=;
 b=TyiYlO1Q6eBRAzWB2DsMndeVKWMw91wJzwKCNOg4RQZmCXdGgl6CGy7QSGkFoXlVcV
 BH67OHBguPRnyFItIvLZzgdaKcLxnnuChxOV6e+MAMBS4edcnPC05+do7+T2J78b0pkU
 HkqZuUAINOYGRbcekxpuJWyHesrlcyGA9IuELS9SMqdym/zBzUuHSwUeC+bwvS96rEeZ
 yeuSRP5zJLawyVFOuMYzjXVUqWoV3CKr+57YjjnVZbHgBfo2MBsMEqmhAJ+s0YkJ+FuN
 6+l60oeXB7HLqiggrjP8rZ/2s0Q/UQGMVABfnmVawBawks+UvC9W7zKmDrTJatlFsFGs
 X0GA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpLYxrzPgpaV9JajFFT2RLTXcZABblRWRJMhhuBy7cajbdh+SilhaPv435JQfYSHjcZF3yjrmvlZe6cZru/uKPwFYSFf8HvqMtUmO7fh/W
X-Gm-Message-State: AOJu0YwReIHB8DOI3SYhPBF9q2blhfxKn6Owpteb7FQmsdKiCmEiwHAr
 NGtQlYMq3+ls7BI5K3r1+xIqnlvzBvUf5KKNK3JNlFjcu1jdn7uM9zvgzB5BT30=
X-Google-Smtp-Source: AGHT+IEacBpcrAN0Ls7+iM21Siwj/4TlxwR/SuY/ASdUZKiHFJIkasN4tmpfSt6yVMGmanK2stqDnQ==
X-Received: by 2002:a05:600c:558c:b0:415:55a8:e1a6 with SMTP id
 jp12-20020a05600c558c00b0041555a8e1a6mr2208719wmb.4.1711832247884; 
 Sat, 30 Mar 2024 13:57:27 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16]) by smtp.gmail.com with ESMTPSA id
 f11-20020a05600c4e8b00b004154e48bcdesm6295786wmq.14.2024.03.30.13.57.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 13:57:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alain Volmat <alain.volmat@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 5/6] drm/sti: hdmi: drop driver owner assignment
Date: Sat, 30 Mar 2024 21:57:21 +0100
Message-Id: <20240330205722.93801-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240330203831.87003-1-krzysztof.kozlowski@linaro.org>
References: <20240330203831.87003-1-krzysztof.kozlowski@linaro.org>
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

Core in platform_driver_register() already sets the .owner, so driver
does not need to.  Whatever is set here will be anyway overwritten by
main driver calling platform_driver_register().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

I forgot two drivers.
 drivers/gpu/drm/sti/sti_hdmi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
index 500936d5743c..b0d84440a87b 100644
--- a/drivers/gpu/drm/sti/sti_hdmi.c
+++ b/drivers/gpu/drm/sti/sti_hdmi.c
@@ -1485,7 +1485,6 @@ static void sti_hdmi_remove(struct platform_device *pdev)
 struct platform_driver sti_hdmi_driver = {
 	.driver = {
 		.name = "sti-hdmi",
-		.owner = THIS_MODULE,
 		.of_match_table = hdmi_of_match,
 	},
 	.probe = sti_hdmi_probe,
-- 
2.34.1

