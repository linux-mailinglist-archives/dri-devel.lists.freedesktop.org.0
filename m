Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6959F85D44E
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 10:50:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB6EC10E6B9;
	Wed, 21 Feb 2024 09:50:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id B580110E6B0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 09:49:49 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-19-65d5c7392c4f
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
Subject: [PATCH v12 09/27] dept: Apply sdt_might_sleep_{start,
 end}() to waitqueue wait
Date: Wed, 21 Feb 2024 18:49:15 +0900
Message-Id: <20240221094933.36348-10-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240221094933.36348-1-byungchul@sk.com>
References: <20240221094933.36348-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSV0xTYRiG/f8zW62eVI3HEUfjxIUzn0bBO48aEw3qhcRII0fbWCppsYjR
 BGWKlgAKqBAthZQyXAUiojWACiKCVQuiAaKIg1BGkFaROlqMN1+evG/e5+pjCfk9agar1kaJ
 Oq1So6ClpLRvgnn5hvoWMTD220JIvxAI7uFkEnJvldLguFmCoLT8DIaeJ1vhjceFYLTpBQHZ
 mQ4EeR86CCiv60Rgt56l4XX3RHC6B2hoyDxPQ1z+LRpe9noxtGdlYCix7YTGNDOG6pEvJGT3
 0JCTHYd95yuGEUsxA5bYBdBlvcqA98MqaOhspcD+bilcudZOwwN7Awl1lV0YXlfl0tBZ+oeC
 xrqnJDjSjRTc6DfT0OuxEGBxDzDwqtqE4Xa8T5T47TcF9cZqDIkFdzA4395H8DD5PQZbaSsN
 j9wuDGW2TAJ+Fj5B0JXax0DChREGcs6kIjifkEXCi1/1FMS3r4PRH7n0lo3CI9cAIcSXRQt2
 j4kUnpl54d7VDkaIf/iOEUy240KZNUDIf9CDhbwhNyXYis/Rgm0ogxFS+pxY6G9uZoSnl0dJ
 oduZjXfN3C/dFC5q1AZRtzIoTKp69r2HiiySnBhMS6JjUSGTgliW59byn6pOpSDJGCYO1BB+
 prlFfFvbyBhP4ebyZcbPVAqSsgSXNJ63DjbR/mIyt4/3lP/Afg/JLeAd9rFYxq3nLz5/z/xz
 zuFLblePeSS+vCjHRflZzq3jW15WEH4nz8VJ+Px+D/VvMJ2vsbaRaUhmQuOKkVytNUQo1Zq1
 K1QxWvWJFYeORdiQ76Esp72hlWjIEVKLOBYpJshUd52inFIa9DERtYhnCcUUGRnti2ThypiT
 ou7YQd1xjaivRTNZUjFNttoTHS7njiijxKOiGCnq/reYlcyIRSZNSNj2Ym3IkSx2GvppKNBv
 uHRnanhFpCPrQP6sHWZ5kyrZsSs5eFbBksfza0KHA9G8L/cHd39fHKSa2Lm1du/04NGDAUUV
 WxTLFOP6Thtbzrpch66EXjcqKlqGvZMMbUmm2R+9a9QJsxubDy88sGZbYXdO+9Q9qzcHVfUG
 dhQmdL1SkHqVclUAodMr/wKrqYZqTAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0hTcRiH+//PdavFYQkeureKMNMMMt4woovkMejyqaIgHXVoy3lpMy9F
 YXltpqilq1xhGmvpum2GdpmY4mWapbkszUQlqtFMqaaZdplSX14enh88n16WkBupuaw6Jl7U
 xig1ClpKSneGpAasb3olBumNHOSfDwLP9ywSjHctNLTfqUBgqTyDwdUQBq9H3Qgm2l4QYChs
 R3B94B0BlY19COzmszR0vp8NTs8wDY7CbBpSy+7S0PF5EkNvUQGGCusOaM0rxVA7/pEEg4uG
 YkMq9p5PGMZN5QyYUpbDoPkKA5MDa8DR10VB/VUHBfYef7h8rZeGJ3YHCY3Vgxg6Hxlp6LP8
 oaC1sZmE9vwcCm5/KaXh86iJAJNnmIGXtSUY7qV5axnfflPQlFOLIePGfQzO7scIarL6MVgt
 XTTUe9wYbNZCAn7ebEAwmDvEQPr5cQaKz+QiyE4vIuHFryYK0nqDYeKHkd4UItS7hwkhzZYo
 2EdLSKGllBceXnnHCGk1PYxQYj0u2MwrhbInLixc/+qhBGv5OVqwfi1gBP2QEwtfnj9nhOZL
 E6Tw3mnAu+fvl244LGrUCaJ29cZIqaplzEXF3ZIkjeRl0inoJqNHEpbn1vIZw0+JKaa5Ffyb
 N+PT7MMt5m05Hyg9krIElzmTN4+00VPDHG4PP1r5A+sRy5Lccr7dPq1l3Dr+wrP+f81FfMW9
 2umOxOtvFbupKZZzwfyrjgdEHpKWoBnlyEcdkxCtVGuCA3VRquQYdVLgodhoK/L+jOnUZH41
 +t4ZVoc4FilmyVRVTlFOKRN0ydF1iGcJhY+MTPQq2WFl8glRGxuhPa4RdXVoHksqfGXb94qR
 cu6IMl6MEsU4Uft/xaxkbgoKsK/aVvfywr7Q7qOLRoZCTh70dRV05nYvXmqmLtrFnKi4rCUz
 ydJYviNk65ETk2Nt2NfVOmb7udDTk77gkmjQZGs2+PVJ/PWKMP+GZqsqPPRylTt8jzz+wLG9
 p8/mdX1Q6dOXRe4o2+V4uyUg2xKxqTA0qsJ5au0qv2Obe7rWZTYpSJ1KuWYlodUp/wIpHJes
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

