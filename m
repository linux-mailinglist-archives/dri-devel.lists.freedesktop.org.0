Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B48996D55F8
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 03:28:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2E5B10E230;
	Tue,  4 Apr 2023 01:28:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA06A10E29F
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 01:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680571715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rFDnwLdkC+a84lmheZyyv02Y7sEGNyBLjO5UYHqgwOc=;
 b=Ds7UpbgUvJ1dVwWh8JzlD+5kHnKvAzz8w83ktx5WhSdjniydKA20jlwfW8/Au2sWKr15xv
 IcGlTA3FsfEwVTVW2hMg5IzpdNdr55PLGmF86BFxPNszX1Yi3dhnKApl8J98WuCPFpHAJv
 zjLVPURqbyXOQo35HaOvuP7GvYXen78=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-298-_3r26BtBMg-c3vJDyiW22Q-1; Mon, 03 Apr 2023 21:28:33 -0400
X-MC-Unique: _3r26BtBMg-c3vJDyiW22Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 j21-20020a508a95000000b004fd82403c91so43279506edj.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Apr 2023 18:28:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680571712;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rFDnwLdkC+a84lmheZyyv02Y7sEGNyBLjO5UYHqgwOc=;
 b=YXaOKBU7grfG1VlGCKfC2XofKvg8D4sBxFmhuUvY4L+Tf+nYW2CdPtuzlvlawv/b78
 qiKV5T6108miKbNNqqkGI6nz5MzIiGjYAlWCX++UqgMKWkMwn9SzKET9cdYwUXfQH+O5
 Gr8jDbwNXUnndIKM3r8eBFNIoqq+dEGRBkLPujlY+YdWc8XFyiW5M0s4KQlx98IGqM9f
 6Lp8ESplongukZUHKy0ly3jZABa+jfu1glPxrpxrNrPn9DwzFigkui2XJ5SlANQd6dzB
 IvMMdAOkKN2N//WK0MTzuxQ1Gh5G5A8ofhkqVv2zO/CHPiT8S6QH+qjckEFwOJfvyxyD
 cQdg==
X-Gm-Message-State: AAQBX9cPeTPNsFPqbKH3z6IoKSVh6fKVxLW+v+oH9wSjpp55civTz4Z/
 cuVocVBZxvIJGwYsM/Yv1T+JAAcb5LQAI9S7IbxuP7MRM/lo4f+mFdAFRKjDQgAMIHdKwComvyf
 E6n7pG+0+liE/NUeya4ywit/RrgUU
X-Received: by 2002:a17:907:3f22:b0:931:86cf:9556 with SMTP id
 hq34-20020a1709073f2200b0093186cf9556mr754095ejc.23.1680571712727; 
 Mon, 03 Apr 2023 18:28:32 -0700 (PDT)
X-Google-Smtp-Source: AKy350bTvpbIk/GmxFlxt18RFwL9YdKIZ4Q77ktCoQzFycA8gGsVYWiQjvWZuLDin9qz3iy+Fs1c5A==
X-Received: by 2002:a17:907:3f22:b0:931:86cf:9556 with SMTP id
 hq34-20020a1709073f2200b0093186cf9556mr754076ejc.23.1680571712535; 
 Mon, 03 Apr 2023 18:28:32 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a5099c6000000b004aee4e2a56esm5318778edb.0.2023.04.03.18.28.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 18:28:32 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
Subject: [PATCH drm-next v3 12/15] drm/nouveau: chan: provide
 nouveau_channel_kill()
Date: Tue,  4 Apr 2023 03:27:38 +0200
Message-Id: <20230404012741.116502-13-dakr@redhat.com>
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
index f47c0363683c..a975f8b0e0e5 100644
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
index e06a8ffed31a..e483f4a254da 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.h
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.h
@@ -65,6 +65,7 @@ int  nouveau_channel_new(struct nouveau_drm *, struct nvif_device *, bool priv,
 			 u32 vram, u32 gart, struct nouveau_channel **);
 void nouveau_channel_del(struct nouveau_channel **);
 int  nouveau_channel_idle(struct nouveau_channel *);
+void nouveau_channel_kill(struct nouveau_channel *);
 
 extern int nouveau_vram_pushbuf;
 
-- 
2.39.2

