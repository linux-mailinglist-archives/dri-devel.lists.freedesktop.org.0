Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99154AB195E
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 17:54:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF8BE10EAB0;
	Fri,  9 May 2025 15:54:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FdYc6wGX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB8B610EAA7;
 Fri,  9 May 2025 15:54:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A14E743BDE;
 Fri,  9 May 2025 15:54:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC809C4CEEE;
 Fri,  9 May 2025 15:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746806076;
 bh=sWMiF3Jp8psrx0vXllDtK7/+QK0kGDwaFLz+zCQWWb4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=FdYc6wGXzjoZ6u3vXZIf8g6zVkhBwOmJtr+YkHPGfu2pXxSwrdf0zDYW7d7m7iitj
 waV+8VU0TT10GfWvRBNc9HiHZWEDAthLOvDPreJj/3BQLO6TvZMom8LvoNHPfvyO5f
 eVV8lWvLqWNg58rIACQPnyXehErbQWLTN+RhqRk9Xi4etyg8uGUHZsn3Kg5WgCPiNU
 y4BsBhsXLniFjZNsMKhOUncqNR2ZmP5c4+IQlEoaL5OTT+RKzmH9lfS74r7/NCcntt
 7Lb8rS5F4c4Sq3iB/N/GhWoEoPj7oY4WjjoC70Wvn51NJLb8Gr0JnM7XvF4VjjS/pY
 bIVSmglofuvQw==
From: Jeff Layton <jlayton@kernel.org>
Date: Fri, 09 May 2025 11:53:41 -0400
Subject: [PATCH v9 05/10] ref_tracker: allow pr_ostream() to print directly
 to a seq_file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-reftrack-dbgfs-v9-5-8ab888a4524d@kernel.org>
References: <20250509-reftrack-dbgfs-v9-0-8ab888a4524d@kernel.org>
In-Reply-To: <20250509-reftrack-dbgfs-v9-0-8ab888a4524d@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1919; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=sWMiF3Jp8psrx0vXllDtK7/+QK0kGDwaFLz+zCQWWb4=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBoHiUvc6qXkXEuPAP/QG0yVt5dTxV6dRCnl6RMT
 ewbnZ9QnySJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaB4lLwAKCRAADmhBGVaC
 FRXwEACOC5PnMHjcA+Xp+51Azu9umR+YbygrApiT3qtRp7EMUbqeTPyHk+9qW/icE9JtjXoMbL3
 jrWIAz6akpmLPl+wAIbL67qM3T4OOZ/VULF5sieGn8A5J3O1kUknEWKvTOHtE2n+OAueBW3/0HO
 tFDYv9hue2fl3vh+Fjhr0Ei3VgHfYChKiyiTDdOb5DnsHGzNd019ste/UZb5j92vRtwYbD/JEdr
 DEq6I03hXkVV8QulIk/xlq7JfDfcIvcjWlsXa/KgIcdMH58Rj12u3HgdP6j15JeWs+yphZ+IvEz
 c3R3Gnchejk+DcWnTMkrFdvSGSLpZpsu00Cy7mgd0FOGoXj/JldcIF/0M8XPJmJDtZGjBtM/WgT
 WvRe43Av9/oBAZu88YT6M/SDRqKpCebRWPBrLo4LmPU+T37hO1BsrKGgfvEb2gCMFQI4pvmNzH4
 wtiKOBSV/w0ZLTMLkn0VMYEUdqNjEN+T1ByyOJANm3/YUZsmJH0YGSqxaGZw3aKN2/hdpvNZHTr
 Q7MOm8mbwymR80YSHK2EK8Jbzda+Xc+nsRTgC3dIXhrPOaDkgY4yNeiXCNNsRc5+FVaDEEaTU4X
 HnLpTTb/Si5Xso6PPx0wPCi/AxjGoKaE5YUYM7mOz2aRDgpxmRaaHRbwGS/Iz1pmtyQHop8InA6
 Orr6HaJTc3aKo7A==
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

Allow pr_ostream to also output directly to a seq_file without an
intermediate buffer. The first caller of +ref_tracker_dir_seq_print()
will come in a later patch, so mark that __maybe_unused for now. That
designation will be removed once it is used.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 lib/ref_tracker.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/lib/ref_tracker.c b/lib/ref_tracker.c
index 607718d00ffa74bd6d9abf97e913abcfd56dd1c8..6e85e7eb347d86775ba38a72dad7159f9ac41ed9 100644
--- a/lib/ref_tracker.c
+++ b/lib/ref_tracker.c
@@ -8,6 +8,7 @@
 #include <linux/slab.h>
 #include <linux/stacktrace.h>
 #include <linux/stackdepot.h>
+#include <linux/seq_file.h>
 
 #define REF_TRACKER_STACK_ENTRIES 16
 #define STACK_BUF_SIZE 1024
@@ -66,6 +67,7 @@ struct ostream {
 	void __ostream_printf (*func)(struct ostream *stream, char *fmt, ...);
 	char *prefix;
 	char *buf;
+	struct seq_file *seq;
 	int size, used;
 };
 
@@ -300,6 +302,30 @@ EXPORT_SYMBOL_GPL(ref_tracker_free);
 
 static struct dentry *ref_tracker_debug_dir = (struct dentry *)-ENOENT;
 
+static void __ostream_printf pr_ostream_seq(struct ostream *stream, char *fmt, ...)
+{
+	va_list args;
+
+	va_start(args, fmt);
+	seq_vprintf(stream->seq, fmt, args);
+	va_end(args);
+}
+
+static __maybe_unused int
+ref_tracker_dir_seq_print(struct ref_tracker_dir *dir, struct seq_file *seq)
+{
+	struct ostream os = { .func = pr_ostream_seq,
+			      .prefix = "",
+			      .seq = seq };
+	unsigned long flags;
+
+	spin_lock_irqsave(&dir->lock, flags);
+	__ref_tracker_dir_pr_ostream(dir, 16, &os);
+	spin_unlock_irqrestore(&dir->lock, flags);
+
+	return os.used;
+}
+
 static int __init ref_tracker_debugfs_init(void)
 {
 	ref_tracker_debug_dir = debugfs_create_dir("ref_tracker", NULL);

-- 
2.49.0

