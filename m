Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 949A97487A1
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 17:16:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9788310E17B;
	Wed,  5 Jul 2023 15:16:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B1D810E17B
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 15:16:45 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5979:7b6f:39a:b9cb])
 by xavier.telenet-ops.be with bizsmtp
 id HTGi2A00M45Xpxs01TGiAL; Wed, 05 Jul 2023 17:16:42 +0200
Received: from rox.of.borg ([192.168.97.57] helo=rox)
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qH4FC-000ce1-Pe;
 Wed, 05 Jul 2023 17:16:42 +0200
Received: from geert by rox with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qH4FG-00AwRY-Bb;
 Wed, 05 Jul 2023 17:16:42 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@amd.com>
Subject: [PATCH libdrm] amdgpu: Fix pointer/integer mismatch warning
Date: Wed,  5 Jul 2023 17:16:40 +0200
Message-Id: <f8b4dd272f5851241addd4db51ca34d731a7ab6a.1688570180.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 32-bit:

    ../amdgpu/amdgpu_bo.c: In function ‘amdgpu_find_bo_by_cpu_mapping’:
    ../amdgpu/amdgpu_bo.c:554:13: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
           cpu < (void*)((uintptr_t)bo->cpu_ptr + bo->alloc_size))
                 ^

Indeed, as amdgpu_bo_info.alloc_size is "uint64_t", the sum is
always 64-bit, while "void *" can be 32-bit or 64-bit.

Fix this by casting bo->alloc_size to "size_t", which is either
32-bit or 64-bit, just like "void *".

Fixes: c6493f360e7529c2 ("amdgpu: Eliminate void* arithmetic in amdgpu_find_bo_by_cpu_mapping")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 amdgpu/amdgpu_bo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/amdgpu/amdgpu_bo.c b/amdgpu/amdgpu_bo.c
index f4e0435254f6aa9f..672f000d64801012 100644
--- a/amdgpu/amdgpu_bo.c
+++ b/amdgpu/amdgpu_bo.c
@@ -551,7 +551,7 @@ drm_public int amdgpu_find_bo_by_cpu_mapping(amdgpu_device_handle dev,
 		if (!bo || !bo->cpu_ptr || size > bo->alloc_size)
 			continue;
 		if (cpu >= bo->cpu_ptr &&
-		    cpu < (void*)((uintptr_t)bo->cpu_ptr + bo->alloc_size))
+		    cpu < (void*)((uintptr_t)bo->cpu_ptr + (size_t)bo->alloc_size))
 			break;
 	}
 
-- 
2.34.1

