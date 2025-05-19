Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C11ABB888
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 11:19:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8D5B10E315;
	Mon, 19 May 2025 09:18:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 18E2910E23E
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 09:18:45 +0000 (UTC)
X-AuditID: a67dfc5b-681ff7000002311f-04-682af76e7825
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
Subject: [PATCH v16 19/42] dept: apply timeout consideration to
 wait_for_completion()/complete()
Date: Mon, 19 May 2025 18:18:03 +0900
Message-Id: <20250519091826.19752-20-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250519091826.19752-1-byungchul@sk.com>
References: <20250519091826.19752-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0hTcRjG+//P2Tln08VhRZ20iw3ENLoYGe+HkqAPHaIoib7YB1t5aiMv
 MS+1QHKlkVfSUslqTY01dOY6M7LLzDRXdtVcS0UtrUzxMrC20tTajL68PDwPz+/98jCEwiEJ
 YjRJqYI2SZWgpGSkbDywYl3yzwj1xqnWQPD8uEDCtToLBe23axBY6vUYRlp3wgfvGILfr98S
 UFbSjqBioI+Aekc/Arv5LAWdXxaC0+OmoK0kj4JzVXUUdIzOYOgtLcZQI+6Bj6YhEl5erMRQ
 NkLB1bJz2HeGMUyZqmkwZYbCoLmchpmBSGjrd0nA3rMWrhh6KXhkbyPB0TCIofPBNQr6LX8k
 8NLxnARvYTC0FxVIoHaikoJRr4kAk8dNw7smIwaHcQlYs3zA89/nJPCsoAnD+Zt3MDi7HyJo
 vPAJg2hxUdDiGcNgE0sImL7VimCwcJyG7PwpGq7qCxHkZZeSkNUbBb9/+T5f/xEJ+htWEmpn
 XWj7Nt5isCC+ZcxN8Fm2k/y05z3F271Gkn9RyfH3y/toPquxh+aNYhpvM0fwVY9GMF8x6ZHw
 YnUOxYuTxTSfO+7E/MSbN/S+5bGyrfFCgiZd0G6IPiRTW95doU8YZKdsOR04E31ichHDcOxm
 zjqgzEXSeTk6JEr8mmLDuK6uKcKvF7MhnK1gyOfLGIJ1BXAfrncjf7CIPcQZOovmCyQbyokd
 pdjPlLNbuIFmxT/mKq7G2jTPkfrsnryW+aqCjeKcNQbSz+TYKiknPniG/hWWcU/MXeRFJDei
 BdVIoUlKT1RpEjavV+uSNKfWH0lOFJFvXaaMmYMNaLJ9fzNiGaQMlFvt4WqFRJWeoktsRhxD
 KBfLq21r1Ap5vEp3WtAmx2nTEoSUZhTMkMql8k3ek/EK9pgqVTguCCcE7f8UM9KgTBQbvvqw
 d9eXrWnSHTHufPL157haz962zOBvsWxeE6rXBRTPXlas3DGR0U3VTR8N2vQiZHtMoSb12N0M
 PWbXxnUX6VRbYqJ1LUvw0+ez5FnnmbnaEfPchu+hwzeNjfl9rpBoMsx8qVGm/xqX8/iAbcHu
 M/vu4HuvJtThAdnqFe5yJZmiVkVGENoU1V8NdDtPWQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSe0xTZxjG/b5zpVpzUpkeNWbSBC8Ynajo6yXGRRNOjBBMNCaEZFQ9sQ1Q
 tFWUGZMi4LgIERQIIF3B2ZW2ju4UIypV0kYU3QTkoiCixQVFUKLSMhDFgvGfN0+eJ8/v/edh
 CUU1tYDVaI+KOq0qUUnLSFn05vSV2tEw9erqp2vAN5JFwsUaOw0tf9kQ2GvTMAzciYTH/iEE
 n/5tJqCkqAVBpfcZAbWNvQhcltM0tP03G9p9wzQ0FeXSkH6phobWwQkMPcWFGGxSFDw395Pw
 4FwVhpIBGspL0nHgvMYwZrYyYDaEQp+ljIEJbzg09XZS4KloosDVvQJKjT001LuaSGis68PQ
 duMiDb32SQoeNN4jwZ+/EFoK8ii48q6KhkG/mQCzb5iBRw0mDI2mueDICFDPfPxCwd28Bgxn
 /vgbQ3vXTQS3sl5gkOydNHh8QxicUhEB43/eQdCX/5aBzLNjDJSn5SPIzSwmIaMnAj79H/hc
 MRIOab87SLjyuRNt2yrYjXYkeIaGCSHDeVwY93XQgstvIoX7VbxwvewZI2Tc6mYEk3RMcFrC
 hEv1A1io/OCjBMmaTQvSh0JGyHnbjoV3Dx8yMYtiZVsOiomaFFH309Z4mdr+qJQ5bJSdcGa3
 YgN6weagIJbn1vGD/RI1pWluKf/kyRgxpYO5xbwzrz/gy1iC65zJP67oQlPBHC6eN7YVTBdI
 LpSXWotxDmJZObee97oV35g/8jZHwzQnKGB353qmqwougm+3GclzSGZCM6woWKNNSVJpEiNW
 6RPUqVrNiVUHkpMkFBiQ+dREQR0aaYt0I45Fyllyh2u5WkGpUvSpSW7Es4QyWG51LlMr5AdV
 qb+KuuRfdMcSRb0bLWRJ5Tz5zn1ivII7pDoqJojiYVH3PcVs0AIDWrZpXf755MKaNxEXdrv2
 xEVumNy7v2H/0sjcGPXaZsk72Xc1RRl9IXt+mOX9vgSP7zq+vKt0ZUz6yeNLro1vDvH2PG/2
 72Dj9vycudcw0WXtuH3q5a5ZaT+8ii3ZlHXPMWpYgyps9eWvopZb6o6ExFbH7e5oHY0e2DjP
 zWypDd1+9rd/lKRerQoPI3R61VdrWUlHPAMAAA==
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

Now that CONFIG_DEPT_AGGRESSIVE_TIMEOUT_WAIT was introduced, apply the
consideration to wait_for_completion()/complete().

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/completion.h | 4 ++--
 kernel/sched/completion.c  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/completion.h b/include/linux/completion.h
index bd2c207481d6..3200b741de28 100644
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
index 3561ab533dd4..499b1fee9dc1 100644
--- a/kernel/sched/completion.c
+++ b/kernel/sched/completion.c
@@ -110,7 +110,7 @@ __wait_for_common(struct completion *x,
 {
 	might_sleep();
 
-	complete_acquire(x);
+	complete_acquire(x, timeout);
 
 	raw_spin_lock_irq(&x->wait.lock);
 	timeout = do_wait_for_common(x, action, timeout, state);
-- 
2.17.1

