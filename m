Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B05C782229
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 06:05:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2986610E197;
	Mon, 21 Aug 2023 04:05:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0EEEF10E18E
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 04:04:59 +0000 (UTC)
X-AuditID: a67dfc5b-d6dff70000001748-9b-64e2ded5b3e2
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v10 11/25] dept: Apply sdt_might_sleep_{start,
 end}() to hashed-waitqueue wait
Date: Mon, 21 Aug 2023 12:46:23 +0900
Message-Id: <20230821034637.34630-12-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230821034637.34630-1-byungchul@sk.com>
References: <20230821034637.34630-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSf0yMcRzHfZ/fXR3PLuYhP29rTRE18ZmZ38vDZmw2I39wcw/d1OEiZTPR
 CSUqErnZVXZOXdKTWaprKf3SKDp1Uq27GqIfXC5Ohbvwz2evvT97vz7/fBhcVkbOZlTq44JG
 rYiSUxJCMuiTu6St265c9m4tpF9eBs5vFwnQFZkoaHlQgMD06CwG/bWboX10AMHYi2YcsjJb
 EOTYunB4VNeNwGw8R0Fr31SwOIcpaMxMoSAxr4iCV5/HMei8kYFBgbgNmtJyMahyfSAgq5+C
 21mJmHt8xMBlyKfBkOAPdmM2DeO2EGjsbiPB3BEEt+50UlBhbiSgrtSOQWuZjoJu028Smuoa
 CGhJTyWhcCiXgs+jBhwMzmEaXlfpMXiodYuSRn6RUJ9ahUHS3WIMLG/LEVRe7MFANLVRUOMc
 wKBEzMTh571aBPYrgzScv+yi4fbZKwhSzt8goHmingRtZxiM/dBR61bxNQPDOK8tOcmbR/UE
 /zyX459kd9G8trKD5vXiCb7EGMjnVfRjfI7DSfJi/iWKFx0ZNJ88aMH4oZcvab7h5hjB91my
 sB1+EZLVSiFKFStolq7ZL4n80JVOHrUycRPPntAJyEolIy+GY5dzKf1D+H8uzxFJD1NsAGe1
 uibz6ewCriT1vTuXMDh7wZszfnkxWfZlldy7zmTawwTrz93/2kR4WMqu4Fwjun8H5nMFD6sm
 RV7uXCwvQx6WsWHcV1sv4ZFybKIX195rIP8WZnFPjVYiDUn1aEo+kqnUsdEKVdTy4Mh4tSou
 +MCRaBG5P8pwenxvKXK07KxGLIPkPtL9c+xKGamIjYmPrkYcg8unS/2+25QyqVIRf0rQHNmn
 ORElxFQjP4aQz5SGjp5UythDiuPCYUE4Kmj+bzHGa3YCMvlrw2FOUlDztwA8tLQyQhoSqr7W
 8bZYsssctiVu5fP1u3tDM2SF8/Yuaui431cZ9Cl86wx7evCZ7d4zIn66vKObfNTrvSHlahHn
 OGPXX1toUTlm9mzbs/FC65vr9aSuxzb3oFQ7MoE+5R+oSNuw4vFYe/gx587emk2Lf0zzzcsJ
 khMxkYqQQFwTo/gD5JDsxU0DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSf0yMcRzHfZ/fnY5nJ+tRVnZbQ+ZHm+wzzGxmnhlmptn8mI57pqPS7irO
 Zi79UmSdSUpxFSd1yHMNueIU1Wn94ELU3XRMmiPJHafCnfHPe6+9P/u8/nozuKycDGNUyamC
 OlmRKKckhGTTisyFz50u5RKPOQr0p5aA59sJAspumijouVGLwFSfgcHw43Xw0utGMN7ZjUNx
 UQ+CikEHDvWtTgRN1ccpsL+bBr2eEQpsRScpyKy6ScHTjxMYDJw7g0GtuBE6CisxsPqGCCge
 puBCcSbmjw8Y+Iw1NBh1UeCqLqVhYjAGbM4XJLSU20hoer0ASi4OUNDYZCOg9a4LA/u9Mgqc
 pt8kdLS2E9CjLyDh+udKCj56jTgYPSM0PLMaMKjL8ttyxn6R0FZgxSDn8i0Mel9ZENw/8QYD
 0fSCghaPGwOzWITDz6uPEbhOf6Ih+5SPhgsZpxGczD5HQPdkGwlZA7Ew/qOMWr2Cb3GP4HyW
 +RDf5DUQ/JNKjm8oddB81v3XNG8Q03hzdTRf1TiM8RVfPSQv1uRRvPj1DM3nf+rF+M9dXTTf
 fn6c4N/1FmObZ2+XrFQKiap0Qb14VbwkYcihJ1P6mMOTjxpoHeqj8lEQw7FLOUuFSAaYYudy
 fX0+PMAh7BzOXPDe30sYnM2dylV/6fz7MINVcv0D+XSACTaKuzbaQQRYyi7jfGNl/6SRXG2d
 9a8oyN+LlnsowDI2lhsdfEsUIokBTalBIark9CSFKjF2keZAgjZZdXjR3oNJIvKPxnh0Qn8X
 fbOva0Ysg+TB0vjZLqWMVKRrtEnNiGNweYg0/PugUiZVKrRHBPXB3eq0REHTjMIZQh4qXb9N
 iJex+xSpwgFBSBHU/68YExSmQ7mqJDZ1w50GZSnuNaz2llxtvG1cFfRgvrtfl7fVIY2caW4e
 qt07fUy3w7IrrSH8d3Dw0kdr7Ieu5O5/kDHv4fI9Cy6ZDAqrQV8SkXPslb3buTPC9nI7td5c
 oN0ZysyNS88zzLg+K3+tNsJR6LMwYdn1c8iFm+K65WcnI8O3uFtH5YQmQRETjas1ij8RsZMA
 MAMAAA==
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

Makes Dept able to track dependencies by hashed-waitqueue waits.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/wait_bit.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/wait_bit.h b/include/linux/wait_bit.h
index 7725b7579b78..fe89282c3e96 100644
--- a/include/linux/wait_bit.h
+++ b/include/linux/wait_bit.h
@@ -6,6 +6,7 @@
  * Linux wait-bit related types and methods:
  */
 #include <linux/wait.h>
+#include <linux/dept_sdt.h>
 
 struct wait_bit_key {
 	void			*flags;
@@ -246,6 +247,7 @@ extern wait_queue_head_t *__var_waitqueue(void *p);
 	struct wait_bit_queue_entry __wbq_entry;			\
 	long __ret = ret; /* explicit shadow */				\
 									\
+	sdt_might_sleep_start(NULL);					\
 	init_wait_var_entry(&__wbq_entry, var,				\
 			    exclusive ? WQ_FLAG_EXCLUSIVE : 0);		\
 	for (;;) {							\
@@ -263,6 +265,7 @@ extern wait_queue_head_t *__var_waitqueue(void *p);
 		cmd;							\
 	}								\
 	finish_wait(__wq_head, &__wbq_entry.wq_entry);			\
+	sdt_might_sleep_end();						\
 __out:	__ret;								\
 })
 
-- 
2.17.1

