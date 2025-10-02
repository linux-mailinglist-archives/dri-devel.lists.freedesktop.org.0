Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D5EBB28DA
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 07:43:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D0F610E77E;
	Thu,  2 Oct 2025 05:43:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nISPwXhu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B2710E137
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 01:33:22 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-32df5cae0b1so759974a91.2
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Oct 2025 18:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759368802; x=1759973602; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RaVli6Y6NQOLGiB1OtRJiZY2C9eKiJeUFKgxLfZ7xKg=;
 b=nISPwXhumI9nO8DbVZkINrQwZqAt0ymqyH0rf5PsGtetsRuYOVtA9TM7SiWbsgVIya
 uoAnqHW3SP5ClqjQw3Wq3zw1zh8XhqGw3OMX9IsqNBRbgg+5ojF86szRD4Ow65vfgWXP
 RIAkeJeRdA7scJUJ2SamFQ3awnsGu8vJ2O7Zj0ju2H3JfDYV8DxiQ9GRoqJED8UbAtLc
 aJZvuesA5vHGSUoOQ/JbF6c9Xhb8+PnF889h2ZcX8U3/Q6Ovc4Q4MA/BhColING+5zWi
 o6nFKnOqr6dqVKlajK70Xn1+CDCiLlb63q/uLfNrhRKrkIP9Mwewq2rvmVeMMCrVO0j/
 Cd2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759368802; x=1759973602;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RaVli6Y6NQOLGiB1OtRJiZY2C9eKiJeUFKgxLfZ7xKg=;
 b=WoENPi7dslO3nYsw9bjTMatrom3Ur4SW+MmtON2RevB9vsDT8y9XVpUxJ9ULCrJ5kV
 3iOOlVmBksPjIrxDd+SkfdrA6AzhEe7/NS9cPqFVX2jWUB6aL8cU87dZZZcIQ6+Wxx29
 sglek4PejG1+NmxYtXlX3EaI1qUPqk2PRE8Z0MKEskSQnfS8ET5HJBxbbcWD6oYkMoSL
 ctTZXz9m6uXjHTo6x9CnwlY0+yLyi0/WUNDPU+C/FUvnOoxJA5xmv97seNjNu9tqZaWS
 YkcdU3BhrUmscte6u4SvU/E+1/66xfobIRV3YYjJwneLxsx7aTrNtAGPr3dtrWC1Hg9k
 0lLw==
X-Gm-Message-State: AOJu0YwFKEEZLOW9ubNQBMYTo/WmaaPcsVCTU0KiOcjQE/1GY8p7da1P
 Wg6PNgst4opJiOIPr/9UksRLocr/FeqTB3cSZC/ehqtgmUK/icPL8eB6
X-Gm-Gg: ASbGncsE2zNxRBP1QS4OBm8XrFp4/PV0QyHBFme4XRjo8uFchJ8P16X+CIm7rlPEOUi
 xHge3RfaCU7tpyYkvXi46Zfv/23A34nWWSsJuaAs8D02DGwg9ZydA+lzOQo/l24VZKEe/a4FrSI
 6a26jWzMWWzXOBxgaGvSxtJwdKhqEUxv3Qqt6dbiLyL5+z/E8m2Tup3P9dLSnq6+5MTcTocgfTg
 iCYxgw+ALJvPtMWWjHxON/NZN1qji+lxm0w2cB00qzw9jrDakl/uEhAPNgF9vNyxlBmjPiYdBZv
 GV2FGSxR73wD9HbyxnVQXPntdHy99M1xOnhOjrZbcrxXq0lqZisCBCI8PqJLQu1c2aVCahAOasV
 pcfET2SqxNKQzpEDu7kt/bXqkHKlxEQR02KQpZUHICprVlDjnhIerd1s3yU3NGkY6kTwFzVw9NE
 c=
X-Google-Smtp-Source: AGHT+IHy6EMUx48ZEgtNlsOfQJMXzUOSIEhbwLkoZVxOSg5RvomWwbNs2l7nDhzWak/dvpq2kvkchQ==
X-Received: by 2002:a17:90b:3850:b0:32e:e150:8937 with SMTP id
 98e67ed59e1d1-339a6e2821dmr6968345a91.6.1759368801843; 
 Wed, 01 Oct 2025 18:33:21 -0700 (PDT)
Received: from ti-am64x-sdk.. ([157.50.91.136])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-339b4ea3c3dsm1008832a91.5.2025.10.01.18.33.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 18:33:21 -0700 (PDT)
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
To: avier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com, khalid@kernel.org,
 Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
Subject: [PATCH] drm/ssd130x: Use kmalloc_array to prevent overflow of dynamic
 size calculation
Date: Thu,  2 Oct 2025 07:03:12 +0530
Message-Id: <20251002013312.67015-1-bhanuseshukumar@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 02 Oct 2025 05:43:06 +0000
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

Use kmalloc_array to avoid potential overflow during dynamic size calculation
inside kmalloc.

Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
---
 Note:
 Patch compiled successfully.
 No functionality change is intended.

 drivers/gpu/drm/solomon/ssd130x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index eec43d1a5595..8368f0ffbe1e 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -1498,7 +1498,7 @@ static int ssd130x_crtc_atomic_check(struct drm_crtc *crtc,
 	if (ret)
 		return ret;
 
-	ssd130x_state->data_array = kmalloc(ssd130x->width * pages, GFP_KERNEL);
+	ssd130x_state->data_array = kmalloc_array(ssd130x->width, pages, GFP_KERNEL);
 	if (!ssd130x_state->data_array)
 		return -ENOMEM;
 
@@ -1519,7 +1519,7 @@ static int ssd132x_crtc_atomic_check(struct drm_crtc *crtc,
 	if (ret)
 		return ret;
 
-	ssd130x_state->data_array = kmalloc(columns * ssd130x->height, GFP_KERNEL);
+	ssd130x_state->data_array = kmalloc_array(columns, ssd130x->height, GFP_KERNEL);
 	if (!ssd130x_state->data_array)
 		return -ENOMEM;
 
@@ -1546,7 +1546,7 @@ static int ssd133x_crtc_atomic_check(struct drm_crtc *crtc,
 
 	pitch = drm_format_info_min_pitch(fi, 0, ssd130x->width);
 
-	ssd130x_state->data_array = kmalloc(pitch * ssd130x->height, GFP_KERNEL);
+	ssd130x_state->data_array = kmalloc_array(pitch, ssd130x->height, GFP_KERNEL);
 	if (!ssd130x_state->data_array)
 		return -ENOMEM;
 
-- 
2.34.1

