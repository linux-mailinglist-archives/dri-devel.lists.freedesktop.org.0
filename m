Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AFC73EC87
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 23:05:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8FD710E25E;
	Mon, 26 Jun 2023 21:05:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 200AA10E1F4
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 12:13:54 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-c0-64997d6d15c4
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v10 18/25] dept: Apply timeout consideration to
 wait_for_completion()/complete()
Date: Mon, 26 Jun 2023 20:56:53 +0900
Message-Id: <20230626115700.13873-19-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230626115700.13873-1-byungchul@sk.com>
References: <20230626115700.13873-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0xTZxjHfc/lPYfObieVyREXN5vhdSo4MM/ispgYt/fDlriYaKLxcmKP
 0nDRFUFZRsKlGLkp4KBaCNaiXUNRtBi8QAmCchkC3SQIpFQgOscEqsxWGFVsWfzy5Jfn/3v+
 nx6eVjWy4bw28ZisS5Ti1VjBKCYWmtclpJ3XRHqMX0BRfiR4X51ioLymGoPzqg1B9Y0MCsbu
 fwePfOMIZrt6aDCUOBFcHBmi4UarG4HDmonh4ZMPodfrwdBRkochq7IGwx/P/RS4SospsNl/
 gM5CMwVNM88YMIxhKDNkUYHxNwUzlioOLOkRMGo1cuAfiYIOdx8LjsG1cL7ChaHB0cFA661R
 Ch7eKcfgrp5jobO1nQFnUQELVybNGJ77LDRYvB4O/mwyUXBNHyj6x++g4OS/b1loK2gK0KXr
 FPQO1CNoPDVMgb26D0OLd5yCWnsJDf/9dh/B6OkJDrLzZzgoyziNIC+7lIGeN20s6F0xMDtd
 jrdsJi3jHproa48Th8/EkN/NIrltHOKIvnGQIyZ7Mqm1riGVDWMUuTjlZYm9KgcT+1QxR3In
 eini6mvAZLK7myPt52aZ7Z/sVnytkeO1KbJuwzcHFLHGOQN3tEJxYiDjOpWOhvlcxPOiEC3e
 LE99j5dORueiEB4LK8X+/hk6yKHCZ2JtwV9sLlLwtFD5gfis/R4XDBYJB8TZzOJ5iREixO7C
 DDbISmGTmDeon3dE4VPRdq1p3gkJ7OsfmFGQVUKMmOlqxsFSUSgLESu8c+z/B0vEu9Z+phAp
 TWhBFVJpE1MSJG189PrY1ETtifUHjyTYUeCrLGn+PbfQlHNHMxJ4pF6ojFx2TqNipZSk1IRm
 JPK0OlS5eNqgUSk1UurPsu7Ifl1yvJzUjJbyjDpMudF3XKMSDkvH5DhZPirr3qcUHxKejr6t
 H8ChLa/vhtdVhK2IqiG+J759OdtUxpc9YbZlh3PkQ/eG+zc/Hc1fXvejc+fq/Wd3fiy5pfTY
 OH9XZ2Sypstt6riw5dHejT/V+dqzb5pefP84Yt9Q1lauYHKVdeT2ZF/pR0tilHW/cp7PK88U
 tR3cdWG66JevWhbE0bYv015uuqx+oWaSYqWoNbQuSXoHiDIgplEDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0xTdxjG/Z87HTXHivPMOSVdiIKZAyP6bhqjcYn/GHVbNDHqB2nsiW0o
 oK1yMRIp1IIgCCS1CEhoMZVAvXBAA0IJF7m6IQ7SKbYMiVFRhAiU2cGmhWRf3vzyPL88n16O
 VNjoVZw2/oyoj1fplIyMkh3YlvFdXOo1dWSfZTkUXI4E30wWBaV3nAz0365G4KwzEjDWsQf+
 nB1HMPf7YxKsln4EthdeEuo6hxG4KtMZGHi5FAZ9kwz0WHIYyKi4w8CTd/MEeK4WElAt7YdH
 +XYCWvyvKbCOMVBizSAC5w0BfkcVC460MBitLGZh/kUU9Ay7aWi/3kODa2gDXCvzMNDk6qGg
 s36UgIEHpQwMOz/R8Kizm4L+glwabk3YGXg36yDB4Ztk4Y+WcgLumgJrb+ddBJin/6OhK7cl
 QDdqCBh81oigOWuEAMnpZqDdN05ArWQh4Z+bHQhG896zcPGyn4USYx6CnItXKXj8bxcNJk80
 zH0sZXZux+3jkyQ21SZh12w5hXvtAm4o9rLY1DzE4nLpLK6tjMAVTWMEtk35aCxVXWKwNFXI
 4uz3gwT2uJsYPNHXx+Luojnql2+OyrarRZ02UdR/vyNGpin+ZGVPlcmSnxlriDQ0wmUjjhP4
 zcIN8+ZsFMQx/Drh6VM/ucAhfKhQm/uKzkYyjuQrvhBedz9kF4rlfIwwl164KFF8mNCXb6QX
 WM5vEXKGTIuOwK8Vqu+2LDpBgbzxNztaYAUfLaR72ph8JCtHS6pQiDY+MU6l1UVvNMRqUuK1
 yRtPJMRJKPA4jtT5gno0M7CnDfEcUgbLI9cUqRW0KtGQEteGBI5Uhsi//GhVK+RqVco5UZ9w
 XH9WJxra0NccpVwp33tYjFHwJ1VnxFhRPCXq/28JLmhVGsrcpM6c/rn1Su/5qRUXomM77itD
 7Q1FM2+wzVSd2Rq8/knWX857JTXmc/UW7/Mfnv+dYDx4b8j9AWmsP62Oqtj6lX/wvGlgYteR
 6R+P6w8Ee3fr9sml8Oa3Zinc/GtJ2OlNddbUpAi3q0vz7e5je3MaXt4MPmE7PbrCvcx7KNRe
 lZWrpAwaVVQEqTeoPgMlG0PBNAMAAA==
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

