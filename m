Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B2571FEF9
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 12:22:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CA9F10E64F;
	Fri,  2 Jun 2023 10:22:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A53F10E64F;
 Fri,  2 Jun 2023 10:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685701326; x=1717237326;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=V829dPDXLt7WqeU+6inlDIEaA7ebMjnZBGRC6GePQ5U=;
 b=Y9ZskJImOqc8HAHxSSauJw2Dl+A+GiRMMT79HRpWGxaNhkU6S5Xk3h8P
 X1EIlSeK9sxqRBrSRGUEFSFrkeHnnXJoYQJqq2tB2duuuVvK9LGtbLVsz
 8sIWeR/Q1RAdKp6cdz+PNGgiOw/6xh/fO/6i3uv83591sz1aNKZ5WSxqC
 XHb6coHI7xCLn/IZ+rYCllVs0rjA1PzcG3kZxp4T4Ke71HP/gVBrXR8Uh
 Ea/MXsKBgqwz/PTwhE8u4ESwtHfUhQeRqZaLx/rFAbGrv8kA4O0cbDdOc
 IxGcgrIcZ1tW8aMndaB7A8UR2rXD1XklqqhOC2AKSJdY6ycSisCHXKTNu Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="358267634"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; d="scan'208";a="358267634"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 03:22:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="707804984"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; d="scan'208";a="707804984"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 03:22:02 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Fri, 02 Jun 2023 12:21:35 +0200
Subject: [PATCH v9 3/4] lib/ref_tracker: add printing to memory buffer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230224-track_gt-v9-3-5b47a33f55d1@intel.com>
References: <20230224-track_gt-v9-0-5b47a33f55d1@intel.com>
In-Reply-To: <20230224-track_gt-v9-0-5b47a33f55d1@intel.com>
To: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>
X-Mailer: b4 0.12.2
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, netdev@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chris Wilson <chris@chris-wilson.co.uk>, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dmitry Vyukov <dvyukov@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Similar to stack_(depot|trace)_snprint the patch
adds helper to printing stats to memory buffer.
It will be helpful in case of debugfs.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Eric Dumazet <edumazet@google.com>
---
 include/linux/ref_tracker.h |  8 +++++++
 lib/ref_tracker.c           | 56 ++++++++++++++++++++++++++++++++++++++-------
 2 files changed, 56 insertions(+), 8 deletions(-)

diff --git a/include/linux/ref_tracker.h b/include/linux/ref_tracker.h
index 19a69e7809d6c1..8eac4f3d52547c 100644
--- a/include/linux/ref_tracker.h
+++ b/include/linux/ref_tracker.h
@@ -46,6 +46,8 @@ void ref_tracker_dir_print_locked(struct ref_tracker_dir *dir,
 void ref_tracker_dir_print(struct ref_tracker_dir *dir,
 			   unsigned int display_limit);
 
+int ref_tracker_dir_snprint(struct ref_tracker_dir *dir, char *buf, size_t size);
+
 int ref_tracker_alloc(struct ref_tracker_dir *dir,
 		      struct ref_tracker **trackerp, gfp_t gfp);
 
@@ -74,6 +76,12 @@ static inline void ref_tracker_dir_print(struct ref_tracker_dir *dir,
 {
 }
 
+static inline int ref_tracker_dir_snprint(struct ref_tracker_dir *dir,
+					  char *buf, size_t size)
+{
+	return 0;
+}
+
 static inline int ref_tracker_alloc(struct ref_tracker_dir *dir,
 				    struct ref_tracker **trackerp,
 				    gfp_t gfp)
diff --git a/lib/ref_tracker.c b/lib/ref_tracker.c
index 2ffe79c90c1771..cce4614b07940f 100644
--- a/lib/ref_tracker.c
+++ b/lib/ref_tracker.c
@@ -62,8 +62,27 @@ ref_tracker_get_stats(struct ref_tracker_dir *dir, unsigned int limit)
 	return stats;
 }
 
-void ref_tracker_dir_print_locked(struct ref_tracker_dir *dir,
-				  unsigned int display_limit)
+struct ostream {
+	char *buf;
+	int size, used;
+};
+
+#define pr_ostream(stream, fmt, args...) \
+({ \
+	struct ostream *_s = (stream); \
+\
+	if (!_s->buf) { \
+		pr_err(fmt, ##args); \
+	} else { \
+		int ret, len = _s->size - _s->used; \
+		ret = snprintf(_s->buf + _s->used, len, pr_fmt(fmt), ##args); \
+		_s->used += min(ret, len); \
+	} \
+})
+
+static void
+__ref_tracker_dir_pr_ostream(struct ref_tracker_dir *dir,
+			     unsigned int display_limit, struct ostream *s)
 {
 	struct ref_tracker_dir_stats *stats;
 	unsigned int i = 0, skipped;
@@ -77,8 +96,8 @@ void ref_tracker_dir_print_locked(struct ref_tracker_dir *dir,
 
 	stats = ref_tracker_get_stats(dir, display_limit);
 	if (IS_ERR(stats)) {
-		pr_err("%s@%pK: couldn't get stats, error %pe\n",
-		       dir->name, dir, stats);
+		pr_ostream(s, "%s@%pK: couldn't get stats, error %pe\n",
+			   dir->name, dir, stats);
 		return;
 	}
 
@@ -88,19 +107,27 @@ void ref_tracker_dir_print_locked(struct ref_tracker_dir *dir,
 		stack = stats->stacks[i].stack_handle;
 		if (sbuf && !stack_depot_snprint(stack, sbuf, STACK_BUF_SIZE, 4))
 			sbuf[0] = 0;
-		pr_err("%s@%pK has %d/%d users at\n%s\n", dir->name, dir,
-		       stats->stacks[i].count, stats->total, sbuf);
+		pr_ostream(s, "%s@%pK has %d/%d users at\n%s\n", dir->name, dir,
+			   stats->stacks[i].count, stats->total, sbuf);
 		skipped -= stats->stacks[i].count;
 	}
 
 	if (skipped)
-		pr_err("%s@%pK skipped reports about %d/%d users.\n",
-		       dir->name, dir, skipped, stats->total);
+		pr_ostream(s, "%s@%pK skipped reports about %d/%d users.\n",
+			   dir->name, dir, skipped, stats->total);
 
 	kfree(sbuf);
 
 	kfree(stats);
 }
+
+void ref_tracker_dir_print_locked(struct ref_tracker_dir *dir,
+				  unsigned int display_limit)
+{
+	struct ostream os = {};
+
+	__ref_tracker_dir_pr_ostream(dir, display_limit, &os);
+}
 EXPORT_SYMBOL(ref_tracker_dir_print_locked);
 
 void ref_tracker_dir_print(struct ref_tracker_dir *dir,
@@ -114,6 +141,19 @@ void ref_tracker_dir_print(struct ref_tracker_dir *dir,
 }
 EXPORT_SYMBOL(ref_tracker_dir_print);
 
+int ref_tracker_dir_snprint(struct ref_tracker_dir *dir, char *buf, size_t size)
+{
+	struct ostream os = { .buf = buf, .size = size };
+	unsigned long flags;
+
+	spin_lock_irqsave(&dir->lock, flags);
+	__ref_tracker_dir_pr_ostream(dir, 16, &os);
+	spin_unlock_irqrestore(&dir->lock, flags);
+
+	return os.used;
+}
+EXPORT_SYMBOL(ref_tracker_dir_snprint);
+
 void ref_tracker_dir_exit(struct ref_tracker_dir *dir)
 {
 	struct ref_tracker *tracker, *n;

-- 
2.34.1

