Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B533E78223C
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 06:06:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADE2C10E1A7;
	Mon, 21 Aug 2023 04:06:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id D760C10E193
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 04:05:00 +0000 (UTC)
X-AuditID: a67dfc5b-d6dff70000001748-0b-64e2ded6ddcf
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v10 18/25] dept: Apply timeout consideration to
 wait_for_completion()/complete()
Date: Mon, 21 Aug 2023 12:46:30 +0900
Message-Id: <20230821034637.34630-19-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230821034637.34630-1-byungchul@sk.com>
References: <20230821034637.34630-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0hTcRjG/f/PdavJYQUdMygGERRphuVbRERRHYqgG9EN2mgnHXlr3jKI
 nGkXy7BwrUzMS8ylM/VMuplhipqaaSlLTVeuqKypZW21tMxZfXn58Tzv+/B8eFlCWU3NZnXR
 8aI+WhOpouWkfGh6wWK7w6ld8r0f4OL5JeD+doaE3HIrDR23ShFYqwwYBhs2wguPC8FYWzsB
 JmMHgoKBfgKqGh0IaiypNHS+9Ycu9wgNzcZzNJwsKqfh2adxDH2XL2EolbZAa1YhhlrvexJM
 gzRcM53Ek+MDBq+5hAFzynxwWnIYGB8IgWaHnYKa3kVwNa+Phgc1zSQ03nVi6LyfS4PDOkFB
 a+NjEjouZlJQNlxIwyePmQCze4SB57X5GCrSJoNOff1NQVNmLYZTNyoxdPVUI3h45jUGyWqn
 od7twmCTjAT8LG5A4LwwxED6eS8D1wwXEJxLv0xC+68mCtL6lsHYj1x6zUqh3jVCCGm2JKHG
 k08KLYW8cC+nnxHSHvYyQr6UINgsC4WiB4NYKBh1U4JUcpYWpNFLjJAx1IWF4adPGeHxlTFS
 eNtlwlsD98pXacVIXaKoD16tlkfkTJiY2Dz50R5DJU5Br9kMJGN5LpT3VlUw//lXVgvpY5pb
 wHd3ewkfz+Tm8bbMd1QGkrMEd3oab/ncRvuMGVw4b390G/mY5Obz49XFUwcKbjl/57oB/w2d
 y5dW1E7pskldqr4/ta/klvFfBt6QvlCeOy3jpZsj/1oE8I8s3WQWUuQjvxKk1EUnRml0kaFB
 EcnRuqNBB2OiJDT5Uubj4/vuotGOHXWIY5FqukI9x6lVUprEuOSoOsSzhGqmIvD7gFap0GqS
 j4n6mAP6hEgxrg4FsqRqlmKpJ0mr5MI18eJhUYwV9f9dzMpmp6B1sa+aDwwyxz/uD16750SZ
 qSFqUy+3jm58og6o96S6epMVTUZ39s7Y8O22ednyeLM9IqBNPdwuX7t6g7S51fX5yHqZrGW3
 7YfR47fd0xMa3JMUlq3aaHQUxRR9sbwsK967ybnfmtgZts0gO7TCL33Cb1dqeqvaX/ns47R3
 UkjlDhUZF6EJWUjo4zR/AP+kE2lOAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSfUzMcRzHfb+/x47j12nzG4bdZsiQh/h4mIdhfccyNptms/rN/dTpit0p
 YrZOF4laoY5UerCTKz1cTenBUquUpaiFpLljaF3loYt0Hirzz3uvvd+f9/uvD0+pMpjZvDb8
 hKwPl3RqVkEr9myMWdbV69D49KTNh+TLPuAajqMhvaiAhfbCfAQFZUYMfQ1+8GLEiWCstY0C
 c0o7gmz7GwrKGnsR1OSdY6Hj/XTodA2x0JxyiYWY3CIWnvW7MfSkXsGQb/OHJ0k5GGpHP9Jg
 7mPhpjkGj8snDKMWKweW6IXgyEvjwG1fCc29XQzUZzQzUNO9FG5k9rBQXdNMQ2OFA0NHZToL
 vQV/GHjS+JiG9uQEBu4N5rDQP2KhwOIa4uB5bRaGYtP42vlvvxloSqjFcP52CYbOV1UIHsa9
 xWAr6GKh3uXEUGpLoeDnnQYEjsQBDmIvj3Jw05iI4FJsKg1tv5oYMPX4wtiPdHbrRlLvHKKI
 qfQkqRnJoklLjkgepL3hiOlhN0eybBGkNM+b5Fb3YZL91cUQm/UiS2xfr3AkfqATk8GnTzny
 +PoYTd53mvHeuQcVmzSyThsp61dsDlKEpP0xc8czFadeGUtwNHrLxyMPXhTWiL+SWugJZoVF
 4suXo9QEewkLxNKED0w8UvCUcGGqmPe5lZ0IZgrBYtej+2iCaWGh6K66M1lQCmvF8ltG/G90
 vphfXDvpe4z7tqrKyXuV4Ct+sb+jk5AiC02xIi9teGSYpNX5LjeEhkSFa08tP3wszIbGn8Zy
 1p1cgYY7/OqQwCP1NGXQXIdGxUiRhqiwOiTylNpLOee7XaNSaqSo07L+WKA+Qicb6tAcnlbP
 Uu46IAephGDphBwqy8dl/f8U8x6zo1FA+QZti49Tf3/3mWzn/rvvGvwPHV0tltNF9hkRq+Rl
 O7ZsS+pLVS2OXesZZ52nWfLjav+RQv/W4nXOwpP1YK1srF6nGfgQKu1Uia71t7sjJF3F4A1P
 Y3cT7At+vbXttbhrWGUKWBLo57U9LlHLkGtfLBbnquSMwqFt7pCGfRdy1bQhRFrpTekN0l+b
 Zs2cMAMAAA==
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
consideration to wait_for_completion()/complete().

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/completion.h | 4 ++--
 kernel/sched/completion.c  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/completion.h b/include/linux/completion.h
index 32d535abebf3..15eede01a451 100644
--- a/include/linux/completion.h
+++ b/include/linux/completion.h
@@ -41,9 +41,9 @@ do {							\
  */
 #define init_completion_map(x, m) init_completion(x)
 
-static inline void complete_acquire(struct completion *x)
+static inline void complete_acquire(struct completion *x, long timeout)
 {
-	sdt_might_sleep_start(&x->dmap);
+	sdt_might_sleep_start_timeout(&x->dmap, timeout);
 }
 
 static inline void complete_release(struct completion *x)
diff --git a/kernel/sched/completion.c b/kernel/sched/completion.c
index d57a5c1c1cd9..261807fa7118 100644
--- a/kernel/sched/completion.c
+++ b/kernel/sched/completion.c
@@ -100,7 +100,7 @@ __wait_for_common(struct completion *x,
 {
 	might_sleep();
 
-	complete_acquire(x);
+	complete_acquire(x, timeout);
 
 	raw_spin_lock_irq(&x->wait.lock);
 	timeout = do_wait_for_common(x, action, timeout, state);
-- 
2.17.1

