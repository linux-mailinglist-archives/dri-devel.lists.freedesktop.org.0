Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E4B74590B
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 11:50:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1B1610E1F1;
	Mon,  3 Jul 2023 09:49:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id D9F1210E1F0
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 09:49:42 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-76-64a299b33678
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v10 rebased on v6.4 10/25] dept: Apply sdt_might_sleep_{start,
 end}() to waitqueue wait
Date: Mon,  3 Jul 2023 18:47:37 +0900
Message-Id: <20230703094752.79269-11-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230703094752.79269-1-byungchul@sk.com>
References: <20230703094752.79269-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSXUxTZxjH977nnPecdnY5qWyc6cVME6NBUXS4PNnMsgsS35slRrzSRNfQ
 M2kslLRSRMYE+RD5UkgAUVTaulKhDG3dRBCCEEDEDxCiXYOdZTrHpGJw7ewAJ0W9efLL/5//
 7+oRGHUHt0LQpx+QTelag4YoWWVwmTXeU2/TJfz+UyxUlSdA6J8SFhraXARGfm5B4Lqcj2Gq
 fxs8CE8jmLt9l4G6mhEE1sBDBi4P+BF0OY8QGHv8EYyHZggM1ZQRKLC3ERh9No9horYaQ4v7
 Wxg+YcPQE3nKQt0UgdN1BXjx/IUh4mjmwZG3Giadp3iYD2yCIf99Drp866D+7ASBa11DLAy0
 T2IY62gg4Hf9z8HwwA0WRqoqOGh9biPwLOxgwBGa4eFeTyOGi4WLouKXrzkYrOjBUHz+Eobx
 3zoRdJc8wuB23SfQF5rG4HHXMPBfUz+CycogD0XlER5O51ciKCuqZeHuwiAHhRNbYO5VA/nm
 S9o3PcPQQk8W7Qo3svSmTaJXTz3kaWG3j6eN7kzqccZR+7UpTK2zIY66m48R6p6t5mlpcBzT
 53fu8PTGyTmWPh6vw9tX7lJu1ckGvUU2bfz6O2XqUGdOxgXFwe7jPpSHmvhSpBAkMVFq7e7D
 73msLZ+JMhHXSF5vZIljxFWSp+JPrhQpBUY8+qHkfHGbRIvl4vfSrTNVbJRZcbV0vjq8JFKJ
 X0hP/QPvpJ9JLRd7lkSKxfzJq0oUZbW4RZqo95OoVBKPK6RQ5A/u7eBT6brTy55Aqkb0QTNS
 69MtaVq9IXFDana6/uCGFGOaGy1+lCN3fnc7mh1J7kWigDTLVN4cq07NaS3m7LReJAmMJkZV
 EDinU6t02uxDssm415RpkM29aKXAamJVm8NZOrW4T3tA3i/LGbLpfYsFxYo8lNT/xMgdK0ke
 /NHSkfDyX5+948Jw3tEaY9aqQVvkRdlXvvwjsVealr8uyw3uWxvgF3J2B6c/2frxA/fhzrmx
 uKQfdmby69fabc2Rz63lM0KuYY9jNDkladS7Lm2H8aZFDtBfqxZ8ife8e//e8cvGItcjza5D
 s0kKC7EX18YfNpl9Gtacqt0Ux5jM2jepiRhWTQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0xTdxyG/f/PlUqXk4rxBMlkVeKim0IC+lPI1H3hhERnTIyZX6RZj9Jw
 0bSCojGCrUyhgCViBUELmNJBBXYwjItljIZivRZoFElphKhIQFCkCINdqMu+vHnyvsnz6WUJ
 RQUVzmoyToraDFWakpaRsn3x+m+lsmp19IuCBDAZoyEwe4mEikY7DZ6GegT2u7kYxnsS4fnc
 JILFx08JMJd6EFSNDBNw1+VH4LBdoGHg1RfgDUzT4C4toEFf00hD38QSBt+1Egz10l54eKUa
 Q9fCGAnmcRpumPV4Od5iWLDWMWDNiYJRWzkDSyMx4PY/o8BZ6abAMbQZym76aLjncJPgah3F
 MNBeQYPf/g8FD133SfCYCim4M1VNw8SclQBrYJqB/i4LhibDsi3v498U9BZ2Yci7/SsG74sO
 BJ2XXmKQ7M9ocAYmMTRLpQT8WduDYLToHQMXjQsM3MgtQlBw8RoJT//qpcDgi4PF+Qp6d7zg
 nJwmBEPzKcExZyGFB9W80FY+zAiGziFGsEiZQrNtk1BzbxwLVTMBSpDqLtOCNFPCCPnvvFiY
 evKEEe5fXySFV14z3h9xWJagFtM0WaJ263fJshR3x9kTv4Sc7iweQjmolslHISzPxfIDjblE
 kGluIz84uPCZw7hIvrnwDZWPZCzB/bySt71/TAeHVdxR/lGliQwyyUXxt0vmcJDl3DZ+zO/C
 /0nX8fVNXZ9FIcv96/kiFGQFF8f7yvz0FSSzoBV1KEyTkZWu0qTFbdGlpmRnaE5v+el4uoSW
 P2M9t2RqRbMDid2IY5EyVD54tkqtoFRZuuz0bsSzhDJMrh+5pVbI1arsM6L2+BFtZpqo60Zr
 WVK5Rp50SExWcMdUJ8VUUTwhav9fMRsSnoN+m2lIighb9fv2LPbB16Er+nr2loeu7/9yj/3H
 pu+Hd5ijfbolV3FPa/KsZyo+taMtPOHCxC5T0vnR+V0tBrmldip0LHVnlTHR9j5pfW9TrDfy
 g6P4mx/ObV5TVGCMdFb2n1rdrgmXth5wug9uUJbl61s+5Vzefd2YfpVoOXhV8dUfHiWpS1HF
 bCK0OtW/ZFm/Ti8DAAA=
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

