Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EA283A94E
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 13:15:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BBBE10F707;
	Wed, 24 Jan 2024 12:15:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8BE8B10F72F
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 12:15:10 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-15-65b0fbb69c45
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v11 13/26] dept: Add a mechanism to refill the internal memory
 pools on running out
Date: Wed, 24 Jan 2024 20:59:24 +0900
Message-Id: <20240124115938.80132-14-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240124115938.80132-1-byungchul@sk.com>
References: <20240124115938.80132-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSbUyTZxSG9zzvJ4Wa1+rkRWNm6gcJi9+iJ8apicn2/DFx8Y9xiVrhVapQ
 SBGUGQ0qilpA0EBFyAJlaWvBUls0ooIdBhQ7tEitlQDRTlSkCEFbRZDZYvxzcuW+c67z5/CU
 4hYzm1drDkhajSpVycpo2VBM9eLr4zZp2eOCBCgpWAbBD6dpqKyvY8FtrUVQ13AMw0Drb/A0
 FEAw3vGIAn2pG0H1i14KGtr6EDSZj7PQ9XIaeILDLLSX6lg4UVPPQufgBIaesvMYau2bwVVs
 wOAce02DfoCFCv0JHB5vMIwZLRwYcxeC33yJg4kXy6G9z8tAU/fPUP5XDwu3m9ppaLvhx9B1
 s5KFvrr/GXC13afBXVLIwJV3BhYGQ0YKjMFhDh47qzDY8sKiU+8nGbhX6MRw6u+rGDzPbiFo
 Pv0cg73Oy8LdYACDw15KwWdTKwJ/0RAHJwvGOKg4VoRAd7KMhkdf7jGQ15MI458q2Y1ryd3A
 MEXyHAdJU6iKJg8MImm81MuRvOZujlTZs4jDnEBqbg9gUj0aZIjdcoYl9tHzHDk75MHk3cOH
 HLl/cZwmLz16vGXOdtm6ZClVnS1pl67fJUt54qrgMtwbDvXbQnQualxxFkXxorBK7PS66O88
 6Q0wEWaFeNHnG6MiPFOYJzoKX4VzGU8J+dGieaSDjRQzhCSx/F8vF2FaWCgWtzmnWC6sFgc+
 e6hv0p/EWptziqPC+ZXy7qljCiFRfG45x0WkopAfJU4W3cHfFuLEf8w+uhjJq9APFqRQa7LT
 VOrUVUtScjTqQ0uS0tPsKPxSxiMTf9xAo+6tLUjgkTJGvtFSLykYVXZmTloLEnlKOVPui7NK
 CnmyKudPSZu+U5uVKmW2oDk8rYyVrwgdTFYIe1UHpP2SlCFpv7eYj5qdixZpDXv2yGNLkjZ1
 bHEPXq5J88e8ssnKfrlQYFKsdNr/c23OoHvn1/eb1lib0e+/pjuOxiib9dHvL378cZujd2l0
 I4nX7PB2fjx8Z+SpZySOyipNXGMyrdw+fbFrn+9CwlzvtFjzVsOzBcOB3ddnWXXz+t8odNe6
 WnXWt/kb/JjnlHRmimp5AqXNVH0FNmlKKE4DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzXSfUzMcRwH8L6/x+s4+zmNn2TabWZ5KlT7jKgZ68s8jT/aZNPhp266cOdS
 xlZ6ED242io9IGUnVyl38ljtXKskcXROWjU1ofWMu0mFO+afz157v7f3Xx8RKb1Ke4oUMacE
 VYw8WsaIKfGuDUmr7k/VCH59PXMhO8MP7N/TKCiurmTAcqcCQeW9RAIGm0LhnWMYwVT7KxLy
 cy0IbvT1kHCvuRdBffl5Bjo+zgGrfYyB1tx0BpLKqhl4PTRNQHdeDgEVhp3Qpi0lwDT5mYL8
 QQaK8pMI5/lCwKROz4IuYSn0lxeyMN23Blp7bTQ0Xm2lob5rBRRc62agrr6VguaH/QR0PC5m
 oLfyNw1tzc8osGRn0lA1WsrAkENHgs4+xsIbUwkBNcnOtdRvv2hoyTQRkHrzLgHW908QNKR9
 IMBQaWOg0T5MgNGQS8LPW00I+rNGWEjJmGShKDELQXpKHgWvZlpoSO4OgKkfxUzIBtw4PEbi
 ZONpXO8oofDzUh4/KuxhcXJDF4tLDBpsLF+Oy+oGCXzjq53GBv1FBhu+5rD40oiVwKMvX7L4
 2ZUpCn+05hN7vPaLg44I0YpYQeW7KUIc9batiD1hCY4bqHFQCejR2kvIXcRz/vwv2zDtMsMt
 4zs7J0mXPThv3pj5yZmLRSR3YRZfPt7OuIp53GG+4IWNdZnilvLaZtNfS7hAfvCnlfw3uoSv
 qDH9tbszryroolyWcgH8B/1lVovEJchNjzwUMbFKuSI6YLX6WFR8jCJu9eHjSgNyPo3u3HT2
 Q/S9I9SMOBGSzZaE6KsFKS2PVccrzYgXkTIPSefCO4JUckQef0ZQHT+o0kQLajNaJKJkCyTb
 w4QIKRcpPyUcE4QTgup/S4jcPRPQxqi0pz0TDes909VuPnleZ8IjX+8YH7K2K83c4s1f1OqI
 rpCnA4e2+Qva3Xs1+zYXj648MHJ9x+fLJ/02SpWh82xxtd5ZOGugLfDBxNGUMMvIA39N4Lqz
 tyt83lzcchJTz3ODI9u3htU6ZoydhkifDIW5LH1+7dwmukWj9T0XHrRfRqmj5GuWkyq1/A+q
 DDFPMAMAAA==
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
Cc: hamohammed.sa@gmail.com, hdanton@sina.com, jack@suse.cz,
 peterz@infradead.org, daniel.vetter@ffwll.ch, amir73il@gmail.com,
 david@fromorbit.com, dri-devel@lists.freedesktop.org, mhocko@kernel.org,
 linux-mm@kvack.org, linux-ide@vger.kernel.org, adilger.kernel@dilger.ca,
 chris.p.wilson@intel.com, joel@joelfernandes.org, 42.hyeyoo@gmail.com,
 cl@linux.com, will@kernel.org, duyuyang@gmail.com, sashal@kernel.org,
 her0gyugyu@gmail.com, kernel_team@skhynix.com,
 damien.lemoal@opensource.wdc.com, willy@infradead.org, hch@infradead.org,
 mingo@redhat.com, djwong@kernel.org, vdavydov.dev@gmail.com,
 rientjes@google.com, dennis@kernel.org, linux-ext4@vger.kernel.org,
 ngupta@vflare.org, johannes.berg@intel.com, boqun.feng@gmail.com,
 dan.j.williams@intel.com, josef@toxicpanda.com, rostedt@goodmis.org,
 gwan-gyeong.mun@intel.com, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, jglisse@redhat.com, viro@zeniv.linux.org.uk,
 longman@redhat.com, tglx@linutronix.de, vbabka@suse.cz, melissa.srw@gmail.com,
 sj@kernel.org, tytso@mit.edu, rodrigosiqueiramelo@gmail.com,
 kernel-team@lge.com, gregkh@linuxfoundation.org, jlayton@kernel.org,
 penberg@kernel.org, minchan@kernel.org, max.byungchul.park@gmail.com,
 hannes@cmpxchg.org, tj@kernel.org, akpm@linux-foundation.org,
 torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dept engine works in a constrained environment. For example, Dept cannot
make use of dynamic allocation e.g. kmalloc(). So Dept has been using
static pools to keep memory chunks Dept uses.

However, Dept would barely work once any of the pools gets run out. So
implemented a mechanism for the refill on the lack by any chance, using
irq work and workqueue that fits on the contrained environment.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/dept.h            |  19 ++++--
 kernel/dependency/dept.c        | 104 +++++++++++++++++++++++++++-----
 kernel/dependency/dept_object.h |  10 +--
 kernel/dependency/dept_proc.c   |   8 +--
 4 files changed, 112 insertions(+), 29 deletions(-)

diff --git a/include/linux/dept.h b/include/linux/dept.h
index 319a5b43df89..ca1a34be4127 100644
--- a/include/linux/dept.h
+++ b/include/linux/dept.h
@@ -336,9 +336,19 @@ struct dept_pool {
 	size_t				obj_sz;
 
 	/*
-	 * the number of the static array
+	 * the remaining number of the object in spool
 	 */
-	atomic_t			obj_nr;
+	int				obj_nr;
+
+	/*
+	 * the number of the object in spool
+	 */
+	int				tot_nr;
+
+	/*
+	 * accumulated amount of memory used by the object in byte
+	 */
+	atomic_t			acc_sz;
 
 	/*
 	 * offset of ->pool_node
@@ -348,9 +358,10 @@ struct dept_pool {
 	/*
 	 * pointer to the pool
 	 */
-	void				*spool;
+	void				*spool; /* static pool */
+	void				*rpool; /* reserved pool */
 	struct llist_head		boot_pool;
-	struct llist_head __percpu	*lpool;
+	struct llist_head __percpu	*lpool; /* local pool */
 };
 
 struct dept_ecxt_held {
diff --git a/kernel/dependency/dept.c b/kernel/dependency/dept.c
index a8e693fd590f..8ca46ad98e10 100644
--- a/kernel/dependency/dept.c
+++ b/kernel/dependency/dept.c
@@ -74,6 +74,9 @@
 #include <linux/dept.h>
 #include <linux/utsname.h>
 #include <linux/kernel.h>
+#include <linux/workqueue.h>
+#include <linux/irq_work.h>
+#include <linux/vmalloc.h>
 #include "dept_internal.h"
 
 static int dept_stop;
@@ -122,9 +125,11 @@ static int dept_per_cpu_ready;
 			WARN(1, "DEPT_STOP: " s);			\
 	})
 
-#define DEPT_INFO_ONCE(s...) pr_warn_once("DEPT_INFO_ONCE: " s)
+#define DEPT_INFO_ONCE(s...)	pr_warn_once("DEPT_INFO_ONCE: " s)
+#define DEPT_INFO(s...)		pr_warn("DEPT_INFO: " s)
 
 static arch_spinlock_t dept_spin = (arch_spinlock_t)__ARCH_SPIN_LOCK_UNLOCKED;
+static arch_spinlock_t dept_pool_spin = (arch_spinlock_t)__ARCH_SPIN_LOCK_UNLOCKED;
 
 /*
  * DEPT internal engine should be careful in using outside functions
@@ -263,6 +268,7 @@ static bool valid_key(struct dept_key *k)
 
 #define OBJECT(id, nr)							\
 static struct dept_##id spool_##id[nr];					\
+static struct dept_##id rpool_##id[nr];					\
 static DEFINE_PER_CPU(struct llist_head, lpool_##id);
 	#include "dept_object.h"
 #undef  OBJECT
@@ -271,14 +277,70 @@ struct dept_pool dept_pool[OBJECT_NR] = {
 #define OBJECT(id, nr) {						\
 	.name = #id,							\
 	.obj_sz = sizeof(struct dept_##id),				\
-	.obj_nr = ATOMIC_INIT(nr),					\
+	.obj_nr = nr,							\
+	.tot_nr = nr,							\
+	.acc_sz = ATOMIC_INIT(sizeof(spool_##id) + sizeof(rpool_##id)), \
 	.node_off = offsetof(struct dept_##id, pool_node),		\
 	.spool = spool_##id,						\
+	.rpool = rpool_##id,						\
 	.lpool = &lpool_##id, },
 	#include "dept_object.h"
 #undef  OBJECT
 };
 
+static void dept_wq_work_fn(struct work_struct *work)
+{
+	int i;
+
+	for (i = 0; i < OBJECT_NR; i++) {
+		struct dept_pool *p = dept_pool + i;
+		int sz = p->tot_nr * p->obj_sz;
+		void *rpool;
+		bool need;
+
+		arch_spin_lock(&dept_pool_spin);
+		need = !p->rpool;
+		arch_spin_unlock(&dept_pool_spin);
+
+		if (!need)
+			continue;
+
+		rpool = vmalloc(sz);
+
+		if (!rpool) {
+			DEPT_STOP("Failed to extend internal resources.\n");
+			break;
+		}
+
+		arch_spin_lock(&dept_pool_spin);
+		if (!p->rpool) {
+			p->rpool = rpool;
+			rpool = NULL;
+			atomic_add(sz, &p->acc_sz);
+		}
+		arch_spin_unlock(&dept_pool_spin);
+
+		if (rpool)
+			vfree(rpool);
+		else
+			DEPT_INFO("Dept object(%s) just got refilled successfully.\n", p->name);
+	}
+}
+
+static DECLARE_WORK(dept_wq_work, dept_wq_work_fn);
+
+static void dept_irq_work_fn(struct irq_work *w)
+{
+	schedule_work(&dept_wq_work);
+}
+
+static DEFINE_IRQ_WORK(dept_irq_work, dept_irq_work_fn);
+
+static void request_rpool_refill(void)
+{
+	irq_work_queue(&dept_irq_work);
+}
+
 /*
  * Can use llist no matter whether CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG is
  * enabled or not because NMI and other contexts in the same CPU never
@@ -314,19 +376,31 @@ static void *from_pool(enum object_t t)
 	/*
 	 * Try static pool.
 	 */
-	if (atomic_read(&p->obj_nr) > 0) {
-		int idx = atomic_dec_return(&p->obj_nr);
+	arch_spin_lock(&dept_pool_spin);
+
+	if (!p->obj_nr) {
+		p->spool = p->rpool;
+		p->obj_nr = p->rpool ? p->tot_nr : 0;
+		p->rpool = NULL;
+		request_rpool_refill();
+	}
+
+	if (p->obj_nr) {
+		void *ret;
+
+		p->obj_nr--;
+		ret = p->spool + (p->obj_nr * p->obj_sz);
+		arch_spin_unlock(&dept_pool_spin);
 
-		if (idx >= 0)
-			return p->spool + (idx * p->obj_sz);
+		return ret;
 	}
+	arch_spin_unlock(&dept_pool_spin);
 
-	DEPT_INFO_ONCE("---------------------------------------------\n"
-		"  Some of Dept internal resources are run out.\n"
-		"  Dept might still work if the resources get freed.\n"
-		"  However, the chances are Dept will suffer from\n"
-		"  the lack from now. Needs to extend the internal\n"
-		"  resource pools. Ask max.byungchul.park@gmail.com\n");
+	DEPT_INFO("------------------------------------------\n"
+		"  Dept object(%s) is run out.\n"
+		"  Dept is trying to refill the object.\n"
+		"  Nevertheless, if it fails, Dept will stop.\n",
+		p->name);
 	return NULL;
 }
 
@@ -2957,8 +3031,8 @@ void __init dept_init(void)
 	pr_info("... DEPT_MAX_ECXT_HELD  : %d\n", DEPT_MAX_ECXT_HELD);
 	pr_info("... DEPT_MAX_SUBCLASSES : %d\n", DEPT_MAX_SUBCLASSES);
 #define OBJECT(id, nr)							\
-	pr_info("... memory used by %s: %zu KB\n",			\
-	       #id, B2KB(sizeof(struct dept_##id) * nr));
+	pr_info("... memory initially used by %s: %zu KB\n",		\
+	       #id, B2KB(sizeof(spool_##id) + sizeof(rpool_##id)));
 	#include "dept_object.h"
 #undef  OBJECT
 #define HASH(id, bits)							\
@@ -2966,6 +3040,6 @@ void __init dept_init(void)
 	       #id, B2KB(sizeof(struct hlist_head) * (1 << (bits))));
 	#include "dept_hash.h"
 #undef  HASH
-	pr_info("... total memory used by objects and hashs: %zu KB\n", B2KB(mem_total));
+	pr_info("... total memory initially used by objects and hashs: %zu KB\n", B2KB(mem_total));
 	pr_info("... per task memory footprint: %zu bytes\n", sizeof(struct dept_task));
 }
diff --git a/kernel/dependency/dept_object.h b/kernel/dependency/dept_object.h
index 0b7eb16fe9fb..4f936adfa8ee 100644
--- a/kernel/dependency/dept_object.h
+++ b/kernel/dependency/dept_object.h
@@ -6,8 +6,8 @@
  * nr: # of the object that should be kept in the pool.
  */
 
-OBJECT(dep, 1024 * 8)
-OBJECT(class, 1024 * 8)
-OBJECT(stack, 1024 * 32)
-OBJECT(ecxt, 1024 * 16)
-OBJECT(wait, 1024 * 32)
+OBJECT(dep, 1024 * 4 * 2)
+OBJECT(class, 1024 * 4)
+OBJECT(stack, 1024 * 4 * 8)
+OBJECT(ecxt, 1024 * 4 * 2)
+OBJECT(wait, 1024 * 4 * 4)
diff --git a/kernel/dependency/dept_proc.c b/kernel/dependency/dept_proc.c
index 7d61dfbc5865..f07a512b203f 100644
--- a/kernel/dependency/dept_proc.c
+++ b/kernel/dependency/dept_proc.c
@@ -73,12 +73,10 @@ static int dept_stats_show(struct seq_file *m, void *v)
 {
 	int r;
 
-	seq_puts(m, "Availability in the static pools:\n\n");
+	seq_puts(m, "Accumulated amount of memory used by pools:\n\n");
 #define OBJECT(id, nr)							\
-	r = atomic_read(&dept_pool[OBJECT_##id].obj_nr);		\
-	if (r < 0)							\
-		r = 0;							\
-	seq_printf(m, "%s\t%d/%d(%d%%)\n", #id, r, nr, (r * 100) / (nr));
+	r = atomic_read(&dept_pool[OBJECT_##id].acc_sz);		\
+	seq_printf(m, "%s\t%d KB\n", #id, r / 1024);
 	#include "dept_object.h"
 #undef  OBJECT
 
-- 
2.17.1

