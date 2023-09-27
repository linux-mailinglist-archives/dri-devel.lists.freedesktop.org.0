Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2535C7B0D8D
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 22:46:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87EDF10E5A7;
	Wed, 27 Sep 2023 20:45:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2686F10E575;
 Wed, 27 Sep 2023 16:55:31 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1c3f97f2239so104430715ad.0; 
 Wed, 27 Sep 2023 09:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695833730; x=1696438530; darn=lists.freedesktop.org;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4l9UDvCbv8erE71IF5bB14OddV2GDc72p6otw4VVCo8=;
 b=ItLwrl4eznGfM5kltrlpqiqkAGVKL22JUbuHSP3Csy06MdD01JnBpRrK3GXe1tsb6W
 RNftv77876CxKDYX4G4K3qgZspI0Zx1J9fOy5JOF2YD8G9BU9rfEQYgq6hHpsMwAF5TQ
 16eBI6YihogCsX1JJfA6yqkyctBoohA6m5hQydkMGe+Y4UZV7jY8EDQlqeTZE9ExyqEh
 gg6tXKDG0eeOU2HHYp5Q/2y5R03eN3unPzaTHzNvBXjmRpsIIZCItPgnld226IXdJHak
 gybLtKOKpECJV462zdliZUVPXyDuetzFjVnKLisz0UQ+QZXTO8f6wxPTPz47XvDRpHAW
 oaPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695833730; x=1696438530;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4l9UDvCbv8erE71IF5bB14OddV2GDc72p6otw4VVCo8=;
 b=ULZcQkaHBLHqjqj9oqsnVizHEfH9hWUarXFLCfH38bBmK/mz7yhclIGQB7YUMFzNrv
 99Yk56N9Qhe5MmOesfPSWAkTMKYkWLtFv+r8OTJB5+K+IjcwVOfwPGwKCxROcg2zQ5Uq
 AkcfcYxZXneTEob4CSTyVtvMFeCrzMToeHAJS8YW0egHqXGVtrc1Of6Kp0YduvF8dvVq
 ptITEcGzkwwBi9W5CfvpwtsdZHd8UGNyEJkic2trca/tMOuJh+Vzp7tRGOd3z3vpSZOM
 nfQm0jbWjJh7ANlyS0Rg/plqNG71h5JVoWVzT9ZnP7KKsv7gghs5tnC+A8DuVqgGErpg
 dnNQ==
X-Gm-Message-State: AOJu0YySKTG/W+N3tbtXJ6JID7+0b1SdfUzMcSdwC0g7Tsct6lK6DiZj
 2mCtoeI9KSjjlXrrjhKExtI=
X-Google-Smtp-Source: AGHT+IGWIL8MNB2aNny7VvLXmLZnLXuGexINxd6mcLllIv9ZwN5xF64TeTVfNog1WEGt/rSPD7LLjA==
X-Received: by 2002:a17:902:b58c:b0:1b9:e241:ad26 with SMTP id
 a12-20020a170902b58c00b001b9e241ad26mr2096808pls.9.1695833730513; 
 Wed, 27 Sep 2023 09:55:30 -0700 (PDT)
Received: from 377044c6c369.cse.ust.hk (191host097.mobilenet.cse.ust.hk.
 [143.89.191.97]) by smtp.gmail.com with ESMTPSA id
 e10-20020a170902744a00b001c61e628e98sm6267704plt.175.2023.09.27.09.55.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Sep 2023 09:55:29 -0700 (PDT)
From: Chengfeng Ye <dg573847474@gmail.com>
To: kherbst@redhat.com, lyude@redhat.com, airlied@gmail.com, daniel@ffwll.ch,
 bskeggs@redhat.com
Subject: [PATCH] drm/nouveau/flcn/msgq: fix potential deadlock on &msgq->lock
Date: Wed, 27 Sep 2023 16:55:17 +0000
Message-Id: <20230927165517.45066-1-dg573847474@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Wed, 27 Sep 2023 20:45:53 +0000
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
Cc: Chengfeng Ye <dg573847474@gmail.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As &msgq->lock is acquired under both irq context from
gp102_sec2_intr() and softirq context from gm20b_pmu_recv(),
thus irq should be disabled while acquiring that lock, otherwise
there would be potential deadlock.

gm20b_pmu_recv()
--> nvkm_falcon_msgq_recv()
--> nvkm_falcon_msgq_open()
--> spin_lock(&msgq->lock)
<interrupt>
   --> gp102_sec2_intr()
   --> nvkm_falcon_msgq_recv()
   --> nvkm_falcon_msgq_open()
   --> spin_lock(&msgq->lock)

This flaw was found by an experimental static analysis tool I am
developing for irq-related deadlock.

To prevent the potential problem, I change to spin_lock_irq() and
spin_unlock_irq() on the lock.

Signed-off-by: Chengfeng Ye <dg573847474@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/falcon/msgq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/falcon/msgq.c b/drivers/gpu/drm/nouveau/nvkm/falcon/msgq.c
index 16b246fda666..5c3b43216ee8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/falcon/msgq.c
+++ b/drivers/gpu/drm/nouveau/nvkm/falcon/msgq.c
@@ -25,7 +25,7 @@
 static void
 nvkm_falcon_msgq_open(struct nvkm_falcon_msgq *msgq)
 {
-	spin_lock(&msgq->lock);
+	spin_lock_irq(&msgq->lock);
 	msgq->position = nvkm_falcon_rd32(msgq->qmgr->falcon, msgq->tail_reg);
 }
 
@@ -37,7 +37,7 @@ nvkm_falcon_msgq_close(struct nvkm_falcon_msgq *msgq, bool commit)
 	if (commit)
 		nvkm_falcon_wr32(falcon, msgq->tail_reg, msgq->position);
 
-	spin_unlock(&msgq->lock);
+	spin_unlock_irq(&msgq->lock);
 }
 
 bool
-- 
2.17.1

