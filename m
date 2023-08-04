Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA537707D8
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 20:25:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 629F110E75B;
	Fri,  4 Aug 2023 18:25:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7EC810E74F
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 18:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691173497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FPFh5xK9R3PMhoxLIZOGRTrlUVBMred7+qWqFlBzAlw=;
 b=Klu6S68JGU7nbRcwW5OsXfUj6b/AUA7w7RxqFwJwLLUwlA8ImilsBA0bZJDgZdK3VTBEQ6
 mbXqmiHkFjVNmGVMf5RqRB+RPwxDPAhtl2F5mgsshcK0sZ06EJxxiva63eII8ooj62eZ7M
 IcR8JX0DAmT5qhVQdMBMzYnH79nUbs0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-247-Yb3yn-LpOSyl3CyYlRXzSA-1; Fri, 04 Aug 2023 14:24:53 -0400
X-MC-Unique: Yb3yn-LpOSyl3CyYlRXzSA-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-5218b9647a8so1580149a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Aug 2023 11:24:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691173493; x=1691778293;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FPFh5xK9R3PMhoxLIZOGRTrlUVBMred7+qWqFlBzAlw=;
 b=G83LexvvDGxCwtWeRzRBnvcWA9OsvfVajdCPLSzvU+lfrbO8QBsjJ2po/tLqUT5Jaw
 HANui5m+GEe6PR7WEtQbGFJQurZEavfa4s58+25cPFXqpnQZUUBxDLEsedtyaFVE1Gw9
 LGzJm5H2IWd81/x5Fm7C7ciLuySEN9yaArfAUXHBawsF7zCMIqGAp8B7W5503EsBJwhW
 XJO1qLCn4HJh0iT+OGsPgFaXLcdviOG62C47hjaCrkf9i1lKt+u/H7PUYxuUepWhylHr
 4VRoiL70qu6llP3H5MIMXFjC8dwAdIzk0H3WBYunCOpOQAW45j2ouVpiRrvqWvLVUZ/Y
 GCnw==
X-Gm-Message-State: AOJu0YyXzZQDaKQUf6Ci+a/a+XFjIwIhq5aw0UkuquUfprYCshQ/P41h
 Vx32EtOH2eryahZGIAKq5mldaDgEYLL2ILnX04nyQlYe+oZjMqT3P0BpUXAlFnE/Yxc2jyE4em4
 ytS3bxnOtldHe6dKZ50DV9NUhWE5A
X-Received: by 2002:a05:6402:d7:b0:523:1e18:3a78 with SMTP id
 i23-20020a05640200d700b005231e183a78mr1852265edu.12.1691173492889; 
 Fri, 04 Aug 2023 11:24:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzs0P8hIFqjJHKUIx+lEdMykWuVEGGHkoa55iEIBVzpkjp0zK+xW2gAjVxHvq75jYW01UMnQ==
X-Received: by 2002:a05:6402:d7:b0:523:1e18:3a78 with SMTP id
 i23-20020a05640200d700b005231e183a78mr1852238edu.12.1691173492693; 
 Fri, 04 Aug 2023 11:24:52 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 w16-20020a50fa90000000b00522295516c4sm1551054edr.90.2023.08.04.11.24.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Aug 2023 11:24:52 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net,
 donald.robson@imgtec.com
Subject: [PATCH drm-misc-next v10 09/12] drm/nouveau: chan: provide
 nouveau_channel_kill()
Date: Fri,  4 Aug 2023 20:23:49 +0200
Message-ID: <20230804182406.5222-10-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230804182406.5222-1-dakr@redhat.com>
References: <20230804182406.5222-1-dakr@redhat.com>
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
 Danilo Krummrich <dakr@redhat.com>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The new VM_BIND UAPI implementation introduced in subsequent commits
will allow asynchronous jobs processing push buffers and emitting fences.

If a job times out, we need a way to recover from this situation. For
now, simply kill the channel to unblock all hung up jobs and signal
userspace that the device is dead on the next EXEC or VM_BIND ioctl.

Reviewed-by: Dave Airlie <airlied@redhat.com>
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

