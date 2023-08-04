Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A3E770185
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 15:29:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D6B610E701;
	Fri,  4 Aug 2023 13:29:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6EA710E6FE;
 Fri,  4 Aug 2023 13:29:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2125161FED;
 Fri,  4 Aug 2023 13:29:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 887B3C433C7;
 Fri,  4 Aug 2023 13:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691155771;
 bh=5QulDdnYOUr8lHiRjrxVRvtjbrNSF9IOJD1YPU7sdXo=;
 h=From:To:Cc:Subject:Date:From;
 b=ceUb0YBBcd+l01n1IJtnxQ34cRdsYUADJ5q7fxZOrRUJ4Th4VrUU3w8on9TFQkL8y
 PPBpoEaOnYEAEtl1obRmNPBeioIXlzIbYWJbdkGoJC2FkZHqQXCbXteFaTWjRRw/sl
 6vmu/bSDTRnl1X3/SvbgaclRUZWwpCOd2hRVy3I6+R9Be0zFu7FVNqu/0/qj+hS6EI
 Mf1YiM4ZKuHL3g2gTS50LTR08FhPybwManzteY06HWpTrFImGanyPXdBYKqUwPQ262
 obNADNL5//WSGE95cghlg+Xo04BoWDD8eURrjj9qMyMsudJVnjUaQXFihHZv0zhG/2
 uIs/TVkpDDsOw==
From: Arnd Bergmann <arnd@kernel.org>
To: Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Philip Yang <Philip.Yang@amd.com>,
 Alex Sierra <alex.sierra@amd.com>
Subject: [PATCH] drm/amdkfd: fix build failure without CONFIG_DYNAMIC_DEBUG
Date: Fri,  4 Aug 2023 15:29:17 +0200
Message-Id: <20230804132924.2314478-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: Mukul Joshi <mukul.joshi@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Graham Sider <Graham.Sider@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

When CONFIG_DYNAMIC_DEBUG is disabled altogether, calling
_dynamic_func_call_no_desc() does not work:

drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_svm.c: In function 'svm_range_set_attr':
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_svm.c:52:9: error: implicit declaration of function '_dynamic_func_call_no_desc' [-Werror=implicit-function-declaration]
   52 |         _dynamic_func_call_no_desc("svm_range_dump", svm_range_debug_dump, svms)
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_svm.c:3564:9: note: in expansion of macro 'dynamic_svm_range_dump'
 3564 |         dynamic_svm_range_dump(svms);
      |         ^~~~~~~~~~~~~~~~~~~~~~

Add a compile-time conditional in addition to the runtime check.

Fixes: 8923137dbe4b2 ("drm/amdkfd: avoid svm dump when dynamic debug disabled")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 308384dbc502d..44e710821b6d9 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -23,6 +23,7 @@
 
 #include <linux/types.h>
 #include <linux/sched/task.h>
+#include <linux/dynamic_debug.h>
 #include <drm/ttm/ttm_tt.h>
 #include <drm/drm_exec.h>
 
@@ -48,8 +49,13 @@
  * page table is updated.
  */
 #define AMDGPU_SVM_RANGE_RETRY_FAULT_PENDING	(2UL * NSEC_PER_MSEC)
+#if IS_ENABLED(CONFIG_DYNAMIC_DEBUG)
 #define dynamic_svm_range_dump(svms) \
 	_dynamic_func_call_no_desc("svm_range_dump", svm_range_debug_dump, svms)
+#else
+#define dynamic_svm_range_dump(svms) \
+	do { if (0) svm_range_debug_dump(svms); } while (0)
+#endif
 
 /* Giant svm range split into smaller ranges based on this, it is decided using
  * minimum of all dGPU/APU 1/32 VRAM size, between 2MB to 1GB and alignment to
-- 
2.39.2

