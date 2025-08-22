Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4B9B31B8F
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 16:30:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFAD610EB25;
	Fri, 22 Aug 2025 14:30:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gfxstrand-net.20230601.gappssmtp.com header.i=@gfxstrand-net.20230601.gappssmtp.com header.b="2ov+f4SC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C923010EB1F
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 14:30:16 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-7e87030df79so238001485a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 07:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gfxstrand-net.20230601.gappssmtp.com; s=20230601; t=1755873014; x=1756477814;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GFhXBKLWgXLZ4gn9cnB7HDJBMyYKfhK6XzXMgqYEDM0=;
 b=2ov+f4SCgjw1+J8JxD63EqYsP1S5yf0MB/yzYF6lPOVUsDvyTTDsjQgSvjaxCYrn3k
 54ygjCb38zcEnANw65UMPjk2wFd1Vi9CK5YYjx1eIndntXByjETLIdTUTHjJqKhU5w1J
 yYaBTQ+Y8vr2UV1lFn/FouPUo1EkDUr6MV3HPEmB2ZQZXkPyA3yoGh9p+2yMMT1dC1SL
 UtIK+qCEt/9Ox6Eu35jjJSwF3aPYOR3+VI6W+/ilh03iE4ZSkFGHFFtsTqie8tvthxfh
 /rOb6NvUS+66NWj5AiWNqXd+vKSe3GMR8iOFNc7Kt0LeqgyO49vOD1v6o8GpBPyohrLe
 g6NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755873014; x=1756477814;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GFhXBKLWgXLZ4gn9cnB7HDJBMyYKfhK6XzXMgqYEDM0=;
 b=omFOgX0ORCKsLk+fkIEGhkcRpZv0okClL88rJEYKGAr5aKpRm9OpM2r2wN2ov50Hdo
 dq2hqdyWANP7fDXFl0n1+RMz6MZPI6eP+smwA7Q9rrDTMp029lGY2c4IkGemGlUa5eB2
 obn3xYHAUPyTufjegr0Ue7a9rKYl7j+JBro4CkHRBnSObE/puSFFGxBHNjf2n9uoS5L+
 yNjezN0hXfh3ioqGZpDfHywzuf3E21gSSqHjonEz09nPy6We8mo/VMb8HWR8mIIA37DK
 Xx99MFOp6imnTn7XdXO1EUPXRWF2lpEJ4msRdKZsibJWGw4DT6RB70do+fwhy6z88adY
 HbqQ==
X-Gm-Message-State: AOJu0YxY/LGEirlR6ci0bqX/+8VGRK7MQ8eGvvASbv90oFV6ykyrSmAc
 qAexEv/ypwJsgfac1yzWpOFp+X1VxwLrSagdmJfU92s2qZMRBYcFRe+xyw0WyMMBv/9/5U0xAXf
 jc0hu0d8=
X-Gm-Gg: ASbGncs/TruMmuvLe4okenh5mdhDtWrGJ84B6MUScsko26WohRkWT8iAcBNDUXLTQrD
 1XZZfFP/b4M/1vSHwML9R3258ahdofws/h0u/RpwSKe67obBMBgWa78KvKk0n6V0cM1spDasB91
 9EyWwVAdBDptByD0qZMnXIOoQ17dT2Ho5x6dB2c6ZHuEVlswPLWAnYbgHyBGWpVr+HkIb5KnA7p
 RJfRrLD17b0sWKf5GkWPvkR28PXCEBwKxF1KThDtz4klf49By9ia1bB0GV353KcnY4SkOQuqWeG
 3EGQP6WKONvhz5+JYxZI0DJ26O82IDitA4Bjgbqjz0LRWr3nz0uWFB6IlsruvKg+NcAsV0Fuvdu
 Q+BAdEFitkGB8cLkXhNMQV9FivnzSa3g=
X-Google-Smtp-Source: AGHT+IFDp89yrhYj0eMipPutj/0826qmOABa30HnpBrZodm1CvvrkUW+Mf8gZBiohNgvFJShyJUF9A==
X-Received: by 2002:a05:620a:a201:b0:7e7:fa85:889c with SMTP id
 af79cd13be357-7ea1105ac83mr311241985a.60.1755873014322; 
 Fri, 22 Aug 2025 07:30:14 -0700 (PDT)
Received: from kermit.lan ([65.93.159.244]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4b2b8e6023asm420131cf.53.2025.08.22.07.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Aug 2025 07:30:13 -0700 (PDT)
From: Faith Ekstrand <faith@gfxstrand.net>
X-Google-Original-From: Faith Ekstrand <faith.ekstrand@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: Faith Ekstrand <faith.ekstrand@collabora.com>
Subject: [PATCH 5/7] drm/panfrost: Add flag to map GEM object Write-Back
 Cacheable
Date: Fri, 22 Aug 2025 10:29:14 -0400
Message-ID: <20250822142954.902402-6-faith.ekstrand@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250822142954.902402-1-faith.ekstrand@collabora.com>
References: <20250822142954.902402-1-faith.ekstrand@collabora.com>
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

Signed-off-by: Faith Ekstrand <faith.ekstrand@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 7 +++++--
 drivers/gpu/drm/panfrost/panfrost_gem.c | 3 +++
 include/uapi/drm/panfrost_drm.h         | 1 +
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 1ea6c509a5d5..ac2a3939f0c1 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -116,6 +116,10 @@ static int panfrost_ioctl_get_param(struct drm_device *ddev, void *data, struct
 	return 0;
 }
 
+#define PANFROST_BO_FLAGS	(PANFROST_BO_NOEXEC | \
+				 PANFROST_BO_HEAP | \
+				 PANFROST_BO_WB_MMAP)
+
 static int panfrost_ioctl_create_bo(struct drm_device *dev, void *data,
 		struct drm_file *file)
 {
@@ -125,8 +129,7 @@ static int panfrost_ioctl_create_bo(struct drm_device *dev, void *data,
 	struct panfrost_gem_mapping *mapping;
 	int ret;
 
-	if (!args->size || args->pad ||
-	    (args->flags & ~(PANFROST_BO_NOEXEC | PANFROST_BO_HEAP)))
+	if (!args->size || args->pad || (args->flags & ~PANFROST_BO_FLAGS))
 		return -EINVAL;
 
 	/* Heaps should never be executable */
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index bb73f2a68a12..9a707055d946 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -320,6 +320,9 @@ panfrost_gem_create(struct drm_device *dev, size_t size, u32 flags)
 	bo->noexec = !!(flags & PANFROST_BO_NOEXEC);
 	bo->is_heap = !!(flags & PANFROST_BO_HEAP);
 
+	if (flags & PANFROST_BO_WB_MMAP)
+		bo->base.map_wc = true;
+
 	return bo;
 }
 
diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
index ed67510395bd..e09b6f25acb2 100644
--- a/include/uapi/drm/panfrost_drm.h
+++ b/include/uapi/drm/panfrost_drm.h
@@ -90,6 +90,7 @@ struct drm_panfrost_wait_bo {
 /* Valid flags to pass to drm_panfrost_create_bo */
 #define PANFROST_BO_NOEXEC	1
 #define PANFROST_BO_HEAP	2
+#define PANFROST_BO_WB_MMAP	4
 
 /**
  * struct drm_panfrost_create_bo - ioctl argument for creating Panfrost BOs.
-- 
2.50.1

