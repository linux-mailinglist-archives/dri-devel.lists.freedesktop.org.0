Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9CF974DB5
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 10:59:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EECD010E805;
	Wed, 11 Sep 2024 08:59:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aKeK3WQL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAE2B10E803
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 08:59:09 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-42cba8340beso3682185e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 01:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726045148; x=1726649948; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=KdYqNFV9qIqZ8Q4auTfsRqxVto3FPRBzn9+phnpz1Xk=;
 b=aKeK3WQLpJ7HR9e/B/e6RvVQfE0aCHf8bBQNnwF/uH7Yls2LSmFUdl3spIyHBpfqiW
 tufHf+TonluXc8SV8J7a6Vq0gIbGCwJvonDj46LBK4SI9LKmj6hD/y2QdLH2z3tdbFam
 GPZfMqHa5/RW/M+p7KE/1BSNXMCpo718o5QB4n1oXlWU8AszDrKyTV9DTIPjelFP0xAU
 MKeVDQHEcMA3QkrQaUgdf3UaZWKh3q35FTVwhPePb8FszRxJqcmYHQPgiEFxnqJq0cJr
 KhQU8HszDb49bH7Sx3y++n28q2VVD1oPbmnhlTbmnQoSWjhLQzeBxgvWLwnZLkA/I9hs
 LfdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726045148; x=1726649948;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KdYqNFV9qIqZ8Q4auTfsRqxVto3FPRBzn9+phnpz1Xk=;
 b=BRVZ7eEA9toVo1CCQ89wOB7n62UjhdB8Q04eyeyhuDa2ZIE+1TDfKY/H3hoCPGn7Xl
 PUUp1yHsM3UUErFzQGFN5KJvoMbGILBKQHyd0IqCYfNn2upH/8c7KmKSm+zsCHovYen1
 mDWQpn9KH8dszjyallG6vPxHbKRRY14pC65OWA6JD0H2XVzQ3uCjW/aKNPMTcl5JHNEY
 +2TJEVWf4x8+pCo+OjBIyvOKFvNkm7mGe21RMmBPMqxYXe98xizqWCBhWAVGGtwy2Lw/
 NWiw8bOyx7/2DJVlcfft5ktF1MCXjkxmJLtQflYI+j2bnPm+4cbDro+MEJlDoj8QEw81
 QVuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXv5dBQIq2vT2wAeKAOSQK0tCLdL819c7QUUrfipAjlzrM1AnLu6oS+/UESU3aY3cFn6v8RNJxAhrs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwI+ySjugqQE1n28fLiP3K3XqvGI1tspd9pcdFGXF6FAUrE0FI
 kT6iFtRhut3Auv5FCXMcUFh5+lT6NZlVMEmFKUspQB/+1uiUewwBqhHO66FNL3U=
X-Google-Smtp-Source: AGHT+IFOsFjDBfRR1ueMbjLxiW06WFj4b6b03+c88B16rq63SKEsSje+QmkkUtK3LYAcR3TGpxVLaw==
X-Received: by 2002:a05:600c:1515:b0:42c:ae4e:a96c with SMTP id
 5b1f17b1804b1-42cbde034f3mr33608755e9.16.1726045147474; 
 Wed, 11 Sep 2024 01:59:07 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:15d6:de00:8f84:56ce:f670:6ad4])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956de4b9sm10978174f8f.111.2024.09.11.01.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 01:59:07 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: simona.vetter@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/7] dma-buf/sw_sync: remove pointless enable_signaling
 implementation
Date: Wed, 11 Sep 2024 10:58:58 +0200
Message-Id: <20240911085903.1496-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240911085903.1496-1-christian.koenig@amd.com>
References: <20240911085903.1496-1-christian.koenig@amd.com>
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

Just returning true here is a no-op, remove the optional callback.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/sw_sync.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
index c353029789cf..f5905d67dedb 100644
--- a/drivers/dma-buf/sw_sync.c
+++ b/drivers/dma-buf/sw_sync.c
@@ -173,11 +173,6 @@ static bool timeline_fence_signaled(struct dma_fence *fence)
 	return !__dma_fence_is_later(fence->seqno, parent->value, fence->ops);
 }
 
-static bool timeline_fence_enable_signaling(struct dma_fence *fence)
-{
-	return true;
-}
-
 static void timeline_fence_value_str(struct dma_fence *fence,
 				    char *str, int size)
 {
@@ -211,7 +206,6 @@ static void timeline_fence_set_deadline(struct dma_fence *fence, ktime_t deadlin
 static const struct dma_fence_ops timeline_fence_ops = {
 	.get_driver_name = timeline_fence_get_driver_name,
 	.get_timeline_name = timeline_fence_get_timeline_name,
-	.enable_signaling = timeline_fence_enable_signaling,
 	.signaled = timeline_fence_signaled,
 	.release = timeline_fence_release,
 	.fence_value_str = timeline_fence_value_str,
-- 
2.34.1

