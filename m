Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E468BFA16
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 12:03:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A44DD113544;
	Wed,  8 May 2024 10:03:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 47F5211352D
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 10:02:56 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-69-663b4a3b6bae
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
Subject: [PATCH v14 21/28] dept: Apply timeout consideration to dma fence wait
Date: Wed,  8 May 2024 18:47:18 +0900
Message-Id: <20240508094726.35754-22-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240508094726.35754-1-byungchul@sk.com>
References: <20240508094726.35754-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa2xLYRjHve85PeesVjkp4WwipCITd2I8rhGEQ0KE+MAEZWfa2LqltZsQ
 m3VWY2Niyi50l9Sy1u10YS6V2myMqLGOja1sxix2YbRZdUE3fHnyy/P8/79PD0PIKyShjFpz
 QNBqlNEKSkpKe4KLZi5ZvyRqjssSAjkn54Dnh4GEgmtWCuqvWhBYK1IxdNWshdfebgT+Z88J
 MObWIyhqayWgotaNwF52lIKGjlHg8vRRUJd7goK0kmsUvPgyiKHl3BkMFnEDPD1djMHh6yTB
 2EVBvjENB8ZnDD5zOQ3mlCnQXpZHw2DbXKhzv5KA/c10uHCxhYJ79joSaivbMTTcKaDAbf0t
 gae1j0moz8mSwJXeYgq+eM0EmD19NLx0mDBc1wdEx77/ksCjLAeGY6U3MLia7yK4b3iPQbS+
 oqDa043BJuYS8PNyDYL27B4a0k/6aMhPzUZwIv0cCfqWcPAPFFArFvHV3X0Er7cl8navieSf
 FHP87bxWmtfff0PzJjGet5VN40vudWG+qN8j4cXy4xQv9p+h+cweF+Z7nU6af3zeT/IdLiPe
 FLpdujRSiFYnCNrZy3dLVe8aI+IamKTsaj+dgix0JgpiOHY+Jxbekvxn90svGmKKDeOamnzE
 EI9hJ3G2rE/DGYLtlnKlzjVDPJrdyFX2Pxv2kOwUbrDNTw2xjF3AXbEV/nNO5CzXHcOeoMC+
 ubN32C9nw7m7aXmBrjSQGWC4js4P6G8hhHtQ1kSeRjITGlGO5GpNQoxSHT1/lipZo06atTc2
 RkSBXzIfHoyoRP31W6oQyyBFsMwxbnGUXKJM0CXHVCGOIRRjZDUZC6Pkskhl8kFBG7tLGx8t
 6KrQeIZUjJPN8yZGytl9ygPCfkGIE7T/r5gJCk1B6a8XnhpRWri8qVFVcvPQw7hP9CrXZHvS
 6nnijoTZrMn5Nae5KCN2wta+2otjv+XTcfrnUc4U6S+DYWDPqLy3I8/qln1Ufzdm/Fzh3nTJ
 MTPYlJmaXpq7aIavtfcIbtyqWtcT/t66MynEr8gPM2iWmRurV29etUAzNTEiIt6l/Lpym4LU
 qZRzpxFanfIP8AkjmEcDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0hTYRjHe99zznvmanFYUgf7UA263wyyHjKiT/USXQ0ULMuVZzmaq7ay
 LAJr2m1qGal5q81smbPUMwu7TETTMsms2RW1FLEkL2FOsknljL48/Pj/+f8+PQpGnckFKfTG
 w5LJqDVoiJJVbg61LA7dEKoL/lXGQnpKMHiHzrGQV1pCoPmuE0FJxSkMPXXr4d1wLwLfi5cM
 ZGU0I7B3tDFQUd+OwF10moCnazK0eAcINGRYCVhulBJ49W0UQ2vmZQxOeRM0XirAUD3yhYWs
 HgK5WRY8dr5iGHEU8+BInA2dRTk8jHYsg4b2txzU5jdw4P64ELKvtRJ47G5gob6yE4PnYR6B
 9pI/HDTWP2OhOT2Vgzv9BQS+DTsYcHgHeHhdbcNQljRmO/PjNwdPU6sxnCksx9Dy4RGCqnOf
 McglbwnUensxuOQMBn7dqkPQmdbHQ3LKCA+5p9IQWJMzWUhqDQHfzzyydhWt7R1gaJLrKHUP
 21j6vECkD3LaeJpU9ZGnNvkIdRUtoDce92BqH/RyVC4+T6g8eJmnF/paMO1vauLps6s+lna1
 ZOGt0yOVq2Mkgz5eMi1dE62M/fRmx0GP4lharY9PRE7+AgpQiMJysf31MPIzEeaK79+PMH4O
 FGaKrtRuzs+M0KsUC5vW+XmKsFmsHHwxvmWF2eJoh4/4WSWsEO+48rl/zhmis6x63BMwln/4
 0j/uVwsh4iNLDn8JKW1oQjEK1Bvj47R6Q8gS8/7YBKP+2JK9B+JkNPYtjpOj6ZVoyLO+BgkK
 pJmkaiahOjWnjTcnxNUgUcFoAlV1Z1fq1KoYbcJxyXRgt+mIQTLXoOkKVjNNtSFCilYL+7SH
 pf2SdFAy/W+xIiAoEcnZRFdoLVy5L9jdFvVg0c2QIOc7Q2lKsef4nKrki1MjzVGL4GrkuhOm
 xMYOnXtiRNgcY7g9bMXc8Fsb+7bM31Vzrxx3Rz+8mXDbNiBbs7duu+6dB91h5zPu5eaKXWfv
 P7fv1u25bx+K2j7LGnFl74xINub7oR209KglKn/pTvIkR8OaY7XLFjAms/Yv1hmQZykDAAA=
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
consideration to dma fence wait.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 drivers/dma-buf/dma-fence.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index d6f9b339b143..ccd9beb140d1 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -784,7 +784,7 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
 	cb.task = current;
 	list_add(&cb.base.node, &fence->cb_list);
 
-	sdt_might_sleep_start(NULL);
+	sdt_might_sleep_start_timeout(NULL, timeout);
 	while (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags) && ret > 0) {
 		if (intr)
 			__set_current_state(TASK_INTERRUPTIBLE);
@@ -888,7 +888,7 @@ dma_fence_wait_any_timeout(struct dma_fence **fences, uint32_t count,
 		}
 	}
 
-	sdt_might_sleep_start(NULL);
+	sdt_might_sleep_start_timeout(NULL, timeout);
 	while (ret > 0) {
 		if (intr)
 			set_current_state(TASK_INTERRUPTIBLE);
-- 
2.17.1

