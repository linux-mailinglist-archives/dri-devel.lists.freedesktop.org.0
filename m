Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A4AABAAAA
	for <lists+dri-devel@lfdr.de>; Sat, 17 May 2025 16:22:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBAA710E181;
	Sat, 17 May 2025 14:22:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dJ8/DF1S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
 [209.85.217.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EBE710E181;
 Sat, 17 May 2025 14:22:07 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id
 ada2fe7eead31-4c34dcdaf88so1080971137.2; 
 Sat, 17 May 2025 07:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747491726; x=1748096526; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+IvTjJwrU8s7iUyjtPaZ5HJKqtg72p6APhpbESxqvdw=;
 b=dJ8/DF1Ss86GKt6HkKOzt7Tkotm2o5FD49gXy9CyXyGZxpYI58UakjG/B3UIhZ5FNj
 Pdxqlsclea6Hlsm4EmUs5TSp5+RFhNA4OJLTsCDx2XlPF575G0Tg7LklUayZRV1wRDBW
 Y6bcT6M3W8wRFLL+nc2aRJkl4IVW5tetZ1lCf0fVaLMHjaTS6SMldxGB9SLDgowXEgJT
 /qtPPclWtXwMd1dnJ9vUcCbfqCsZnjFeIwb9IIh1IfUWeDk6o98GXjrW3GkrfcKPPCgl
 iCp++5/9dlBP4VEq1Kuv266uCAcQsdODhY5d1hdJAKvJdTdsxmBM0VkWT05EX6y24C6h
 rwaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747491726; x=1748096526;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+IvTjJwrU8s7iUyjtPaZ5HJKqtg72p6APhpbESxqvdw=;
 b=hUhTfrVEk/lCShRzB9HdX+RUW/3WEBrJYsj+pk+foKoTxantS1tu3RamSj7j/DXMko
 T3Gc4M7Q2vqnQ6XiAZ1XD627qEF/ZcbQ1RS7+ncMk1njM4yqS4pxJRyuRtK9uCJ0FrN/
 c8SyuOZK9VAFxoxQXDuJi9RT7T093Zc7pPZyj7FF6mJ7veTFlCGVvrSLYsD1t5O6FKiO
 MBUApSBOYhFb5xveysVjKGvRqQhdJ4gZkL0H2dxEY2UqT4lnLYHAcoq3k/9AHTZ7Jit3
 ngc1iFev2IrADnOI+rpU6EYVaOkBzcThgRGeB7e3+WDhFoasL9s3F7n2OZlOQWj+P9I6
 PEJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqHlWzEr9vy3ZuGPkIGJW/oXya0O/Ls/Rxna+KKW+OU32kpkUaYm2tpUGukQlpIyHMmGKu5xby+/fC@lists.freedesktop.org,
 AJvYcCXQu8nmY08I0jDDlCRoqDJGmLHHBF+dnUfnuc/dnswUm5OmmY//23/LUJeAANMOMZPw4ramJSZR@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwnupVzNhV83lJ7yKDyV9UAq6a2BpAj8edQuyWe3OlRxYB7qkrV
 c1VfirJJa6lvOmJZqkzRizAm+jGIFx7arv/T1jNG5csj/eVFLAmUtJ+D
X-Gm-Gg: ASbGncu/3qmzBMBbWS/p9skUi4gaFtE42l0xlnnrI4gb303VTHyXt9q73hqivKV6BvO
 PkAJdUCzq2UiAPeu2QPLV8v2RP+Pm4cawtEuCC3vQl0yMCOCyaigeAdX3DOlXBxx0lX+y8rPSY/
 l8Ahnia4AW+pWwM3ziUa9DUDeGThM6yS3Tyx8IAy+MUP646BDdIm2zmHtH4u1KoDQoOdvxaPTSu
 f2fOEyttZWectVgikIgmfgcKrr8J8WTnk0m5NWXz7409ddna3aZdlShybHmwQk4W+CmMua+dHaH
 Ps9TlpDJ+Bf6pG1UoI5kZF00i2gqEQDdCeATOSX+/ZilBedWhn46uIefTnLxmQnIlS+Kl/7CMM6
 IRtUXS7Ok7g==
X-Google-Smtp-Source: AGHT+IGG5NhOZRozR2C8EWXYBxU1OmFZROlehFOf2lGzQ3vkREzu72l4NqHjWlxaigokyImy5fawXQ==
X-Received: by 2002:a05:6102:1512:b0:4d7:9072:1873 with SMTP id
 ada2fe7eead31-4e053c6e238mr6937466137.24.1747491726015; 
 Sat, 17 May 2025 07:22:06 -0700 (PDT)
Received: from xodo-linux.tailb46509.ts.net
 ([2804:1b1:f983:1b4a:2975:d863:b306:345f])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-87bec1ef3a8sm3349819241.21.2025.05.17.07.22.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 May 2025 07:22:05 -0700 (PDT)
From: Leonardo Gomes <leonardodasigomes@gmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: derick.william.moraes@gmail.com,
 Leonardo Gomes <leonardodasigomes@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2 RESEND] drm/amd/display: Adjust get_value function with
 prefix to help in ftrace
Date: Sat, 17 May 2025 11:20:54 -0300
Message-ID: <20250517142114.140016-1-leonardodasigomes@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Adjust get_value function in hw_hpd.c file to have
prefix to help in ftrace, the name change from
'get_value' to 'dal_hw_hpd_get_value'

Signed-off-by: Leonardo da Silva Gomes <leonardodasigomes@gmail.com>
Co-developed-by: Derick Frias <derick.william.moraes@gmail.com>
Signed-off-by: Derick Frias <derick.william.moraes@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c b/drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c
index 3f13a744d07d..886dd05b012f 100644
--- a/drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c
+++ b/drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c
@@ -62,7 +62,7 @@ static void dal_hw_hpd_destroy(
 	*ptr = NULL;
 }
 
-static enum gpio_result get_value(
+static enum gpio_result dal_hw_hpd_get_value(
 	const struct hw_gpio_pin *ptr,
 	uint32_t *value)
 {
@@ -104,7 +104,7 @@ static enum gpio_result set_config(
 static const struct hw_gpio_pin_funcs funcs = {
 	.destroy = dal_hw_hpd_destroy,
 	.open = dal_hw_gpio_open,
-	.get_value = get_value,
+	.get_value = dal_hw_hpd_get_value,
 	.set_value = dal_hw_gpio_set_value,
 	.set_config = set_config,
 	.change_mode = dal_hw_gpio_change_mode,
-- 
2.43.0

