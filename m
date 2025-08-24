Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3BDB33208
	for <lists+dri-devel@lfdr.de>; Sun, 24 Aug 2025 20:24:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59F0D10E1F4;
	Sun, 24 Aug 2025 18:24:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FnoFiLfB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7019C10E1F4;
 Sun, 24 Aug 2025 18:24:11 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-24680b19109so7574945ad.1; 
 Sun, 24 Aug 2025 11:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756059851; x=1756664651; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p2v1IYFTL9EjW4OmXMSiVEBKcc5tiC6DS+GF23hLI0E=;
 b=FnoFiLfBRcjq6t+w+/Lp4RxlI9AairJVFVXfDt7bXv6L7mqgwRQUdn118oRxWBDQD9
 Ui/y8Qbc20Tocuzw6mM8YbrKoEY7Jz0JybeJD9J0GI2hSXG3qWPP6U+rAX3cSn3yUaa1
 rrhu44NTKSl6uHGoFrZW67lggm/kmKTJysnh5D/hu3gFg4sfX15xJm1FZyLjbYF+uwF3
 ckrQCB+srTdXlu8Foj4NaNaHeEPnE4oFBr/aqeBqfBBpITbuwxV5zfcNFZKg7Xfl7hqC
 ghsaWhA5/q+qVj/5RXQm+4DCs8Hr27+hc9YY8m+vVhC2rSzFrEsu95AUI9M7/TxOI6rO
 0S0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756059851; x=1756664651;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p2v1IYFTL9EjW4OmXMSiVEBKcc5tiC6DS+GF23hLI0E=;
 b=TDp8D5zLx6gkkac8csXu2VG05uZTqWupSJoRcK+LgQvYUFwAoafFRZjd3idx2vMgxH
 izhEwP9MNoUhGziSFewOp9xYr8kP3zzfpNsbHpvQzcTqBN/ONCGmjgjEPds0pmnfhwQY
 x525AJUNIqJeV0Te7ZuPA/Fx4gRxXRwub39GkyqUCU+HfuZzRlNP9TVRRZ9h4s1EX3T5
 o72Cjiuk5td266jmGNTtDhfU2PjQ6vBvIW7aFncKhOqIvckeqD/sa3UiULT9m7Tsd/Ls
 2hxu0mToYMjOIaGSIZWY+vh1F/4FyLBo8ZvlsfuDhM+tPTdbWBJUvd9SlVOjjZQZaWHA
 BYrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbyAOas/hXlrXsF+edna8vDRXIp4VOf+34RiFineUN/NtrpBsEicFAG8Y/xxX6ROXAv5CijsbI0jCa@lists.freedesktop.org,
 AJvYcCVIPOFm2dDrra46V9VKugwaZcNvfJUi7TCZ9v9ZR9oJftmHdV7355+q9Hcc9bVauBwVW+XJVqHy@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxIwBebUwafLl2DwCdsKdeid3qNUidmeS7OBVsjtVoRzwdyVZsH
 0Mh0S7RAAnT+fap8nX7pnoe/A8iJPEpwYftt2dz1T9er+ENwPElT8bUt
X-Gm-Gg: ASbGncvdh1Eb3wKcWAkD2R+cmU9Of6b5PD1MFIEzT//gu23sO34xhx8kPgUgkgrJ0Ss
 VyUZ59cKYlPng3Lx7DXyV7aWvZ5H2FT4+cdoYh8DZOhBxItJnfE6QQ2+DAXCFaxRG2wAudexMUP
 aEroqN/xu+G08YFp/43aL/jz2kEsz1ApkCqkAHrxVsUSEIvWx4n0TjAhRPdFRTkWhLYv4TikmIp
 Uco+3Bbv/S4L6ZqIPgmlMYljQNTx5kbF2T+GYUzCEN6p23FiSg294Nk+uSkenPw6VGOCQ/kgLmh
 onUSdKsJ6eUafHhOl8Z//2ulnMhjD6ZVfrxXQkSM+2bcdNF4G/5cpam3mVkWZWG0usa69CVc5hS
 ximi/M57VaVhhgkb1pVg4tzjNXu8zYuthqe9YBRZ83e9vIUZFdOiIqkqP5HGfPls=
X-Google-Smtp-Source: AGHT+IEcmIAoNLGgWs51AJwLfXP1RCoyG3ATRWOL86MbvJbfx+dgqpWtFQD61mP3GyAan2qMIob2vQ==
X-Received: by 2002:a17:903:46c5:b0:246:7b42:a223 with SMTP id
 d9443c01a7336-2467b42a323mr57162615ad.25.1756059850757; 
 Sun, 24 Aug 2025 11:24:10 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2466889f11esm47903635ad.150.2025.08.24.11.24.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Aug 2025 11:24:10 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: austin.zheng@amd.com, jun.lei@amd.com, harry.wentland@amd.com,
 sunpeng.li@amd.com, siqueira@igalia.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: zaeem.mohamed@amd.com, wenjing.liu@amd.com, chiahsuan.chung@amd.com,
 Natanel.Roizenman@amd.com, Daniel.Sa@amd.com, jserv@ccns.ncku.edu.tw,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 1/2] drm/amd/display: Optimize reserved time candidates
 sorting using standard sort()
Date: Mon, 25 Aug 2025 02:23:58 +0800
Message-Id: <20250824182359.142050-2-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250824182359.142050-1-visitorckw@gmail.com>
References: <20250824182359.142050-1-visitorckw@gmail.com>
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

Replace the custom bubble sort used for sorting reserved time
candidates in with the kernel's standard sort() helper. The previous
code had O(N^2) time complexity, while the generic kernel sort runs in
O(N log N). This improves efficiency and removes the need for a local
sorting implementation, while keeping functionality unchanged.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Compile test only. 

 .../dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c   | 23 +++++++++++--------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c
index e763c8e45da8..2b13a5e88917 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c
@@ -2,19 +2,21 @@
 //
 // Copyright 2024 Advanced Micro Devices, Inc.
 
+#include <linux/sort.h>
+
 #include "dml2_pmo_factory.h"
 #include "dml2_pmo_dcn3.h"
 
-static void sort(double *list_a, int list_a_size)
+static int cmp_double(const void *a, const void *b)
 {
-	// For all elements b[i] in list_b[]
-	for (int i = 0; i < list_a_size - 1; i++) {
-		// Find the first element of list_a that's larger than b[i]
-		for (int j = i; j < list_a_size - 1; j++) {
-			if (list_a[j] > list_a[j + 1])
-				swap(list_a[j], list_a[j + 1]);
-		}
-	}
+	double da = *(const double *)a;
+	double db = *(const double *)b;
+
+	if (da < db)
+		return -1;
+	if (da > db)
+		return 1;
+	return 0;
 }
 
 static double get_max_reserved_time_on_all_planes_with_stream_index(struct display_configuation_with_meta *config, unsigned int stream_index)
@@ -634,7 +636,8 @@ bool pmo_dcn3_init_for_pstate_support(struct dml2_pmo_init_for_pstate_support_in
 
 		// Finally sort the array of candidates
 		sort(pmo->scratch.pmo_dcn3.reserved_time_candidates[stream_index],
-			pmo->scratch.pmo_dcn3.reserved_time_candidates_count[stream_index]);
+		     pmo->scratch.pmo_dcn3.reserved_time_candidates_count[stream_index],
+		     sizeof(double), cmp_double, NULL);
 
 		remove_duplicates(pmo->scratch.pmo_dcn3.reserved_time_candidates[stream_index],
 			&pmo->scratch.pmo_dcn3.reserved_time_candidates_count[stream_index]);
-- 
2.34.1

