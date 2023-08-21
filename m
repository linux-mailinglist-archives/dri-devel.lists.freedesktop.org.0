Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BF3782226
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 06:05:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A05E10E195;
	Mon, 21 Aug 2023 04:05:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.hynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8D69E10E18E
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 04:05:00 +0000 (UTC)
X-AuditID: a67dfc5b-d6dff70000001748-db-64e2ded6d09c
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v10 15/25] locking/lockdep,
 cpu/hotplus: Use a weaker annotation in AP thread
Date: Mon, 21 Aug 2023 12:46:27 +0900
Message-Id: <20230821034637.34630-16-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230821034637.34630-1-byungchul@sk.com>
References: <20230821034637.34630-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSf0yMcRzHfb/Pz05nT6fNQ+bHmWWZxLDPzMx/nv6wGRvDH9y6R91UuCOy
 mXL5FZni6ZyadWXX1R3pyR9UZ6lVQnVop6yau5BW53LccbpQ4Z/PXnu/93799WEJVQO1gNVl
 HhP1mZp0Na0gFb5oyyr3oFebJLUvhsIrSRD8dpGE0hoHDa57dgSOB7kYRlq3wpvQGIKJzm4C
 TJILgcUzQMCDtkEETttZGl6/nwM9QT8NHdJlGowVNTS8HI1g6C8uwmCXt8Hza+UYmsLDJJhG
 aCgxGfHU+YQhbK1mwJqzHLy2WwxEPGugY9BNgfPtSjDf7qeh0dlBQttDL4bX9aU0DDp+U/C8
 7SkJrsICCu5+LqdhNGQlwBr0M/CqqQzD/bwp0fmvvyhoL2jCcP5OLYaevgYEjy++wyA73DS0
 BMcw1MkSAT8rWxF4r/oYOHclzEBJ7lUEl88Vk9A92U5BXv96mPhRSm/ZKLSM+Qkhr+6E4AyV
 kcKzcl54dGuAEfIev2WEMvm4UGdLECoaR7BgCQQpQa6+RAtyoIgR8n09WPjc1cUIT29OkML7
 HhPeHrdXsUkrpuuyRP3qzQcUaTf6JvGRSubk+FAJk4MK6HwUxfLcOn5I6mX+s7HYT0wzzcXz
 vb3hGY7llvB1BR+pfKRgCe7CbN423jkznstpeSlSMsMkt5y3myVqmpXcBt6YW0P+lS7m7feb
 ZkRRU7ncUI+mWcWt5794hshpKc8Zo/iicvu/wXz+ia2XvIaUZWhWNVLpMrMyNLr0dYlp2Zm6
 k4kphzNkNPVS1tORfQ9RwLWzGXEsUkcrDyz0alWUJsuQndGMeJZQxyrjvnu0KqVWk31K1B/e
 rz+eLhqaURxLqucp14ZOaFVcquaYeEgUj4j6/y1moxbkoDPJbZWtLS9+e5J3+zpXhOz0nhSb
 XLX0Q21qYQ4TjpkbZ4ypepJ/0/E1EEnqM5vvJOo/bLSvjv61K9liHm6sMEgxHft0vlGpMn7/
 z5ElCV/ci+q7YyFgcnaxqTu2phwdLxqadCv2wtkzA9/0nyaXLTJaDtqGW3b+6Dq4y+96dF1N
 GtI0axIIvUHzB5lkfvNOAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0hTcRjG+//P1dnksKwOKhWDLhSaldYbVoQROxRG0AchurjaIVfzwlam
 hTWdWWmKRtPyxtKaOlfWLDFzMbS0JZmm2AWVXFfJMs1ZS63U6MvLj+fh+X16WUJWTPmx6tij
 ojZWqZHTElKyI8wQ2N3nUgV3FrCQeyEY3KPnSCiqttLQfrMKgfVOCoaBRwp4MTaIYPzpMwLy
 je0Irvb3EnCnuQ+BvSKVhs53PtDlHqLBacykwVBWTUPH5wkMPXkXMVTZIqA1pxSDw/ORhPwB
 GgrzDXjqfMLgMVsYMOsXg6uigIGJ/lXg7OumoKnYSYH99Qq4UtJDQ4PdSUJznQtDZ30RDX3W
 PxS0Nj8moT03i4IbX0tp+DxmJsDsHmLgucOE4VbalC39+28KWrIcGNKv3cbQ9eo+ggfn3mCw
 WbtpaHIPYqixGQn4Vf4IgSv7CwNnLngYKEzJRpB5Jo+EZ5MtFKT1hML4zyJ6c5jQNDhECGk1
 xwX7mIkUnpTywr2CXkZIe/CaEUy2Y0JNxXKhrGEAC1dH3JRgs5ynBdvIRUbI+NKFha9tbYzw
 +PI4Kbzrysc7A3ZLNqhEjTpB1K7cFCWJvvRqEseXM4nf3hYyepRFZyAvludCeEPeEDHNNLeU
 f/nSM8O+3CK+JusDlYEkLMGd9eYrvj2dGczhVLxxonCGSW4xX3XFSE2zlFvLG1KqyX/ShXzV
 LceMyGsqt92vR9Ms40L54f63ZA6SmNAsC/JVxybEKNWa0CDdkeikWHVi0MG4GBuaehpz8kRu
 HRrtVDQijkXy2dKoAJdKRikTdEkxjYhnCbmv1P9Hv0omVSmTTojauP3aYxpR14j8WVI+X7ot
 UoyScYeUR8Ujohgvav+3mPXy06OHvRHkZR+kKJm77K55CfYuqRwN3LqrfPL0eFBwusfiJT0Q
 eXhBZW/Ye6WvX1lbqmLRvO21beGs6rBPR0TiVuu88JPqsGr7z30a956GkOQt2bn66Jxwu2Jh
 gMo08qTH2eq9ZuPw+qad+qDk4OvSEKZ+79661QWWzPhTtQ7/dT4ts+SkLlq5ajmh1Sn/AgTl
 eBkwAwAA
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

cb92173d1f0 ("locking/lockdep, cpu/hotplug: Annotate AP thread") was
introduced to make lockdep_assert_cpus_held() work in AP thread.

However, the annotation is too strong for that purpose. We don't have to
use more than try lock annotation for that.

Furthermore, now that Dept was introduced, false positive alarms was
reported by that. Replaced it with try lock annotation.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 kernel/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index f4a2c5845bcb..19076f798b34 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -356,7 +356,7 @@ int lockdep_is_cpus_held(void)
 
 static void lockdep_acquire_cpus_lock(void)
 {
-	rwsem_acquire(&cpu_hotplug_lock.dep_map, 0, 0, _THIS_IP_);
+	rwsem_acquire(&cpu_hotplug_lock.dep_map, 0, 1, _THIS_IP_);
 }
 
 static void lockdep_release_cpus_lock(void)
-- 
2.17.1

