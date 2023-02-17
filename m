Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1925769AD0A
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 14:49:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A197E10F008;
	Fri, 17 Feb 2023 13:49:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F64910F008
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 13:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676641734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nuqfhAPXoP8eMSRnoJXE/EUnRUmH5Dpmadrq5ZDJBI4=;
 b=G74HFR3uzw/wRrgO1dvWkHqLxp+NhwmkSrSotGAPCTYmv8c1Ow4VPW8SSnlksqpJbcdpj6
 WDK88yv7JS2ixhP2FFCglMZyE1xXoAw7nKobAcVyRr+aGrQiR4VZB2KfPSrRBFUX8Ti5Yv
 Fnp1yc+TWdbKb3KHjXvHmei/rGcKMrs=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-354-5i71OAddNiWKg62NQ3BrBQ-1; Fri, 17 Feb 2023 08:48:51 -0500
X-MC-Unique: 5i71OAddNiWKg62NQ3BrBQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 b16-20020a056402351000b004ace77022ebso1913478edd.8
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 05:48:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nuqfhAPXoP8eMSRnoJXE/EUnRUmH5Dpmadrq5ZDJBI4=;
 b=VqHaAZelhDCuXPiJBwphiaC8i78wP4IQNj3MkPGHgo/b6mnEYtGXPnHd377Z9l5t9U
 1w1ymUq1h3uH3NZDzMc6c5WAXXe8TOjzinbhO0TtjL3X6iwDdS9PlVOzhHc3AoNbuJSb
 q0ni14dA51YJJkNMXWGNhqXChV+g4uZrwozUKzbbDAZSq8zYl+csbYPq983OqHBYJwLt
 mF3PsURV4QfBXyE3P0gMkL9bqYb5n/iiTnOw57uJBhxSBuaSewsIX6oq426DDUCiVlq3
 rPRVX++AQn5rZl/O5MOqfEPWFDDAfIcx/O3i0rnsAJEpAr6bCQSXot3HYVnGzSrTo5mz
 rszQ==
X-Gm-Message-State: AO0yUKULZ5ie3fdnW9YaJ8HHLFb8c+f3uGq+roLAaX8pzutDXefUxCnV
 pvW6XFLPiuczGckhBT/LO+sFqo3yL8bTOpPxELXte3vLqQJdn6TWoR3BJQlnodxsci48O7iEWdD
 lf9RTw/6Mw1LOfxqUSerEHMho4hRf
X-Received: by 2002:a17:906:5012:b0:87d:9447:f7fb with SMTP id
 s18-20020a170906501200b0087d9447f7fbmr444205ejj.38.1676641730480; 
 Fri, 17 Feb 2023 05:48:50 -0800 (PST)
X-Google-Smtp-Source: AK7set89k4Od4Os7LWbT0Iek0fo+d31O5+Il7AqZlhgERwv5aHbfx3F8XejW0D6aFl2/IjkHLHgKFg==
X-Received: by 2002:a17:906:5012:b0:87d:9447:f7fb with SMTP id
 s18-20020a170906501200b0087d9447f7fbmr444186ejj.38.1676641730324; 
 Fri, 17 Feb 2023 05:48:50 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 y23-20020a17090614d700b008b155de0984sm2180964ejc.170.2023.02.17.05.48.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 05:48:49 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
Subject: [PATCH drm-next v2 12/16] drm/nouveau: chan: provide
 nouveau_channel_kill()
Date: Fri, 17 Feb 2023 14:48:16 +0100
Message-Id: <20230217134820.14672-7-dakr@redhat.com>
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
index 1068abe41024..6f47e997d9cf 100644
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
2.39.1

