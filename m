Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E24CAB7E83
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 09:09:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0B0C10E771;
	Thu, 15 May 2025 07:09:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Vju7Yuzk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com
 [209.85.222.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DACA10E64A;
 Wed, 14 May 2025 17:43:19 +0000 (UTC)
Received: by mail-ua1-f41.google.com with SMTP id
 a1e0cc1a2514c-878af63c5eeso911241.3; 
 Wed, 14 May 2025 10:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747244598; x=1747849398; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LUKDAyGVgyLttQIEKGjY2SVfmg/Stniz0okiGwO+ins=;
 b=Vju7YuzkM8BIAPmW7B6Dk5ZJR7o62Z8ZzCW+5q4BiS2VSYiWOc7+0z6SJz9jc5cLr/
 w3dD2aLwXhKR5+K+eTctxodjoK3582SxtrxdpCZBTNu5diaCQe9vD0DLN5PFVK0+YTVw
 nXfQZUiZJS1ApWhBAdphOKg4aGLkesWedd29sER7GXZlx4kt+U8V6tZGTNQDDITCO2gT
 tJCldZ/2uPj2jQEcvNyDnMjuFjG3DwUNLq2IDJvZHeUGi6pHqIOg4p89auY/QVQHdJ3b
 uRf5GSxUtyPhbN/NDZ9mkOS4QFPdMOtFMOu+RSci9itXzyD07Jda4cFyo+rKUYdzfOxc
 ij5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747244598; x=1747849398;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LUKDAyGVgyLttQIEKGjY2SVfmg/Stniz0okiGwO+ins=;
 b=tAu37cHq5x+FH0ND5OFfMkA267wzKou+xZ3HSDWeUiptreDbJGTPdvjJa21q/cTbOZ
 GtIzTlJlZiBSMRRb9HnsLt7qWxxctVx9NpTF6F5Q/hF9gtTh4OwLapaLIdhA6i5NIGMA
 nag19SWTqP/3DGbJJm6gSJGAthczDBopShXJxpb4b5GlFnUwf3ozqPzeyCIkkn3iJJKK
 SDR48XVkKmEZDHK3GHVjTsKJsUttrtaUHblJ9zmkYoeHAJgesYrIfRfZIBlnQhkPlkGA
 UB89FSbNiluI7a/2M3j2ALU+Nzo9VdI3YNr8KXOmiPLkX6a26OqVS22rGs3XznxxX3th
 Ntng==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUazqEO9NoVURjSseW1+bSfetBh+zqfaV6JhtZB+kDsVe/qYxh4AcNuH9xjJXoSLcp3ToGd8KcF2lb@lists.freedesktop.org,
 AJvYcCXo38XuZo4gCiVZ0OeA2KwTzjKlhmVKhHPm+aHcndFcyxPPO5d1zRJe66qAb8OY40GaCBzqJP8l@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHEL4oaKScf0EtYODDdWe0fG6W+mpNEBTgU4f6HDnKwxgGad+1
 bs/UHUKQkF6l097YrWoH7uBefLTGC0XmyvXGtLluVhnRNNZVtgSY
X-Gm-Gg: ASbGncuRc/dKa3U3KPCRxPN62LZ8klXAA3pt5XKCQ9GrqZE7KQhoEvhSfS3dZh2qDdJ
 ZCKKIbT6u4j65Z8vl40LVcoiZ/TX8zeEYY9uhKdulN+eyOmAMJqRe0qrDTQDfw8liCxBcCIRLV0
 Opx+HlDToE2+rUtf/h9O2cnRRDTJlXEjN1juwEODLDkuFtkmEasHWkANp1yXSRWbxG/RjsCC0Qo
 gK26wtLiU3cJeLGm3Uiq6Hs7Ebt5C3Tt7qLXgGXKUw3GPvd49jWkzIsF3IMXJvUM5JwBWagvtsC
 DhgScPe6rZQ//h6OVUZCFwRqfDMVfLMprxVCMObZ5PyJc54NWmXoyWA1ip/PvH/3fN2i3yrj6O0
 L
X-Google-Smtp-Source: AGHT+IGoJsdHAEYEYraq2rXfkPE6o1kobdA0jAPjtdBlaO0B2I7AI3uhQp+JSAioPsOruEFo9Nx0Iw==
X-Received: by 2002:a05:6122:1792:b0:520:42d3:91c1 with SMTP id
 71dfb90a1353d-52d9c730db9mr3453623e0c.10.1747244597912; 
 Wed, 14 May 2025 10:43:17 -0700 (PDT)
Received: from xodo-linux.semfio.usp.br ([143.107.45.1])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-52c727f5d86sm6401595e0c.10.2025.05.14.10.43.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 10:43:17 -0700 (PDT)
From: Leonardo Gomes <leonardodasigomes@gmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: derick.william.moraes@gmail.com,
 Leonardo Gomes <leonardodasigomes@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2 RESEND] drm/amd/display: Adjust get_value function with
 prefix to help in ftrace
Date: Wed, 14 May 2025 14:42:10 -0300
Message-ID: <20250514174306.82693-1-leonardodasigomes@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 15 May 2025 07:09:42 +0000
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
'get_value' to 'dal_hw_gpio_get_value'

Signed-off-by: Leonardo da Silva Gomes <leonardodasigomes@gmail.com>
Co-developed-by: Derick Frias <derick.william.moraes@gmail.com>
Signed-off-by: Derick Frias <derick.william.moraes@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c b/drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c
index 3f13a744d07d..b11ed1089589 100644
--- a/drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c
+++ b/drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c
@@ -62,7 +62,7 @@ static void dal_hw_hpd_destroy(
 	*ptr = NULL;
 }
 
-static enum gpio_result get_value(
+static enum gpio_result dal_hw_gpio_get_value(
 	const struct hw_gpio_pin *ptr,
 	uint32_t *value)
 {
@@ -104,7 +104,7 @@ static enum gpio_result set_config(
 static const struct hw_gpio_pin_funcs funcs = {
 	.destroy = dal_hw_hpd_destroy,
 	.open = dal_hw_gpio_open,
-	.get_value = get_value,
+	.get_value = dal_hw_gpio_get_value,
 	.set_value = dal_hw_gpio_set_value,
 	.set_config = set_config,
 	.change_mode = dal_hw_gpio_change_mode,
-- 
2.43.0

