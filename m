Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EDC782227
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 06:05:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45BF510E189;
	Mon, 21 Aug 2023 04:05:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 249A410E189
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 04:04:59 +0000 (UTC)
X-AuditID: a67dfc5b-d6dff70000001748-7c-64e2ded5515b
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v10 09/25] dept: Apply sdt_might_sleep_{start,
 end}() to swait
Date: Mon, 21 Aug 2023 12:46:21 +0900
Message-Id: <20230821034637.34630-10-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230821034637.34630-1-byungchul@sk.com>
References: <20230821034637.34630-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSbUxTZxTHfe597gtXa66dmc/EOG1iTFhkanw52YYxmdEn2TQmmzHqB71b
 r6NaQMubLFmCUsAp+MKCqIApoLWBKtLqVsBiRQHRAHVFBIZMKlGJRTZcGZVOV3z5cvLLOf/z
 +/QXWW0tN1s0JKaopkTFqOMlLA1PK1t0r9+vX9zQFwvH8xZD8J+DGEqq7Tx4L1YhsF/ez8BQ
 0zq4PxZAMNHWwUJRoRdB2cADFi439yNw2w7w4BucDp3BER5aCw/zkFVRzcPdZ2EG+k4UMFDl
 WA93jpUz4Ak9wVA0xENxURYTGU8ZCFkrBbBmLgC/7bQA4YEl0NrfxYG79xM4daaPh6vuVgzN
 Lj8DvroSHvrtrzm403wLg/d4PgcXnpfz8GzMyoI1OCLA7x4LA5fMEVHOi1cctOR7GMg5W8NA
 Z089goaDDxlw2Lt4uBEMMOB0FLLw8nwTAv+RYQGy80ICFO8/guBw9gkMHf+1cGDuWw4T4yX8
 6s/ojcAIS83OdOoes2B6u5zQ2tMPBGpu6BWoxZFKnbYYWnF1iKFlo0GOOip/5qljtECgh4Y7
 Gfq8vV2gt05OYDrYWcRsjN4qfaFXjYY01fTpqh1SfHueV9jTLO77zd3LZaIO/hCKEom8jNQ2
 XePes9n8JzvJvLyQdHeH3vBMeR5x5j+OZCSRlXOnEttfbZFnUfxA/pa4Tq2fzGB5AfHV9OBJ
 1sgrSN3r4nf+j0nVJc8bT1Rk76ivQ5OslZeTvwce4beZo1HE5frqLX9Ertu68TGksaAplUhr
 SExLUAzGZbHxGYmGfbHfJyU4UKRQ1p/C21xo1PtNI5JFpJum2THHr9dySlpyRkIjIiKrm6mJ
 /ndAr9XolYwfVVPSdlOqUU1uRNEi1s3SLB1L12vlH5QUdbeq7lFN76+MGDU7E+1uqc7ntqzN
 Ls0t2XnAGyc9DOz88o+aXeUxF0M1K9p+yZZW4rlpcbn1cVM2bLq7d+N3gSuDbQ0ZBRNnw75V
 53S5SZasr+d5zWt+JbtSnefCI+MEBz8fv/IofQY7v0y5+Vh5hbevvfBhxyLRZ9/cJSWtHO/J
 MXpQhURKU5aytK5dh5PjlSUxrClZ+R8RW41iTAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSbUxTZxTHfZ77SqXmpqDcgEZXY0ycr5HqSVRiYgiPJk4TTRb94OjWq20s
 L2mViVEDUhB5i5gACmgQXUVgChfNEClpIIBVgSrMASvV1kZF0SpSFEGxmO3LyS//c/6/T4en
 VOVMJG9IPCSZErVGNaugFT9tyFjxt9urW91yMgIK81ZDYCybhvIbtSw4r9cgqL2ZjmG4PQ7+
 GR9BMNnVQ0FJkRPBJc8QBTc73AhsVSdZ6PXNgb6AnwVHUS4LGZdvsPDw9RQGV/FZDDXydrh/
 phKDfeIFDSXDLJSVZODgeIlhwlrNgTVtCXirSjmY8qwBh/sxA20XHAzYBn+E8xddLDTbHDR0
 NHox9DaVs+CunWbgfsddGpyF+Qz8+baShdfjVgqsAT8Hj+wVGOosQVvWh68MdObbMWRdqcfQ
 N3AHQUv2Uwxy7WMW2gIjGBrkIgo+X21H4C14w0Fm3gQHZekFCHIzi2no+dLJgMWlgclP5ezm
 DaRtxE8RS8PvxDZeQZN7lSK5XTrEEUvLIEcq5MOkoWoZudw8jMml0QBD5OrTLJFHz3Ik500f
 Jm+7uzly99wkTXx9JXjn/L2KjTrJaEiRTKti4hX67jwnl9zBH/nLNsikoR42B4XwohAtWixP
 qBlmhaVif//Edw4XFokN+c+ZHKTgKeHUbLHqXVewwPNhwm6x8fz2mRtaWCL21g/QM6wU1olN
 02X/OReKNXX2756QYC7faUIzrBI04nvPM/oMUlSgWdUo3JCYkqA1GDUrzQf1qYmGIyt/S0qQ
 UfBnrMenChvRWG9cKxJ4pA5Vxs/36lSMNsWcmtCKRJ5ShyujPnp0KqVOm3pUMiX9YjpslMyt
 KIqn1RHKbT9L8SrhgPaQdFCSkiXT/1vMh0SmIeHWg6vpxWH79p/yy5YF7T3O9OVtsTGaW6/m
 7TDpY/Sx5A9j67nIop2fOyV6cfHW9e8L5iYbNc1dvtmzjs2lY0PfRe//t/TX7LVjD8Iqo9w/
 XCdhD3V7TuBnGtsuMdQxZH26aXTVNbtv3Ytkn7d/yyJXtmt8Ojo2aY9l0NnlGYjwq2mzXrtm
 GWUya78BjoQ5KS8DAAA=
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

Makes Dept able to track dependencies by swaits.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/swait.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/swait.h b/include/linux/swait.h
index 6a8c22b8c2a5..02848211cef5 100644
--- a/include/linux/swait.h
+++ b/include/linux/swait.h
@@ -6,6 +6,7 @@
 #include <linux/stddef.h>
 #include <linux/spinlock.h>
 #include <linux/wait.h>
+#include <linux/dept_sdt.h>
 #include <asm/current.h>
 
 /*
@@ -161,6 +162,7 @@ extern void finish_swait(struct swait_queue_head *q, struct swait_queue *wait);
 	struct swait_queue __wait;					\
 	long __ret = ret;						\
 									\
+	sdt_might_sleep_start(NULL);					\
 	INIT_LIST_HEAD(&__wait.task_list);				\
 	for (;;) {							\
 		long __int = prepare_to_swait_event(&wq, &__wait, state);\
@@ -176,6 +178,7 @@ extern void finish_swait(struct swait_queue_head *q, struct swait_queue *wait);
 		cmd;							\
 	}								\
 	finish_swait(&wq, &__wait);					\
+	sdt_might_sleep_end();						\
 __out:	__ret;								\
 })
 
-- 
2.17.1

