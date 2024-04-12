Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1188A23FD
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 04:55:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 769FE10E826;
	Fri, 12 Apr 2024 02:55:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="ROBK1Fps";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA97F10E145
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Apr 2024 02:55:26 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-4349bba0ba3so2514471cf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 19:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1712890526; x=1713495326;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IUdoEKYMeyvOEbhTlsoajd8PIkMAEd98DVuYNbg+BqU=;
 b=ROBK1FpsGoaVZIPviNtkeqIhpdNkjiQ8VWl9gnXdbXZjgs+JMk9CzOSB0uVQor0hyI
 wEDtZpBGj8Mu1fuPNt2PVNoTWvzhXg45YW6dhNWo91U71jvk7rGrKVHH1EPHugUzBCsw
 /dUTnP0n1NcrPvT+nbG5e3NlC4+hfeD0zkDLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712890526; x=1713495326;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IUdoEKYMeyvOEbhTlsoajd8PIkMAEd98DVuYNbg+BqU=;
 b=YjZjDw60UdLkXfefAPOPYvqpUkxKJUIiWLlRKMLZXM3c4TaHv3dew8Y0+Yvp7ya/1r
 BL//sQ9ee0vktyA33mYxWRSP+6w6GsCINSnV3ThO1QHgl5po+zbJCBlPpXCcnWQ1ktTn
 cE6Mu2QIa7fn/EvR7CDQsrBABQiuVImzyws9gUR/LrMlK7Ro3qh7Y6YBGLERJ0cg3Sxb
 wyeEVKGJTlI/TcQTBvVYlpdbGh//KRJQKdSb7uzp5D2MLR9eK1n5UBRl9APq8pqSsvqW
 HS8r6azDwlP9MFT5qYjnPoXdKRHuzk5B0VXGVAv3EtA9SHaR2VO36lLMAAONyyVVjDKV
 nvNQ==
X-Gm-Message-State: AOJu0YxqRaUtZIQWpj0zrMamBNTU0MCWqzOs6auZocBJHVzgnTtWaOGH
 mBrvpzzwwshGJlxUviB5aZNb8Rj63lFBjduo9DgruM5Jepg3w5MtoD7mHhXQcU+MTDZS5hV1Es0
 UF1AMSKNExD8VkUygEsEQdklpHvhydbh425Tid/0AuIOwtNLAMNYSbghoB50FFUkhhEY55an0tA
 +dxXOZ0mWB8qrQBe1abkbQGgV/lcsfGn0HnFtUXGmz+E6h3XJe7A==
X-Google-Smtp-Source: AGHT+IH9Fbqg4XgLGfQ1M0xRMJylwntm60TK7ZtOpxY+6GSWQRQ+zfrPyDlAmCL/Tqen+8DJois+bA==
X-Received: by 2002:a05:622a:190f:b0:436:5a0e:cb48 with SMTP id
 w15-20020a05622a190f00b004365a0ecb48mr1962435qtc.24.1712890525665; 
 Thu, 11 Apr 2024 19:55:25 -0700 (PDT)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net.
 [173.49.113.140]) by smtp.gmail.com with ESMTPSA id
 t12-20020ac865cc000000b00434ab3072b0sm1682174qto.40.2024.04.11.19.55.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Apr 2024 19:55:25 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Zack Rusin <zack.rusin@broadcom.com>, stable@vger.kernel.org,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: [PATCH v2 5/5] drm/vmwgfx: Sort primary plane formats by order of
 preference
Date: Thu, 11 Apr 2024 22:55:11 -0400
Message-Id: <20240412025511.78553-6-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240412025511.78553-1-zack.rusin@broadcom.com>
References: <20240412025511.78553-1-zack.rusin@broadcom.com>
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

The table of primary plane formats wasn't sorted at all, leading to
applications picking our least desirable formats by defaults.

Sort the primary plane formats according to our order of preference.

Nice side-effect of this change is that it makes IGT's kms_atomic
plane-invalid-params pass because the test picks the first format
which for vmwgfx was DRM_FORMAT_XRGB1555 and uses fb's with odd sizes
which make Pixman, which IGT depends on assert due to the fact that our
16bpp formats aren't 32 bit aligned like Pixman requires all formats
to be.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
Fixes: 36cc79bc9077 ("drm/vmwgfx: Add universal plane support")
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v4.12+
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
index bf9931e3a728..bf24f2f0dcfc 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
@@ -233,10 +233,10 @@ struct vmw_framebuffer_bo {
 
 
 static const uint32_t __maybe_unused vmw_primary_plane_formats[] = {
-	DRM_FORMAT_XRGB1555,
-	DRM_FORMAT_RGB565,
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_XRGB1555,
 };
 
 static const uint32_t __maybe_unused vmw_cursor_plane_formats[] = {
-- 
2.40.1

