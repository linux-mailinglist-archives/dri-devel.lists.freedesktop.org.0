Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 584281F1387
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jun 2020 09:22:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEA266E49D;
	Mon,  8 Jun 2020 07:21:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E43289E05
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jun 2020 00:58:02 +0000 (UTC)
Received: from [5.158.153.53] (helo=debian-buster-darwi.lab.linutronix.de.)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.80) (envelope-from <a.darwish@linutronix.de>)
 id 1ji66t-0000mQ-7v; Mon, 08 Jun 2020 02:57:55 +0200
From: "Ahmed S. Darwish" <a.darwish@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>
Subject: [PATCH v2 05/18] dma-buf: Remove custom seqcount lockdep class key
Date: Mon,  8 Jun 2020 02:57:16 +0200
Message-Id: <20200608005729.1874024-6-a.darwish@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200608005729.1874024-1-a.darwish@linutronix.de>
References: <20200519214547.352050-1-a.darwish@linutronix.de>
 <20200608005729.1874024-1-a.darwish@linutronix.de>
MIME-Version: 1.0
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
X-Mailman-Approved-At: Mon, 08 Jun 2020 07:21:26 +0000
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
Cc: "Paul E. McKenney" <paulmck@kernel.org>, David Airlie <airlied@linux.ie>,
 "Sebastian A. Siewior" <bigeasy@linutronix.de>,
 LKML <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 dri-devel@lists.freedesktop.org, "Ahmed S. Darwish" <a.darwish@linutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 3c3b177a9369 ("reservation: add support for read-only access
using rcu") introduced a sequence counter to manage updates to
reservations. Back then, the reservation object initializer
reservation_object_init() was always inlined.

Having the sequence counter initialization inlined meant that each of
the call sites would have a different lockdep class key, which would've
broken lockdep's deadlock detection. The aforementioned commit thus
introduced, and exported, a custom seqcount lockdep class key and name.

The commit 8735f16803f00 ("dma-buf: cleanup reservation_object_init...")
transformed the reservation object initializer to a normal non-inlined C
function. seqcount_init(), which automatically defines the seqcount
lockdep class key and must be called non-inlined, can now be safely used.

Remove the seqcount custom lockdep class key, name, and export. Use
seqcount_init() inside the dma reservation object initializer.

Signed-off-by: Ahmed S. Darwish <a.darwish@linutronix.de>
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/dma-buf/dma-resv.c | 9 +--------
 include/linux/dma-resv.h   | 2 --
 2 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 4264e64788c4..590ce7ad60a0 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -50,12 +50,6 @@
 DEFINE_WD_CLASS(reservation_ww_class);
 EXPORT_SYMBOL(reservation_ww_class);
 
-struct lock_class_key reservation_seqcount_class;
-EXPORT_SYMBOL(reservation_seqcount_class);
-
-const char reservation_seqcount_string[] = "reservation_seqcount";
-EXPORT_SYMBOL(reservation_seqcount_string);
-
 /**
  * dma_resv_list_alloc - allocate fence list
  * @shared_max: number of fences we need space for
@@ -134,9 +128,8 @@ subsys_initcall(dma_resv_lockdep);
 void dma_resv_init(struct dma_resv *obj)
 {
 	ww_mutex_init(&obj->lock, &reservation_ww_class);
+	seqcount_init(&obj->seq);
 
-	__seqcount_init(&obj->seq, reservation_seqcount_string,
-			&reservation_seqcount_class);
 	RCU_INIT_POINTER(obj->fence, NULL);
 	RCU_INIT_POINTER(obj->fence_excl, NULL);
 }
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index ee50d10f052b..a6538ae7d93f 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -46,8 +46,6 @@
 #include <linux/rcupdate.h>
 
 extern struct ww_class reservation_ww_class;
-extern struct lock_class_key reservation_seqcount_class;
-extern const char reservation_seqcount_string[];
 
 /**
  * struct dma_resv_list - a list of shared fences
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
