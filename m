Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A28A076F005
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 18:53:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A7C610E640;
	Thu,  3 Aug 2023 16:53:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7996C10E637
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 16:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691081606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3/Zpw+2MU6XUCAHE50I7yBNOwDhyXO7cbbEk9lEH2AQ=;
 b=fBUr86yiUIDapoSPLQaNMbXUsIVu7MV4EdIBQ21O0NjrEuJNnRS0WONFYnKe86VS4C5zZG
 t2hIlEeco+rltjCZyXF9HThioNuwKU9QJMa40AkMwMoYd3WrqghA+ZD8eFlA1KXp4Eu0GJ
 eigZL96KOsOhNZCiBkXTfUnQWM+X0p4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-533-MbquizYeMSO3mCdESs9QiQ-1; Thu, 03 Aug 2023 12:53:25 -0400
X-MC-Unique: MbquizYeMSO3mCdESs9QiQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-99c03869a67so76670666b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Aug 2023 09:53:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691081604; x=1691686404;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3/Zpw+2MU6XUCAHE50I7yBNOwDhyXO7cbbEk9lEH2AQ=;
 b=TbWd19xeF1bE+0jApFhLjRgVdekoSQdgivnk4b0wLWWfMo/VS5M2W/DiIe3txYClQN
 iWJPxQWKhCdJRXJd3WX1VGOv0ylo8wW/ocr41DJHeYkvQY+7wYnWtCd+4TNagAywrBya
 kntZFP70nPb6qc+5tr6kWe7ilz9mTNUAssW2oF8uG23fjOJ42YQCz6s3LLQj5My6p5Uh
 0gAZozH0OQYNYAc+mRcxyt1ZD9RKagha4xbhNw/vV4Yy4E4JV9YtSPDLxlR+R+omKnqP
 3DZ4elDFi+6tDKjmuCL5RVgAEZtN8aXiZkACdpPMMb3Wy0IlbmAgyMKTVNAjaq/+6uea
 ygCg==
X-Gm-Message-State: ABy/qLasPvcF7OQ+TXIW5jVZ0dupC6AABFL2imj6PpIqqr0cj//r1uNq
 FN7eHz6iE1PEjSjJm496zbCU3Up3bHFmXcBCYiAF/RAC579cKsSeB/gIF7Yxd8mf6xydfKrO/8Q
 vToW7bLiHoSypRFQyuYQr1kt4wdpPJEd/b143
X-Received: by 2002:a17:906:845c:b0:99b:cb7a:c16e with SMTP id
 e28-20020a170906845c00b0099bcb7ac16emr7448812ejy.33.1691081604097; 
 Thu, 03 Aug 2023 09:53:24 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFZrPM/Z+NwyCEwlAbDew09S3+m62aBBypP+UWOWz3PIZn/Ob9wE8kk/J55Vhq3fgGvTHyc3w==
X-Received: by 2002:a17:906:845c:b0:99b:cb7a:c16e with SMTP id
 e28-20020a170906845c00b0099bcb7ac16emr7448793ejy.33.1691081603958; 
 Thu, 03 Aug 2023 09:53:23 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 ka21-20020a170907991500b009882e53a42csm70527ejc.81.2023.08.03.09.53.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 09:53:23 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net,
 donald.robson@imgtec.com
Subject: [PATCH drm-misc-next v9 08/11] drm/nouveau: chan: provide
 nouveau_channel_kill()
Date: Thu,  3 Aug 2023 18:52:27 +0200
Message-ID: <20230803165238.8798-9-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230803165238.8798-1-dakr@redhat.com>
References: <20230803165238.8798-1-dakr@redhat.com>
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
will allow asynchronous jobs processing push buffers and emitting fences.

If a job times out, we need a way to recover from this situation. For
now, simply kill the channel to unblock all hung up jobs and signal
userspace that the device is dead on the next EXEC or VM_BIND ioctl.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_chan.c | 14 +++++++++++---
 drivers/gpu/drm/nouveau/nouveau_chan.h |  1 +
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index f69be4c8f9f2..1fd5ccf41128 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -40,6 +40,14 @@ MODULE_PARM_DESC(vram_pushbuf, "Create DMA push buffers in VRAM");
 int nouveau_vram_pushbuf;
 module_param_named(vram_pushbuf, nouveau_vram_pushbuf, int, 0400);
 
+void
+nouveau_channel_kill(struct nouveau_channel *chan)
+{
+	atomic_set(&chan->killed, 1);
+	if (chan->fence)
+		nouveau_fence_context_kill(chan->fence, -ENODEV);
+}
+
 static int
 nouveau_channel_killed(struct nvif_event *event, void *repv, u32 repc)
 {
@@ -47,9 +55,9 @@ nouveau_channel_killed(struct nvif_event *event, void *repv, u32 repc)
 	struct nouveau_cli *cli = (void *)chan->user.client;
 
 	NV_PRINTK(warn, cli, "channel %d killed!\n", chan->chid);
-	atomic_set(&chan->killed, 1);
-	if (chan->fence)
-		nouveau_fence_context_kill(chan->fence, -ENODEV);
+
+	if (unlikely(!atomic_read(&chan->killed)))
+		nouveau_channel_kill(chan);
 
 	return NVIF_EVENT_DROP;
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.h b/drivers/gpu/drm/nouveau/nouveau_chan.h
index bad7466bd0d5..5de2ef4e98c2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.h
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.h
@@ -66,6 +66,7 @@ int  nouveau_channel_new(struct nouveau_drm *, struct nvif_device *, bool priv,
 			 u32 vram, u32 gart, struct nouveau_channel **);
 void nouveau_channel_del(struct nouveau_channel **);
 int  nouveau_channel_idle(struct nouveau_channel *);
+void nouveau_channel_kill(struct nouveau_channel *);
 
 extern int nouveau_vram_pushbuf;
 
-- 
2.41.0

