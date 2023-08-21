Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D2778222C
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 06:05:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCD8310E199;
	Mon, 21 Aug 2023 04:05:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0867C10E194
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 04:05:00 +0000 (UTC)
X-AuditID: a67dfc5b-d6dff70000001748-2b-64e2ded67c1d
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v10 20/25] dept: Apply timeout consideration to
 waitqueue wait
Date: Mon, 21 Aug 2023 12:46:32 +0900
Message-Id: <20230821034637.34630-21-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230821034637.34630-1-byungchul@sk.com>
References: <20230821034637.34630-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSXUxTaRCG/c7Pd9qu1WPVeBSNptFoFH8jZqIboxe7fHGzcRNijHgh1Z5I
 YymkKIrRBKWwCJYFXagiurWSUqEKHjRREKkoKBq0lgarwQqFoI1AFS0rUH8A483kyTszz9yM
 jFbVsnNkOsN+0WjQ6NVYwSj6J9uWP/cHtKteNyig8OQqCH/KYaC0yonBfbUSgfP6MQqCTbHw
 fKgPwWjrUxosRW4EF7te0XC92Y+g3nEcQ1vPFPCGQxhaivIwZF6qwvDsXYSCjuJTFFRKf8Lj
 AhsFruE3DFiCGM5ZMqmx8paCYXsFB/aMRRBwlHAQ6VoNLf52FupfLoOzFzow3K5vYaD5ZoCC
 ttpSDH7nNxYeNz9kwF1oZuHKgA3DuyE7DfZwiAOPy0pBtWlMlP3xKwsPzC4KssuuUeB9UYfg
 Tk4nBZKzHcO9cB8FNVIRDSPlTQgC+f0cZJ0c5uDcsXwEeVnFDDz98oAFU0cMjH4uxZvWk3t9
 IZqYag6S+iErQx7ZBHKr5BVHTHdecsQqHSA1jqXk0u0gRS4OhlkiVZzARBo8xZHcfi9FBp48
 4cjDM6MM6fFaqL+i4hW/akW9Lk00rtyYoEi0fgixKTe4Q+eD+gxkwrlILhP4tUKTM4h+ck/e
 yESO+cWCzzdMj/MMfoFQY+5lc5FCRvN//yI43rdODE3ntwmuAjMzzgy/SPj6XxM7zkp+nVB3
 uo79IZ0vVFa7JkTysVyqq504puJjhA9d3cy4VOAz5UK1p4D7sTBbuOvwMQVIaUWTKpBKZ0hL
 0uj0a1ckpht0h1bsSU6S0NhH2Y9Gdt5Eg+64RsTLkHqyMmFuQKtiNWmp6UmNSJDR6hnKqP+7
 tCqlVpN+WDQm7zIe0IupjShKxqhnKdcMHdSq+L2a/eI+UUwRjT+7lEw+JwNtvZIc+6/naJki
 I7J3YJ1ISp5tzikP/dNZ9X6+d8TUabgM06LbWvIca3K2fGbmxl1bFuzt9WQtiUtJuPH7FF9Q
 8kRsfzTE21qnFp+OfJnWvaHcPOn+YJmFa2jYvXhPrNtX+G1eR2fZzOz449EL/fKY3y6cN0Vv
 53bkp+AjnvZufELNpCZqVi+ljama76KH7WBNAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0hTYRjHe99zznuOq9VhGZ00KEbRDbMi4+lC9K1DYHQhoiJ0uIOOptlW
 moFgbVp5Ca3MMqupsdbUtKmQtxyK1jLL0laJSs51sbxkNc1mKzX68vDj///z+/RwlCKPCeA0
 McclXYxKqyQyWrZzsyHI2eNSr2n5HARZ6WvA8+McDXmlxQTa7hUhKK44jaG/aTu8Hh1A4G19
 TkFOdhuC/N5uCiqaexDUWc4QaHfPhg7PMAFHdhoBQ2EpgRdfJjB0XbmIocgWCi2ZBRjs4x9p
 yOkncD3HgCfPJwzjZisL5qSl4LLksjDRuxYcPU4GGm84GKjrXAXXbnYRqK1z0ND8wIWhvTqP
 QE/xHwZamh/T0JaVwUDJUAGBL6NmCsyeYRZe2k0YyoyTtpTvPgYeZdgxpNy+j6HjbQ2Ch+fe
 YbAVOwk0egYwlNuyKfh1pwmB68IgC8np4yxcP30BQVryFRqe/37EgLErBLw/88i2zWLjwDAl
 GsvjxbpREy0+KRDEqtxuVjQ+7GRFk+2EWG5ZKRbW9mMx/5uHEW3W80S0fbvIiqmDHVgcevaM
 FR9f9dKiuyMH71p4ULZFLWk1cZIueGu4LMo0MszEVrInb/Rrk5CRpCI/TuDXC+60X9NM+GXC
 mzfj1BT784uF8owPTCqScRR/dqZg+do6PZrL7xPsmRn0FNP8UsF3q4mZYjm/Qai5VMP8ky4S
 isrs0yK/ydxWU42mWMGHCCO9fXQmkpnQDCvy18TERas02pDV+iNRCTGak6sjjkbb0OTPmBMn
 sh6gH+3bGxDPIeUsefhCl1rBqOL0CdENSOAopb88cKxXrZCrVQmnJN3RMN0JraRvQIEcrZwv
 37FfClfwkarj0hFJipV0/1vM+QUkIe3NznWaFfowXLogdA7O15xnIuo/FHqftu59NSfu58ay
 keDMzqrYxMOo0hHwJD03zNd3KGWu0pdcYS67e1m3ccumU1pF/SUv4axDiZHqJRFs8L4St8+5
 ZwzdGmgfY+LVVsOx3fKIQbL8fVCV84DF0Fc9LzC3aWbYjHqtewkfqqT1Uaq1KymdXvUXeHEZ
 NS8DAAA=
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

