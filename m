Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 239F1BB6085
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 09:01:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7669110E87A;
	Fri,  3 Oct 2025 07:00:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8DC3610E008
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 08:28:49 +0000 (UTC)
X-AuditID: a67dfc5b-c45ff70000001609-14-68de3419f97f
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
Subject: [PATCH v17 46/47] SUNRPC: relocate struct rcu_head to the first field
 of struct rpc_xprt
Date: Thu,  2 Oct 2025 17:12:46 +0900
Message-Id: <20251002081247.51255-47-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251002081247.51255-1-byungchul@sk.com>
References: <20251002081247.51255-1-byungchul@sk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa2yLYRTH8zx9b2uUV228LjHKiGE2GTkuESSy9wsRvggRa9Y3WttKOnYR
 krELFpfp1OjWpbOlqXZsOkZR2c1lNtLZMMk2OjVbqEptYhfmrUX4cvLLec7/d54Ph5HI3eQM
 RqM9KOi0yiQFJSWkvgmlS6fHdqujyx/GgPu6HUGOc4yAn/pHNIy5HiEweLwU+C2nEfRVnUDQ
 5p0I7YN+CnytxRgumhwEON/dpaH10yiG5vwrGAr7KSgqzMJi6cNguHYPw5DFRoMlMwKKnrWR
 0GM10tB1zkBAU/crEj716il4+ziXhNuZ72gYaPdgKM0tJ6DtbjEF3RVjJLhrm0ko+NKLwDLo
 p6H3ZS6GqmzR8qzoOQkfjSYMDYOfMRS8MFPQc9ZHQ8D0iwR7KwGG0ZMUHPv2FoFpIAYG7Dbx
 cw+76fXRvK26BvMVJRWIHxnWIz4nXySnsYvmzY5DfHajj+SrrZF82f1+zJcGBkneYTtF8Y6A
 nuZLR/okfJ6vHfNPLo0QvNOzauusndK1KiFJkyrolq2Ll6pbrm444Jqcnq3fnYn8sjwUwnBs
 LOc/cYP+yw/sX3GQKXYh19ExJAlyKDuHqz7TSwZZwjbP4l61LgnyFFbJfWvoEmcYhmAjuMCP
 HcG2jF3JWbMukePKcM5eVftHEyL22zzNRJDl7Aoux5+Nx+cnc02XvURQIxHXVpbIxzeFc1m3
 isSoVNQ0hHDfbzvxuHM6V2ftIPIRa/wvbvwXN/4XNyOJDck12tRkpSYpNkqdodWkRyXsT3Yg
 8c4sR0d33UEB9/Z6xDJIMUHmjuhSy0llakpGcj3iGIkiVBZv7VTLZSplxmFBt3+P7lCSkFKP
 ZjKEYpps+fc0lZzdqzwoJArCAUH39xUzITMykdQVpzC8T+zcfNOsPRU5KeFFwvz4xWlTmri5
 jAoKSm6UNb6ucq/tW90479zMRXu9plC2Qmo2Fnc2hLXUbNpiOB6l+vC0M22VI+aNIvGCEDdM
 nX2+ZuxMXr93wLlvwdDG4cojcVSEf9QVDd6wOyWVU8MLz9fYthX3z65rKvO47uUqiBS1MiZS
 oktR/ganEuEEYwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRjHec9d6cRxGZ3Ksgaj6GIXsh4qulDhIejyrQgqVx7amDe2spQC
 bY6krGwxV1upKQ3bTE0rMlkMJSt11LQb6dLlskJtYpp5XWdJ1JeX3/s8P/7P8+FhcNkIOYdR
 Jx8XtcnKRDkVToTv3qBfPnvNR9VKZ/kMeJvlImBoMIeAGxVlFORUXSfhVbkDQcdQDoLhMSsO
 hpogARPGBhoGR9poCDobEOR7jDiU3c/C4EflJAU99QMITD4/BeZvWQQEbLkILN1WGr49jYO+
 jloSgt4vGLz72YvA5p/EwO86h2AiXwOFxdUUjLlf4mA2vUJwy+fF4Wul1Lzf8BGBs/QsBZ/z
 HuDQ6p8Or4cCFLwwXaCgz3MDg++VFBSddZJw02pEoC+poCD/ZhUBNZ2PafD0jGPQnm/EwFG1
 Czps3QQ05RVj0n6SdW8WWM16THq+YmC6W4vBiM1OQ3NJOwG2TAVY3a0kfCq10DDuWwXBohRo
 cHyhwXvZREB530tyiwkJw4ZLhGCvfogJhpYJSigrKEPC2KgRCYO39bhgyJO+9b0BXMiuPinc
 buqlhNGhN5Tg/FlECI3FvHDFvVyosXhpIfvJB3rv+gPhGxPERHWaqF2xKT5c1Xxna6oz4lS2
 8WAmCrDnURjDc2v4J45+LMQUt4h//34ED3Ekt4CvvthNhhjnmqL4t55lIZ7BKfkf9V7JYRiC
 U/ADv/aHyiy3li/VXyOnIqN5R6XrT0yYVG/1NREhlnGxvCGQjU35EfyL634iFINLYysKZFOT
 onn9Ayueh1jLf5bln2X5zypCuB1FqpPTkpTqxNgYnUaVnqw+FXM0JakKSQdpOzN+5REabI2r
 QxyD5NNYj8KrkpHKNF16Uh3iGVweycaXtqtkbIIyPUPUphzWnkgUdXVoLkPIZ7E794nxMu6Y
 8rioEcVUUfu3izFhczLRh8aWPRBVeFCh3fbZ3bgO254rX9072XNu4Xx3f+PchKhJfdy8q5u2
 bC5xm8/bYtpcW2MWz+zqYjtrT7ZohI0F9tPajOd7I7b7Tmc034L2nK5n9wotbOehpbFO89Xh
 w/1ZrsVc3xFFbYV5x1qHnW8zTUtN0oRFu9riBsbujAZzV8gJnUq5agmu1Sl/A2JfrD6MAwAA
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

While compiling Linux kernel with DEPT on, the following error was
observed:

   ./include/linux/rcupdate.h:1084:17: note: in expansion of macro
   ‘BUILD_BUG_ON’
   1084 | BUILD_BUG_ON(offsetof(typeof(*(ptr)), rhf) >= 4096);	\
        | ^~~~~~~~~~~~
   ./include/linux/rcupdate.h:1047:29: note: in expansion of macro
   'kvfree_rcu_arg_2'
   1047 | #define kfree_rcu(ptr, rhf) kvfree_rcu_arg_2(ptr, rhf)
        |                             ^~~~~~~~~~~~~~~~
   net/sunrpc/xprt.c:1856:9: note: in expansion of macro 'kfree_rcu'
   1856 | kfree_rcu(xprt, rcu);
        | ^~~~~~~~~
    CC net/kcm/kcmproc.o
   make[4]: *** [scripts/Makefile.build:203: net/sunrpc/xprt.o] Error 1

Since kfree_rcu() assumes 'offset of struct rcu_head in a rcu-managed
struct < 4096', the offest of struct rcu_head in struct rpc_xprt should
not exceed 4096 but does, due to the debug information added by DEPT.

Relocate struct rcu_head to the first field of struct rpc_xprt from an
arbitrary location to avoid the issue and meet the assumption.

Reported-by: Yunseong Kim <ysk@kzalloc.com>
Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/sunrpc/xprt.h | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/linux/sunrpc/xprt.h b/include/linux/sunrpc/xprt.h
index f46d1fb8f71a..666e42a17a31 100644
--- a/include/linux/sunrpc/xprt.h
+++ b/include/linux/sunrpc/xprt.h
@@ -211,6 +211,14 @@ enum xprt_transports {
 
 struct rpc_sysfs_xprt;
 struct rpc_xprt {
+	/*
+	 * Place struct rcu_head within the first 4096 bytes of struct
+	 * rpc_xprt if sizeof(struct rpc_xprt) > 4096, so that
+	 * kfree_rcu() can simply work assuming that.  See the comment
+	 * in kfree_rcu().
+	 */
+	struct rcu_head		rcu;
+
 	struct kref		kref;		/* Reference count */
 	const struct rpc_xprt_ops *ops;		/* transport methods */
 	unsigned int		id;		/* transport id */
@@ -317,7 +325,6 @@ struct rpc_xprt {
 #if IS_ENABLED(CONFIG_SUNRPC_DEBUG)
 	struct dentry		*debugfs;		/* debugfs directory */
 #endif
-	struct rcu_head		rcu;
 	const struct xprt_class	*xprt_class;
 	struct rpc_sysfs_xprt	*xprt_sysfs;
 	bool			main; /*mark if this is the 1st transport */
-- 
2.17.1

