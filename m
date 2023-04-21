Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 739266EA937
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 13:35:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73B2010EDED;
	Fri, 21 Apr 2023 11:35:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23E8D10E313;
 Fri, 21 Apr 2023 11:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682076929; x=1713612929;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=M1WvzpZ5kIn6LF/S+fHg9iMRDVGNcxSRHktOcS2+YUM=;
 b=UN5ISHjP6aR8cDxTY5/VPLheDLbK+SHSSltrWMYOPfjBnq+536yVI4Vd
 EUsD5Dt6fuTSi1DaKZzNYZNxUplStpQbWMSDwmkz920bQutYno2ZbX5Bl
 HasR/u+iD8+Y3OZ1WaAAvIHkgmTi9NUSPdkX+W83wl5t09eJz4rcU6jJG
 4ZkUaue4vHIXfEKvHIN2PG9+b+efZN8Ui0FNV1GZtxDRpqVVeJn6TkBY6
 PmOBnq7oN3snidSwwg9uUBbHkwI2ehZmMLel/tuqr9T6PizbkdKK0qnZn
 7CvHMCQLdvDISfPkV9uVOUe6I6nyFDHAMPN/LPHRHNHE2v4In5pPQcnOe g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="432249888"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="432249888"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 04:35:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="642489659"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="642489659"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 04:35:25 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Fri, 21 Apr 2023 13:35:06 +0200
Subject: [PATCH v7 3/7] lib/ref_tracker: add printing to memory buffer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230224-track_gt-v7-3-11f08358c1ec@intel.com>
References: <20230224-track_gt-v7-0-11f08358c1ec@intel.com>
In-Reply-To: <20230224-track_gt-v7-0-11f08358c1ec@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.11.1
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, netdev@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Eric Dumazet <edumazet@google.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Dmitry Vyukov <dvyukov@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Similar to stack_(depot|trace)_snprint the patch
adds helper to printing stats to memory buffer.
It will be helpful in case of debugfs.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 include/linux/ref_tracker.h |  8 +++++++
 lib/ref_tracker.c           | 56 ++++++++++++++++++++++++++++++++++++++-------
 2 files changed, 56 insertions(+), 8 deletions(-)

diff --git a/include/linux/ref_tracker.h b/include/linux/ref_tracker.h
index fc9ef9952f01fd..4cd260efc4023f 100644
--- a/include/linux/ref_tracker.h
+++ b/include/linux/ref_tracker.h
@@ -50,6 +50,8 @@ void ref_tracker_dir_print_locked(struct ref_tracker_dir *dir,
 void ref_tracker_dir_print(struct ref_tracker_dir *dir,
 			   unsigned int display_limit);
 
+int ref_tracker_dir_snprint(struct ref_tracker_dir *dir, char *buf, size_t size);
+
 int ref_tracker_alloc(struct ref_tracker_dir *dir,
 		      struct ref_tracker **trackerp, gfp_t gfp);
 
@@ -78,6 +80,12 @@ static inline void ref_tracker_dir_print(struct ref_tracker_dir *dir,
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
