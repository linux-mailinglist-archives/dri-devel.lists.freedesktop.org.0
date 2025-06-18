Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA545ADEF29
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 16:24:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2FF010E869;
	Wed, 18 Jun 2025 14:24:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EXVmfRCE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B4E210E865;
 Wed, 18 Jun 2025 14:24:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9C33A629CE;
 Wed, 18 Jun 2025 14:24:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93906C4CEF1;
 Wed, 18 Jun 2025 14:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750256674;
 bh=TA7LFTdMJDELDuvkJuuGw4yjXy1LcM/cr6YWykJIBfY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=EXVmfRCEe75EfEO/SwkPEi4OUtOICZ050/9gxKCJsLQ/RxZRnZqpbEy6MGx9TSLnb
 yK11VHDk+Zyvpe0n0h3qBj0f/fBFSiA9uA8GW25XHhWxvpwC4YbUop5flsdjInAoam
 XMwIkJfV5Zt6MV6PB15J2X59QhPYdY4ii99fMkDEiZmXFIL0vgeFZAGDP7C7auF10n
 tHo+6tDS17rbziZlA017mKxzE3A0hDFxD1di2UguS5JINfaubAin8JiXe4BWdAMgqK
 MAU3WEFoMXVcR0ZtTrqKMuxr9ls05lutTTdFWLmYrUxkvsvyno3v9dKWCi58S40COF
 8iObWd8CCnyAw==
From: Jeff Layton <jlayton@kernel.org>
Date: Wed, 18 Jun 2025 10:24:16 -0400
Subject: [PATCH v15 3/9] ref_tracker: have callers pass output function to
 pr_ostream()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-reftrack-dbgfs-v15-3-24fc37ead144@kernel.org>
References: <20250618-reftrack-dbgfs-v15-0-24fc37ead144@kernel.org>
In-Reply-To: <20250618-reftrack-dbgfs-v15-0-24fc37ead144@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4259; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=TA7LFTdMJDELDuvkJuuGw4yjXy1LcM/cr6YWykJIBfY=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBoUswYC3PjND5zsui+FPDgJZkVbec0YVTSqyBVr
 aq+m3a05PWJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaFLMGAAKCRAADmhBGVaC
 FZNrD/oD43RjStG7CUWz/ml4Qs1sGnDJMCn3/aPYYnRlqaO+znMLcanXMAxIh0uNlj8cjMq3dQ0
 snLpf6nGAmZa2QhcYZZhs1NPG3b7bdtA3YLbtvYLf2kY2Ey7bXNeCvfcjlbOXzfnqwpkC0VHzsC
 jc5Vc44nx1uza6CBGYjvrDDmvg1AY2U1sq9NVMlrW5K18+kR9uQyz0rMPEbaUILHhXzdi9LXQbF
 Av+NZfVUYZprKOYmxSLSEf2bK7vyMB5WDO1VOMOJeTKm8rTL+Nz88G0Sq8sATjVlI1j9EyLo4Rz
 nUyLk8E2Yr0TFMNpSynw1TE5mHwlxp2ESeAsjcewC1p2x4nhA+cb6AEtiiWJ1L6YENGZGFCEz36
 pfEnVvT0AqtRjfo4XzqRvWN1w7F2rPTdrabBjw82BeJ+SzTOoC5JChY9LOvjlF/lcseA9uDxsT2
 L1CVCBhd8srwPuDzQzH5IRwlLEa7bp4RiWrrFnzudauMItnPL6pM+vnIIm2K1gDG7IfzobyBAfX
 qqeOmRZvjfNhqodTGrJFaAc+wL7Pgg2OrWDes8urDBk73REA9UVBSdmexnBLSFW7TjHHBh/aXAT
 opHNunwR1+6lQUgrnmzJ8FlLgsVmdSo+sD8h5Is2VlMhEkaN7AFcm/oQssss82SH08ABQZ9LlNn
 +mSpJvJYJ7+73TA==
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

In a later patch, we'll be adding a 3rd mechanism for outputting
ref_tracker info via seq_file. Instead of a conditional, have the caller
set a pointer to an output function in struct ostream. As part of this,
the log prefix must be explicitly passed in, as it's too late for the
pr_fmt macro.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 include/linux/ref_tracker.h |  2 ++
 lib/ref_tracker.c           | 52 ++++++++++++++++++++++++++++++++-------------
 2 files changed, 39 insertions(+), 15 deletions(-)

diff --git a/include/linux/ref_tracker.h b/include/linux/ref_tracker.h
index 8eac4f3d52547ccbaf9dcd09962ce80d26fbdff8..a0a1ee43724ffa00e60c116be18e481bfe1d1455 100644
--- a/include/linux/ref_tracker.h
+++ b/include/linux/ref_tracker.h
@@ -6,6 +6,8 @@
 #include <linux/spinlock.h>
 #include <linux/stackdepot.h>
 
+#define __ostream_printf __printf(2, 3)
+
 struct ref_tracker;
 
 struct ref_tracker_dir {
diff --git a/lib/ref_tracker.c b/lib/ref_tracker.c
index d374e5273e1497cac0d70c02c282baa2c3ab63fe..42872f406b2a91b5bc611405cae7ce883fd8ed22 100644
--- a/lib/ref_tracker.c
+++ b/lib/ref_tracker.c
@@ -63,21 +63,38 @@ ref_tracker_get_stats(struct ref_tracker_dir *dir, unsigned int limit)
 }
 
 struct ostream {
+	void __ostream_printf (*func)(struct ostream *stream, char *fmt, ...);
+	char *prefix;
 	char *buf;
 	int size, used;
 };
 
+static void __ostream_printf pr_ostream_log(struct ostream *stream, char *fmt, ...)
+{
+	va_list args;
+
+	va_start(args, fmt);
+	vprintk(fmt, args);
+	va_end(args);
+}
+
+static void __ostream_printf pr_ostream_buf(struct ostream *stream, char *fmt, ...)
+{
+	int ret, len = stream->size - stream->used;
+	va_list args;
+
+	va_start(args, fmt);
+	ret = vsnprintf(stream->buf + stream->used, len, fmt, args);
+	va_end(args);
+	if (ret > 0)
+		stream->used += min(ret, len);
+}
+
 #define pr_ostream(stream, fmt, args...) \
 ({ \
 	struct ostream *_s = (stream); \
 \
-	if (!_s->buf) { \
-		pr_err(fmt, ##args); \
-	} else { \
-		int ret, len = _s->size - _s->used; \
-		ret = snprintf(_s->buf + _s->used, len, pr_fmt(fmt), ##args); \
-		_s->used += min(ret, len); \
-	} \
+	_s->func(_s, fmt, ##args); \
 })
 
 static void
@@ -96,8 +113,8 @@ __ref_tracker_dir_pr_ostream(struct ref_tracker_dir *dir,
 
 	stats = ref_tracker_get_stats(dir, display_limit);
 	if (IS_ERR(stats)) {
-		pr_ostream(s, "%s@%p: couldn't get stats, error %pe\n",
-			   dir->name, dir, stats);
+		pr_ostream(s, "%s%s@%p: couldn't get stats, error %pe\n",
+			   s->prefix, dir->name, dir, stats);
 		return;
 	}
 
@@ -107,14 +124,15 @@ __ref_tracker_dir_pr_ostream(struct ref_tracker_dir *dir,
 		stack = stats->stacks[i].stack_handle;
 		if (sbuf && !stack_depot_snprint(stack, sbuf, STACK_BUF_SIZE, 4))
 			sbuf[0] = 0;
-		pr_ostream(s, "%s@%p has %d/%d users at\n%s\n", dir->name, dir,
-			   stats->stacks[i].count, stats->total, sbuf);
+		pr_ostream(s, "%s%s@%p has %d/%d users at\n%s\n", s->prefix,
+			   dir->name, dir, stats->stacks[i].count,
+			   stats->total, sbuf);
 		skipped -= stats->stacks[i].count;
 	}
 
 	if (skipped)
-		pr_ostream(s, "%s@%p skipped reports about %d/%d users.\n",
-			   dir->name, dir, skipped, stats->total);
+		pr_ostream(s, "%s%s@%p skipped reports about %d/%d users.\n",
+			   s->prefix, dir->name, dir, skipped, stats->total);
 
 	kfree(sbuf);
 
@@ -124,7 +142,8 @@ __ref_tracker_dir_pr_ostream(struct ref_tracker_dir *dir,
 void ref_tracker_dir_print_locked(struct ref_tracker_dir *dir,
 				  unsigned int display_limit)
 {
-	struct ostream os = {};
+	struct ostream os = { .func = pr_ostream_log,
+			      .prefix = "ref_tracker: " };
 
 	__ref_tracker_dir_pr_ostream(dir, display_limit, &os);
 }
@@ -143,7 +162,10 @@ EXPORT_SYMBOL(ref_tracker_dir_print);
 
 int ref_tracker_dir_snprint(struct ref_tracker_dir *dir, char *buf, size_t size)
 {
-	struct ostream os = { .buf = buf, .size = size };
+	struct ostream os = { .func = pr_ostream_buf,
+			      .prefix = "ref_tracker: ",
+			      .buf = buf,
+			      .size = size };
 	unsigned long flags;
 
 	spin_lock_irqsave(&dir->lock, flags);

-- 
2.49.0

