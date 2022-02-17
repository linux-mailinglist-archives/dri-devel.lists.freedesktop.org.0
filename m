Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDDB4BA269
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 15:05:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E531010EB8D;
	Thu, 17 Feb 2022 14:05:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E89610EB84;
 Thu, 17 Feb 2022 14:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645106709; x=1676642709;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pUuimvezQ3JaPbwU/OO8a8pmkIn4yGNg2mdyK8ncgME=;
 b=i7DMPZ7PV9R5TGoyDSIeawdzVSeHUaRfrjpd+vunpz5pzyjGt+I4sFHA
 9qDGW8Nn0mCzFYCWBy1e1/pvf2SMzk8y4mIuS6WS34z9rKXrdoE3pCC6Q
 4XKAaK/LheoWz9jUFXbMpJgSI8ov7ejr+n+ZSefckdfjLbXD3KJ3faZyB
 wJMBqUtwKvhUoxatWt2qSdxB9V7KYs2clor6UzzFi+bOueWcLrRx2sWn7
 vRBel2Dea2PV3/X/1wxjHy7TSdxc2HQ9Q8yr9PZ7f/LoX/1AMMMul5pio
 s0jIliAh/KXbGU8bkqye/+mOOB4Ua7llqgVtkfMTObWVYHqRbNB7UjGFO g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="230840837"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="230840837"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 06:05:09 -0800
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="530241244"
Received: from lab-ah.igk.intel.com ([10.91.215.196])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 06:05:06 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, netdev <netdev@vger.kernel.org>
Subject: [PATCH 4/9] lib/ref_tracker: add printing to memory buffer
Date: Thu, 17 Feb 2022 15:04:36 +0100
Message-Id: <20220217140441.1218045-5-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220217140441.1218045-1-andrzej.hajda@intel.com>
References: <20220217140441.1218045-1-andrzej.hajda@intel.com>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In case one wants to show stats via debugfs.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Chris Wilson <chris.p.wilson@intel.com>
---
 include/linux/ref_tracker.h |  8 ++++++
 lib/ref_tracker.c           | 52 ++++++++++++++++++++++++++++++++-----
 2 files changed, 54 insertions(+), 6 deletions(-)

diff --git a/include/linux/ref_tracker.h b/include/linux/ref_tracker.h
index 090230e5b485d..6d2634590ee5a 100644
--- a/include/linux/ref_tracker.h
+++ b/include/linux/ref_tracker.h
@@ -46,6 +46,8 @@ void __ref_tracker_dir_print(struct ref_tracker_dir *dir,
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
index 943cff08110e3..7b00bca300043 100644
--- a/lib/ref_tracker.c
+++ b/lib/ref_tracker.c
@@ -27,8 +27,27 @@ static int ref_tracker_cmp(void *priv, const struct list_head *a, const struct l
 	return ta->alloc_stack_handle - tb->alloc_stack_handle;
 }
 
-void __ref_tracker_dir_print(struct ref_tracker_dir *dir,
-			   unsigned int display_limit)
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
 	unsigned int i = 0, count = 0, total = 0;
 	struct ref_tracker *tracker;
@@ -58,16 +77,24 @@ void __ref_tracker_dir_print(struct ref_tracker_dir *dir,
 
 		if (sbuf && !stack_depot_snprint(stack, sbuf, STACK_BUF_SIZE, 4))
 			sbuf[0] = 0;
-		pr_err("%s@%pK has %d/%d users at\n%s\n",
-		       dir->name, dir, count, total, sbuf);
+		pr_ostream(s, "%s@%pK has %d/%d users at\n%s\n",
+			   dir->name, dir, count, total, sbuf);
 		count = 0;
 	}
 	if (i > display_limit)
-		pr_err("%s@%pK skipped %d/%d reports with %d unique stacks.\n",
-		       dir->name, dir, count, total, i - display_limit);
+		pr_ostream(s, "%s@%pK skipped %d/%d reports with %d unique stacks.\n",
+			   dir->name, dir, count, total, i - display_limit);
 
 	kfree(sbuf);
 }
+
+void __ref_tracker_dir_print(struct ref_tracker_dir *dir,
+			   unsigned int display_limit)
+{
+	struct ostream os = {};
+
+	__ref_tracker_dir_pr_ostream(dir, display_limit, &os);
+}
 EXPORT_SYMBOL(__ref_tracker_dir_print);
 
 void ref_tracker_dir_print(struct ref_tracker_dir *dir,
@@ -81,6 +108,19 @@ void ref_tracker_dir_print(struct ref_tracker_dir *dir,
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
2.25.1

