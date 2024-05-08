Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C238D8BFA00
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 12:03:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A047C113538;
	Wed,  8 May 2024 10:02:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id A9438113531
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 10:02:55 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-e5-663b4a3aeddf
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
Subject: [PATCH v14 13/28] dept: Apply sdt_might_sleep_{start,
 end}() to waitqueue wait
Date: Wed,  8 May 2024 18:47:10 +0900
Message-Id: <20240508094726.35754-14-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240508094726.35754-1-byungchul@sk.com>
References: <20240508094726.35754-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0iTYRTHe573NkeLl2X4ah+qlRRGlmJ1yoxu2EtQiUUf9EONfNWRNzav
 QWCpZamlllo2whvTdF7aCixdLE3TRFtlpmEzbVTDzdFspinVNPpy+PE///P7dESE9BHlI1Ik
 JAvKBHmcjBaTYvvyyi27jwRHb7N+8oai/G3g+pFLgrpZS4OpqQGB9uFFDNauw/B+xoZgvv8V
 AWUlJgSV4x8JeNhtRmCou0TDW8sKGHQ5aOgtyaMhq7qZhteTCxhGS4sxNOiOQl9hFQbj3FcS
 yqw03C3Lwu7xDcOcpp4BTaYvTNSVM7AwHgC95iEKDB82w517ozS0G3pJ6G6dwPD2iZoGs/YP
 BX3dPSSYigooaJyqomFyRkOAxuVg4I2xAkNLtlt0efo3BS8KjBgu1zzAMDjShuBp7icMOu0Q
 DZ0uGwa9roSAX7VdCCau2xnIyZ9j4O7F6wjyckpJyB7dDvOzanrfLr7T5iD4bH0ab5ipIPmX
 VRz/uPwjw2c//cDwFboUXl/nx1e3WzFf6XRRvK7+Ks3rnMUMf80+iPmpgQGG77k9T/KWwTIc
 5hMh3hMlxClSBeXWvWfEsWMdZiqpwCO9xjpNZKJ85hryEHFsELdg1lD/ecg0ssQ0u5EbHp4j
 FtmTXcvpC74s5QRrE3M1A6GLvJI9xT1vLcGLTLK+nO1z5pJTwu7gvjua6H/ONVxDi3HJ4+HO
 R75OoUWWstu5tqxyd1/s7vwQcXmOMeLfgTf3rG6YLESSCrSsHkkVCanxckVckH9sRoIi3f9s
 YrwOuZ9Jc2EhshU5TSc6ECtCsuUSo9fuaCklT1VlxHcgTkTIPCVdV3ZGSyVR8ozzgjLxtDIl
 TlB1oNUiUuYlCZxJi5KyMfJk4ZwgJAnK/1ss8vDJRLXrvTeIC5sMoZLXivAqOJh4zDzsmXIj
 MFcXLmgzpouru2uJnD/6q5vvG2dLiyzVYz4RtrWNLwKSL23qVX33C4lSH/+Zsuyd+o264ZFT
 HXMs1P9CBLsyyd5/b3KdvfjW7zTVqmcHbt4JtoQV+u5H8SdDIpOdh7ZYJlJDdgb1bwqelZGq
 WHmAH6FUyf8C6Ue/y0gDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSf0yMcRzHfb/Pr+vm6nEyzzSya42YFOIzmdlsepZp/IPZjMOTbq4f7vrJ
 KO4QOqu4Tj+QtNPqFBdT6nIupVg5aqlWIQ2t0026m1NDl/nnvdfe7+3111tESA3UIpEiIVlQ
 JciVMlpMimMiNas2RkfGhl0zkZCXEwauyWwSSmpMNNirqxCYHp7BMNoSBe/cDgRTHa8JMOjt
 CG5/HCTgYesQAkvFWRq6Rnyh2+WkoV1/mQbNnRoa3oxNYxgoyMdQZd4Br3LLMFg9X0gwjNJQ
 bNDgmfiKwWOsZMCYFQzDFUUMTH8Mh/ahHgqab7RTYOlfCYU3B2hotLST0Fo3jKHrSQkNQ6Y/
 FLxqbSPBnqej4N54GQ1jbiMBRpeTgbfWUgz3tTO28z9+U/BCZ8VwvvwBhu6+BgRN2R8wmE09
 NDS7HBhqzXoCft1tQTB85RsD53I8DBSfuYLg8rkCErQDETD1s4TespFvdjgJXlubxlvcpST/
 sozj64sGGV7b1M/wpeYUvrZiBX+ncRTztydcFG+uvEjz5ol8hr/0rRvz452dDN92fYrkR7oN
 eGfAPvGmI4JSkSqoVm8+KI57bxuiknQ+6eWjP4gslMNcQj4ijl3H9dj7KC/T7DKut9dDeNmf
 XcrV6j7P9gTrEHPlndu8PJ/dzT2v02Mvk2ww5/iUNeuRsOu5785q+p8zkKu6b531+Mz0fV/G
 kZelbATXoClicpG4FM2pRP6KhNR4uUIZEao+FpeRoEgPPZwYb0YzdzGems6rQ5NdUTbEipBs
 rsROR8ZKKXmqOiPehjgRIfOXtFzYECuVHJFnnBBUiQdUKUpBbUMBIlK2UBK9RzgoZY/Kk4Vj
 gpAkqP6vWOSzKAulmWJ8l2da50yb1mx7ljNI7N0U4lmY3ibtCEryyz6QVrh9rc3wXb9b81hJ
 xWt/2RafnqjvCGIeV9a7dUsy/arDtwacPH5orm/gWL/ulm3HAvn75P3zJjMeNUnCRCmKVSNP
 nYpCSDzbGJZdmP6utylmwG+1Ldj94e6uzKsQYgbLTxmpjpOHryBUavlfmxi4yCoDAAA=
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
index 8aa3372f21a0..3177550a1b42 100644
--- a/include/linux/wait.h
+++ b/include/linux/wait.h
@@ -7,6 +7,7 @@
 #include <linux/list.h>
 #include <linux/stddef.h>
 #include <linux/spinlock.h>
+#include <linux/dept_sdt.h>
 
 #include <asm/current.h>
 
@@ -302,6 +303,7 @@ extern void init_wait_entry(struct wait_queue_entry *wq_entry, int flags);
 	struct wait_queue_entry __wq_entry;					\
 	long __ret = ret;	/* explicit shadow */				\
 										\
+	sdt_might_sleep_start(NULL);						\
 	init_wait_entry(&__wq_entry, exclusive ? WQ_FLAG_EXCLUSIVE : 0);	\
 	for (;;) {								\
 		long __int = prepare_to_wait_event(&wq_head, &__wq_entry, state);\
@@ -317,6 +319,7 @@ extern void init_wait_entry(struct wait_queue_entry *wq_entry, int flags);
 		cmd;								\
 	}									\
 	finish_wait(&wq_head, &__wq_entry);					\
+	sdt_might_sleep_end();							\
 __out:	__ret;									\
 })
 
-- 
2.17.1

