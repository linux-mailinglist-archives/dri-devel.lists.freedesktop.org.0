Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6708F85D44A
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 10:50:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9526A10E6B6;
	Wed, 21 Feb 2024 09:49:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8237910E6A8
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 09:49:51 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-98-65d5c73ae00c
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
 linux-fsdevel@vger.kernel.org, viro@zeniv.linux.org.uk, jack@suse.cz,
 jlayton@kernel.org, dan.j.williams@intel.com, hch@infradead.org,
 djwong@kernel.org, dri-devel@lists.freedesktop.org,
 rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 hamohammed.sa@gmail.com, 42.hyeyoo@gmail.com, chris.p.wilson@intel.com,
 gwan-gyeong.mun@intel.com, max.byungchul.park@gmail.com,
 boqun.feng@gmail.com, longman@redhat.com, hdanton@sina.com,
 her0gyugyu@gmail.com
Subject: [PATCH v12 17/27] dept: Apply timeout consideration to
 wait_for_completion()/complete()
Date: Wed, 21 Feb 2024 18:49:23 +0900
Message-Id: <20240221094933.36348-18-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240221094933.36348-1-byungchul@sk.com>
References: <20240221094933.36348-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSbUyTZxSGfZ73k0qXN9WER/zB1oWYAcOPoDkxxo9fe2LiZrIs0WGiFd6M
 Iq1aFCiJCdUqghbRBDoomlJn6aAqtuoYWFMhUqoBQYuiAVRiUMKX4kpWwbmWzT8nV+77nOvX
 ERlVG5coavWHZINek6fmFaxiMr7+2/WBfnlVlzUNzp5eBeG/TrJQd9XNQ++VJgTu6yYMY3e/
 gyezEwjmuh8wYK3qRVD/coiB653DCHyuozw8evUFhMLTPASrTvFw7OJVHvrG5zEMVp/D0OTZ
 BvcrHRj8kdcsWMd4sFmP4eh4gyHibBTAWZIMI65aAeZfrobg8GMOfM9SoebCIA+3fEEWOltG
 MDxqreNh2P2Jg/udXSz0nrVwcHnKwcP4rJMBZ3hagId+O4Zmc1R04v0/HAQsfgwnfruGIfS0
 DcHtky8weNyPeegIT2DweqoY+NBwF8FIxaQAx09HBLCZKhCcOl7NwoOPAQ7Mg2th7u86fvN6
 2jExzVCzt5D6Zu0svecg9M/aIYGabz8TqN1zmHpdKfTirTFM62fCHPU0lvHUM3NOoOWTIUyn
 enoE2vXrHEtfhax4+/KfFRuy5TxtgWxYuXGPIsf9sEY4cEFR5C3rwyXohViO4kQiZZDadyP4
 M5vCoQXmpRVkYCDCxHip9CXxWka5cqQQGal0MXG97eZjxRJpDzEHHCjGrJRMWiJmLsZKaR2p
 mmv+X5pEmpr9C6K4aP67bWJhRyWtJf19N5iYlEifRBIMBpj/DpaRO64BthIp7WhRI1Jp9QU6
 jTYvIz3HqNcWpWft13lQ9KWcR+YzW9BM74/tSBKROl6Z80dIVnGagnyjrh0RkVEvVbKF0UiZ
 rTEWy4b9uw2H8+T8drRcZNUJyjWzhdkq6RfNIXmfLB+QDZ9bLMYllqCUr7e2WbIspfJXzJkE
 R4dty/OQvSRx1yaTr3970vzknU3VuQ7baENG5U3DJX3ayhXbik2LCopufr83s0Z/OTm9tGzn
 dOvR4ncVUveOn0ZvVO9AuoNKZ8+HhCXxuzKtvNE/VfdD81B5Wn2uKVW90/yR0M3njSJRj5/P
 be35RpdUrGbzczSrUxhDvuZf/KP9M04DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0hTYRjHe99z3anlwQYdKioWERiZQcaDRURQvQRF0YegqBx10OW0OkvN
 otBcNy+RwbLSymas6VbZZmgXTTRvieZ0mYWaWVTDlWFttGaXrejLw4///8/v08NT0VeYGbw+
 7aCspOkMWlaghY3LcxcltD6X4+xeDRQVxIH/22kaSu84WOi+bUfgqM7B4G1eBy8CPgShzmcU
 FJu7EVx/M0hBdcsQgjrbcRZ6300Fj3+MhXZzPgu55XdYcI9OYBi4cB6D3bkBOs5ZMDQEP9BQ
 7GWhpDgXh89HDEFrJQfW7PkwYrvMwcSbJdA+1MdA05V2BupeLYRLVwdYeFTXTkNL7QiG3gel
 LAw5fjPQ0dJGQ3dRIQO3PltYGA1YKbD6xzjoaSjDUGUK205+/cVAa2EDhpM37mLwvHyIoP70
 MAano4+FJr8Pg8tppuDHzWYEI2c/cXCiIMhBSc5ZBPknLtDw7GcrA6aBeAh9L2VXLSdNvjGK
 mFyZpC5QRpOnFoncvzzIEVP9K46UOdOJyxZDyh95Mbk+7meIs/IMS5zj5zmS98mDyeeuLo60
 XQzR5J2nGG+atU1YsUc26DNkZfHKRCHZ0XOJ239VOOQ648bZaJjPQypeEpdKOX4PjjArLpD6
 +4NUhDXiXMlV+J7JQwJPiacmS7YvnWykmCYmSqZWC4owLc6XaoMmJsJqcZlkDlXhf9I5kr2q
 4a9IFc4rSnx/N9FivPTcfY86h4QyNKkSafRpGak6vSE+1piSnJWmPxS7e1+qE4Wfxnp0oqgW
 fetd14hEHmmnqJNrPHI0o8swZqU2IomntBo1nRmO1Ht0WYdlZd8uJd0gGxvRTJ7WTlev3yon
 RotJuoNyiizvl5X/LeZVM7JRm+F2ihLVkfmk37Ll9Vv15oSK/MwcJfbx6t64a2+P7U2ybx9U
 BXoS4oeG3T6+Jl3hcaC2ft7hggOl87aotkctbG5a6b7n2r0oaXa1fN+ydkfPaF7fEfK+eVds
 TH3XUo+vplyIYio7yMejFyvW7EzXPEjwhgToLByvKCqwmZ19WtqYrFsSQylG3R8w6iL+MAMA
 AA==
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

