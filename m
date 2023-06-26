Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4E073EC82
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 23:04:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C78B10E26A;
	Mon, 26 Jun 2023 21:04:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id AC15210E1FD
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 12:13:54 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-8d-64997d6d8ce5
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v10 15/25] locking/lockdep,
 cpu/hotplus: Use a weaker annotation in AP thread
Date: Mon, 26 Jun 2023 20:56:50 +0900
Message-Id: <20230626115700.13873-16-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230626115700.13873-1-byungchul@sk.com>
References: <20230626115700.13873-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSbUxTZxTH9zz33ueWaslNJXp1Zm51RoOK1ag5RiKaLPFmyZJlhC+yRRt6
 lUaoWCyKhqUqGiigokIVO4ViagOdYOGDAlVW5G2ooDSsw4pCDAgUcbhWK+1m68uXk1/O/5zf
 +XIklPwOs0ii0R4QdVpVhoJIaenU3KrVmXkX1UrbmzgoLVaC/98CGsx1dgJ912sR2BuPYhhv
 3w5/BXwIZu/3UmAq60NQNfyEgsaOIQRO2zEC/c9jwe2fJtBdVkTgeHUdgYeTIQze8rMYah0/
 QM8ZC4bW4BgNpnECl0zHcaS8wBC01rBgNSyDEVsFC6HhtdA9NMCAc3AlXLzsJdDi7Kah4+YI
 hv4mM4Eh+/8M9HR00dBXWsLA7y8tBCYDVgqs/mkWHrVWYqjPj4gmQk4MJ1//x0BnSWuErt7A
 4P67GcHtgmcYHPYBAm1+H4YGRxkF7661Ixg5NcXCieIgC5eOnkJQdKKcht5wJwP53g0w+9ZM
 tm4W2nzTlJDfcFBwBipp4U8LL9yqeMIK+bcHWaHSoRcabPFCdcs4Fqpm/IzgqCkkgmPmLCsY
 p9xY8A60EOHlgwes0HVhlv5x8Q5polrM0OSIujVbdknTX7UP4qxr7KGwOcGASogRxUh4bj1v
 sPvwZ26rcNFRJtxy3uMJUlGO477mG0pGGSOSSiiueg4/1nWXjQbzuF/40fs+Jso0t4xvailC
 UZZxG/nCc12fDizha+tbP4hiIv3me5YPM3JuA3/M6yJRKc+di+F/c5WjjwsL+T9sHvoMklWi
 L2qQXKPNyVRpMtYnpOdqNYcS0vZlOlDkrax5odSbaKYv2YU4CVLMlSm/uqCWM6qc7NxMF+Il
 lCJONv+tSS2XqVW5h0Xdvp06fYaY7UJfSmjFAtm6wEG1nNujOiDuFcUsUfc5xZKYRQZU+s33
 yjJr1sbhTVcC4TnfWU7vPnkrLTRuTk2ZMJ4u3uv2bDMc6Uku+FlUvqCNrrsLtieG9fH39gd3
 Tsbqu62rDEkDLq2J+ydnzJk66EtOG1GcT1/Ko23OxM7Nz8p72zRuyrPisSPWHU5ptPz67ePV
 o/39q14lpWRJO56aC9bof1LQ2emqtfGULlv1HnZDSDxSAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0wTaRSG/b6Z+WYYrZntIs5iVNIEbxsRsqBnlaj/nGhU3MSsa9Sl2U6k
 0iLbIsImGoRiEKwRDXKxmnJJIcCuWDRRpKRp5SaiKIgItSoxKoJ0g5aI4KU1+ufkyfu+eX4d
 jlKWM+GcNiVNNqSodSrC0/y2dTkrdUdKNdFPu9ZA4clo8L/Lo8FyqZ5Az391COqvHMMw0roJ
 Hk6OIZjuvktBcVEPgvJnjym40uZF4KjJJtD7fC70+X0EOosKCORUXiJwb3QGg+fcGQx19q3Q
 dboCg3PqJQ3FIwTOF+fgwHmFYcpWy4ItKxKGa8pYmHkWA53efgbcFzoZcAz+DKUXPQSaHZ00
 tF0bxtDbZCHgrf/MQFdbBw09hWYG/h2vIDA6aaPA5vexcN9pxdBgCthezzgwHH/7iYF2szNA
 VZcx9D26gaAl7ykGe30/Abd/DEOjvYiCD9WtCIZPvWEh9+QUC+ePnUJQkHuOhrsf2xkweeJg
 +r2FbIyX3GM+SjI1HpYck1ZaulUhStfLHrOSqWWQlaz2Q1JjzQqpsnkES+UTfkay154gkn3i
 DCvlv+nDkqe/mUjjd+6wUkfJNJ2wcDcfr5F12nTZsGp9Ip/0f+sgTq1mMz5aorKQmeSjEE4U
 YkV3mYsOMhGWigMDU1SQQ4UIsdH8gslHPEcJlbPFlx032WDxo7BXfNE9xgSZFiLFpuYCFGSF
 sFo8cbbjm3SxWNfg/CoKCeQ3bld83SiFODHb4yKnEW9Fs2pRqDYlXa/W6uKijMlJmSnajKi/
 DurtKPA4tiMzhdfQu95NLiRwSDVHEb2oRKNk1OnGTL0LiRylClWEvS/WKBUadeY/suHgn4ZD
 OtnoQgs4WjVfsfl3OVEp7FenycmynCobvreYCwnPQtl5Dd7hCc8eH47cubo6Iz831qVur3vS
 WvYTN17irvo1jt9iOmzOu3Uhmd8neq87x807IkZTE/j9P2zfsX3ZhrXhYV7Hk6HZaB7auU1s
 8nXrN3hT52r7jg798iA6Yf7f5Qn6q4548/IlEW2/LaVjLeELHgwd+KMqrdSqjdk1p3dtg4o2
 JqljVlAGo/oLfVzQwzQDAAA=
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
index 6c0a92ca6bb5..6a9b9c3d90a1 100644
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

