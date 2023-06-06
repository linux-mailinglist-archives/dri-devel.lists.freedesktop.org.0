Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5D7724FB7
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 00:32:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A2FC10E3FB;
	Tue,  6 Jun 2023 22:32:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E26010E3EE
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 22:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686090744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c36xFgwQHAoO1A1GCpabxO1lgFTUT+xWChVASPsKB44=;
 b=ICQcSRs+f0GMeO34viCT/6z8p6sO8w0EwRZcoQHNJEpDlj9yEJ4Bnma1VaqPj5eidWM0AK
 2kge/DNjZI8xfciPiBS8RmV0BXAUMuv7ITow8ApbXfAvceBG/n2lribfnoekN/eOvlcDkm
 ubiK1LQkxvzAskgFARiPHoplA5kW1tE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-utNBXlVvMzawfSDlHsGF-w-1; Tue, 06 Jun 2023 18:32:21 -0400
X-MC-Unique: utNBXlVvMzawfSDlHsGF-w-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-977cb73efe8so298689066b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jun 2023 15:32:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686090740; x=1688682740;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c36xFgwQHAoO1A1GCpabxO1lgFTUT+xWChVASPsKB44=;
 b=YnJwMXuDUDeF2kuSFXynuzJOw4SIgNWFFmZM9ZjwFpGhzNOL3P7zU1VnwVKh800/qi
 StLGGIVrJjF+meu2KJ+B+skrkSnwIYTQJ9D8QjxpN16I2SxDyZAru9ZLB0W8S3PABdGW
 HGt+cK0HFcPb4LMUvjSesPbLo2VRyNcvkBj3usQ8f5pFyFN3u95vW6kjcruYH/H5mm2O
 YEhs5h14mnPFxYAh/JIub4Ph6l1RKaD9xsU/PSoGVoC7JfQzhzo5HYTP150eSwv/RX1m
 1Fdnjyp25+3PnaXR2AXRkkHOn489qzAPHShU98wPQiPPRyLfC4nYmI/gnAPxK8e5zIah
 wQPA==
X-Gm-Message-State: AC+VfDyCEs/YpnJinvt3XQ4AvgkuWGD4g9rXfxrd0G0wuDgnjjB5aN/I
 pkKyMvPRAwnLG2qGAEa5leb1E/XHAQ08QVvLdRzZfDRCKnVZYhgQWzV4hC7sKaU1uO6MK5UTFx6
 kcj+ehnVRdNuR3YV14xysZC9QKBkk
X-Received: by 2002:a17:907:d1a:b0:974:419d:7847 with SMTP id
 gn26-20020a1709070d1a00b00974419d7847mr3616086ejc.71.1686090740772; 
 Tue, 06 Jun 2023 15:32:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4c77MVfNEYeE8GhdIDJycSs/OSi0sKY1h3c6R7iuE+ANA00tKPgkq6qTOt3RlMI31QUCDJhQ==
X-Received: by 2002:a17:907:d1a:b0:974:419d:7847 with SMTP id
 gn26-20020a1709070d1a00b00974419d7847mr3616072ejc.71.1686090740566; 
 Tue, 06 Jun 2023 15:32:20 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 bg11-20020a170906a04b00b0094f282fc29asm6060829ejb.207.2023.06.06.15.32.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 15:32:20 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
Subject: [PATCH drm-next v4 10/14] drm/nouveau: fence: fail to emit when fence
 context is killed
Date: Wed,  7 Jun 2023 00:31:26 +0200
Message-Id: <20230606223130.6132-11-dakr@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230606223130.6132-1-dakr@redhat.com>
References: <20230606223130.6132-1-dakr@redhat.com>
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

