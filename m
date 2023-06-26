Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C38CA73EC81
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 23:04:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23DB410E269;
	Mon, 26 Jun 2023 21:04:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 800CC10E1EA
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 12:13:54 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-35-64997d6ceff0
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v10 10/25] dept: Apply sdt_might_sleep_{start,
 end}() to waitqueue wait
Date: Mon, 26 Jun 2023 20:56:45 +0900
Message-Id: <20230626115700.13873-11-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230626115700.13873-1-byungchul@sk.com>
References: <20230626115700.13873-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSXUyTZxTH97wfz/u22u1NBX2mqEsn2+ICK0aXs6mbu1h8srhkm9kStwtt
 6BvpLOCKosxoAEGhWAddsApkluJqhQ6k9cINShAUqKB0whjDgkrYkEllAcrsYB8tZjcnv5zz
 P7+rv8iqW/iVoiHjgGzK0Bk1WMkpQ0sdScaj5/TaX2dehLJTWgjPFnFQ1eDGEKivQ+C+ksfA
 xI3t8PPcJIL5W70s2MoDCKofDLNwpWMEgc+Vj6Fv7FnoD09h8JeXYDhe04Dhx0cLDATPWBmo
 87wP3aUOBloj4xzYJjBU2o4z0fGQgYizVgBnbiKMuioEWHiQAv6RAR58Q6/CuW+CGJp9fg46
 ro4y0PdDFYYR9788dHd0cRAos/Dw3WMHhkdzThac4SkB7rTaGbhcEBX9vuBj4MTMPzx0Wlqj
 dKGRgf5fmhC0FN1nwOMewNAenmTA6yln4a+LNxCMng4JUHgqIkBl3mkEJYVnOOj9u5OHguAm
 mH9Shbdtpu2TUywt8B6ivjk7R286CP2+YligBS1DArV7DlKvaz2taZ5gaPV0mKee2mJMPdNW
 gZpD/QwNDjRj+vj2bYF2nZ3nPkj4VLlFLxsN2bLptbf2KNP8TUf2X1IcbvlqCOWii4IZiSKR
 NpIxa4oZKRaxeLxeiDGWXiaDgxE2xnHSC8Rr+Y03I6XISjVLyHjX9cXQMukT8vCSazHESYnk
 REkfjrFKep3c/6NSeCpdS+outy5mFNF9U48DxVgtbSL5wTYckxLppILcdPq5pw/Pk2uuQa4U
 qezomVqkNmRkp+sMxo3JaTkZhsPJqZnpHhRtlfPowmdX0XRgZxuSRKRZqtKuOatX87rsrJz0
 NkREVhOnWv7Epler9LqcL2VT5m7TQaOc1YZWiZxmhWrD3CG9WtqrOyDvk+X9sun/KyMqVuai
 XapXZhVb848lrSKBuIiqeSxpJg8XZq7uWhf6KN73+V1ZrN9J38w++W31XkVx6dY1iUF7+5F3
 P173XucyU/qu7tT4sjd+em7zF5aX7rmur9VuD4my2b7j7eS7OxKKzMNecv6CtTe1Z4vV3Xje
 UvHnhz0J1/xfN87a+je8424o1DrjkzVcVpouZT1rytL9BxrIrrZRAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0hTYRjHe8/lPcfV5LC0DnYfRGFoBhoPZbcP0VtURGBBFDnaIVfTYjPT
 bpguqamVhlleykuspXbb/FDpZMxSp2XWxMzmMIvUMu02aWnZlPry58fz/Ph/+vO0opQN4TUJ
 iZIuQaVVYhkj27oyPUx78qo6wmKVQU5WBHh/nGWg6G4VhrY7lQiqqk9TMPBkA7waGUQw+uw5
 Dfl5bQhK33bTUN3gQWAzp2FwvQ+Edu8wBmdeJob08rsYXnwao8B9OZeCSssWaLlYRoHd18dA
 /gCGwvx0yh/9FPhMFRyYUhdCr7mAg7G3y8Dp6WChvtjJgq1rCVy95sZQa3My0PCglwLXoyIM
 nqpxFloamhhoy8lm4fZQGYZPIyYaTN5hDl7aSyi4Z/C3fRyzUZDx/Q8Ljdl2P924T0H76xoE
 dWd7KLBUdWCo9w5SYLXk0fDr5hMEvec/c3Amy8dB4enzCDLPXGbg+e9GFgzuKBj9WYTXRpP6
 wWGaGKxHiW2khCHNZSJ5WNDNEUNdF0dKLEeI1RxKymsHKFL6zcsSS8U5TCzfcjli/NxOEXdH
 LSZDra0caboyymybs0sWrZa0miRJt3R1rCzOWXP88K2A5LoLXSgV3eSMKIAXhUjxXN+dScbC
 IrGz00dPcJAwX7Rmf2CNSMbTQvlUsa/p8aQ0Xdgh9t8yT0qMsFDMyHThCZYLy8WeL4X/SueJ
 lffsk06A/17ztAxNsEKIEtPcDnwRyUrQlAoUpElIildptFHh+oNxKQma5PB9h+ItyD8c08mx
 nAfoh2uDAwk8Uk6TR8y9olawqiR9SrwDiTytDJLP+JmvVsjVqpRjku7QXt0RraR3oFk8o5wp
 37RTilUI+1WJ0kFJOizp/n8pPiAkFcXkfdlYGLjUUOsxlI9gxO/3bY5P61/FKMNcm7b7eEUn
 rzFef+qwzx0P3l28y9Rav0BYcyO1uH1N8LPA5nVFkc1CaNKcaHPfh9hL1SvkIebZ3p5FvsWn
 DiyeotMeiJuatSN5KEa2Z7bx/rg3w7P+UUHjlu7bJ5as/rr13fdQIuW+UTL6ONWyUFqnV/0F
 DodnXDQDAAA=
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

