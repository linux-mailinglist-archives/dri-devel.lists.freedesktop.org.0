Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F087E9761
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 09:11:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B2D10E095;
	Mon, 13 Nov 2023 08:10:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE5C410E095;
 Mon, 13 Nov 2023 08:10:54 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-6bb744262caso923209b3a.0; 
 Mon, 13 Nov 2023 00:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699863054; x=1700467854; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DDB5Cfhe2/Np2buAc13fG3d5R3/QsQEtB/l9Kg+8Kto=;
 b=Y6PfZNBJD4B2OXycrfGw3r85t1he9qXrsOlE2Y0mihHeQqBZS9hL2nCuTu+sD0gPIo
 CsDEGNnKcXY9KzZwfVfiVxmdcsjJQmb0VuHx+vf5AVFZydfiUO7RjG3VZGNhfacFPaN1
 ch6QBta8ss6YlvxgiuZ9mvpPGVo2Xd/Ggmq+O8zuy15AIhE2j8XBkoBxwDAA7PIbbo6O
 NY91VJ3PCM1dRgBaj2uv7mrtuRIdJCi+w6w6qOw0AJnAjbg/RmhLrcL766C3WfErVL3v
 M2RtXwmy9F91VyQtyo6gV8Qfbxqhc46u4EeFBPc4y2Tr1DlZQ8TZ4eputPia+RNhfDqx
 bxUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699863054; x=1700467854;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DDB5Cfhe2/Np2buAc13fG3d5R3/QsQEtB/l9Kg+8Kto=;
 b=cxEjITcMWUTeBLmGUbk/RSxW8lGbg58STYtwuR8a+vc8iC6TxMObsNrKKih3wXLXky
 HLYsVjZ+KA1LCyjJHaZeAXhILqR2/4Fd7ZxVIDHTi7+Q+1FDBvz3yf12a7kgH/slTeXX
 Q40d1AThtMLXoRnix+Vek02tj1CSFTpIont9ckGStsYkZ+jZJBhu0ARaa6Jm/1VLGzXz
 nA0hRonnKOogUytMKJ8QCBm2nxVMz7DXHegbL9vGH77OMXkNqC2m6pXgVwkb00MUDOMz
 gLYOM9BEgWrPFlRg5kDVXGL5/bE2rVnVUybNiedOfyqnwLM6IDnaK7byQidJ1I3cfx5X
 K+Rw==
X-Gm-Message-State: AOJu0YwbZ4VwvVwqamll/TmeoHPGZ02JEEkdzQdCRtVeMJsVE6PuOJ5+
 rEtBGEmf5Gwva5+D2ukXmDZake50o+S4TA==
X-Google-Smtp-Source: AGHT+IErgwyh6IU6A+XEPWZwt7rqHwWnNiCEmJoA9K52qeb/PCG71hHkTbQiGJ2i3IckahwFnygwlw==
X-Received: by 2002:a05:6a21:9995:b0:186:10ae:152a with SMTP id
 ve21-20020a056a21999500b0018610ae152amr7949073pzb.4.1699863054195; 
 Mon, 13 Nov 2023 00:10:54 -0800 (PST)
Received: from abhinav.. ([103.75.161.210]) by smtp.gmail.com with ESMTPSA id
 22-20020a17090a01d600b0027d0a60b9c9sm5793629pjd.28.2023.11.13.00.10.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 00:10:53 -0800 (PST)
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
To: kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH] driver: gpu: Fixing warning directly dereferencing a rcu
 pointer
Date: Mon, 13 Nov 2023 13:40:40 +0530
Message-Id: <20231113081040.2947143-1-singhabhinav9051571833@gmail.com>
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
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Abhinav Singh <singhabhinav9051571833@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch fixes a sparse warning with this message 
"warning:dereference of noderef expression". In this context it means we
are dereferencing a __rcu tagged pointer directly.

We should not be directly dereferencing a rcu pointer, rather we should
be using rcu helper function rcu_dereferece() inside rcu read critical
section to get a normal pointer which can be dereferenced.

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
 drivers/gpu/drm/nouveau/nv04_fence.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nv04_fence.c b/drivers/gpu/drm/nouveau/nv04_fence.c
index 5b71a5a5cd85..e62bad1ac720 100644
--- a/drivers/gpu/drm/nouveau/nv04_fence.c
+++ b/drivers/gpu/drm/nouveau/nv04_fence.c
@@ -39,7 +39,9 @@ struct nv04_fence_priv {
 static int
 nv04_fence_emit(struct nouveau_fence *fence)
 {
-	struct nvif_push *push = fence->channel->chan.push;
+	rcu_read_lock();
+	struct nvif_push *push = rcu_dereference(fence->channel)->chan.push;
+	rcu_read_unlock();
 	int ret = PUSH_WAIT(push, 2);
 	if (ret == 0) {
 		PUSH_NVSQ(push, NV_SW, 0x0150, fence->base.seqno);
-- 
2.39.2

