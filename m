Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E497EA302
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 19:43:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F2D910E3EA;
	Mon, 13 Nov 2023 18:42:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABC5310E187;
 Mon, 13 Nov 2023 18:42:56 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-6d64ca151c2so179227a34.1; 
 Mon, 13 Nov 2023 10:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699900976; x=1700505776; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2mtmd09hFYXnVdRkrFU6g3p7HtLLyzcUAB+w/A7AON4=;
 b=RbgV+U0OnzIsFYbShrIn/6xzalp1rfjGp54I36GKZOh71aRhKy27WoQ2sml9w16tJX
 MW2GcXHmo7Gk3GSzKleb+MgMG/PNrRCVIhAmlqfa1PtB4em1fo05M+hGQy499yBnyq7y
 oF7HCSC9r0BPL8eaWslhfULdBZRwl6KpMRVDaEo6STqqy1mF74cp0+WGVmF0umolM4TP
 iAcCnQZwVGt0tKuz36PURtqHI4L+vZmYImgdWLMl4gLnl3R55avfvne4mkSKNsyIyTPw
 dwLhEt5Z5vUN52PdEUYGjWHgnTk+GyYXenQ9s5LiOuk+CUw/1y7pOfLfZ/SXO6ayrgnU
 HMfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699900976; x=1700505776;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2mtmd09hFYXnVdRkrFU6g3p7HtLLyzcUAB+w/A7AON4=;
 b=FY0ObTzVktWuH/WFuHbq+nFlpw9FYBxFzL+ML9LnQUm9V06azWplHDE72GXI4yDv7u
 sFutQWARCNELUJ/abpHdDLP5VVPVf6U3KhsC0XPqOsB0y73qYsV4eSk+rebxwO5RmW99
 C9xisjqMoX0FYM+Ph6DQB6dv1y2R3ZF0hq2dUtEIh1VXSipF8Thx+QqR3U1lZfYbg1l+
 KJt4n3RJKjB6Iuvr58qCInHC24PhWF7tCi2Qv1V5WcZoYckPeKwKxejrofXnGVOIYfri
 4ZruT23Y/o9gzCInOT2cFZqFbnGbZHbbpzBGf/WiNNPnsk3FX48NXZAe/49YadtK4M5m
 norQ==
X-Gm-Message-State: AOJu0YwwUntM8bGFpSAC5OmS6w6V9yT1M0Pnbzjf5to86oyrYPTPkPrD
 ln5l6CSzNHu8I4CjwVgv01w=
X-Google-Smtp-Source: AGHT+IEA1BUXt8w/1R9eTTYLZmyMjGnY+Z6vq6aMaSD2YdSx84htQATbTZVVwb3NbeXa3fdeWUhkBg==
X-Received: by 2002:a05:6830:462a:b0:6b9:d3bd:3985 with SMTP id
 ba42-20020a056830462a00b006b9d3bd3985mr6976344otb.1.1699900975849; 
 Mon, 13 Nov 2023 10:42:55 -0800 (PST)
Received: from abhinav.. ([103.75.161.208]) by smtp.gmail.com with ESMTPSA id
 16-20020a630b10000000b005bd627c05c3sm4256693pgl.19.2023.11.13.10.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 10:42:55 -0800 (PST)
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
To: kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v2] driver: gpu: Fixing warning directly dereferencing a rcu
 pointer
Date: Tue, 14 Nov 2023 00:12:38 +0530
Message-Id: <20231113184238.3276835-1-singhabhinav9051571833@gmail.com>
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

