Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 504F7743075
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 00:27:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 538C910E40D;
	Thu, 29 Jun 2023 22:27:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D4B10E3FC
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 22:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688077658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/pp7pCNssCFdX07s9SqyoLBjaIvnkOQtt7NO/vv36Sc=;
 b=TodX9aTYgQ/86Ux3uEpdpscK9JB/lIAsEmgb7F/IpHJOOc/GFpMUErKUX8FgS174wOJCzi
 ntdSYLkdP6s2KQ6TiURanaqtPsUzAu109n7NMbXh30Wn70hMcoQXC1RU13rsxAmruv0kFZ
 36qldZVI8gSSe2a6FvZFMzmbTp4p6ts=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-DrqDUKZYNr2vCFQU-dr7Gg-1; Thu, 29 Jun 2023 18:27:36 -0400
X-MC-Unique: DrqDUKZYNr2vCFQU-dr7Gg-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-313e65772d8so1524372f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 15:27:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688077655; x=1690669655;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/pp7pCNssCFdX07s9SqyoLBjaIvnkOQtt7NO/vv36Sc=;
 b=lz4VVGGKKoR7T7glAlAMcJ0OAnFH+pQokqfQOKGO+prgqpwE2m8C69zxVKZXqPgOSy
 yx5Yz4xO+hbiYj9GN+9uTvLzMXrhj4ffxjpWlNMviyBVL6j3buooJX16LO+N6g+LpS7n
 60M7hGnl26ARV5fOaH4APoedvYobJkM517Uci4T6XB3eXoLQNnr9NILLNT09kj+oc/qL
 d0mwLuEZ8SH7+grOCIhLpC+n5lI230BXLWkVtMbgtEZxZYxlUfZYWqsnmfY/lZ1NFiAB
 ohurxPLeXBYvhemQ7SZRnQc/7sqlS4wS+i/BpF15gWcfdAJ6n1SUMSVTF2ps45NdYSr6
 KOvQ==
X-Gm-Message-State: ABy/qLZuNURBoCHvane173ThKZJlbctX2zXoXbPXC99T6sjkDdpNmqSN
 llqwGHLyhOD5I3Pg1CmwmdwnKCgUBfGTOpJKywIcgyfhW6ghRiUP0Yb6yr8mITxnkolsbbvs8WK
 86hx4a2OULHN38BJek3UmSDF8B6+I
X-Received: by 2002:a5d:525c:0:b0:313:f61c:42bd with SMTP id
 k28-20020a5d525c000000b00313f61c42bdmr750869wrc.59.1688077655561; 
 Thu, 29 Jun 2023 15:27:35 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFmqOL6OvZYLEHImUuHmBKbH1ljfnPJQLh9s5Ol4fUmQzA+pAg2LS4yxPJw5oYwNr77kuWmwA==
X-Received: by 2002:a5d:525c:0:b0:313:f61c:42bd with SMTP id
 k28-20020a5d525c000000b00313f61c42bdmr750845wrc.59.1688077655340; 
 Thu, 29 Jun 2023 15:27:35 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 f2-20020a5d5682000000b00313ec7dd652sm13949454wrv.44.2023.06.29.15.27.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jun 2023 15:27:34 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
Subject: [PATCH drm-next v6 09/13] drm/nouveau: fence: fail to emit when fence
 context is killed
Date: Fri, 30 Jun 2023 00:25:25 +0200
Message-ID: <20230629222651.3196-10-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230629222651.3196-1-dakr@redhat.com>
References: <20230629222651.3196-1-dakr@redhat.com>
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

