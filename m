Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8F5896021
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 01:28:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F02CF11217E;
	Tue,  2 Apr 2024 23:28:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="bjSYNHnY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21EE411217E
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 23:28:27 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-6e74bd85f26so4799445b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Apr 2024 16:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1712100506; x=1712705306;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5s1cpFilIcoj0gF+3G7cV47DBqasfVJnJ4p5Ae2MpMg=;
 b=bjSYNHnYXoRV2Y3ghkaG2Ar6tTDW3/Wy3SuQ5es0PgnXeDf3VJ6V/lmxLeEXn1udZO
 EvGi6AjOc9JyuFBWpM4fpaD9QceyDz4w1S4v5SYKR99aZYfYCkkzXz51T6W01yXZRwpY
 AN0mz1oCegnuLD3uCSNbVTA07PQUsnOAF7w10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712100506; x=1712705306;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5s1cpFilIcoj0gF+3G7cV47DBqasfVJnJ4p5Ae2MpMg=;
 b=U5qgDMwSwoqaUpiZU+fEoZjHBesIc5aehww8942bzky85S8bP43V06woyUs8o9IzKx
 YxHYlEq5AA1Uqep7khex2x+J30g4pfPZv6M25L52JNmMdwPGv0gpeonhiwKXVd7ZW/+m
 AQ1knlQOWLjnnvgRz+qfzHp3ACVYruX80pUvKUkZCkpCiQhbwbbc7jFdgsOdFHm9I/Yn
 E7GzS/7+WH6u9Pz2zg2ayW/qKqv/M721jJhPR8QwcjNtAKk/n6pVVPDpEW/DYhLfYRop
 qbs32oPVllaGVzXPYOEHHAE39bnTUhg/17HepqTOXvso56RffX//uHQhV2pPvXIQDNEL
 DVpQ==
X-Gm-Message-State: AOJu0Yy1czv3oRclkTk3GNiPPoOOEQSs1R/UvT/6dsDbv2BN7faz2+aJ
 xDPwIiV7rVm4XYnhHM5jmAlrkaQpu6ke9irPl1g1yqVDh/EMHP3xLE5JeDLaP+p3UBnszb4LzfP
 lsv6h0pFk1Kut/OQHuCoJp5hIITTb7DlPyej4n+uEYQElhDVp2YKkJELencPm8cRYkAvossv/yJ
 bkq5fRWv1Z+8sAKTaVsyrrUQ3OtV9DHAbHhB45Syd2einl7M+2fA==
X-Google-Smtp-Source: AGHT+IHop2T0a57tWh7gMibQ3cT52SkL4Rn41/Fx8f56Akt9jbz4UDuxv4Hg19Nf1ZQNr0U67u1XmQ==
X-Received: by 2002:aa7:888d:0:b0:6eb:27:f27c with SMTP id
 z13-20020aa7888d000000b006eb0027f27cmr9508200pfe.26.1712100506073; 
 Tue, 02 Apr 2024 16:28:26 -0700 (PDT)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net.
 [173.49.113.140]) by smtp.gmail.com with ESMTPSA id
 i21-20020aa787d5000000b006eaada3860dsm10385121pfo.200.2024.04.02.16.28.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Apr 2024 16:28:25 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Zack Rusin <zack.rusin@broadcom.com>, stable@vger.kernel.org
Subject: [PATCH 5/5] drm/vmwgfx: Sort primary plane formats by order of
 preference
Date: Tue,  2 Apr 2024 19:28:13 -0400
Message-Id: <20240402232813.2670131-6-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240402232813.2670131-1-zack.rusin@broadcom.com>
References: <20240402232813.2670131-1-zack.rusin@broadcom.com>
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
Fixes IGT's kms_atomic plane-invalid-params which assumes that the
preferred format is a 32bpp format.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
Fixes: 36cc79bc9077 ("drm/vmwgfx: Add universal plane support")
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v4.12+
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

