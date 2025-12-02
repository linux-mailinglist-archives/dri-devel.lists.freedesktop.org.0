Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80072C9B9DF
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 14:36:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94F5610E0DC;
	Tue,  2 Dec 2025 13:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="lxfwiB6B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C31BA10E0DC
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 13:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764682567;
 bh=YGIGnKx1hgKd42QuYDgVUTGcX/7MofXaMyGzNyPz0nk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lxfwiB6BWedjhL7mPDjLoMHzIe6xsQ6uo/DuTfDLoi4KyfcCcVI2/uK0z+9r/OGiR
 1XOZQ6/mkUVzgliFKhZeu7/iArodB0YCcuiopk0GDskEDlerJjb5ZxXhJSsh1vibuY
 +YnbKzYNvhDupPDhu+nnjfUy5vGoJES0IoIeExMfIHZKXfyRmN/gJYqa+4xipvlFOs
 Jhle+ZeWo5Zue3b4xcbRHmCmj4JHDUdAGgIJoCL2mzx33OU7Qgsp6I4Fkm7r/KUkvA
 gVz/9+4GXOoHSEeM+zt+xEg7CD3lkIXoDyg9TOFVKmveKrbGvE1EwL7tgSl4JVldtC
 7hG2LLjvOwmRQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 18A8817E13C4;
 Tue,  2 Dec 2025 14:36:07 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Akash Goel <akash.goel@arm.com>,
 kernel@collabora.com
Subject: [PATCH v1 3/3] drm/panthor: Unlock the locked region before disabling
 an AS
Date: Tue,  2 Dec 2025 14:35:38 +0100
Message-ID: <20251202133538.83078-4-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251202133538.83078-1-boris.brezillon@collabora.com>
References: <20251202133538.83078-1-boris.brezillon@collabora.com>
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

An AS can be disabled in the middle of a VM operation (VM being
evicted from an AS slot, for instance). In that case, we need the
locked section to be unlocked before releasing the slot.

Fixes: 6e2d3b3e8589 ("drm/panthor: Add support for atomic page table updates")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 3644af1a8e56..4ed28bd1b8ec 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -588,6 +588,7 @@ static int panthor_mmu_as_enable(struct panthor_device *ptdev, u32 as_nr,
 static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr,
 				  bool recycle_slot)
 {
+	struct panthor_vm *vm = ptdev->mmu->as.slots[as_nr].vm;
 	int ret;
 
 	/* Flush+invalidate RW caches, invalidate RO ones. */
@@ -596,6 +597,16 @@ static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr,
 	if (ret)
 		return ret;
 
+	if (vm && vm->locked_region.size) {
+		/* Unlock the region if there a lock pending. */
+		ret = as_send_cmd_and_wait(ptdev, vm->as.id, AS_COMMAND_UNLOCK);
+		if (ret)
+			return ret;
+
+		vm->locked_region.start = 0;
+		vm->locked_region.size = 0;
+	}
+
 	/* If the slot is going to be used immediately, don't bother changing
 	 * the config.
 	 */
-- 
2.51.1

