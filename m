Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6382DACC552
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 13:27:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8076710E5B5;
	Tue,  3 Jun 2025 11:27:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Py/Jmgqk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84E3210E1DC;
 Tue,  3 Jun 2025 11:27:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id ED87461129;
 Tue,  3 Jun 2025 11:27:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2C4EC4CEF5;
 Tue,  3 Jun 2025 11:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748950049;
 bh=Cf9EAXyNK0VxD7speigkvYTyuNOgS7Co5M1zyvhQst0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Py/JmgqkOb39XX7aOnjKeJtrVFqeYG6+9c5cJ7LVV7AKNvrckJlSA/Ry9XBh6A8I4
 JfSBX9n7OmuSCJ+lypFSLt9PgpnUgP0ZK7Vy+3jTe8ndko6BHtuBK7LHuL+lckmCza
 Tr7oiz2Q5qa3aSv/Q5kwg8Trr//65TYZryVT6SX/0epqilxNASYte0VERQap9Y5Cm+
 5HTpvZvg+qnI2oxqfMlNgNklC/8rx9+YXdEk2poSeFHrS3INYKDCDYtfB16T5D1rtR
 3SyPbI4AQd3E/mztM74svyYxKPQEz8XDSaNof1tVgXBZu4+6C9TpULtdOGXiKe5Mgb
 Cfa7Mk93Qh81A==
From: Jeff Layton <jlayton@kernel.org>
Date: Tue, 03 Jun 2025 07:27:13 -0400
Subject: [PATCH v13 2/9] ref_tracker: add a top level debugfs directory for
 ref_tracker
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-reftrack-dbgfs-v13-2-7b2a425019d8@kernel.org>
References: <20250603-reftrack-dbgfs-v13-0-7b2a425019d8@kernel.org>
In-Reply-To: <20250603-reftrack-dbgfs-v13-0-7b2a425019d8@kernel.org>
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
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBoPtwZH3X/xIyqMqoat+1/9unMcXFV0vU7LgWpD
 Pqub1sJOk6JAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaD7cGQAKCRAADmhBGVaC
 FSfmEACCmSBnXr4xYbvixs+pUwJlKBT58lsHhV6RYOcn5tP9HY7Al/oYQPQ18JRwPadpO1UrSPU
 v32uOfK8G4avgm7k8hK2SEmypk55haRkNHFYZ05Mx8pOfcXlEzSJd8+l4lOXqck0PAJB1nMGXCm
 OyY8WGM4wBsEZMugAyJGVe7vPXwx+9Yiy4rOwUqrDRYgX+hUvnSCxV+GffAzWgfnbyhR6/V56jR
 iG7pj0xW6Kx1DL8l84OEh+d2n6LcMPKOkX180Sp/+6riKmTZTYtmnsLCTf2cSUwiHyO81tyG5aW
 iv964sWd5yL7BczsRCzaOhs3M8TMI3vwsDkL4yvCUuEXSlckiU6CcozuJqXYx5QKjsA2RSeu0Ih
 deNoAVmX0sBUrSRTgpJ9Ud1KXsbN4Jah3Mk+vs7Lo9cO/vWc6nPssjesdbAzMNVDOIwB1R1wVGL
 2jERfOOYDSf6qUUFrkcIKbsZUye2xJO/CwEsdW4noCZL9fedNS75BEaaH4PG5T0UHUDDgtfjfdW
 yotBTiM+RA/4pN4oeV0/WXtnGePjny34OTxUvZdgQw0F1z3zWme6FesX3NgsfMcqds6tsjIdqcg
 uu9NvdZhezXf5E/fRvLlvd3PTR1hdbHNdq/QWojsUujbHwPLR5hwMIbQR2WfW8Rk/+i54ml5bwb
 qVHiu2mOynSJQow==
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

