Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA85752962
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 19:05:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D92210E735;
	Thu, 13 Jul 2023 17:05:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4165810E730
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 17:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689267919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OhcRjSdJAD7B8JiFY4weu/O+VY7c03xht8db5Jb3htY=;
 b=GKANDYrk61MMzNBm11k8G1LrxFib4/Jj0o1X1lIK9+k9nR8ntCQC6go/S4GMV1w7XuboQK
 G4gGnNdHKm9DLzz0VktivdIWeYf1Qdz9taB8VO9Ru+tq7BoB/VwqpFLIZVLavhAGobjDGF
 CKB6LqkQP0B/HPco2xX629BFhqq+Eqk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-180-UxorTAVtP56LRXu5wPVoIQ-1; Thu, 13 Jul 2023 13:05:18 -0400
X-MC-Unique: UxorTAVtP56LRXu5wPVoIQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-99388334de6so56671466b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 10:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689267917; x=1691859917;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OhcRjSdJAD7B8JiFY4weu/O+VY7c03xht8db5Jb3htY=;
 b=VoOaO+ni9uqwvhU1+DvhhHNnmEgeJoPsQmoYsrAvxaud7WgTE8m98zV8qLYkN6cN0w
 qqyPs2ghFOOel8kO2wRMTI0KgwzhAZQAWcZV6iDbcNy/lNdyAYWiDi1bftJ4F1suY+S/
 yD+V8nFwZNBV8wot9uBQMAM3JwM/keeNbUL9Jdw6CFYIsJ5S/n8JIbyxTiIcK0uJOFk+
 D4HKVZM4oGhJV1ji3IDEIO6dxxn3z/X6N7d5tdekqUA3JoeghcXnnnrEoGJmknyN8D/o
 B9ehm07nSYK6iA57IpCyzf26pTxxucWKBsqBofIKmRSYV0354sxdDjnKvSOBNe3D0tM8
 nMbw==
X-Gm-Message-State: ABy/qLYia4E6cFUJzXcdWEm/2GcZbO0hDi43oNc/Qy/1T51DAnkybIYD
 7TVrqOKIT1aprnMrd1Ru3Mg6/vs0GADK+rOPyutD98LehWWnO7z+n0VrrCfv+C2B+gQ0LJpPxNp
 xie044na0JQuCdZaGb9WZs7ChKJLs
X-Received: by 2002:a17:906:cf8e:b0:992:566b:7d57 with SMTP id
 um14-20020a170906cf8e00b00992566b7d57mr1807156ejb.61.1689267917024; 
 Thu, 13 Jul 2023 10:05:17 -0700 (PDT)
X-Google-Smtp-Source: APBJJlF5JGbr5MKAD3oUdg8yQDnH3WfT5V6TxOY51R1276GrqE8YBJQnagr5FbQoFiv4VdihXdb/yw==
X-Received: by 2002:a17:906:cf8e:b0:992:566b:7d57 with SMTP id
 um14-20020a170906cf8e00b00992566b7d57mr1807146ejb.61.1689267916859; 
 Thu, 13 Jul 2023 10:05:16 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a1709063ac300b00992b3ea1ee3sm4215671ejd.159.2023.07.13.10.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 10:05:16 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net,
 donald.robson@imgtec.com
Subject: [PATCH drm-next v7 10/13] drm/nouveau: chan: provide
 nouveau_channel_kill()
Date: Thu, 13 Jul 2023 19:04:05 +0200
Message-ID: <20230713170429.2964-11-dakr@redhat.com>
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

