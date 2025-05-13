Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB8FAB521A
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 12:23:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F67210E57B;
	Tue, 13 May 2025 10:23:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 080D110E567
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 10:23:22 +0000 (UTC)
X-AuditID: a67dfc5b-681ff7000002311f-ee-682319f29217
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Cc: kernel_team@skhynix.com, torvalds@linux-foundation.org,
 damien.lemoal@opensource.wdc.com, linux-ide@vger.kernel.org,
 adilger.kernel@dilger.ca, linux-ext4@vger.kernel.org, mingo@redhat.com,
 peterz@infradead.org, will@kernel.org, tglx@linutronix.de,
 rostedt@goodmis.org, joel@joelfernandes.org, sashal@kernel.org,
 daniel.vetter@ffwll.ch, duyuyang@gmail.com, johannes.berg@intel.com,
 tj@kernel.org, tytso@mit.edu, willy@infradead.org, david@fromorbit.com,
 amir73il@gmail.com, gregkh@linuxfoundation.org, kernel-team@lge.com,
 linux-mm@kvack.org, akpm@linux-foundation.org, mhocko@kernel.org,
 minchan@kernel.org, hannes@cmpxchg.org, vdavydov.dev@gmail.com,
 sj@kernel.org, jglisse@redhat.com, dennis@kernel.org, cl@linux.com,
 penberg@kernel.org, rientjes@google.com, vbabka@suse.cz, ngupta@vflare.org,
 linux-block@vger.kernel.org, josef@toxicpanda.com,
 linux-fsdevel@vger.kernel.org, jack@suse.cz, jlayton@kernel.org,
 dan.j.williams@intel.com, hch@infradead.org, djwong@kernel.org,
 dri-devel@lists.freedesktop.org, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, hamohammed.sa@gmail.com, harry.yoo@oracle.com,
 chris.p.wilson@intel.com, gwan-gyeong.mun@intel.com,
 max.byungchul.park@gmail.com, boqun.feng@gmail.com, longman@redhat.com,
 yskelg@gmail.com, yunseong.kim@ericsson.com, yeoreum.yun@arm.com,
 netdev@vger.kernel.org, matthew.brost@intel.com, her0gyugyu@gmail.com
Subject: [PATCH v15 35/43] dept: make dept stop from working on
 debug_locks_off()
Date: Tue, 13 May 2025 19:07:22 +0900
Message-Id: <20250513100730.12664-36-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250513100730.12664-1-byungchul@sk.com>
References: <20250513100730.12664-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa2xLcRjG/c85Pee0UzkrscNcK4sgLpXh/eAW14MIyz65hbJjLbtIN5sR
 stHJjM5IprFrN0vVVtu0Lhu6zGalLlPMLmyzlqDZZoyW1mZa4subX573eZ73y0vjkgeC8bQy
 LpFXxcljpKSIEPWNLJ49MG6aYp7aLAX39wwC8iuNJNgryhEYr6dh4GpcC62eXgS/nj7DQZtj
 R1Ds6MThurULgcVwnISX70dBs7ufBFvOaRJOXKok4XnPIAYdF85jUG7aCG/1Hwh4nF2CgdZF
 Qp72BOYfnzDw6sso0KeGgdOQS8GgQwa2rhYBWF7PgouFHSTctdgIsFY7MXh5O5+ELuOwAB5b
 HxLgyQoF+zmNAK5+LiGhx6PHQe/up+BFnQ4Dq24sVKn9hSe//RbAA00dBidLr2HQ3H4HQW1G
 NwYmYwsJDe5eDMymHBx8lxsROLP6KEg/46UgLy0Lwen0CwSoOxbAr5/+ywXfZZBWVEXA1aEW
 tHwJZyw0Iq6htx/n1OZkzud+RXIWj47gHpWwXE1uJ8Wpa19TnM50kDMbZnKX7rowrnjALeBM
 ZadIzjRwnuIy+5ox7nNTE7V5wlbR4ig+RpnEq+Yu3SVSfEs/ix1wiA85XDUoFRUEZSIhzTLh
 rMZZi/6z7dQPMsAkM51ta/PiAR7DTGHNmg+CTCSicaYliG0taPcHaHo0E8EWakMDHoIJY+8X
 2v/6xcxCdvCjj/rXOZktr6r7qwv9+tDlJiLAEmYBm60rJwKdLFMkZBv7PeS/wDj2nqGNyEZi
 HRpRhiTKuKRYuTImfI4iJU55aM6e+FgT8r+X/ujgtmo0YI+sRwyNpCPFD11TFRKBPCkhJbYe
 sTQuHSNOu+WXxFHylMO8Kn6n6mAMn1CPQmlCGiKe70mOkjDR8kR+P88f4FX/txgtHJ+KqNHb
 33iytOLj7KKgpOiprTdX+qonHl62Kv6ItbsmeHeDTEPf2uJdU7VD+rzC4N3X+fZK+Ka8SbZj
 54QrlhYVr55xzzu8/objYv6kSMveLyHBcxPX/5Ax0xdPDHF2+iqG1mk3ZUQ+Obp7eLM6Ylfp
 BkN7z9cl3fS66HfVpZXJjRFnW3ulRIJCLpuJqxLkfwAJYvXyWgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSe0yTZxSHfd/vSrHmG+L2KW66OkOEiCMRPFGDOqO+6lxcYmJiXLSOL2sj
 oLaAYKIWKARBrgkS5VZxqYwWxQ/nvYTAZFYU2UCECswSRBsRkkKrQL0UF/85efKcX37nn8NT
 QX8wC3htQqKkS1DHqVgFrfhpTcZy9/wlmu8L+gPBM5FNQ/llKwsdlywIrFfTMLjuboEn3hEE
 0w8fUVBa0oHgvLOfgqutAwhsNeksdA7NgS7PGAv2klwWMi5cZuGfVz4MfWeKMVjkHfCfeZiG
 tsJqDKUuFspKM7B/vMQwaa7lwGxYCoM15zjwOSPBPtDNQEuFnQGbIxzOVvaxcMdmp6H1xiCG
 zlvlLAxYPzDQ1nqPBm9+CHQU5TFQN1rNwiuvmQKzZ4yDf5tMGFpNX0K90d+aNf6egb/zmjBk
 /X4FQ1fvbQSN2c8wyNZuFlo8Ixga5BIKpi7eRTCY/5qDzNOTHJSl5SPIzTxDg7EvCqbf+i9X
 TERCWlU9DXXvutH6GGKttCLSMjJGEWPDUTLlecwSm9dEk/vVIrl5rp8jxkYHR0xyEmmoCSMX
 7rgwOe/2MESuPcUS2V3MkZzXXZiMtrdzO7/eo1gbK8VpkyXdipj9Cs14ZgE+7FSmOF03kQFV
 BOagAF4UVor2U2/YGWaFULGnZ5Ka4WBhsdiQN8zkIAVPCd2B4pOKXpSDeH6u8LNYWRoyk6GF
 peJflR2f8kohWvS9mOL+71wkWuqbPvkAv393sZ2e4SAhSiw0WehCpDChWbUoWJuQHK/WxkVF
 6A9qUhO0KRG/HoqXkf+BzMd9RTfQROeWZiTwSDVbec/1rSaIUSfrU+ObkchTqmBl2nW/Usaq
 U49JukP7dElxkr4ZhfC06ivltt3S/iDhN3WidFCSDku6z1vMBywwIEfo87WL1hhsuwZM92Ny
 Q3/JokKqkLc55mGsa/ecvcuOWTadGLq+kYzXGPgh2Re8eeGge3rXvOLGa7dvCddEoSpi1U5D
 74Oq7aM/tLnfCw78tMsRvtUUkW486fzmz0tX5CXhAT736uF1YV98V5einScbdhzJPhu9ITT8
 Ry5ddaCtWEXrNerIMEqnV38EzYHV2TwDAAA=
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For many reasons, debug_locks_off() is called to stop lock debuging
feature e.g. on panic().  dept should also stop it in the conditions.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/dept.h     | 2 ++
 kernel/dependency/dept.c | 6 ++++++
 lib/debug_locks.c        | 2 ++
 3 files changed, 10 insertions(+)

diff --git a/include/linux/dept.h b/include/linux/dept.h
index 19d72b0b0c4b..a6ff9db9bcf9 100644
--- a/include/linux/dept.h
+++ b/include/linux/dept.h
@@ -395,6 +395,7 @@ struct dept_ext_wgen {
 	unsigned int wgen;
 };
 
+extern void dept_stop_emerg(void);
 extern void dept_on(void);
 extern void dept_off(void);
 extern void dept_init(void);
@@ -447,6 +448,7 @@ struct dept_ext_wgen { };
 
 #define DEPT_MAP_INITIALIZER(n, k) { }
 
+#define dept_stop_emerg()				do { } while (0)
 #define dept_on()					do { } while (0)
 #define dept_off()					do { } while (0)
 #define dept_init()					do { } while (0)
diff --git a/kernel/dependency/dept.c b/kernel/dependency/dept.c
index 5397167c7031..3313ac4df3a6 100644
--- a/kernel/dependency/dept.c
+++ b/kernel/dependency/dept.c
@@ -186,6 +186,12 @@ static void dept_unlock(void)
 	arch_spin_unlock(&dept_spin);
 }
 
+void dept_stop_emerg(void)
+{
+	WRITE_ONCE(dept_stop, 1);
+}
+EXPORT_SYMBOL_GPL(dept_stop_emerg);
+
 enum bfs_ret {
 	BFS_CONTINUE,
 	BFS_DONE,
diff --git a/lib/debug_locks.c b/lib/debug_locks.c
index a75ee30b77cb..14a965914a8f 100644
--- a/lib/debug_locks.c
+++ b/lib/debug_locks.c
@@ -38,6 +38,8 @@ EXPORT_SYMBOL_GPL(debug_locks_silent);
  */
 int debug_locks_off(void)
 {
+	dept_stop_emerg();
+
 	if (debug_locks && __debug_locks_off()) {
 		if (!debug_locks_silent) {
 			console_verbose();
-- 
2.17.1

