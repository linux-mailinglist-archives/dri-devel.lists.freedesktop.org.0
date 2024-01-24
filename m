Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C7E83A95F
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 13:16:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 975D010F724;
	Wed, 24 Jan 2024 12:15:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.hynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0107110F6F4
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 12:15:10 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-65-65b0fbb6c9f0
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v11 18/26] dept: Apply timeout consideration to swait
Date: Wed, 24 Jan 2024 20:59:29 +0900
Message-Id: <20240124115938.80132-19-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240124115938.80132-1-byungchul@sk.com>
References: <20240124115938.80132-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0hTcRjG+//Pbc4WpyV1Vh+qYRRWmqLxEhESVCciCiKJImq0gy6nxUzN
 otK85qWs0OWFcCZrTG22WZppLEXTorSSWjZFzS7ipuWauGbWNPry8uN5n+f59IgI6WNquUgV
 f0bQxCvUclpMip0LdRsbvHXCptyS1XA9fxO4f+aQUG6qoaHnXjWCmvo0DKPtu+D9lAOB92U3
 AdqiHgS6oX4C6jsGELQYLtPwdmQR9LonaOgqyqMh/Y6JhtdjMxjsxTcwVJv3wovCSgxWz1cS
 tKM0lGnTse98w+DRGxnQp66BYUMpAzNDodA18I6Clr71UHLbTkNzSxcJHY3DGN42ldMwUPOH
 ghcdnST0XC+goHa8koaxKT0BevcEA2+sFRjqMnxFWa5ZCp4VWDFkVd3H0PvhMYInOYMYzDXv
 aGhzOzBYzEUE/LrbjmD4qpOBzHwPA2VpVxHkZRaT0P37GQUZ9gjwTpfTkVv4NscEwWdYkvmW
 qQqSf17J8Y9K+xk+40kfw1eYE3mLIYi/0zyKed2km+LNxis0b568wfC5zl7Mj796xfCdt7wk
 P9KrxftXHBZvVQpqVZKgCdl2XBxjGklDp130WW17FZWKnlO5yE/EseHcbEED/Z+z2/LRHNPs
 Ws5m8xBzHMCu4iwFX3x+sYhgs/05w/eX84El7A5u3FU7byLZNVx3kwvPsYTdzGWmWsh/pSu5
 6jrrvMfPp9eW9M3rUjaCGzReY+ZKOTbPjyv7XM78C8i4pwYbWYgkFWiBEUlV8UlxCpU6PDgm
 JV51NvjEqTgz8k1Kf2HmSCOa7DnQilgRki+URBpNgpRSJCWkxLUiTkTIAyQ22T1BKlEqUs4J
 mlPHNIlqIaEVrRCR8mWSsKlkpZSNVpwRYgXhtKD5/8Uiv+WpKC5A1l//7Yc30pq3SuYfWNo9
 Ott5SBy+M9Tuv/27f/DXxddC9jSgxNiHGwOjQprH7K1CoX1DUNj5LJty7Vj07o+HfwZ5bg4d
 PfBp5tc6dVdxrLyakVWRmcqTSx8cPPRbF+HcbbqY4nCtNgbu62x0G+/rDE9XTjuRK2qw482l
 9Q6bnEyIUYQGEZoExV8xoGXATgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSfUhTaxzHe55zznOOq8VxLTrXLtx7F9IbZUXGj+wdyocLNwuCoKIaeciR
 mmw2Neg2r1t2S0sD2630XrNYOjVtq7ByMRxqy3KmYiYmKfYimkZr3tbsZRr98+PD9/vh+9dP
 YFQlXJSgS02X9anaZA1RsIqtcTlLbodq5WV1uQCFecsg8OEkC8U1VQTarlciqLqZjWGoMR6e
 jo8gCD32MWAtakNwuf85Azeb+hC4yv8i0DE4EzoDYwS8RacJ5FypIfBkeAJD7/lzGCodf0BL
 QRkGd/A1C9YhApesOTh83mAI2uw82EzRMFB+kYeJ/uXg7eviwFPi5cDVsxgu/NtLoN7lZaGp
 bgBDx91iAn1VXzloaXrAQlthPgfVo2UEhsdtDNgCYzy0u0sx1JrDayf8XzhozndjOHH1BobO
 Z/cQ3D/5AoOjqouAJzCCwekoYuDTtUYEA2fe8mDJC/JwKfsMgtOW8yz4PjdzYO6NhdDHYrIh
 jnpGxhhqdmZQ13gpSx+WSfTOxec8Nd/v4Wmp4wh1li+iV+qHML38PsBRh/1vQh3vz/H01NtO
 TEdbW3n64J8QSwc7rXjbz7sUaxLlZJ1R1ses269IqhnMRml+kmltvMqZ0EPuFIoQJHGllOvJ
 Q5NMxPlSd3eQmWS1+KvkzH8VdhQCI+ZOl8rfPSaTxSxxszTqr56SWDFa8t3140lWiqski8nJ
 fh/9RaqsdU85EeG8+kLPVK4SY6UX9rN8AVKUoml2pNalGlO0uuTYpYZDSVmpusylBw6nOFD4
 aWzHJgrr0IeO+AYkCkgzQ7nBXiOrOK3RkJXSgCSB0aiV3T9dl1XKRG3WUVl/eJ/+SLJsaEBz
 BVYzR/n7Tnm/SjyoTZcPyXKarP/RYiEiyoRMCZ7cYELzJv2bzxs/9bfkx3u2VphGF+y9Fbvl
 ltHSwGaY9qx+VbBwOz22OrJi1dr/MxdbyPqX3tm1w1q8wufZ7HbVTTs+M+bPsd1R5nZfXJ/y
 SYxuXoTxbFFJSZag1oQy/Pt+2y1VpO3Qixt9Tmw2z2vdon4UeY/a0itb/1MlaFhDknb5IkZv
 0H4DOWK59jADAAA=
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
index 277ac74f61c3..233acdf55e9b 100644
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

