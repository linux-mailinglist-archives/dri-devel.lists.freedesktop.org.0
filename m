Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0D66D55F2
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 03:28:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C997410E28A;
	Tue,  4 Apr 2023 01:28:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D4B910E28A
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 01:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680571711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1l/vBoUEhgxsmLv104lwmJ8KryX+Oa0PJH6QLfzc/6M=;
 b=PRsW0k6iCk2CpPB+sm+Aw0IcEwGJeGvPnj4ho8GbSgn321y5uRMPTyTjvL8AdRxciCHFX6
 15mMq6WLtrMb3ofocBDp+qsjEqXg4GzEOkWlAo79lunH5cbnpuayaa3BliPKO7UzaWmwId
 tCN+rEUMhUWbqsqKmeJVGUb8FvrCYW0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-465-Afqo5_wXPTOhTXurb4vDZA-1; Mon, 03 Apr 2023 21:28:30 -0400
X-MC-Unique: Afqo5_wXPTOhTXurb4vDZA-1
Received: by mail-ed1-f70.google.com with SMTP id
 k14-20020a508ace000000b005024a8cef5cso32757704edk.22
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Apr 2023 18:28:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680571709;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1l/vBoUEhgxsmLv104lwmJ8KryX+Oa0PJH6QLfzc/6M=;
 b=skRuOHC6MzBHG7xS1YxAOlG1xXFvcwd7EKK9f5YIX3WMi9q9p/yb4UgMPiA+i3SJDS
 J/xS2ACy8scUwGCTxAUSZhtmjKglN17H19MgLya5yzMNpvmMA89vTsp8a4PaRP28g2uc
 NKp/ypo0d8+bVI+c6UVUcsrd3d6+LezqRXOL00N4wSjKpBsXydTqAXxDWYed4Uft6qgQ
 FRX6bAw2gOHDCvxbdfFBncWJXnmxBNoPggxT5GoPPZwTnzG4GLLdvZVO/OJaPx4/BWIY
 xxbKjtlMVS00ELx6VkguPkEslwZ63IAotGQSnBiSlFLYpiToy/jKK36EUL3b6uQyHAwn
 Fg2A==
X-Gm-Message-State: AAQBX9eGgEpeAV9I8HvZfAAS0fe0dM5gbDtdfaE7xDewNKoQXxTQT8tu
 BKNtMUB6Hs27XGaMojOKS9u/iOYlPoU+DvKPwprqBxcLiJSO8Zkw9gA1oR8RjOMLAMIHaLDi3eD
 emgGv5CiNqsy7dC/QLwdzcb0sFtLM
X-Received: by 2002:a17:906:1dd4:b0:92a:8067:7637 with SMTP id
 v20-20020a1709061dd400b0092a80677637mr476847ejh.61.1680571708918; 
 Mon, 03 Apr 2023 18:28:28 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZpQfzYsSTyZHq2rBGoLqdwt6NU1J/h3ko86D9IEobUotm8XZXJaMVYF9BCnMtF6nYkOmpx4A==
X-Received: by 2002:a17:906:1dd4:b0:92a:8067:7637 with SMTP id
 v20-20020a1709061dd400b0092a80677637mr476837ejh.61.1680571708714; 
 Mon, 03 Apr 2023 18:28:28 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 ty25-20020a170907c71900b00948ca65d61fsm1287053ejc.140.2023.04.03.18.28.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 18:28:28 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
Subject: [PATCH drm-next v3 11/15] drm/nouveau: fence: fail to emit when fence
 context is killed
Date: Tue,  4 Apr 2023 03:27:37 +0200
Message-Id: <20230404012741.116502-12-dakr@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404012741.116502-1-dakr@redhat.com>
References: <20230404012741.116502-1-dakr@redhat.com>
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
2.39.2

