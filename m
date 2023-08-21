Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 669AC782230
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 06:05:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC92F10E1A0;
	Mon, 21 Aug 2023 04:05:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id D53FE10E18F
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 04:05:00 +0000 (UTC)
X-AuditID: a67dfc5b-d6dff70000001748-1b-64e2ded6ac26
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v10 19/25] dept: Apply timeout consideration to swait
Date: Mon, 21 Aug 2023 12:46:31 +0900
Message-Id: <20230821034637.34630-20-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230821034637.34630-1-byungchul@sk.com>
References: <20230821034637.34630-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSfUzMcRzHfb+/xzud/Xba/Iix27BleWafYcbGfDcamxmL4eZ+03FduVLO
 ZrtTkp5UWw9oVrHrekB+2RCXU4pKiW4JaTp5SE+Ui1Me7sI/n732eX8+r33++PCU+jYzg9cb
 YySTUWvQsEpaORBQGPK8y61bnLUBMlMXg+drEg3518pZaL1ahqD8hhVDb90meD7aj2Cs+QkF
 udmtCAq7X1Nwo74LgcN+koW2ning8gyx0JCdwkL8pWssPO0bx9CZk4WhTA6FpowiDE7vBxpy
 e1m4kBuPfeUjBq+tlAObZS647ec5GO9eAg1d7Qw4Xi6Acxc7WbjraKCh/pYbQ1tVPgtd5b8Z
 aKp/RENrZhoDVwaLWOgbtVFg8wxx8MxZgKEiwSdKHPnFwMM0J4bEy9cxuF7cQVCd9AaDXN7O
 Qq2nH0OlnE3Bj+I6BO70AQ5OpXo5uGBNR5ByKoeGJz8fMpDQuQLGvuez61aR2v4hiiRUxhHH
 aAFNGotEcvv8a44kVL/kSIF8lFTag8mlu72YFA57GCKXnmGJPJzFkeQBFyaDLS0ceZQ3RpMe
 Vy7eFhSmXKOTDPpYybRo7X5l+Mc3oVEj7DFr9WfaghqZZKTgRWG5mJflpP/zg2dJlJ9ZYb7Y
 0eGd4EBhjliZ9t43r+Qp4fRk0f65mfUHU4Ut4oOrI5yfaWGu2CgPTSyohJXi/bMt1F/pbLGs
 wjnBCl9fvlOF/KwWVohfut/SfqkonFaI77yN/66YLt63d9AZSFWAJpUitd4YG6HVG5YvDDcb
 9ccWHoiMkJHvoWwnxnffQsOt22uQwCNNgGr/TLdOzWhjo80RNUjkKU2gKuhbt06t0mnNxyVT
 5D7TUYMUXYOCeFozTbV0NE6nFg5qY6TDkhQlmf6nmFfMsKCwI4a2KSGWUO8cxhxIr7aHcOun
 625+iH0HUenXA1aRijXjuKrBPCtnfeayn5/mReW9aiaH9rzYXB+f5qhrexyy2mF53DkrZjCj
 pK+9uDYopYnfaw0eDru4yHzosLAjskR173dgyd5daNpavWhL3al4lWM9YIwrTkzu2aDa6BrY
 qqGjw7VLgilTtPYPTYEwIEwDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSfUzMcRzHfX8P3991XPs5mR8y3CQLiSmfYWYz853J/OH5H93cb7p1pd2R
 ylinQx56MokKJ5xWp/K7kIdrp4jLeqAW2Wk6hVsl5CIVrsw/7732fn8+77/eMlpZwE6TaeP2
 ifo4tU6F5Yx844rUha3tbk1Yhn0uZJ8OA+/3NAYKyqwYmkpLEFgrjBR4nqyDVwM9CIbqG2nI
 zWlCcKXjLQ0Vte0I7EVHMDR3+kOLtw+DM+cUhtSrZRhedA9T4Dp3hoISKRKeZxVS4Bj8yECu
 B0N+birlk08UDFqKObCkBIG7KI+D4Y7F4GxvZaHmopMF+5v5cOGSC8NDu5OB2ko3Bc33CzC0
 W/+w8Lz2GQNN2eks3PxciKF7wEKDxdvHwUuHmYJyk6/tWP9vFp6mOyg4du0WBS1tDxBUpb2j
 QLK2Yqjx9lBgk3Jo+HXjCQJ3Ri8HR08PcpBvzEBw6ug5BhpHnrJgcoXD0M8CvHoFqenpo4nJ
 doDYB8wMqSsUyL28txwxVb3hiFnaT2xFIeTqQw9FrnzzskQqPoGJ9O0MR072tlDkc0MDR56d
 H2JIZ0sutSlwp3ylRtRpE0T9olVR8uhP7yLj+3GiseoLk4Lq2JPITybwS4XHL9PoUcZ8sPD6
 9eAYB/CzBFv6B9+NXEbzx8cLRV/q8Wgwid8gPC7t50aZ4YOEOqlv7EHBRwiPMhvof6UzhZJy
 xxj7+XzpwX00yko+XPja8Z7JQnIzGleMArRxCbFqrS481BATnRSnTQzdvTdWQr7NWA4NZ1ei
 783rqhEvQ6oJiqhAt0bJqhMMSbHVSJDRqgDF9B8dGqVCo05KFvV7d+n360RDNZouY1RTFOu3
 iVFKfo96nxgjivGi/n9KyfympaCuRDEItmRNrmuMyUgODntf4tCFkx9TlgVGdM+5tbs8cOeO
 S4eMnuV+zbd3zB1Y8qFybdCf0DvnI4I9m9eY2BnbuytcOJl1tdWv+sjG/3bmHe4ZaYscb3Vs
 Pbs083bmgsl3R+QO4/YXbb1dExWKnFfZXQendl6+Ps9xQrRPnW0L8WdVjCFavTiE1hvUfwHo
 Dif3LwMAAA==
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
consideration to swait, assuming an input 'ret' in ___swait_event()
macro is used as a timeout value.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/swait.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/swait.h b/include/linux/swait.h
index 02848211cef5..def1e47bb678 100644
--- a/include/linux/swait.h
+++ b/include/linux/swait.h
@@ -162,7 +162,7 @@ extern void finish_swait(struct swait_queue_head *q, struct swait_queue *wait);
 	struct swait_queue __wait;					\
 	long __ret = ret;						\
 									\
-	sdt_might_sleep_start(NULL);					\
+	sdt_might_sleep_start_timeout(NULL, __ret);			\
 	INIT_LIST_HEAD(&__wait.task_list);				\
 	for (;;) {							\
 		long __int = prepare_to_swait_event(&wq, &__wait, state);\
-- 
2.17.1

