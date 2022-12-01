Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF24C63EDD1
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 11:31:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DBEF10E125;
	Thu,  1 Dec 2022 10:31:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C590010E129;
 Thu,  1 Dec 2022 10:31:02 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id td2so3127867ejc.5;
 Thu, 01 Dec 2022 02:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vcT8YWVtzB1GH3wOdz9aZTQd5ehiQWJpYZBWZtycvm8=;
 b=cbjbrXuT8E1s38jzvt5nDpI8pDGo9sLSQBn85SkcpzB/lfR+IYTvqkDDRNZgh2xaX/
 hP1vgyrt14EfGicPI15NkWFmw9lTE/kIcwkC4CxR79Qb4UO8U40H2NsuNWNm5C4pfX2u
 rIzRBLpjE1qe6WpFfUuyXk5VT+VysTyjYVj2rc5S2Z8MZRuTlw7HqbLd0kM3wsDHqTCn
 8+Pthl24i9yHneVK+ayw9VF3UPmkfz6hgvaPxBelDF/rW421wCOK5xLzwbdgkuzXniUL
 /3/iBh78lTW85/idYvXbRlu5I120sZoNtAGgusL10Du525UNHgpQEaPP1FeLcPibs77O
 aB1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vcT8YWVtzB1GH3wOdz9aZTQd5ehiQWJpYZBWZtycvm8=;
 b=Z0RWvvOw9PWalYN+P54FSyyt9oqsXuQ1TYpW7vJKp+0cyQ5NKkqvJ+rd8W3pL3gnwq
 8ekTcEKfFfYWqpIkdeN0XCBcdsP7fQxqGEGWV5JaJIG0yOZWWvaJ4uvVnTBEaYFhSl/u
 l5uaSktrE8GL3FArWGsJikZkeuxDia+5HX05MpGpAaJr/mV58HAQ9nunTu9UsbsPCDHQ
 LaK/k6KFHAcCaFirwiiy4fveZGbP6FkV/5oqXTOSF/Jm8gx6KsrUpF4cpPJwhqySAERl
 7JMT2ebIUyeL9VqW+aBo5bBgPBxZB31UqaGetWf/Nbus84xEJFdibmXR8QFXGn3nnFhL
 7+oA==
X-Gm-Message-State: ANoB5pml7z5NiuBwcJGAJBLsuo3CJJp6eTGulhjFb3Q6qyJJ2i9JjQor
 uKu7MuEFldgOASjVqR5yhPs=
X-Google-Smtp-Source: AA0mqf6vLwJ1e3gG/cbesF5dC/cJZEejWxr7z+4bT4uuMCGBKShgh1K9ZWvRJXzcdKkZCuY8cmdu7w==
X-Received: by 2002:a17:906:3510:b0:781:b7f2:bce9 with SMTP id
 r16-20020a170906351000b00781b7f2bce9mr56599893eja.269.1669890661370; 
 Thu, 01 Dec 2022 02:31:01 -0800 (PST)
Received: from cizrna.home (cst-prg-44-69.cust.vodafone.cz. [46.135.44.69])
 by smtp.gmail.com with ESMTPSA id
 g1-20020a17090604c100b007c07b23a79bsm1592400eja.213.2022.12.01.02.31.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 02:31:00 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: 
Subject: [PATCH v5 5/7] drm/etnaviv: Add nn_core_count to chip feature struct
Date: Thu,  1 Dec 2022 11:30:21 +0100
Message-Id: <20221201103026.53234-6-tomeu.vizoso@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221201103026.53234-1-tomeu.vizoso@collabora.com>
References: <20221201103026.53234-1-tomeu.vizoso@collabora.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, italonicola@collabora.com,
 "moderated list:DRM DRIVERS FOR VIVANTE GPU IP"
 <etnaviv@lists.freedesktop.org>,
 "open list:DRM DRIVERS FOR VIVANTE GPU IP" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We will use these for differentiating between GPUs and NPUs, as the
downstream driver does.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h  | 3 +++
 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
index 85eddd492774..c8f3ad2031ce 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
@@ -50,6 +50,9 @@ struct etnaviv_chip_identity {
 	/* Number of shader cores. */
 	u32 shader_core_count;
 
+	/* Number of Neural Network cores. */
+	u32 nn_core_count;
+
 	/* Size of the vertex cache. */
 	u32 vertex_cache_size;
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
index f2fc645c7956..44df273a5aae 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
@@ -16,6 +16,7 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
 		.register_max = 64,
 		.thread_count = 128,
 		.shader_core_count = 1,
+		.nn_core_count = 0,
 		.vertex_cache_size = 8,
 		.vertex_output_buffer_size = 1024,
 		.pixel_pipes = 1,
@@ -47,6 +48,7 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
 		.register_max = 64,
 		.thread_count = 512,
 		.shader_core_count = 2,
+		.nn_core_count = 0,
 		.vertex_cache_size = 16,
 		.vertex_output_buffer_size = 1024,
 		.pixel_pipes = 1,
@@ -78,6 +80,7 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
 		.register_max = 64,
 		.thread_count = 512,
 		.shader_core_count = 2,
+		.nn_core_count = 0,
 		.vertex_cache_size = 16,
 		.vertex_output_buffer_size = 1024,
 		.pixel_pipes = 1,
@@ -109,6 +112,7 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
 		.register_max = 64,
 		.thread_count = 1024,
 		.shader_core_count = 4,
+		.nn_core_count = 0,
 		.vertex_cache_size = 16,
 		.vertex_output_buffer_size = 1024,
 		.pixel_pipes = 2,
-- 
2.38.1

