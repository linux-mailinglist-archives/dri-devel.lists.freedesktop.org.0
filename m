Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8064D85D465
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 10:50:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C13C10E6CD;
	Wed, 21 Feb 2024 09:50:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3E0B910E6B0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 09:49:52 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-d8-65d5c73a08db
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
Subject: [PATCH v12 21/27] dept: Apply timeout consideration to dma fence wait
Date: Wed, 21 Feb 2024 18:49:27 +0900
Message-Id: <20240221094933.36348-22-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240221094933.36348-1-byungchul@sk.com>
References: <20240221094933.36348-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSe2xLcRTH/X73uVJuSuIaQRqCMa8Mx1uQuP94ReK1eNzYtTXalc42E2Sz
 hxmTTexhXaQtqVrLppt4bmroNvZi3RTbwgiWbSajY1uZduGfk08+J+d7zh+HJRT3qUBWFXlY
 0kWKaiUtI2VdI0zBSysapbn9V0dB5tm54PmRSkJ+oY2G+htWBLaSBAztT9fBq95OBAM1dQTk
 ZNUjML5vIaDE2Yqg1HKShoaPI8Hl6aahKusMDYmXC2l40eHF0Jx9HoPVvh6eZ5gwOPo+k5DT
 ToM+JxH7yhcMfeYCBszxU6HNkseA9/08qGptoqD0zUy4eKmZhgelVSQ477RhaLiXT0OrbZCC
 585KEuoz0ym4/tVEQ0evmQCzp5uBlw4DhqIkX1DK9z8UVKQ7MKRcuYnB9fo+grLUdxjstiYa
 Hns6MRTbswjov/oUQdu5LgaSz/YxoE84h+BMcjYJdb8rKEhqXgADv/LpVUuEx53dhJBUHCuU
 9hpI4ZmJF+7mtTBCUtkbRjDYo4ViS5Bw+UE7Fow9HkqwF5ymBXvPeUZI63Jh4WttLSNU5g6Q
 wkdXDt40fqdsWZikVsVIujkr9soifn5IpA82sEcqi9xMPLIyaSiA5bkQ3mY04//s7mgZ8jQ3
 jXe7+wg/j+Em88Xpn6g0JGMJ7tRw3vKthvY3RnMbeH21l/QzyU3lk9+1DQ3IuYW8oSnz34JJ
 vLXIMeQDfP6avpPys4JbwDe+uEX4Q3lukOXL2t3/rhjHP7K4yQwkN6BhBUihiozRiCp1yOyI
 uEjVkdn7tBo78r2U+bg39A7qqd9SjjgWKUfII267JAUlxkTFacoRzxLKMXIy1qfkYWLcUUmn
 3aOLVktR5Wg8SyrHyuf3xoYpuHDxsHRAkg5Kuv9dzAYExqM52x4GJjQXhU8+6rhkD34d9L32
 SoKod+5XV4+7+dZ6yzkl2hw866Up+gQzaXvAZjHXtuaRdm1wZf7ivJDcC0bvxmN1aEaKrCdj
 uXa1surX7q0Lj2mnVe/KfhLf6O03rtwcXjORDZ2gI5taZSX3cvcUDKbCKM2hRdp9eTsecrc1
 5ulKMipCnBdE6KLEvzbeaqxOAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSW0iTcRjG+39nV6uPNezLomwgkVlqaLxUhFf1EVndRFAXOfKrDeeUTS0j
 wcNWHkMtW6XGMlmm5mErsoMhSuryMJfTNFQ8YZqnMmctzZpSNy8/fg/Pc/UyuKSQ9GKU6hhB
 o5arZJSIEJ04mLLnQFOXEDBoD4aczABwzqcSUFBZTkFHRRmC8mdJGEy8OwofF6YQLLbZcDDk
 dSB4ONSPw7PGAQS1JckUdI6uB4dzlgJrXgYFKY8qKbBPLmHQdycXgzJzKLRkF2FQ5/pMgGGC
 gnxDCuY+4xi4TKU0mBJ9YLjkPg1LQ4FgHegmoaHQSkLtp91w70EfBW9qrQQ01gxj0PmqgIKB
 8j8ktDQ2E9CRk0XC05kiCiYXTDiYnLM0fKgzYlClc69d/75MQlNWHQbXi6sxcPS+RvA2dRAD
 c3k3BQ3OKQws5jwcfj1+h2D45jQN+kwXDflJNxFk6O8QYPvdRIKuLxgWfxZQIQf5hqlZnNdZ
 LvO1C0aCf1/E8S/v99O87u0nmjeaY3lLiS//6M0Exj+cc5K8uTSN4s1zuTSfPu3A+Jn2dppv
 vrtI8KMOA3Zq61nRoXBBpYwTNP6Hw0SKHyMpVHQnc6W5qodORGV0OvJgODaI65nsX2WK3cn1
 9LjwFZay3pwla4xMRyIGZ2+s5Uq+tlErwUb2BJffukSsMMH6cPrB4dWCmN3PGbtz/o1u58qq
 6la9h9s/yZ8iV1jCBnNd9ud4NhIZ0ZpSJFWq4yLlSlXwXm2EIl6tvLL3QlSkGbmfxpSwlFOD
 5juP1iOWQbJ1YsULhyAh5XHa+Mh6xDG4TComLruVOFwef1XQRJ3XxKoEbT3awhCyTeJjZ4Qw
 CXtJHiNECEK0oPmfYoyHVyJ6vi/m3GDx8bYZBbuN+6JmPJPTOnTjZqN31lzrvcrkMUPsAO6Z
 cPHp8kjQi8wvp3/odjj7v4aPVze379oxLren7VfO6Cqkr/y56pOhla50i2g27JrfEIyExvZu
 +HZp2sfWEnJr3u9qxZE/NpvU09pgTzq/fmSXU68q2JxL3i5tlBFahTzQF9do5X8Bi6QiIjAD
 AAA=
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
index 76dba11f0dab..95121cbcc6b5 100644
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

