Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFA18BFA13
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 12:03:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBD73113549;
	Wed,  8 May 2024 10:03:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 269A610FA58
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 10:02:56 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-38-663b4a3a04a0
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
 melissa.srw@gmail.com, hamohammed.sa@gmail.com, 42.hyeyoo@gmail.com,
 chris.p.wilson@intel.com, gwan-gyeong.mun@intel.com,
 max.byungchul.park@gmail.com, boqun.feng@gmail.com, longman@redhat.com,
 hdanton@sina.com, her0gyugyu@gmail.com
Subject: [PATCH v14 18/28] dept: Apply timeout consideration to swait
Date: Wed,  8 May 2024 18:47:15 +0900
Message-Id: <20240508094726.35754-19-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240508094726.35754-1-byungchul@sk.com>
References: <20240508094726.35754-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSe0hTcRTH+93H715Hi8sMd5uFNYhKKS2sTg8iguoSFEVBLypHXnM0LeY7
 qDTnKkszQ1emMR8tUUvdIiwfLcU32apRFmplZklOYbXV0rSt6J/Dh/M9389fhyVlFlrBqmPj
 RW2sSqPEEkrimFm8dN22dVFhmbU0XL0cBq7vFygorK7CYLtXiaDqfhoBI61b4bV7FMHE02ck
 GPJsCIo/9JNwv20AQWP5OQwvh2aB3TWOoTPvEob00moMz79OEtCXn0tApXk7dOeUEGD1fKbA
 MILhpiGd8I4vBHhMFQyYUhfCYHkBA5MflkPnwCsaGt+GwI1bfRgaGjspaKsbJODlo0IMA1XT
 NHS3dVBgu5pFw92xEgxf3SYSTK5xBl5YjQTU6Lwi/bcpGtqzrAToy2oJsL+pR9B04T0B5qpX
 GFpcowRYzHkk/LrTimAw28FAxmUPAzfTshFcysinQNe3EiZ+FuKNa4SW0XFS0FmShEa3kRK6
 SnjhYUE/I+ia3jKC0ZwgWMqDhdKGEUIodrpowVxxEQtmZy4jZDrshDDW08MIHdcnKGHIbiB2
 Kg5I1keKGnWiqA3dECGJrh5KQye/4WRDaxmdirroTMSyPBfOX7txNhP5/cWxB0+wjzG3iO/t
 9ZA+ns3N5y1Zw7SPSW5Uwpf1bPGxP7eZ1/82Mz6muIV83zk98iml3CrecS3inzKIr6yx/tX4
 eddvPo8hH8u4lXx9eoG3KvHe/GT5K7VW/K8wh39S3kvlIKkRzahAMnVsYoxKrQlfFp0Sq05e
 dvREjBl5X8l0evJgHXLadjcjjkXKmVKrfG2UjFYlxqXENCOeJZWzpa3nV0fJpJGqlFOi9sQR
 bYJGjGtGgSyllEtXuJMiZdwxVbx4XBRPitr/KcH6KVLRXkd9x9S8oIC2jw1Yv2R6j/8h/x+F
 zhXy/sXZ85uMcpOyPX5HSX5gfbdNHxo0d1I90qXYUBTY3rL/h9O9JOhU6D6m1L67Z+B8Z8Vh
 9sz06Zze5E8ft3Wr3w3f3sVq1mp+p4QpXeGVAUUBLlnHguE6T35Lul2hk2fUhuUGhmyaeqyk
 4qJVy4NJbZzqD+MpKRhGAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0hTcRjG+5/L/xxHi8MUOtWHaiCB3RRcvWS3L9VBSkqiO+SqY47mkq0s
 I0GbmrmMVHRqs7y1RC3rWGHqbDm2UslWmllMM5FM8tJtpmkXV/Tl5cfzPPw+vSypyKPnsxrd
 CVGvU2uVWEbJIsKMy9eEh0UHf24LgqyLweD9lk6BpaYag/tWFYLqu8kEDDm3wKvxYQRTT5+R
 YM51Iyh510PCXVcvAlvFOQwdA3Og0zuGoSXXhMFYVoPh+cdpAjx52QRUSdug7XIpAfbJQQrM
 QxiumI3EzPlAwKS1kgFrUiD0VxQyMP0uBFp6u2hwFLXQYHuzFAquejA02loocNX1E9BRb8HQ
 W/2bhjbXEwrcWZk03BwtxfBx3EqC1TvGwAt7MQG3U2ZsaV9/0fA4005AWvkdAjpfNyBoSu8j
 QKruwuDwDhNQK+WS8OOGE0H/pREGUi9OMnAl+RICU2oeBSkeFUxNWPDGNYJjeIwUUmpPCbbx
 YkpoLeWFB4U9jJDS9IYRiqWTQm1FkFDWOEQIJV+8tCBVXsCC9CWbETJGOglhtL2dEZ7kT1HC
 QKeZ2L5gn2ztEVGriRf1K9dHyWJqBpJR3Fd82uwsp5NQK52B/FieC+VH7z/CPsbcEr67e5L0
 cQC3iK/NfP93Q3LDMr68fbOP/blNfNpPifExxQXynnNpKAOxrJxbxY/kRP1TLuSrbtv/avxm
 4teDo8jHCk7FNxgLmctIVoxmVaIAjS4+Vq3RqlYYjsUk6DSnVxw+HiuhmW+xJk5n1aFvHVua
 Ecci5Wy5G4dFK2h1vCEhthnxLKkMkDvPr45WyI+oE86I+uMH9Se1oqEZLWAp5Vx5+G4xSsEd
 VZ8Qj4linKj/3xKs3/wkZCpIDPsRGnjPPhBRsa13YiXvGryefqNn3lmrbjq7qwjfi4vsa6xL
 3aXdsde8zHHIKFetY6XDiSGefJO79KV8/8YRJyN2601NZVmK+ri94d8jI8/WG3YfKLu2s+Ch
 a09AnmUhMvjbcuasXvZ2bkFrvkq2uGhig8nhb9na9/RTfbCSMsSoQ4JIvUH9ByryI5cpAwAA
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
consideration to swait, assuming an input 'ret' in ___swait_event()
macro is used as a timeout value.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/swait.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/swait.h b/include/linux/swait.h
index 277ac74f61c3..233acdf55e9b 100644
--- a/include/linux/swait.h
+++ b/include/linux/swait.h
@@ -162,7 +162,7 @@ extern void finish_swait(struct swait_queue_head *q, struct swait_queue *wait);
 	struct swait_queue __wait;					\
 	long __ret = ret;						\
 									\
-	sdt_might_sleep_start(NULL);					\
+	sdt_might_sleep_start_timeout(NULL, __ret);			\
 	INIT_LIST_HEAD(&__wait.task_list);				\
 	for (;;) {							\
 		long __int = prepare_to_swait_event(&wq, &__wait, state);\
-- 
2.17.1

