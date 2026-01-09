Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D829DD0BA54
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 18:30:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D66510E78E;
	Fri,  9 Jan 2026 17:30:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mary.zone header.i=@mary.zone header.b="GvooJNu3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2A4510E78E
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 17:30:22 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-b73161849e1so878082866b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 09:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mary.zone; s=google; t=1767979821; x=1768584621; darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=c4pndAZp3XUCZdYMEMFqYX+gyvVUXnO23TwwbWPj1IU=;
 b=GvooJNu3WFE2ZzCvkyuF7sgoDJ2E6C4LHE0b7puIvMgp95+YIxBZ5JFVb1MBxEAHg5
 a4vb1N9V5caP1+dfpD7PsgmDvOyS+hGS63/hedCrUx1o15+pC3aQsafXp/PRuJqDC4/W
 sLnyKHFPBUdVgXTgH6DkKTohSRm4whdG4ehrponP3JKJVLhS07ZnsK/9sB6aRqo6cYjZ
 oXjtaDcD3UDm1ntYsfMtJQbHsEgCAXfuBCm3SIDrmEpFx5VgTbKwQgW4DuEltb6qdvGn
 tjbkug/IWyI7o29DusBK9t7aFWDhKojLTgLhfd5IT5OH4FXvkBeb5+3RNVmgtNmfg7p3
 fLjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767979821; x=1768584621;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=c4pndAZp3XUCZdYMEMFqYX+gyvVUXnO23TwwbWPj1IU=;
 b=YsbJw+VxWkrg7W8HGm+RuI9HO7Ckbo9O7tt80A/0uljoMuizVI6EpgyYS5CDCXiusy
 ePD1wFSib/79zF3Rr4VEYjsJ4OvMWMytRQvokPda2+7VLXWv21qm7/Q+C+PCKY5ImqI2
 0LmyCMQI6spQVHL+1liiGsmk774xrO/r/+lqxsx+lraM7uAqHgFZOw6UG5hAXbUv6rY1
 vTLTB7viwJC9EeYw0dgt8y0D62rjgCOvkGlqsbiuN8KFBmwHbPK19U5CMoRDKVpVmLXA
 bDbdl3BonTraLYIDvlDaNofeRj6GimGkQbV0KnR9Mq+WhhqMFwaAEZXSgODf6s0aA2PI
 ljeA==
X-Gm-Message-State: AOJu0YxG7xWtH/BWFYoRsHfT1gdYo0NOjxQdN2XzJ3I7zOW8E//e+yds
 c3n919eiGmvpQoRDZKggrlweuv5iKNu+M9P2fxkc253dCF8QFq7F11msMEv50TBiZzs=
X-Gm-Gg: AY/fxX5bc6MVnVy2m5QkP6tvPHxExN0yeBqONOUqEJN96IoaCnfvZsqvD242xuYCzJk
 p1ul7xN1jvjDYFxu7Q9YDp3dWuKiDlMPpaR4fAsKzQFlyEs4/zUq8Z6CXrxVPH5+OwsjD14ZFlz
 gcMOvc4D/fTBR4b05OA+25AJxBiVPB6Lq/UWHqs6otWAG4Z1ZiQpt486xF+CTViZFpxFOTdE9z6
 tIb6zsU6vXxBIz9xoGnURRU+BlObkKnwsUOO4J5BSYs5/U/sa/Qma4bF9xGBmhy84eWdXmBCjtf
 du8S8M/cBrM9nJJMCeNAww7aZBC2DrxuEJoZ0+qmoRvqF2uqcVanQeRlKMy9z0v+9cKuLVcxsAA
 TgKBhjhyQUlieCR5v+3WUqYb0c2S8Nw6sStHZpH5PTaz1IVVrg//aWQ45ap3HvTc6EcfWx0gD2c
 Wbm+4M5KQ41rK0kaFD6zib36TuLnl1e1UJRTDwhIIa6hry6USZbOSMEoKSruB4B+lQS2FvFjU=
X-Google-Smtp-Source: AGHT+IHlRIJqTv050/JxoEGVWa701IUHS6s1jR7sh7piM48WsLHe74BonLRvxKWmwsHoeIZUx3Ag/A==
X-Received: by 2002:a17:907:7b91:b0:b7c:f5b6:bb52 with SMTP id
 a640c23a62f3a-b84453a0305mr1020235866b.43.1767979821138; 
 Fri, 09 Jan 2026 09:30:21 -0800 (PST)
Received: from [192.168.1.42]
 (2a01cb0405e83a000cb38cfe29807c1e.ipv6.abo.wanadoo.fr.
 [2a01:cb04:5e8:3a00:cb3:8cfe:2980:7c1e])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a230db0sm1195426266b.2.2026.01.09.09.30.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jan 2026 09:30:20 -0800 (PST)
From: Mary Guillemard <mary@mary.zone>
Date: Fri, 09 Jan 2026 18:30:11 +0100
Subject: [PATCH 2/3] drm/nouveau: Unify GPFIFO ring buffer max count query
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-nouveau-gpfifo-increase-v1-2-ed0be9822878@mary.zone>
References: <20260109-nouveau-gpfifo-increase-v1-0-ed0be9822878@mary.zone>
In-Reply-To: <20260109-nouveau-gpfifo-increase-v1-0-ed0be9822878@mary.zone>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Mary Guillemard <mary@mary.zone>
X-Mailer: b4 0.14.3
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

Previously, the max count for the GPFIFO ring buffer was hardcoded in two
different places.

This patch adds a new function nouveau_channel_get_gpfifo_entries_count
to share the logic between the two side of the codebase allowing us to
later on increase the limit.

Signed-off-by: Mary Guillemard <mary@mary.zone>
---
 drivers/gpu/drm/nouveau/nouveau_abi16.c | 15 +++++++++++++--
 drivers/gpu/drm/nouveau/nouveau_chan.c  |  3 ++-
 drivers/gpu/drm/nouveau/nouveau_chan.h  | 12 ++++++++++++
 drivers/gpu/drm/nouveau/nouveau_dma.h   |  3 ---
 4 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index a3ba07fc48a0..a5445e97179f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -232,15 +232,26 @@ nouveau_abi16_fini(struct nouveau_abi16 *abi16)
 static inline int
 getparam_dma_ib_max(struct nvif_device *device)
 {
-	const struct nvif_mclass dmas[] = {
+	const struct nvif_mclass hosts[] = {
 		{ NV03_CHANNEL_DMA, 0 },
 		{ NV10_CHANNEL_DMA, 0 },
 		{ NV17_CHANNEL_DMA, 0 },
 		{ NV40_CHANNEL_DMA, 0 },
 		{}
 	};
+	int cid;
+	u32 res;
 
-	return nvif_mclass(&device->object, dmas) < 0 ? NV50_DMA_IB_MAX : 0;
+	cid = nvif_mclass(&device->object, hosts);
+	if (cid < 0)
+		res = NV50_CHANNEL_GPFIFO_ENTRIES_MAX_COUNT;
+	else
+		res = nouveau_channel_get_gpfifo_entries_count(hosts[cid].oclass);
+
+	if (res == 0)
+		return 0;
+
+	return res - 1;
 }
 
 int
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index b646212a34b3..8695b5d6aefc 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -274,7 +274,7 @@ nouveau_channel_ctor(struct nouveau_cli *cli, bool priv, u64 runm,
 	struct nouveau_channel *chan;
 	const u64 plength = 0x10000;
 	const u64 ioffset = plength;
-	const u64 ilength = 0x02000;
+	u64 ilength;
 	int cid, ret;
 	u64 size;
 
@@ -282,6 +282,7 @@ nouveau_channel_ctor(struct nouveau_cli *cli, bool priv, u64 runm,
 	if (cid < 0)
 		return cid;
 
+	ilength = nouveau_channel_get_gpfifo_entries_count(hosts[cid].oclass) * 8;
 	if (hosts[cid].oclass < NV50_CHANNEL_GPFIFO)
 		size = plength;
 	else
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.h b/drivers/gpu/drm/nouveau/nouveau_chan.h
index 9839de8da985..294d061497c0 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.h
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.h
@@ -4,6 +4,7 @@
 #include <nvif/object.h>
 #include <nvif/event.h>
 #include <nvif/chan.h>
+#include <nvif/class.h>
 struct nvif_device;
 
 struct nouveau_channel {
@@ -65,6 +66,17 @@ void nouveau_channel_del(struct nouveau_channel **);
 int  nouveau_channel_idle(struct nouveau_channel *);
 void nouveau_channel_kill(struct nouveau_channel *);
 
+/* Maximum GPFIFO entries per channel. */
+#define NV50_CHANNEL_GPFIFO_ENTRIES_MAX_COUNT (0x02000 / 8)
+
+static inline u32 nouveau_channel_get_gpfifo_entries_count(u32 oclass)
+{
+	if (oclass < NV50_CHANNEL_GPFIFO)
+		return 0;
+
+	return NV50_CHANNEL_GPFIFO_ENTRIES_MAX_COUNT;
+}
+
 extern int nouveau_vram_pushbuf;
 
 #endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_dma.h b/drivers/gpu/drm/nouveau/nouveau_dma.h
index c25ef9a54b9f..7f8445014e4d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dma.h
+++ b/drivers/gpu/drm/nouveau/nouveau_dma.h
@@ -47,9 +47,6 @@ int nouveau_dma_wait(struct nouveau_channel *, int size);
 /* Maximum push buffer size. */
 #define NV50_DMA_PUSH_MAX_LENGTH 0x7fffff
 
-/* Maximum IBs per ring. */
-#define NV50_DMA_IB_MAX ((0x02000 / 8) - 1)
-
 /* Object handles - for stuff that's doesn't use handle == oclass. */
 enum {
 	NvDmaFB		= 0x80000002,

-- 
2.52.0

