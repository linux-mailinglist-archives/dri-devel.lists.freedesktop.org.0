Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC94663403B
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 16:35:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C69A410E404;
	Tue, 22 Nov 2022 15:35:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 348DF10E404;
 Tue, 22 Nov 2022 15:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669131306; x=1700667306;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Lk7Aa8ZXFKY55rSbLTJ7BLbpsyJEXtHLhmH5NxdPyRU=;
 b=RwXPn4zJ/31wY7HVij9mAK0VJj5b8MqU7RclIZcXrrG8S8jIl7HDg5k7
 OEXjgKobrnUdvKiRsqERY/quh7Othf9Ovz/CNLDrOOGZ1ZAZbxcukxpm8
 kYiEV02T1TLSad9eDmmzP+4Xad8gbUQBipA/r0lQogov8v7wPuZAxyHh8
 kXWKGAA+JtuCduaBK587Bov3JiJbDgDB/1LNv0dcM/Eb1//CyeaJYzax5
 gmX9Rk8gRwH2sBQzTi9q0coSdtouFUOUouvo3stC5I32Tu3aFBLe/UbA4
 34ttLSmEB6agmwt8pldX3bd0HcIf7PEQrPZ1E5VPhzNYflChKILSDntet w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="400132173"
X-IronPort-AV: E=Sophos;i="5.96,184,1665471600"; d="scan'208";a="400132173"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 07:35:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="730435563"
X-IronPort-AV: E=Sophos;i="5.96,184,1665471600"; d="scan'208";a="730435563"
Received: from black.fi.intel.com ([10.237.72.28])
 by FMSMGA003.fm.intel.com with ESMTP; 22 Nov 2022 07:35:00 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 4560E128; Tue, 22 Nov 2022 17:35:26 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jakob Koschel <jakobkoschel@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v3 1/4] i915: Move list_count() to list.h for broader use
Date: Tue, 22 Nov 2022 17:35:13 +0200
Message-Id: <20221122153516.52577-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Kevin Cernekee <cernekee@gmail.com>, Mathias Nyman <mathias.nyman@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Hans de Goede <hdegoede@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some of the existing users, and definitely will be new ones, want to
count existing nodes in the list. Provide a generic API for that by
moving code from i915 to list.h.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
---
v3: added tag (Jani), changed to be static inline (Mike)
v2: dropped the duplicate code in i915 (LKP)
 drivers/gpu/drm/i915/gt/intel_engine_cs.c | 13 +------------
 include/linux/list.h                      | 15 +++++++++++++++
 2 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 6ae8b07cfaa1..b5d474be564d 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -2085,17 +2085,6 @@ static void print_request_ring(struct drm_printer *m, struct i915_request *rq)
 	}
 }
 
-static unsigned long list_count(struct list_head *list)
-{
-	struct list_head *pos;
-	unsigned long count = 0;
-
-	list_for_each(pos, list)
-		count++;
-
-	return count;
-}
-
 static unsigned long read_ul(void *p, size_t x)
 {
 	return *(unsigned long *)(p + x);
@@ -2270,7 +2259,7 @@ void intel_engine_dump(struct intel_engine_cs *engine,
 	spin_lock_irqsave(&engine->sched_engine->lock, flags);
 	engine_dump_active_requests(engine, m);
 
-	drm_printf(m, "\tOn hold?: %lu\n",
+	drm_printf(m, "\tOn hold?: %zu\n",
 		   list_count(&engine->sched_engine->hold));
 	spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
 
diff --git a/include/linux/list.h b/include/linux/list.h
index 61762054b4be..65aab596ae33 100644
--- a/include/linux/list.h
+++ b/include/linux/list.h
@@ -655,6 +655,21 @@ static inline void list_splice_tail_init(struct list_head *list,
 	     !list_is_head(pos, (head)); \
 	     pos = n, n = pos->prev)
 
+/**
+ * list_count - count nodes in the list
+ * @head:	the head for your list.
+ */
+size_t list_count(struct list_head *head)
+{
+	struct list_head *pos;
+	size_t count = 0;
+
+	list_for_each(pos, head)
+		count++;
+
+	return count;
+}
+
 /**
  * list_entry_is_head - test if the entry points to the head of the list
  * @pos:	the type * to cursor
-- 
2.35.1

