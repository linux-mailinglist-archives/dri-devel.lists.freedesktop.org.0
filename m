Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32878AC6BD1
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 16:35:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 592C410E67B;
	Wed, 28 May 2025 14:35:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mHjl3DmV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7319A10E65C;
 Wed, 28 May 2025 14:35:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E6050629D4;
 Wed, 28 May 2025 14:35:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E89A6C4CEF1;
 Wed, 28 May 2025 14:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748442900;
 bh=sWMiF3Jp8psrx0vXllDtK7/+QK0kGDwaFLz+zCQWWb4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=mHjl3DmVqOyQj6LIFz1SYtL1YCu88illwSUyBb3Fs85pkmZd8jgBYjY8/Di8VV1TC
 cft1is6xV0F97gBWe6Hf6WcILD5OyOg+IfVZ7njcjJGs62oRwbCRkeZ77eFLLBOOt5
 cK06+3Ll5DO/CnXy1DXG5Ge1O+HhY9zhO0U7wwuk1zr0oN9Xrn7btjsbwgZmJr1ZCJ
 S9TzVruOdr3B+CfrwWoT4r+RUFN9ypZLZsvpklraFBEkcQ5beMTSlNHPWVJTK2h9yi
 QW2ky0/gkanEh2f1R7P5oS6nCDbRPt1UVCO0mC0UEjjXjsPIXMUY/s1uB0vNwqW35u
 +CgvgK+LuxzQg==
From: Jeff Layton <jlayton@kernel.org>
Date: Wed, 28 May 2025 10:34:38 -0400
Subject: [PATCH v11 06/10] ref_tracker: allow pr_ostream() to print
 directly to a seq_file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-reftrack-dbgfs-v11-6-94ae0b165841@kernel.org>
References: <20250528-reftrack-dbgfs-v11-0-94ae0b165841@kernel.org>
In-Reply-To: <20250528-reftrack-dbgfs-v11-0-94ae0b165841@kernel.org>
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
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBoNx8FcfDlMWQ2oIJlhlzWQq8wxdlXVv6cgcDK3
 X8YzGsS6mGJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaDcfBQAKCRAADmhBGVaC
 FRO6D/4yuAvBXbS8oPQDp0cb7e/vofNMacyg+14J1yzPF6XORw47ErSf/ZW9xe/NgwYevYJQ78P
 gRJvJXQk/AwtF5EXg6eTvHALZsVOrm+RkgSzH9qkVNRo8fJY0T0v0yMpMt0+VcPf16ZB0/J7ewD
 AErr7so25xZw+muohmbh66c649lnV6GcLtqhy3mvHiXu6pJk8rzucB0NLZMbcL0084OpwM5gPMy
 0J6MzjgWv6tHIRkpYGwPWo7HXvMS/q7cu5SARdM8DMal9lagZJ0Pe5B+J1H92MnkiQ0N9OpaG4F
 otCUEZmbNMoyMGxotMBH/hka7x0qVe5B9xituxJcU+m+8lb01TJU4RrAEZ2X9Zd9RLlQQyMLQyK
 Ayxjn9Nd95zLliHUXdWY7+9quncGzBeYrhCiurUfMKgw6CCgVBDw8Nm79pUkrBMTiPVCNUMBEi+
 EHYE3oCAHefmtkG4w27ozGyYtCWWYio+e5wCBLKX4hf5JZDRBJ4QJIN1a7OiePgnjWzqELojuwi
 rpod4tJJdEIIkYr4tKTDoarn1WgHvXshPSinVO9gSTy5ArvHUksk6RTh9mPTKmwcef/WjP046/l
 kg5dmaug7Vvt2Ad/kWQ4CNbBjtpAGYtkyoAcasvgmAgL5U24ePJrN9VZPjO8wjC3xQpOYRpQJC7
 5RzCxJUsoyFr83Q==
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

