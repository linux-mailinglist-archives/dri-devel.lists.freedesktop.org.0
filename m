Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2881AA67CE
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 02:24:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D3E10E106;
	Fri,  2 May 2025 00:24:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HYPplRKQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D284F10E106
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 00:24:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 65A125C482B;
 Fri,  2 May 2025 00:22:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E9D2C4CEE3;
 Fri,  2 May 2025 00:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746145484;
 bh=6FeYoImvtlRRNM4YoESqUYiyq85ZDtoc2RCzztmOpcY=;
 h=From:To:Cc:Subject:Date:From;
 b=HYPplRKQY1aF1RJXH+LDpHGC00zMlBUO748oRhW6OW+9uPXIFH1Qvc4c9+wSHP7QA
 XlsaUYmaJY8GX++jSCVqdjCSAR5SvFSrMYzV73WxzSWupC10+T63vNA8pXKU8kxbNW
 5mRkDkxDgHOPO96NYPeqYZ9Osy7wxMFzvI+byRpMvh8d/HXaX+F3okZ1AM6fhNYSke
 khHDKwF8k1pun+HnZOnrQ7WKmodA4RUPUf9lyoPh9t2bYhTlNh0v4O+KTeZBogKMbo
 M6tzu7SaG+/WLo64cIWwTKId809m7B1+ifZiOPbCAGCLDtJ17IHMI8oxnGjn5TdAS8
 EhCrzy3kAlHhQ==
From: Kees Cook <kees@kernel.org>
To: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Kees Cook <kees@kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: [PATCH v2] drm/ttm: Silence randstruct warning about casting struct
 file
Date: Thu,  1 May 2025 17:24:38 -0700
Message-Id: <20250502002437.it.851-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2280; i=kees@kernel.org;
 h=from:subject:message-id; bh=6FeYoImvtlRRNM4YoESqUYiyq85ZDtoc2RCzztmOpcY=;
 b=owGbwMvMwCVmps19z/KJym7G02pJDBkiAkc5ExuSPvH/Cog4tZ3VTjb98WqR6MUzm+ZMmsv+K
 upDQKZ5RykLgxgXg6yYIkuQnXuci8fb9nD3uYowc1iZQIYwcHEKwEQ+/2X47/WwaLNgcHXbvzNJ
 tcdVU3klsv9Ftc1g2ijPaWbzveGhAMP/cFbe763qS79FVQg8zHlt+ef9xTsqkvrWwnGdinOVePw
 ZAQ==
X-Developer-Key: i=kees@kernel.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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

Casting through a "void *" isn't sufficient to convince the randstruct
GCC plugin that the result is intentional. Instead operate through an
explicit union to silence the warning:

drivers/gpu/drm/ttm/ttm_backup.c: In function 'ttm_file_to_backup':
drivers/gpu/drm/ttm/ttm_backup.c:21:16: note: randstruct: casting between randomized structure pointer types (ssa): 'struct ttm_backup' and 'struct file'
   21 |         return (void *)file;
      |                ^~~~~~~~~~~~

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Fixes: e7b5d23e5d47 ("drm/ttm: Provide a shmem backup implementation")
Signed-off-by: Kees Cook <kees@kernel.org>
---
 v2: use struct and container_of (matthew)
 v1: https://lore.kernel.org/all/20250501195859.work.107-kees@kernel.org/
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Huang Rui <ray.huang@amd.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: <dri-devel@lists.freedesktop.org>
---
 drivers/gpu/drm/ttm/ttm_backup.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_backup.c b/drivers/gpu/drm/ttm/ttm_backup.c
index 93c007f18855..60cff6c60db4 100644
--- a/drivers/gpu/drm/ttm/ttm_backup.c
+++ b/drivers/gpu/drm/ttm/ttm_backup.c
@@ -9,16 +9,21 @@
 
 /*
  * Casting from randomized struct file * to struct ttm_backup * is fine since
- * struct ttm_backup is never defined nor dereferenced.
+ * struct ttm_backup is never defined nor dereferenced. Use a single-member
+ * struct to avoid cast warnings.
  */
+struct ttm_backup {
+	struct file file;
+};
+
 static struct file *ttm_backup_to_file(struct ttm_backup *backup)
 {
-	return (void *)backup;
+	return &backup->file;
 }
 
 static struct ttm_backup *ttm_file_to_backup(struct file *file)
 {
-	return (void *)file;
+	return container_of(file, struct ttm_backup, file);
 }
 
 /*
-- 
2.34.1

