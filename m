Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBCFC254DA
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 14:44:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81D6110EB50;
	Fri, 31 Oct 2025 13:44:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AYpT51EO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A893010EB53
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 13:44:52 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-475d9de970eso15780155e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 06:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761918291; x=1762523091; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lz7nSJb0Sp+sy2fFkGoNzLTsSE9Ff1nmykLyZLMIIpA=;
 b=AYpT51EODp/8RH1VKjiNlhV1fB0XPJbHEbH4VkB7ca6usg7WsZia8HD6eGUNCWG2y8
 KV8tM+IjdJJr2FFr10hNrkNh3Nl94hiIXyPswFlSLE7YnI/1/B080eoxmSK5jEI6zTpf
 JJTNYLVko6pcsvSCiXTluqlr3aR459DFBnALU0i9CyJuNG81OLipNaT5a+hmJTpAvptD
 rvLS5V0AaUeneIVwq3iIWRYwq8ihYpfbzViF5um+ShU4P9ErWOrcQtCBbuPXbLBhhf9X
 srBs+hCcWcstt9eMxFTusBwspka2+e+SPapY2pnfxfRonWDDER4gWfIKRQbLDAQNWeC/
 uFcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761918291; x=1762523091;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lz7nSJb0Sp+sy2fFkGoNzLTsSE9Ff1nmykLyZLMIIpA=;
 b=VMRp0fIRJ4hvkDff9EwPW0SSoWZBiz4HXJUhpn9RmP32v1kkUkIozJ9sPULmUJh7Ih
 YP/ABCyB5p62fOzbOPD391koem64eDw0em4SWmM4ncAHLurKJSTpXoj2hyO4SOI3wcTR
 zSP4QgGKDV5dIOQ6O3UBHVJ4FI49HKWJ8/QWuIgHyK2fJQQOgHdfhV1x2e6MXLQ29Ohf
 kxLDaqeJqR02JI4L11GSFdXmquYfQqal0r/wT5mVbNy4Y5/GX/Mv8915Sk4+u1EweA9m
 ZMNVcT3GsuDk1TkS8ZhaCtIDHfm4tEmmRDweJSt5p1ufVdoR9fMQUchm3NKTyvSyv8kn
 uxaA==
X-Gm-Message-State: AOJu0Yz7NqMV0y1MMFN5SF8Phd4scNLKrrc/XmINIV268ILq6vni8Bbz
 9sDucR28/8Bsdoln0gv4tBFk+wamTPTUW9tjwwvA0f83pm9kked5E9VP
X-Gm-Gg: ASbGncuF5Pa34eDrZuYpro2SfWVt9SJc5BPEYfpdDmE7pPnlHalhdCtH4EqYKjdmizg
 EcE/3yCJ7NEn5/TYVJhDf6eEfyDqEp5Kr5rUu/7CS4pNpGEhMYZ9SKZ7R2kdCYvNNjyzzwQVLGJ
 zcSyyojweiuPFPCmV3FePqh0P2I6Z7qVGb2E2mve21nlO4R+a7YQxX0EB5OhdRmaSsCvkPVLuy1
 DNwLJisUl2bwcdhmB6MEH1712O4r+Eo1ILLFnTNVBwD0yAfttu6XP4fE+bf4KQ6RYJfSXgepYAC
 lJCh255WJ45CsKJOG8MGxM7bey/5YRuLtHhyNMpGcdNRnBfKtdNomA9yK+tGzoJ09YOxN2Tiw8X
 ZEpZtPmNtMMNYr4SxzblZ1fkmfF+azuO+O/VBO5LhDWMlYY0lL114ZJUnBqK3Djs54sAUR7AJCU
 pGghaTiZrjNCNFcPfIlYD7XbvX
X-Google-Smtp-Source: AGHT+IFX6Ta9CYbUtJzM5PiYi/UpTYqzIRRkMQiJ4fP17ykxBqc5ghDpURSmf9BUutDj5IVWkT0/Jw==
X-Received: by 2002:a05:600c:8185:b0:475:da13:2566 with SMTP id
 5b1f17b1804b1-477308a690dmr36307795e9.35.1761918291097; 
 Fri, 31 Oct 2025 06:44:51 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1599:7d00:73cb:d446:bf90:f1c0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47732fe119bsm34502635e9.10.2025.10.31.06.44.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 06:44:50 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net, airlied@gmail.com, felix.kuehling@amd.com,
 matthew.brost@intel.com
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 02/20] dma-buf: rework stub fence initialisation v2
Date: Fri, 31 Oct 2025 14:16:36 +0100
Message-ID: <20251031134442.113648-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251031134442.113648-1-christian.koenig@amd.com>
References: <20251031134442.113648-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of doing this on the first call of the function just initialize
the stub fence during kernel load.

This has the clear advantage of lower overhead and also doesn't rely on
the ops to not be NULL any more.

v2: use correct signal function

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence.c | 32 +++++++++++++++-----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index cfa6ddcc1278..b229d96f551c 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -121,29 +121,27 @@ static const struct dma_fence_ops dma_fence_stub_ops = {
 	.get_timeline_name = dma_fence_stub_get_name,
 };
 
+static int __init dma_fence_init_stub(void)
+{
+	dma_fence_init(&dma_fence_stub, &dma_fence_stub_ops,
+		       &dma_fence_stub_lock, 0, 0);
+
+	set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
+		&dma_fence_stub.flags);
+
+	dma_fence_signal(&dma_fence_stub);
+	return 0;
+}
+subsys_initcall(dma_fence_init_stub);
+
 /**
  * dma_fence_get_stub - return a signaled fence
  *
- * Return a stub fence which is already signaled. The fence's
- * timestamp corresponds to the first time after boot this
- * function is called.
+ * Return a stub fence which is already signaled. The fence's timestamp
+ * corresponds to the initialisation time of the linux kernel.
  */
 struct dma_fence *dma_fence_get_stub(void)
 {
-	spin_lock(&dma_fence_stub_lock);
-	if (!dma_fence_stub.ops) {
-		dma_fence_init(&dma_fence_stub,
-			       &dma_fence_stub_ops,
-			       &dma_fence_stub_lock,
-			       0, 0);
-
-		set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
-			&dma_fence_stub.flags);
-
-		dma_fence_signal_locked(&dma_fence_stub);
-	}
-	spin_unlock(&dma_fence_stub_lock);
-
 	return dma_fence_get(&dma_fence_stub);
 }
 EXPORT_SYMBOL(dma_fence_get_stub);
-- 
2.43.0

