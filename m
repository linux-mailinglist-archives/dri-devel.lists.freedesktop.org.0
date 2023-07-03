Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B22837458FB
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 11:50:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01A9910E1F6;
	Mon,  3 Jul 2023 09:49:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 63A8E10E1F1
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 09:49:41 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-16-64a299b26989
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v10 rebased on v6.4 04/25] dept: Add lock dependency tracker
 APIs
Date: Mon,  3 Jul 2023 18:47:31 +0900
Message-Id: <20230703094752.79269-5-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230703094752.79269-1-byungchul@sk.com>
References: <20230703094752.79269-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSe0xTZxjG933n2krNsQM502SaxlswU9jQvC7TkJi5E2cTdYlGiXHVcwKN
 UEihINvIKlTFC0xNALlEobraAAqcYsYmdRUmiAToRqNgapWLG8RyCa4VBN0KxH/e/PI8T568
 fzwsoW6klrF6Q7pkNOiSNLSSVI6GWT+RS6xitKV2FVw8Hw2Bf/NIKK+tocF9qxpBTcMJDCP3
 v4LHQT+Cmc5uAooL3Qgq+58S0NDqQ+C059DQM7QYPIFxGtoLz9GQe62Whj9fzmLwFl3CUC1r
 oeOCFYNr+h8SikdoKCvOxaEzjGHaVsWAzbwaBuylDMz2x0C77xEFzifroeSKl4YmZzsJrY0D
 GHp+K6fBV/MfBR2tD0hwX8yn4OaYlYaXQRsBtsA4A3+5KjDUWUJFp169o6At34Xh1PV6DJ6+
 Owju5j3HINc8oqEl4MfgkAsJeHPjPoKBglEGTp6fZqDsRAGCcyeLSOh+20aBxbsJZqbK6bjP
 hRb/OCFYHJmCM1hBCg+tvPBr6VNGsNx9wggVsklw2KOEa00jWKicDFCCXHWGFuTJS4xwdtSD
 hbGuLkZ4cHmGFIY8xXj38oPKL0QpSZ8hGTdu+1aZaAl9lzocefxnlxmZUbX6LFKwPBfL//TW
 R7znZ01F1BzT3Fq+t3d6Xg/nVvKO/L9DupIluNOLePtEJz1nfMjt4fN+nwuxLMmt5m3meVRx
 m3jZfGChcgVfXeear1Fwm/kXUwVojtWhiLfERy9kchV8wZtVC/wRf8/eS15Aqgr0QRVS6w0Z
 yTp9UuyGxCyD/viGoynJMgrtyZY9G9+IJt3fNCOORZowVe/3laKa0mWkZSU3I54lNOGq3P6r
 olol6rK+k4wph42mJCmtGS1nSU2k6tNgpqjmEnTp0jFJSpWM713MKpaZ0a4flzZ5Ww51ur/m
 I7SvV7b9MRvRc2Qo1bEtezBhvym5fnAsbnH4lntT2eSZy9E31/wQPNgX9MTvrduuZZfsnJBH
 sOn6fltsX9zwwBbtuqgjNtOOEnGreGVXype/1KbHrJ/Y2hD5WY7ztH93pD+svW9H+DEkLtln
 uK3d/nFOW5kiIV9DpiXqYqIIY5ruf0PRll1LAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSe0hTcRTH+93H715Xi9sSvFRQLCywMgcaByyLgroEvSiKpKjlLjmbFlua
 9oDVlunSkcKcr8pHraFmdTWycjWUzBWa5nImZik9lCx7TTLtsRX9c/hwvl8+nD8OSypK6Fms
 NuWwqE9R65RYRsk2xpqWSEUVmqjM1mmQlxMF/m9ZFJReq8HQUVuNoKb+JAHDD9aBb2wEwUTb
 ExLstg4E5QMvSKhv6Ufgcp7C0PV6Onj9oxg8trMYTJXXMHS+nySgryCfgGppAzw+V0GAe/wd
 BfZhDCV2ExEYQwSMO6oYcBjDYdBZzMDkgAo8/d00NJ/30ODqXQRFF/owNLo8FLQ0DBLQdacU
 Q3/Nbxoet7RS0JGXS8PVjxUY3o85SHD4Rxl46i4j4Lo5YMv8+ouGh7luAjIv3SDA+/wugntZ
 rwiQaroxNPtHCKiTbCT8uPIAwaD1AwOnc8YZKDlpRXD2dAEFT34+pMHcFwMT30vxqliheWSU
 FMx1RwTXWBklPKrghdvFLxjBfK+XEcqkVKHOGSFUNg4TQvkXPy1IVdlYkL7kM4Llg5cQPra3
 M0Jr4QQlvPbaic1z4mXLNaJOmybql8btlSWaA9cdGgpLv+w2IiOqVlhQCMtz0fzLxgI6yJhb
 yPf0jJNBDuXm8XW5bwN7GUtyZ6byzk9tOBjM5LbwWfeDJZaluHDeYfyLci6Gl4w7/ynn8tXX
 3X81Idwy/s13KwqyIlDpK+rH55CsDE2pQqHalLRktVYXE2k4kJiRok2PTDiYLKHAyzhOTOY1
 oG9d65oQxyLlNHnPsXKNglanGTKSmxDPkspQuWngokYh16gzjor6g3v0qTrR0IRms5QyTL5+
 h7hXwe1XHxYPiOIhUf8/JdiQWUa01RW1ulS1afriwvqG2043O0f27Piz2p/ZldHeW/mOnCvS
 Mut8q27S2Jl+bP7Xys9Y77HdNaqidtGLfNsTTL7VhTtGh1QXLb64BFuBJWnrhuTupKTd7e1h
 kWERSeH7btp7J351rqmKt0xdMTaDu+/L7lmbsK8ornhlbXyDJnPbgi1KypCoVkWQeoP6D0Di
 ZREuAwAA
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

Wrapped the base APIs for easier annotation on typical lock.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/dept_ldt.h | 77 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 include/linux/dept_ldt.h

diff --git a/include/linux/dept_ldt.h b/include/linux/dept_ldt.h
new file mode 100644
index 000000000000..062613e89fc3
--- /dev/null
+++ b/include/linux/dept_ldt.h
@@ -0,0 +1,77 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Lock Dependency Tracker
+ *
+ * Started by Byungchul Park <max.byungchul.park@gmail.com>:
+ *
+ *  Copyright (c) 2020 LG Electronics, Inc., Byungchul Park
+ */
+
+#ifndef __LINUX_DEPT_LDT_H
+#define __LINUX_DEPT_LDT_H
+
+#include <linux/dept.h>
+
+#ifdef CONFIG_DEPT
+#define LDT_EVT_L			1UL
+#define LDT_EVT_R			2UL
+#define LDT_EVT_W			1UL
+#define LDT_EVT_RW			(LDT_EVT_R | LDT_EVT_W)
+#define LDT_EVT_ALL			(LDT_EVT_L | LDT_EVT_RW)
+
+#define ldt_init(m, k, su, n)		dept_map_init(m, k, su, n)
+#define ldt_lock(m, sl, t, n, i)					\
+	do {								\
+		if (n)							\
+			dept_ecxt_enter_nokeep(m);			\
+		else if (t)						\
+			dept_ecxt_enter(m, LDT_EVT_L, i, "trylock", "unlock", sl);\
+		else {							\
+			dept_wait(m, LDT_EVT_L, i, "lock", sl);		\
+			dept_ecxt_enter(m, LDT_EVT_L, i, "lock", "unlock", sl);\
+		}							\
+	} while (0)
+
+#define ldt_rlock(m, sl, t, n, i, q)					\
+	do {								\
+		if (n)							\
+			dept_ecxt_enter_nokeep(m);			\
+		else if (t)						\
+			dept_ecxt_enter(m, LDT_EVT_R, i, "read_trylock", "read_unlock", sl);\
+		else {							\
+			dept_wait(m, q ? LDT_EVT_RW : LDT_EVT_W, i, "read_lock", sl);\
+			dept_ecxt_enter(m, LDT_EVT_R, i, "read_lock", "read_unlock", sl);\
+		}							\
+	} while (0)
+
+#define ldt_wlock(m, sl, t, n, i)					\
+	do {								\
+		if (n)							\
+			dept_ecxt_enter_nokeep(m);			\
+		else if (t)						\
+			dept_ecxt_enter(m, LDT_EVT_W, i, "write_trylock", "write_unlock", sl);\
+		else {							\
+			dept_wait(m, LDT_EVT_RW, i, "write_lock", sl);	\
+			dept_ecxt_enter(m, LDT_EVT_W, i, "write_lock", "write_unlock", sl);\
+		}							\
+	} while (0)
+
+#define ldt_unlock(m, i)		dept_ecxt_exit(m, LDT_EVT_ALL, i)
+
+#define ldt_downgrade(m, i)						\
+	do {								\
+		if (dept_ecxt_holding(m, LDT_EVT_W))			\
+			dept_map_ecxt_modify(m, LDT_EVT_W, NULL, LDT_EVT_R, i, "downgrade", "read_unlock", -1);\
+	} while (0)
+
+#define ldt_set_class(m, n, k, sl, i)	dept_map_ecxt_modify(m, LDT_EVT_ALL, k, 0UL, i, "lock_set_class", "(any)unlock", sl)
+#else /* !CONFIG_DEPT */
+#define ldt_init(m, k, su, n)		do { (void)(k); } while (0)
+#define ldt_lock(m, sl, t, n, i)	do { } while (0)
+#define ldt_rlock(m, sl, t, n, i, q)	do { } while (0)
+#define ldt_wlock(m, sl, t, n, i)	do { } while (0)
+#define ldt_unlock(m, i)		do { } while (0)
+#define ldt_downgrade(m, i)		do { } while (0)
+#define ldt_set_class(m, n, k, sl, i)	do { } while (0)
+#endif
+#endif /* __LINUX_DEPT_LDT_H */
-- 
2.17.1

