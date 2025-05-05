Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B3FAA9AA3
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 19:33:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD87A10E413;
	Mon,  5 May 2025 17:33:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="F4aDHFdn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A676E10E40D;
 Mon,  5 May 2025 17:33:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DC9BAA4C5B6;
 Mon,  5 May 2025 17:28:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D892C4CEF8;
 Mon,  5 May 2025 17:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746466413;
 bh=h02vtg+uo9MQLcJqO0oaAc8ETCkA4CEZoiZkSocwMrw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=F4aDHFdnNcLca9gYOHfd9fOmbe/zPFx1H4HEGYfT8AtoutRC+2e9fPF5Oy2m68lEg
 Cs+7qCDb0KeKfGp8b7l9YmXPQxlZDIs9kafuYjdCnsBFu1jjXc41LPFsbANwHXF65Q
 L+VccfGmGKjzqadV/eew2SXIEGL0Zo+hEnASiiIzLZvCMH59w7g/V4c8zZ3hkRL8yY
 TO79EJcWuMKlQiu0JzXiNseffSqrBngCdSITebXy9aVbnzCfCx8MzhzUkdFd6KnaJB
 AX8nxOnOtzjv7T8LaFVIz4gjjbi8+NaaskRFLqWZ2o2hqESq5ImLsUtH56UPQfotz4
 SgBZwwIaTAILw==
From: Jeff Layton <jlayton@kernel.org>
Date: Mon, 05 May 2025 13:33:16 -0400
Subject: [PATCH v7 02/10] ref_tracker: add a top level debugfs directory
 for ref_tracker
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-reftrack-dbgfs-v7-2-f78c5d97bcca@kernel.org>
References: <20250505-reftrack-dbgfs-v7-0-f78c5d97bcca@kernel.org>
In-Reply-To: <20250505-reftrack-dbgfs-v7-0-f78c5d97bcca@kernel.org>
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
 b=owEBbQKS/ZANAwAIAQAOaEEZVoIVAcsmYgBoGPZlhSQZ/mtt0iZdXA5OKFjNHwjCuyEL3zyt1
 RCjvhUpZxeJAjMEAAEIAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaBj2ZQAKCRAADmhBGVaC
 FeP5EADFj06mm8aeYDTcUwtRPTKeSCnURsq7GNBniSrIFvK0n5zZsKEFPa/16/zLM8gloV0hknv
 gJkgTJITSMmzf3tFhQI2rQX6C37CVL0NM7JK5Yu3iz0rJT4KQRCF7jwkctJVFM0bPevfvryhq4l
 WBFt5bO21jTpaeV88Ke6GmYsU8JV1t7PUT1EQv9V65tKxY9Y4IopC7RGuGR6e01xYPKmlw25xdS
 kAERPz0HIlMGou6Rmg5zuv0eKbQ/1P86WIYLzYoeNHWMyt9e/ktQWA/WSV8MQUleoCkwtRQ+RXe
 sb/krxnqU1e3rbs6pE91aw8vjc8HB1+791MOzwgDtP/smWCL2cChLK5DgUl2/30PfVT3ik2kp2t
 NstaF9mG4YdEX7HJ6iOYtCGgkzXfbPBI1lXMfjyjt4MqzSOR1zMwXHpphUxQUtLJQaJl3opLKHS
 8YN1Hj4OBUL1X458kRzkXATaJZoE0mFLiEDFfU1rfTJLanyMbuicf0YHzy2H7ZR9zFNB6RkUI5k
 WBGovtNm7zGDYp+K2JMQ9STFO6zK5FBrKPTY0nDnV4ZpbnG2DH8aqMdiSbLIy36034Pa/+b34Zn
 eMfyzbFUt3Ai1seTue9jR6W7phXBkJ2OI/E2/1Z5I9U6o69EAfiyX6Dztyf5rmyMzB6RUFVVtCv
 lawmhm2QoEZGKkg==
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

