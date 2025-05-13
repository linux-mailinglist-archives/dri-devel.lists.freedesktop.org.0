Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 847D9AB521B
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 12:23:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F01E810E57D;
	Tue, 13 May 2025 10:23:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id F40D110E564
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 10:23:22 +0000 (UTC)
X-AuditID: a67dfc5b-681ff7000002311f-ce-682319f1987d
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Cc: kernel_team@skhynix.com, torvalds@linux-foundation.org,
 damien.lemoal@opensource.wdc.com, linux-ide@vger.kernel.org,
 adilger.kernel@dilger.ca, linux-ext4@vger.kernel.org, mingo@redhat.com,
 peterz@infradead.org, will@kernel.org, tglx@linutronix.de,
 rostedt@goodmis.org, joel@joelfernandes.org, sashal@kernel.org,
 daniel.vetter@ffwll.ch, duyuyang@gmail.com, johannes.berg@intel.com,
 tj@kernel.org, tytso@mit.edu, willy@infradead.org, david@fromorbit.com,
 amir73il@gmail.com, gregkh@linuxfoundation.org, kernel-team@lge.com,
 linux-mm@kvack.org, akpm@linux-foundation.org, mhocko@kernel.org,
 minchan@kernel.org, hannes@cmpxchg.org, vdavydov.dev@gmail.com,
 sj@kernel.org, jglisse@redhat.com, dennis@kernel.org, cl@linux.com,
 penberg@kernel.org, rientjes@google.com, vbabka@suse.cz, ngupta@vflare.org,
 linux-block@vger.kernel.org, josef@toxicpanda.com,
 linux-fsdevel@vger.kernel.org, jack@suse.cz, jlayton@kernel.org,
 dan.j.williams@intel.com, hch@infradead.org, djwong@kernel.org,
 dri-devel@lists.freedesktop.org, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, hamohammed.sa@gmail.com, harry.yoo@oracle.com,
 chris.p.wilson@intel.com, gwan-gyeong.mun@intel.com,
 max.byungchul.park@gmail.com, boqun.feng@gmail.com, longman@redhat.com,
 yskelg@gmail.com, yunseong.kim@ericsson.com, yeoreum.yun@arm.com,
 netdev@vger.kernel.org, matthew.brost@intel.com, her0gyugyu@gmail.com
Subject: [PATCH v15 33/43] dept: assign unique dept_key to each distinct dma
 fence caller
Date: Tue, 13 May 2025 19:07:20 +0900
Message-Id: <20250513100730.12664-34-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250513100730.12664-1-byungchul@sk.com>
References: <20250513100730.12664-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0yTZxTHfZ732mrNa+fkRY1KhZCAol28nA9qTMyyN0YTE5cYxVuVN7QT
 qmkBZQuGykUBIYjWRimsoFaEIlgw4hSGECqMgFWwAkNE4nQNt1htFQtqwfjl5Jf/P+d3vhyW
 kDuohaxGmyDqtKo4BS0lpaNzSlZ6gperVxd/mAfe92dIMFfZaHDerEBgqzVgcLf8As98Iwj8
 HY8IMBmdCEpePieg1jGAoL7sFA1dr+ZCt3echjZjDg1pV6poeDw8iaH/YgGGCvt2eGF9TUJ7
 fikGk5uGQlMaDoz/MUxYyxmwpobBUNllBiZfKqFtwEVBfV8kXCrup+F+fRsJjrohDF1/mWkY
 sH2hoN3RSoIvbxE4z+VSUDlWSsOwz0qA1TvOwJNGCwaHZQFUpweEme8+U/AwtxFD5tVbGLp7
 7yFoODOIwW5z0dDsHcFQYzcS8Ol6C4KhvFEGMs5OMFBoyEOQk3GRhPT+teD/GLhc9F4Jhj+r
 SaiccqHNGwVbsQ0JzSPjhJBec1z45H1KC/U+Cyn8U8oLdy8/Z4T0hj5GsNgThZqyCOHKfTcW
 SjxeSrCXZ9GC3VPACNmj3VgY6+xkdizeI90QI8ZpkkTdqk0Hpeobvj+ONSlPuB4ayFQ0Fp6N
 JCzPreGH3a3Ed3b1e5hpprlwvqdnYiafzy3ja3JfU9lIyhKcazb/rKgXTRc/cLv5zFujM0xy
 YXxO82MyG7GsjFvHtz8J++ZcyldUN854JIF46nonOc1ybi2fb6kgp508d17Cp30sRN8WgvkH
 ZT1kPpJZ0KxyJNdok+JVmrg1UepkreZE1OGj8XYU+C5rymR0HfI4dzYhjkWKObJWd4haTqmS
 9MnxTYhnCcV8meFOIJLFqJJ/F3VHD+gS40R9E1rEkoog2U++4zFyLlaVIB4RxWOi7nuLWcnC
 VLQ+NfjfzF8bi/asCOXGjCGrfj64+U1x0KBxid7fcW/TMuMH99l8WaQ1usj0oA+H+3uDWrQF
 1oRLTm3O4hX+k1NbJVGfI8wnEw+ZL1wL3f8mdGJ9V6y5r/m/4GQ0sGVy0KusSskYzNqm3lv3
 949Zp023M6h9u1rbd1GKWSlq3PF23W8KUq9WKSMInV71FUI3GwZZAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0hTcRjG+5+7q9nBRp0mUc5GYGUKKW90JawORVHR/UO56tTmZdVWlkXk
 coppml3MbrOlMc3NS1ugXWaykbUsM7VpsqxJRJIXMjeytJpFX15+PA/8ni8vg4eUkVJGpT4s
 aNSKJBklIkTrFqbP/To1XBnV4ogF31AWATeqLBQ0V5oRWO7pMOh5sgra/b0Ifr58hUNhQTOC
 W953ONxr6EJgLztNQevHYGjzDVDgKsihIL2kioLXX0Yw8Fy+gIHZuhbemz4R0JhfjEFhDwXX
 C9OxwPmMwbCpnAZTmhy6y67RMOKNBleXmwSnwUWCvXM2XC3yUPDI7iKgobYbg9YHNyjosvwm
 obHhGQH+vFBoPp9LQkV/MQVf/CYcTL4BGlrqjRg0GCdDtT5gzfz2i4SnufUYZN6+i0Hb24cI
 6rI+YGC1uClw+noxsFkLcPhR+gRBd14fDRlnh2m4rstDkJNxmQC9JwZ+fg8sG4aiQXezmoCK
 UTdatoS3FFkQ7+wdwHm97Sj/w/eG4u1+I8E/L+b4+9fe0by+rpPmjdYjvK0sgi951IPxtwZ9
 JG8tP0Px1sELNJ/d14bx/U1N9PppO0SL9gpJqhRBM29JvEh5x3/ioCP6mPupjkhD/bOyURDD
 sfM5t2eQHmOKncV1dAzjYyxhZ3C23E9kNhIxOOsez7Ub3qKxYhK7ncu82/eXCVbO5ThfE9mI
 YcRsLNfYIv/nnM6Zq+v/eoIC8WhpEzHGIWwMl280E/lIZETjypFEpU5JVqiSYiK1icpUtepY
 5J4DyVYU+B/TyZHztWiodZUDsQySTRA/6wlThpCKFG1qsgNxDC6TiHU1gUi8V5F6XNAc2KU5
 kiRoHSiUIWRTxKu3CvEh7H7FYSFREA4Kmv8txgRJ01BCcORSbFOcdP5nb16oY/OGKG0Jad+2
 MkxteBGXWuuqjKuRnohSJPwqWeDNCF98yZry3vNxGDaNjqwplU61xSz7NrFofeLM4NyqrE5S
 /mBj+LTthx7b5UEnj3t3XqwRP8/f/d1Q0bLx6JWw0C0L9QZzx5zl5zqckvhTCfs6uwx1KyQy
 QqtUREfgGq3iDxGf1bk7AwAA
X-CFilter-Loop: Reflected
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

dma fence can be used at various points in the code and it's very hard
to distinguish dma fences between different usages.  Using a single
dept_key for all the dma fences could trigger false positive reports.

Assign unique dept_key to each distinct dma fence wait to avoid false
positive reports.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 drivers/dma-buf/dma-fence.c | 12 +++---
 include/linux/dma-fence.h   | 74 +++++++++++++++++++++++++++++--------
 2 files changed, 65 insertions(+), 21 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index a45e5416f2dd..5215ac4eecfb 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -499,7 +499,7 @@ EXPORT_SYMBOL(dma_fence_signal);
  * See also dma_fence_wait() and dma_fence_wait_any_timeout().
  */
 signed long
-dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long timeout)
+__dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long timeout)
 {
 	signed long ret;
 
@@ -520,7 +520,7 @@ dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long timeout)
 	trace_dma_fence_wait_end(fence);
 	return ret;
 }
-EXPORT_SYMBOL(dma_fence_wait_timeout);
+EXPORT_SYMBOL(__dma_fence_wait_timeout);
 
 /**
  * dma_fence_release - default release function for fences
@@ -759,7 +759,7 @@ dma_fence_default_wait_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
  * functions taking a jiffies timeout.
  */
 signed long
-dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
+__dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
 {
 	struct default_wait_cb cb;
 	unsigned long flags;
@@ -808,7 +808,7 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
 	spin_unlock_irqrestore(fence->lock, flags);
 	return ret;
 }
-EXPORT_SYMBOL(dma_fence_default_wait);
+EXPORT_SYMBOL(__dma_fence_default_wait);
 
 static bool
 dma_fence_test_signaled_any(struct dma_fence **fences, uint32_t count,
@@ -848,7 +848,7 @@ dma_fence_test_signaled_any(struct dma_fence **fences, uint32_t count,
  * See also dma_fence_wait() and dma_fence_wait_timeout().
  */
 signed long
-dma_fence_wait_any_timeout(struct dma_fence **fences, uint32_t count,
+__dma_fence_wait_any_timeout(struct dma_fence **fences, uint32_t count,
 			   bool intr, signed long timeout, uint32_t *idx)
 {
 	struct default_wait_cb *cb;
@@ -916,7 +916,7 @@ dma_fence_wait_any_timeout(struct dma_fence **fences, uint32_t count,
 
 	return ret;
 }
-EXPORT_SYMBOL(dma_fence_wait_any_timeout);
+EXPORT_SYMBOL(__dma_fence_wait_any_timeout);
 
 /**
  * DOC: deadline hints
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index e7ad819962e3..d7dc7dcd213f 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -393,8 +393,22 @@ int dma_fence_signal_locked(struct dma_fence *fence);
 int dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t timestamp);
 int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
 				      ktime_t timestamp);
-signed long dma_fence_default_wait(struct dma_fence *fence,
+signed long __dma_fence_default_wait(struct dma_fence *fence,
 				   bool intr, signed long timeout);
+
+/*
+ * Associate every caller with its own dept map.
+ */
+#define dma_fence_default_wait(f, intr, t)				\
+({									\
+	signed long __ret;						\
+									\
+	sdt_might_sleep_start_timeout(NULL, t);				\
+	__ret = __dma_fence_default_wait(f, intr, t);			\
+	sdt_might_sleep_end();						\
+	__ret;								\
+})
+
 int dma_fence_add_callback(struct dma_fence *fence,
 			   struct dma_fence_cb *cb,
 			   dma_fence_func_t func);
@@ -609,12 +623,37 @@ static inline ktime_t dma_fence_timestamp(struct dma_fence *fence)
 	return fence->timestamp;
 }
 
-signed long dma_fence_wait_timeout(struct dma_fence *,
+signed long __dma_fence_wait_timeout(struct dma_fence *,
 				   bool intr, signed long timeout);
-signed long dma_fence_wait_any_timeout(struct dma_fence **fences,
+signed long __dma_fence_wait_any_timeout(struct dma_fence **fences,
 				       uint32_t count,
 				       bool intr, signed long timeout,
 				       uint32_t *idx);
+/*
+ * Associate every caller with its own dept map.
+ */
+#define dma_fence_wait_timeout(f, intr, t)				\
+({									\
+	signed long __ret;						\
+									\
+	sdt_might_sleep_start_timeout(NULL, t);				\
+	__ret = __dma_fence_wait_timeout(f, intr, t);			\
+	sdt_might_sleep_end();						\
+	__ret;								\
+})
+
+/*
+ * Associate every caller with its own dept map.
+ */
+#define dma_fence_wait_any_timeout(fpp, count, intr, t, idx)		\
+({									\
+	signed long __ret;						\
+									\
+	sdt_might_sleep_start_timeout(NULL, t);				\
+	__ret = __dma_fence_wait_any_timeout(fpp, count, intr, t, idx);	\
+	sdt_might_sleep_end();						\
+	__ret;								\
+})
 
 /**
  * dma_fence_wait - sleep until the fence gets signaled
@@ -630,19 +669,24 @@ signed long dma_fence_wait_any_timeout(struct dma_fence **fences,
  * fence might be freed before return, resulting in undefined behavior.
  *
  * See also dma_fence_wait_timeout() and dma_fence_wait_any_timeout().
+ *
+ * Associate every caller with its own dept map.
  */
-static inline signed long dma_fence_wait(struct dma_fence *fence, bool intr)
-{
-	signed long ret;
-
-	/* Since dma_fence_wait_timeout cannot timeout with
-	 * MAX_SCHEDULE_TIMEOUT, only valid return values are
-	 * -ERESTARTSYS and MAX_SCHEDULE_TIMEOUT.
-	 */
-	ret = dma_fence_wait_timeout(fence, intr, MAX_SCHEDULE_TIMEOUT);
-
-	return ret < 0 ? ret : 0;
-}
+#define dma_fence_wait(f, intr)						\
+({									\
+	signed long __ret;						\
+									\
+	sdt_might_sleep_start_timeout(NULL, MAX_SCHEDULE_TIMEOUT);	\
+	__ret = __dma_fence_wait_timeout(f, intr, MAX_SCHEDULE_TIMEOUT);\
+	sdt_might_sleep_end();						\
+									\
+	/*								\
+	 * Since dma_fence_wait_timeout cannot timeout with		\
+	 * MAX_SCHEDULE_TIMEOUT, only valid return values are		\
+	 * -ERESTARTSYS and MAX_SCHEDULE_TIMEOUT.			\
+	 */								\
+	__ret < 0 ? __ret : 0;						\
+})
 
 void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline);
 
-- 
2.17.1

