Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DCA74592F
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 11:50:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC0D10E20E;
	Mon,  3 Jul 2023 09:49:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7089F10E200
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 09:49:45 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-4b-64a299b4b568
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v10 rebased on v6.4 23/25] dept: Record the latest one out of
 consecutive waits of the same class
Date: Mon,  3 Jul 2023 18:47:50 +0900
Message-Id: <20230703094752.79269-24-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230703094752.79269-1-byungchul@sk.com>
References: <20230703094752.79269-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSe0xTdxTH+d3H77aVLjeVZFc0sjQxJm46WdCc4EJAk3ElWXwsMb6SebVX
 aFaqK4KgWcKjMnkqbFBQslEwtaNFasEMUUhFBZEoVSoi1k4IyLC8RFul4CbF+M/JJ+d8z+ev
 r4RUXKPDJWrtMVGnFTRKLKNkE6HGtU2VNar1vf9sgpLC9eB7c5qCqgYrBuclCwJrUxYBY7fj
 4bF/HMHcvR4SDGVOBMbBZyQ0dXgQtJqzMfQOfwYu3xSGrrICDDm1DRgeeOcJcJeXEmCxfw/d
 Z2sIcMyOUmAYw3DekEMsjH8JmDXVMWDKXAVD5nMMzA9GQpenj4bWgS+h8g83huutXRR0NA8R
 0NtShcFj/Z+G7o47FDhLimion6zB4PWbSDD5phh46KgmwKZfEOW+/o+GziIHAbkXLhPgenIN
 Qdvp5wTYrX0YbvrGCWi0l5EQuHgbwVDxBAOnCmcZOJ9VjKDgVDkFPe87adC7N8DcuyocG83f
 HJ8ieX3jcb7VX03xd2s4/uq5Zwyvbxtg+Gp7Kt9oXsPXXh8jeOOMj+btdXmYt8+UMnz+hIvg
 J+/fZ/g7FXMUP+wyENuX75V9qxI16jRR93XMAVnSi6oK+ujbJelFD9qoTNQrzUdSCcdGcS3N
 ncwnHv7rbxxkzK7m+vtnySCHsV9wjUUv6Hwkk5Dsr0s48/S9xdBS9mfueXeACjLFruLyvOUo
 yHJ2I9fS4aA/SiM4i82xKJIu7EfeFS9mFOwGzl3pwUEpx56RcvorbvLjwzLuhrmfOovk1Sik
 DinU2rRkQa2JWpeUoVWnrzt0JNmOFipl+mV+XzOacf7QjlgJUobK+08aVQpaSEvJSG5HnIRU
 hslzBv9UKeQqIeOEqDvyoy5VI6a0o+USSvm5/Bv/cZWCTRSOiT+J4lFR9+lKSKThmWhj9IrI
 0fhpzAYeekfEkaSelY67jnDNeOyeuLDVoY+uNkTsCFg216f/VuD86jubt/biU2tYoWDofto5
 2XPrcJ8rM+DZlphtPzgadTBRKD3kt+2Pdp0pjvl995udV2Qxr6Jstw7U+xJePuZeJRjjjXup
 2JFL87lx2q2H91t27QvdEqKkUpKEyDWkLkX4AG/pntpOAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSbUxTZxiG977nnPe0dV2OlcwTNJnpJBjmVJLVPAnGEBP1zYxsIVGT/cHG
 noxOQGkVZcQIa0UFS8CFTyuDoh1CBW2JHyCkKREthA8tcQyPBEhlNCBszqJ8KALL/jy5ct93
 rl+PgtFc5SIVxrQTkilNn6IlKlaVEGf5uqncYdh2x7cRii5tg/CbCyzYG10E+hrqEbiacjCE
 Hu6FP2YmEcx39zJQWtyHoHrkBQNNHUMIWmt/IRAIfgb94WkC/uJ8ApaaRgJPJhYwyCWXMdS7
 90NXoQODd/YvFkpDBK6UWvDSGccw66zjwZkdBaO1FTwsjMSCf+gZB+1X/Ry0Dn4F5ZUygQet
 fhY67o1iCDTbCQy5Fjno6njMQl+RjYObUw4CEzNOBpzhaR6eeqsw3LIu2XL//cDBI5sXQ+61
 2xj6/2xB0HZhGIPb9YxAe3gSg8ddzMDc7w8RjBa84uHcpVkeruQUIMg/V8JC7/tHHFhlHcy/
 s5P4ONo+Oc1Qq+cUbZ2pYmmnQ6T3K17w1No2yNMq90nqqY2hNQ9CmFa/DnPUXXeRUPfryzzN
 e9WP6VRPD08fl82zNNhfir9f/4Nqh0FKMWZIpq07D6uSx+xl3PG3q07bnrSx2SigzENKhSh8
 IwZv3CXLTIRocWBgllnmCGGD6LGNcXlIpWCE86vE2r+7V0ZrhHRxuGuOXWZWiBIvTpSgZVYL
 28XmDi/3n/QLsf6Wd0WkXMpfvitY2WgEnSiXD5FCpKpCn9ShCGNaRqremKLbYj6anJlmPL3l
 yLFUN1p6GueZhaJ76E1grw8JCqT9VD2QVW3QcPoMc2aqD4kKRhuhtoz8ZtCoDfrMnyXTsSTT
 yRTJ7EPrFKx2rfrbQ9JhjfCj/oR0VJKOS6b/W6xQRmYj+55Nm6NaxtWxNQk5eHW3vDMrWohE
 Olf8KYdvPmYx8Z/hRtvLs8rvps6SXxsS5c0Lu1s6Nx0IBUP7749VymavRkfXr/kp3vJ53K6K
 wYaQ5+5iel5qcKThy2ZlTmFFtMzJuc+vJ+VHdM7J7Nr39aJ/pld/MC4wtU/qDbt9k1Yta07W
 x8YwJrP+I9840PEwAwAA
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

