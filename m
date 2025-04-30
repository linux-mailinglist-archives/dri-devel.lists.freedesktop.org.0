Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 952AFAA4FA1
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 17:07:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF9BF10E7E1;
	Wed, 30 Apr 2025 15:07:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MSXuD2PK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDD4910E7CC;
 Wed, 30 Apr 2025 15:07:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3EB1FA4AE1C;
 Wed, 30 Apr 2025 15:01:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2A14C4CEE7;
 Wed, 30 Apr 2025 15:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746025627;
 bh=jnlBKJie8sIeQlm8A0Xfcctk6HgKFM10uOFIjHSJE7k=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=MSXuD2PK8yuzpEK1lxSomb/zNOg+RoGHyaCk5buzelFPYi+s7O4VQpBwhs26AiWvL
 zZ4Kj0nyCrU1saexccZ2x7WcEXDxq49VSTRvpXM4Y3bbqqlP9sfM9MQvykx8YFhUwr
 5s6ABRkGNY920tAtLnmQkaMd/eh34LaEpp1tADm3DGGbDaXQW1Fyvy6HqWEnmlx12g
 +1BucqMX0ofN+UMYWVZK5A336Mu5bh03vJjvrCabIgYak2/3/cGlj7YLAVMX5heLN0
 fMNeOLG5dCNvfoaKUCtI2K2h2RFqU0wgncDJL3XQf2iLzhrOo2xyGDqPoQSGz6PiWk
 HEoTtAR3hwbzg==
From: Jeff Layton <jlayton@kernel.org>
Date: Wed, 30 Apr 2025 08:06:51 -0700
Subject: [PATCH v6 05/10] ref_tracker: allow pr_ostream() to print directly
 to a seq_file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-reftrack-dbgfs-v6-5-867c29aff03a@kernel.org>
References: <20250430-reftrack-dbgfs-v6-0-867c29aff03a@kernel.org>
In-Reply-To: <20250430-reftrack-dbgfs-v6-0-867c29aff03a@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2126; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=jnlBKJie8sIeQlm8A0Xfcctk6HgKFM10uOFIjHSJE7k=;
 b=owEBbQKS/ZANAwAIAQAOaEEZVoIVAcsmYgBoEjyTBd35szOPXiAQJ1K7Sn3JUye1X+axt1Ajw
 UWlj/3vSbWJAjMEAAEIAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaBI8kwAKCRAADmhBGVaC
 FZZQEACmu7RHfJdVK64+DbZKtpY1CZTAhoZHbZOAUJk6IWqIOhP7Z8aDxpS0Y43mF6hV7x2HDEO
 SwgoCYM11votmxNyAoOgIV1Bykm/Rs6++nx92eZM3tfAzJZdLP1goUkJh7pTsT6ysg2+ovhhNQV
 T1zEexyCBJmTO4BQXiRC+CIxzeR5obO1weF277irEJXyfBFbqdJHOY36LrLOclWxYXv4llhuZkm
 OkS8V50W+9EUS4SHYr5vxeyXsswDHA28jpmZ4cH2dntxZZKG6pH8n1/R9srcSCSU8rlqD5dfa6p
 phtt9EHEuasBDVqkUCr2W+CK1POwV8TfHT5ZSjRPfdLhhwBnOcFwvjHN5Vv+j0p8VzKYhmhgHgk
 TIbGcOE1/bLiclmCNzyskvOwdnxS1eVqyYb6fQ6NmfZFomyHaKfV16fX0sEmYhFmUiHmTUZMrpD
 PM8TIrQ0oym7N23fpU9fuIs/l7urTLdVwzzhCLUfzkQG2eTlVfZgiJh9Y+f8NDE8msgDcBnaGhp
 N2+RtscjB0JNWCYB9BtOrF9IeCQeMQx/fFtnhOJu0JQPBsv1bx1st/tfTlixW4ge/MV/nfonC7v
 MXgw4fbNEMjdZkbswE3qgNa2W4FJsImW1SGYLoUp1G/bNsElihR1RfBzr35WSWxRUm6pgodW+BP
 K2p0vXa1ek+bkcw==
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
index b6e0a87dd75eddef4d504419c0cf398ea65c19d8..b69c11e83c18c19aaa2dc23f802291d4a7e82a66 100644
--- a/lib/ref_tracker.c
+++ b/lib/ref_tracker.c
@@ -8,6 +8,7 @@
 #include <linux/slab.h>
 #include <linux/stacktrace.h>
 #include <linux/stackdepot.h>
+#include <linux/seq_file.h>
 
 #define REF_TRACKER_STACK_ENTRIES 16
 #define STACK_BUF_SIZE 1024
@@ -70,6 +71,7 @@ struct ostream {
 	void __ostream_printf (*func)(struct ostream *stream, char *fmt, ...);
 	char *prefix;
 	char *buf;
+	struct seq_file *seq;
 	int size, used;
 };
 
@@ -93,6 +95,15 @@ static void __ostream_printf pr_ostream_buf(struct ostream *stream, char *fmt, .
 	stream->used += min(ret, len);
 }
 
+static void __ostream_printf pr_ostream_seq(struct ostream *stream, char *fmt, ...)
+{
+	va_list args;
+
+	va_start(args, fmt);
+	seq_vprintf(stream->seq, fmt, args);
+	va_end(args);
+}
+
 #define pr_ostream(stream, fmt, args...) \
 ({ \
 	struct ostream *_s = (stream); \
@@ -302,6 +313,21 @@ EXPORT_SYMBOL_GPL(ref_tracker_free);
 #ifdef CONFIG_DEBUG_FS
 #include <linux/debugfs.h>
 
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

