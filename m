Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1F373EC6B
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 23:03:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 981D010E1DF;
	Mon, 26 Jun 2023 21:03:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id DF5D610E1EA
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 12:13:53 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-c8-64997d6b8990
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v10 04/25] dept: Add lock dependency tracker APIs
Date: Mon, 26 Jun 2023 20:56:39 +0900
Message-Id: <20230626115700.13873-5-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230626115700.13873-1-byungchul@sk.com>
References: <20230626115700.13873-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0xTZxjHfc/lPaeV6knH5IhGXRMz1MDQeHkSL9Ho4vtFY+JijM5oZ89G
 BYppFcFoUqGaWsABykVLTC1aCcVbYRsCdRUEQSaXSSpKS4R4oUolQYsieCkYvzz5Jf//88vz
 4eFp5b9sNK/VHZD0OnWSCssZeTDCHpt49Kwm3uKPg7zseAi9NTNQcq0CQ8dVJ4KKqmMUBBo3
 wsORQQRj99tpKCroQHChz09DVVMvAndZBoYHT6dBV2gIQ0tBFobM0msYOl+NU+ArzKfA6doE
 rbl2CjyjLxgoCmCwFmVS4TFAwaijnAOHcT70l53jYLxvMbT0ellwP14EZ8/7MNS5Wxhoqu6n
 4EFNCYbeis8stDY1M9CRl8PCldd2DK9GHDQ4QkMc/O+xUXDdFBa9HHdTcOLNJxbu5njCdPEG
 BV2PahHcMj+hwFXhxdAQGqSg0lVAw4fLjQj6TwU5OJ49yoH12CkEWccLGWj/eJcFk28ZjL0v
 wWtXkobBIZqYKg8R94iNIffsIrl5zs8R063HHLG5DpLKsoWktC5AkQvDIZa4yk9i4hrO54gl
 2EURn7cOk9dtbRxpLh5jtszeIV+lkZK0qZL+pzV75Amm8HX7B6LSLnmMyIicSguS8aKwVOzJ
 O818Y7P/PD3BWPhR7O4eneRIYZ5YmfOctSA5TwulU8UXzXe4ieA7YZ3Y422YZEaYL973/hUW
 8bxCWCZmB1Z/dc4Vndc9kx6ZsFys/c+OJlgZrmT46vGEUxSyZKJjoJb+ujBTvF3WzeQihQ1N
 KUdKrS41Wa1NWhqXkK7TpsXtTUl2ofBbOY6O76xGwx1b65HAI1WEIn5OsUbJqlMN6cn1SORp
 VaRixvsijVKhUacflvQpu/UHkyRDPZrFM6ooxZKRQxql8If6gJQoSfsl/beU4mXRRoQiY/p3
 vkx2/Ba1qw3P/TWmyhK7O5jovLnNaqpZsS96w7yM3yOarI0xueZsa/GUjYObV3Rfrf1THd1q
 MKdd2nDGNuPi9sOLin9YV3O7Mz3zSFDWXt284J/pP1tzdVH5M6fJxfWFz4wkEPxlpT+2J9LK
 3ev8nHBjQd9ex9/fp7z7dKZliYoxJKgXL6T1BvUX5oVgh1IDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0hTcRjG+5/L/xxXs8NmerCLMZJAyexivVJZ0YdOQRL0IehDdWiHHN5i
 K3OVNHWFmUZKc1ZmOmuJrrJpYOlieF9aWpN1m1IS1cqSLluZdplGXx5+8Lz8eD88LKmopiNZ
 TcZBSZshpqmwjJIlr8lfkppzXh1vsSmhpCge/N8KKKi4acMwcKMega0plwBf52Z4EhhFMPGg
 nwSzaQBB9ashEpq6hhE4avMwuF+HwqB/DIPLdBpDfs1NDI8+TBLgLSsloN6+DXrPWghwjr+l
 wOzDcNGcTwTjHQHj1joGrIZoGKm9wMDkq2XgGvbQ0H7JRYPjeSycr/RiaHW4KOhqHiHAfbcC
 w7DtDw29XT0UDJQU03D9kwXDh4CVBKt/jIHHzioCGoxB2/tJBwEnv/6mobvYGaQrtwgYfNaC
 4F7BSwLsNg+Gdv8oAY12Ewk/r3UiGDnzkYETReMMXMw9g+D0iTIK+n9102D0JsDEjwq8Ya3Q
 PjpGCsbGw4IjUEUJ9y28cOfCECMY7z1nhCr7IaGxNkaoafURQvUXPy3Y605hwf6llBEKPw4S
 gtfTioVPDx8yQk/5BLV9/i7ZWrWUpsmStEuT9spSjMHvDryLyL7qNCADqlcUohCW51byBUOV
 5BRjbjH/9On4NIdxC/nG4jd0IZKxJFczk3/b08FMFUpuI//C0z7NFBfNP/DcpgoRy8q5BL7I
 t+6fM4qvb3BOe0K4VXxLnwVNsSJ4kudtw2eRrArNqENhmoysdFGTlhCnS03RZ2iy4/ZlpttR
 cDjWnMmSZvTNvbkNcSxSzZLHLyhXK2gxS6dPb0M8S6rC5OE/zGqFXC3qj0jazD3aQ2mSrg3N
 ZSlVhHzrTmmvgtsvHpRSJemApP3fEmxIpAFVz98t9eXnWsUdSeETWXm2RGPH0dW3O22Lw719
 s/p9XatD7yqPR/UpyYJHYTGfx+40+5dnig5F2ewVI5c3HTM3aCO2JSVWph81FUV9b1L2l5qu
 17gPm0K66UDn7Dnu0NSc0eRywznqdbZjy/rE6N7SQOR+vMj3xrWxR/9yXuxlvYrSpYjLYkit
 TvwLwSrfujQDAAA=
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 26 Jun 2023 21:03:34 +0000
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
 linux-fsdevel@vger.kernel.org, jglisse@redhat.com, paolo.valente@linaro.org,
 viro@zeniv.linux.org.uk, longman@redhat.com, tglx@linutronix.de,
 vbabka@suse.cz, melissa.srw@gmail.com, sj@kernel.org, tytso@mit.edu,
 rodrigosiqueiramelo@gmail.com, kernel-team@lge.com, gregkh@linuxfoundation.org,
 jlayton@kernel.org, penberg@kernel.org, minchan@kernel.org,
 max.byungchul.park@gmail.com, hannes@cmpxchg.org, tj@kernel.org,
 akpm@linux-foundation.org, torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Wrapped the base APIs for easier annotation on typical lock.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/dept_ldt.h | 77 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 include/linux/dept_ldt.h

diff --git a/include/linux/dept_ldt.h b/include/linux/dept_ldt.h
new file mode 100644
index 000000000000..062613e89fc3
--- /dev/null
+++ b/include/linux/dept_ldt.h
@@ -0,0 +1,77 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Lock Dependency Tracker
+ *
+ * Started by Byungchul Park <max.byungchul.park@gmail.com>:
+ *
+ *  Copyright (c) 2020 LG Electronics, Inc., Byungchul Park
+ */
+
+#ifndef __LINUX_DEPT_LDT_H
+#define __LINUX_DEPT_LDT_H
+
+#include <linux/dept.h>
+
+#ifdef CONFIG_DEPT
+#define LDT_EVT_L			1UL
+#define LDT_EVT_R			2UL
+#define LDT_EVT_W			1UL
+#define LDT_EVT_RW			(LDT_EVT_R | LDT_EVT_W)
+#define LDT_EVT_ALL			(LDT_EVT_L | LDT_EVT_RW)
+
+#define ldt_init(m, k, su, n)		dept_map_init(m, k, su, n)
+#define ldt_lock(m, sl, t, n, i)					\
+	do {								\
+		if (n)							\
+			dept_ecxt_enter_nokeep(m);			\
+		else if (t)						\
+			dept_ecxt_enter(m, LDT_EVT_L, i, "trylock", "unlock", sl);\
+		else {							\
+			dept_wait(m, LDT_EVT_L, i, "lock", sl);		\
+			dept_ecxt_enter(m, LDT_EVT_L, i, "lock", "unlock", sl);\
+		}							\
+	} while (0)
+
+#define ldt_rlock(m, sl, t, n, i, q)					\
+	do {								\
+		if (n)							\
+			dept_ecxt_enter_nokeep(m);			\
+		else if (t)						\
+			dept_ecxt_enter(m, LDT_EVT_R, i, "read_trylock", "read_unlock", sl);\
+		else {							\
+			dept_wait(m, q ? LDT_EVT_RW : LDT_EVT_W, i, "read_lock", sl);\
+			dept_ecxt_enter(m, LDT_EVT_R, i, "read_lock", "read_unlock", sl);\
+		}							\
+	} while (0)
+
+#define ldt_wlock(m, sl, t, n, i)					\
+	do {								\
+		if (n)							\
+			dept_ecxt_enter_nokeep(m);			\
+		else if (t)						\
+			dept_ecxt_enter(m, LDT_EVT_W, i, "write_trylock", "write_unlock", sl);\
+		else {							\
+			dept_wait(m, LDT_EVT_RW, i, "write_lock", sl);	\
+			dept_ecxt_enter(m, LDT_EVT_W, i, "write_lock", "write_unlock", sl);\
+		}							\
+	} while (0)
+
+#define ldt_unlock(m, i)		dept_ecxt_exit(m, LDT_EVT_ALL, i)
+
+#define ldt_downgrade(m, i)						\
+	do {								\
+		if (dept_ecxt_holding(m, LDT_EVT_W))			\
+			dept_map_ecxt_modify(m, LDT_EVT_W, NULL, LDT_EVT_R, i, "downgrade", "read_unlock", -1);\
+	} while (0)
+
+#define ldt_set_class(m, n, k, sl, i)	dept_map_ecxt_modify(m, LDT_EVT_ALL, k, 0UL, i, "lock_set_class", "(any)unlock", sl)
+#else /* !CONFIG_DEPT */
+#define ldt_init(m, k, su, n)		do { (void)(k); } while (0)
+#define ldt_lock(m, sl, t, n, i)	do { } while (0)
+#define ldt_rlock(m, sl, t, n, i, q)	do { } while (0)
+#define ldt_wlock(m, sl, t, n, i)	do { } while (0)
+#define ldt_unlock(m, i)		do { } while (0)
+#define ldt_downgrade(m, i)		do { } while (0)
+#define ldt_set_class(m, n, k, sl, i)	do { } while (0)
+#endif
+#endif /* __LINUX_DEPT_LDT_H */
-- 
2.17.1

