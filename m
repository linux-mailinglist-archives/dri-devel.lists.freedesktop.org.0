Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7435F83A965
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 13:16:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2132A10F706;
	Wed, 24 Jan 2024 12:15:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 90E0910F731
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 12:15:10 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-25-65b0fbb64f6a
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v11 14/26] locking/lockdep,
 cpu/hotplus: Use a weaker annotation in AP thread
Date: Wed, 24 Jan 2024 20:59:25 +0900
Message-Id: <20240124115938.80132-15-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240124115938.80132-1-byungchul@sk.com>
References: <20240124115938.80132-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSW0wTaRTH9/tm5puh2s1YTRjkwd1Gs8rGC8SaIxpDfHC/jZo1IfFhtVkn
 dBaq3CyCYjSCVkAu3giwKEFALU0p0i1m44IYqBHBC1asCgSrEKMSiyhatFIvBePLyS/n/P+/
 pyMwmhZurmBM3aWYUuVkLVGxqtGZtYv/m3Qoy8rtS+FE8TLwvytgoarJTsB9oQGB/WIuhpFr
 v8HDCR+Cydt3GKgocyOoHXrEwMVOL4I260EC957+CB7/GIHusiICh842Ebj7MohhsPwkhgbn
 Rrh5vA5De+A5CxUjBE5XHMKh8QJDwGLjwZKzAIatp3gIDkVDt/cBB20Dv0Jl9SCBy23dLHRe
 GsZwr6WKgNf+hYObnV0suE+UcND4qo7AywkLAxb/GA+97TUYHOaQKO/tZw6ul7RjyDv3LwZP
 fyuCKwVPMDjtDwhc9fswNDvLGPhYfw3B8NFRHg4XB3g4nXsUQdHhchbufLrOgXlQB5Mfqkhc
 LL3qG2OouXk3bZuoYemNOon+f+oRT81XBnha48ykzdYoevbyCKa1436OOm1HCHWOn+Rp4agH
 01c9PTzt+meSpU89FXhT5J+q1QYl2ZilmJau2aZK8p65i9Lr+T2luV6Sg0pIIQoTJHG5lFeZ
 w37nx+5cfoqJ+IvU1xdgpniO+JPUXPKMK0QqgRHzZ0jW17dDZUGYLeolc0HCVIYVF0jDwaFp
 j1pcIeW3vue+OedJDY72aU9YaN9YOTCd0Yg66YntGD/llMT8MKnQ189/K0RIHdY+9jhS16Af
 bEhjTM1KkY3Jy5ckZaca9yxJSEtxotBHWfYHt1xC4+54FxIFpJ2pjrM1KRpOzsrITnEhSWC0
 c9R9ERcUjdogZ+9VTGl/mTKTlQwXihRYbbg6ZmK3QSMmyruUHYqSrpi+X7EQNjcH/dzo8R0w
 rPm9eCG7M+FzZmKr60bcjIX6KH94esQfmwNKwaqh2YZ989+Q2Flm3YtofZFjJbeaBiM+zLNy
 G2IeKgm1+7urS7NUqm2RvfdLR/AGWS+v77/Vm3cuVpeSuFbYujjNsaKrp/r89vhF74/F/62a
 pYtuWdexpb4j/K1rkT5Gy2YkydFRjClD/gpVmRPATQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0iTYRTHe5736mrxugzfrEgGFRldBLVDRkQFvkRJX7pJocNecrRZbGpa
 BOqm2VJrK52Z5S2WzZU2JewyE03LJLM0NbGVEpnlpdRZOrvMoi+HH+f8z+/TnyVkBZQfq4yN
 EzWxCpWclpCS8FDdmrvuSnG9w7QIjJnrwTWRQUJBhY2GttvlCGzVKRgGG8Oga3IIgfv5CwLM
 OW0IivveElDd5ETgKEulof3DfOhwjdLQnHOOBl1pBQ0vv8xg6M01YSi374KWCyUY6qYGSDAP
 0nDFrMOe8QnDlMXKgCV5OfSX5TMw0xcIzc5OChquNlPg6FkNl6/10vDQ0UxCU00/hvb7BTQ4
 bb8paGl6SkKbMYuCWyMlNHyZtBBgcY0y8KquCEOl3mNLH/9FwZOsOgzp1+9g6HjzAEFtxnsM
 dlsnDQ2uIQxV9hwCpm80IujPHmYgLXOKgSsp2QjOpeWS8OLnEwr0vcHg/lFAbwkVGoZGCUFf
 dUJwTBaRwrMSXriX/5YR9LU9jFBkjxeqygKE0oeDWCgec1GC3XqWFuxjJkYwDHdgYaS1lRGe
 5rlJ4UOHGe9eEiHZdFhUKRNEzbrNUZIYZ+FLdPwGk3gxxUknoyzagLxYngvi37WlMLNMcyv5
 7u4pYpZ9OH++KusjZUASluDOzOXLvj73PLDsAu4Qr8+Ins2Q3HK+f6aPnGUpF8KfefCd+udc
 xpdX1v31eHn2ty73/M3IuGD+vfU8cwFJitAcK/JRxiaoFUpV8Frt0ZikWGXi2uhjajvydMZy
 esZYgybaw+oRxyL5POkWa4UooxQJ2iR1PeJZQu4j7V50W5RJDyuSToqaY5GaeJWorUeLWVLu
 K92xT4yScUcUceJRUTwuav5fMevll4y88/bopGrvrt966/4wVdw48t2wN68ndclih7Eln3m9
 ovsRPwBXmcSBWt/oYrw9U1fYGFl4szRd1xg+bbD/XGhYJY8IVZuWRu48cNB78lKnO+CzLWSg
 OHt6bFfkqv2KmDW5ERv9t1aOk6ao9i7zKeNF79ZvPx4HFcY1BY294wK3yUltjCIwgNBoFX8A
 2+WWAC8DAAA=
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
index a86972a91991..b708989f789f 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -535,7 +535,7 @@ int lockdep_is_cpus_held(void)
 
 static void lockdep_acquire_cpus_lock(void)
 {
-	rwsem_acquire(&cpu_hotplug_lock.dep_map, 0, 0, _THIS_IP_);
+	rwsem_acquire(&cpu_hotplug_lock.dep_map, 0, 1, _THIS_IP_);
 }
 
 static void lockdep_release_cpus_lock(void)
-- 
2.17.1

