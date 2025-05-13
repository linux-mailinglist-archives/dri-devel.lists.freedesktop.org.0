Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CFFAB51FB
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 12:23:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01FF610E371;
	Tue, 13 May 2025 10:23:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 392DC10E554
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 10:23:08 +0000 (UTC)
X-AuditID: a67dfc5b-669ff7000002311f-ac-682319ef66b8
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
Subject: [PATCH v15 15/43] dept: apply sdt_might_sleep_{start,
 end}() to waitqueue wait
Date: Tue, 13 May 2025 19:07:02 +0900
Message-Id: <20250513100730.12664-16-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250513100730.12664-1-byungchul@sk.com>
References: <20250513100730.12664-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSbUxTdxTG/f/vayt3u+l8uVYWsMaZsPiCQXfi1Czbh93EEJbMKNkStxt7
 YxsLmlarmJDBKMahdMyENlqBUkxt2oqskMxNSyqEChIBASsqoBAVCUUSpM1QqLZufjn55TnP
 eZ4vhyVUYUrN6guPysZCyaChlaRyOq1+w8yqtbrNsd4NEJs7TcLFq34a+hp9CPwtpRgmO76F
 +/Eogjd3egmwV/chqB8bIaAlPIog6PmVhoGnH8FgbIaGruozNJQ1XKXh7tQChmHbOQy+QC48
 dj8nobvKhcE+SYPDXoaT4wWGebeXAXfJOhj3XGBgYSwbukYjFAQffg7na4dpuBHsIiF8bRzD
 wD8XaRj1v6WgO9xJQty6Gvr+qKTgyksXDVNxNwHu2AwD/SEnhrBzBTRZkoGnXiUouFUZwnDq
 0p8YBh9cR9B6+gmGgD9CQ3ssiqE5UE3A68sdCMat0wyUn51nwFFqRXCm3EaCZXgrvPk32Vwz
 lw2ldU0kXFmMoK92iv5aPxLbozOEaGk+Lr6O3aPFYNxJirddgvj3hRFGtLQ+ZERn4JjY7MkS
 G25MYrF+NkaJAe9vtBiYPceIFdODWHzZ08N8l/6DcodWNujNsnHTrp+VutYR7RGr4kQ03E+U
 oEqmAilYgc8RPKFx+gNPTLTjFNP8emFoaJ5I8TI+U2iufE5VICVL8JGlwv2aB6gCsewn/F5h
 ro1LeUh+nXC+2/rez/HbBNuY4//8DMHXFHqvK5L64uUeMsUqfqtQ5fSRqUyBr1MICXsc/3ew
 SrjpGSKrEOdES7xIpS80F0h6Q85GXVGh/sTGA4cLAij5Xe7ihR+vodm+79sQzyJNGtc5uUan
 oiSzqaigDQksoVnGlf6VlDitVHRSNh7+yXjMIJva0GqW1KzktsSPa1X8QemofEiWj8jGD1vM
 KtQl6GPvna+X7F/hy33ESp/lPcuzNHV7HftMy/fZvslzIXM4XJ1G1/ZPvTggnXXcTHe5O8q2
 Le/JyMnibJ+u1K2nLNt71caE7tX87rUTzFjZwBM/VZ4/l6GOLO6PG/J/2ZHQtuw1Z976fZZr
 KE5/WhyNdn05lZm3JfRFom53eWPnpT0a0qSTsrMIo0l6B3m97mFZAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSf0jTeRjH7/P9vemuL6b2vSSqVYRKmajHEx4VHOWH4OTun4oIauS3tppb
 bP7IvCOXM7p1GzPQUUtvWkxxq2wL++VMFFcmeda89QO1HGG3c+Zhm2TZjxndPw8vXs+b9/PP
 w5FJrfRSTqUpEXUahVrOSClpYX71uunvVik33JlMhlj0FAXnr7gZGLrsQuC+ZiAg3FcAj2cj
 CN4/+IsEW90QgqbxURKu+ccQ+FpPMBB4+S0Mx6YZ6K87zUD1hSsMPJycJ2Ck/gwBLs9P8Nw5
 QcGAtZkAW5gBu62aiI9/CJhztrHgrFoDodZzLMyPZ0P/WJCG3oZ+GnzPMuFs4wgDnb5+Cvw3
 QgQEbp1nYMz9iYYB/z0KZi1pMFRrpuHS62YGJmedJDhj0yw86nYQ4HekQrsx3nryzUca7pq7
 CTh58SoBw09vI+g69YIAjzvIQG8sQoDXU0fCu5Y+BCHLFAs1f8yxYDdYEJyuqafAOJIH79/G
 LzdEs8HwZzsFlz4E0ZZN2N3oRrg3Mk1io7ccv4v9zWDfrIPC95sFfPPcKIuNXc9Y7PCUYm9r
 Br7QGSZw00yMxp623xnsmTnDYtPUMIFfDw6yPy/bLf2hSFSrykRd1qZ9UmXXaNERi+RoxP+I
 rEJm1oQknMDnCq9e9RILzPBrhSdP5sgFTuZXCF7zBG1CUo7kgwnC44anyIQ4bjG/Q4j2yBYy
 FL9GODtg+ZKX8d8L9eP2r53LBVd79xcvifsPLYPUAifxeYLV4aKsSOpA37ShZJWmrFihUuet
 1x9WVmhUR9fv1xZ7UPx/nL/N195A0UBBD+I5JE+U3QuvVCbRijJ9RXEPEjhSniwzXI8rWZGi
 4pio0+7VlapFfQ9K4yj5Etn2neK+JP6gokQ8LIpHRN3/W4KTLK1ClYcm7yQE88s7/j1QZd6V
 sjo/fVtfYcIuX7H8mH1xZeLN1JyOmbRM2KGxaT+m21v+S+mo25jpdVlXdP/SN56F99zfuMhe
 EGW2V89LDFsrw6sPmVIL1fsjU5utxhxb7UTBp5J1ow8PbF0Zyr3YmPLjcm1JZ5Y7EBgZ2rMk
 8Ktaezwkp/RKRXYGqdMrPgMTrqkcOwMAAA==
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

Make dept able to track dependencies by waitqueue waits.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/wait.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/wait.h b/include/linux/wait.h
index 965a19809c7e..aae161e500dc 100644
--- a/include/linux/wait.h
+++ b/include/linux/wait.h
@@ -7,6 +7,7 @@
 #include <linux/list.h>
 #include <linux/stddef.h>
 #include <linux/spinlock.h>
+#include <linux/dept_sdt.h>
 
 #include <asm/current.h>
 
@@ -303,6 +304,7 @@ extern void init_wait_entry(struct wait_queue_entry *wq_entry, int flags);
 	struct wait_queue_entry __wq_entry;					\
 	long __ret = ret;	/* explicit shadow */				\
 										\
+	sdt_might_sleep_start(NULL);						\
 	init_wait_entry(&__wq_entry, exclusive ? WQ_FLAG_EXCLUSIVE : 0);	\
 	for (;;) {								\
 		long __int = prepare_to_wait_event(&wq_head, &__wq_entry, state);\
@@ -321,6 +323,7 @@ extern void init_wait_entry(struct wait_queue_entry *wq_entry, int flags);
 			break;							\
 	}									\
 	finish_wait(&wq_head, &__wq_entry);					\
+	sdt_might_sleep_end();							\
 __out:	__ret;									\
 })
 
-- 
2.17.1

