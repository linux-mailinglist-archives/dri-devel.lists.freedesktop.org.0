Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D91851218
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 12:22:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CA6F10EB58;
	Mon, 12 Feb 2024 11:22:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CygLBY8X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 664D910E548;
 Mon, 12 Feb 2024 11:22:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9BF0C60F55;
 Mon, 12 Feb 2024 11:22:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81EFDC433C7;
 Mon, 12 Feb 2024 11:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707736956;
 bh=4C5nZGco26sonFA2eNFl58Z2ow6XP0jrBTogGeyvF7M=;
 h=From:To:Cc:Subject:Date:From;
 b=CygLBY8XhV8HOEbO2Yhqk49rWMjOa8t2XLVwB952Zz4Bn5kxp5qwPCPwj6HZhry+M
 ONK37SaoxMjxxOqj6C4rHrZzvJp/ArzDLuID/k7Ii2qYxHlnmZ7Y022pDFbWlcEq2i
 xaYEp2k8aUx4AkjEA4ekWKpu+lqThQHgBVjee8XR4SI3IJVazSwqTit59Mhqt60bs7
 ZqpVppMJxzsAiodFBPS9eJ3C+3oDXxa/00VxMMGxnPpkfVU9t7QfG7XwQUR0JmP9Jx
 rDGkdxt3oHqtyzYakpPU2f085hoUlMnvvb3VDUNrmjscFJAe4gkI+/yMqEj0h+mfb+
 6xwEdiygBPvKg==
From: Arnd Bergmann <arnd@kernel.org>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Kees Cook <keescook@chromium.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Dave Airlie <airlied@redhat.com>,
 Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] nouveau/svm: fix kvcalloc() argument order
Date: Mon, 12 Feb 2024 12:22:17 +0100
Message-Id: <20240212112230.1117284-1-arnd@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

The conversion to kvcalloc() mixed up the object size and count
arguments, causing a warning:

drivers/gpu/drm/nouveau/nouveau_svm.c: In function 'nouveau_svm_fault_buffer_ctor':
drivers/gpu/drm/nouveau/nouveau_svm.c:1010:40: error: 'kvcalloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
 1010 |         buffer->fault = kvcalloc(sizeof(*buffer->fault), buffer->entries, GFP_KERNEL);
      |                                        ^
drivers/gpu/drm/nouveau/nouveau_svm.c:1010:40: note: earlier argument should specify number of elements, later size of each element

The behavior is still correct aside from the warning, but fixing it avoids
the warnings and can help the compiler track the individual objects better.

Fixes: 71e4bbca070e ("nouveau/svm: Use kvcalloc() instead of kvzalloc()")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index 4d1008915499..b4da82ddbb6b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -1007,7 +1007,7 @@ nouveau_svm_fault_buffer_ctor(struct nouveau_svm *svm, s32 oclass, int id)
 	if (ret)
 		return ret;
 
-	buffer->fault = kvcalloc(sizeof(*buffer->fault), buffer->entries, GFP_KERNEL);
+	buffer->fault = kvcalloc(buffer->entries, sizeof(*buffer->fault), GFP_KERNEL);
 	if (!buffer->fault)
 		return -ENOMEM;
 
-- 
2.39.2

