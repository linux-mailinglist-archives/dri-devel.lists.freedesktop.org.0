Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E2A974DB7
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 10:59:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A06B10E872;
	Wed, 11 Sep 2024 08:59:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Qk9S1aXt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5BEC10E816
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 08:59:16 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-42cb1e623d1so17194995e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 01:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726045155; x=1726649955; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+5DzxjRuMSjJEY/eYl8K1VoMi7LfZwGHMM4HnyDsBXs=;
 b=Qk9S1aXtytAYEkhWPda3KIoGgTJSM+GAGnC67YGy1D/V/2AMAtcD1+bJSWyCM44mdJ
 gCNjNyBF6ZyDziJOjzvQhP/NT2SO5KOF33KGPgzORExnDvl47LAI8IAgw58+QczTuhM5
 75hdhrQpFj1h9ywlId6i3PWibriLODi7iUrpaUaIYnmyK5+7GlDPUewniYhH+aYOZy7g
 o9nu8bz8Tu2klXbE/hzzRCajFGtmb5gRmiyjGo2H5fgVKZpY+TnllYc28TVtNI6CoXDa
 pX56nnlLgICpKDVemREYM32zXysrADFpK/dKAPbpYpqYgRANzXjVp0N/UvafwHJp0Qkk
 /xEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726045155; x=1726649955;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+5DzxjRuMSjJEY/eYl8K1VoMi7LfZwGHMM4HnyDsBXs=;
 b=TBZcLTeKKyoNX181i8qOm/9ZIndcmWKy0/Arf+XmAtRbZWZlVxuFUUgHi4nWToHnoU
 L4HDt5rID7NXV9djKAQ6+LuYW2bs8quSQLh/GYBW61Vv80wH0sdJzZsJFZ4Ne8XOy5oJ
 MDVJTFTM/kB/IMTdrKlCrZhZbej6u1zAQ6ceo+X6rZFKUjZDIOlbvy1TCKRWMDzbjGJm
 kGMQDsDb626B3Cfz/LsLrtcuDwrg0wUDMbEow9KtRkuq5IvyJUFWPvj151JHilt6F6hS
 uJs4bDHfOi1mZQdiFM9TL4llo+2sjCGZ8kw8Epg/6bo3xYeNF58hx+MHWo2IQZ/a/F+n
 9fQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSw04m7dmlKq9ZYtUCFXsENzxCmOVCnIt+ose6Gq8NGehfc42ewGLM0WCUds42qUFwuIEpEjC7pNw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzKPvIEgsYUSOhXetCYbZvQrhrRJmpgFukXDe0qDObQf5wUvzv
 jePPrNLvOBBvFFYccncBfQdDpFXFUvLrI5OiyvzIIpSxNPdWssTMYmiDPUOPFB4=
X-Google-Smtp-Source: AGHT+IH/07rdnMu/EvoJf9PNMsJwuc09iqdZhztu/aaPpLIFe05T3V4S4jM8DC2GM6GpWSRu/3IlDg==
X-Received: by 2002:a05:600c:5122:b0:42c:b995:20d9 with SMTP id
 5b1f17b1804b1-42ccd35b1e0mr18516595e9.28.1726045149597; 
 Wed, 11 Sep 2024 01:59:09 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:15d6:de00:8f84:56ce:f670:6ad4])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956de4b9sm10978174f8f.111.2024.09.11.01.59.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 01:59:09 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: simona.vetter@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 5/7] drm/vmwgfx: rework questionable enable_signaling
 implementation
Date: Wed, 11 Sep 2024 10:59:01 +0200
Message-Id: <20240911085903.1496-6-christian.koenig@amd.com>
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

The implementation just tests if the fence is signaled or not and
doesn't enable any further handling. On the other hand the callback
to test if a fence is signaled or not is missing.

So remove the enable_signaling callback and implement the signaled
callback instead.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
index 588d50ababf6..255ef677c712 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
@@ -143,7 +143,7 @@ static const char *vmw_fence_get_timeline_name(struct dma_fence *f)
 	return "svga";
 }
 
-static bool vmw_fence_enable_signaling(struct dma_fence *f)
+static bool vmw_fence_signaled(struct dma_fence *f)
 {
 	struct vmw_fence_obj *fence =
 		container_of(f, struct vmw_fence_obj, base);
@@ -153,9 +153,9 @@ static bool vmw_fence_enable_signaling(struct dma_fence *f)
 
 	u32 seqno = vmw_fence_read(dev_priv);
 	if (seqno - fence->base.seqno < VMW_FENCE_WRAP)
-		return false;
+		return true;
 
-	return true;
+	return false;
 }
 
 struct vmwgfx_wait_cb {
@@ -251,7 +251,7 @@ static long vmw_fence_wait(struct dma_fence *f, bool intr, signed long timeout)
 static const struct dma_fence_ops vmw_fence_ops = {
 	.get_driver_name = vmw_fence_get_driver_name,
 	.get_timeline_name = vmw_fence_get_timeline_name,
-	.enable_signaling = vmw_fence_enable_signaling,
+	.signaled = vmw_fence_signaled,
 	.wait = vmw_fence_wait,
 	.release = vmw_fence_obj_destroy,
 };
-- 
2.34.1

