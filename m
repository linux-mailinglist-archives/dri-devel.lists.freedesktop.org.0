Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1FCABB874
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 11:18:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E9910E286;
	Mon, 19 May 2025 09:18:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id E3A5110E23E
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 09:18:44 +0000 (UTC)
X-AuditID: a67dfc5b-681ff7000002311f-c5-682af76e4861
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
Subject: [PATCH v16 15/42] dept: apply sdt_might_sleep_{start,
 end}() to waitqueue wait
Date: Mon, 19 May 2025 18:17:59 +0900
Message-Id: <20250519091826.19752-16-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250519091826.19752-1-byungchul@sk.com>
References: <20250519091826.19752-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0yTZxSAfd/v2mK3L1XnNyXRdBoVFcWgO1nQkZlsry5OkUQT/aGNfLGN
 pbJWkc6QgAJxMJjTAFEutrDV2latLYl4KakQOxhRsdSChIsSR2RycYxWUbwUnH9OnpzLc86P
 w1NKPzOP1+oPSQa9Wqdi5bR8eKZlpf5FnGZ1fv0KCI+foKHyspOFtksOBM66XAyDt7+DjsgQ
 gtd37lFQXtqGwPK4h4I6fy8Cr+0YC+1PPoFgeJSFltIiFo7XXmbh/rNJDN1lpzA43FugzzpA
 Q+vJGgzlgyxUlB/H0fAUw4TVzoE1ZzH0285yMPk4AVp6Qwx4u5bDmepuFm56W2jw1/djaL9e
 yUKv8x0Drf5mGiIl86Htt2IGLo7UsPAsYqXAGh7lIOAzY/CbPwNXXlRY8N9bBv4s9mEo+P0K
 huDDGwgaTjzC4HaGWGgKD2HwuEspeHX+NoL+kmEO8n+Z4KAitwRBUX4ZDXnda+H1y+jmqvEE
 yD3nouHimxBKXk+c1U5EmoZGKZLnOUJehR+wxBsx0+SvGpFcO9vDkbyGLo6Y3YeJxxZHam8O
 YmIZCzPEbf+ZJe6xUxwpHA5iMnL3Lrctdpc8KU3SaTMlw6oNe+Wahp60jBJZ1pA/QOWgYq4Q
 yXhRSBSDj66ij+w68wc1xaywROzsnJjm2cJC0VM8wBQiOU8JoRixo+rh9MAsYYfY/tRHTzEt
 LBY7Ry9Em3heIawT6+zxH5wLRIfLN+2RRdNdRU3To0phrRh0VNNTTlE4LRMDvtD/R3wu3rJ1
 0ieRwoxm2JFSq89MV2t1ifEak16bFb/vYLobRb/Lmj25ux6NtaU2IoFHqpkKl3eZRsmoM42m
 9EYk8pRqtsLuWapRKtLUpp8kw8E9hsM6ydiI5vO0aq5iTeRImlLYrz4kHZCkDMnwsYp52bwc
 tEl39asf+57LkjvCX8dyiwJZ+dqCNaWLyLckJsb198I5hSnoyaftqdjYzeAvfsjeak7ZzHr7
 Ng0kJrc6mn1Jq9bNmPWvL2lvmWXjS9XcPQf+MSkzuPGt/bHfbOxaZuVqX6QsaM5ekYoSKmyn
 A3KsybpiqTSNfPm9rGH7Pubozl+rVLRRo06IowxG9XttCfiSWQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSe0hTcRTH+923q8VtWl2syAb2sPJRGieKnkS3QosIhUhq5aWN5orNLINA
 08TUSQlz9NDma825am3SyybD4cwss7ZMxVlJRJIl2Lay7DGN/jl8ON9zPuefw+ASExnJKFRZ
 glolU0opESFKWZe/UvUtRh7/pnM2BPxFBFy7baGg+1YjAktTHgbDbdvhdXAEwc9nz3HQ67oR
 VL/z4dDkHkTgMJ2jwPN+JngDoxR06EooyK+9TcGLTxMYDFSUY9BoS4Y3xg8EdF6swUA/TMFV
 fT4WKh8xGDeaaTDmRsOQ6QoNE+8SoGOwhwRXZQcJjv7lcLlqgIJHjg4C3PeHMPA8vEbBoOUP
 CZ3uxwQEy+ZB9yUtCTe/1FDwKWjEwRgYpeGl04CB2zAHrAUha+HX3yS0a50YFNbdwcDb14yg
 pegtBjZLDwWuwAgGdpsOhx832hAMlX2m4XzpOA1X88oQlJyvIKBgIAl+fg9drvQnQN51KwE3
 f/WgTRt4S5UF8a6RUZwvsJ/ifwReUbwjaCD4JzUc/+CKj+YLWvpp3mA7ydtNMXzto2GMrx4L
 kLzNfIHibWPlNF/82YvxX7q66D0L9ovWZwhKRbagjttwSCRv8WWcKAs7PeJ+ieciLV2MwhiO
 TeSsl+vxSabYJVxv7/gUR7BRnF37gSxGIgZne6Zzryv70GQQzqZyno9OYpIJNprrHW0IDTGM
 mF3DNZlj/zkXco1W55QnLNTuL3FNrUrYJM7bWEVcRCIDmmZGEQpVdqZMoUyK1RyT56gUp2OP
 HM+0odD/GM9OXLqP/J7trYhlkHSG2OpYJpeQsmxNTmYr4hhcGiE225fKJeIMWc4ZQX38oPqk
 UtC0onkMIZ0r3pkmHJKwR2VZwjFBOCGo/6cYExaZi6Lewi6dUpteFNcu949nn4t3Dexe/j3N
 qVAcjW+O3n24q35Vije/QhVF1a7cWxiZfsArvZuFGpJ18zcvS6tPTr3nW/urdPrdxYGHqat9
 iTn7oG5HW+rG8qyipx69xmx6sQ3fsmNW/1Z9ZPOimoanEkliur96rO966au4GcHwTSvipIRG
 LkuIwdUa2V860ChtOwMAAA==
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

