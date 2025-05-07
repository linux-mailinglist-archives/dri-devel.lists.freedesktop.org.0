Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1660DAAE013
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 15:07:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6568F10E7BF;
	Wed,  7 May 2025 13:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="F/Avoz3N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 287E010E7BA;
 Wed,  7 May 2025 13:07:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7E67240C40;
 Wed,  7 May 2025 13:06:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97971C4CEF2;
 Wed,  7 May 2025 13:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746623216;
 bh=LxLVRB8GvDbWgwRUBMxy60vYqqNKxSuBn+6jZzlFCL8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=F/Avoz3NIXBLZbU9X+i5TfX9Glx+eMsbX8LLPBgpjxWWCRyiOSTPr6lVo03SM7Pqm
 4ygmaykhSVb3JK3qpMBUOtJws6yoRohgMKrop8i0TdawDylaKxLX3MFffADDBGX1ep
 JnlxiEFGkzVvE5TNEdQuGVqfVCHRkbEjGzOha0WfPNrZd8p9zXfv8aAmDNgiBwiTtZ
 yEPfOevtiE+3ktI486drFPQsmk2rF0dsTViYbIBmTZFCMfcZ+PaIxjxXdciCCjetOe
 M3hRY0ihlFlDopo8mSda3/DWG8849D3EMgD7Ewi1PqzuVqbTYxQc5WOL2DjFY0AVoq
 qBmcmMVbOtn9w==
From: Jeff Layton <jlayton@kernel.org>
Date: Wed, 07 May 2025 09:06:27 -0400
Subject: [PATCH v8 02/10] ref_tracker: add a top level debugfs directory
 for ref_tracker
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-reftrack-dbgfs-v8-2-607717d3bb98@kernel.org>
References: <20250507-reftrack-dbgfs-v8-0-607717d3bb98@kernel.org>
In-Reply-To: <20250507-reftrack-dbgfs-v8-0-607717d3bb98@kernel.org>
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
Cc: Kuniyuki Iwashima <kuniyu@amazon.com>, Qasim Ijaz <qasdev00@gmail.com>, 
 Nathan Chancellor <nathan@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 Jeff Layton <jlayton@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1182; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=LxLVRB8GvDbWgwRUBMxy60vYqqNKxSuBn+6jZzlFCL8=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBoG1rouWFdhP/plUwbE1og8p12U//Qo7GRDszZb
 vz+YlLaseyJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaBta6AAKCRAADmhBGVaC
 FS1DD/9jx9aWxNjpDHg0x5Y3Nuz8dBFoNusc5ZEv/5ZGG8XoWbO3y+CKR+F26Vo7aBMSRpBrXhC
 usv1ZQvaqwJVGOWqWWbHHhsEQgncT0V3WWs/nSyVOMsROz4jYG2l159rA6bub0h6/mrvglWVZO3
 vNXli2rusl8PPneAe0NF0oFuP9p9PjBYkyoEsBfl8wD6qb2AyuuOu9W7Xaip50/scMpDWEhNryF
 DZfNjKWDOWer4KsG4/Iuo0tT39LMd6cNYKNfn8xIj3yuNRx1fDnBX4rp21KTWZNexYdbpUFj6+V
 lndQpuBOmvk9yE7B4KdkhG1KG8KkncUJVqVc8LNV4ag/Kq9BEhST4RqdkmXOUI+wWWTDwqw+spK
 wLa3rSCDWpEYll/10wDDcBXrgIeBnqcbPfrNI2HiLPlxtg2q6mXtZhEbHDXEor/AxJtKIP8Zqoj
 XBfrQ6wQ+TKi038H3x6HKzI4vC6Aq/F9GkBMOXgfH+Nntr35mN97aAXxvMQLDdOrQZzQQeoE5zj
 p6ZlIPGVj0EMumlXyuy9lYFEubdy8FcrsoW3FrJdj7+65QQKDcD1g5AMsHbX+hOIwy3M072yLUN
 oh1mi6Y1PA3JanP18Nz8qGLz8bIoV6WcC9TvgayZYioApjJ3vjpb85lvPFn4Z+D7LqqKSydMf1V
 yY6nKOUmaaHrWLA==
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
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 lib/ref_tracker.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/lib/ref_tracker.c b/lib/ref_tracker.c
index de71439e12a3bab6456910986fa611dfbdd97980..34ac37db209077d6771d5f4367e53d19ba3169c6 100644
--- a/lib/ref_tracker.c
+++ b/lib/ref_tracker.c
@@ -273,3 +273,19 @@ int ref_tracker_free(struct ref_tracker_dir *dir,
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
+	if (IS_ERR(ref_tracker_debug_dir))
+		pr_warn("ref_tracker: unable to create debugfs ref_tracker directory: %pe\n",
+			ref_tracker_debug_dir);
+	return 0;
+}
+late_initcall(ref_tracker_debugfs_init);
+#endif /* CONFIG_DEBUG_FS */

-- 
2.49.0

