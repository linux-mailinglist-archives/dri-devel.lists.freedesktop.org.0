Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 922E085D45C
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 10:50:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B2C710E6C2;
	Wed, 21 Feb 2024 09:50:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 76ED210E6AF
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 09:49:48 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-c6-65d5c7380bae
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
Subject: [PATCH v12 04/27] dept: Add lock dependency tracker APIs
Date: Wed, 21 Feb 2024 18:49:10 +0900
Message-Id: <20240221094933.36348-5-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240221094933.36348-1-byungchul@sk.com>
References: <20240221094933.36348-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSe0yTZxTGfd/v2krJlyLx9TaXZsaFTQTEeTTOSWKyz8RbsrAlQuIqfIGG
 a1oBu8SIowhWMEoslUtIgdlViuJKl6njUjDcJEIZVZgiAWaGhEsXthIruK2V+M/Jk+c555eT
 k8NTyvvMRl6TeUbSZqrTVaycls+H1O6AnidSlHNsN1wriQLfP8U0VDc1suC+Y0fQ6LyAYabr
 SxhZmkOw/HiQArPJjaB28gUFzu5xBK2271kYfhkKHp+XhT7TZRYK6ptYGJpdwTBWXobB7jgK
 /VfrMLj80zSYZ1ioMhfgQHmFwW9t4MCavw2mbJUcrExGQ9/4UwZan30CFTVjLLS09tHQfW8K
 w/CDahbGG/9joL+7lwb3tVIGbi/UsTC7ZKXA6vNy8JvLguGuIQC6+Pe/DPSUujBc/OEnDJ7f
 f0XQVjyBwdH4lIWHvjkMzQ4TBW9+7EIwdWWeg8ISPwdVF64guFxYTsPg2x4GDIGbLL+uZg/u
 Ex/OeSnR0Jwnti5ZaPFRHRHvV77gREPbM060OHLEZluEWN8yg8XaRR8jOhousaJjsYwTjfMe
 LC4MDHBi741lWnzpMeMTm07K9ydL6ZpcSbvzwLfyVENgu+xX68/edOWjfGRXGpGMJ0IsudlV
 gYyIf6fbJ3cFbVbYTkZH/VRQrxM+JM2lfzJGJOcpoWgtsf31mA0GYUIcMbqn2eAsLWwjzpKk
 oK0QdpOR2T/QKn4rsd91vePIhM/Irao5JqiVgZ4nQz9TQSYRimTkgfM2Xh3YQDpso/RVpLCg
 NQ1IqcnMzVBr0mMjU/WZmrORSVkZDhR4KOu5lYR7aNH9VScSeKQKUaT+4pGUjDpXp8/oRISn
 VOsUdF7AUiSr9d9J2qxT2px0SdeJNvG0ar0iZikvWSmkqM9IaZKULWnfp5iXbcxH8fbEOx/F
 fJ3TseeStXygtq5mIX5zlv6k7+DetOiQ+S2De1xFpsLQirSUeHlEh2ZvNXP988HiiUN9iYe+
 +WB07cCW02HEy4Q9b+LjwhNj38Sd791pCf+4/fhCf5WzIC2hbMgb2/WFTH/i+Pg+m5nE9KQM
 m46cGvtUN7Gr/5j/dELLYRWtS1VHR1Banfp/xiq3vEwDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSfUzMcRzHfb+/x46z3074zcPYTWyImrLPZIbZ7jvD/OFhY8OpH916dJfI
 Y3SiU6itosIpTk/IrzyrbpceLlR0EdIUk9YRca1THu5s/vnstff783nv/ceHp1S5zCReFx0n
 6aO1kWpWQSvWhCT5Q32bFGBLnQbpqQHg+nGChrwbpSy0XC9BUFpxBENvrQZeDjoRDD9tpiA7
 swXBpa63FFTUdSKoLDzKQuuHseBw9bNgzzzJQlLBDRae9Y1g6MjKwFAir4bHZ/IxWN09NGT3
 spCbnYQ94xMGt6WYA0uiH3QX5nAw0hUI9s4XDNSctzNQ+XoOnLvQwcLDSjsNdXe7MbTez2Oh
 s/QPA4/rGmhoSU9j4NqXfBb6Bi0UWFz9HDy3mjGUGT1pyd9/M1CfZsWQfPkmBserBwiqTrzD
 IJe+YKHG5cRQLmdS8PNqLYLuU585OJbq5iD3yCkEJ49l0dD8q54BY0cwDA/lsUtDSI2znyLG
 8j2kctBMk8Z8kdzLecsRY9Vrjpjl3aS8cDYpeNiLyaUBF0Pk4hSWyAMZHDF9dmDypamJIw1n
 h2nywZGN107ZpFgcJkXq4iX9/CXbFOFGT7vYTxP3XrEmokRUojIhnheFILG6a4EJ+fCsMEts
 b3dTXvYVpovlaR8ZE1LwlHB8tFj49SnrNcYJy0RTSw/rvaUFP7EiNdQrK4Vg8WXfe+RlUZgm
 lpRZ/+X4CAvFolwn42WVZ6ft2S3qDFKY0ahi5KuLjo/S6iKD5xkiwhOidXvnhcZEycjzMpaD
 I+l30Y9WjQ0JPFKPUYbfcUgqRhtvSIiyIZGn1L5Keo9HUoZpE/ZJ+pit+t2RksGGJvO0eqJy
 5UZpm0rYqY2TIiQpVtL/dzHvMykRmQ9naefGucrWrl/yKi+hquDBeGWMfyiqSktRFS3TbMnE
 AW3fyJ/pDaN2aVYNy44rFXEHpkzYuvyQ27Zf2jCzyylrMtQf9dv9TmcERdyeUa18nrJIPVS0
 4smj5M27FrlqB7+mbDJOvRbT2L5jnf3wBNuM5l8X39S1XW8M3Hh6YCgk552aNoRrA2dTeoP2
 L3nMtLYuAwAA
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

