Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B57B20011
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 09:13:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FE3110E378;
	Mon, 11 Aug 2025 07:12:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y/CInVcK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9688210E4DA;
 Fri,  8 Aug 2025 07:39:27 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2402774851fso16811945ad.1; 
 Fri, 08 Aug 2025 00:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754638767; x=1755243567; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yO1YpKtKP+ptfoFXdPV58S+ud0mO9FZrS4sipO+FnaU=;
 b=Y/CInVcKECFDXWA4Wf8aF/bPeT9QICxHmEEcZrOUirHUcNjpklJdYZBQQH+B3aFmtT
 BHxs+huOoBRehcPhAoeX0RDOJNXVhMO9UgsRFIgmvYHSOwecWm+6u3ldmo56oxes3odv
 i+NWG/SfGbbtkQKqS+glQBCOtBbDkv3e7HmlLUX4OSCa+KXksfK1TSEjMIP1h94E/+RH
 Q0GpSdMPjwZUOeD8wVIOp5+q+r7GrUg49lK7IAGUqQ1l8/LJAk9U8GycbG2iHCzmmHDX
 ad0Q+Kf/BB+iO5cD07rayzEtu9DeoE2iOab51aRQ4x+qUUqSy/OZNMVFPVrQiC4uFEo5
 JiMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754638767; x=1755243567;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yO1YpKtKP+ptfoFXdPV58S+ud0mO9FZrS4sipO+FnaU=;
 b=KmAtw1e0DvTjh3lFMxs1sTRnQUxc6PdF5cMZD26EkmCDNrIV9g9TyRZNMdk92iEllx
 OrGy6L392dfXK7l8djEBB3APMjz4lEBGEs1A+GYItlALrakm3bo3IVHbIau/AmsR/YaU
 A8u0DxMk/73/E/6MfmB/mNCOh8eL8HJ0pxlhkeDinGHC5QbsScj8bagKbCUiphQtzvOr
 vkdORhdSsthJ9rixNACY5Bq3x+T1cRri3sKGsks85nUYUElcQ3S27Va3zc3xVrJTE59K
 1ElbIruHesE1dHxhakdDHT9i1St5SOgfHgPq7a8dw1+PQcG8zNFakXcYS2H8UpiNjbBj
 Wbug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsTFC3P990fZ7ootDjfY0hL3sd8WVgcMqJTuF2JYPGMqgRP1uWceSub9xu6hOI+XOrbJjgPVb3rOM=@lists.freedesktop.org,
 AJvYcCWvjIS4IdAucMt/bzGleKrJuqVrvoVxaO3Wkor5erofpZnUmoGW6Rh1DIlXHZrXMXmiDzhQ0yf3Zw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3rv/zRgPk2UIazDe8IpYHVbTsRkVCttioCAckfvxGL+s8V5IH
 IyUwxpVPAy4vKiF2QDj5tx9UBWJtaUZZ8yFa+IjTj60INag3X4pN6G5A
X-Gm-Gg: ASbGncvbcU74Nh2xyxPNOi/Ad0iRGYEYR6r/xBmPssCW77BLMu8MVVQ+dBIgkJuSV/G
 kTyKGl/EBuqoTCv48YREIqy6fNF0K+Li/g5OnlymOr8o3SKzxvRG7dqZrJT0QMo1vpieMf+mul6
 4oiK9VHAwDdK4a++dknoEp26edBu/dwP+dEdmSkLdAFZCrKt3RGwxR0nKDMiNoiQ48uYcREqWId
 IZ9Mk+DzkmiOj6uwK6lHAei7Sbe4RtOr85MUxggEUlsVFgwDzYBeEm8R0wO7R2YoJufTS5+WC+w
 +ZfKDB8IzhcE+zDVpWH248H1pGo4hhzI0XlhwhD4G3saG/zwvhZ73OSHWegJ7DwIMyzMxqXfD33
 tQmmPjrd6tLAhyBjaI4QGByY18A==
X-Google-Smtp-Source: AGHT+IHJAphSCGcCrKjr0TL4KujAuKvrfgHh/ezbsFmtY7IQENr8gP6eoXWCL6JC+pybzPRmoIEHjA==
X-Received: by 2002:a17:903:40d1:b0:240:1831:eeeb with SMTP id
 d9443c01a7336-242c22c59bemr31998535ad.40.1754638766916; 
 Fri, 08 Aug 2025 00:39:26 -0700 (PDT)
Received: from archlinux ([2409:40d6:1b:7e6e:e637:1b70:a72e:cd3d])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2426dec66desm121202935ad.54.2025.08.08.00.39.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 00:39:26 -0700 (PDT)
From: Madhur Kumar <madhurkumar004@gmail.com>
To: lyude@redhat.com
Cc: dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 Madhur Kumar <madhurkumar004@gmail.com>
Subject: [PATCH] drm/nouveau: fix typos in comments
Date: Fri,  8 Aug 2025 13:08:40 +0530
Message-ID: <20250808073840.376764-1-madhurkumar004@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 11 Aug 2025 07:12:55 +0000
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

Fixed three spelling mistakes in nouveau_exec.c comments:
 - alloctor -> allocator
 - exectued -> executed
 - depent -> depend

No functional changes.

Signed-off-by: Madhur Kumar <madhurkumar004@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_exec.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.c b/drivers/gpu/drm/nouveau/nouveau_exec.c
index 41b7c608c905..46294134f294 100644
--- a/drivers/gpu/drm/nouveau/nouveau_exec.c
+++ b/drivers/gpu/drm/nouveau/nouveau_exec.c
@@ -60,14 +60,14 @@
  * virtual address in the GPU's VA space there is no guarantee that the actual
  * mappings are created in the GPU's MMU. If the given memory is swapped out
  * at the time the bind operation is executed the kernel will stash the mapping
- * details into it's internal alloctor and create the actual MMU mappings once
+ * details into it's internal allocator and create the actual MMU mappings once
  * the memory is swapped back in. While this is transparent for userspace, it is
  * guaranteed that all the backing memory is swapped back in and all the memory
  * mappings, as requested by userspace previously, are actually mapped once the
  * DRM_NOUVEAU_EXEC ioctl is called to submit an exec job.
  *
  * A VM_BIND job can be executed either synchronously or asynchronously. If
- * exectued asynchronously, userspace may provide a list of syncobjs this job
+ * executed asynchronously, userspace may provide a list of syncobjs this job
  * will wait for and/or a list of syncobj the kernel will signal once the
  * VM_BIND job finished execution. If executed synchronously the ioctl will
  * block until the bind job is finished. For synchronous jobs the kernel will
@@ -82,7 +82,7 @@
  * Since VM_BIND jobs update the GPU's VA space on job submit, EXEC jobs do have
  * an up to date view of the VA space. However, the actual mappings might still
  * be pending. Hence, EXEC jobs require to have the particular fences - of
- * the corresponding VM_BIND jobs they depent on - attached to them.
+ * the corresponding VM_BIND jobs they depend on - attached to them.
  */
 
 static int
-- 
2.50.1

