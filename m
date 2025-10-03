Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEC1BB606D
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 09:01:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83DA310E1D8;
	Fri,  3 Oct 2025 07:00:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.hynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4D22E10E0E0
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 08:28:33 +0000 (UTC)
X-AuditID: a67dfc5b-c2dff70000001609-2e-68de340eafb4
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
Subject: [PATCH v17 15/47] dept: apply sdt_might_sleep_{start,
 end}() to waitqueue wait
Date: Thu,  2 Oct 2025 17:12:15 +0900
Message-Id: <20251002081247.51255-16-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251002081247.51255-1-byungchul@sk.com>
References: <20251002081247.51255-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0xTdxjG+Z/zP6eXtO5YXXZEF0yNTHHiJahvojO6fTlfSGYWL3Ex2qwn
 ayMXVwRlBi1a1HlhpaYQWoeVKAKthrSdkSpLRahW4mhFsChFLqVu1kqipQYR2YHpt9/7PM/7
 Pl9eMal4SqWKtXn7eV2eKkdJS7E0Lqtd/llWv2blk2EWekq9GMYSJzFMmnwiSIw/FcFUiw9B
 ZdBEgsNdSsCbpg80mAcjNFT9W4phtO4MAkvUKuTCzwl4nHyJoC7ygYCI9wSCycq9MPGgk4Qq
 cwDBxcEwCf80Cbrb149gxPgnCV2RWfBobJQGv/k0DfHgeQJsR1so+MNqQtA84BFBMPaeALsz
 W+ijwVp1jADz1ZsEDNVbhE5bPvjsz0UQ/t2M4Vq8kwJ/fw8FsaiJhmd3j1Pg7G1H4DgTJcE5
 LBgXj1/CUF3TR8PJyQQC340hAro852nod0xRoLe+pSDg7aDgoT2AocN3D4Pf0oCh03OVgsGB
 EAXJ8vkQMo4gOPcqiiCWrCPhoddGbFJzb8vKMdfouk5wjhoH4ibemRCXuHyM5MqMwnjn5SjJ
 GVwHuHdj3TTXkrRh7n4ty1U8WM41W8IizvDXExFncxZyhrY49f2KndINaj5HW8TrVmzcI9W0
 xfV4X7nkYPVdD61HZ0WnkETMMlls97Cf+sTegWczOs18xYZC4+Q0z2UWsq6z0ZkMyXQsYHuC
 X0/zHGYbe8LoJqYZM4vZ7oB1Ji9n1rK9wd/Q/zfTWHuTd0aXCHrXYAeeZgWzhi0bNQi7UiFz
 QcLWVIx9XJjH3q4PYSOS21BKI1Jo84pyVdqcrExNcZ72YOZP+blOJLxcXcn7H2+g14EfWhEj
 RkqZPLA4rFFQqqKC4txWxIpJ5Vz5nvo+jUKuVhX/yuvyd+sKc/iCVjRfjJVfyFcnD6gVzM+q
 /fxent/H6z65hFiSqkezdq3XJ141ar/T334BCzY3fZkCve7UtoytxEjf5sLs2fElq18vUnSl
 RewTw2lrrrcPTY3f2/6NW5V+ZNkh/7yYfV3arsOnGiw7YsSiLba22i1Lk+m/lGQ0v/j2MLUt
 Mz3ymLxFe2WlVz7HfyORpt11n7tZ7TpkMkQbSmSSO2tlK5W4QKNalUHqClT/AbYxAr1uAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0hTcRjG+5/z3zlzNTssq5MV1UKimyVovFRE9aVDFymEigh05aEtb7WV
 aRB4G1mWzcG0uaylNMVZzltkMhlaVproUrturYVp5swuLjG1tRl9efm9z/Pw8nx4haTkviBU
 qEg+wyuTZYlSSoRF0Vuy1wdHvpdvvOZdCi8zbRi8Y7kYblRXUZBbqxdA9z0zApc3F8H4pIEE
 daMPw7S2jYaxiXc0+KxtCArtWhKq6jMJ+Gn5Q8Fw6w8EOnc/BUVDmRhGTVcQFA8YaBh6vAtG
 XE0C8DkHCXj1y4PA1P+HgH7bRQTThQlwq7SOgsnOLhKKdN0IbrudJHy2+M36tvcIrBVZFHzS
 NJDQ0x8Mvd5RCp7p8igYsd8g4KuFAmOWVQAlBi2C7LJqCgpLajE0fnhIg314igBHoZYAc+0+
 cJkGMHRoSgl/P3+qZiEYirIJ//hMgO5uEwETpkoanpc5MJgywsDQ2SOAjxXFNEy5I8BnTIE2
 8yANzms6DPdGugTbdYgbV+djrrLuPsGpX0xTXNXNKsRN/tYibuxONsmpNf611TNKcjl157g7
 HR6K++3tozjrLyPm2ktZrqBzPddY7KS5nOa39P7NR0Rb4/lERSqv3LAtTiR/NJKBT+UHpemf
 PKQy0FX6MgoSskwka/vgmmGKWcW+fj1BBjiEWc7WXR0QBJhkOpawL+3rAjyPOche1NQTAcZM
 GNvXbZjJi5lN7Bv7JfTv5jLWbLHN6EF+vcfdgQMsYaJY9WgOoUEiI5pViUIUyalJMkViVLgq
 QZ6erEgLP56SVIv832S6MFXwAI317GpBjBBJ54jtYU65RCBLVaUntSBWSEpDxHEVDrlEHC9L
 P88rU2KVZxN5VQtaLMTSheLdh/g4CXNCdoZP4PlTvPK/SwiDQjNQ0gPl6bXOdscS3jO5vCB2
 ZaqxOeaLNXZBxM89ZbZbBu/eho95MXnu/MiJGv3dceabqzxm6+ya+nKfdVtctLJvZ7AOO4rT
 Oo95jCuiQr9fXzb8RfE489Pg0/SS1fO9c4eI55fzsuZdMEZf793etNK+Rt910nLgQPvRvYcX
 DZj1O8qbpVgll0WsIZUq2V+wmf0QSQMAAA==
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

Make dept able to track dependencies by waitqueue waits.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/wait.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/wait.h b/include/linux/wait.h
index 09855d819418..65dd50f25e54 100644
--- a/include/linux/wait.h
+++ b/include/linux/wait.h
@@ -7,6 +7,7 @@
 #include <linux/list.h>
 #include <linux/stddef.h>
 #include <linux/spinlock.h>
+#include <linux/dept_sdt.h>
 
 #include <asm/current.h>
 
@@ -305,6 +306,7 @@ extern void init_wait_entry(struct wait_queue_entry *wq_entry, int flags);
 	struct wait_queue_entry __wq_entry;					\
 	long __ret = ret;	/* explicit shadow */				\
 										\
+	sdt_might_sleep_start(NULL);						\
 	init_wait_entry(&__wq_entry, exclusive ? WQ_FLAG_EXCLUSIVE : 0);	\
 	for (;;) {								\
 		long __int = prepare_to_wait_event(&wq_head, &__wq_entry, state);\
@@ -323,6 +325,7 @@ extern void init_wait_entry(struct wait_queue_entry *wq_entry, int flags);
 			break;							\
 	}									\
 	finish_wait(&wq_head, &__wq_entry);					\
+	sdt_might_sleep_end();							\
 __out:	__ret;									\
 })
 
-- 
2.17.1

