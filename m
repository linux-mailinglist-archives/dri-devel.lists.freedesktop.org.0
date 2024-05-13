Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AC88C48E2
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 23:31:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A364210E996;
	Mon, 13 May 2024 21:31:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="DjSlgLFz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE7DE10E996
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 21:31:35 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a5a7d28555bso101156866b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 14:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1715635893; x=1716240693;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KHM5OrKq8XtLFGFwS3E7+LYEHMOw759zWdrMQnI18lk=;
 b=DjSlgLFzCVIViCKx+y4gTFHpbu2pdP8GhC3PiqpUzl/jpVbBVBPnIeef2Y1xqHpDxj
 8/GRRALm5qL4eY1sm3MMuqJAHXimJKxD5HvT6EZhbUzvAo/D8pw4uOOzwWtX/NUUSBxf
 3Dyivys3aNmnfL1mLfjTphr8iCidgzKgDs8DjRceKz52YfeYhxlfjfz+kJsqd5KJxBhf
 jtxRw3/3zKGShHUZP+nhJXFEkd0EBadF4qoaKt+wcwia/joYZLkqiIzLmtqC2pbfLlIl
 x9eQn0gwIdhME3NyEuMm0pCIis671ef8y5I1QY8LTc/poDs1wg7+IjSCEoqAzbQsyPuj
 FADw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715635893; x=1716240693;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KHM5OrKq8XtLFGFwS3E7+LYEHMOw759zWdrMQnI18lk=;
 b=hq8sAWaIHskj0vlP9QT5ZtUkBX55L1gVfQQau9XxYQ+ZhkcWPkE8zLXhCtQydDyNs7
 TVv2+ORoQzsG5GvGZAtbCGr2wRb3mRV6DlKB/MPF7gwSuO2CsllBUWzgJ3aXbqlCn/nm
 3DI/u4r6EEWfbi9ZGmO3tjOUs74NdMJ7tycJTdXykIo+w9dv4o0wXoltw2+C62HX2P+x
 TfspnDv1UspjulBNWtWL+DgEnGW+5/FeCP1egZ2w7Y7ktN/QLArV0nZ0Q6QHDDRzzhvF
 zgL3EWs+33Ru9NcyX3G9VW23qi5T8QSKsE48StXR+u+OVgc4fgcmlmDsHLOUYUhrOITa
 XurA==
X-Gm-Message-State: AOJu0YxtWToUPIdxdh1KeG9XGS52rq3yNOseMyUmjE4Zuk1nOPgl+GmQ
 IT7/RpU/ALP0SCuXjCO+cqDL+DpYInObIjUF0Yrtw5lRH7Z8ThQGZ5SX67C8KFo=
X-Google-Smtp-Source: AGHT+IFRtIdiCU6HVhtdEvjPxTd68hHuSXaq7Nk9aW986VCC2SUhFWuj88xAWlYO1YHE9NZl0vVLQQ==
X-Received: by 2002:a17:906:7d7:b0:a59:b6e8:9ded with SMTP id
 a640c23a62f3a-a5a2d66a283mr687658866b.59.1715635893486; 
 Mon, 13 May 2024 14:31:33 -0700 (PDT)
Received: from fedora.fritz.box (aftr-62-216-208-100.dynamic.mnet-online.de.
 [62.216.208.100]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17891f6esm644037366b.54.2024.05.13.14.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 May 2024 14:31:33 -0700 (PDT)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thorsten Blum <thorsten.blum@toblux.com>
Subject: [PATCH] drm: Combine identical if/elif code blocks
Date: Mon, 13 May 2024 23:28:38 +0200
Message-ID: <20240513212836.292589-3-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.45.0
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

Merge the identical if/elif code blocks and remove the following two
warnings reported by make includecheck:

	asm/ioctl.h is included more than once
	linux/types.h is included more than once

Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
---
 include/uapi/drm/drm.h | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 16122819edfe..315af7b19c97 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -35,13 +35,7 @@
 #ifndef _DRM_H_
 #define _DRM_H_
 
-#if defined(__KERNEL__)
-
-#include <linux/types.h>
-#include <asm/ioctl.h>
-typedef unsigned int drm_handle_t;
-
-#elif defined(__linux__)
+#if defined(__KERNEL__) || defined(__linux__)
 
 #include <linux/types.h>
 #include <asm/ioctl.h>
-- 
2.45.0

