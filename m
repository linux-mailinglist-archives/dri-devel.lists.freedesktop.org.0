Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D170F752969
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 19:05:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C50F10E74B;
	Thu, 13 Jul 2023 17:05:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC99C10E73D
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 17:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689267917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/pp7pCNssCFdX07s9SqyoLBjaIvnkOQtt7NO/vv36Sc=;
 b=cMkhhxjBpLxxr51g7qXrljmiJYYNhIeIKzrvmUGc7Zvl9N7k0KtKVrkX3+Ou4wdQFgUPrI
 CqwbRKmXSgB9j/5D6j6g8uKZc2poiKC/PXNPiQjmJZ547ejCXQNSZmXhmRVLSEsS6wuSBY
 OUtYaTjytJqPtucUNy9rD6kn5gVmtE0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-194-953GGeo3PFygzxT__TdzBQ-1; Thu, 13 Jul 2023 13:05:13 -0400
X-MC-Unique: 953GGeo3PFygzxT__TdzBQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-94a356c74e0so58770166b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 10:05:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689267912; x=1691859912;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/pp7pCNssCFdX07s9SqyoLBjaIvnkOQtt7NO/vv36Sc=;
 b=YzQhP30pOePMN5zUugF8ZrEJ+5lO+19LYN/OD80tplJt0gW1ZXMPd/Mpgbo+GURePA
 WL/05YmhjBGpmLvREZ5qPO4K08bbe98XKP5uKp0rSA0yj2YqLapZCuDI1fwBTUAsRgKK
 1iBYDopVcFZyG18kkX0+ayYA0LfTPrdsz1+JXyrA0mw3C7bk7gMoR+D4pLA8SoOdXxDr
 C4aijgwNmUtlEhutxglvbW1lYpl4KPSRAPfl2uVSyEZSFNAjQtZ7O2SSW9CLKiSRSd7a
 dFi5KHLX+faly9UIrG+KOjbDIwCufdmMeWeJz2JigTSFlKdgtHozqzMKhNna29S5BD/V
 qWXg==
X-Gm-Message-State: ABy/qLaSHL7HTBg2fRiigqDV/fZPaM27OANyIgPwZUck8yM9r44Mrdhq
 Q9sAtixaKXBJB8bCCh4MW8wZ0T2xHgGaS8wEYGnIfc5JvlFxjRrssK+eETYzl5m0sA93B6bm9Ye
 ua2UtSvWoKSbq7QPLyWJSJ10VoO4S
X-Received: by 2002:a17:906:739e:b0:993:e752:1a71 with SMTP id
 f30-20020a170906739e00b00993e7521a71mr2073326ejl.9.1689267912643; 
 Thu, 13 Jul 2023 10:05:12 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFHckHbTyjMCGJSB33a1xuyToxA5Lv9jbmRxtayiMatm6oRwXfd/mPMU4d/wU1zEIEwWQbE5w==
X-Received: by 2002:a17:906:739e:b0:993:e752:1a71 with SMTP id
 f30-20020a170906739e00b00993e7521a71mr2073306ejl.9.1689267912463; 
 Thu, 13 Jul 2023 10:05:12 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a17090616ce00b0094e7d196aa4sm4179835ejd.160.2023.07.13.10.05.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 10:05:12 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net,
 donald.robson@imgtec.com
Subject: [PATCH drm-next v7 09/13] drm/nouveau: fence: fail to emit when fence
 context is killed
Date: Thu, 13 Jul 2023 19:04:04 +0200
Message-ID: <20230713170429.2964-10-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230713170429.2964-1-dakr@redhat.com>
References: <20230713170429.2964-1-dakr@redhat.com>
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

