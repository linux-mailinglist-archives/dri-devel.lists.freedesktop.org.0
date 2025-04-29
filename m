Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AE5AA049A
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 09:34:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1DFC10E39B;
	Tue, 29 Apr 2025 07:34:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bJWiWUbw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3CFF10E391;
 Tue, 29 Apr 2025 07:34:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C6DE049B94;
 Tue, 29 Apr 2025 07:34:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F24DDC4CEE3;
 Tue, 29 Apr 2025 07:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745912052;
 bh=7KwvjwqWpt7P9mIGSbCQc3XS85MpJcNT6e7j/JyjGvo=;
 h=From:To:Cc:Subject:Date:From;
 b=bJWiWUbw1+gc7ZwHGNzpNiPuY8TEvxVkuCnmZDU9twKWflTmLBifTNeILSwaHHsyn
 GuYvPCjkxgeSk6BrRE9w8e2x4i+ts/NzCP4ZqzMStCPoVO5xcWEq5DBbc9Xqsxk3Z9
 MZgeYdJr6kaKPI/fdODiTvyNv8CM8s/8ntgYBbrEuRl/Mtv1mfthw6RdQ6xE0zKWML
 vT4zkZ/7WgmglVUSau9GWBeNmW5dF9YiayzeqfSWiqsggjcXlv9s+g1WTl/jd0i4Ff
 9n1/mIqS6sjyuuOzljFI1Xv2Inn4s7bNlYmnKqr2QJ4q+ISIp+6IOfK5htdv33Xd3M
 xfYnQRTb5368g==
From: Arnd Bergmann <arnd@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, John Harrison <John.C.Harrison@Intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Zhanjun Dong <zhanjun.dong@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/xe: fix devcoredump chunk alignmnent calculation
Date: Tue, 29 Apr 2025 09:34:00 +0200
Message-Id: <20250429073407.3505712-1-arnd@kernel.org>
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

The device core dumps are copied in 1.5GB chunks, which leads to a
link-time error on 32-bit builds because of the 64-bit division not
getting trivially turned into mask and shift operations:

ERROR: modpost: "__moddi3" [drivers/gpu/drm/xe/xe.ko] undefined!

On top of this, I noticed that the ALIGN_DOWN() usage here cannot
work because that is only defined for power-of-two alignments.
Change ALIGN_DOWN into an explicit div_u64_rem() that avoids the
link error and hopefully produces the right results.

Doing a 1.5GB kvmalloc() does seem a bit suspicious as well, e.g.
this will clearly fail on any 32-bit platform and is also likely
to run out of memory on 64-bit systems under memory pressure, so
using a much smaller power-of-two chunk size might be a good idea
instead.

Fixes: c4a2e5f865b7 ("drm/xe: Add devcoredump chunking")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
Please test this with multi-gigabyte buffers, the original code
was clearly not right, but I don't trust my version either.
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index a9e618abf8ac..4eb70e2d9f68 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -177,6 +177,7 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 	struct xe_devcoredump *coredump = data;
 	struct xe_devcoredump_snapshot *ss;
 	ssize_t byte_copied;
+	u32 chunk_offset;
 
 	if (!coredump)
 		return -ENODEV;
@@ -203,8 +204,9 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 
 	if (offset >= ss->read.chunk_position + XE_DEVCOREDUMP_CHUNK_MAX ||
 	    offset < ss->read.chunk_position) {
-		ss->read.chunk_position =
-			ALIGN_DOWN(offset, XE_DEVCOREDUMP_CHUNK_MAX);
+		ss->read.chunk_position = div_u64_rem(offset,
+			XE_DEVCOREDUMP_CHUNK_MAX, &chunk_offset)
+			* XE_DEVCOREDUMP_CHUNK_MAX;
 
 		__xe_devcoredump_read(ss->read.buffer,
 				      XE_DEVCOREDUMP_CHUNK_MAX,
@@ -213,8 +215,7 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 
 	byte_copied = count < ss->read.size - offset ? count :
 		ss->read.size - offset;
-	memcpy(buffer, ss->read.buffer +
-	       (offset % XE_DEVCOREDUMP_CHUNK_MAX), byte_copied);
+	memcpy(buffer, ss->read.buffer + chunk_offset, byte_copied);
 
 	mutex_unlock(&coredump->lock);
 
-- 
2.39.5

