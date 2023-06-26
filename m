Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A23573EC75
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 23:04:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2420810E252;
	Mon, 26 Jun 2023 21:03:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id B508010E1F8
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 12:13:55 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-39-64997d6ef944
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v10 25/25] dept: Track the potential waits of PG_{locked,
 writeback}
Date: Mon, 26 Jun 2023 20:57:00 +0900
Message-Id: <20230626115700.13873-26-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230626115700.13873-1-byungchul@sk.com>
References: <20230626115700.13873-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0yTZxiGfb8zHTVfKs7PQ8TUoE4yRAP4NBqD/vHVRENiXMwWo936bTSW
 Ai1yMDFDDopVDJBAQYmB4koD3cS2BhVKKkWOAzokiKagMDKGnDa2NiBs2mL88+TOdee+fj0c
 KWuhN3FqbZqo0yo1ckZCSWZDq7/UXq5QRRsskVB8Mxp8/xZQUHnfyoDnl3oEVscVAqaeHYUX
 /hkEy739JBhLPQiqx0ZIcLSPInBachh4PrEWBn3zDHSV3mAgt+Y+A79NrxDgLSshoN52AnqK
 TAS4liYpME4xcMeYSwTOnwQsmetYMGdHwLjlNgsrY3uha3SIBuerSKi462Wg2dlFQfujcQKe
 P6lkYNT6noae9k4KPMWFNPw8Z2Jg2m8mweybZ2HAVUVAQ15A9HbFScDVf/6noaPQFUj3HhAw
 +LIJQUvBGwJs1iEG3L4ZAuy2UhLe1T5DMH5rloX8m0ss3LlyC8GN/DIK+v/roCHPGwvLi5VM
 /AHsnpkncZ49Azv9VRTuNgn48e0RFue1vGJxle0itlt245rmKQJXL/hobKu7zmDbQgmLDbOD
 BPYONTN4rq+PxZ3ly1TClq8lB1WiRp0u6vYcOi9JzGnrIVOun8m0uK1kNurABhTCCXyMMDB3
 FxkQt5obHIogZvidwvDwEhnMYfw2wV74B21AEo7kaz4TJjvb2GCxjj8lPPZ2E8EtxUcIPznS
 gljKxwl93d3ooz5cqG9wrXpCArzpV9Mql/GxQo63lQk6Bd4YIpgbm9iPg43CU8swVYSkVWhN
 HZKptelJSrUmJioxS6vOjPouOcmGAl9lvrzyzSO04DnVingOyUOl0VvLVTJama7PSmpFAkfK
 w6SfLxpVMqlKmXVJ1CWf013UiPpWtJmj5Buk+/wZKhn/gzJNvCCKKaLuU0twIZuyUcSbq3/F
 G/f4e69pdnybevzYkZ5+ad341rb1tQ/d90YiE+Iuucue9k78npBw5qvpRsXL5rfF+0/Py6P9
 r0dTlYrvh7dviPvC0bgr1f5atkOdq7Akn20SYtXtJ8Nd53o9Y2MxiwXx+fawotAXin10mL72
 /d9pKWWm0ydG1h52/hjVdnBATukTlXt3kzq98gOx23jmUQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0yTZxiGfd/v2Lq6z0LGNxYP6UIwGAGTsTwqETcTfaORuGzJnH9GY7+M
 Cq2kRQ5GDUeDKERMoB7QFNDSQSf4lR8gVFk5lAJWNghDU4mQbcrkkDnKhKJba+KfJ1euO/f9
 6+EptZWJ5vXGbMlk1GZqWCWtTN1VvM145qou8ecfBai6mAiBxTIaalscLIzcaUbgaCvEMNO3
 H35bmkUQfPiIAkv1CIK6qacUtPVPInDZi1gY/X0djAUWWPBWX2ChuKGFhV9ermLw11zG0Cwf
 gqFL9Ri6l5/TYJlh4bqlGIfOCwzLtiYObAUxMG2/xsHq1HbwTo4z0HPDy4DryVa4etPPQpfL
 S0N/+zSG0Xu1LEw6/mNgqH+AhpGqCgZ+mq9n4eWSjQJbYIGDX7utGFpLQmt/rbownPvnLQOe
 iu4Q3bqLYexxJ4L7Zc8wyI5xFnoCsxiccjUFK419CKYr5zgovbjMwfXCSgQXSmtoePTGw0CJ
 PwmCr2vZPcmkZ3aBIiXOXOJastJksF4kHdeecqTk/hOOWOWTxGmPIw1dM5jUvQowRG46zxL5
 1WWOlM+NYeIf72LJvM/HkYErQfrwhqPKZJ2Uqc+RTAm705TpRb1DVNb5I3n2HgdVgDykHPG8
 KHwmtrbtKEcKnhVixYmJZSrMkcJm0VnxJ1OOlDwlNKwVnw/0cuEgQvha7PAP4nCXFmLE223Z
 Ya0SPhd9g4MozKKwSWxu7X63owj5zuH6d14tJIlFfjd7CSmtaE0TitQbcwxafWZSvDkjPd+o
 z4s/dsIgo9Df2M6sVrWjxdH9biTwSPOBKnHjFZ2a0eaY8w1uJPKUJlL10WuLTq3SafNPSaYT
 35tOZkpmN/qEpzVRqgPfSmlq4QdttpQhSVmS6X2KeUV0AYp4tnlbr7/Td9qw9UE7xjHDUUG3
 Je3fVoUnIWU8mCx6ovo23F358sW+4KmD0VVGQ9euuOidxqyOiQN/721IscsZ2R9q+o7WTA2t
 ST8rxY6dLU6VSzfVnfvD7vvqJu1sVDR+aqs8pFh5483tT/viwfoE8JV9nGGJeHx8y9sd34jf
 pWhoc7p2exxlMmv/BwGnJ2kzAwAA
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 26 Jun 2023 21:03:34 +0000
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
 linux-fsdevel@vger.kernel.org, jglisse@redhat.com, paolo.valente@linaro.org,
 viro@zeniv.linux.org.uk, longman@redhat.com, tglx@linutronix.de,
 vbabka@suse.cz, melissa.srw@gmail.com, sj@kernel.org, tytso@mit.edu,
 rodrigosiqueiramelo@gmail.com, kernel-team@lge.com, gregkh@linuxfoundation.org,
 jlayton@kernel.org, penberg@kernel.org, minchan@kernel.org,
 max.byungchul.park@gmail.com, hannes@cmpxchg.org, tj@kernel.org,
 akpm@linux-foundation.org, torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, Dept only tracks the real waits of PG_{locked,writeback} that
actually happened having gone through __schedule() to avoid false
positives. However, it ends in limited capacity for deadlock detection,
because anyway there might be still way more potential dependencies by
the waits that have yet to happen but may happen in the future so as to
cause a deadlock.

So let Dept assume that when PG_{locked,writeback} bit gets cleared,
there might be waits on the bit to be woken up.

Even though false positives may increase with the aggressive tracking,
it's worth doing it because it's going to be useful in practice. See the
following link for instance:

   https://lore.kernel.org/lkml/1674268856-31807-1-git-send-email-byungchul.park@lge.com/

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/mm_types.h   |   3 +
 include/linux/page-flags.h | 112 +++++++++++++++++++++++++++++++++----
 include/linux/pagemap.h    |   7 ++-
 mm/filemap.c               |  11 +++-
 mm/page_alloc.c            |   3 +
 5 files changed, 121 insertions(+), 15 deletions(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 3b8475007734..61d982eea8d1 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -19,6 +19,7 @@
 #include <linux/workqueue.h>
 #include <linux/seqlock.h>
 #include <linux/percpu_counter.h>
+#include <linux/dept.h>
 
 #include <asm/mmu.h>
 
@@ -252,6 +253,8 @@ struct page {
 #ifdef LAST_CPUPID_NOT_IN_PAGE_FLAGS
 	int _last_cpupid;
 #endif
+	struct dept_ext_wgen PG_locked_wgen;
+	struct dept_ext_wgen PG_writeback_wgen;
 } _struct_page_alignment;
 
 /*
diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 69e93a0c1277..d6ca1148d21d 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -202,6 +202,50 @@ enum pageflags {
 
 #ifndef __GENERATING_BOUNDS_H
 
+#ifdef CONFIG_DEPT
+#include <linux/kernel.h>
+#include <linux/dept.h>
+
+extern struct dept_map PG_locked_map;
+extern struct dept_map PG_writeback_map;
+
+/*
+ * Place the following annotations in its suitable point in code:
+ *
+ *	Annotate dept_page_set_bit() around firstly set_bit*()
+ *	Annotate dept_page_clear_bit() around clear_bit*()
+ *	Annotate dept_page_wait_on_bit() around wait_on_bit*()
+ */
+
+static inline void dept_page_set_bit(struct page *p, int bit_nr)
+{
+	if (bit_nr == PG_locked)
+		dept_request_event(&PG_locked_map, &p->PG_locked_wgen);
+	else if (bit_nr == PG_writeback)
+		dept_request_event(&PG_writeback_map, &p->PG_writeback_wgen);
+}
+
+static inline void dept_page_clear_bit(struct page *p, int bit_nr)
+{
+	if (bit_nr == PG_locked)
+		dept_event(&PG_locked_map, 1UL, _RET_IP_, __func__, &p->PG_locked_wgen);
+	else if (bit_nr == PG_writeback)
+		dept_event(&PG_writeback_map, 1UL, _RET_IP_, __func__, &p->PG_writeback_wgen);
+}
+
+static inline void dept_page_wait_on_bit(struct page *p, int bit_nr)
+{
+	if (bit_nr == PG_locked)
+		dept_wait(&PG_locked_map, 1UL, _RET_IP_, __func__, 0, -1L);
+	else if (bit_nr == PG_writeback)
+		dept_wait(&PG_writeback_map, 1UL, _RET_IP_, __func__, 0, -1L);
+}
+#else
+#define dept_page_set_bit(p, bit_nr)		do { } while (0)
+#define dept_page_clear_bit(p, bit_nr)		do { } while (0)
+#define dept_page_wait_on_bit(p, bit_nr)	do { } while (0)
+#endif
+
 #ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
 DECLARE_STATIC_KEY_FALSE(hugetlb_optimize_vmemmap_key);
 
@@ -383,44 +427,88 @@ static __always_inline int Page##uname(struct page *page)		\
 #define SETPAGEFLAG(uname, lname, policy)				\
 static __always_inline							\
 void folio_set_##lname(struct folio *folio)				\
-{ set_bit(PG_##lname, folio_flags(folio, FOLIO_##policy)); }		\
+{									\
+	set_bit(PG_##lname, folio_flags(folio, FOLIO_##policy));	\
+	dept_page_set_bit(&folio->page, PG_##lname);			\
+}									\
 static __always_inline void SetPage##uname(struct page *page)		\
-{ set_bit(PG_##lname, &policy(page, 1)->flags); }
+{									\
+	set_bit(PG_##lname, &policy(page, 1)->flags);			\
+	dept_page_set_bit(page, PG_##lname);				\
+}
 
 #define CLEARPAGEFLAG(uname, lname, policy)				\
 static __always_inline							\
 void folio_clear_##lname(struct folio *folio)				\
-{ clear_bit(PG_##lname, folio_flags(folio, FOLIO_##policy)); }		\
+{									\
+	clear_bit(PG_##lname, folio_flags(folio, FOLIO_##policy));	\
+	dept_page_clear_bit(&folio->page, PG_##lname);			\
+}									\
 static __always_inline void ClearPage##uname(struct page *page)		\
-{ clear_bit(PG_##lname, &policy(page, 1)->flags); }
+{									\
+	clear_bit(PG_##lname, &policy(page, 1)->flags);			\
+	dept_page_clear_bit(page, PG_##lname);				\
+}
 
 #define __SETPAGEFLAG(uname, lname, policy)				\
 static __always_inline							\
 void __folio_set_##lname(struct folio *folio)				\
-{ __set_bit(PG_##lname, folio_flags(folio, FOLIO_##policy)); }		\
+{									\
+	__set_bit(PG_##lname, folio_flags(folio, FOLIO_##policy));	\
+	dept_page_set_bit(&folio->page, PG_##lname);			\
+}									\
 static __always_inline void __SetPage##uname(struct page *page)		\
-{ __set_bit(PG_##lname, &policy(page, 1)->flags); }
+{									\
+	__set_bit(PG_##lname, &policy(page, 1)->flags);			\
+	dept_page_set_bit(page, PG_##lname);				\
+}
 
 #define __CLEARPAGEFLAG(uname, lname, policy)				\
 static __always_inline							\
 void __folio_clear_##lname(struct folio *folio)				\
-{ __clear_bit(PG_##lname, folio_flags(folio, FOLIO_##policy)); }	\
+{									\
+	__clear_bit(PG_##lname, folio_flags(folio, FOLIO_##policy));	\
+	dept_page_clear_bit(&folio->page, PG_##lname);			\
+}									\
 static __always_inline void __ClearPage##uname(struct page *page)	\
-{ __clear_bit(PG_##lname, &policy(page, 1)->flags); }
+{									\
+	__clear_bit(PG_##lname, &policy(page, 1)->flags);		\
+	dept_page_clear_bit(page, PG_##lname);				\
+}
 
 #define TESTSETFLAG(uname, lname, policy)				\
 static __always_inline							\
 bool folio_test_set_##lname(struct folio *folio)			\
-{ return test_and_set_bit(PG_##lname, folio_flags(folio, FOLIO_##policy)); } \
+{									\
+	bool ret = test_and_set_bit(PG_##lname, folio_flags(folio, FOLIO_##policy));\
+	if (!ret)							\
+		dept_page_set_bit(&folio->page, PG_##lname);		\
+	return ret;							\
+}									\
 static __always_inline int TestSetPage##uname(struct page *page)	\
-{ return test_and_set_bit(PG_##lname, &policy(page, 1)->flags); }
+{									\
+	bool ret = test_and_set_bit(PG_##lname, &policy(page, 1)->flags);\
+	if (!ret)							\
+		dept_page_set_bit(page, PG_##lname);			\
+	return ret;							\
+}
 
 #define TESTCLEARFLAG(uname, lname, policy)				\
 static __always_inline							\
 bool folio_test_clear_##lname(struct folio *folio)			\
-{ return test_and_clear_bit(PG_##lname, folio_flags(folio, FOLIO_##policy)); } \
+{									\
+	bool ret = test_and_clear_bit(PG_##lname, folio_flags(folio, FOLIO_##policy));\
+	if (ret)							\
+		dept_page_clear_bit(&folio->page, PG_##lname);		\
+	return ret;							\
+}									\
 static __always_inline int TestClearPage##uname(struct page *page)	\
-{ return test_and_clear_bit(PG_##lname, &policy(page, 1)->flags); }
+{									\
+	bool ret = test_and_clear_bit(PG_##lname, &policy(page, 1)->flags);\
+	if (ret)							\
+		dept_page_clear_bit(page, PG_##lname);			\
+	return ret;							\
+}
 
 #define PAGEFLAG(uname, lname, policy)					\
 	TESTPAGEFLAG(uname, lname, policy)				\
diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 29e1f9e76eb6..2843619264d3 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -898,7 +898,12 @@ void folio_unlock(struct folio *folio);
  */
 static inline bool folio_trylock(struct folio *folio)
 {
-	return likely(!test_and_set_bit_lock(PG_locked, folio_flags(folio, 0)));
+	bool ret = !test_and_set_bit_lock(PG_locked, folio_flags(folio, 0));
+
+	if (ret)
+		dept_page_set_bit(&folio->page, PG_locked);
+
+	return likely(ret);
 }
 
 /*
diff --git a/mm/filemap.c b/mm/filemap.c
index adc49cb59db6..b80c8e2bd5f2 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -1097,6 +1097,7 @@ static int wake_page_function(wait_queue_entry_t *wait, unsigned mode, int sync,
 		if (flags & WQ_FLAG_CUSTOM) {
 			if (test_and_set_bit(key->bit_nr, &key->folio->flags))
 				return -1;
+			dept_page_set_bit(&key->folio->page, key->bit_nr);
 			flags |= WQ_FLAG_DONE;
 		}
 	}
@@ -1206,6 +1207,7 @@ static inline bool folio_trylock_flag(struct folio *folio, int bit_nr,
 	if (wait->flags & WQ_FLAG_EXCLUSIVE) {
 		if (test_and_set_bit(bit_nr, &folio->flags))
 			return false;
+		dept_page_set_bit(&folio->page, bit_nr);
 	} else if (test_bit(bit_nr, &folio->flags))
 		return false;
 
@@ -1216,8 +1218,10 @@ static inline bool folio_trylock_flag(struct folio *folio, int bit_nr,
 /* How many times do we accept lock stealing from under a waiter? */
 int sysctl_page_lock_unfairness = 5;
 
-static struct dept_map __maybe_unused PG_locked_map = DEPT_MAP_INITIALIZER(PG_locked_map, NULL);
-static struct dept_map __maybe_unused PG_writeback_map = DEPT_MAP_INITIALIZER(PG_writeback_map, NULL);
+struct dept_map __maybe_unused PG_locked_map = DEPT_MAP_INITIALIZER(PG_locked_map, NULL);
+struct dept_map __maybe_unused PG_writeback_map = DEPT_MAP_INITIALIZER(PG_writeback_map, NULL);
+EXPORT_SYMBOL(PG_locked_map);
+EXPORT_SYMBOL(PG_writeback_map);
 
 static inline int folio_wait_bit_common(struct folio *folio, int bit_nr,
 		int state, enum behavior behavior)
@@ -1230,6 +1234,7 @@ static inline int folio_wait_bit_common(struct folio *folio, int bit_nr,
 	unsigned long pflags;
 	bool in_thrashing;
 
+	dept_page_wait_on_bit(&folio->page, bit_nr);
 	if (bit_nr == PG_locked)
 		sdt_might_sleep_start(&PG_locked_map);
 	else if (bit_nr == PG_writeback)
@@ -1327,6 +1332,7 @@ static inline int folio_wait_bit_common(struct folio *folio, int bit_nr,
 		wait->flags |= WQ_FLAG_DONE;
 		break;
 	}
+	dept_page_set_bit(&folio->page, bit_nr);
 
 	/*
 	 * If a signal happened, this 'finish_wait()' may remove the last
@@ -1534,6 +1540,7 @@ void folio_unlock(struct folio *folio)
 	BUILD_BUG_ON(PG_waiters != 7);
 	BUILD_BUG_ON(PG_locked > 7);
 	VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
+	dept_page_clear_bit(&folio->page, PG_locked);
 	if (clear_bit_unlock_is_negative_byte(PG_locked, folio_flags(folio, 0)))
 		folio_wake_bit(folio, PG_locked);
 }
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 0745aedebb37..57d6c82eb8fd 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -76,6 +76,7 @@
 #include <linux/khugepaged.h>
 #include <linux/buffer_head.h>
 #include <linux/delayacct.h>
+#include <linux/dept.h>
 #include <asm/sections.h>
 #include <asm/tlbflush.h>
 #include <asm/div64.h>
@@ -1626,6 +1627,8 @@ static void __meminit __init_single_page(struct page *page, unsigned long pfn,
 	page_mapcount_reset(page);
 	page_cpupid_reset_last(page);
 	page_kasan_tag_reset(page);
+	dept_ext_wgen_init(&page->PG_locked_wgen);
+	dept_ext_wgen_init(&page->PG_writeback_wgen);
 
 	INIT_LIST_HEAD(&page->lru);
 #ifdef WANT_PAGE_VIRTUAL
-- 
2.17.1

