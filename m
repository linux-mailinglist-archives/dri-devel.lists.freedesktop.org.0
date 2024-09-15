Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0C6979688
	for <lists+dri-devel@lfdr.de>; Sun, 15 Sep 2024 14:02:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F6AF10E09B;
	Sun, 15 Sep 2024 12:02:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q0HLDVFp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F27CB10E09B;
 Sun, 15 Sep 2024 12:02:15 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-42cb58d810eso28480165e9.0; 
 Sun, 15 Sep 2024 05:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726401734; x=1727006534; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=P40wET+w71UJyEkZ9BoZfs/VvG0c/BBfUWCIfkdVP7I=;
 b=Q0HLDVFpHzkHyP67ws8Fsgok/VbJtFGAG0IIqrz2MkHBJFWY6NtrPWsokn+4om3tWI
 ecqYu5ulFSupo96DXbcJ/R64Sajv0mFYVkqonCBzEZj6hs5tNAeHQD48dsUR9sq2RRi0
 38PM8XNl+lDZ3j56ERqlgolcZb8N09tyQ5XwrTN3V1ujfP0H3Ncf7Nh1tgbmU8Ez2SQt
 N8qt+ljn9oANRSRnn9LH/90BtueKp9Iv0JgomGwRme3H8rpHsU/ERCFrBTKJU4qfQ+dg
 mRe+LaumH8DIWdN80qMA0GYdTZ6TQF+7EOWNTs1bok7U7ZlTdUlPdfNQIUX80+HlzE1P
 4Aug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726401734; x=1727006534;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P40wET+w71UJyEkZ9BoZfs/VvG0c/BBfUWCIfkdVP7I=;
 b=mp60SN/7r7jsF3t8WzlKgA2SaKjW88w0BOjk0Tvo0Vmi4O2puPUB6yi5C1rzZAYKl3
 sS89xWEia/cijvuXR7VhtBuhRA8oK0pZL7VVXh6ANRnxNm/9M5DJgmKeJm9L/FI5d8FN
 Isn6FfFgeV5YsspbfMqs4Iqk8DxZmOQGD5pKC4+E4qQhR4ft5vzFm6QrH5HSk0z+vHGs
 N5zLioLhjGwisE/wy+pKVUbX/qWAOd08WG5MYgblEbBopvgX1gM2bze4VCtDaX2yB++t
 TntKG4qNwBaiS7KXjtsRfcrWlp77urI8x6aibCeLQWZmTbKmHuV3cNjYwBxSo44s5h3i
 zesw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkFGwR7hMBuJecgx3Yd+jEqsSkGjwrt3FTKHr7IBeDuBeY7HnwLBH3r4sbDAht3HLytQvIq/P+Bnc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyM5QkssWb2wg1TFdD79hZzuKy9VTsLFzbmQOPU8T+fv92SBAj1
 bGh8E4sT7/i2Vt5Wj4jtVd/NZ0EI1xv+Z6XMNML1zFV0myQ7D+1F
X-Google-Smtp-Source: AGHT+IEMZq4/JjBZ/u6UVGa7+slA/nrX41Tt9k6PRPk4mhaKvy6qtno+rb2b7xGKC7WriVIwr6K5xA==
X-Received: by 2002:a5d:5745:0:b0:374:ca0c:51b0 with SMTP id
 ffacd0b85a97d-378c27a8a55mr7714570f8f.12.1726401734007; 
 Sun, 15 Sep 2024 05:02:14 -0700 (PDT)
Received: from void.void ([141.226.169.213]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378e78054b6sm4497832f8f.107.2024.09.15.05.02.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 05:02:13 -0700 (PDT)
From: Andrew Kreimer <algonell@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Andrew Kreimer <algonell@gmail.com>, Matthew Wilcox <willy@infradead.org>
Subject: [PATCH] drm/i915: Fix typos
Date: Sun, 15 Sep 2024 15:01:55 +0300
Message-Id: <20240915120155.101395-1-algonell@gmail.com>
X-Mailer: git-send-email 2.39.5
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

Fix typos in documentation.

Reported-by: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Andrew Kreimer <algonell@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 2 +-
 drivers/gpu/drm/i915/gt/shaders/README   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 1f83b3b67ea6..062e61cf70a0 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1017,7 +1017,7 @@ static void hsw_activate_psr2(struct intel_dp *intel_dp)
 		};
 		/*
 		 * Still using the default IO_BUFFER_WAKE and FAST_WAKE, see
-		 * comments bellow for more information
+		 * comments below for more information
 		 */
 		int tmp;
 
diff --git a/drivers/gpu/drm/i915/gt/shaders/README b/drivers/gpu/drm/i915/gt/shaders/README
index e7e96d7073c7..4f5dab3fdcca 100644
--- a/drivers/gpu/drm/i915/gt/shaders/README
+++ b/drivers/gpu/drm/i915/gt/shaders/README
@@ -24,7 +24,7 @@ on building.
 Please make sure your Mesa tool is compiled with "-Dtools=intel" and
 "-Ddri-drivers=i965", and run this script from IGT source root directory"
 
-The instructions bellow assume:
+The instructions below assume:
     *  IGT gpu tools source code is located on your home directory (~) as ~/igt
     *  Mesa source code is located on your home directory (~) as ~/mesa
        and built under the ~/mesa/build directory
-- 
2.39.5

