Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0225AD3BF8
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 16:59:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DEC010E57D;
	Tue, 10 Jun 2025 14:59:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jRVyUSQi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E182810E58D;
 Tue, 10 Jun 2025 14:59:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BCDE34A874;
 Tue, 10 Jun 2025 14:59:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CED83C4CEF3;
 Tue, 10 Jun 2025 14:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749567587;
 bh=Cf9EAXyNK0VxD7speigkvYTyuNOgS7Co5M1zyvhQst0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=jRVyUSQi5NSA/8G51s+61XcdJIiDrwXTSB5z9QhQftdni3LWaPEYBOAb87eSGyLm/
 zFuXvaJ7Qx6GuvC1jjYNIKV7/G/FqLxZqOAyqr6diaqRU5V7ou2yxF1sVeo88CmhgQ
 9yS4xnxq+KWDRap4WpGfmMRJk/NWj7YMrHNsy0iX9Mm8VdQd4rdB9qJkA11n0HLxf0
 zfXgXcZIJzWfE/JpW+GkRqyWOXPuo/MjNQA42S2GwdMubVaYboz0sIhB7APoj+nCaT
 yeM6QIAWOU/MRoEj9f+2kvtZ4Q4ecqayPQ74Wn1EHiIXXlqLkT+U5jFDT+GaljGWmV
 R3Vtf5pFNdiBA==
From: Jeff Layton <jlayton@kernel.org>
Date: Tue, 10 Jun 2025 10:59:22 -0400
Subject: [PATCH v14 2/9] ref_tracker: add a top level debugfs directory for
 ref_tracker
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-reftrack-dbgfs-v14-2-efb532861428@kernel.org>
References: <20250610-reftrack-dbgfs-v14-0-efb532861428@kernel.org>
In-Reply-To: <20250610-reftrack-dbgfs-v14-0-efb532861428@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Krzysztof Karas <krzysztof.karas@intel.com>, 
 Kuniyuki Iwashima <kuniyu@amazon.com>, Qasim Ijaz <qasdev00@gmail.com>, 
 Nathan Chancellor <nathan@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 Jeff Layton <jlayton@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1088; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=Cf9EAXyNK0VxD7speigkvYTyuNOgS7Co5M1zyvhQst0=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBoSEhb0Bhnkc9PAOi30w9auebrSUuXyd5qHc8q0
 c2ofUayTW6JAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaEhIWwAKCRAADmhBGVaC
 FY9mD/92bM8abh1wNsArTm5QPT2mp6uHBRpU3d3q0Wqx5NX2sBpp4i976a2dlVesF4LwlD+NHTV
 UkAf43I1gMudrDtCUFEXfF7WqkA8WqvmE46VjC0efWLpF8wkHwiT7J3Xg6c9nQE2OyKd4xFnaU2
 blAVVty1u9bJY8hDOs2WjVWzMLIqE2h793JS1uORilNVdc4BCMzHvV/+919AqURdh3vWH22hAfx
 IZM03cJlqnFvR9HC4re6RoR9k7oUSzOZI+ZoqRMc01k8JMfFCQQHvfRi+beVOfH0gZLUNPE4zit
 osn3+oqXWDI6zpGM/0fd1NiS7Y4/fdbr/vZwg+N6ymtkZfj8uaTIrSqebUSM5yIz7is6Ji6t1Qu
 Bnz6j1i83JTu+0IMzCdIOMHwwov/oVJd5pnJLtP7vSQkQGh8TlXyL+epG1b9Tzr+U0z9aMVyjJX
 vIFlgl3i4z8J6yi8oosD1kUsB9qPeVBiJL6t2EejGvlBFUSaL9/r5y2rbOtgIw+KPuCX282eCF9
 skkGXCf36tra4DYscKf7OYWgHw6DP9hNV6jRzbgW1arSgPefy9fvLdZ1mG2cxWPJWyQXIh3Zt1k
 Mlh2O70jeMKs7KUN8Id2IeHU2BVd4yD0f7b/TubZKMoAt4XPhSALWOX4d25Hsst1BtNaZZdtWIt
 zf7fAEPcO0h1feg==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
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

Add a new "ref_tracker" directory in debugfs. Each individual refcount
tracker can register files under there to display info about
currently-held references.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 lib/ref_tracker.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/lib/ref_tracker.c b/lib/ref_tracker.c
index de71439e12a3bab6456910986fa611dfbdd97980..d374e5273e1497cac0d70c02c282baa2c3ab63fe 100644
--- a/lib/ref_tracker.c
+++ b/lib/ref_tracker.c
@@ -273,3 +273,16 @@ int ref_tracker_free(struct ref_tracker_dir *dir,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(ref_tracker_free);
+
+#ifdef CONFIG_DEBUG_FS
+#include <linux/debugfs.h>
+
+static struct dentry *ref_tracker_debug_dir = (struct dentry *)-ENOENT;
+
+static int __init ref_tracker_debugfs_init(void)
+{
+	ref_tracker_debug_dir = debugfs_create_dir("ref_tracker", NULL);
+	return 0;
+}
+late_initcall(ref_tracker_debugfs_init);
+#endif /* CONFIG_DEBUG_FS */

-- 
2.49.0

