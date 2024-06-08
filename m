Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA5D901146
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jun 2024 12:32:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4DD510E021;
	Sat,  8 Jun 2024 10:31:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AM0+7BkV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 355C210E096
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jun 2024 09:17:13 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-2c2e31d319eso105002a91.1
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Jun 2024 02:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717838232; x=1718443032; darn=lists.freedesktop.org;
 h=content-transfer-encoding:subject:cc:from:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hDXM+EewCoSYPs6hC+7G17jw1+2eIyZkkdf4bNQYFSY=;
 b=AM0+7BkVvFRYYI1wLx8zjvBXPA0HUOc8fQHGh4NH0WwuVbFaWhcYF/fidLafB771zp
 BCVGI0fa97v+J9V0Ioup5LitJcGl3hp5wc3vW0YWvugcFRU6wjO7R+DKK8s8i9l3Fp2g
 01RPxcr4IoA/9E/21bRYU/i3qT2EWyJGQ9Q/vTaWmEq/2Emxf2E0rwIpuVWshr6amG0A
 UBN+KnVpgYzfYYdhh6Ano/uLbPiQOc06PSSXH+hMm5GjDT50HqFQnHB0itj9yKRTKbab
 GManj0EDaUia59EPiiWd4fvUulh73WRXoQFiW7pnQNYUlpmJ2nwi2u4tDhQhzqggWqce
 cHKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717838232; x=1718443032;
 h=content-transfer-encoding:subject:cc:from:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hDXM+EewCoSYPs6hC+7G17jw1+2eIyZkkdf4bNQYFSY=;
 b=C21h9duJeT0eBYVMVeowCuPS1g+t4hWeOiEofMKRg2vNyABvWZpVDNWgvvS1tsiVp8
 W707JBxmf+U754EyD9a2OlWbdNHFMx/97flsirhh0NyAXD6y+3mMTUzi0k6f1i4ZJ0oP
 4gflfo0OSieNhu5wbIfjKv0n0IYCOtjXcmFxiHWvgaTXLvgi6PKEzieJ7rwpXuz6FA+3
 BJRcX6TRnsBYtFAHj1A+4KRdRrWDGZ/MKlSAdgu0CcGrCojM93TeKdtMURbW0w3/LDj9
 ImO8bgZfz3invYfjh/q3f55GAVcxxxWGQkvoo+EF69SzHnOlmjouHy0R4h89ehdMqxQJ
 Nm4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUR5QfW+DE5e6IEjrr0BrLI1yJGA/gmCjb4ONKAZgS7guvQwG+RZfngvsKVN0NFRKbMCt9UBC3J30zLLdlF4eCcQ65IUCbItcMWceoT+wbO
X-Gm-Message-State: AOJu0YzVgqCemwgXG4vHq7VDpJ+GUWAZ4VKXwlqOo4t9aoV3EdmBaKTx
 By8+Qi6ZeUKCjtWabcolxuuR87Z2tg2n8PywfCcRjGNI86ET5tL9NMzRDhHwTy0=
X-Google-Smtp-Source: AGHT+IGde/oeFABo2VXZ0vdK//U3/3ON137q78IG1uPwtcXXMD7gDn6JH98DnnKWa1WZhV3lHbGg0Q==
X-Received: by 2002:a17:90a:17ce:b0:2c2:cd5c:62b2 with SMTP id
 98e67ed59e1d1-2c2cd5c6698mr2713077a91.27.1717838232427; 
 Sat, 08 Jun 2024 02:17:12 -0700 (PDT)
Received: from [10.0.0.19] ([122.172.85.88]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c2806398afsm6903463a91.1.2024.06.08.02.17.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jun 2024 02:17:12 -0700 (PDT)
Message-ID: <d9f4546f-c2f9-456d-ba75-85cc195dd9b8@gmail.com>
Date: Sat, 8 Jun 2024 14:47:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com
From: Tejas Vipin <tejasvipin76@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panel : himax-hx83102: fix incorrect argument to
 mipi_dsi_msleep
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 08 Jun 2024 10:31:55 +0000
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


From: Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH] drm/panel : himax-hx83102: fix incorrect argument to
 mipi_dsi_msleep

mipi_dsi_msleep expects struct mipi_dsi_multi_context to be passed as a
value and not as a reference.

Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
---
 drivers/gpu/drm/panel/panel-himax-hx83102.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx83102.c b/drivers/gpu/drm/panel/panel-himax-hx83102.c
index 6009a3fe1b8f..ab00fd92cce0 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx83102.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx83102.c
@@ -479,7 +479,7 @@ static int hx83102_disable(struct drm_panel *panel)
 	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
 	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
 
-	mipi_dsi_msleep(&dsi_ctx, 150);
+	mipi_dsi_msleep(dsi_ctx, 150);
 
 	return dsi_ctx.accum_err;
 }
-- 
2.45.2

