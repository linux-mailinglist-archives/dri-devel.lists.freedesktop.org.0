Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 924822558B2
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 12:40:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 512086E48F;
	Fri, 28 Aug 2020 10:40:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 712A16EB8B;
 Fri, 28 Aug 2020 10:40:29 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id i17so705873edx.12;
 Fri, 28 Aug 2020 03:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2y4WrdqazRTiWqZIihT5XXsamdJGCTiNOP2T0aoXGOc=;
 b=iDp8VL/k5g9axym3zWyg89iL2i5LxdL7uBWPOPTKAffG+5fMZTSu7PsxwrB1MqH6kM
 UnKn1vUHAoP46be7vT84vPh0dzBW1yxUjKIJ11YCcvM16x5xaI9PEyO6ncp0QxlW+vie
 T3Xrod6vC+XqcoBrkHAlW8mFm633/hyaqIaXUXTSco0966xaa2Nth3BKe5CPPFUafjVI
 iX+ZUx8pj1O0LbrxFgmWdzdbcUOit4A2+41v2n+1j91MBiW8b2uszLI3hG8TyEqJUyKL
 iFxKodLdc9lfhYZTbP0wnqiYWntb+tt2ino8somln5iia0GQuP1JrFwVoa7qfv+TRET1
 hlUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2y4WrdqazRTiWqZIihT5XXsamdJGCTiNOP2T0aoXGOc=;
 b=ZmP6ic+TMpGbM7fnfE2qgOD+knjLb9hmpR+vYC58d5wydGlYLl4F6cqXzNj0ySkwZH
 HG7xWFIuQ0FwKDzOvbJDOw84gDOFc3GKlWstd0jGAGgKiWBKbLO8XKYtZ2efmvrNYx8Z
 sKVZM3ojDZJPGXz/qG+K0Velj3CJvNhZsdjxyo1P08Sb9LU+RYtRMF1LKs/6iyPjnC18
 EF3pobRawYTHXMHz33TwqkrAoIXerzQBBMzQHK7TCG66bT+LO7iGVJtlJ44ndnmnuemd
 5EMJDOCdNqfCZ5vwejzRC3WEzMc8f1LkwSzjAQA0LPnCo2WpV6Sb74Fb9yS0WZNmooOB
 i0dQ==
X-Gm-Message-State: AOAM533L60k8FWLN7mmpS7k2eHIonP+QeJIN8QOe12jkvJgawSPBYIGb
 5er0lKXXjeVqqogxMgzGVOQ=
X-Google-Smtp-Source: ABdhPJytSCaIm4ydR+ic+CWbNl40+QY97eTyq19UypQL/UZDCqN5uA/ETAjUn+ybdJl5xGEBjDgnBQ==
X-Received: by 2002:aa7:df0e:: with SMTP id c14mr1200668edy.200.1598611228125; 
 Fri, 28 Aug 2020 03:40:28 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id t21sm469149ejr.62.2020.08.28.03.40.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 03:40:27 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH 2/6] drm/nouveau: Add nouveau_fence_ref()
Date: Fri, 28 Aug 2020 12:40:12 +0200
Message-Id: <20200828104016.1672195-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200828104016.1672195-1-thierry.reding@gmail.com>
References: <20200828104016.1672195-1-thierry.reding@gmail.com>
MIME-Version: 1.0
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

This is a simple wrapper that increments the reference count of the
backing DMA fence.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 9 +++++++++
 drivers/gpu/drm/nouveau/nouveau_fence.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 8e7550553584..8530c2684832 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -363,6 +363,15 @@ nouveau_fence_sync(struct dma_fence *fence, struct nouveau_channel *chan,
 	return ret;
 }
 
+struct nouveau_fence *
+nouveau_fence_ref(struct nouveau_fence *fence)
+{
+	if (fence)
+		dma_fence_get(&fence->base);
+
+	return fence;
+}
+
 void
 nouveau_fence_unref(struct nouveau_fence **pfence)
 {
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.h b/drivers/gpu/drm/nouveau/nouveau_fence.h
index 76cbf0c27a30..b8afd4b06445 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.h
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
@@ -19,6 +19,7 @@ struct nouveau_fence {
 
 int  nouveau_fence_new(struct nouveau_channel *, bool sysmem,
 		       struct nouveau_fence **);
+struct nouveau_fence *nouveau_fence_ref(struct nouveau_fence *);
 void nouveau_fence_unref(struct nouveau_fence **);
 
 int  nouveau_fence_emit(struct nouveau_fence *, struct nouveau_channel *);
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
