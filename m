Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D84F683A95D
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 13:16:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A34D10F732;
	Wed, 24 Jan 2024 12:15:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2DF4810F72F
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 12:15:11 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-a5-65b0fbb74714
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v11 22/26] dept: Record the latest one out of consecutive
 waits of the same class
Date: Wed, 24 Jan 2024 20:59:33 +0900
Message-Id: <20240124115938.80132-23-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240124115938.80132-1-byungchul@sk.com>
References: <20240124115938.80132-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSe0yTZxSHfd/v2mrdl47oK25xaUK2weSyiR51UWN0fiY6tkwTcTHawReo
 FDAFQUxIEIoybgKxFhQJoqm1oGDBiBYYg3DTcNkgiqwwrERt5JZi0QKyAcZ/Tp6c3/k9fx2e
 UtoYb14TEy/pYtRaFSun5WMrytbfm62SAsdTgyE/OxDcbzJoKK6sYKHndjmCipozGJwte+DJ
 9CiC2c5uCoyGHgRXnw1SUNM6hKDenMpC78hK6HNPsNBhyGIh7VolC3+9nsNgv1iAody6Hx7l
 lWFo9Lykwehk4bIxDS+MVxg8JgsHphQfcJgvcTD3LAg6hh4zUD/gB0Uldhbq6jtoaK11YOh9
 UMzCUMV/DDxqbaehJz+HgVvjZSy8njZRYHJPcPB3YymGKv2C6OzUPANtOY0Yzl6/g6HvqQ1B
 Q8YwBmvFYxaa3aMYqq0GCmZutCBw5I5xkJ7t4eDymVwEWekXaeh+38aA3h4Ms++K2R1bxObR
 CUrUVyeK9dOltPiwjIj3Lw1yor5hgBNLrSfFarOveK3OicWrLjcjWi2/s6LVVcCJmWN9WBzv
 6uLE9sJZWhzpM+Kf1h6Wfx8uaTUJki5g2zF5ZPfdKeaEc/mpXMcISkFtskwk44mwgXT9e5P9
 yPeuz9OLzApfkv5+D7XIXsIXpDrnBZOJ5DwlnFtOzJOdS4VPBTV5M1zCLDIt+BDH1NOlskLY
 SK4YUpkP0nWkvKpxSSRb2N8qGli6UQrBZNhynluUEiFNRv6ZNHIfCmvIn+Z+Og8pStEyC1Jq
 YhKi1RrtBv/IpBjNKf+w2GgrWngpU/Lcr7XI1fNLExJ4pFqh2GGplJSMOiEuKboJEZ5SeSn6
 19yWlIpwddJpSRd7VHdSK8U1obU8rVqt+HY6MVwpRKjjpShJOiHpPqaYl3mnoBsNEau6zh8J
 m3Gl231tmrf5b/WfJWY/4I9+TiZKDF+l2WO3H4ja+mPoN93J856ve5exXj5/JDe3bw4IOX3h
 t+PeXiGuSkxmMlKKn/+AVlI+Bbnu2kN5u507d9mOfWLYmmBM33c8KvS7wqwQbeveEm9nZJNt
 MsrY+XOhX802+6aD71+o6LhIdZAvpYtT/w/5RYusTgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0iTcRSH+793Z5OXKfRqYTWQQMmUNA4Y0YfAl6AIiaL6UCtfcl5rS51F
 5GVqaWpac13UvLFsWurmrXJiWtqKnOYok3kbUg5NI51oXkqNvhwezu+c59OPwSXFpBcjj70i
 KGJl0VJKRIiOhqTtbl6qEwK+rXpC/u0AcM7dJKCotoaC3ufVCGoaUjBwvA2FL/NTCJY+WnDQ
 anoRlI0N4dDQNYzAVJVKQf+4G1idMxSYNdkUpFXUUtA3uYyBrbAAg2rDEfhwpxyD9sXvBGgd
 FDzSpmFrYwKDRZ2eBl2yD9irHtKwPBYI5uHPJHQWm0kwDfrBgxIbBa0mMwFdLXYM+l8WUTBc
 84eED13vCOjNzyHh2XQ5BZPzOhx0zhkaPrWXYlCnXrNlzK6S0J3TjkFGZT0G1q+vELTdHMXA
 UPOZgk7nFAZGgwaH30/eIrDn/qAh/fYiDY9SchFkpxcSYFnpJkFtC4alhSLqYAjfOTWD82pj
 Im+aLyX49+Uc/+LhEM2r2wZpvtQQzxurfPmKVgfGl/1ykrxBf4viDb8KaD7rhxXjp3t6aP7d
 /SWCH7dqsWPbTov2hwvR8gRBsefAOVGEpXGWvORwVeXax1Ey6nbJQi4MxwZxzZWrxDpT7C5u
 YGARX2cPdgdnzPlGZiERg7OZrlzVz4/UeuDOyri50RJynQnWh7PPft14FrP7uGJNKvlPup2r
 rmvfELms7Z89GNy4kbDB3Kg+j76DRKVokx55yGMTYmTy6GB/ZVREUqxc5X8hLsaA1kqju76c
 34Lm+kM7EMsg6WbxQX2tICFlCcqkmA7EMbjUQzzg+VyQiMNlSVcFRdxZRXy0oOxAWxlCukV8
 +KRwTsJelF0RogThkqD4n2KMi1cyKgr0Nt9LpiMuj72/H7WZubHz+ONDJZGWEXpB0xDmmsoO
 iNRu9VbjqdBrm+J8t9i8A0Ysx576z7gPZTZVWE6f+PLkza3itsjvBY0TvvGOkTRpXWPf3iB5
 il/6PpuyMKQir0cv3J3Xvm4ISjjjSYU1qVTh51ULOMuZwqKycxJXzFJCGSEL9MUVStlfR33r
 vzADAAA=
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
index 1b8fa9f69d73..5c996f11abd5 100644
--- a/kernel/dependency/dept.c
+++ b/kernel/dependency/dept.c
@@ -1521,9 +1521,28 @@ static struct dept_wait_hist *new_hist(void)
 	return wh;
 }
 
+static struct dept_wait_hist *last_hist(void)
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

