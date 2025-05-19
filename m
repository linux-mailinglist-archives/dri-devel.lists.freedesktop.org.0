Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE4CABB894
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 11:19:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3BE710E352;
	Mon, 19 May 2025 09:18:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id A761510E23E
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 09:18:46 +0000 (UTC)
X-AuditID: a67dfc5b-681ff7000002311f-22-682af76f0825
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
 yskelg@gmail.com, yunseong.kim@ericsson.com, yeoreum.yun@arm.com,
 netdev@vger.kernel.org, matthew.brost@intel.com, her0gyugyu@gmail.com
Subject: [PATCH v16 21/42] dept: apply timeout consideration to waitqueue wait
Date: Mon, 19 May 2025 18:18:05 +0900
Message-Id: <20250519091826.19752-22-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250519091826.19752-1-byungchul@sk.com>
References: <20250519091826.19752-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0xTdxjG/Z97O6vHavAoJs5GgpToZIJ5XdSYGOMxy8wysw+bH7TKmW0s
 hZS7iQmX4gSECYpkCFiKKQ0to55SL4wql1hlbIiC5TKKQpSIFkmQFkGQFZxf3jx53ie/9/nw
 MrjcTa5nNLokQa9TaRWUlJCOL6/aGj+tVG+314WAf+o8AeX1Ngq6/rAisDVkYjB2/yD0BnwI
 PvzzCIfSki4EVcNeHBrcQwhcliwKul+sgB7/BAXtJfkUZFfXU/D4zRwGg1eKMbCK38Ez8ygB
 HRdNGJSOUXC1NBsLjlcYzJhraTBnhMGIpYyGueEoaB/ykOAaiITfKwcpaHK1E+C+PYJBd2M5
 BUO2BRI63A8JCBSGQldRAQl1b00UvAmYcTD7J2h40mzEwG0MAbshCDz37iMJDwqaMTh3/QYG
 Pf1/Irh7/jkGos1DQZvfh4FDLMFhtuY+gpHCcRpyLszQcDWzEEF+zhUCDIMx8OF98HLFVBRk
 XrMTUDfvQfv28LZKG+LbfBM4b3Ck8rP+pxTvChgJ/i8Tx98p89K84e4AzRvFZN5hUfLVTWMY
 XzXpJ3mxNpfixclims8b78H4t52d9PcbfpbujhW0mhRB/9Xe41L1YLGBTHDSadaaLCoDGag8
 JGE4NppranhGftY3/K+WfIoN5/r6ZvBFvYb9knMUjAYzUgZnPV9wvRX9KA8xzGr2MHdvZuui
 JNgw7vlI8mJcxu7kPOVZ6BNyI2e1Ny9hJEF/IL9tyZezMVyPtZJYRHLsbxKu9NfH/3dYx7VY
 +oiLSGZEy2qRXKNLiVNptNHb1Ok6Tdq2k/FxIgp+l/ns3NHbaLLrSCtiGaRYLrO7ItRyUpWS
 mB7XijgGV6yR1Tq2qOWyWFX6GUEff0yfrBUSW1EoQyjWyr4OpMbK2VOqJOG0ICQI+s9bjJGs
 z0C/EN/Ud3rBj4dNk9Jc2d/hLXTZbt38wo8mp+lExbvX09u1ktxL4kCE7QAjbrqlDP+hWVe0
 yvko69D4+59kO+/d9Oa0v8yezZ/yKR4qI6ynI1eczN3hu5xnmS+qafy3/tBHnXNf6NHs16sz
 JkO8K+Wj3y6M9sd3MI3O/ZsjdqVuIBREoloVpcT1iar/APiNBupZAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0hTcRiH+5+7q8VhiR20ciy6GVmSxhvdP0SnIPFbEEUd6tCGc5NNVxaB
 zmWlaWWZaGrLYi43dW0V3VYy0zK7WNq8sCxHhKIp1GZO7TKNvrw8/H4vz/vlZXCZlYxmVJoM
 UacR1ApKQkiSN+Su0v6MU645V4ZBMHCGgIoGOwXt9TYE9js5GAw274CusWEEk6/f4lBa0o7g
 ev9HHO609CFwW40UdHyZC53BUQpaSwooyL3RQMG7oSkMfFeKMbA5d8Mny1cC2i5UY1A6SMHV
 0lwsPAYwCFlqabBkLwG/tZyGqf4EaO3zktBU2UqCu3cllFX5KHjsbiWg5b4fg46HFRT02f+Q
 0NbygoCxohhov1hIQt1INQVDYxYcLMFRGt43mjFoMUeBwxS25v34TcLzwkYM8m7exqCz5xGC
 J2c+Y+C0eyloCg5j4HKW4DBR04zAX/SNhlPnQjRczSlCUHDqCgEmXxJMjocvVwYSIOeag4C6
 X160dTNvr7Ijvml4FOdNrqP8RPADxbvHzAT/sprjH5R/pHnTk16aNzszeZc1jr/xeBDjr38P
 kryz9izFO78X03z+t06MH3nzhk5ZuFey8bCoVhlE3erNByVKX7GJTL9LH7PVGKlsZKLyUQTD
 sYnc7eDADFPsMq67O4RPcyQr51yFX8l8JGFw1jub66rsQfmIYeaxydzT0KppJNgl3Gd/5vS6
 lF3HeSuM6J8ylrM5Gmc0EeG8t6BpJpexSVynrYq4gCRmNKsWRao0hjRBpU6K16cqszSqY/GH
 tGlOFP4fy8mpi/dRoGOHB7EMUsyROtwrlDJSMOiz0jyIY3BFpLTWtVwpkx4Wso6LOu0BXaZa
 1HtQDEMo5kt37REPytgjQoaYKorpou5/izER0dkoj1ikXe4jy18dvSQ/0nPPEUjWe9p6Uyrk
 gQFOPWQYGCnzpHwyVj413jq0Uc5t2yRX9V+6VVOfsSs5dXbq5f2vZUu3ywdjG4joqIlHokxT
 tFU4fX5f4vjatmYrPdl/YtlueygxVrVgjnnc//PtUu3ahsW+vp2GkzHrvSlbop79FhSEXikk
 xOE6vfAXpIb+UzsDAAA=
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
consideration to waitqueue wait, assuming an input 'ret' in
___wait_event() macro is used as a timeout value.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/wait.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/wait.h b/include/linux/wait.h
index aae161e500dc..e77344a8160d 100644
--- a/include/linux/wait.h
+++ b/include/linux/wait.h
@@ -304,7 +304,7 @@ extern void init_wait_entry(struct wait_queue_entry *wq_entry, int flags);
 	struct wait_queue_entry __wq_entry;					\
 	long __ret = ret;	/* explicit shadow */				\
 										\
-	sdt_might_sleep_start(NULL);						\
+	sdt_might_sleep_start_timeout(NULL, __ret);				\
 	init_wait_entry(&__wq_entry, exclusive ? WQ_FLAG_EXCLUSIVE : 0);	\
 	for (;;) {								\
 		long __int = prepare_to_wait_event(&wq_head, &__wq_entry, state);\
-- 
2.17.1

