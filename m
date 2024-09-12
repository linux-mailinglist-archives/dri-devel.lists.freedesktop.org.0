Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C18FC9769CA
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 14:57:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE5D510E967;
	Thu, 12 Sep 2024 12:57:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y8rJhCF/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B18AB10E967
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 12:57:42 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-42cae6bb895so8756375e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 05:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726145861; x=1726750661; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=radmw+TmBlscrRZxkZ+tHMrAuVzmASyCuq4LLVLeMxk=;
 b=Y8rJhCF/iIFQo2S4CDsaDOoPx3A0s4ip2nSyZNzxlB8b1Q5bvVXubzMX5zci1k2PVA
 78p0C6srj8ytAQxdwj9Ixfj+YyHANgC3QCUjqeCd7S8O6LmfhFREVUif6wPbt0lqlxSl
 BMprpkvnBM8uuX9SJVzSb1ze2fWroqIc9n8qWzr/OyMze6dshImXRpxT8QntAhi1d3TT
 QmsgF6tr26jywTZfWlgpoh4P9qG3EP9u2gM4OrLfyYSIxz7jYdQbpJyIo6Ikrj8/Ge05
 u5cUG77LcjUXU+gzSkax+/jTqan0cUIdGKEGomcMwxWNmxNmrnCzGE6CUeNBuMHGeskg
 M7+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726145861; x=1726750661;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=radmw+TmBlscrRZxkZ+tHMrAuVzmASyCuq4LLVLeMxk=;
 b=nmDU6ghZbYaDrXbsOtIiSnvLX25kRopo936XZKIPfOx6JgOcfX5sJ+Q2bnYR/vA7zW
 iyDBJvfWVQSdQJEYiyrTbMNw2XZwjm3tqeQcC+jTuTYS3nZB8cEXGO4JVa/JjzY1bAB0
 yrQ4kvILxeuVl9LMRJsmf/X8Ohr4c/xVCNUzJ/+GJB6axT++zc/8t7laYYurTW5WjNtq
 dfK8lTuPSXKD/lGQ8RiQ+fMJcxrtZp1ZlAMgpodWa84Mb6D3SmO6pobd/J99vjI5FTjW
 TAZwFP0tipZfo80RhnvREEzdDN6nQ6Q6QmshNmkdFnCUyMYoPUSgpGyHRi4lTwWR/03k
 HQhA==
X-Gm-Message-State: AOJu0YyOvCAoZBe0ngX4JuKa48i+LsQMkXJZKGN7vmrGPRccJ8xjN5t6
 zPUVww8+hESXGSnAF4/OtjQVp+K9CZrqmmakbyhUAiZgnN2btxewrZbf8Ike
X-Google-Smtp-Source: AGHT+IH4upBG1YMo8IZ9xkFa7vwnLeVv89WopCWiWfGSfCazpwQKdz/gbnuU8tS0Sds2dPgrxjO7cw==
X-Received: by 2002:a5d:6183:0:b0:374:c454:dbb3 with SMTP id
 ffacd0b85a97d-378c2d620femr1414942f8f.55.1726145860209; 
 Thu, 12 Sep 2024 05:57:40 -0700 (PDT)
Received: from void.void ([141.226.9.101]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956653c6sm14313315f8f.32.2024.09.12.05.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 05:57:39 -0700 (PDT)
From: Andrew Kreimer <algonell@gmail.com>
To: Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Andrew Kreimer <algonell@gmail.com>,
 Matthew Wilcox <willy@infradead.org>
Subject: [PATCH] drm/tidss: Fix typos
Date: Thu, 12 Sep 2024 15:57:24 +0300
Message-ID: <20240912125735.45114-1-algonell@gmail.com>
X-Mailer: git-send-email 2.46.0
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

Fix typos in comments.

Reported-by: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Andrew Kreimer <algonell@gmail.com>
---
 drivers/gpu/drm/tidss/tidss_dispc_regs.h | 2 +-
 drivers/gpu/drm/tidss/tidss_plane.c      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc_regs.h b/drivers/gpu/drm/tidss/tidss_dispc_regs.h
index 13feedfe5d6d..e88148e44937 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc_regs.h
+++ b/drivers/gpu/drm/tidss/tidss_dispc_regs.h
@@ -49,7 +49,7 @@ enum dispc_common_regs {
 /*
  * dispc_common_regmap should be defined as const u16 * and pointing
  * to a valid dss common register map for the platform, before the
- * macros bellow can be used.
+ * macros below can be used.
  */
 
 #define REG(r) (dispc_common_regmap[r ## _OFF])
diff --git a/drivers/gpu/drm/tidss/tidss_plane.c b/drivers/gpu/drm/tidss/tidss_plane.c
index a5d86822c9e3..1396bbf9616f 100644
--- a/drivers/gpu/drm/tidss/tidss_plane.c
+++ b/drivers/gpu/drm/tidss/tidss_plane.c
@@ -59,7 +59,7 @@ static int tidss_plane_atomic_check(struct drm_plane *plane,
 
 	/*
 	 * The HW is only able to start drawing at subpixel boundary
-	 * (the two first checks bellow). At the end of a row the HW
+	 * (the two first checks below). At the end of a row the HW
 	 * can only jump integer number of subpixels forward to the
 	 * beginning of the next row. So we can only show picture with
 	 * integer subpixel width (the third check). However, after
-- 
2.46.0

