Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5945E73EC73
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 23:04:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7291110E24F;
	Mon, 26 Jun 2023 21:03:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 35E1B10E1F5
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 12:13:55 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-d1-64997d6d3450
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v10 19/25] dept: Apply timeout consideration to swait
Date: Mon, 26 Jun 2023 20:56:54 +0900
Message-Id: <20230626115700.13873-20-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230626115700.13873-1-byungchul@sk.com>
References: <20230626115700.13873-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAz2SbUxTZxTHfe7Lcy/Vmrti5p0aX2rIMhYcLOCOLxnGxPj4bmKcC0u21fVO
 mtFKiiIYMSB1VhRUFAqIWsrSEajTtXxAoA2ilDcFBgxQK0NgIgpC0DK7Ml3B6JeTX/7nf36f
 Dk8rXOwCXqM7IOl1qjglljGy0TmWMG1Kvjp8aHwlnDsdDt6XRgYKr9kwtP1WhsBWnkbBcN1G
 6J4cQeC/20qDKacNQdGjhzSUu3sROEuOYegYnAud3jEMjTmnMKQXX8Pwx7MpCjy52RSU2bdB
 81kLBTW+IQZMwxgumtKpwHhCgc9ayoE1NQT6Swo4mHoUAY29XSw4738K+Zc9GKqdjQy4K/op
 6KgsxNBre8NCs7uBgbZzmSxcfW7B8GzSSoPVO8ZBe42ZguuGgOjplJOCn1+8ZqE+syZAv/xO
 Qee9KgQuYx8FdlsXhlveEQoc9hwa/v21DkF/1igHx0/7OLiYloXg1PFcBlr/q2fB4IkC/6tC
 vG4NuTUyRhOD4xBxTpoZ0mQRyY2ChxwxuO5zxGw/SBwloaS4epgiRRNelthLT2Jin8jmSMZo
 J0U8XdWYPG9p4UhDnp/ZuShGtlYtxWkSJf1nX34vi33Sty3+BU5Kc40zqaiJzUBBvChEikM5
 xvf8OLV5hrHwsdjT46OneZ6wVHRkPg7kMp4WimeLQw23uQzE88HCBtF5InS6wwghYmu9H02z
 XFgpDvrq8VvnErHses2MJyiQV92xzHQUQpR4zFOLp52icCZItI3UMW8PPhJvlvQwZ5HcjGaV
 IoVGl6hVaeIiV8Qm6zRJK37Yr7WjwFdZU6a+qUATbbtqkcAj5Rx5+OI8tYJVJSYka2uRyNPK
 efIPX5nUCrlalXxY0u//Tn8wTkqoRQt5Rjlf/vnkIbVC2Kc6IP0kSfGS/t2W4oMWpCLt9jch
 UtOFyDsLo9coBr6WnyzO+xOKXof5TgQnHSW+1TGLhH92rP97a9hgXUd6X/NAZxa353DFKvfL
 q+ymI/vW8Ze6pT26ivIv5u9ebozpm/1BAYnavDElrf2rmxIZ/mTgyLcu3Y+3xyvd/ugWx9GI
 Zdl/PdhrzDJXnm9Xtd81XNkSrWQSYlURobQ+QfU/KDy/gVEDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0hTcRjG+5/L/xxXi8OSPHQzVhEZ3iDjLUdEUJ2CLoQV3R3u1Fa6aivT
 otS0LG2SgZqXZLlYopY2AzWdLU03s9RS7LYkzS6WaVQbLe0yjb68/Hieh9+nlyVlRnoaq9Ee
 EXVaZbQcSyjJ+vDkwJiTuaoQW8EMyLwQAq7v5ygoKC/D0HGzFEHZ7SQCBppWw1P3IIKRR+0k
 5GR1ILja+4qE2809CKzFpzF09k+GLtcwhpasdAzJpnIMjz+NEuDMvkRAqWUdtF4sIsDmeU9B
 zgCG/Jxkwns+EOAxlzBgTpwHfcV5DIz2hkJLTzcNjVdaaLC+WAi5hU4MddYWCpqr+wjovFOA
 oafsDw2tzQ4KOjINNNwYKsLwyW0mwewaZuCJzUhARYrX9nHUSsDZb79psBtsXrp2i4Cu57UI
 6s+9JsBS1o2h0TVIQKUli4Sf15sQ9GV8ZuDMBQ8D+UkZCNLPZFPQ/stOQ4ozDEZ+FODlCqFx
 cJgUUiqPCVa3kRIeFPFCTd4rRkipf8EIRstRobI4QDDVDRDC1a8uWrCUnMeC5eslRkj73EUI
 zu46LAy1tTGC4/IItXHmdolCJUZrYkVd8LJIifrD63WHvuG4pPovVCJ6QKchH5bnFvHvElvH
 GXPz+WfPPOQY+3Kz+UrDO28uYUnONJF/77jPpCGWncKt5K2pAWMbipvHt9tH0BhLucV8v8eO
 /zn9+dIK27jHx5vXPiwa38i4MP60swFfRBIjmlCCfDXa2BilJjosSH9AHa/VxAVFHYyxIO/f
 mE+OZlaj752rGxDHIvkkacisyyoZrYzVx8c0IJ4l5b7SqT9yVDKpShl/XNQd3KM7Gi3qG9B0
 lpL7SdduFSNl3D7lEfGAKB4Sdf9bgvWZlohOrGrbVDIn1G1oOvzkrnzDnv3bFYqq6RPLTVXz
 sxL8a+qiKGvg3Ijfszbf6P+ozrAbOtW7wo/fi5jDvzncHmDIqGh8mXc/1m/NqQXlvcsmO76U
 7l4wJFuqzG5K2FKxY3fydUe63O4mg0CxcefbhCV7kXbKy8LUOL/wPzd9t5lWRNQHyym9Whka
 QOr0yr8K6JCoMwMAAA==
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

