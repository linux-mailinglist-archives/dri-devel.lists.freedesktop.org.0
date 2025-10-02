Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA8BBB6124
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 09:02:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8238A10E8B9;
	Fri,  3 Oct 2025 07:01:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.hynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id A6E2510E0E0
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 08:28:32 +0000 (UTC)
X-AuditID: a67dfc5b-c45ff70000001609-ff-68de340edca2
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
 yunseong.kim@ericsson.com, ysk@kzalloc.com, yeoreum.yun@arm.com,
 netdev@vger.kernel.org, matthew.brost@intel.com, her0gyugyu@gmail.com,
 corbet@lwn.net, catalin.marinas@arm.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 luto@kernel.org, sumit.semwal@linaro.org, gustavo@padovan.org,
 christian.koenig@amd.com, andi.shyti@kernel.org, arnd@arndb.de,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, rppt@kernel.org,
 surenb@google.com, mcgrof@kernel.org, petr.pavlu@suse.com,
 da.gomez@kernel.org, samitolvanen@google.com, paulmck@kernel.org,
 frederic@kernel.org, neeraj.upadhyay@kernel.org, joelagnelf@nvidia.com,
 josh@joshtriplett.org, urezki@gmail.com, mathieu.desnoyers@efficios.com,
 jiangshanlai@gmail.com, qiang.zhang@linux.dev, juri.lelli@redhat.com,
 vincent.guittot@linaro.org, dietmar.eggemann@arm.com, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, chuck.lever@oracle.com,
 neil@brown.name, okorniev@redhat.com, Dai.Ngo@oracle.com, tom@talpey.com,
 trondmy@kernel.org, anna@kernel.org, kees@kernel.org,
 bigeasy@linutronix.de, clrkwllms@kernel.org, mark.rutland@arm.com,
 ada.coupriediaz@arm.com, kristina.martsenko@arm.com,
 wangkefeng.wang@huawei.com, broonie@kernel.org, kevin.brodsky@arm.com,
 dwmw@amazon.co.uk, shakeel.butt@linux.dev, ast@kernel.org, ziy@nvidia.com,
 yuzhao@google.com, baolin.wang@linux.alibaba.com, usamaarif642@gmail.com,
 joel.granados@kernel.org, richard.weiyang@gmail.com,
 geert+renesas@glider.be, tim.c.chen@linux.intel.com, linux@treblig.org,
 alexander.shishkin@linux.intel.com, lillian@star-ark.net,
 chenhuacai@kernel.org, francesco@valla.it, guoweikang.kernel@gmail.com,
 link@vivo.com, jpoimboe@kernel.org, masahiroy@kernel.org,
 brauner@kernel.org, thomas.weissschuh@linutronix.de, oleg@redhat.com,
 mjguzik@gmail.com, andrii@kernel.org, wangfushuai@baidu.com,
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-i2c@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-modules@vger.kernel.org, rcu@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: [PATCH v17 14/47] dept: apply sdt_might_sleep_{start,end}() to swait
Date: Thu,  2 Oct 2025 17:12:14 +0900
Message-Id: <20251002081247.51255-15-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251002081247.51255-1-byungchul@sk.com>
References: <20251002081247.51255-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0hTcRjG+5/zPxdXi8OKOmqQjCKKMguLN5AKKjxdhKxPXaBWHtpyTtnW
 ykpQajavmaVF8xammK6sY4KXwmnaTdNNa+3D1GZpF7HI0rC8tCV9efnxPO/7PF9ellRkUEGs
 RmcU9TqVVknLsGxk3q0188P71GEf7wC4UuwYCqptNPz6YyXBXD+DYebxUwS2hykEjPQ3UlD+
 YZqAqfxY+HT/EoLBnFoSXo99o6HQmosgv1DC4ByeJOD6Zxry7jYS0FHqwXBvpIuCn6+9BFga
 xjBI710U9DQU0NBnm6Eg2fqLAoe9nYLuKgeG6o9uAsreOgnwvnNTMJ4dDI4rWT7TXkJASnMp
 horv1ykYepNKwLMsOwGptx8QcLW7hIYaKY+E3711FLhyi2kYyB5hwJw5wYA1JRtBhjkfg6V1
 nARrWx+zNUwwd0/Rgq3IhgRzjm9cebVGqL/Zywgl0imhpmKVUProMyFIlWm0II3mMoLH9YgW
 vnZ2MsLzG3+wUO/dJBS9iBb6M54RewMPyiJiRK3GJOrXbj4qU49631AJbewZd1kDk4w66XQU
 wPJcOJ+X3k/856LsQcbPNLeCd7snSD8v5EL4mqwhys8k176EdzlXpyOWXcBF8VWVBr+MueV8
 6stayi/LuY38taKg2cSlfNV9+7+UAJ/c423HflZwG3jzt4u+VplvxxrAD0kSnj0I5Jsr3DgH
 yUvQnEqk0OhMcSqNNjxUnajTnAk9Hh8nId+LlCdNHqpDo479LYhjkXKe3LG8V62gVCZDYlwL
 4llSuVB+tMKjVshjVIlnRX38Ef0prWhoQcEsVi6Wrx8/HaPgTqiMYqwoJoj6/y7BBgQlo7wo
 9eGyRaS2JSI9pPZC2rbtiyy70JawZXgqejq01TM9fNKpP6ZL3me61KHfnRUaPHZvXfCT7p3F
 yBTl6mEyI68NJZGBX4ymucWWet2BHcVdZk/TZfuFHwPQKt8YEtG0p80Y+9ZSELb2Z3XXBDIa
 4ycz2UiqMENded55buWhnUpsUKvWrSL1BtVf89Lohh4DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0iTcRTG+7/3LZcvy+jNimJhiand49CNvvV2t6gMQXTVWxvOWVuZGpI2
 Z3a30Sa6sqU4zJm3aWRmiJVUy3RZJuW0hZmSJngL89ZW9OXwO89zeHg+HAaXVpL+jFJ9WtCo
 5SoZJSbEezbqQmat7VCs7MtjoTW1joCR4QwCbpcWU5BRkU1Cc4kNQedIBoJf42Yc9NXTBEwa
 GmgYHvtMw3RtAwKT04BDcWUqBkNlUxT8eDaIwOjuoiCrN5WAAetVBDndZhp6X2yD/s4aEqZd
 3zH4ONqHwNo1hUFX3UUEk6YYuJtnp2C8sQmHLGMzgntuFw49ZR6zsqEDQW3hBQq+ZVbh0NI1
 C96PDFDwyniFgn7nbQx+llFguVBLwh2zAYEuv5QC050KAqq/PKbB+WMCg3aTAQNbxW7otHYT
 4MjMwzz9PFflc8GcpcM8owcD44MaDMasRTS8yW8nwJoSAObGFhK+FubQMOFeBdOWOGiwfafB
 dcNIQEl/E7nViPhf+usEX2R/iPH6d5MUX5xbjPjx3wbEDxfocF6f6Vmf9Q3gfJr9LF/g6KP4
 3yMfKL521ELwr/M4/mZjCF+d46L5tKef6LANEeJNxwSVMl7QrNgSLVYMuj+QJ18wCW0Fj+kU
 9Ja6jEQMx67lcq9/o71Mscu4trYx3Mt+7GLOfq2b9DLOOhZwrc7gy4hhZrO7OVuR1isTbACX
 /rqK9MoSdj13K9f/X+IizlZW9zdF5JFb3A7Cy1J2HacfSMMykdiCZhQhP6U6PlauVK0L1cYo
 EtXKhNCjcbEVyPNL1uSJm4/QcMu2esQySOYjcQa4FFJSHq9NjK1HHIPL/CTRhe0KqeSYPDFJ
 0MRFac6oBG09ms8QsrmSHeFCtJQ9IT8txAjCSUHz38UYkX8K8v05Idku7l+9+bNF9/VAdnpr
 eGNw2JaIofPzZgQNhvkcj7xFb+yt25VwP5ixD21flPT8lGZJTE1IunvBwf1zXkp2Ipv+Y4+6
 0KaeLQ0NrTycnp1kEPmEJC9dPjoVeGnvUGSg6NDDt8nnjjhUHTOj1lw5saN9oc/KXcpyX2R6
 si9JliAjtAr5qiBco5X/AYx6uolHAwAA
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 03 Oct 2025 07:00:55 +0000
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

Make dept able to track dependencies by swaits.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/swait.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/swait.h b/include/linux/swait.h
index d324419482a0..277ac74f61c3 100644
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

