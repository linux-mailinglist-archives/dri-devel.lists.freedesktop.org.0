Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A265D73EC88
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 23:05:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BC3D10E265;
	Mon, 26 Jun 2023 21:05:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5AA3F10E1FC
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 12:13:55 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-17-64997d6e5ce2
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v10 23/25] dept: Record the latest one out of consecutive
 waits of the same class
Date: Mon, 26 Jun 2023 20:56:58 +0900
Message-Id: <20230626115700.13873-24-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230626115700.13873-1-byungchul@sk.com>
References: <20230626115700.13873-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0hTYRjHe8/lPWfLyWHdThcqBhEVlXZ9oIj8EL0QURBR2Ie22kFXOmuW
 aRRYWth0lpJOTcpLLfGSNosuOllWpmWlqdNiWdnFtKlhznRbly3py8OP//95fp8enlbWsbN4
 nf6IZNBrolRYzsgHggqX6k/makOqXDMgIy0E3CMpDORXlmNouVGGoPzWKQr6Hm+GzlEXAu/z
 lzSYs1oQFH54S8Othm4EtpLTGNo+BUO7ewhDU1YqhqTiSgyt33wUOLMzKSizboVnF4oosI/3
 MmDuw3DJnET5x1cKxi2lHFgSF0BPSR4Hvg+h0NTtYMH2ZgnkXnZiqLU1MdBwt4eCtvv5GLrL
 /7DwrKGRgZYMEwsVg0UYvo1aaLC4hzh4ZS+goCrZL+r32Sg4++M3C09Mdj9dvUlB++saBHUp
 7ymwljswPHS7KKi2ZtHguf4YQU/6AAdn0sY5uHQqHUHqmWwGXv56wkKyczV4x/LxxnXkoWuI
 JsnVx4httIAhT4tEci/vLUeS695wpMB6lFSXLCbFtX0UKRx2s8Raeg4T63AmR4wD7RRxOmox
 GXzxgiONOV5m+5xw+XqtFKWLkwzLN6jlkV/yc9hDPyfHm1rrmETUJjMiGS8Kq8TmwXH6P/d6
 jFSAsbBQ7OqayKcK88Vq0xfWiOQ8LRRPFnsbH3FGxPNTBI14cSgmsMMIC8SqYgcKxAphjeis
 CJtQzhPLquz/NDJ/XNNchAKsFFaLp531OKAUhfMyMd3rwBMHM8UHJV3MBaQoQJNKkVKnj4vW
 6KJWLYtM0Ovil+2PibYi/1dZTvr23EXDLTvqkcAjVZAiZG6OVslq4mITouuRyNOqqYrpY2at
 UqHVJByXDDF7DUejpNh6NJtnVDMUK0aPaZVChOaIdFCSDkmG/y3Fy2YlomzX2QM3TT2DuWE7
 44PUFWrSPJKaZ+u4Funpx9uEK+yruR519sd3WYsM8ginYnro7UfhvzqD1dNOrG0Ne5pkT9Fu
 Eb1tEbYtuZ8SP4/4jP0Rh+/omzM6Qu2792V2fv3+08xNkdUsCQr2/AhbE20gK3d1D8+pZDLe
 d5zblBZ/cOuYiomN1IQupg2xmr8IlczpUQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSfUzMcRzHfb+/xzsuv53GD0NunlaT2mSf0TxtrR8bM3+wmdHN/dSpK+4S
 ebxU1HEp06NwXZx0IZc/UNdy0YNIdEvshJhEOouLHsQd8897r70/n73+erOE3ERNY9XxiaI2
 XhmnoKWkdP2y1IWaw4WqkMevl0HOqRDwfM8gofhGBQ1t160IKm6lYOh9EAnPB/sQjDx+QkB+
 bhuCkrevCLjV0IXAXnaMhvb3fuD0uGlozj1JQ2rpDRqefh7F4Mo7g8FqWwct2WYMdUM9JOT3
 0nAuPxV74yOGIUs5Axb9XOguK2Jg9G0oNHd1UFB/vpkC+8sgKLzgoqHG3kxCw+1uDO13i2no
 qvhNQUtDEwltOUYKrvWbafg8aCHA4nEz8KzOhKEyzWv7NGrHcPzbGAWNxjovXbqJwfmiGkFt
 xhsMtooOGuo9fRiqbLkEDF95gKA76wsD6aeGGDiXkoXgZHoeCU9+NVKQ5gqDkZ/F9Mpwob7P
 TQhpVfsE+6CJFB6aeeFO0StGSKt9yQgm216hqixQKK3pxULJgIcSbOWZtGAbOMMIhi9OLLg6
 amihv7WVEZoKRsgNM7ZIw1VinDpJ1C5aHiWN+VBcQO3+MX6/8WktqUftEgOSsDy3mO8ZNmAf
 09x8vrNziPCxPxfAVxk/UAYkZQmudDzf03SfMSCWncQp+bPuBN8Pyc3lK0s7kK+WcUt417VV
 /5SzeGtl3V+NxFtXPzIjH8u5MP6Yy0FnI6kJjStH/ur4JI1SHRcWrIuNSY5X7w/ekaCxIe9u
 LIdHc26j7+2RDsSxSDFBFjKzQCWnlEm6ZI0D8Syh8JdN/pmvkstUyuQDojZhu3ZvnKhzoOks
 qZgiW7tZjJJz0cpEMVYUd4va/1fMSqbpUezl00GujfMCLm1fmtsTYNfPOc7fjFrgrJfUpLQE
 XwkcHjP5rdjkMK+bmKhfvbMxepdk/td3+MhU/fCqkg3ZR4x7Ln4svKoJjzm0JvFgbeTsQEV/
 Z9bR68Gh807cu+O6GzGhwW1C2yLSX2/J3GolWvdt6l5kUY85Dffzipb/sE40TJmqIHUxytBA
 QqtT/gH3/dofMwMAAA==
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

The current code records all the waits for later use to track relation
between waits and events in each context. However, since the same class
is handled the same way, it'd be okay to record only one on behalf of
the others if they all have the same class.

Even though it's the ideal to search the whole history buffer for that,
since it'd cost too high, alternatively, let's keep the latest one at
least when the same class'ed waits consecutively appear.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 kernel/dependency/dept.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/kernel/dependency/dept.c b/kernel/dependency/dept.c
index 52537c099b68..cdfda4acff58 100644
--- a/kernel/dependency/dept.c
+++ b/kernel/dependency/dept.c
@@ -1522,9 +1522,28 @@ static inline struct dept_wait_hist *new_hist(void)
 	return wh;
 }
 
+static inline struct dept_wait_hist *last_hist(void)
+{
+	int pos_n = hist_pos_next();
+	struct dept_wait_hist *wh_n = hist(pos_n);
+
+	/*
+	 * This is the first try.
+	 */
+	if (!pos_n && !wh_n->wait)
+		return NULL;
+
+	return hist(pos_n + DEPT_MAX_WAIT_HIST - 1);
+}
+
 static void add_hist(struct dept_wait *w, unsigned int wg, unsigned int ctxt_id)
 {
-	struct dept_wait_hist *wh = new_hist();
+	struct dept_wait_hist *wh;
+
+	wh = last_hist();
+
+	if (!wh || wh->wait->class != w->class || wh->ctxt_id != ctxt_id)
+		wh = new_hist();
 
 	if (likely(wh->wait))
 		put_wait(wh->wait);
-- 
2.17.1

