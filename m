Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17ECF7EA2FE
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 19:37:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17C7810E180;
	Mon, 13 Nov 2023 18:37:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C220410E180;
 Mon, 13 Nov 2023 18:37:51 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-58962bf3f89so316435a12.0; 
 Mon, 13 Nov 2023 10:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699900671; x=1700505471; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2mtmd09hFYXnVdRkrFU6g3p7HtLLyzcUAB+w/A7AON4=;
 b=JPyMzLS9x0pfWQ+xi9ExoQq2clcrrCTSjScaTfbNHQeucb+Bv1IW5vTgDWnL7WCRwK
 ASchlPSTXq0OIEQthdFl77WKBtUE+u/cNZLfoNAvx/A3doVWjHqi33iRyMbZXsSKiCo2
 4O3qUjtYEQyT9K8ViQRrM3y16PaUVnHvjZKvsyhq7Xap3NY/ghpHw0mlxZkM0pEe57sE
 NlIOoBazAMmSQA1sDx1PFgJL2k7CTOLqZhixbmXWBv+3IUQBQad/3jr5mLtWxOc2dP6M
 fh7HU8m2mPcgjCRtN2ZAinSvElOfYqesb/8O0JdMVqgG4h+jcKu+63cixy/RxWqeh0Ll
 9CYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699900671; x=1700505471;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2mtmd09hFYXnVdRkrFU6g3p7HtLLyzcUAB+w/A7AON4=;
 b=FtwRp2FJ4Sk9IpcTwi7IGpirhy06OYwE9WpBs1fuf8aM2ozJwoKnqm+7M/QnHUI1RG
 7tslnbsCEXThSECXaP3M87alzVlrwGjKl/Liyp4ePmddpqKfnZwNLq4GgrrrKQpCCgF1
 93Y/kAz/yUB1913QOz4pUYRkPDVoQRvgHUq8ysh1hXbn68TdLPWvsCOtXEXZmcK7gtb8
 GHPu0bWP4o3UntQBLye0GH1/ry9FuEeYLNz3eJAk6SRDzF2Tu1gRV1rkJc+7CayqIqzQ
 baF8ObmsIbzCmi3LMyfpo+Js5CZ9SDkST696vVkX63pAtPwpwl+ISIlOtXPwqw/ZOALF
 D7PA==
X-Gm-Message-State: AOJu0YxZxoNW4eGPjpwWoGl0R+X6GuNjaLRACuh6yxkvALJLuiEPlFaI
 9kLCa13L8xAt7sE7CO6QmUY=
X-Google-Smtp-Source: AGHT+IF8WqLZR69KCm/civDjgFUbwk1ZPnhnTXEboXMHqRlLQMHKjR9oiG6PqIPphLBYkQjDkLbheg==
X-Received: by 2002:a05:6a21:9981:b0:17a:d292:25d1 with SMTP id
 ve1-20020a056a21998100b0017ad29225d1mr93125pzb.6.1699900671212; 
 Mon, 13 Nov 2023 10:37:51 -0800 (PST)
Received: from abhinav.. ([103.75.161.208]) by smtp.gmail.com with ESMTPSA id
 e13-20020a056a001a8d00b006b8ffc49ba5sm4058507pfv.38.2023.11.13.10.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 10:37:50 -0800 (PST)
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
To: kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v2] drivers: gpu: Fixing warning directly dereferencing a rcu
 pointer v2
Date: Tue, 14 Nov 2023 00:07:37 +0530
Message-Id: <20231113183737.3276419-1-singhabhinav9051571833@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <d33fc41b-5a1f-4186-a0b2-3c82dcb8f00b@redhat.com>
References: <d33fc41b-5a1f-4186-a0b2-3c82dcb8f00b@redhat.com>
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
v1 -> v2 : Replaced the rcu_dereference(...) with unrcu_pointer(...) and
also removed the rcu locking and unlocking function call.

 drivers/gpu/drm/nouveau/nv04_fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nv04_fence.c b/drivers/gpu/drm/nouveau/nv04_fence.c
index 5b71a5a5cd85..cdbc75e3d1f6 100644
--- a/drivers/gpu/drm/nouveau/nv04_fence.c
+++ b/drivers/gpu/drm/nouveau/nv04_fence.c
@@ -39,7 +39,7 @@ struct nv04_fence_priv {
 static int
 nv04_fence_emit(struct nouveau_fence *fence)
 {
-	struct nvif_push *push = fence->channel->chan.push;
+	struct nvif_push *push = unrcu_pointer(fence->channel)->chan.push;
 	int ret = PUSH_WAIT(push, 2);
 	if (ret == 0) {
 		PUSH_NVSQ(push, NV_SW, 0x0150, fence->base.seqno);
-- 
2.39.2

