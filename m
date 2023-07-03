Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBE774592C
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 11:50:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD3B10E20D;
	Mon,  3 Jul 2023 09:49:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id CC93210E1F3
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 09:49:43 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-c7-64a299b31a63
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v10 rebased on v6.4 15/25] locking/lockdep,
 cpu/hotplus: Use a weaker annotation in AP thread
Date: Mon,  3 Jul 2023 18:47:42 +0900
Message-Id: <20230703094752.79269-16-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230703094752.79269-1-byungchul@sk.com>
References: <20230703094752.79269-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSbUxTZxiG977nnPecVstOKtuO8GOmC1ExIi66PDFmIdmSnS0xMfGPw2Ta
 rCejSkGLFtlHhit+lUKACB20uFKW0rRVpMVEhpAKEUSDVCRYK54Ic04CCGEWrYDaYvbnyZX7
 yX39ujlK3cGkcfqCo5KxQJuvIUpaObO6aXOw3qXLDg3uhGprNsSen6HB0eonEL7oQ+BvP4Fh
 8vpXcG9hGsHi4BAFttowgqbxhxS098kIujy/Ebj7OAVGYrMEBmrLCZibWwncmVrCMFZXg8EX
 2AW3qlwYQvF/abBNErDbzDhxnmKIu70suEszYMLTwMLS+FYYkEcZ6IpugvrzYwSudg3Q0Hdl
 AsPdvxwEZP8bBm713aAhXF3BwIVnLgJTC24K3LFZFoZDTgyXyhKiU/+9ZqC/IoTh1J9tGEbu
 dyLoPvMIQ8A/SqA3No0hGKil4FXLdQQTlTMsnLTGWbCfqERQfrKOhqHlfgbKxrbD4ksHydkh
 9k7PUmJZsFjsWnDS4k2XIHY0PGTFsu4oKzoDx8SgJ1NsvjqJxab5GCMGvGeJGJivYUXLzAgW
 n92+zYo3fl+kxccjNrw7PVe5Uyfl602SccvnB5R55+4v48Mt7PG5v+1sKaogFqTgBH6bMHth
 nLUgboV9tRnJmPDrhUgkTiU5lV8nBCueMBak5Cj+9CrBMze40l3DG4TuHplNMs1nCJGhy3TS
 o+I/E2Rr8Tv9x4LvUmjFo0jE/7ysRElW89uFsXqZJJ0Cb1MInc9b6HeFtcI1T4SuQiones+L
 1PoCk0Grz9+WlVdSoD+e9X2hIYASg3L/srTvCpoP7+lBPIc0q1WRn5p0akZrKiox9CCBozSp
 KvP4Hzq1Sqct+VEyFu43HsuXinpQOkdrPlJ9ulCsU/M/aI9KhyTpsGT8/4s5RVopMqTlmuJr
 yZeJfSJriRMrvrP79fIna6yNc42p/aacnO4tv0r727znpuOtma/C5lyU5Z4x762L2pt7L0fT
 czsf1ES+FvZ0TA0PV73/hepnOdr25MNIzr3O0UJux67MNy5HytN9siPF98GEu/Hshm+WU1+0
 H2l4UV3uvWjZmH3wWw1dlKfdmkkZi7RvAbLwAENMAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSbUxTVxzGd86999xLpdu1ot6oi1sTMuMrGDH/6TTGLx4xM/PDMsdisNqb
 0QDFtFBlZglIdVopAxQRClpgqw2wqbea4EYJQijiW5kQrKY2wpxIADHONnS8OGrilye/PE/y
 +/QIjMbBLREMxlzZZNRlaYmKVe3eXLTGU1WvT6qNJEJZcRKE35xkoeZyM4He35sQNF8rxDDS
 tQMeRsYQTN3zM1BZ0YugbvAJA9d8IQRe9zECfc8+hP7wBIGeitMEihouE/hrdBpD8Fw5hibl
 S7hTWo+hPTrMQuUIAUdlEZ6LFxiirkYeXAWJMOSu5mF6MBl6QgMcdNb2cOB9vAqqLgQJtHp7
 WPC1DGHo+6OGQKj5LQd3fLdY6C2zc/Dby3oCoxEXA67wBA8P2p0YrljnbCf+neWg296O4cQv
 VzH0P/oTQdvJpxiU5gECneExDB6lgoH/LnUhGCoZ5+F4cZQHR2EJgtPHz7Hgn+nmwBpMganJ
 GrJtM+0cm2Co1XOYeiNOlt6ul+iN6ic8tbY95qlTyaMe90ra0DqCad3rMEeVxlOEKq/LeWob
 78f05f37PL11foqlz/or8VfL0lRf6OUsg0U2rdu6X5Vx9tEMPnSJP/LqbwdfgOzEhgRBEjdI
 TRWJNhQnEPEzKRCIMjFOED+RPPbnnA2pBEb8aZ7kfnWPxIYFYrbU1hHiY8yKiVLAf52NedTi
 RilUfDhWS+JyqelK+ztP3Fz9z2QJirFGTJGCVSFSilRO9EEjSjAYLdk6Q1bKWnNmRr7RcGTt
 wZxsBc1dxvXjdFkLetO3owOJAtLGqwNH6/QaTmcx52d3IElgtAnqosGLeo1ar8v/QTblpJvy
 smRzB1oqsNrF6tRv5P0a8Xtdrpwpy4dk0/sVC3FLChD1tu1ar3y6rHyvQXc0krZgZsO6uwdW
 vZ1dfSHV0lKV617jvxmfvzC9c6ez++riYJT2LWrYRSw+33rH7i3eyfmLbGc2/nw7fWCFdbvS
 OuEfNQ+b6/bZk6ozC7+bOrb329T4j2a6lNk91w8Y0j42GEu/9teO5wU+T/71zKac4YKbs3d9
 WtacoUteyZjMuv8Bvvgvmy4DAAA=
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

