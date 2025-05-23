Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D44AAC2C22
	for <lists+dri-devel@lfdr.de>; Sat, 24 May 2025 01:25:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0A5A10E88D;
	Fri, 23 May 2025 23:25:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nppct.ru header.i=@nppct.ru header.b="TLxqil1W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.nppct.ru (mail.nppct.ru [195.133.245.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59AAC10E7A7
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 07:50:33 +0000 (UTC)
Received: from mail.nppct.ru (localhost [127.0.0.1])
 by mail.nppct.ru (Postfix) with ESMTP id 4E4C51C118C
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 10:50:24 +0300 (MSK)
Authentication-Results: mail.nppct.ru (amavisd-new); dkim=pass (1024-bit key)
 reason="pass (just generated,
 assumed good)" header.d=nppct.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nppct.ru; h=
 content-transfer-encoding:mime-version:x-mailer:message-id:date
 :date:subject:subject:to:from:from; s=dkim; t=1747986623; x=
 1748850624; bh=rR3vPAPlUJEfRssL5GiwmgHjwvovtafRJtml2i1CacQ=; b=T
 Lxqil1W0wc6J8ZbOZNvlAt+gde3rmNzxtgsGs8bQjb33Y4axC67muacweDXiZIbd
 Tr68qhQFQsJHFcZFbhDDODtFjXagIdYmfIc2PzkNZSurjYreYykl4AyGWxzqrGKD
 IkmcQe/Ymm75u0KFRyry0Lhg/wnOQeYySOIBPpFQt4=
X-Virus-Scanned: Debian amavisd-new at mail.nppct.ru
Received: from mail.nppct.ru ([127.0.0.1])
 by mail.nppct.ru (mail.nppct.ru [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id JY4LSUk1Dj4V for <dri-devel@lists.freedesktop.org>;
 Fri, 23 May 2025 10:50:23 +0300 (MSK)
Received: from localhost.localdomain (unknown [87.249.24.51])
 by mail.nppct.ru (Postfix) with ESMTPSA id 91B471C0DAB;
 Fri, 23 May 2025 10:50:22 +0300 (MSK)
From: Alexey Nepomnyashih <sdl@nppct.ru>
To: Lyude Paul <lyude@redhat.com>
Cc: Alexey Nepomnyashih <sdl@nppct.ru>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
 stable@vger.kernel.org
Subject: [PATCH] drm/nouveau/mmu: fix potential overflow in PFN size
 calculation
Date: Fri, 23 May 2025 07:50:14 +0000
Message-ID: <20250523075015.884716-1-sdl@nppct.ru>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 23 May 2025 23:25:09 +0000
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

On most Linux-supported platforms, `int` is 32-bit, making (1 << 47)
undefined and potentially dangerous. To ensure defined behavior and
correct 64-bit arithmetic, replace `1` with `1ULL`.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Cc: stable@vger.kernel.org # v5.1+
Fixes: a5ff307fe1f2 ("drm/nouveau/mmu: add a privileged method to directly manage PTEs")
Signed-off-by: Alexey Nepomnyashih <sdl@nppct.ru>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
index 9c97800fe037..29da1acbe3a8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
@@ -1383,7 +1383,7 @@ nvkm_vmm_pfn_map(struct nvkm_vmm *vmm, u8 shift, u64 addr, u64 size, u64 *pfn)
 			 */
 			while (size) {
 				pfn[pi++] = NVKM_VMM_PFN_NONE;
-				size -= 1 << page->shift;
+				size -= 1ULL << page->shift;
 			}
 		} else {
 			pi += size >> page->shift;
-- 
2.43.0

