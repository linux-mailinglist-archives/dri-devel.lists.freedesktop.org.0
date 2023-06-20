Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2347360B8
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 02:43:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5308510E247;
	Tue, 20 Jun 2023 00:43:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1204510E247
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 00:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687221797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c36xFgwQHAoO1A1GCpabxO1lgFTUT+xWChVASPsKB44=;
 b=Nt1QLdGTyYouaRdBFXt+ZPs9oanrkLMAFNmoAwFcDbErBO+UOMFx7w9TSPMWZ582VKswOH
 WYowpyUqZKSAPmKL7/uH06DfRjCDVVzK+p0o/BbGwqQkWEBQMfVmhymBaeHSuphitRbo/k
 1SxdUmReY8Humn9+jmCCQUZwcuaLqqw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-42-AOCw57aWOGOFTEunKFQ7WQ-1; Mon, 19 Jun 2023 20:43:15 -0400
X-MC-Unique: AOCw57aWOGOFTEunKFQ7WQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-9715654aba1so419497166b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 17:43:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687221794; x=1689813794;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c36xFgwQHAoO1A1GCpabxO1lgFTUT+xWChVASPsKB44=;
 b=i18EnH5W9J4hfkuuIYzE4xwUfOJqbDCxetSNeA8IfB1Jfo7WHOtKwQs0+HCNd9ND+S
 2VoOvc9nrr6StkEJzvNI4XR+Z2RGvEAbDLRF4RR1PodmsZRCSZdbNYqaGjYffmtDdi19
 2RYFp7QEjGVLn7xrNfyW+eqop1DTaOq9E/m41bEx5WN/WaW5K/vY9ns+VRaUbZS2kXhw
 B4yIPchBfit87zVLipIfJu37u1OSUujdTp3EEF9RMVY3uKqq3qjlfKJIBa6ZAxdZGY6l
 xWWnR7sV4adulD3XLPahNljCe+AnSl2F8j6sJ7SsiYAuEz5MNIyaI1wMZOokwIGv6yuW
 kmYg==
X-Gm-Message-State: AC+VfDy33Dmorz66EPiPyWOK+0H8JPIptYopUlil0upEfYxmf/eupIH1
 5peumDONNQWW7BEHz/C5+EeLH5ETWC1uoh9Ug2LlFnVqbLmtVmx+1c2FabHfL/spNk+gvHUa6Oc
 XA5I2zObVykGsMDQ19JxN0TXRdgic
X-Received: by 2002:a17:907:1c0b:b0:987:4b4a:916b with SMTP id
 nc11-20020a1709071c0b00b009874b4a916bmr8546398ejc.24.1687221794627; 
 Mon, 19 Jun 2023 17:43:14 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7OvFPLVF40MGTxJIagtjtNVYW06w8dtjb7fvvD70Aoy/WisUVPQOpjflQ4lf0O6wzzqws8SQ==
X-Received: by 2002:a17:907:1c0b:b0:987:4b4a:916b with SMTP id
 nc11-20020a1709071c0b00b009874b4a916bmr8546386ejc.24.1687221794505; 
 Mon, 19 Jun 2023 17:43:14 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 w23-20020a170906481700b00987258cf1f7sm382025ejq.154.2023.06.19.17.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 17:43:13 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
Subject: [PATCH drm-next v5 10/14] drm/nouveau: fence: fail to emit when fence
 context is killed
Date: Tue, 20 Jun 2023 02:42:13 +0200
Message-Id: <20230620004217.4700-11-dakr@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230620004217.4700-1-dakr@redhat.com>
References: <20230620004217.4700-1-dakr@redhat.com>
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
Cc: linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Danilo Krummrich <dakr@redhat.com>
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
2.40.1

