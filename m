Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A32F83A957
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 13:15:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFAC510E100;
	Wed, 24 Jan 2024 12:15:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4695C10F724
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 12:15:10 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-d5-65b0fbb5c9e5
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v11 09/26] dept: Apply sdt_might_sleep_{start,
 end}() to waitqueue wait
Date: Wed, 24 Jan 2024 20:59:20 +0900
Message-Id: <20240124115938.80132-10-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240124115938.80132-1-byungchul@sk.com>
References: <20240124115938.80132-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSfUzMcRzHfX/Pd5z9HOpHRrtpNs8PsQ/Lw9D6arMxmz/4g5t+000d7ipi
 LDrFXVG2RFp64Dp3x+UKSdcSRVEdFed2hdbQlNpxcS4PFf757L3X5/15/fXhSHkVPZ1TqRNE
 jVoZp2CklLR/QtGCO4EycXGeFUF2xmLwfT1NQb7NyoDzpgWBteIEAb31UfBqqA9BoLmVhNwc
 J4Kid50kVDR0IXCYTjLQ1jMR2n0DDDTmGBhILbEx8PzTMAGeC+cJsNg3w9OsYgJq/R8oyO1l
 4HJuKjEyPhLgN5pZMKaEQbcpj4Xhd0ugseslDQ73PLhU4GGg2tFIQUNlNwFtVfkMdFl/0/C0
 4QkFzuxMGm58Lmbg05CRBKNvgIUXtYUElOlGRGlfftHwOLOWgLSrtwhof30fQc3ptwTYrS8Z
 eOjrI6DcnkPCj9J6BN1n+1k4leFn4fKJswgMpy5Q0PrzMQ06z3IIfM9n1q3CD/sGSKwrP4Qd
 Q4UUbioW8L28ThbratwsLrQn4nLTXFxS3UvgIq+PxnbzGQbbvedZrO9vJ/DnlhYWP7kYoHBP
 ey6xJWSHNCJGjFMliZpFa3ZLY5u+9dIHrksOD2alMymolNUjCSfw4cLzQQv6n29fuzvGGX6O
 4HL5ydE8hQ8VyjPf03ok5Ug+fbxgGmxm9IjjJvPbBVv/kdEOxYcJFb+LxvoyfoXQ05zyzzlL
 sJTVjnHJCL9xyU2NZjm/XHhrPseOOgU+VSIEvDX034NpwgOTi8pCskI0zozkKnVSvFIVF74w
 NlmtOrxwz/54Oxr5KOOx4Z2VyOvcVod4DikmyNaZbaKcViZpk+PrkMCRiiky17SbolwWo0w+
 Imr279IkxonaOhTCUYpg2dKhQzFyfq8yQdwnigdEzf8twUmmp6Bl3jubGx0J0VEa94OI4HjD
 lu2bBFlJYuSMyTgjP+LKpqCgZ3U7PEm6lYbW7h/Q4WZnZFZpU6nOqdkhEQdnzo+snr3WmVdg
 7kgzHvcssBi2aiKPbWhZ7QpVKydFha98ZDtaX7nCmhYarQsKLkisKNP9anI2bfRfT08o0K+n
 HmW9UVDaWOWSuaRGq/wDP4BQpk0DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSfUzMcRzH+/6e7zh+TubnYbTbqi0cNvHZMuMv3zWZvzz+oaMf3aord4na
 ylFcIu6anIfYVVznSl1XrcJR14qrpeiWtEStIUoNFz14qMw/7732fr/3/uvNkfI8eimn1iSK
 Wo0qVsFIKenOsPQ1VZMOcV3RmWAwXVwHvu+ZFOSVlTDQXlqMoKTyNAGDjdvh1dgQgsnWNhLM
 ue0I8vvekFDZ1IvAZTvDQMfAPPD6Rhjw5F5gIL2wjIEXn6cI6LmaQ0CxMwJajAUE1I1/oMA8
 yMBNczoxLR8JGLfaWbDqA6HfdoOFqb714OntpKHhlocGV/cquH67h4FHLg8FTTX9BHQ8yGOg
 t+QPDS1NzyhoN2XTcP9LAQOfx6wkWH0jLLyssxDgyJheO/ftNw1Ps+sIOHennADv64cIHme+
 I8BZ0slAg2+IgApnLgkTRY0I+i8Ns3D24jgLN09fQnDh7FUK2n49pSGjJxQmf+YxW8Nww9AI
 iTMqTmDXmIXCzQUCrr3xhsUZj7tZbHEexxW2EFz4aJDA+V99NHbazzPY+TWHxVnDXgJ/ef6c
 xc+uTVJ4wGsmdi3fL90cJcaqk0Tt2i2R0ujmH4N0wj3JyVGjgdGjIjYLSTiB3yBU3a2eZYYP
 Frq6xskZ9ucDhIrs93QWknIkb5gj2EZbmSzEcQv53ULZcMpMh+IDhco/+bN9Gb9RGGjVo3+b
 K4ViR92sL5n271/vpmZYzocK7+yXWSOSWpCfHfmrNUlxKnVsqFIXE52sUZ9UHo6Pc6Lpz1hT
 p0w16HvHdjfiOaSYK9tqLxPltCpJlxznRgJHKvxlXUtKRbksSpWcImrjD2qPx4o6N1rGUYrF
 svA9YqScP6pKFGNEMUHU/k8JTrJUj+IXWtIKjR7HsN/UarOpyb1v0amAzreZQfV7t3ziEkrD
 fxmC9POueHGva9sOidJYU2+N6I8IOLCgRag/5ppQSqgnfocu15bbX6fq0245gpXNt53UNzHu
 yO98X1uYzXWiOTpnLHK3JtySeM+0YiIoYP4m/5cG2adQg2du40C1u1tB6aJV60NIrU71F0/v
 DPAvAwAA
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
index 3473b663176f..ebeb4678859f 100644
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

