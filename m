Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC298AE4CF6
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 20:47:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0379210E1E8;
	Mon, 23 Jun 2025 18:47:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BzPlDsrU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99AC810E1E8;
 Mon, 23 Jun 2025 18:47:40 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-23694cec0feso42348885ad.2; 
 Mon, 23 Jun 2025 11:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750704460; x=1751309260; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lX1PV8eCj+w6gmSly9JqA8eydGEbPW07Za33Kr6VYKg=;
 b=BzPlDsrUKyGoUR5xZ1OTFBscIwXkXPK/H4opRuyL8uAbIpV+f6pFnR3TqLQTaMiYTA
 gIfeQ/hhe9WNaVewqqSBk9wmwADAqKvPkfypITTS/Sl7YwGUY2OQqY0qdi/ELrfP3JwV
 qST4YehY99PE89zQNLvgMGJOceo7g4C7EZZ6yvjaOYU5WnSbsAgqO8R5lUkwHGL2ST3U
 KtOEsE02YWymqusemjDJNfGexL/k2L6nh5aR9cf5DbCVZITuAPvRTt1mF+DxHEygQOnr
 TpWIyecJ70DJPeHJmsMVAAsBNemg911AIgZ5CZ0btX9nYVV69cLgvdiEuTyumPcMf6Wu
 /f9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750704460; x=1751309260;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lX1PV8eCj+w6gmSly9JqA8eydGEbPW07Za33Kr6VYKg=;
 b=tYKGzOKpmF0BLV9dPFArNWlZnmKkVt2jn+qwVrtfEbxv5kN/4LMSH/6RoQY5PNdqxp
 X4VJONaBEV6NLWddK4jMbt42tQxxqZFwHcd6gmhhuoCRHOdagdqsduiL6bib8vhUMmWe
 vaSVaXRfMIONPN2kIBwznUHdgTHzICGLqz/BpiI7mp8Ck18iKKD11YfD2hi5+zfzX7xl
 UkpiMRc5Cod/kZnkuk31A2AWds2nJBCUbz0jd0voayH5VsiD8DCvIoDpH3tVm7FWtzJ0
 hGqf8fFqBZBo9L6FAeTmAUD94pNnmQVBdnGShYVQS7tTs3nS1ISJKc9Xh+4I8PI6YiUz
 Mbsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqdkasUHIn8GgAp9bvQVIFIu2CaCOSagjAOi01p4EYKEWGJb9L6TdKK7oX2c0fvqepF4Q2DdyDHd0=@lists.freedesktop.org,
 AJvYcCV9oR8g2EQe8WWJYsSGCFiPJlxnN8IbNwLtOUzZqam1riilnW1NvlflIiEj2yLyrsU7U03u74krMdid@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9G5Im5n6gS+kiCFBrITC3qMPrLZ0pUSS7HOWzlY4flO7RdWNn
 EoaV+ZzfxDrAz6BZ0qkXvELVv6aJ2atuwz3b/YyIy8HiKGOvKEb2arlX
X-Gm-Gg: ASbGnctii2WHcGIF8KUWZmTxXYWPx+OMArc5VNNmXQReDWqJhWAr591Cuh1Def0Jqgk
 IR5fSM+ws7T56EF4jOMGCJk9wbXFik/ZvJq8OS5aKhkI2u/tz1OAfAXC4HGpCSmAGZLDiQLvBSl
 3OiW5IJb/TSlngDZF1qlGpD7Uk38f952D8YJ1xlXBPCe00fX8qrMrudlvfzLc9tqqIM/TpFAA3i
 jW8wCZiWCH9vd5KqSvWhEsC+gn7gnG8VTjQfYsLKjZSZj6TaYAhYSGwXu9D5clyIbmOylWTONuQ
 W3HQPWxEi2UluYrNkkdr6DhrMH8fDuO9zWtvfGdjd5ifoJHJ/2Vu82YAnVNA7PVSpmWSp0nv+vu
 m4sbUm+VjtkszKrdMsCaibcI92wc=
X-Google-Smtp-Source: AGHT+IG+q7JDDjJJiD6LIsW+SwYhlGS8aClQvrcI6niGs17mM8MdIZ/h4GRG4ZubHXABG5IObcnk4g==
X-Received: by 2002:a17:902:f64a:b0:235:6e1:3edf with SMTP id
 d9443c01a7336-237d9878c08mr226699925ad.34.1750704459951; 
 Mon, 23 Jun 2025 11:47:39 -0700 (PDT)
Received: from vaxr-ASUSPRO-D840MB-M840MB..
 ([2001:288:7001:2703:229b:2db5:edc5:d79f])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d86150d8sm88037745ad.123.2025.06.23.11.47.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jun 2025 11:47:39 -0700 (PDT)
From: I Hsin Cheng <richard120310@gmail.com>
To: robin.clark@oss.qualcomm.com
Cc: lumag@kernel.org, abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, shuah@kernel.org,
 linux-kernel-mentees@lists.linux.dev,
 I Hsin Cheng <richard120310@gmail.com>
Subject: [RFC PATCH] drm/msm: Remove dead code in msm_ioctl_gem_submit()
Date: Tue, 24 Jun 2025 02:47:34 +0800
Message-ID: <20250623184734.22947-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
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

According to the report of Coverity Scan [1], "sync_file" is going to be
NULL when entering the "if" section after "out_post_unlock", so
"fput(sync_file->file)" is never going to be exected in this block.

[1]: https://scan5.scan.coverity.com/#/project-view/10074/10063?selectedIssue=1655089
Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index d4f71bb54e84..cba1dc6fe6c6 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -904,8 +904,6 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 out_post_unlock:
 	if (ret && (out_fence_fd >= 0)) {
 		put_unused_fd(out_fence_fd);
-		if (sync_file)
-			fput(sync_file->file);
 	}
 
 	if (!IS_ERR_OR_NULL(submit)) {
-- 
2.43.0

