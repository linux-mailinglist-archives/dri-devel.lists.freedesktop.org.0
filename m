Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED225782236
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 06:05:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 318ED10E1A6;
	Mon, 21 Aug 2023 04:05:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.hynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2DB6810E195
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 04:05:01 +0000 (UTC)
X-AuditID: a67dfc5b-d6dff70000001748-5b-64e2ded78431
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v10 23/25] dept: Record the latest one out of
 consecutive waits of the same class
Date: Mon, 21 Aug 2023 12:46:35 +0900
Message-Id: <20230821034637.34630-24-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230821034637.34630-1-byungchul@sk.com>
References: <20230821034637.34630-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSW0xTWRSG3fvsc2mx5qRD4lGMaBOjkYwK8bJi1Phg4vGuOIlRH7ShZ4aO
 BU0rWDRGkAKKYNSkFBW1gFMbKIIHH+TWdGoA6wWqNIgEiVSjEkEEbRHBC6C+rHxZ/8qX9fBz
 lLqWnsnpkw9LxmStQcMoibJ/asmfT7uDuiUVF6PhfN4SCH06RaCo0sWA/2Y5AtftDAy9jevh
 abgPweijVgpsVj+C4p7nFNxu6kbQ4DzJQNuraRAIDTDgs55hILO0koHH78YwdBVcwFAub4EH
 50oweEbeELD1MnDZlonHx1sMI44yFhzp8yDovMTCWE8s+LrbaWjojIGLV7sYqG/wEWi6E8TQ
 VlvEQLfrOw0Pmu4R8J/Pp6HifQkD78IOChyhARaeeOwYqizjouyP32hozvdgyL5+C0PgWR0C
 96kXGGRXOwN3Q30YqmUrBV9uNCIInu1nIStvhIXLGWcRnMkqIND6tZkGS9cyGP1cxKxdKd7t
 G6BES/URsSFsJ+L9EkGsufScFS3uTla0yylitXOhWFrfi8XioRAtymWnGVEeusCKuf0BLL5v
 aWHFe4WjRHwVsOHtUXuUq3SSQZ8qGRev2a9MfF1USB8ajjDnP3aTdNSmyEUKTuCXCo1lb/Fv
 zrl+n5pghp8vdHSMTHIkP0eozn9N5yIlR/E5EYLzwyNmIviDTxRO51nRBBN+nhAs+ExyEcep
 +OVCRenin85oobzKM+lRjK/lutrJczW/TBjseUkmnAKfoxDkwapfT8wQ/nd2kHNIZUdTypBa
 n5yapNUbli5KTEvWmxclHEyS0XijHMfH9t5BQ/6dXsRzSDNVtX9WUKemtammtCQvEjhKE6mK
 Gu7RqVU6bdpRyXhwnzHFIJm8KIojmumquPARnZr/R3tYOiBJhyTj7xRzipnpaPNqc8KVv0wR
 VuuqeMfxaSR2xbOxuf/Fk0Kye85y5ZZQzcP44roD63JSYrb60C5DXDjS6dq2YLBzdYuCyeq7
 Zv+Y4f43kBlodW9vNnzx+L6fmDU7wW8H+db60JNNsOfTy41h2zFLV7/Z6fXvqNnw90ZznOph
 b71nb3THsLE926shpkRt7ELKaNL+AG/veZdNAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0hTcRjG+5+7q8VhGR1MsBYSqF2EVi9YEX3IU9EFMgyjcrRjjnTGlqZF
 YLk0zUVKauWqeWGZ07QtyLxhipdp3trQMpWclYmaZW611EqNvrz8eJ6H36eXwSV60otRqs4L
 apU8SkqJCNHBoKQNvYMOxWaTnoaM9M3gnL5OgL6shIKuJyYEJc+uYDDaGAy9rnEEM+2dOORk
 dSHIGxrA4VnTIIKaoqsU2D4sB7tzkgJr1g0KkgrKKOgem8WgPzsTA5P5ALTdysegzj1CQM4o
 Bbk5Sdj8+YyB21hMgzHRFxxF92iYHQoE62APCQ33rSTU9PnD3Qf9FFTXWAloqnBgYKvUUzBY
 8oeEtqYWAroydCSUfsmnYMxlxMHonKThdZ0Bg3LtvC35+28SmnV1GCQXPsXA/rYKQe319xiY
 S3ooaHCOY2AxZ+Hw61EjAsfNCRqupbtpyL1yE8GNa9kEdM41k6Dtl8HMTz21K4hvGJ/Eea3l
 Al/jMhB8az7Hv7g3QPPa2j6aN5hjeUuRH19QPYrxeVNOkjcXp1K8eSqT5tMm7Bj/paOD5lvu
 zBD8B3sOdtg7TLRdIUQp4wT1pp3hoshP+jvkuR9L43XdtUQisnmkIQ+GY7dwKYWt+AJT7Hru
 zRv3InuyaziL7hOZhkQMzqYs5Yq+tlMLxQo2kktNz0ILTLC+nCP7J5GGGEbMbuVKCzb9c/pw
 pvK6RY/HfGyuqlycS1gZ921omLiFRAa0pBh5KlVx0XJllGyj5mxkgkoZv/F0TLQZzf+M8fJs
 RgWatgXXI5ZB0mXicG+HQkLK4zQJ0fWIY3Cpp3j1jyGFRKyQJ1wU1DGn1LFRgqYerWYI6Srx
 vlAhXMKekZ8XzgrCOUH9v8UYD69ERBypro1Y2dDh23rQuUob9vaRe1KWvWxHsc/tgKCqE9Ou
 d9u9XnV1RFhOPpSlhATUV4zu37UvMXMtld6413DGVukX3+nfclxZ3n5Ml/lUmWyd89k/dbz0
 6Lbgj4/3huwsG5sLs1xac1o1HPFyZCYld/dESOrlUPu6Q6zLew89sq35uUlKaCLlgX64WiP/
 C5lDZM0vAwAA
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

