Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA84AB520C
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 12:23:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 757F010E575;
	Tue, 13 May 2025 10:23:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id B878610E554
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 10:23:08 +0000 (UTC)
X-AuditID: a67dfc5b-669ff7000002311f-0c-682319f0cb72
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
Subject: [PATCH v15 21/43] dept: apply timeout consideration to waitqueue wait
Date: Tue, 13 May 2025 19:07:08 +0900
Message-Id: <20250513100730.12664-22-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250513100730.12664-1-byungchul@sk.com>
References: <20250513100730.12664-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0iTcRTG+7/XuVq8rMjXNKrViopKReMQFX4IeimKoE8VVCNf20inzLQm
 BLOmrYtihkraZVrM6ZaXqWXlzBSXS7KVutSmqYi1vIW6mWmXzerL4cfznPM8X44AF7eQKwUK
 5TlepZTFSighIRxbUrj1W9A6eajRvgk80zoC7pSbKXCUmRCYq1MxcDfvgw/eUQRzb97ikJfj
 QFA40ItDta0PgdV4iYL2oaXQ4ZmgwJ5znYLLD8opeDcyj4ErNxsDk+UgfDIME9CaVYRBnpuC
 grzLmG98wWDWUEqDQSOFQWM+DfMDYWDvc5Jg7dkCt++5KKiz2gmw1Q5i0P7sDgV95t8ktNpa
 CPBmBoPjZgYJj8aLKBjxGnAweCZoeN+gx8CmXwEVWl9g+tQvEl5lNGCQ/rASg47u5wjqdf0Y
 WMxOCpo8oxhUWXJw+FHcjGAwc4yGtBuzNBSkZiK4npZLgNYVCXPffc13p8Mg9X4FAY9+OlHU
 bs58z4y4ptEJnNNWned+eDopzurVE9zrIpZ7mt9Lc9r6HprTW5K4KuNm7kGdG+MKJz0kZym9
 SnGWyWyauzbWgXHjbW304ZBjwl3RfKwimVdt33NKKHdla8mEGvqCqfgSpUFa6hoKELBMBGus
 nCL/84uyxws6xWxku7pmcT8vZ9awVRnDvh2hAGeci9kPd7uR31jGHGJLa+YWjglGyjpffqb9
 LGJ2sAMfs/4VrGZNFQ0LQQE+/WdxG+FnMRPJZulNhD+UZW4FsK4SO/H3IIh9aewispBIjxaV
 IrFCmRwnU8RGbJOrlYoL207Hx1mQ778MF+eP16JJx5FGxAiQZImoxb1WLiZlyYnquEbECnDJ
 clHqE58kipapU3hV/ElVUiyf2IiCBYQkUBTuPR8tZs7IzvFneT6BV/13MUHASg3CyRjrhp2O
 BN1QSkh+0fyvZdLwJsWEqZP/JJ7JWXTqa/xMSJTw4XhoR7070t7XW1I8N7zfsk5DqruV00d1
 QXb1AUaXd3JqdeWV3Bhna2BSJja4dm/1gYzckZoBjZRJq2xfRcedaJJuaU73xNcG2/pnvs8O
 rReHPdtY8LF2TdS4hEiUy8I246pE2R8tt+I4WwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0iTYRiGfb/jnC2+TOrrRLWywsgSsh4oovrjS5D0I0iigys/2mpO22xp
 B3C5xLTpMmyUaXPFtG2lbR3soJni0iyztGW1LKXTyLLSSTY7bFF/Hi7uG677zyMiI230ZJFC
 lSGoVTKllBFT4sRlOQu+TJolX3S+Wgz+oTwKTlc7GOi4aEfguKwjwNecAE+H+xEEHjwkwVTS
 gaCi9yUJl909COqqDjHQ+WYsdPkHGGgtKWAg52w1A48+jhLgPVFMgN25Fl5Z31HQZrQQYPIx
 UGrKIYLnAwEjVhsL1uxo6Ks6xcJobxy09nhoaCprpaHu+Xw4We5l4FZdKwXu2j4COm+cZqDH
 8ZuGNncLBcOFU6DjmIGGC58tDHwctpJg9Q+w8LjBTIDbPAFq9EFr7uAvGu4aGgjIPXeJgK5n
 NxHU570mwOnwMNDk7yfA5Swh4UdlM4K+wk8sHD46wkKprhBBweETFOi98RD4HlwuG4oD3Zka
 Ci789KCVK7Cj3IFwU/8AifWuvfiH/wmD64bNFL5n4fH1Uy9ZrK9/zmKzcw92VcXgs7d8BK74
 5qex03aEwc5vxSzO/9RF4M/t7ey6aRvFy1MEpUIrqBeuSBbLvcV6Ov0Km2mvPMRkIz2Tj8JF
 PLeYv33x6l9muLl8d/cIGeIobgbvMryj85FYRHKeCP5p2TMUKsZzibztSoAOMcVF854779kQ
 S7glfO8L4z/pdN5e0/BXFB7Mf1a2UyGO5OJ5o9lOGZHYjMJsKEqh0qbKFMr4WM0ueZZKkRm7
 PS3ViYIfZD04eqwWDXUmNCJOhKRjJC2+mfJIWqbVZKU2Il5ESqMkumvBSJIiy9onqNO2qvco
 BU0jmiKipBMlazYIyZHcDlmGsEsQ0gX1/5YQhU/ORknO44PREZtsuPjqV2XCwGBOUmmRJa+x
 fqwxq4nQjls3bZXs4VFDScPXjeJk3ZyZieu9LfNi0w5sPtBt01oCLi6hwDSuaGpXxdvlRau3
 7t/yJaLUuN33+/3usNmxYerc0dvblNay9g+Bpe6M7pW5bS+Om3bezzR4+q7HaNrKX7ObVFJK
 I5fFxZBqjewPbbt9GD0DAAA=
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
index aae161e500dc..e77344a8160d 100644
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

