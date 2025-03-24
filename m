Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54941A6E4FE
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 22:06:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F74310E361;
	Mon, 24 Mar 2025 21:06:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lKBBz/i4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCD2310E321;
 Mon, 24 Mar 2025 21:06:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 81AA54408A;
 Mon, 24 Mar 2025 21:06:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0CBDC4CEDD;
 Mon, 24 Mar 2025 21:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742850377;
 bh=9/opTEs0d9NV3O3X17FC8CqUB8UV/tH+pUR280IUGH0=;
 h=From:To:Cc:Subject:Date:From;
 b=lKBBz/i4kh7dB0kWHp4zEStEsSfOcmbgMzE7FhrZCs+Ce8xjFZoD6SImnf+GlLpdD
 SlglhpBatW04bmZsp4aUB7SYT3N73TaGw6+dJa0a/bJ+FmR15QoA9/MJWhc5q/Shie
 0cvba7VqzD9TZWqYaNSNHfgJJbRoWxFZAsTB0zM4UAiumnP0MdhCeoglKgNjzXVWgL
 E2huBq31DVRTuVxhm2fN+jdZxOggSWGWROwL0eQGgkoN49jpRgZmhBVWhXuLcrCKsk
 7tSqeCdIpf1Smix/BjyN3yRKhsZpmSJv41Nh64ZDdn/IJTmBD6+6zzkrJ3Gl6FB9Nh
 mcpABU+VZKNRw==
From: Arnd Bergmann <arnd@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Oak Zeng <oak.zeng@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Matthew Auld <matthew.auld@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/xe: avoid plain 64-bit division
Date: Mon, 24 Mar 2025 22:06:02 +0100
Message-Id: <20250324210612.2927194-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
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

From: Arnd Bergmann <arnd@arndb.de>

Building the xe driver for i386 results in a link time warning:

x86_64-linux-ld: drivers/gpu/drm/xe/xe_migrate.o: in function `xe_migrate_vram':
xe_migrate.c:(.text+0x1e15): undefined reference to `__udivdi3'

Avoid this by using DIV_U64_ROUND_UP() instead of DIV_ROUND_UP().  The driver
is unlikely to be used on 32=bit hardware, so the extra cost here is not
too important.

Fixes: 9c44fd5f6e8a ("drm/xe: Add migrate layer functions for SVM support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/xe/xe_migrate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index df4282c71bf0..aafb6209f2d0 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1547,7 +1547,7 @@ void xe_migrate_wait(struct xe_migrate *m)
 static u32 pte_update_cmd_size(u64 size)
 {
 	u32 num_dword;
-	u64 entries = DIV_ROUND_UP(size, XE_PAGE_SIZE);
+	u64 entries = DIV_U64_ROUND_UP(size, XE_PAGE_SIZE);
 
 	XE_WARN_ON(size > MAX_PREEMPTDISABLE_TRANSFER);
 	/*
@@ -1558,7 +1558,7 @@ static u32 pte_update_cmd_size(u64 size)
 	 * 2 dword for the page table's physical location
 	 * 2*n dword for value of pte to fill (each pte entry is 2 dwords)
 	 */
-	num_dword = (1 + 2) * DIV_ROUND_UP(entries, 0x1ff);
+	num_dword = (1 + 2) * DIV_U64_ROUND_UP(entries, 0x1ff);
 	num_dword += entries * 2;
 
 	return num_dword;
-- 
2.39.5

