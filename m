Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F33C74B54
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 16:00:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C85AC10E76D;
	Thu, 20 Nov 2025 15:00:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DpQCWMU6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECFC510E76B
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 15:00:24 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-640a3317b89so1600755a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 07:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763650823; x=1764255623; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TR/tq9rqcXsmUUX++Z4tC7vtqCs6KQO5/msjUdFZ3Jw=;
 b=DpQCWMU6mF6bQsKKnSarSsMiESsGLob+kE6edRM6Hb70d4AkhKWMrrpQ8DdyZLEse+
 eKWPDHDMX5k4wfonH52ONXCOsDD6U0YbCLEfT+MPmky+vVtspZWrYt93TRBSisF3KTBy
 Y/5VaU+iM+3kDrYnMd55A6W7CBkKqcSj5j7X5PqXZ5QzNc58WXr4AOWXAxfAXw0iszbP
 8oMUSenooMn1vkWybSH+CkPjxZgZSqvKPXCQwWuetiHRQOrsJYzV6eTIMUTRTPXy0zxn
 BMK+cNDCqBVOQ8GLzHNPPdI4YWlrTFL1427JpIXsVyWdbNukIljIiYRThC5dKKzgWV2r
 ll/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763650823; x=1764255623;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TR/tq9rqcXsmUUX++Z4tC7vtqCs6KQO5/msjUdFZ3Jw=;
 b=FPHSVCbG3dF4XVCckptL8GfzZBsGjQYggD5gSVGCTTHmxs1MIiimwMtXFZbrJOF43Z
 slpi2Bi8ZoXoN47R5joayUhYfjRRuCx2N9khE5m9ReALWcjyH6SSkckk66U5E8jcQ7zW
 VBUPbciM6Nkya0obg8FYw30qDbbBn8QA7Ioo3Kg9lbvUos8HbLW8FVm4Wu0COzKm2q1I
 wSI0GtAxI0zUA+dcrHSjwLvT4xzKS6AhfYWY3CRe5kjc1K7m5hcmnraNwK8xrdynMnZU
 cBYEIZPzgLfHwL9VTBDegAUpFYoHB1vj5r/ToaPEFilzB3oK1IQOGDmuHN4HuSJjUTGq
 kXsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUO10/yHxJ6A9YR++URrQy8VnTGOwhD+HOTPmCu2X/ug5A5YciwJFUttxiuRcLej3fY9WV4I+s9/ZM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrGyXXeXY/+KPPmOokXPq22m93no3avdZOfrV5s9GJxc/8wHSx
 hPs/XDk30eVtuGVb1bxVOJuSYygvb7zeUCdFY9FkHR0FOCqz514ZBleA
X-Gm-Gg: ASbGnctwt/x2o2L28/pghyjWlrXc5VINVW5ZOaL4CPN85ZznNsNcVLuOLsBXt0/mlMZ
 j2KdVlsiIju5hPc4hXu2dYNzbYb+SbBG2yuXarqtu8DaYtmMLP3qCD3Wubh75wh1kWlAMoJViKK
 YbkWqjcKeI3xyeuma6dygux7++ZhpvLvYovSaxxDDKrAFmI7IJaziWW2fWl5zedjONvIHYlZGfa
 pe6GtmLO7nqexXIFEMGw/Ekh33d8qCy3wQodwhf5mTP7f6VZvefOvU5Hdy5Ca53Q8i8zpuibQvq
 5UPRcsqjgWc6OXAPkN6UdyYkS9+7zs/p5RWhMFEjZdo8/cHtIMpgQGM2K3B1ITMH8buJNB0Ruc8
 pWeeOwVUOqPCBBN2xQxw5fV5pS8v+PNWhlSY1fF1vN7e+0ExfMqElWftBov0pMGVSBM0hK/hhvq
 ZbgthbUgI9nURzhXBysejhOv+d
X-Google-Smtp-Source: AGHT+IGuzNVpVHWhhWfLfTS2UWEMGrYSwJP3rK1+vj1kUJ1S/t2YyQMCeHfaZUx+JETxy9PwKqvPGg==
X-Received: by 2002:a05:6402:1ed5:b0:640:a356:e797 with SMTP id
 4fb4d7f45d1cf-64536403e48mr3137102a12.13.1763650823291; 
 Thu, 20 Nov 2025 07:00:23 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:154c:c900:7aba:c4b7:a402:3cd2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6453645f2easm2205878a12.33.2025.11.20.07.00.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Nov 2025 07:00:22 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@kernel.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 faith@gfxstrand.net, sumit.semwal@linaro.org
Cc: linaro-mm-sig@lists.linaro.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] dma-buf/sw-sync: always taint the kernel when sw-sync is
 used
Date: Thu, 20 Nov 2025 15:41:08 +0100
Message-ID: <20251120150018.27385-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251120150018.27385-1-christian.koenig@amd.com>
References: <20251120150018.27385-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The SW-sync functionality should only be used for testing and debugging
since it is inherently unsave.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/sw_sync.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
index 3c20f1d31cf5..6f09d13be6b6 100644
--- a/drivers/dma-buf/sw_sync.c
+++ b/drivers/dma-buf/sw_sync.c
@@ -8,6 +8,7 @@
 #include <linux/file.h>
 #include <linux/fs.h>
 #include <linux/uaccess.h>
+#include <linux/panic.h>
 #include <linux/slab.h>
 #include <linux/sync_file.h>
 
@@ -349,6 +350,9 @@ static long sw_sync_ioctl_create_fence(struct sync_timeline *obj,
 	struct sync_file *sync_file;
 	struct sw_sync_create_fence_data data;
 
+	/* SW sync fence are inherently unsafe and can deadlock the kernel */
+	add_taint(TAINT_SOFTLOCKUP, LOCKDEP_STILL_OK);
+
 	if (fd < 0)
 		return fd;
 
-- 
2.43.0

