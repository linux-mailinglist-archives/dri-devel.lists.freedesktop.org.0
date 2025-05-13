Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A95D0AB51FE
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 12:23:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B227910E554;
	Tue, 13 May 2025 10:23:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.hynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id C5B5610E556
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 10:23:08 +0000 (UTC)
X-AuditID: a67dfc5b-681ff7000002311f-1c-682319f07f07
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
Subject: [PATCH v15 22/43] dept: apply timeout consideration to
 hashed-waitqueue wait
Date: Tue, 13 May 2025 19:07:09 +0900
Message-Id: <20250513100730.12664-23-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250513100730.12664-1-byungchul@sk.com>
References: <20250513100730.12664-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSeUiTcRjH/b3ntly8ruttRcdECiXLqHigg4igH1TQSZGRjXxxI7XayjII
 tKaVtqWS2aG1NNbSeTSje2WKSzOvtKWlplLRcB6YWy212jr+efjw/T7f7/PPIyJlL2i5SB1/
 WNDEK2MVjISS9AfmLxiaHqxa1N0ZBu6RMxTklloYaCopQmC5m0yAs3odvPW4EIzWN5KQk92E
 4EZPJwl37V0IbOaTDLR8nAit7kEGarPTGThVUMpAc98YAR0Xswgosm6ED6bPFNRl5BOQ42Tg
 as4pwje+EOA1FbJgSgqBXvMVFsZ6IqC2y0GD7V0YXL7WwcATWy0F9ge9BLQ8ymWgy/KLhjp7
 DQUewwxoytTTUDyQz0Cfx0SCyT3IwusKIwF241Qo0/kKU7/+pOGFvoKA1Jt3CGhtf4zg6Zlu
 AqwWBwNVbhcB5dZsEn7cqkbQa+hnIeWcl4WryQYE6SkXKdB1LIXR777LeSMRkHy9jILicQda
 vRJbrlkQrnINklhXfhT/cL9hsM1jpPDLfB4/vNLJYt3Tdyw2Wo/gcnMoLnjiJPCNYTeNrYVn
 GWwdzmJxWn8rgQcaGthNM3dJVkQLseoEQbNw1V6J6lv6xoMG9tinskw6CfXQaUgs4rklvCu3
 lv3Phux7f5jh5vFtbV7Sz5O5OXy5/rNvXyIiOccE/m1eO/Ibk7jtfN1oDeNnigvhL7T9DUu5
 ZbzRfvtf6Wy+qKziT5HYp4/faqD8LOOW8hnGIspfynPnxXy3d+RfYDr/3NxGZSCpEQUUIpk6
 PiFOqY5dEq5KjFcfC993IM6KfO9lOjEW+QANN22tRJwIKQKlNc65KhmtTNAmxlUiXkQqJkuT
 7/skabQy8bigORClORIraCvRDBGlmCZd7DkaLeNilIeF/YJwUND8dwmRWJ6EQmat6c1srjih
 n2KO1uaW1ttcQwhdYj9VdQbIg8RU6Eum+1Dws6H2pILN9bvCnHWB1RtaOmK2ffXOX/detyYg
 IG4nEZyVsl7u6XuGI7es3RPUOjDe2GjShy2P+vbqcqrj3unmgeMXPj6PqW9I21ESPKjrKg5X
 uoL2pcij5i9b7tytoLQqZUQoqdEqfwNddHR5WgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSf0yMcRzHfZ/fnY5HGo/McNUME43aZ0Mz/3j8yPKH2fxTz3jmbv2QOyIb
 7nQapVs1aeh4Kq6rOzpXC6mW2p3SJEqlJWr6caSMLuoq7ph/Pnvt/f583u9/PgweUEoGMaqk
 k6I6SUhQUDJCtn9r2oZvy4KVmzLMi8A9cZmAgnIrBW0PLAislToMXI5d0DU5isDz8hUO+Xlt
 CAr73+NQ6exDUGu+SEH7pwXQ4R6noDkvk4K04nIKXn+ZwaD3ei4GFns0fDANEdCSXYRBvouC
 W/lpmHeMYDBlKqPBpA2FAfNNGmb6w6G5r5OERmMzCbU96+HG7V4KamqbCXA+HsCgvbqAgj7r
 bxJanE0ETBqWQ1tOFgn3x4oo+DJpwsHkHqfhTb2EgVNaAja9NzX9xxwJz7PqMUi/+xCDjndP
 EdRd/oiB3dpJQaN7FIMKex4O0yUOBAOGrzRcujpFwy2dAUHmpesE6HsjwPPL22ycCAfdHRsB
 92c70Y4o3nrbivjG0XGc11ec5qfdbym+dlIi+BdFHP/k5nua19f10LxkP8VXmNfxxTUujC/8
 7iZ5e9kVird/z6X5jK8dGD/W2krHrDgs23ZUTFCliOqNUXEy5c/M6GQDfWbQlkNqUT+ZgfwY
 jt3CGfKqaB9T7Bquu3sK93Egu4qryBry7sgYnO2cz3UZ3yGfsZg9yLV4migfE2wod63737Gc
 jeQkZyn9L3QlZ7HV/w3y8+qzJa2EjwPYCC5bshDZSCaheWUoUJWUkiioEiLCNPHK1CTVmbAj
 xxPtyPtApnMzOY/RRPuuBsQySOEvb3KtVgaQQoomNbEBcQyuCJTrHnkl+VEh9ayoPh6rPpUg
 ahrQcoZQLJXvOSTGBbDHhJNivCgmi+r/Lsb4BWmR7pq2arDyhH270ba2KlLRXliwcXN99YqB
 rkht0KDNP7b00O6R15mekD3PttY4733ev3A6bM3VF8Pn5jadiO6xDOmpp9r0RiadC5kX/1Iq
 959ft/TCcKDVodog7ZRX++cKqa6+6mCP2VgS5eBmw87vFX7F5B6IcbyK2bdTNTeWHKwgNEoh
 fB2u1gh/ACisQUA8AwAA
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
consideration to hashed-waitqueue wait, assuming an input 'ret' in
___wait_var_event() macro is used as a timeout value.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/wait_bit.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/wait_bit.h b/include/linux/wait_bit.h
index 179a616ad245..9885ac4e1ded 100644
--- a/include/linux/wait_bit.h
+++ b/include/linux/wait_bit.h
@@ -258,7 +258,7 @@ extern wait_queue_head_t *__var_waitqueue(void *p);
 	struct wait_bit_queue_entry __wbq_entry;			\
 	long __ret = ret; /* explicit shadow */				\
 									\
-	sdt_might_sleep_start(NULL);					\
+	sdt_might_sleep_start_timeout(NULL, __ret);			\
 	init_wait_var_entry(&__wbq_entry, var,				\
 			    exclusive ? WQ_FLAG_EXCLUSIVE : 0);		\
 	for (;;) {							\
-- 
2.17.1

