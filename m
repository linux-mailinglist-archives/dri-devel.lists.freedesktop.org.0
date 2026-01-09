Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E13D0BA50
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 18:30:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B17E10E799;
	Fri,  9 Jan 2026 17:30:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mary.zone header.i=@mary.zone header.b="Q5Iv7Qfr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9C3810E799
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 17:30:21 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-b8427c74ef3so683606766b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 09:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mary.zone; s=google; t=1767979820; x=1768584620; darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=elZC+OpWvMiao47yhMKfmzrUQTBNeJ6lH9L5GUb402I=;
 b=Q5Iv7QfrVKjJWL2O+x4bziBeuxaARi/uT64uQdn5NAq8QKvmYGHj+HK/fK0Bw6gL54
 CDLJX/fUFAdPbQqIy3YvZwOLnk+l72XXhCgKtJHkDAC2Q9b+1Bhr6wnXfhUkuRm0t8dB
 sh39w/YRD7edFSFonI1Xkjps+ShihtqLiHGXE96khjHL+MqTqebZjebUpoFT9vehOQwu
 izLc9zMQMz6mj0l2u345IO6GrhJKvJaIjlCwlGHvE1dTm48xDDnFL+IoN/vQBxa8iKhC
 iQsZhlc2pOlEEibvjaQyEpV7U7p6qn99S3H9JaN42hxv46RGriFWR1EVSrp6zNJZzxDN
 kFKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767979820; x=1768584620;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=elZC+OpWvMiao47yhMKfmzrUQTBNeJ6lH9L5GUb402I=;
 b=LFon/cr5obezAckNylnl08KCIVysc3cMnpflhlo32D1Z2ccpfzu66lv/862Y6LUuE3
 rCJngxboQdfJiCjermFcO18o22Jpl2ZT1iyIyGQ1KTrrc+xV8K8mm7TpS1NCYNZl1W7O
 9cDlMxToNJXX420W9DcSaHRkyEh43EXm979c94+PQImLYyWAJ7pG/XaCyyyoktiWrc97
 7+ge+PgG8XBe8oqs4GlaAnbmMBfUaK0IO+2mqvjWxX/aTLCcObaTz+HgO4zZKLh7dF5E
 W578AKBNexuJKApCvG5stPO7bWp8G/HCUo1uoEgtNWPehSEXtbczAwmPtdO7S4ZZoUn2
 QTuA==
X-Gm-Message-State: AOJu0YxdxeaC+h5hiG+NwF9SA2Z1D0HHEH2QxHEfOcn7/IQiCgMmDihp
 HwOO36BVENb9l2PNC9D7ppQfcrCDd1THvEyTa3KZz+p67X7uCKDwZA073YMCL3WnF7UWHzyYysV
 d8li+
X-Gm-Gg: AY/fxX7HMUS7oxYR2SguUmCLV30zup20hBjmP0pjikupOAAnMs7k5wBnzU7XNN9/GKf
 gUrDSYhtun3f+mqP78A5MYxD5hdmtMvvhBFdTKCWfKQt6bl+ZMwxYweuZ1lMV9WBLHEu5FIcn72
 M0HWacINlcQKK4UbvCSKemNSjtbda1ZqKrgmkTUEaIjEwOJ8Xl2F2fzyVVpTeOrx7VuVDvnCq7R
 nMqPGOn7jKWDIa9s+3OqYwQkjWoeVgLQUrAVmC1nkZ44g//s3vsdPd07DEHABu0wW+9RvR/nhr2
 TYiCuRKYcE13gvLDKPT2w7xCkwycJ6oCTUJTs1V6NJvCwRO8cmrK9pEB/vXY+qacP3EePSEwSq1
 l5ZzOOCRoEc+BS9fv6fRdVUviOv7aR5Iil+wrt3mNjRM8zKu9KmIuxk+XFTTrS4pwBIuIJOGrRA
 HQiw7hkv9/xz8qwOLPxcaWKsGyfoVjgar2e4cMULmJXkeiDBVScOzJpRWAPQdlBHa/lgnXzbA=
X-Google-Smtp-Source: AGHT+IEYiFQaO2dhDZqmH9t7iNpy+GLxla8nCF9CHBGFTiZHm/wAyRIa7gXAFdArBNItEHmS/LcEwQ==
X-Received: by 2002:a17:907:1c82:b0:b83:972c:77fe with SMTP id
 a640c23a62f3a-b84450332aamr1052665066b.2.1767979820236; 
 Fri, 09 Jan 2026 09:30:20 -0800 (PST)
Received: from [192.168.1.42]
 (2a01cb0405e83a000cb38cfe29807c1e.ipv6.abo.wanadoo.fr.
 [2a01:cb04:5e8:3a00:cb3:8cfe:2980:7c1e])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a230db0sm1195426266b.2.2026.01.09.09.30.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jan 2026 09:30:19 -0800 (PST)
From: Mary Guillemard <mary@mary.zone>
Date: Fri, 09 Jan 2026 18:30:10 +0100
Subject: [PATCH 1/3] drm/nouveau/chan: Store channel allocation details in
 nouveau_channel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-nouveau-gpfifo-increase-v1-1-ed0be9822878@mary.zone>
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

Previously, nouveau_channel_init was hardcoding offsets and length
for the internal pushbuf and GPFIFO entries details.

As we are going to extend the size of the GPFIFO ring, we now store
those information in nouveau_channel_ctor and use those when creating
related NVIF objects for channels.

Signed-off-by: Mary Guillemard <mary@mary.zone>
---
 drivers/gpu/drm/nouveau/nouveau_chan.c | 20 ++++++++++++--------
 drivers/gpu/drm/nouveau/nouveau_chan.h |  3 +++
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index b1e92b1f7a26..b646212a34b3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -293,6 +293,10 @@ nouveau_channel_ctor(struct nouveau_cli *cli, bool priv, u64 runm,
 	if (ret)
 		return ret;
 
+	chan->push.plength = plength;
+	chan->push.ioffset = ioffset;
+	chan->push.ilength = ilength;
+
 	/* create channel object */
 	args->version = 0;
 	args->namelen = __member_size(args->name);
@@ -311,8 +315,8 @@ nouveau_channel_ctor(struct nouveau_cli *cli, bool priv, u64 runm,
 			args->ctxdma = nvif_handle(&chan->push.ctxdma);
 		else
 			args->ctxdma = 0;
-		args->offset = ioffset + chan->push.addr;
-		args->length = ilength;
+		args->offset = chan->push.addr + chan->push.ioffset;
+		args->length = chan->push.ilength;
 	}
 	args->huserd = 0;
 	args->ouserd = 0;
@@ -437,22 +441,22 @@ nouveau_channel_init(struct nouveau_channel *chan, u32 vram, u32 gart)
 	} else
 	if (chan->user.oclass < FERMI_CHANNEL_GPFIFO) {
 		ret = nvif_chan506f_ctor(&chan->chan, chan->userd->map.ptr,
-					 (u8*)chan->push.buffer->kmap.virtual + 0x10000, 0x2000,
-					 chan->push.buffer->kmap.virtual, chan->push.addr, 0x10000);
+					 (u8 *)chan->push.buffer->kmap.virtual + chan->push.ioffset, chan->push.ilength,
+					 chan->push.buffer->kmap.virtual, chan->push.addr, chan->push.plength);
 		if (ret)
 			return ret;
 	} else
 	if (chan->user.oclass < VOLTA_CHANNEL_GPFIFO_A) {
 		ret = nvif_chan906f_ctor(&chan->chan, chan->userd->map.ptr,
-					 (u8*)chan->push.buffer->kmap.virtual + 0x10000, 0x2000,
-					 chan->push.buffer->kmap.virtual, chan->push.addr, 0x10000,
+					 (u8 *)chan->push.buffer->kmap.virtual + chan->push.ioffset, chan->push.ilength,
+					 chan->push.buffer->kmap.virtual, chan->push.addr, chan->push.plength,
 					 chan->sema.bo->kmap.virtual, chan->sema.vma->addr);
 		if (ret)
 			return ret;
 	} else {
 		ret = nvif_chanc36f_ctor(&chan->chan, chan->userd->map.ptr,
-					 (u8*)chan->push.buffer->kmap.virtual + 0x10000, 0x2000,
-					 chan->push.buffer->kmap.virtual, chan->push.addr, 0x10000,
+					 (u8 *)chan->push.buffer->kmap.virtual + chan->push.ioffset, chan->push.ilength,
+					 chan->push.buffer->kmap.virtual, chan->push.addr, chan->push.plength,
 					 chan->sema.bo->kmap.virtual, chan->sema.vma->addr,
 					 &drm->client.device.user, chan->token);
 		if (ret)
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.h b/drivers/gpu/drm/nouveau/nouveau_chan.h
index bb34b0a6082d..9839de8da985 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.h
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.h
@@ -29,6 +29,9 @@ struct nouveau_channel {
 		struct nouveau_vma *vma;
 		struct nvif_object ctxdma;
 		u64 addr;
+		u64 plength;
+		u64 ioffset;
+		u64 ilength;
 	} push;
 
 	void *fence;

-- 
2.52.0

