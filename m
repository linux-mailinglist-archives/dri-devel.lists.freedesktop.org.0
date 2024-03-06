Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D819873162
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 09:56:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFEB5113018;
	Wed,  6 Mar 2024 08:55:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 593BE10FFDA
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 08:55:31 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-38-65e82f7efe45
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
 melissa.srw@gmail.com, hamohammed.sa@gmail.com, 42.hyeyoo@gmail.com,
 chris.p.wilson@intel.com, gwan-gyeong.mun@intel.com,
 max.byungchul.park@gmail.com, boqun.feng@gmail.com, longman@redhat.com,
 hdanton@sina.com, her0gyugyu@gmail.com
Subject: [PATCH v13 17/27] dept: Apply timeout consideration to
 wait_for_completion()/complete()
Date: Wed,  6 Mar 2024 17:55:03 +0900
Message-Id: <20240306085513.41482-18-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240306085513.41482-1-byungchul@sk.com>
References: <20240306085513.41482-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSbUhTYRTHfZ57d+91tLoto5sFyUyEotTKOIJEn+omCEbYB/swR15y5Uts
 ahlZmi+kpmamlprMqWu6lbZZWDkxTctFNl8wK5My8YWmkrqVKdVW9OXw43/O//fpMITULPJm
 lAlJgipBESejxKR4do1216WAaSHQoAuB4muB4Fi6SkJVk5EC230DAmNLBoaZ7sPw1mlHsPL6
 DQHlpTYENZ8/EtDSM4bAor9CweDEWhhyzFPQW5pPQWZtEwX9X1cxjJbdwGAwhcOr61oMHctT
 JJTPUFBZnoldYxrDsq6RBl26H4zrK2hY/RwEvWPDIrC83wm3q0cpaLP0ktDTOo5h8EkVBWPG
 3yJ41fOSBFtxgQjuzWkp+OrUEaBzzNMw0KHB0JzlEuUs/hLBi4IODDl1DzAMvXuKoP3qJwwm
 4zAFXQ47BrOplICfd7sRjBfO0pB9bZmGyoxCBPnZZSRkjQbDyo8q6mAI32WfJ/gs8zne4tSQ
 vFXL8Y8rPtJ8Vvt7mteYknmzfgdf2zaD+ZoFh4g3NeZSvGnhBs3nzQ5hfq6vj+Zf3loh+Ymh
 chzhHSUOjRHilCmCKuBAtDjWOHCbPlstPm/O7cfp6BOThxiGY/dxufNkHvL8i9OGfuRmivXn
 RkaWCTd7sT6cuWBS5GaCtYu5ur5D7uoGNpprehDijknWj+vLzKbdLGH3c1PWYvxPuY0zNHf8
 1Xi68qK5IsrNUjaYe51Z42Kx6+Y3wz1eqkb/Cpu5Z/oR8jqSaJBHI5IqE1LiFcq4fbtjUxOU
 53efTIw3Idcr6dJWT7SiBduxTsQySLZGctBzSpCKFCnq1PhOxDGEzEty8eeEIJXEKFIvCKpE
 uSo5TlB3oi0MKdsk2eM8FyNlTymShDOCcFZQ/d9ixtM7Hd2Rby85nRhZ0tAQldYUVhvgc8TL
 4/v6t+r6VsChtfqtlYWDz8v8GiLCZZOakozjthWn6Wjao41fKvTdF/da5FZ/+Y8Dd8KFh6PZ
 kYvYGuPbkndGPm6fvHw0eFhelL/0zbruZv1iGPvNRyY80aVuDAs83RlR4Gcb9qn07dJuKPog
 I9WxiqAdhEqt+APBghUaRgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0hTcRyG+//P1dHiMIUOBhXrbpRKGb8yonsnu9CHqOhDOfSUw6mxmWVY
 mFPzWio5S1dsq5bpnLUVaKktTUsz0xQzUVGTnHmDcpJpF1f05eXhfeH59LKETEd5s8rIaFEd
 qVDJaQkpORioXXPJ1yn6NejkkJ3hB66JFBL0pRYamq3FCCyPL2MYqt0DHyZHEEy/fUdAXm4z
 AmNfNwGP63oQVBYm0NA6MA/aXOM01Oem06C9U0pDy/AMhi5dDoZi2wF4k2XC4JgaJCFviIaC
 PC2eDSeGKXMRA+b4ZdBfmM/ATJ8/1Pe0U1Bzq56Cys7VcPN2Fw0VlfUk1JX1Y2h9qqehx/Kb
 gjd1r0lozs6koGTMRMPwpJkAs2ucgfcOA4aHibO25G+/KHiV6cCQfPcRhraPzxBUpfRisFna
 aahxjWCw23IJ+HG/FkH/1VEGkjKmGCi4fBVBepKOhMSuAJj+rqe3bhJqRsYJIdF+TqicNJBC
 g4kXyvO7GSGxqpMRDLazgr3QR7hTMYQF41cXJdiKUmnB9jWHEdJG27Aw1tTECK9vTJPCQFse
 PrTguGRzqKhSxohq3y3BkjDL+5vMmduS8/bUFhyPetk05MHy3HreWdyC3ExzK/iOjinCzV7c
 Yt6e+ZlyM8GNSPi7TbvTEMt6csF86aON7prklvFN2iTGzVJuAz/YkI3/KRfxxQ8dfzUes/21
 sWu0m2VcAP9Wa6SzkMSA5hQhL2VkTIRCqQpYqwkPi41Unl8bEhVhQ7NvMV+cyS5DE617qhHH
 Ivlc6VaPQVFGKWI0sRHViGcJuZc07seAKJOGKmIviOqok+qzKlFTjRawpHy+NOioGCzjTiui
 xXBRPCOq/6+Y9fCORymdnoGvrvTtG7YW7IjOOt4RJd35YXd+kL5/07bU9d6yQy+Dcog1jTsi
 rC9qk0/s3zC6cMmDI8mHv18/Nr2XcZbPUZV82pmQQD05ZaLGtju/RC0t8l1n4Iy6id53w7tK
 VoUst1asrO3eZXXK9Z1LGxtNz5dfujf3p6PdboyLbmnmcrbISU2Ywt+HUGsUfwBNhV94KQMA
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

