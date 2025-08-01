Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CABC6B185FF
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 18:47:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35EB610E30C;
	Fri,  1 Aug 2025 16:47:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TJHrwG6T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D44AB10E2FD;
 Fri,  1 Aug 2025 16:47:35 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-45617887276so7012875e9.2; 
 Fri, 01 Aug 2025 09:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754066854; x=1754671654; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sjXi/K1zp/KJoXcAj8C+uMEFA5tFC8307SkRQQtBdaE=;
 b=TJHrwG6TnQ1KFhD15OpDfeLBu900lx6C1Di4STdTSWxz37DzUxGdKeQrvpT/ONpF/7
 JH2FcNpAJly9ovcb/a4BFuilt3VwY0+qS3WlaaEWjAN8kQTj6zO0zoBE8dZBVoexNn6q
 w5Asf0Gpq+i/tuUE4HEiuJEHoFbOFITTWbZXbX/Eb5hqb1gu28v14AdzZY5We/CTmaAF
 7FGyswAtDWOQh70+kd8WwanRxoGYmAHiwCpYiGBSAVPsTAN94lUQnArg7+ZYxsqDWmtt
 4/vfQw0n7t9RuuPzTjtyYes3naNmVPSyZUoSTtJGehSiSXWsMkWrNVgkNKzuBesanc/E
 ptjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754066854; x=1754671654;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sjXi/K1zp/KJoXcAj8C+uMEFA5tFC8307SkRQQtBdaE=;
 b=WVh9cMz/YnCuOZd7bdXyrqF4vtuvw1Bd0exDVDNiwtuHEYRly9nuqwpYCdz9Bg05ny
 pYrCMiMM9kuo7QckwiSxK63BSGB8wh3O4OSbw1L1LpiQ0qVgAVoBCwZpdJQWkGG0ZBvm
 lQMaVn6dj8QcwmatAm6MVTTKgjDdGs+7zhUU1hXqEjSSqne6kJi7W0TwCBG026UxoisZ
 ifvAOue84oHET/dTmfWlxYG+cbqROZu5bsYNmU7JvXC+qeMGl5Vr14iSWVMCrN+pm4Af
 J4wYrGpWJMWPT5l6tHNgwu5v5EMgXjefTeN3P/bHaWtZ3hd6aUv7xBO+Mj14WB1SnHSx
 10mQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzpfwb8ylOcHhSGzj0C1dQqti5ylGTvL5vGiJ312X7Nb2sHHJwj7zCM2MRj6mi3toFMzMZfH00dprm@lists.freedesktop.org,
 AJvYcCV/ULtt7YoazjUSxVw7Lt21SRe17Dk5VmPffxVvLVrcGOYd9ST/TEHAzpqy6m0IuqsPNWWpRMR0WgM=@lists.freedesktop.org,
 AJvYcCXcMoVRxRn0sN4ecrmsyVsKp+rZEbnFa7joKS0jlX13ph7T77+B16kL+S/CSpgBIjb4OPrmI1nm3Oo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywb7Kg1RR9ZjJ6PIBv5W4NjixBONyqyirPEh8s8J3SLTCYK7CWj
 3wZGRnbK5tvNcRmeaifEcVoiPez+FmOsyoUO80Qi8y28mfVmdBTUv4MU
X-Gm-Gg: ASbGncuvGp5mkLQ69IKPOlEwHV31EZhXGHU2qNimxDfnhU6s1owOS5jlKAdwhmxCNWy
 v2i+ACPNEDpMKOSI7DQJxz92WKqWihJjl/jSGiX5RU7QDwWbCdljHyQAm1Gkc8I+CGUCYMhNIfF
 raIUWVaUx/Y82CMuwV2fmxbkeJltrpm4fzMB2jDCycIuCLUHhr7Lh8IjZif9OOeQQXl79MK2y/g
 qpzQRkI5aXFXAcjOE3JJ3YT4obn3nTjCnnoHhYpwe9eALqJsY/432Vi+7Eoijrbwvka3SuyrdIY
 W9S23RzsES20LJMQu8E5YHtmAm6k2zK9dd3LyL2seSDtlJDh6mC1u+LzmGLlRvS0D9md3eaOO3w
 KiXtGt7zg3bvoLv6LN4Ps
X-Google-Smtp-Source: AGHT+IHRUIFfk9gz4OB4Y+SE7zftDanV1i9jiDcD2IjcPO99vt6qOHujHP5z/UzIOWiXBR0Xkfe+wA==
X-Received: by 2002:a05:6000:1acf:b0:3b7:930a:bb0d with SMTP id
 ffacd0b85a97d-3b8d9470d8dmr446930f8f.20.1754066854170; 
 Fri, 01 Aug 2025 09:47:34 -0700 (PDT)
Received: from localhost ([87.254.0.133]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b79c3bf970sm6418504f8f.25.2025.08.01.09.47.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 09:47:33 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/i915/bw: Remove space before newline
Date: Fri,  1 Aug 2025 17:46:58 +0100
Message-ID: <20250801164658.2438212-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

There is an extraneous space before a newline in a drm_dbg_kms message.
Remove the space.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_bw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
index d29a755612de..ac6da20d9529 100644
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@ -359,7 +359,7 @@ static int icl_get_qgv_points(struct intel_display *display,
 
 		for (i = 0; i < qi->num_psf_points; i++)
 			drm_dbg_kms(display->drm,
-				    "PSF GV %d: CLK=%d \n",
+				    "PSF GV %d: CLK=%d\n",
 				    i, qi->psf_points[i].clk);
 	}
 
-- 
2.50.0

