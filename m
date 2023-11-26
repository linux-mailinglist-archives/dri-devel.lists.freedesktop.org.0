Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BFE7F933C
	for <lists+dri-devel@lfdr.de>; Sun, 26 Nov 2023 15:57:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCB3810E0C6;
	Sun, 26 Nov 2023 14:57:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F97810E0C6;
 Sun, 26 Nov 2023 14:57:37 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1cfa7be5650so4568585ad.0; 
 Sun, 26 Nov 2023 06:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701010657; x=1701615457; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ds6jz8XiqF0ADftYJN+hp07WDKExgCoZRBZ98zeNhK8=;
 b=g/RvzruNJCaCAwwDmpiKOCxii/oz3clpC0xFUQC+b/8A9/q9nDhNa59vweD+gIpfGZ
 Plmxm0bbdxhi91JZ7VoigRZMsFgs08ZidXv5isAE3QQeMjAK4UxK8VHXhm1ryhn2nYAd
 k32NckLsK9ZGagBghTUdt5h0w6nUxoHejtqK9KkBseUVR5kJSmHzKwpwmI2bdk2aH2bk
 btJqIgzIoO8vTSDbn2o4Cy/Z900Li4wJ2JcYg0vK/hkvZlQc4XDV9l9KBf59Qz83h1B2
 y+gLj4siYgk16jHvLCOaI2/6AfRp9rWGLRRBgTRK8JNBdC5E0TCbpst0ueYw65lzwzdj
 DkqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701010657; x=1701615457;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ds6jz8XiqF0ADftYJN+hp07WDKExgCoZRBZ98zeNhK8=;
 b=EFj+u1TDofpnpKLk80S++9+hMAKDJcH0NTnWHUfrq+84J9he53/14b8wX/3hH3CJ3B
 Es1nGY8ndHEnm8q+xVY5Xsq9IL5bVNkHFIQFmVRqBXjE6L259/YaZ/BxmVua0zKn+maX
 9b7KMNQJY27JqFPxpgOdf5ww/0qeKdofF45XXSY4yKVSJQQjk4ETF0y91LOWXs6KcegK
 I/Oa9W/YMoqOlSUmp8aUungogvhMNeMEiDqh1mOIY3AeP2s3XAODSRI9pc2KlxqqB+KM
 m9WQloFHrBgwyzIS6OZQdp0rVHi5faz7v1qbOV3Mqn48BxedlcZvUcbRC6ShbU9nWIhB
 8JHw==
X-Gm-Message-State: AOJu0YxzrQ6DTEEcO2yolZHoMpU6jz1JK02hlIwJsFUFrRkn5B30jd8s
 HuKJN2IFq7pSDbw4MaITa3w=
X-Google-Smtp-Source: AGHT+IHfTmf4escnImpLTzKE4gnb2lDqdXKrQ5LQmUVS/atAbTu2PTrA6K046ATTWXWsoyAbE4pjZQ==
X-Received: by 2002:a17:903:183:b0:1ce:5b6e:bae1 with SMTP id
 z3-20020a170903018300b001ce5b6ebae1mr10929057plg.3.1701010657137; 
 Sun, 26 Nov 2023 06:57:37 -0800 (PST)
Received: from abhinav.. ([103.75.161.210]) by smtp.gmail.com with ESMTPSA id
 t8-20020a170902bc4800b001cc131c65besm6470070plz.168.2023.11.26.06.57.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Nov 2023 06:57:36 -0800 (PST)
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
To: kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH] driver: gpu: Fix warning directly dereferencing a rcu pointer
Date: Sun, 26 Nov 2023 20:27:23 +0530
Message-Id: <20231126145723.388162-1-singhabhinav9051571833@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: nouveau@lists.freedesktop.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 dri-devel@lists.freedesktop.org,
 Abhinav Singh <singhabhinav9051571833@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix a sparse warning with this message
"warning:dereference of noderef expression". In this context it means we
are dereferencing a __rcu tagged pointer directly.

We should not be directly dereferencing a rcu pointer. To get a normal
(non __rcu tagged pointer) from a __rcu tagged pointer we are using the
function unrcu_pointer(...). The non __rcu tagged pointer then can be
dereferenced just like a normal pointer.

I tested with qemu with this command 
qemu-system-x86_64 \
	-m 2G \
	-smp 2 \
	-kernel bzImage \
	-append "console=ttyS0 root=/dev/sda earlyprintk=serial net.ifnames=0" \
	-drive file=bullseye.img,format=raw \
	-net user,host=10.0.2.10,hostfwd=tcp:127.0.0.1:10021-:22 \
	-net nic,model=e1000 \
	-enable-kvm \
	-nographic \
	-pidfile vm.pid \
	2>&1 | tee vm.log
with lockdep enabled.

Signed-off-by: Abhinav Singh <singhabhinav9051571833@gmail.com>
---
 drivers/gpu/drm/nouveau/nv10_fence.c | 2 +-
 drivers/gpu/drm/nouveau/nv84_fence.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nv10_fence.c b/drivers/gpu/drm/nouveau/nv10_fence.c
index c6a0db5b9e21..845b64c079ed 100644
--- a/drivers/gpu/drm/nouveau/nv10_fence.c
+++ b/drivers/gpu/drm/nouveau/nv10_fence.c
@@ -32,7 +32,7 @@
 int
 nv10_fence_emit(struct nouveau_fence *fence)
 {
-	struct nvif_push *push = fence->channel->chan.push;
+	struct nvif_push *push = unrcu_pointer(fence->channel)->chan.push;
 	int ret = PUSH_WAIT(push, 2);
 	if (ret == 0) {
 		PUSH_MTHD(push, NV06E, SET_REFERENCE, fence->base.seqno);
diff --git a/drivers/gpu/drm/nouveau/nv84_fence.c b/drivers/gpu/drm/nouveau/nv84_fence.c
index 812b8c62eeba..d42e72e23dec 100644
--- a/drivers/gpu/drm/nouveau/nv84_fence.c
+++ b/drivers/gpu/drm/nouveau/nv84_fence.c
@@ -85,7 +85,7 @@ nv84_fence_chid(struct nouveau_channel *chan)
 static int
 nv84_fence_emit(struct nouveau_fence *fence)
 {
-	struct nouveau_channel *chan = fence->channel;
+	struct nouveau_channel *chan = unrcu_pointer(fence->channel);
 	struct nv84_fence_chan *fctx = chan->fence;
 	u64 addr = fctx->vma->addr + nv84_fence_chid(chan) * 16;
 
-- 
2.39.2

