Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FF078222B
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 06:05:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 519BF10E198;
	Mon, 21 Aug 2023 04:05:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2CE8310E18E
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 04:05:01 +0000 (UTC)
X-AuditID: a67dfc5b-d6dff70000001748-4b-64e2ded7e715
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v10 22/25] dept: Apply timeout consideration to dma
 fence wait
Date: Mon, 21 Aug 2023 12:46:34 +0900
Message-Id: <20230821034637.34630-23-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230821034637.34630-1-byungchul@sk.com>
References: <20230821034637.34630-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSfUzMcRzH+35/j3ec/bps/ZSNnRnzWCb7uJnxl68/jA2bp03H/aabq+wu
 kc0cnZCKbBVp9KBz60q6y0ZPS3RJylESq3QnlEocl1Ie7ph/Pnvt/Xm/33+9eUpZxYTxurgE
 yRCn0atYOS0fmV6w9GWvRxtxJz0UMtMiwPftLA155aUsuG7ZEJRWnsQw2LgBXo4NI5hsfUpB
 TpYLQYG7h4JKZy+CWuspFtr7Z0CHb5SF5qzzLCQXlbPwbGgKQ3f2JQw2+yZouViIoX7iAw05
 gyxczUnG/jOAYcJSwoHFNB881lwOptyR0NzbyUDt68Vw5Vo3CzW1zTQ473owtFflsdBb+puB
 FucjGlyZ6QyUfSpkYWjMQoHFN8rB8/p8DLfN/qKUr78YaEqvx5ByowJDx6tqBHVn+zDYSztZ
 eOAbxuCwZ1Hw42YjAk/GCAen0yY4uHoyA8H509k0PP3ZxIC5Owomx/PYdWryYHiUImbHEVI7
 lk+Tx4UiuZfbwxFz3WuO5NsPE4d1ESmqGcSkwOtjiL3kHEvs3kscSR3pwORTWxtHHl2epEl/
 Rw7eEr5LvkYr6XWJkmH52mh5jNf1EB1q5492TQ7QJmTjUpGMF4WVYm52Bfufh8d/0QFmhQVi
 V9cEFeCZwlzRkf6eSUVynhLOTBOtn1v9AZ4PEbaLTa2JAQ8tzBdTPO//+hXCKvFCaj/zr3OO
 aLtd/1eX+XV7dRUKsFKIEr+439KBTlFIlolPyl5Q/wKzxPvWLvoiUuSjoBKk1MUlxmp0+pXL
 YpLidEeX7Y+PtSP/oizHp3bfRV7X1gYk8Eg1XRE926NVMppEY1JsAxJ5SjVTEf7drVUqtJqk
 Y5Ihfq/hsF4yNqBwnlaFKlaMHdEqhQOaBOmgJB2SDP+/mJeFmdD11TsHFjpHfj4v64m58Wy2
 2lGu//2uu3LXuLdGrebrQGlyFDWmtYSEzvW1hUV22va1qBVy1UdzXXjbeqmy+ERmyHJcdm/a
 mye5OOj7jJ4+t7NItzl49auhtzfp4o26iIipkBRjYfS8HcF79M74ajK0LWO7KWqJEJTQt2mb
 jBxQ0cYYTeQiymDU/AGjhYT/TQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0iTYRzFe967q9XLsnwxoVhZoGUZGX8oog9RD2WXL9GFLq72ksOptenS
 ILBcVksrJV3pCi+1xK3UKeUd8zK10FaKWajolFKcWea8pFla9OXw45zD+XQ4UmaivTlVRJSo
 iVCo5YyEkhzYFr+hvdup3FTwajskJ24C99gNCkz5VgYczy0IrMVXCBis3wMfxl0IppvfkmBM
 dSDI6u0iodjejaAy9yoDrf2Loc09wkBT6i0G4nPyGXg3NENAZ1oKARbbfnhzN5uA6qkvFBgH
 GcgwxhNzMkDAlDmPBXOcLzhz01mY6Q2Epu52GmofNtFQ+ckfHjzqZKCisokCe4mTgNYyEwPd
 1t80vLE3UuBITqLh2ddsBobGzSSY3SMsvK/OJKBAP7eW8GOWhoakagISHhcS0PaxHEHVjR4C
 bNZ2BmrdLgKKbKkk/Hxaj8B5e5iFa4lTLGRcuY3g1rU0Ct7+aqBB3xkE05MmZuc2XOsaIbG+
 6CKuHM+k8OtsAZemd7FYX/WJxZm2aFyU64dzKgYJnDXqprEt7yaDbaMpLDYMtxH4a0sLixvv
 T1O4v81IHPI5LtmuFNUqnajZuCNEEjrqqEPnW7mYjukBKg5ZWAPy4AR+i+CanKXmmeHXCR0d
 U+Q8e/KrhKKkz7QBSTiSv75QyP3WzBgQxy3lDwsNzbr5DsX7CgnOz3/7Un6rcMfQT//bXClY
 Cqr/+h5zvq28DM2zjA8Svvf2UXeRJBMtyEOeqghduEKlDgrQhoXGRqhiAs5GhtvQ3GfMl2eS
 S9BY654axHNIvkga4uNUymiFThsbXoMEjpR7SldM9CplUqUi9pKoiTytiVaL2hq0gqPkXtK9
 R8QQGX9OESWGieJ5UfM/JTgP7zgUXEy+DKlfnxj2sLCr6lvcJW+vfUt+h6dGzVJHJwKX+YHx
 zNofi+0XNI4c8VdaSt1qemHOfS54eY8+YPcahevEk80TWfvqU4IPemlKs0NLlhXGqDf0+VIX
 n/pPlmnx0M9j9IuTBTM+6FWiyevUjtd9Y5cHrIFjlsgK/T37ro8tEzo5pQ1VBPqRGq3iD+kT
 KhIvAwAA
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

Now that CONFIG_DEPT_AGGRESSIVE_TIMEOUT_WAIT was introduced, apply the
consideration to dma fence wait.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 drivers/dma-buf/dma-fence.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index ad2d7a94c868..ab10b228a147 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -783,7 +783,7 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
 	cb.task = current;
 	list_add(&cb.base.node, &fence->cb_list);
 
-	sdt_might_sleep_start(NULL);
+	sdt_might_sleep_start_timeout(NULL, timeout);
 	while (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags) && ret > 0) {
 		if (intr)
 			__set_current_state(TASK_INTERRUPTIBLE);
@@ -887,7 +887,7 @@ dma_fence_wait_any_timeout(struct dma_fence **fences, uint32_t count,
 		}
 	}
 
-	sdt_might_sleep_start(NULL);
+	sdt_might_sleep_start_timeout(NULL, timeout);
 	while (ret > 0) {
 		if (intr)
 			set_current_state(TASK_INTERRUPTIBLE);
-- 
2.17.1

