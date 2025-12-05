Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E70FECA6DBF
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 10:18:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9648F10EA98;
	Fri,  5 Dec 2025 09:18:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="O+r6yDhd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D2F10EA9A
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 09:18:13 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2953e415b27so22006525ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Dec 2025 01:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764926293; x=1765531093; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0j0YJCbS6oQYnQ2L4OupANlWwp/+4TrkKlZ23ssyQ04=;
 b=O+r6yDhdweVnicUXtlEOyblrDfoSSYgXfjVfNXr2zWT9/yGGg9lKSgYnpwiZzdAVki
 AdRWsJs/FhF/FK1FtLV1jaHimjE2vKy8kg0cYZAB3ruF0PF9BUPX5YxYTu0eYSGHsJuP
 zNWlL1M+CkGwUInbDeZcuLzr8tksosZjEAQH/zzvWovrJ8w0p5jBvJd5MUhHvdaHpGMu
 pLJdQF6ub0Dg3J4iXca2+qIryDtjLmUhKZUnOmkDXh9u6CDrX0x9v35otUEeKpapqpD7
 DZeDkfyLBLE0V2CcLUtndrbuGZBo0/Ya7OfR838JGPC7Ox7MXAOtCFi9yI9oCHuQnqYg
 u82Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764926293; x=1765531093;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0j0YJCbS6oQYnQ2L4OupANlWwp/+4TrkKlZ23ssyQ04=;
 b=c7a6wpHLoNCNUZRkcYT8GlN+Wlr5YmNRwoIFYyP+3h74GR+3QuUoh/rfCgPlHEdVE9
 fB4CouCqNdgl/S6ZyqtxdI8Ve1OOfl/2S+CIqez+04vr20Os1DuKLqEjO7nqHLz0ixwl
 U/MWsxcVvudHwxZGhcAMVsqmBRMBzf989oS/DFQyMCNtod7sE9LHqfcN6p/bpyltZuKX
 kKfGHVq7OBQbT9UAMFIokiFBIqhY7RCqG67ZdqYi7c5qSIG+m0Tsq7Rv3wtuCiBOB23v
 v9jakaSghXvzIeZ3QZCTgvFxH4PHKjXlh9R31GdHIUz7x4dp6UKAdadTCdFjpIlXWbYQ
 h61w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+8Qyfdk1iocrL9C7cRe+TsIodkOk+F0SIuhFJWsPicCbIoYrdGoDDMVNh5EPiH4YZ52anoT5tHsQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7Y7WbjFxSJgmumOXPceFgUWL2duOaeDWQjnjjWNMMPT6M3p3D
 520WZi260TCb3Lt/VBcvu2d/6Hc7aIy83bDf7OrN0m8FPMuXNu32MF9f
X-Gm-Gg: ASbGncuc/E1CbXgf2SnDtyvvmFMGEGC0nUAEeYIMeaO4/waRQQtd0P/o5IPesectacd
 sygDusE5sf44fVZVIqQAYR+qTMwyO5664B7tULu62G8oFaqB6MkkYIJxMawgU6hgKA8E05NkNef
 AP/tAdAriF9eAVWU1caJiEVuI+D6NQOQ04Km5wKREEzNWo/eZC2Mg49KGie7Zq/sMnSJqEno0m3
 iQURz8UQuTzuVUUapn2ZVRzyfzxmIErJrwPViLYN7NqSp/n4iR9JiYaWQXfxq+akx84W4VZ3W3E
 awCYLWIa7+BzxFU9FIjbWM0IhAsryy0UWDlzaxEicF1wchgoJvR5GuE9LNhjhVrBw/ujz0Hm0b7
 JhfS0SbCkf6/9aNxN/qULgcSIY30BUogZb9uQMv7m8DazTBmogpYVD5Nn9csHzUfaRk51eMO71z
 iD0VtdR9hPQXI9
X-Google-Smtp-Source: AGHT+IGCOUoLvA3u5zLY6BxBk1fzKosrU8MdBnpKcDdVzvznTiuHWoSBQRGAkD5ryaGh3mzYwWxshQ==
X-Received: by 2002:a17:902:eccb:b0:297:fc22:3ab2 with SMTP id
 d9443c01a7336-29da1ebb0bamr71800185ad.36.1764926292730; 
 Fri, 05 Dec 2025 01:18:12 -0800 (PST)
Received: from archlinux ([36.255.84.61]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29dae33c2e2sm42761615ad.0.2025.12.05.01.18.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Dec 2025 01:18:12 -0800 (PST)
From: Madhur Kumar <madhurkumar004@gmail.com>
To: lyude@redhat.com,
	dakr@kernel.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 Madhur Kumar <madhurkumar004@gmail.com>
Subject: [PATCH] drm: nouveau: Replace sprintf() with sysfs_emit()
Date: Fri,  5 Dec 2025 14:48:04 +0530
Message-ID: <20251205091804.317801-1-madhurkumar004@gmail.com>
X-Mailer: git-send-email 2.52.0
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

Replace sprintf() calls with sysfs_emit() to follow current kernel
coding standards.

sysfs_emit() is the preferred method for formatting sysfs output as it
provides better bounds checking and is more secure.

Signed-off-by: Madhur Kumar <madhurkumar004@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_hwmon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_hwmon.c b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
index 5c07a9ee8b77..34effe6d86ad 100644
--- a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
@@ -125,7 +125,7 @@ nouveau_hwmon_get_pwm1_max(struct device *d,
 	if (ret < 0)
 		return ret;
 
-	return sprintf(buf, "%i\n", ret);
+	return sysfs_emit(buf, "%i\n", ret);
 }
 
 static ssize_t
@@ -141,7 +141,7 @@ nouveau_hwmon_get_pwm1_min(struct device *d,
 	if (ret < 0)
 		return ret;
 
-	return sprintf(buf, "%i\n", ret);
+	return sysfs_emit(buf, "%i\n", ret);
 }
 
 static ssize_t
-- 
2.52.0

