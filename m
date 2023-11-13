Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C95327EA359
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 20:13:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5723910E18F;
	Mon, 13 Nov 2023 19:13:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3866510E18F;
 Mon, 13 Nov 2023 19:13:16 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6bd20c30831so758566b3a.1; 
 Mon, 13 Nov 2023 11:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699902796; x=1700507596; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RWzM5KKSUg5Npbg8tYin1ALDkNDOd2uQV93DTqS6tZE=;
 b=IV1keGq3XH0K6crtGIBNEoG8hQBoVMJ4o/tGjWErvEEb1WyTSniQYUQ7hSpItstCC4
 xDcDVp8PO6PP759Jiq81Wc0WwHjL1mVECwhLRUUnWSdqimmB9PhsDg5cPATsis2el978
 UBtuIL6vL2COIcfhCGPZlVbTd18S4Vmho+65TV7lUGNXyStsvdlvv6+6QXp23wR0P3il
 xt2RkXh+98X9A9X8HzPwBuMHqx7sKcB0ukOLYzxayDiwFMCHogEr0GQfSSSqtAEp3Efl
 9d7aZNJy9vb/wZN6+s0s90DAi0viCJuDgJSYTeMx5hACIXodcpVxMsctfQ3yxx7edDxS
 pBrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699902796; x=1700507596;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RWzM5KKSUg5Npbg8tYin1ALDkNDOd2uQV93DTqS6tZE=;
 b=Fqm9uWn9KQYnCrCvJm/gN9F7xdHpuSOUWNlRUeBpvIGeEPZbdSdfIptu8PGRgAUGNo
 VIx8aL6jyNn4fOjpJVI1KK1QacEXND3mqSNqsEZUPAOHgmArrw1RCcc/YDv6NmFld51q
 e90+ldYq8HIpB6OUDpmMwbPpftwSpUSPzcfY4cm75w2XP8IXXQLkG6RoVF1p8RBlwHlz
 aF4UsTWZgYVR6sJIHw9oQIts/qTsAivr/20H8lEy/izqXby7MLOIMinv0alF/VGSFSig
 tbFbsMUr3rspNya2vOt9UKpHff45Q22bc71ONNY+Cw9OrFCwSxUT/4FEfWYgVJ+jSLfy
 xIuQ==
X-Gm-Message-State: AOJu0YwIDsWAnErGAzdFqoTlOYpkYUXHxjSueQ3jeDzNb+oF8bJQWnjO
 RhA9tLqGKuZQGmYdvNJyBpg=
X-Google-Smtp-Source: AGHT+IEx1swZIOzZT6VBDGY9Puczke/bXdMZexkyE1GF8rGgfqO39gQjfSRzd05QzUXTWo6YurNhYA==
X-Received: by 2002:a05:6a00:6506:b0:68f:c8b3:3077 with SMTP id
 hc6-20020a056a00650600b0068fc8b33077mr8267101pfb.1.1699902795624; 
 Mon, 13 Nov 2023 11:13:15 -0800 (PST)
Received: from abhinav.. ([103.75.161.208]) by smtp.gmail.com with ESMTPSA id
 u25-20020aa78399000000b006bdb0f011e2sm4085071pfm.123.2023.11.13.11.13.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 11:13:15 -0800 (PST)
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
To: kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v3] driver: gpu: Fixing warning directly dereferencing a rcu
 pointer
Date: Tue, 14 Nov 2023 00:43:03 +0530
Message-Id: <20231113191303.3277733-1-singhabhinav9051571833@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <8e9efe54-2799-4539-a8b0-aa199f8052f6@redhat.com>
References: <8e9efe54-2799-4539-a8b0-aa199f8052f6@redhat.com>
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
v1 -> v2 : Replaced the rcu_dereference(...) with unrcu_pointer(...) and
           also removed the rcu locking and unlocking function call.
v2 -> v3 : Changed the description of the patch to match it with the actual
	   implementation.

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

