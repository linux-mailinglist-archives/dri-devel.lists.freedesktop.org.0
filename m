Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D9483A951
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 13:15:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E6B10F72E;
	Wed, 24 Jan 2024 12:15:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id AA90C10F728
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 12:15:09 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-71-65b0fbb43154
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v11 03/26] dept: Add single event dependency tracker APIs
Date: Wed, 24 Jan 2024 20:59:14 +0900
Message-Id: <20240124115938.80132-4-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240124115938.80132-1-byungchul@sk.com>
References: <20240124115938.80132-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0iTYRTHe573ti1XL0vyLYtkEEGZmVgdIiqC6KkIKqEPSZeVLzqaU6Zp
 iwRLs7yVBroysamxxrzPgpoaXtjSQrNcaqKSYpk4L2hbmXaZRl8OP875nf/5ciSUwsaslai1
 8aJOq9IoWRktm/Ap3vpsvloMdg1JITcrGNzfbtNQWFXOQmdlGYLyp9cxjNkPQY/HhWC+/S0F
 hrxOBMVDAxQ8dQwiaDDfYKFrZAU43VMstOVlspBSWsXCu/EFDP359zCUWY/Bm5wSDI1zozQY
 xlh4aEjB3vIVw5zJwoEpeSMMmws4WBjaDm2D3Qw09G2BB0X9LNQ3tNHgeD6MoctWyMJg+R8G
 3jhaaejMzWagYrKEhXGPiQKTe4qD941GDNWp3qC02d8MvMpuxJD2uAaD82Mdgpe3P2Gwlnez
 0OJ2Yai15lHw84kdwfCdCQ5uZs1x8PD6HQSZN/NpePvrFQOp/Ttg/kchu383aXFNUSS1NpE0
 eIw0eV0ikBcFAxxJfdnHEaP1Mqk1byal9WOYFM+4GWK1pLPEOnOPIxkTTkwmOzo40np/niYj
 TgM+7n9atidC1KgTRN22vedlUc05BUxsj98Vj2FDMnIqMpBUIvChwvCHu9x/rv89wS4yy28S
 envnqEX25QOE2uwvTAaSSSj+1nLBPN2+JK3iDwuZz+qWJJrfKIwO2ulFlvM7hNnWFvpf6Aah
 rLpxyZHyO4WKB31LfYXX+WRZPCzzOilS4c/INP63sEZoMvfSOUhuRMssSKHWJkSr1JrQoCi9
 Vn0l6GJMtBV5P8qUtBD+HM10hjUjXoKUPvL9lipRwagS4vTRzUiQUEpfee+aSlEhj1Dpr4q6
 mHO6yxoxrhn5S2ilnzzEkxih4CNV8eIlUYwVdf+nWCJdm4xiWwKxvrToiFkesmu6yWZffynv
 fVGMNCv9YHsSk3I0NzQkoGd1JOOnGfXxjyTXaBff9LmGGNmwC4/TElfyZ/uPxwcEVdiujR/K
 PqMVpAdWBH6PyO+JP1Y2dSrNFriupsvRXZd4MD0yuE/fvXK9R1az78TopvB6VV2S4+RJ+6MB
 JR0Xpdq+mdLFqf4CNNKfuk0DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSWUhUYRiG+886Tk0dJqOTrQ6KkGUGGR/a4kXQX9ByZRBFTnnQybWZGp02
 NW1zSw2bXBKzGIdR045GixqmuOeWU5mNK5JZLqHOkGmZGt28PHzfw3v1Skh5Fu0gUYWcF9Qh
 yiAFI6Wkh71itpbOFAvud0fdICXBHaxTtyjIKipgoO1JPoKC0mgChmv2w0fbCIKZ5lYS9Glt
 CB72d5NQWtuDoMJ4jYGOweVgto4z0JAWz0DMoyIG2r/PEmC5l0pAvngImpJzCaicHqJAP8xA
 pj6GmI+vBEwbTCwYopxhwJjBwmz/dmjo+UBD9YMGGiq6XCE928JAeUUDBbUvBgjoeJXFQE/B
 HA1NtfUUtKUk0lA4lsvAd5uBBIN1nIV3lTkEFMfOt92Y/ENDXWIlATcePyXA/KkMwetbfQSI
 BR8YqLaOEFAippHwK68GwUDSKAvXE6ZZyIxOQhB//R4Frb/raIi1eMDMzyzG2wtXj4yTOLYk
 HFfYcijcmMvjlxndLI593cXiHPECLjFuxo/Khwn8cMJKY9F0m8HiRCqL40bNBB5raWFx/f0Z
 Cg+a9cTRdcelu/yEIJVWUG/b4ysNqErOoMM+ro6w6TdGIbM8DtlJeG4HX/5nlFlghnPhOzun
 yQW25zbxJYlf6DgklZDczaW88UfzorSSO8DHPytblCjOmR/qqaEWWMZ58JP11dS/0o18fnHl
 omPH7eQL07sW7/J5p890h01G0hy0xITsVSHaYKUqyMNNExigC1FFuJ0JDRbR/GYMV2ZTXqCp
 jv1ViJMgxTKZt6lIkNNKrUYXXIV4Camwl3WueSLIZX5K3UVBHXpKfSFI0FShtRJKsVp28Jjg
 K+f8leeFQEEIE9T/v4TEziEK1a2dsiXoLP0vM70dI+d88pyHJp97HmnyTNW+r0/TOn0Kd9r0
 5YTqhNkyHDbnKd1b6rre0rt7n9jSN3D57WCvasXTn65J7/1dzjXiduO3lFVnl1xNXxejaP18
 2N/RY+vEteiavuwt1pUbxNnOSFJ6uSz7tAzCfXyYNwC1l/q7dScVlCZAuX0zqdYo/wK06lAC
 LwMAAA==
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

Wrapped the base APIs for easier annotation on wait and event. Start
with supporting waiters on each single event. More general support for
multiple events is a future work. Do more when the need arises.

How to annotate (the simplest way):

1. Initaialize a map for the interesting wait.

   /*
    * Recommand to place along with the wait instance.
    */
   struct dept_map my_wait;

   /*
    * Recommand to place in the initialization code.
    */
   sdt_map_init(&my_wait);

2. Place the following at the wait code.

   sdt_wait(&my_wait);

3. Place the following at the event code.

   sdt_event(&my_wait);

That's it!

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/dept_sdt.h | 62 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 include/linux/dept_sdt.h

diff --git a/include/linux/dept_sdt.h b/include/linux/dept_sdt.h
new file mode 100644
index 000000000000..12a793b90c7e
--- /dev/null
+++ b/include/linux/dept_sdt.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Single-event Dependency Tracker
+ *
+ * Started by Byungchul Park <max.byungchul.park@gmail.com>:
+ *
+ *  Copyright (c) 2020 LG Electronics, Inc., Byungchul Park
+ */
+
+#ifndef __LINUX_DEPT_SDT_H
+#define __LINUX_DEPT_SDT_H
+
+#include <linux/kernel.h>
+#include <linux/dept.h>
+
+#ifdef CONFIG_DEPT
+#define sdt_map_init(m)							\
+	do {								\
+		static struct dept_key __key;				\
+		dept_map_init(m, &__key, 0, #m);			\
+	} while (0)
+
+#define sdt_map_init_key(m, k)		dept_map_init(m, k, 0, #m)
+
+#define sdt_wait(m)							\
+	do {								\
+		dept_request_event(m);					\
+		dept_wait(m, 1UL, _THIS_IP_, __func__, 0);		\
+	} while (0)
+
+/*
+ * sdt_might_sleep() and its family will be committed in __schedule()
+ * when it actually gets to __schedule(). Both dept_request_event() and
+ * dept_wait() will be performed on the commit.
+ */
+
+/*
+ * Use the code location as the class key if an explicit map is not used.
+ */
+#define sdt_might_sleep_start(m)					\
+	do {								\
+		struct dept_map *__m = m;				\
+		static struct dept_key __key;				\
+		dept_stage_wait(__m, __m ? NULL : &__key, _THIS_IP_, __func__);\
+	} while (0)
+
+#define sdt_might_sleep_end()		dept_clean_stage()
+
+#define sdt_ecxt_enter(m)		dept_ecxt_enter(m, 1UL, _THIS_IP_, "start", "event", 0)
+#define sdt_event(m)			dept_event(m, 1UL, _THIS_IP_, __func__)
+#define sdt_ecxt_exit(m)		dept_ecxt_exit(m, 1UL, _THIS_IP_)
+#else /* !CONFIG_DEPT */
+#define sdt_map_init(m)			do { } while (0)
+#define sdt_map_init_key(m, k)		do { (void)(k); } while (0)
+#define sdt_wait(m)			do { } while (0)
+#define sdt_might_sleep_start(m)	do { } while (0)
+#define sdt_might_sleep_end()		do { } while (0)
+#define sdt_ecxt_enter(m)		do { } while (0)
+#define sdt_event(m)			do { } while (0)
+#define sdt_ecxt_exit(m)		do { } while (0)
+#endif
+#endif /* __LINUX_DEPT_SDT_H */
-- 
2.17.1

