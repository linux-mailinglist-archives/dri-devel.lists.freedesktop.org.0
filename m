Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7E173EC80
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 23:04:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91C1310E264;
	Mon, 26 Jun 2023 21:04:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4537C10E1F9
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 12:13:55 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-e3-64997d6d0714
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v10 20/25] dept: Apply timeout consideration to waitqueue wait
Date: Mon, 26 Jun 2023 20:56:55 +0900
Message-Id: <20230626115700.13873-21-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230626115700.13873-1-byungchul@sk.com>
References: <20230626115700.13873-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSW0xTWRSGZ5/LPqfVmmMlelSik0Y00ahoxKyo8TLRuOdhZlDfvASrPUK1
 VNIiiNERsRoHxAiRAtqZlEsqAgq2qCiUYBEEUUElWEklUq8dQBRtBenotEZfVr78a/3f0+Jp
 ZQM7jdfqkyWDXq1TYTkjHxxfNF9/qFAT/cKMIOdkNPg/nmDAUlWJofNSBYLKmiMU+JrXw+PA
 AIKxex005Od1Iijqe0pDTUsvAmdZBoZHLyZAl38IQ1teFoajJVUYHvQHKfCYcymosP8G7aeL
 KWgcfc1Avg/DufyjVGi8oWDUVs6BLT0KvGVnOQj2LYK23m4WnD3zoPAfD4Z6ZxsDLbVeCh7d
 sGDorfzKQntLKwOdOdksXHxbjKE/YKPB5h/i4GGjlYJqU0j0b9BJwfEPX1i4nd0YotLLFHQ9
 qUPQcOIZBfbKbgxN/gEKHPY8Gj6fb0bgPTXIwbGToxycO3IKQdYxMwMd/91mweSJgbERC169
 nDQNDNHE5EglzoCVIXeKRXL97FOOmBp6OGK17yOOsrmkpN5HkaJhP0vs5X9hYh/O5UjmYBdF
 PN31mLy9f58jrQVjTGzkZvkKjaTTpkiGhSu3yxOs74fYpCvc/r99unRkwplIxovCErHgeDX3
 gz8XDbJhxsIc0e0epcMcIfwsOrJfhXI5Twsl48TXrbe+FSYJv4vvex6HjnieEaJEc/CXcKwQ
 lopNroHv/pliRXXjN48slNfdLUZhVgoxYobHhcNOUciSia/On/lemCreLHMzp5HCin4qR0qt
 PiVRrdUtWZCQptfuX7Bzb6Idhb7Kdii4pRYNd25yIYFHqvGK6BkFGiWrTjGmJbqQyNOqCMXk
 kXyNUqFRpx2QDHvjDPt0ktGFpvOMaopicSBVoxTi1cnSHklKkgw/thQvm5aOYhLdq0YueimX
 OcPE/8HdvdqzkR6bfTDJV9NxuDfe8uFC7MTd1/5Mbs5MuVEbzNO2L5tpiXu3NWpNqXHHE/ev
 u/wrNqU6vDnpCatzJsVfnRiHm6sKxedrbm6z1Qk1nyakvazNiMwiazf0n/kyf1bkV39fvOS7
 HKGxrssNzJ4KpbJYFWNMUC+aSxuM6v8BdImIxFEDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0hTcRjG+5/L/xxXi9OSOhjdFhYVlV2UF4qIvngKkvpSYDdXO+VoW7aZ
 aWRZrjJNUclLpjU1lsxVNgssXY1Z6rpaMy2bktJtpdnFDS/L2qK+vPx4noffp5clZUY6jFVp
 E0WdVqGWYwkliVmZvkiTel4Z0XQ6HPLORoB3MIOC0usWDK3XqhFYbh4nwPMgGjp8fQhGnzwj
 oaigFUF5TxcJN5u6EdiqTmBwvZsIbd4BDM6CLAzpldcxPP/iJ8BdmE9AtXUDPMqtIMA+/JGC
 Ig+GC0XpROB8ImDYZGbAlBYOvVUlDPh7loKzu52GxjInDbbOhXD+ohtDg81JQVNdLwGuO6UY
 ui2/aXjU1EJBa142DVe/VmD44jORYPIOMPDCbiSgxhCwffbbCDj1c4yG5mx7gC7fIKDtdT2C
 uxlvCbBa2jE0evsIqLUWkDBy5QGC3px+Bk6eHWbgwvEcBFknCyl49quZBoM7EkaHSvGaVUJj
 3wApGGoPCTafkRIeVvDC7ZIuRjDc7WQEo/WgUFu1QKhs8BBC+Q8vLVjNZ7Bg/ZHPCJn9bYTg
 bm/AwtenTxmhpXiU2jg9VrJKKapVSaJuyeo4Sbzx+wCdcItJLvOo05ABZ6IQludW8CPl/XSQ
 MTePf/VqmAxyKDeLr83+EMglLMlVjuc/ttxngsVkLob/3tkRGLEsxYXzhf61wVjKRfGNjr5/
 zpl8dY39ryckkNc/rkBBlnGR/Am3A+ciiRGNM6NQlTZJo1CpIxfr98WnaFXJi3fv11hR4G9M
 qf68OjToinYgjkXyCdKIGcVKGa1I0qdoHIhnSXmodMpQkVImVSpSDou6/Tt1B9Wi3oGmsZR8
 qnT9FjFOxu1VJIr7RDFB1P1vCTYkLA3FTlhvZtkCza51rs1HoqJjLh5w0TXnjmrndEXVDDab
 O9q3f54KL9GbnDHnpSnLX0/37dH7difEWu8ZjJna3Cuu+cfqw4qrrm6wvDclzvZ1zq2fsWz+
 ZVmMbNuSmSNZYWO/G0pS3+2waOx14bu2ZWf8mr3s28jWtcuH8j3cppWTpC/j5JQ+XrF0AanT
 K/4AG6vq3jMDAAA=
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 26 Jun 2023 21:03:35 +0000
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

Now that CONFIG_DEPT_AGGRESSIVE_TIMEOUT_WAIT was introduced, apply the
consideration to waitqueue wait, assuming an input 'ret' in
___wait_event() macro is used as a timeout value.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/wait.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/wait.h b/include/linux/wait.h
index ff349e609da7..aa1bd964be1e 100644
--- a/include/linux/wait.h
+++ b/include/linux/wait.h
@@ -304,7 +304,7 @@ extern void init_wait_entry(struct wait_queue_entry *wq_entry, int flags);
 	struct wait_queue_entry __wq_entry;					\
 	long __ret = ret;	/* explicit shadow */				\
 										\
-	sdt_might_sleep_start(NULL);						\
+	sdt_might_sleep_start_timeout(NULL, __ret);				\
 	init_wait_entry(&__wq_entry, exclusive ? WQ_FLAG_EXCLUSIVE : 0);	\
 	for (;;) {								\
 		long __int = prepare_to_wait_event(&wq_head, &__wq_entry, state);\
-- 
2.17.1

