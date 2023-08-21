Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BC378222A
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 06:05:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F30F010E19A;
	Mon, 21 Aug 2023 04:05:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2717A10E18F
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 04:05:00 +0000 (UTC)
X-AuditID: a67dfc5b-d6dff70000001748-8b-64e2ded5c2df
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v10 10/25] dept: Apply sdt_might_sleep_{start,
 end}() to waitqueue wait
Date: Mon, 21 Aug 2023 12:46:22 +0900
Message-Id: <20230821034637.34630-11-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230821034637.34630-1-byungchul@sk.com>
References: <20230821034637.34630-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSfUzMcRzHfX8P39/dcfbbYX5kw00zzLPsw8z857cZ85zJQzf3m26u2JWS
 h+0oIUqyioSrdM51id/Z5HpwotxxnSSk1a07j+lR3JEKFf757LX3e3u//vlISMU9eqJEExUj
 6KJUWiWWUbKOUbmzX3p86nnvuxbDuTPzwP/tJAU5xRYMtTcLEVjuHCWgtWolvA60I+ireUZC
 VkYtglxvMwl3qj0Iyk3HMLx4Nxrq/V0YnBmnMSTkF2N43tZPQFNmOgGF4mp4mpZHgL33IwVZ
 rRguZSUQg+cTAb1GMwNGfTD4TNkM9Hvng9Pziobyxllw8UoThrJyJwXVJT4CXthyMHgsv2l4
 Wu2goPZcCg1FnXkY2gJGEoz+Lgbq7AYCbiUODiV9/UXD4xQ7AUnXbhNQ/6YUQcXJFgJEyysM
 D/3tBFjFDBJ+Xq9C4EvtYOD4mV4GLh1NRXD6eCYFzwYe05DYFAJ9P3LwiqX8w/Yukk+0xvHl
 AQPFP8nj+HvZzQyfWNHI8AZxP281zeTzy1oJPrfHT/Oi+RTmxZ50hk/uqCf4Treb4R0X+ij+
 XX0WsTZoq2yZWtBqYgXd3OXhsghn6aF9N6QHKs42Ij26ziQjqYRjF3GvB9qp/3zT5UZDjNnp
 XENDLznEY9kpnDXlA52MZBKSPTGSM3XX4KFiDLud+/q+jR5iig3m9MamYZazi7mqY4/+CSZz
 hbfsw0PSwVwstQ0LFGwI98X79p84QcrZqkP+8gTugamBSkNyAxphRgpNVGykSqNdNCciPkpz
 YM6uvZEiGnwo45H+sBLUU7uhErESpBwlD5/kUytoVWx0fGQl4iSkcqw86LtXrZCrVfEHBd3e
 nbr9WiG6EgVJKOV4+YJAnFrB7lbFCHsEYZ+g+98SEulEPSrMPKF3ukpMd73uqTMG0g2Zh1rE
 qzGr7Ui95vNlHD7OvSU4b3JBQfPl37KSuk0W14qPnY7UotTD2yIMZTYzNH7XTrP5W85uXhWa
 ZraGbll/vzvJ5+nu2Bp6IT/OjovL6sISdnhNYecXuhwOkv6cXeBe4krfWNTqvr8uwMbXjFZS
 0RGq+TNJXbTqD5YtGiVMAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0hTcRjG+5/rNl0dptTJomQhgaYppb2URH3IDoUVfQkCydEOOdQVm3kp
 Ik1L0ywdeElXLY2l89qMWurG0LRWeSm1VFRy2cU0TXMzc1kq9eXlx/PA7/nyCnCJlvQSKJRx
 vEopi5FSIkJ0aFeqf8+QXR6YU7gBcq8FgmMmgwBtTSUFndUVCCofpmAw2rIf3jnHEcy3deBQ
 kNeJ4O7wIA4PW4cQmMsuUdA1shK6HZMU2PKyKEgtraHg9ZgLg4F8DQYVxnB4mVOCgXXuMwEF
 oxQUF6Rii+cLBnN6Aw36ZB+wlxXR4BoOAtvQWxKab9lIMPf7wc3bAxQ0mm0EtJrsGHTVaykY
 qvxDwsvW5wR05maTUDVRQsGYU4+D3jFJwxurDoPatEXblR8LJDzLtmJw5d4DDLr7GhBYMt5j
 YKx8S0GzYxyDOmMeDr/utyCwX/9Gw+VrczQUp1xHkHU5n4CO389ISBsIhvmfWmrPLq55fBLn
 0uoSOLNTR3AvSljuSdEgzaVZ+mlOZzzL1ZX5cqWNoxh3d9pBckbDVYozTmtoLvNbN8ZNtLfT
 3PPCeYIb6S7Ajqw/LgqV8zGKeF61dXekKMrWcP5MuTDRcqMfJaP7dCYSClhmO1v9qh0tMcVs
 Znt75/Al9mS82brsT2QmEglwJt2NLfveRi0VHkwE++PjGLnEBOPDJusHllnMhLAtl57+k25k
 K2qtyyLhYm5sqF8ekDDB7NTwByIHiXRohQF5KpTxsTJFTHCAOjoqSalIDDh5OtaIFn9Gf8GV
 a0IzXfubECNAUndx5Hq7XELK4tVJsU2IFeBST/G62WG5RCyXJZ3jVadPqM7G8OomtE5ASNeI
 DxzjIyXMKVkcH83zZ3jV/xYTCL2SUfjglHDCoKvpCQuLWNDM1K7Kymqs2kSFtbmpiIPmOFeI
 e+Cdna899hl6fK2fcdNIQugW7z0X41LrvS0+JibIvyv0UZXyo/tEn/are8O94jXB6bCg8UN6
 i9dhr9rVzogkad7sUdPu38QOR83jbdvWlh92PRCllDiZ6T5N33THXimhjpIF+eIqtewvNPj9
 uy8DAAA=
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
 linux-fsdevel@vger.kernel.org, jglisse@redhat.com, viro@zeniv.linux.org.uk,
 longman@redhat.com, tglx@linutronix.de, vbabka@suse.cz, melissa.srw@gmail.com,
 sj@kernel.org, tytso@mit.edu, rodrigosiqueiramelo@gmail.com,
 kernel-team@lge.com, gregkh@linuxfoundation.org, jlayton@kernel.org,
 penberg@kernel.org, minchan@kernel.org, max.byungchul.park@gmail.com,
 hannes@cmpxchg.org, tj@kernel.org, akpm@linux-foundation.org,
 torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Makes Dept able to track dependencies by waitqueue waits.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/wait.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/wait.h b/include/linux/wait.h
index a0307b516b09..ff349e609da7 100644
--- a/include/linux/wait.h
+++ b/include/linux/wait.h
@@ -7,6 +7,7 @@
 #include <linux/list.h>
 #include <linux/stddef.h>
 #include <linux/spinlock.h>
+#include <linux/dept_sdt.h>
 
 #include <asm/current.h>
 #include <uapi/linux/wait.h>
@@ -303,6 +304,7 @@ extern void init_wait_entry(struct wait_queue_entry *wq_entry, int flags);
 	struct wait_queue_entry __wq_entry;					\
 	long __ret = ret;	/* explicit shadow */				\
 										\
+	sdt_might_sleep_start(NULL);						\
 	init_wait_entry(&__wq_entry, exclusive ? WQ_FLAG_EXCLUSIVE : 0);	\
 	for (;;) {								\
 		long __int = prepare_to_wait_event(&wq_head, &__wq_entry, state);\
@@ -318,6 +320,7 @@ extern void init_wait_entry(struct wait_queue_entry *wq_entry, int flags);
 		cmd;								\
 	}									\
 	finish_wait(&wq_head, &__wq_entry);					\
+	sdt_might_sleep_end();							\
 __out:	__ret;									\
 })
 
-- 
2.17.1

