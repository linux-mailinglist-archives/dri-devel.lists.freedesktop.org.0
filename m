Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 660EF90ACB2
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 13:14:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E08F810E351;
	Mon, 17 Jun 2024 11:14:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="A1lFzybB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D28C410E351;
 Mon, 17 Jun 2024 11:14:14 +0000 (UTC)
Delivered-To: uwu@icenowy.me
ARC-Seal: i=1; a=rsa-sha256; t=1718621947; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=DKO0aj3EPYUTcOPxFrsAL9cMTc5yUNWwZee8gyN4ILvsCWnjg3xEtqYefnRS7FQHvtUKOuB68UC0BkZWvGB/UAEKXRQFqAOemoY1HQZ0s1AuI4glKqVKpZbjd9+GRBukkCwS7IZwn4xm5/5MGUAVNcLG+QpmXZf9aYC0V8i2ZmI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1718621947;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Qk5Pm/6kG6W39CDEfIuvU92qq7NTedFoL4HtX5NeHPc=; 
 b=UodZPC8bNTyHyo0+3Ia0oVPQ2Sx39bh59SS46ra7ej7/pimIasVASkf/6EeL3FeHRdE4DLWI9lxaJkyspKGF0xl5cc7N3eza8v0pfC0gTrr0/ixP7R9oiFmJ0IeM9xAn4T589kkalj9rcink0ti3QC/25fFfDCE1Ljzle05uujc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1718621947; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=Qk5Pm/6kG6W39CDEfIuvU92qq7NTedFoL4HtX5NeHPc=;
 b=A1lFzybBX7ueDnYbXAjbrSum520AJGOjKAPUeJsvS3zOP4/r+Ym3gdvwOhbhQx77
 xEyrunklvl1xN7xSsRn6H8DbR3jiujnAZOsK62yXajF8LFENldYx7StfdmGNfYB9xr0
 mvYBGtTC6bfCT4uHFduKVxiFXgEJsLFDT2BERPN/234iEze9HFp1xEXEZaCa3QFCcMJ
 O6aNcO7TMbK4S0t3GTN8AsRfDDj63wav3TGvadsJ4RuMNF+WD4TeCATUv1AB1UkgihC
 /YYQQFxEve5g66VaQomxsjJaV2CBM5tBJkOrMg8+cZiHo8BSKEZJw7YeJ8TGSTbOp0W
 7RuMT1xevQ==
Received: by mx.zohomail.com with SMTPS id 1718621945962884.5678500265545;
 Mon, 17 Jun 2024 03:59:05 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Pan Xinhui <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH 1/2] drm/amdgpu: make duplicated EOP packet for GFX7/8 have
 real content
Date: Mon, 17 Jun 2024 18:58:45 +0800
Message-ID: <20240617105846.1516006-2-uwu@icenowy.me>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240617105846.1516006-1-uwu@icenowy.me>
References: <20240617105846.1516006-1-uwu@icenowy.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

The duplication of EOP packets for GFX7/8, with the former one have
seq-1 written and the latter one have seq written, seems to confuse some
hardware platform (e.g. Loongson 7A series PCIe controllers).

Make the content of the duplicated EOP packet the same with the real
one, only masking any possible interrupts.

Fixes: bf26da927a1c ("drm/amdgpu: add cache flush workaround to gfx8 emit_fence")
Fixes: a2e73f56fa62 ("drm/amdgpu: Add support for CIK parts")
Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c | 12 +++++-------
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c | 12 ++++--------
 2 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
index 541dbd70d8c75..778f27f1a34fe 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
@@ -2117,9 +2117,8 @@ static void gfx_v7_0_ring_emit_fence_gfx(struct amdgpu_ring *ring, u64 addr,
 {
 	bool write64bit = flags & AMDGPU_FENCE_FLAG_64BIT;
 	bool int_sel = flags & AMDGPU_FENCE_FLAG_INT;
-	/* Workaround for cache flush problems. First send a dummy EOP
-	 * event down the pipe with seq one below.
-	 */
+
+	/* Workaround for cache flush problems, send EOP twice. */
 	amdgpu_ring_write(ring, PACKET3(PACKET3_EVENT_WRITE_EOP, 4));
 	amdgpu_ring_write(ring, (EOP_TCL1_ACTION_EN |
 				 EOP_TC_ACTION_EN |
@@ -2127,11 +2126,10 @@ static void gfx_v7_0_ring_emit_fence_gfx(struct amdgpu_ring *ring, u64 addr,
 				 EVENT_INDEX(5)));
 	amdgpu_ring_write(ring, addr & 0xfffffffc);
 	amdgpu_ring_write(ring, (upper_32_bits(addr) & 0xffff) |
-				DATA_SEL(1) | INT_SEL(0));
-	amdgpu_ring_write(ring, lower_32_bits(seq - 1));
-	amdgpu_ring_write(ring, upper_32_bits(seq - 1));
+				DATA_SEL(write64bit ? 2 : 1) | INT_SEL(0));
+	amdgpu_ring_write(ring, lower_32_bits(seq));
+	amdgpu_ring_write(ring, upper_32_bits(seq));
 
-	/* Then send the real EOP event down the pipe. */
 	amdgpu_ring_write(ring, PACKET3(PACKET3_EVENT_WRITE_EOP, 4));
 	amdgpu_ring_write(ring, (EOP_TCL1_ACTION_EN |
 				 EOP_TC_ACTION_EN |
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
index 2f0e72caee1af..39a7d60f1fd69 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
@@ -6153,9 +6153,7 @@ static void gfx_v8_0_ring_emit_fence_gfx(struct amdgpu_ring *ring, u64 addr,
 	bool write64bit = flags & AMDGPU_FENCE_FLAG_64BIT;
 	bool int_sel = flags & AMDGPU_FENCE_FLAG_INT;
 
-	/* Workaround for cache flush problems. First send a dummy EOP
-	 * event down the pipe with seq one below.
-	 */
+	/* Workaround for cache flush problems, send EOP twice. */
 	amdgpu_ring_write(ring, PACKET3(PACKET3_EVENT_WRITE_EOP, 4));
 	amdgpu_ring_write(ring, (EOP_TCL1_ACTION_EN |
 				 EOP_TC_ACTION_EN |
@@ -6164,12 +6162,10 @@ static void gfx_v8_0_ring_emit_fence_gfx(struct amdgpu_ring *ring, u64 addr,
 				 EVENT_INDEX(5)));
 	amdgpu_ring_write(ring, addr & 0xfffffffc);
 	amdgpu_ring_write(ring, (upper_32_bits(addr) & 0xffff) |
-				DATA_SEL(1) | INT_SEL(0));
-	amdgpu_ring_write(ring, lower_32_bits(seq - 1));
-	amdgpu_ring_write(ring, upper_32_bits(seq - 1));
+			  DATA_SEL(write64bit ? 2 : 1) | INT_SEL(0));
+	amdgpu_ring_write(ring, lower_32_bits(seq));
+	amdgpu_ring_write(ring, upper_32_bits(seq));
 
-	/* Then send the real EOP event down the pipe:
-	 * EVENT_WRITE_EOP - flush caches, send int */
 	amdgpu_ring_write(ring, PACKET3(PACKET3_EVENT_WRITE_EOP, 4));
 	amdgpu_ring_write(ring, (EOP_TCL1_ACTION_EN |
 				 EOP_TC_ACTION_EN |
-- 
2.45.1

