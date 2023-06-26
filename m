Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFAB73EC7F
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 23:04:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B799610E266;
	Mon, 26 Jun 2023 21:04:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 901 seconds by postgrey-1.36 at gabe;
 Mon, 26 Jun 2023 12:13:39 UTC
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3716010E0D6
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 12:13:38 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-b7-64997d6b4fa4
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v10 03/25] dept: Add single event dependency tracker APIs
Date: Mon, 26 Jun 2023 20:56:38 +0900
Message-Id: <20230626115700.13873-4-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230626115700.13873-1-byungchul@sk.com>
References: <20230626115700.13873-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSf1CLcRzHfZ8f32eN8ZjwiKMbnZOTOD8+0Tn+4XHOHefOH/kjYw+NVSya
 cp0oLlESNapztZjUYrb8rCVLafJjqcu46TROUukuNpvmxwr/fO51n/fr3p9/PiJSWk+HiJQJ
 BwR1glwlw2JKPDBOt2Bv2kVFZG2ODM6ejgT3tywKSm4YMNivVyEw1BwloLdpHbzy9CMYfvaC
 BG2BHUFZ91sSapq7EFgqjmFo/zAeOtyDGGwFpzBklN/A0NbnJ8BZmE9AlWkjtObpCGjw9VCg
 7cVQrM0gAuMTAT59JQP69DBwVRQx4O9eBLauThosb+bDxUtODHUWGwXNd10EtN8vwdBl+E1D
 a3MLBfazOTRUf9Fh6PPoSdC7Bxl42VBKgDEzUPTZbyHgxNdfNDzOaQjQ5ZsEdLyuRVCf9Y4A
 k6ETQ6O7nwCzqYCEH1ebELhyBxg4ftrHQPHRXASnjhdS8OLnYxoynUth2FuCV6/kG/sHST7T
 rOEtnlKKf6Lj+HtFbxk+s/4Nw5eaDvLminC+vK6X4MuG3DRvqjyJedNQPsNnD3QQvLOzDvNf
 nj9n+JYLw9SmGTHiaIWgUiYL6oWrtovjrHlF9L5XUw95tLPSUYc0GwWJOHYJ5zrzlfrP72x+
 NMKYncs5HD5yhIPZUM6c85HORmIRyZaP5XpaHjEjwSR2PdfTaB2VKDaM++hrH2UJu5Trbr7y
 r3QWV2VsGN0Hscu42qe60QPSgHPMacV/nXNBnOM685encQ8rHFQekpSiMZVIqkxIjpcrVUsi
 4lISlIcidibGm1Dgq/Rp/m130ZB9ixWxIiQbJ4mceUEhpeXJSSnxVsSJSFmwZIpXq5BKFPKU
 VEGdGKs+qBKSrGi6iJJNlSz2aBRSdrf8gLBXEPYJ6v8pIQoKSUfzHKppUakWV2Jf1Azjrpjw
 87He4kQ71XNnTWf+zepV0ZwipHjt7bRH25YbFf2bbiWnr7g0cUJv1q6oW61Tgp86vRmTnRGa
 2NA57zeEaWziNoxnj0nVSKor9+/3thjnHhloa61tela449u1mh2b93zPNdf9yI4mDI3MPfHW
 BSsfOA7LqKQ4+aJwUp0k/wNpr8oFUQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSbUxTdxjF/d/X0llz0xG5Y1G0GcOAQ1iGeSKgftK/RhdjTEYWDXT2ZnQU
 NK10YGJSoRBEqEACRUADFCqBMrA1BpWa2spL5xtKQUcqEbLJUISotFKpYsH45eSXc07O8+UR
 kdImOlKkzDkhqHPkKhkjpsQ/Jxf+kHXqvCKh5VwYVJYlgG++hIKGLgsDQ391ILBcOU3AdN9u
 eOyfQbB47wEJxuohBE0TT0m40j+OwN5WwMDwv2vA45tjwF19loFCUxcDD18GCfDWVBHQYd0P
 dyqaCXAEpigwTjNQbywkQvI/AQFzOwtmXTRMttWxEJxIBPf4KA2uC24a7GNxcP6il4Feu5uC
 /p5JAoavNzAwblmi4U7/IAVDleU0dM42M/DSbybB7Jtj4ZGjkYBufWjtRdBOQPHbjzQMlDtC
 1HKZAM8/NxDcLHlGgNUyyoDLN0OAzVpNwvtLfQgmDa9YKCoLsFB/2oDgbFENBQ8+DNCg9ybB
 4kIDszMFu2bmSKy3/Ynt/kYK/93M42t1T1msvznG4kZrLra1xWJT7zSBm974aGxtP8Ng65sq
 Fpe+8hDYO9rL4Nn791k8WLtIHVj3qzhFIaiUWkG9ZXuGONNZUUcffxyR5zdG6ZBHWorCRDz3
 E//MHUTLzHAx/JMnAXKZw7kNvK38OV2KxCKSM33FTw3eZpeDr7k9/JTLuVKiuGj+eWB4hSVc
 Ej/R30p9Ho3iO7odK34Yt5W/cbd55YA01CnwOpkKJG5Eq9pRuDJHmy1XqpLiNVmZ+TnKvPij
 x7KtKPQ45lPByh40P7zbiTgRkq2WJKyvVUhpuVaTn+1EvIiUhUvWLhgVUolCnn9SUB9LV+eq
 BI0TfSuiZBGSvb8IGVLud/kJIUsQjgvqLykhCovUodi0vGtLuTFzNZ0v3g6sNhlHdqSm93Tp
 Du3TJr7b44n9LxkVbWjTL8UdNHw83HJA67b0FqRs3FTcao2xRbYmrh3Zdj1iNmXsmyO1S7tU
 aTjuj/KoluiFNIf/+w9lCXeNI7c6CjcZqr5LGtcN1Zzb7BIf4q+GVxiI+tSo34p/fL3ddFJG
 aTLlibGkWiP/BA+c/uo0AwAA
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

Wrapped the base APIs for easier annotation on wait and event. Start
with supporting waiters on each single event. More general support for
multiple events is a future work. Do more when the need arises.

How to annotate (the simplest way):

1. Initaialize a map for the interesting wait.

   /*
    * Recommand to place along with the wait instance.
    */
   struct dept_map my_wait;

   /*
    * Recommand to place in the initialization code.
    */
   sdt_map_init(&my_wait);

2. Place the following at the wait code.

   sdt_wait(&my_wait);

3. Place the following at the event code.

   sdt_event(&my_wait);

That's it!

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/dept_sdt.h | 62 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 include/linux/dept_sdt.h

diff --git a/include/linux/dept_sdt.h b/include/linux/dept_sdt.h
new file mode 100644
index 000000000000..12a793b90c7e
--- /dev/null
+++ b/include/linux/dept_sdt.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Single-event Dependency Tracker
+ *
+ * Started by Byungchul Park <max.byungchul.park@gmail.com>:
+ *
+ *  Copyright (c) 2020 LG Electronics, Inc., Byungchul Park
+ */
+
+#ifndef __LINUX_DEPT_SDT_H
+#define __LINUX_DEPT_SDT_H
+
+#include <linux/kernel.h>
+#include <linux/dept.h>
+
+#ifdef CONFIG_DEPT
+#define sdt_map_init(m)							\
+	do {								\
+		static struct dept_key __key;				\
+		dept_map_init(m, &__key, 0, #m);			\
+	} while (0)
+
+#define sdt_map_init_key(m, k)		dept_map_init(m, k, 0, #m)
+
+#define sdt_wait(m)							\
+	do {								\
+		dept_request_event(m);					\
+		dept_wait(m, 1UL, _THIS_IP_, __func__, 0);		\
+	} while (0)
+
+/*
+ * sdt_might_sleep() and its family will be committed in __schedule()
+ * when it actually gets to __schedule(). Both dept_request_event() and
+ * dept_wait() will be performed on the commit.
+ */
+
+/*
+ * Use the code location as the class key if an explicit map is not used.
+ */
+#define sdt_might_sleep_start(m)					\
+	do {								\
+		struct dept_map *__m = m;				\
+		static struct dept_key __key;				\
+		dept_stage_wait(__m, __m ? NULL : &__key, _THIS_IP_, __func__);\
+	} while (0)
+
+#define sdt_might_sleep_end()		dept_clean_stage()
+
+#define sdt_ecxt_enter(m)		dept_ecxt_enter(m, 1UL, _THIS_IP_, "start", "event", 0)
+#define sdt_event(m)			dept_event(m, 1UL, _THIS_IP_, __func__)
+#define sdt_ecxt_exit(m)		dept_ecxt_exit(m, 1UL, _THIS_IP_)
+#else /* !CONFIG_DEPT */
+#define sdt_map_init(m)			do { } while (0)
+#define sdt_map_init_key(m, k)		do { (void)(k); } while (0)
+#define sdt_wait(m)			do { } while (0)
+#define sdt_might_sleep_start(m)	do { } while (0)
+#define sdt_might_sleep_end()		do { } while (0)
+#define sdt_ecxt_enter(m)		do { } while (0)
+#define sdt_event(m)			do { } while (0)
+#define sdt_ecxt_exit(m)		do { } while (0)
+#endif
+#endif /* __LINUX_DEPT_SDT_H */
-- 
2.17.1

