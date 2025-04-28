Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5042EA9F873
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 20:27:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81F0010E699;
	Mon, 28 Apr 2025 18:27:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XNOqf7j3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE05C10E698;
 Mon, 28 Apr 2025 18:27:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 553E14AAF9;
 Mon, 28 Apr 2025 18:27:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5198C4CEF1;
 Mon, 28 Apr 2025 18:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745864825;
 bh=h02vtg+uo9MQLcJqO0oaAc8ETCkA4CEZoiZkSocwMrw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=XNOqf7j3CzjorNwFyIBk2uqgCdY8rUGvRy9by8gmo1bdnUryPIes/eB/0xVweiEjO
 zjPAUSgO2MgCFm4jzLx1y2N1DEkPg8w5Gwj4wbYYpxS2vanX3QxJVoMVD6UG18Zqhs
 LtU2i4o38qWQxyUrtQhuPPPVv0UtBWAc6BEcsqiIN4/Z8jGM3NFqMQ43IahuoTV/Iu
 JRl6y+7PKmjAurU2s32jewHrpt4QXhwfQrvrhtNMs01051UfhARalYiziCaWtUCXCL
 JTloBGDW7z4yaUV8aO0b5u0OQyGS+4uENjEwFhX8dQ1ooRXKjcRFgqpVdRCaEr4Skx
 vWtE4spiglHEQ==
From: Jeff Layton <jlayton@kernel.org>
Date: Mon, 28 Apr 2025 11:26:25 -0700
Subject: [PATCH v5 02/10] ref_tracker: add a top level debugfs directory
 for ref_tracker
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-reftrack-dbgfs-v5-2-1cbbdf2038bd@kernel.org>
References: <20250428-reftrack-dbgfs-v5-0-1cbbdf2038bd@kernel.org>
In-Reply-To: <20250428-reftrack-dbgfs-v5-0-1cbbdf2038bd@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1387; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=h02vtg+uo9MQLcJqO0oaAc8ETCkA4CEZoiZkSocwMrw=;
 b=owEBbQKS/ZANAwAIAQAOaEEZVoIVAcsmYgBoD8h1wJh2LTt/ZX/SmXyVMcwsU4+HoiDNlOqaJ
 X/pWNTCVVWJAjMEAAEIAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaA/IdQAKCRAADmhBGVaC
 FSFhD/4jXzbUGZpfQ+eJhWzENK/65qLg1kswKEYZesiyEtUwbpTn01weKqHUCnUNF2grcMlm3/H
 7xtN4eb9L1VTELG7+ATz56c5C67AkEn3sNNcZDF6+AO5Hm0YR2jamrEGZKdQuRaMSQTFdr1VSf7
 O48jNrJ/HLCLCO/wjFuqrGpOFsMtQPm+RfU9wJ2/b2gUeYZ5D2pHd0fxT2p/To7+tluwZGr4DFx
 B1NrOnAwSqLUvIC5yJLr23c411lKjT5NYjOfWcnlPM1Kgni+P2bfTj5Xc0SKbuSwROy1DR9Ac82
 kqJzpVsn+eOXjdZz73uZW5iDY38X+rFEwb0AvmH4sAcSHjn3nUguF5RrJc8POahbowo9T1a022T
 glmKDjobpW/9sax2ol1yI/xccVWWtMPWK0lV8h8SGXdB4w5zygxd42z4owEArK+D1248PA1jqzx
 FYti1GnEWAScuQkhHqIvBFeuE51Vn7PMloX0gIKpDL0QO6zCu0ZoFYT+MaTq4OgyyjO6nMtC3i4
 Ph+V/dQxxLV1E65UcwQTdXmP3At+5T5+RTP7wZeMfRFfKftJ8fmNv+PZpg557MeTcYg0Vh6+yj8
 gqO+AnG5HIZ5xwcFdx46f3ooJ0RsYMPMgCNksjF0FQZ/fS0kdPY8wRdFdAfpANQJIw0i62Q3XdK
 8Hv5IfIIWyabKqQ==
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
index de71439e12a3bab6456910986fa611dfbdd97980..a66cde325920780cfe7529ea9d827d0ee943318d 100644
--- a/lib/ref_tracker.c
+++ b/lib/ref_tracker.c
@@ -12,6 +12,8 @@
 #define REF_TRACKER_STACK_ENTRIES 16
 #define STACK_BUF_SIZE 1024
 
+static struct dentry *ref_tracker_debug_dir = (struct dentry *)-ENOENT;
+
 struct ref_tracker {
 	struct list_head	head;   /* anchor into dir->list or dir->quarantine */
 	bool			dead;
@@ -273,3 +275,17 @@ int ref_tracker_free(struct ref_tracker_dir *dir,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(ref_tracker_free);
+
+#ifdef CONFIG_DEBUG_FS
+#include <linux/debugfs.h>
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

