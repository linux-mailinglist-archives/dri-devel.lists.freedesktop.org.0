Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C51C275A334
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 02:15:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAE1910E545;
	Thu, 20 Jul 2023 00:15:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB69210E53E
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 00:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689812133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/pp7pCNssCFdX07s9SqyoLBjaIvnkOQtt7NO/vv36Sc=;
 b=Qh69X4OpAgZ9AcEC6nKNgUaaQf8n3qS5D9M8xfdhHi3LsV6UF7Qxd6qarsa8UwIOpAhcDN
 jDzQToGCtIX92MwB8GMZkAOqul5ruOjfBqlTXEGmUp3FpD9mwxoBiu24ro/8rfPr2Z5gES
 4mOh9NKBe9o517/HNfiZ7Elzxb9SAIE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-573-eA4p-gwOMom27vT_btegqg-1; Wed, 19 Jul 2023 20:15:31 -0400
X-MC-Unique: eA4p-gwOMom27vT_btegqg-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-51da39aa6dcso84969a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 17:15:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689812130; x=1692404130;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/pp7pCNssCFdX07s9SqyoLBjaIvnkOQtt7NO/vv36Sc=;
 b=OB8fQlCpHbsskmkBWCh83YKuPnzDXd8UbsbXJcfk0p+Gy3uh+kI371/Cq31b6rF65h
 8GHPYHCONchOPu0DwVdBvfWOvoo1xJ1CByfoZCLUxF6RxjywKQK1mqfPkBTDUYy/KS5W
 9WQkwUnxUI6usfAH76ntMxJe1xTE70aPhFq4ANxGeCRYnWEfM2W95MqsDnLzgHKEIoaI
 cnClx8CKcI7mv/S566FGrLgGybF1/kyiW592sgSD8hE+cyy9YYAgjLH98WGWKMsjvXc+
 UhsEbb24uApF6SD3ufao4+tI6iCfr3d07aJ/guBXuIi7JWSFEBTnBKSuYCMd8F6vJ6/N
 eG2w==
X-Gm-Message-State: ABy/qLbt1gikUbcXD5Rr6W/9B/hIQ+KhznUlLMUdsqZEnfA9PTaKrgof
 z8q4RbunIhlB+8JQKbahTlDCbRkaLJse5MuXWlllnt8mS342JJya1uqVSk3zayBO89gtsGW1aYA
 J0L8DJfs8ZOCs+3w9fEyHkagQ2m1L
X-Received: by 2002:aa7:df82:0:b0:51e:5686:d0f8 with SMTP id
 b2-20020aa7df82000000b0051e5686d0f8mr3267115edy.10.1689812130840; 
 Wed, 19 Jul 2023 17:15:30 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEY0jNJR563RWawHMsZiYL8i7vVzYGf6EAZKyG8JAuq4b4CkUSHn2cXQQXFqqniM+7z3huhmQ==
X-Received: by 2002:aa7:df82:0:b0:51e:5686:d0f8 with SMTP id
 b2-20020aa7df82000000b0051e5686d0f8mr3267108edy.10.1689812130666; 
 Wed, 19 Jul 2023 17:15:30 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 f24-20020a056402005800b0051dd4daf13fsm3401489edu.30.2023.07.19.17.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 17:15:30 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net,
 donald.robson@imgtec.com
Subject: [PATCH drm-misc-next v8 08/12] drm/nouveau: fence: fail to emit when
 fence context is killed
Date: Thu, 20 Jul 2023 02:14:29 +0200
Message-ID: <20230720001443.2380-9-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230720001443.2380-1-dakr@redhat.com>
References: <20230720001443.2380-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The new VM_BIND UAPI implementation introduced in subsequent commits
will allow asynchronous jobs processing push buffers and emitting
fences.

If a fence context is killed, e.g. due to a channel fault, jobs which
are already queued for execution might still emit new fences. In such a
case a job would hang forever.

To fix that, fail to emit a new fence on a killed fence context with
-ENODEV to unblock the job.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 7 +++++++
 drivers/gpu/drm/nouveau/nouveau_fence.h | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index e946408f945b..77c739a55b19 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -96,6 +96,7 @@ nouveau_fence_context_kill(struct nouveau_fence_chan *fctx, int error)
 		if (nouveau_fence_signal(fence))
 			nvif_event_block(&fctx->event);
 	}
+	fctx->killed = 1;
 	spin_unlock_irqrestore(&fctx->lock, flags);
 }
 
@@ -229,6 +230,12 @@ nouveau_fence_emit(struct nouveau_fence *fence, struct nouveau_channel *chan)
 		dma_fence_get(&fence->base);
 		spin_lock_irq(&fctx->lock);
 
+		if (unlikely(fctx->killed)) {
+			spin_unlock_irq(&fctx->lock);
+			dma_fence_put(&fence->base);
+			return -ENODEV;
+		}
+
 		if (nouveau_fence_update(chan, fctx))
 			nvif_event_block(&fctx->event);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.h b/drivers/gpu/drm/nouveau/nouveau_fence.h
index 7c73c7c9834a..2c72d96ef17d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.h
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
@@ -44,7 +44,7 @@ struct nouveau_fence_chan {
 	char name[32];
 
 	struct nvif_event event;
-	int notify_ref, dead;
+	int notify_ref, dead, killed;
 };
 
 struct nouveau_fence_priv {
-- 
2.41.0

