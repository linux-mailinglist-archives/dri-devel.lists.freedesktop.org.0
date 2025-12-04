Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFECDCA27A6
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 07:14:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA11010E843;
	Thu,  4 Dec 2025 06:14:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="frwfEVXJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4550B10E843
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 06:14:49 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-b73875aa527so77644066b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Dec 2025 22:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764828888; x=1765433688; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vYiswRj/QaYbkwuLO6ropupZ4HLa9+N1VAg/V5RUYGk=;
 b=frwfEVXJiGhb6cW1xVe37jRZ9K32BvXJ50q3RUNPOrMIvw7QbFrechihV9b0kscBFp
 UmO19JL2zwvKcfNaexdJcOVQTprorKdjIQIMntuPvaSXi5TZ+8GFKEdFMGTDTit02IxQ
 r+3B7VSPKCGWhrTuzWSSDLzr6wgG8lmBlTCFOpg/sFfNObHFiqRuaiWdceey2F9O50Ca
 yQGxTi/tBk+ijGflfCenTmRZzFYMisrRN625a3loBQ2neaCO0jl+goOGsD8t2Hzr2UvU
 1yOaWIuKSXXK0xXOWKKkZg4/1t21sNIhBF6Awwl/XnORDJxJ4trvAnIwwKL6NuOlzRjp
 aTuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764828888; x=1765433688;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vYiswRj/QaYbkwuLO6ropupZ4HLa9+N1VAg/V5RUYGk=;
 b=bl6K4fy9W9RBoGzZOGyruoHZ+71VsXjbvDWGGDedCMnIJLCwH8K2279+ZgJRCr2Oce
 Rkuy88ek15coV52Udea1UeDUlSG2u818GdInBH7P5tviSFyXBgItxX3ZWzx+UkrlIv9/
 eLj8QuBRv0BxZL23MVpLj1ADOj5lM2t7qmtwBUoOyZFd+bNQxSTZe/Xo5a2wi0v5rUHi
 zmCWCMY4hga2N4TnSaSwJcI5ZxCGWC+J16DS+tuio2KNi7OWEYSmjtyn6Df+NvXbFBPf
 UUFBP6D68rdOE8ot5bb3Dy/kkr7yHXPX+KOdDDp5AOXvSH+HrGDDkeUJ/dG+6pOIuBfE
 Rl6Q==
X-Gm-Message-State: AOJu0Yz7QcWJje4XB4oqdcco6F1EoYOgkgXziSMR/6dHALWKOZ6Du9LP
 AFmOwu/Rsxi/Yds3Fr+3FQD1+spYijDg0E8c85p0pfqZs0ahmvqvgBl7
X-Gm-Gg: ASbGnctNXYwgWnO9t+SjSrunWO0i9WUFxMTJrjMRoSw/n2aqo9Vc83stHC/c3hpVB+y
 d8VpQ3TmHf0sSxsPk2lTcdZqCWsfIleGsbXEf90hCXzjK7VjFnBDe7Bkeo3ruGj8v+j7Ehdmse4
 g0IT4ai8PpQGqjyqJi0MO3WUsRtHS+6esj/RMeNVFreLckO4t6jQfcAzawUEmgd+d2SQ+U0sj4d
 mPr4JW3x1uSh/kFcXJdyb6bCcDv6tFg59B6GfUPH+YuSDxdvk5LO2fiyZTIYVx5LqzFk6JOvQmp
 D5yW5cKA/43+SfaNyybV6u9l6v2thvdqVoxXUGMov55V4HEP/xzjvAMchvFdECA7lyRem5d89D7
 D4BF5Q8F+rtTKFJBPRnSfwTxCvayYzX1pCY5JX0A31DX2sJK0V3dShg0KRq2HyPjXEOtlksjl89
 U=
X-Google-Smtp-Source: AGHT+IFFxhTMIa5+kk08uLpT0I+DrZEQ4kNYGNnKIoSZESkvBwYMSmeMpr2IbKVmYL/ijgj/qYJJkQ==
X-Received: by 2002:a17:907:9625:b0:b73:8639:cd88 with SMTP id
 a640c23a62f3a-b79dbe8fd42mr443652866b.22.1764828887748; 
 Wed, 03 Dec 2025 22:14:47 -0800 (PST)
Received: from xeon ([188.163.112.74]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b79f445968asm50607866b.3.2025.12.03.22.14.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Dec 2025 22:14:47 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2 RESEND] gpu/drm: tegra: dsi: calculate packet
 parameters for video mode
Date: Thu,  4 Dec 2025 08:14:36 +0200
Message-ID: <20251204061436.5401-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251204061436.5401-1-clamor95@gmail.com>
References: <20251204061436.5401-1-clamor95@gmail.com>
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

Calculate packet parameters for video mode same way it is done or
command mode, by halving timings plugged into equations.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/tegra/dsi.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index aab555a2eb68..1ec3f03d2577 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -545,12 +545,19 @@ static void tegra_dsi_configure(struct tegra_dsi *dsi, unsigned int pipe,
 		/* horizontal back porch */
 		hbp = (mode->htotal - mode->hsync_end) * mul / div;
 
-		if ((dsi->flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) == 0)
-			hbp += hsw;
-
 		/* horizontal front porch */
 		hfp = (mode->hsync_start - mode->hdisplay) * mul / div;
 
+		if (dsi->master || dsi->slave) {
+			hact /= 2;
+			hsw /= 2;
+			hbp /= 2;
+			hfp /= 2;
+		}
+
+		if ((dsi->flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) == 0)
+			hbp += hsw;
+
 		/* subtract packet overhead */
 		hsw -= 10;
 		hbp -= 14;
-- 
2.48.1

