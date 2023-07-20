Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B226875A337
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 02:15:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C634410E547;
	Thu, 20 Jul 2023 00:15:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F2710E530
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 00:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689812137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OhcRjSdJAD7B8JiFY4weu/O+VY7c03xht8db5Jb3htY=;
 b=NiFIdMUvxxsl+lzOrO9YWBbLjRxa2MHwDSF+ksXUgW60yGnPL37yHa5MjjjS1FqcPbUbKr
 oiOHYjJ/gdtSvxpm1wYSMgnREgw7w7zVAQPyml62VoWpEQhYYo92pRZkn1yWSkz+Kaq5lc
 ho+O+D3jZng9He/6Nz7hXEh27uRA7aE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-b1eIqB9bMVu_YO024zwXCA-1; Wed, 19 Jul 2023 20:15:36 -0400
X-MC-Unique: b1eIqB9bMVu_YO024zwXCA-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-993f7b196a5so16544366b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 17:15:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689812135; x=1692404135;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OhcRjSdJAD7B8JiFY4weu/O+VY7c03xht8db5Jb3htY=;
 b=S4sCkVtZs0DJQzLVzUUpy8OFsaAiPwAOIj4y4ZQBobkK2zElWjgOumfx8+vaXooCDh
 JS+3YJp8gmZOuYGdEz1k9hexxGqodyCY5aHHrxTPZ3sOOffy27Y3h00CStBcnCvqC+YS
 rUCoUTPW1KC/Xbb+JJinQgU5AUDCW0Y7wuCG+5T6ZfITR1tdHMIMwk7Y1/6zYPhYk3ba
 vO+H5xwp/9Ib9PpYVpHNWAXsH1DuaVYXTONsBlkf2uOnuaIoW2dDefwTFxuGtiskYB+u
 ik8b7WPX9nny33dzHRwHEuUQK6vsUyjMoe0Vd214hYvpfU8Tf7PbWX0vJvTy+pLF8JUY
 LLug==
X-Gm-Message-State: ABy/qLZYDW53jEAGalxbj4nm61jjnFy3Cyh0jjVgL4zi8walpRnxJb1K
 k5jcfT47fM57028J3sbaKXhVRn1QMdkWhm4oEGI6cGB3dmQwb7AusduXanaRC78d6wlGxSw76Ob
 +DW8cYnfRf59E/2vtmbpD8bfUN91C
X-Received: by 2002:a17:906:289:b0:994:4be4:a106 with SMTP id
 9-20020a170906028900b009944be4a106mr3533489ejf.10.1689812135166; 
 Wed, 19 Jul 2023 17:15:35 -0700 (PDT)
X-Google-Smtp-Source: APBJJlH96n/KWpDaeUZ3mj4MnmFbtHq5B+xZI4mENhLnHewKGftgqsvLmf7wmzaTf4fUGBLWKW/Rag==
X-Received: by 2002:a17:906:289:b0:994:4be4:a106 with SMTP id
 9-20020a170906028900b009944be4a106mr3533468ejf.10.1689812134951; 
 Wed, 19 Jul 2023 17:15:34 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 jt16-20020a170906dfd000b00988c0c175c6sm2958515ejc.189.2023.07.19.17.15.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 17:15:34 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net,
 donald.robson@imgtec.com
Subject: [PATCH drm-misc-next v8 09/12] drm/nouveau: chan: provide
 nouveau_channel_kill()
Date: Thu, 20 Jul 2023 02:14:30 +0200
Message-ID: <20230720001443.2380-10-dakr@redhat.com>
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
2.41.0

