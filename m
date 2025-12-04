Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9F3CA3121
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 10:47:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BFA810E905;
	Thu,  4 Dec 2025 09:47:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oYO50jUP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 067C810E902;
 Thu,  4 Dec 2025 09:47:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7B4E460128;
 Thu,  4 Dec 2025 09:47:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49998C4CEFB;
 Thu,  4 Dec 2025 09:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764841630;
 bh=f4aSFtHUYaHe9XbQ12I0YpwS+y20rWzJFAGew9i9F6s=;
 h=From:To:Cc:Subject:Date:From;
 b=oYO50jUPJsZIvsDpQygHaYbvJp/0NxdSmn3teLWpcApBo8ldCE3dGMDuau3crgaRl
 i8UkhAiCte+PzRPp32kwPMqxZN7exxfcqmu/Msr8aBiDDBv7rEzFY+DWHVE8KzsYHX
 +Q/WZKBQ2oTDYQ4Q9nmmkEJg3jl7rdURVp9FUTtQZczJru/5Dl0cWKxFY5p8XVkdnc
 BIfS3DVpZNI8qL6ZX4Gk2PTIqcQgX/o6QhAoB9VgQCazLr50CII6UqR08JzaRSANq3
 duETpUXmjCpuzjFMAoI74FRxrmsnICiTqWtD5mgENzWD3Ysn+62B+Nj9q15Cxg531h
 DfAPWvXtFcc4g==
From: Arnd Bergmann <arnd@kernel.org>
To: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Lucas De Marchi <demarchi@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] xe: fix drm_gpusvm_init() arguments
Date: Thu,  4 Dec 2025 10:46:58 +0100
Message-Id: <20251204094704.1030933-1-arnd@kernel.org>
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

The Xe driver fails to build when CONFIG_DRM_XE_GPUSVM is disabled
but CONFIG_DRM_GPUSVM is turned on, jdue to the clash of two commits:

In file included from drivers/gpu/drm/xe/xe_vm_madvise.c:8:
drivers/gpu/drm/xe/xe_svm.h: In function 'xe_svm_init':
include/linux/stddef.h:8:14: error: passing argument 5 of 'drm_gpusvm_init' makes integer from pointer without a cast [-Wint-conversion]
drivers/gpu/drm/xe/xe_svm.h:217:38: note: in expansion of macro 'NULL'
  217 |                                NULL, NULL, 0, 0, 0, NULL, NULL, 0);
      |                                      ^~~~
In file included from drivers/gpu/drm/xe/xe_bo_types.h:11,
                 from drivers/gpu/drm/xe/xe_bo.h:11,
                 from drivers/gpu/drm/xe/xe_vm_madvise.c:11:
include/drm/drm_gpusvm.h:254:35: note: expected 'long unsigned int' but argument is of type 'void *'
  254 |                     unsigned long mm_start, unsigned long mm_range,
      |                     ~~~~~~~~~~~~~~^~~~~~~~
In file included from drivers/gpu/drm/xe/xe_vm_madvise.c:14:
drivers/gpu/drm/xe/xe_svm.h:216:16: error: too many arguments to function 'drm_gpusvm_init'; expected 10, have 11
  216 |         return drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM (simple)", &vm->xe->drm,
      |                ^~~~~~~~~~~~~~~
  217 |                                NULL, NULL, 0, 0, 0, NULL, NULL, 0);
      |                                                                 ~
include/drm/drm_gpusvm.h:251:5: note: declared here

Adapt the caller to the new argument list by removing the extraneous
NULL argument.

Fixes: 9e9787414882 ("drm/xe/userptr: replace xe_hmm with gpusvm")
Fixes: 10aa5c806030 ("drm/gpusvm, drm/xe: Fix userptr to not allow device private pages")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/xe/xe_svm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 0955d2ac8d74..fa757dd07954 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -214,7 +214,7 @@ int xe_svm_init(struct xe_vm *vm)
 {
 #if IS_ENABLED(CONFIG_DRM_GPUSVM)
 	return drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM (simple)", &vm->xe->drm,
-			       NULL, NULL, 0, 0, 0, NULL, NULL, 0);
+			       NULL, 0, 0, 0, NULL, NULL, 0);
 #else
 	return 0;
 #endif
-- 
2.39.5

