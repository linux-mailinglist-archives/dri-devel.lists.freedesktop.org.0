Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 344BB6713AC
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 07:14:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB6AD10E69C;
	Wed, 18 Jan 2023 06:14:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D13E10E69E
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 06:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674022453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=arClRUS1jAAdkcFM0OKNg8mvWVVAlTJxmoO3YVnMeNE=;
 b=LtKroe6GmUxx70xDKH7ZfHlVkx2qRc3eaOS2yJdtCGCbu96j77dsiK/4a+kOWQ37O8dlW+
 U9wi1MeV6eXlsAUHdWE/4dryCcbVaBMOWdjrfJD97XToQZ8YxwljpFiyyjTTA5/MMvUqr8
 BItpBm/P/QyMgyzF03w+PvzDOoPsMC4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-626-FxbKJ5ngM-eyUMQQvJY0Lg-1; Wed, 18 Jan 2023 01:14:06 -0500
X-MC-Unique: FxbKJ5ngM-eyUMQQvJY0Lg-1
Received: by mail-ed1-f69.google.com with SMTP id
 s14-20020a056402520e00b0049e0bea1c3fso6047182edd.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 22:14:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=arClRUS1jAAdkcFM0OKNg8mvWVVAlTJxmoO3YVnMeNE=;
 b=IY4Mv4+RIRvf6T1sdpVmqwaK0uW5Nh6rGlA5n8MmV7s7b3otwvnkekqOmQAyG3evd6
 y2/7uHfYLWIAHO036mlVTaZ9hu+AxnH/o5GxRQfLuwfmAnhZ1P++dqT35oH2TOQ0UB52
 Wb9lcyPzpxXVMvZEU5SxAF+O+hLs6i0VpcQgoDqPJtJcJEJiq84FaD4AzVg7Z15wH5uQ
 50ItuDHwia8ix6hxQKhnJ8VyWXcSfYXrw9rwCgyL31nJTtGQYLbDH4C0GRQHu2QSa6jF
 EF7/ZOh94H0a2d+uWk/c8p2RET56OK/7z8rgNzd3gb86glcs2CzVV3GXg0xZQWmV0+qd
 ZsNA==
X-Gm-Message-State: AFqh2kq+/8p1wrxNKxhjdZWWnA/dBHJqXFMIW9WfBgAvTc+T5xprNtUM
 dml8AHRUg0NhgCgRomMnJwq2H5DH2CpMF8KTIQxzxfy9qyiA9OW/z8FTKopQxdIcOSTVRnDyNfj
 +JEcCcgXBdRZsUT4ibiJ06qnlsy2H
X-Received: by 2002:a17:906:d971:b0:870:7e7d:97a7 with SMTP id
 rp17-20020a170906d97100b008707e7d97a7mr5281481ejb.72.1674022445709; 
 Tue, 17 Jan 2023 22:14:05 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvpsASk83uq4IIpUYeM6NlUZGHTvMFacGsEyh3xonT5oiC/C+OajcLwYQPPr8OmFy9NfpFhjQ==
X-Received: by 2002:a17:906:d971:b0:870:7e7d:97a7 with SMTP id
 rp17-20020a170906d97100b008707e7d97a7mr5281469ejb.72.1674022445535; 
 Tue, 17 Jan 2023 22:14:05 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 f22-20020a17090631d600b00779cde476e4sm14066480ejf.62.2023.01.17.22.14.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 22:14:05 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@redhat.com, christian.koenig@amd.com,
 bskeggs@redhat.com, jason@jlekstrand.net, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net
Subject: [PATCH drm-next 10/14] drm/nouveau: chan: provide
 nouveau_channel_kill()
Date: Wed, 18 Jan 2023 07:12:52 +0100
Message-Id: <20230118061256.2689-11-dakr@redhat.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118061256.2689-1-dakr@redhat.com>
References: <20230118061256.2689-1-dakr@redhat.com>
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
2.39.0

