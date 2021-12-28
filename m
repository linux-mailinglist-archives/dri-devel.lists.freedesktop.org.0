Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A75B481E7E
	for <lists+dri-devel@lfdr.de>; Thu, 30 Dec 2021 18:17:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6172F10E239;
	Thu, 30 Dec 2021 17:17:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 303 seconds by postgrey-1.36 at gabe;
 Tue, 28 Dec 2021 07:36:50 UTC
Received: from nksmu.kylinos.cn (mailgw.kylinos.cn [123.150.8.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC21B89C08;
 Tue, 28 Dec 2021 07:36:50 +0000 (UTC)
X-UUID: c5eaab73c6814abc813d602ca3e67c2c-20211228
X-UUID: c5eaab73c6814abc813d602ca3e67c2c-20211228
X-User: wenzhiwei@kylinos.cn
Received: from localhost.localdomain.localdomain [(172.17.127.26)] by
 nksmu.kylinos.cn (envelope-from <wenzhiwei@kylinos.cn>) (Generic MTA)
 with ESMTP id 1341986671; Tue, 28 Dec 2021 15:44:06 +0800
From: Wen Zhiwei <wenzhiwei@kylinos.cn>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] gpu/drm/radeon:Fix null pointer risk
Date: Tue, 28 Dec 2021 15:31:26 +0800
Message-Id: <20211228073126.48906-1-wenzhiwei@kylinos.cn>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 30 Dec 2021 17:17:01 +0000
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wenzhiwei@kylinos.cn, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the null pointer is not judged in advance,
there is a risk that the pointer will cross
the boundary

Signed-off-by: Wen Zhiwei <wenzhiwei@kylinos.cn>
---
 drivers/gpu/drm/radeon/radeon_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_vm.c b/drivers/gpu/drm/radeon/radeon_vm.c
index bb53016f3138..d3d342041adf 100644
--- a/drivers/gpu/drm/radeon/radeon_vm.c
+++ b/drivers/gpu/drm/radeon/radeon_vm.c
@@ -951,7 +951,7 @@ int radeon_vm_bo_update(struct radeon_device *rdev,
 
 		if (mem->mem_type == TTM_PL_TT) {
 			bo_va->flags |= RADEON_VM_PAGE_SYSTEM;
-			if (!(bo_va->bo->flags & (RADEON_GEM_GTT_WC | RADEON_GEM_GTT_UC)))
+			if (bo_va->bo && !(bo_va->bo->flags & (RADEON_GEM_GTT_WC | RADEON_GEM_GTT_UC)))
 				bo_va->flags |= RADEON_VM_PAGE_SNOOPED;
 
 		} else {
-- 
2.30.0

