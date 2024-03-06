Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5285787316C
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 09:56:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3368B113025;
	Wed,  6 Mar 2024 08:55:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id D10CA10EC08
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 08:55:31 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-58-65e82f7e1343
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
Subject: [PATCH v13 19/27] dept: Apply timeout consideration to waitqueue wait
Date: Wed,  6 Mar 2024 17:55:05 +0900
Message-Id: <20240306085513.41482-20-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240306085513.41482-1-byungchul@sk.com>
References: <20240306085513.41482-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSfUzMcRzH+35/j3ccP1fmpxi7aSzTg3n42Kwxk69NxvzHLEc/Oq7YnSIy
 pQuVHkQX1bhLO7fK04VJDzu1npj0NJKKWh6aq4hr6hruMv989tr78/m8Pv98eEr5iPHlNTHH
 JV2MWqti5bR8eKZ5xdmgL1JwkmsGXL4UDM6fF2kovFfGQuvdUgRlD5MwDNVvgTfjDgSul68o
 yMttRWDu76XgYUMfgmrrORY6BmdBp3OUhebcdBaSb91joe3rFIYeYw6GUls4vMguwmCf+ExD
 3hALBXnJ2F2+YJiwlHBgSfSHAWs+B1P9IdDc95qB6u7lcP1GDwtV1c00NDwZwNDxtJCFvrI/
 DLxoaKKh9XIGA3dGilj4Om6hwOIc5aDdbsJw3+AWnf/xm4HGDDuG88UPMHS+rURQc/EDBlvZ
 axbqnA4M5bZcCiZv1yMYyBzmIOXSBAcFSZkI0lOMNBh6VoPrVyG7YR2pc4xSxFB+glSPm2jy
 vEgkFfm9HDHUdHPEZIsl5dYAcqtqCBPzmJMhtpJUltjGcjiSNtyJyUhLC0earrloMtiZh3f4
 7pavj5S0mjhJFxS6Tx5lrmmijj3iThZf6EaJyMCmIRkvCqvEqql06j/fHX2HPcwKS8Wuronp
 3EdYLJZnfGI8TAkOuVjcEuZhb2G7+Ph9FudhWvAXh/uKkIcVwhrR+s3K/HMuEkvv26c9Mnee
 NZI1fVcprBZfJpvdLHfP/OHF1Mrv3L+F+eIzaxedjRQm5FWClJqYuGi1RrsqMCo+RnMy8MDR
 aBtyP5PlzNSeJ2isdVctEnikmqnYIPssKRl1nD4+uhaJPKXyUSRMDkpKRaQ6/pSkOxqhi9VK
 +lrkx9OqeYqV4ycilcIh9XHpiCQdk3T/u5iX+SaihVfEx7JmubnOD9rb+jXeCRVeSZP1Qlf+
 jNP81br6OdduZif8fO/tXN7YA15n5hqllgUubRi3ZtsSx7bwwxvXLvsU4LV/X2r4fH1b5sC5
 ZcaakI8jvWMmlZ7fG0bijFs3+6bE5kfsPIjTFmeHbra3364Qr6f4BRhyrJsKGmeH5qpofZQ6
 JIDS6dV/AdVQUNRIAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAAzXSe0hTcRQH8H6/e+/vztHitoQuShSjiLQnaB0sKgLz0osiIymobnXLlS82
 M40yy/U0X4UtU8sXc7n12ix6OBuaNpPUUixfq8Qy8bEoJ5lSbUX/HD6cA99z/jgySqln/GTq
 mHhJEyNGqYiclm9anrogedEXaXHexyWQfWkxuEfO05B/10yg+Y4JgbniFIb+2jB4OzqIYPxV
 EwX6nGYERR+7KaiocyKwGU8TaOmdAq1uF4H6nDQCqSV3CbwemMDQdfUyBpNlIzRkFWOwj/XR
 oO8nkKdPxZ7yBcOYoZwFQ8oc6DFeZ2HCc0S9s42BmoJ6BmwdgZB7o4tApa2ehrpHPRhanuQT
 cJp/M9BQ56ChOTudgdvDxQQGRg0UGNwuFt7YCzHc03nSzn7/xcCLdDuGs6X3MbS2P0VQdf4D
 Bou5jUCNexCD1ZJDwc+yWgQ9GUMsnLk0xkLeqQwEaWeu0qDrCobxH/lkdYhQM+iiBJ31qGAb
 LaSFl8W88Ph6NyvoqjpYodByRLAaA4SSyn4sFH1zM4Kl/AIRLN8us8LFoVYsDDc2soLj2jgt
 9Lbq8Wb/HfIV+6UodYKkWbRyjzyyqMpBxT1gE0vPdaAUpCMXkY+M54L4O65O7DXh5vLv3o1R
 Xvtys3hr+mfGa4oblPOljWu9nsZt4h++z2S9prk5/JCzGHmt4Jbyxq9G5l/mTN50z/43x8fT
 zxzO/LtLyQXzr1KLSBaSF6JJ5chXHZMQLaqjghdqD0cmxagTF+6LjbYgz7sYTkxkP0IjLWHV
 iJMh1WTFap8+ScmICdqk6GrEyyiVr+L4z15JqdgvJh2TNLG7NUeiJG018pfRqumKddulPUru
 oBgvHZakOEnzf4plPn4p6KQYXRDWvqZvin5SeIBj/tOyypDIJkeftHPDLecVe4Ttc9Wy9U/2
 ZuwyW+PKbmZdc22/3bCODX0eSrY2Bj1LCxenblmzoeDDs87jESMVvf6rZuQ2X1hvemlXJX4q
 C42PHZg9zxRU4Aw8EPijsyG52/mpZEa7NthyqDY3YptzegROXquitZHikgBKoxX/AKRsMwwq
 AwAA
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
consideration to waitqueue wait, assuming an input 'ret' in
___wait_event() macro is used as a timeout value.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/wait.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/wait.h b/include/linux/wait.h
index ebeb4678859f..e5e3fb2981f4 100644
--- a/include/linux/wait.h
+++ b/include/linux/wait.h
@@ -304,7 +304,7 @@ extern void init_wait_entry(struct wait_queue_entry *wq_entry, int flags);
 	struct wait_queue_entry __wq_entry;					\
 	long __ret = ret;	/* explicit shadow */				\
 										\
-	sdt_might_sleep_start(NULL);						\
+	sdt_might_sleep_start_timeout(NULL, __ret);				\
 	init_wait_entry(&__wq_entry, exclusive ? WQ_FLAG_EXCLUSIVE : 0);	\
 	for (;;) {								\
 		long __int = prepare_to_wait_event(&wq_head, &__wq_entry, state);\
-- 
2.17.1

