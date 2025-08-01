Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC70B17DCA
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 09:46:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCBF510E3C7;
	Fri,  1 Aug 2025 07:46:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aj1tCNoZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A616B10E2E5;
 Fri,  1 Aug 2025 07:46:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6256A4554B;
 Fri,  1 Aug 2025 07:46:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95863C4CEE7;
 Fri,  1 Aug 2025 07:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754034367;
 bh=J6nfFiOOqDG78zHsPEpxmyy2x4qceu5t+JJbMCFLeH0=;
 h=From:To:Cc:Subject:Date:From;
 b=aj1tCNoZGZlj+x3WnOt7ruc6OG0j1vd+xYlGRHCDQEouPbGQ3S94YR8nMy80M9FBH
 vhNIN3Ia/hnHnIa2YIWj1ER96iOVeUPQ6jsOpT59ekPjmJ3iQUkJ43Jms5eWrmllBu
 V1JPANToOA9/e+oO804DPh/I1LUrfeccHDubE8d8WiABrkUdngQ1YXO4PtjKBw4WgX
 OJ9vpeeMqMg7TnFVfk1XzTS7I297oJxIe+GiSPMUJ9G+3v97AH4sHxEu5prR9dbZni
 1I2wManj9DRlpFld5eS/9TZyTzLQdvGl2z/G20Xj8F0jueE/Xv9Ep+K7T/CHpfrorF
 c7KucmY0ThYlA==
From: Philipp Stanner <phasta@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Philipp Stanner <phasta@kernel.org>
Subject: [PATCH] drm/nouveau: Remove surplus struct member
Date: Fri,  1 Aug 2025 09:45:32 +0200
Message-ID: <20250801074531.79237-2-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

struct nouveau_channel contains the member 'accel_done' and a forgotten
TODO which hints at that mechanism being removed in the "near future".
Since that variable is read nowhere anymore, this "near future" is now.

Remove the variable and the TODO.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_chan.h | 2 --
 drivers/gpu/drm/nouveau/nouveau_dma.h  | 1 -
 2 files changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.h b/drivers/gpu/drm/nouveau/nouveau_chan.h
index 561877725aac..bb34b0a6082d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.h
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.h
@@ -31,8 +31,6 @@ struct nouveau_channel {
 		u64 addr;
 	} push;
 
-	/* TODO: this will be reworked in the near future */
-	bool accel_done;
 	void *fence;
 	struct {
 		int max;
diff --git a/drivers/gpu/drm/nouveau/nouveau_dma.h b/drivers/gpu/drm/nouveau/nouveau_dma.h
index 0e27b76d1e1c..c25ef9a54b9f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dma.h
+++ b/drivers/gpu/drm/nouveau/nouveau_dma.h
@@ -90,7 +90,6 @@ FIRE_RING(struct nouveau_channel *chan)
 {
 	if (chan->dma.cur == chan->dma.put)
 		return;
-	chan->accel_done = true;
 
 	WRITE_PUT(chan->dma.cur);
 
-- 
2.49.0

