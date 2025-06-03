Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 877E0ACC559
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 13:27:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8012E10E5CD;
	Tue,  3 Jun 2025 11:27:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hZ67idAk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8655310E5C0;
 Tue,  3 Jun 2025 11:27:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 453C1A4FEBE;
 Tue,  3 Jun 2025 11:27:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 315F9C4CEF2;
 Tue,  3 Jun 2025 11:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748950056;
 bh=fIUtfKsTxdswV0+z7NV6Nx2ljCgH4pcViNimfWT3u1o=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=hZ67idAkz1Q6WEjCvJXL8tiUJJl7YaEYyEbBZuiihtliUd1F0zKdiG3j7C+knHL6T
 MGcArYUs+QlL/jtLXLwmL7/SD9AV4YVT5uuWSJftlZoJ8hxJw/SNFfQJDc8GOc8Qs7
 cL8kTXvoo6PTkj8gMVJsl+WvFDLcD6JT/72BMaZIVcICtZPSuRBm0TG+vtHCVIfdE3
 vTAe7l2schRgJHCJoBmXCpbNtjgifEvPjyvPApxH47a5AIToOEMeNlguciFYHbm/y1
 8B2tC09pehQOZK+N7NyDdF51sjQlA4lxNvDFT1IEVyAz/RJ4FSs+rHwXnHUVsQqjxM
 EFdxNleToic8A==
From: Jeff Layton <jlayton@kernel.org>
Date: Tue, 03 Jun 2025 07:27:16 -0400
Subject: [PATCH v13 5/9] ref_tracker: allow pr_ostream() to print directly
 to a seq_file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-reftrack-dbgfs-v13-5-7b2a425019d8@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1919; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=fIUtfKsTxdswV0+z7NV6Nx2ljCgH4pcViNimfWT3u1o=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBoPtwa9bpttiNqpcPN4Dy+8lJv4cCAkk+aG9TvK
 wIKUa64/syJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaD7cGgAKCRAADmhBGVaC
 FcSOD/0XA5UcipIKa/Kur3XJr6W8uSqfyPG2GmcQickNUCE8HdODpm1TkAUo47yCmvNl5qZqln9
 i2It8fvz1p5bOCyJZrbnNksGeXCCYdhc+tl19o+l1un2lTYDblk6KTo4XzyPGy9LSKsiTVJSU/c
 bHiDY3ilrllcFseuJ1N6INjf7aS++IR01NAzzIaRDv+E658gSc3ZSEjfOvdSulSSZuNRQE1PHpx
 TchJMTUtuRzR4qqu9VC9nZX06GaTAe8mlpai27RYDH/OdkBb/dYFAC1eFK68C0df6Bi2Qsf9pSk
 tCL8PBQeD6mlz9T5s41VPKG2fQuOMlm8MjAT4Jp3FfoGTTxkrC3uF4bNV+bg3EYONQD7rJeSSLG
 Ng5NlhwhiQRYE30KNBzfaLcheaRbEA5ckNinxtPWj3M9RT9l3GxXJDOskm3yUd9+jRsJ3AMkjq+
 r+mGkPpVm/MiGhqMt4eDi2XIbfMzsCCQ+6OcqwEp89Cv7/wp822ZwxbmCOUrSBTTOB+HPHMOv1D
 +DOLOBylfFEiG2tUIpwl1eM4r6gZ1n2/gOqZKUQJG221UvfVrJqdSmc678XONHhwy5uJ+LQb5gr
 ex3YfG/Nsxksm8CiNsMlx4md9Wf0ktlCptT541Ex4XRk5vsK4S9IPaph1yOyPqy22OASEMWdkly
 btSTkodR2Q7Xptw==
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
index 42872f406b2a91b5bc611405cae7ce883fd8ed22..73b606570cce9e551d13e65365a87dc4ce748b13 100644
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
 
@@ -301,6 +303,30 @@ EXPORT_SYMBOL_GPL(ref_tracker_free);
 
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

