Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EFB69ACFC
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 14:49:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6114310EFFE;
	Fri, 17 Feb 2023 13:48:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AF4E10EFF5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 13:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676641728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d5/2RnRF2JWHGpr9RK4XcaUSwl3Atw4selg5mVgZ4/g=;
 b=X/n01YSN1gpk+KK903jEsu4aTusHdMHCMKZku9kCbirFEX4XXlUq/tCUMe+2w/N0alUNbx
 rlmoxasiGW0XiRg3iteIbnlEuBUlKpAhisQrxs2MbWQeYDaahLzK5LJKy4ecL0dnZ2WMuc
 16iMaleWtdWNqmMfx67UI8K6Ie/XRaY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-495-hzvinzvkNhqRFcxYVb7g7g-1; Fri, 17 Feb 2023 08:48:47 -0500
X-MC-Unique: hzvinzvkNhqRFcxYVb7g7g-1
Received: by mail-ed1-f72.google.com with SMTP id
 h14-20020a056402094e00b004acbe232c03so1642440edz.9
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 05:48:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d5/2RnRF2JWHGpr9RK4XcaUSwl3Atw4selg5mVgZ4/g=;
 b=ASA2JIs7ZiQk0iHmdokVfzdUbeB70ealW2XEq6G25YGqAOSbh80WktPuVAkNMHsR5Z
 FOa63AtkenAyASF1O24foGAeD20Sq/QYVS7GeYlAbxMNuAs4QWEQO6dVOwVu57PJZMkY
 QRKTf4sDRtyvUkUVGVYZbEvFkVh2O0y8biwpgvn3AZeKNYOV/q6Q4p9tPgKIKuwg3F08
 C4aUqdrNQdsTxw4wPqeIZHghYaiHltBUViyghtBmFsJgKywBTBYWQ7hatR0XsNYxwh3L
 bVE+Q2sYV4WS76j3UiU+2Tr++PiAZKzdPdJsMDKXoPNLrYdpzPeeOW7ED8Z5whtuAgaD
 Kzbg==
X-Gm-Message-State: AO0yUKUyFxhgySYkMLJWIA2Qr2queBDnzDnUB760VyWh1gs0W66Wow6c
 haniL5qOMe2EuveWeqkkJflcQnRwgg3ogcWPi9oN65oAiSS8ZRmHx4KTvddvQH9TNleAsds+6dF
 w034zreWC2vRWy/TwTvskX9WpoVT0
X-Received: by 2002:a17:907:72c1:b0:8b1:7569:ad58 with SMTP id
 du1-20020a17090772c100b008b17569ad58mr4848787ejc.2.1676641726465; 
 Fri, 17 Feb 2023 05:48:46 -0800 (PST)
X-Google-Smtp-Source: AK7set8dScSkWfRlq0RX8QSswoAOat82FsG+rCLCZ5wYVMw47uLr1CKX3blizMd0kItf9w+BCuGUrQ==
X-Received: by 2002:a17:907:72c1:b0:8b1:7569:ad58 with SMTP id
 du1-20020a17090772c100b008b17569ad58mr4848763ejc.2.1676641726232; 
 Fri, 17 Feb 2023 05:48:46 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 l21-20020a50d6d5000000b004aab36ad060sm2302248edj.92.2023.02.17.05.48.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 05:48:45 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
Subject: [PATCH drm-next v2 11/16] drm/nouveau: fence: fail to emit when fence
 context is killed
Date: Fri, 17 Feb 2023 14:48:15 +0100
Message-Id: <20230217134820.14672-6-dakr@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230217134422.14116-1-dakr@redhat.com>
References: <20230217134422.14116-1-dakr@redhat.com>
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
index ee5e9d40c166..62c70d9a32e6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -96,6 +96,7 @@ nouveau_fence_context_kill(struct nouveau_fence_chan *fctx, int error)
 		if (nouveau_fence_signal(fence))
 			nvif_event_block(&fctx->event);
 	}
+	fctx->killed = 1;
 	spin_unlock_irqrestore(&fctx->lock, flags);
 }
 
@@ -226,6 +227,12 @@ nouveau_fence_emit(struct nouveau_fence *fence, struct nouveau_channel *chan)
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
index 0ca2bc85adf6..00a08699bb58 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.h
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
@@ -45,7 +45,7 @@ struct nouveau_fence_chan {
 	char name[32];
 
 	struct nvif_event event;
-	int notify_ref, dead;
+	int notify_ref, dead, killed;
 };
 
 struct nouveau_fence_priv {
-- 
2.39.1

