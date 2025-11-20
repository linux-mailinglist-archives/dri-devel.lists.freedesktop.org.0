Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8142EC74B51
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 16:00:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C064410E76C;
	Thu, 20 Nov 2025 15:00:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WCm5wIF2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C2B110E76C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 15:00:26 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-6418b55f86dso1712941a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 07:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763650824; x=1764255624; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fn4zDi1+fVw5LF2kCVwHRZ0dDV9P2PJVWlKNVfHgNls=;
 b=WCm5wIF219waAVUqFPsfOzLi7chC1TuPwHZdsOmUR5VvOPEkf9yWRCLXRa43eQPFh/
 x8C0yORGW8gXE50uz7MZsghw1V5yp4KTYAwTeez14/U8+bxAjxE8vyL7cqx5kctyhzVw
 7GvRyEoBItUlkOr+ortUyOeQsH93DhcXjor55Z9o5FQqrtTCJWLe8zH0rBji+jKtYg3+
 ooWjlEKnGwWe5X4GIV0A7z2Zc4ta63F4dk+zenRVrRYz4Ft0j4iiHpCMmOev0havmruH
 aXN82L6dyRLMZCENOJK0w6VqRQzBSzMZenx08hwaHDwgGzHdMSzv9etybbUiOBp8cZMU
 Yy7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763650824; x=1764255624;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Fn4zDi1+fVw5LF2kCVwHRZ0dDV9P2PJVWlKNVfHgNls=;
 b=t+SkMTIVo4fnR+fmBcJHgyhuMEsnwY7n7S/nfMsq2yjnvW8RKlBlTATRwP0mjKdsBn
 OityNPUNSj2KZc0+uEFhdkpw5vhGLAXpcSKpu2M27+pelvlS1f5vwSBWWtj5vLt1cvHL
 sJtLG/ocCpYLGOrzUMpExIZuk6Wekftai4dApUN2yPh8sTn0icevOdWmAnIcPJc4EbqJ
 gUyXjAwLQmwRvA5JwI0QO/u2mn0DzHDC9uW4qv7axjNG1gsXg0mW7uRAcdwpKhixvESX
 HEpk1undKC+yZ+Vg21s7U9/4MLIh9tLVBu9eOqYNGigR1rybexYKC/ZzoJjvIuLrYJrH
 5FBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWVykXrqRjJz4bL4JSSz9NDlF2DLXBM+cIIsuA51rQOki+7RdL4vs1Ap37l64I1wrOA2l6BqWiZUc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzouu7lJMXUINJhFhZzTWe4s3gNgh2PMl5kr7nv4YrA+OxHiEBh
 a4ieBXj3YKk1TZbjcBK7Oboj5Dmi2wnkpN6uMGiMPrc5Aka/TypyfHJm
X-Gm-Gg: ASbGncuk5TopB9HjQEkidqWkcNbJ33p01BTA5B+U0qD1ECFKn/iaUvxe+1PYYvNPUAw
 GB2ijHvMoFmxQsWctTZLu0pxJNYRwNi2MMMBaUz3CYNGd6mezaEbs4q8MxIGgC+pN/5u2vQ5UJx
 g3a6LvUr7p48G1dGyCUysfBmk18Ye/18lElxqP5sldGbagTXkOo+VfnBsMBnUOKAs4W9zRtexn+
 8exPxFKiry1lxPBQfPa3Zfw0iybjL2HuyXV3nVcmIr8cjOKgmMIACUezpfDI+hCDTvFKehkfvmM
 Zfm5xD5jKcS0tRVK67vv9pOiHu4rJGKWEJJt3NUxc8VItB3zbxlxCPg2cW4cxiusWwpKaQV3s8T
 rqDPPBlHewIXzTkg152jMwWqdMP7QGnuVBxal2pWbJdJJzCVFrnuwOl9Z3YsTn3Kvh6qp0/Ga8T
 SijilUGS39hiTLZ2zPZKoCzsQt
X-Google-Smtp-Source: AGHT+IHEa9jeRDndfJYJmlCbMv7bvXqUgvUVm8f5HPtphgMQ7NFdUo4LDlVADG2NiQoXZEPcdmxqDQ==
X-Received: by 2002:a17:907:9812:b0:b6d:5b4d:7277 with SMTP id
 a640c23a62f3a-b76550b65a3mr357219366b.0.1763650824178; 
 Thu, 20 Nov 2025 07:00:24 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:154c:c900:7aba:c4b7:a402:3cd2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6453645f2easm2205878a12.33.2025.11.20.07.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Nov 2025 07:00:23 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@kernel.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 faith@gfxstrand.net, sumit.semwal@linaro.org
Cc: linaro-mm-sig@lists.linaro.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] drm/vgem: use the reasonable maximum timeout defined by
 the dma_fence
Date: Thu, 20 Nov 2025 15:41:09 +0100
Message-ID: <20251120150018.27385-4-christian.koenig@amd.com>
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

Instead of 10 seconds just use the reasonable maximum timeout defined by
the dma_fence framework.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/vgem/vgem_fence.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vgem/vgem_fence.c b/drivers/gpu/drm/vgem/vgem_fence.c
index 07db319c3d7f..1ca14b83479d 100644
--- a/drivers/gpu/drm/vgem/vgem_fence.c
+++ b/drivers/gpu/drm/vgem/vgem_fence.c
@@ -27,8 +27,6 @@
 
 #include "vgem_drv.h"
 
-#define VGEM_FENCE_TIMEOUT (10*HZ)
-
 struct vgem_fence {
 	struct dma_fence base;
 	struct spinlock lock;
@@ -81,8 +79,11 @@ static struct dma_fence *vgem_fence_create(struct vgem_file *vfile,
 
 	timer_setup(&fence->timer, vgem_fence_timeout, TIMER_IRQSAFE);
 
-	/* We force the fence to expire within 10s to prevent driver hangs */
-	mod_timer(&fence->timer, jiffies + VGEM_FENCE_TIMEOUT);
+	/*
+	 * Force the fence to expire within a reasonable timeout to prevent
+	 * hangs inside the memory management.
+	 */
+	mod_timer(&fence->timer, jiffies + DMA_FENCE_MAX_REASONABLE_TIMEOUT);
 
 	return &fence->base;
 }
-- 
2.43.0

