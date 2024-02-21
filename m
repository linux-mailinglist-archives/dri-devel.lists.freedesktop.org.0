Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DE485D456
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 10:50:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C0D010E6B8;
	Wed, 21 Feb 2024 09:50:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9A18810E6B0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 09:49:51 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-a8-65d5c73ab21f
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
 linux-fsdevel@vger.kernel.org, viro@zeniv.linux.org.uk, jack@suse.cz,
 jlayton@kernel.org, dan.j.williams@intel.com, hch@infradead.org,
 djwong@kernel.org, dri-devel@lists.freedesktop.org,
 rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 hamohammed.sa@gmail.com, 42.hyeyoo@gmail.com, chris.p.wilson@intel.com,
 gwan-gyeong.mun@intel.com, max.byungchul.park@gmail.com,
 boqun.feng@gmail.com, longman@redhat.com, hdanton@sina.com,
 her0gyugyu@gmail.com
Subject: [PATCH v12 18/27] dept: Apply timeout consideration to swait
Date: Wed, 21 Feb 2024 18:49:24 +0900
Message-Id: <20240221094933.36348-19-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240221094933.36348-1-byungchul@sk.com>
References: <20240221094933.36348-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSW0xTWRSG3fucs8+hWnOsTtxqjKbe4oXbjJglMeqLcUdj1Jh5wWS0ygl0
 hlvK3WgsgjcQIiSlCqjc7FRgBAsyOlzSgXDTqDAUBgwwSIgOsQUFS0QQLRhfVv7861/f/7Ik
 TvNYWCnpI2IUQ4QuTEtUvMq1qNA7sKVL8at68BNkXvMD94crPOSVlxFov1+KoKwqCcNI0374
 d9KJYPrZCw7MpnYEBa/6OahqHkBQZ71AoHN4MTjcYwTaTGkEkovKCXS8ncHQl52FodR2CJ5e
 L8Rgn3rDg3mEQK45GXvG/ximLCUiWIwbYMiaI8LMK39oG+gWoO7lVrh5u49AbV0bD82PhjB0
 /pVHYKDsiwBPm1t5aM9MF+CP0UICbyctHFjcYyL8Y8/HUJHiAV2amBWgJd2O4VLxAwyO3hoE
 9VcGMdjKugk0up0YKm0mDj793oRgKMMlwsVrUyLkJmUgSLuYzcOLzy0CpPQFwPTHPLI3kDU6
 xziWUhnP6ibzefakkLLHOf0iS6l/KbJ8WyyrtG5hRbUjmBWMuwVmK7lKmG08S2SpLgdmo8+f
 i6z1xjTPhh1mfGRVkGpXsBKmj1MMvrtPqkLLh5NQ1ARJMDcVC0b0REhFXhKVt9NOZwX3XQ8O
 GtGcJvIm2tMzNe8vk9fSyvTXnrxK4uTLC6n13TOSiiRpqbyPzphWz0le3kAz02Pn4mp5B3V1
 VPPfkGtoaYV9HuPl8e/lOudrNXIA7ep4yM0hqZzsRXvtNeTbwQr6t7WHv47U+WhBCdLoI+LC
 dfqw7T6hiRH6BJ/TkeE25Hkoy7mZ44/QePuxBiRLSLtIHfqnQ9EIurjoxPAGRCVOu0zNx3ss
 dbAu8YxiiDxhiA1TohvQKonXLlf/OBkfrJFDdDHKb4oSpRi+b7HktdKIIKCx+P2tg+fv7dj2
 g6urev3hWZzr2jlxl1yt7t9YMLo70H9t7Js8Rwx1n+8N0f6aYxnM2LN4qa/cHHAyEpPWA0rQ
 l4xftg7oJxxZxUfP3PGVgl3Lxxbu/Zmamv47VR1ybMVpY3Yrsy65L58tjdLtSThbu1lQMr3X
 Bc2mNWy79fqmlo8O1flv4QzRuq8dqHy0TAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSfUzMcRzHfX/PXc5+Tls/ysPOjJGnTXxGHuapL8P4izF047c6dWV3rgcP
 WykkwmU5unAqJxWdK4Rqt86VPFW6ItLSmvQkK9fUXXEx/3z22vvz3uvzz4cjZQZ6CqeMPCKq
 IxURckZCSbatSJy/vKpBXNTY5Q+684vA+TOZgszCAgZq7+cjKChOIKDTHgzvB3sQuN7UkKBP
 r0Vw68tnEoorWxCU5Z5koL59AjicfQxUp59jIDG7kIG6bjcBzVfSCMi3bIVXl7IIsA51UKDv
 ZMCgTyQ84xsBQ6Y8Fkzxs6AtN4MF95fFUN3SSIPtejUNZR/nwbUbzQyUllVTUFnSRkD900wG
 Wgp+0/Cq8gUFtbpUGu59z2Kge9BEgsnZx8I7q5EAc5LHdnpglIaqVCsBp3MeEOBoeoagPLmV
 AEtBIwM2Zw8BRZZ0Eobv2BG0Xehl4dT5IRYMCRcQnDt1hYKakSoakpoDwfUrk1mzAtt6+kic
 VBSDywaNFH6ZJeAnGZ9ZnFT+kcVGixYX5c7F2aWdBL7V76SxJe8sgy39aSxO6XUQ+Pvbtyx+
 cdVF4XaHntjuv1sSdFCMUEaL6oWrQiRhhe0J6PAAE6u359Dx6CWdgrw4gV8itLbGozFm+NnC
 hw9D5Bj78DOEotSvno6EI/kz3kLujzdMCuK4SfwGwZ0+dQwpfpagS9WO1aX8UqG37hH1Tzld
 yDdb/2q8PPldQ8/fUzI+UGioe0heQhIjGpeHfJSR0SqFMiJwgSY8LC5SGbvgQJTKgjwvYzrh
 1pWgn/XBFYjnkHy8NOyxQ5TRimhNnKoCCRwp95FSMZ5IelARd1RUR+1XayNETQXy4yi5r3Tz
 TjFExocqjojhonhYVP/fEpzXlHiUuMxuG3zNn1WZr0/0PjSnyxj3PCMmfBc/fGxvoSEkSFd8
 Jz9oh7ZqpgOjhgDzqPVu077W4zW3NyVvK/XdQ9Mjq7/G5gX6l1+MjXLpbCrZWtc1bnil92Xr
 tPUnmi7aa9fd/J0yogkIWn/ULzh8wmUxZGNOWpT2k3my6OfuCB3dskVOacIUi+eSao3iD6uF
 AVEuAwAA
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
consideration to swait, assuming an input 'ret' in ___swait_event()
macro is used as a timeout value.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/swait.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/swait.h b/include/linux/swait.h
index 277ac74f61c3..233acdf55e9b 100644
--- a/include/linux/swait.h
+++ b/include/linux/swait.h
@@ -162,7 +162,7 @@ extern void finish_swait(struct swait_queue_head *q, struct swait_queue *wait);
 	struct swait_queue __wait;					\
 	long __ret = ret;						\
 									\
-	sdt_might_sleep_start(NULL);					\
+	sdt_might_sleep_start_timeout(NULL, __ret);			\
 	INIT_LIST_HEAD(&__wait.task_list);				\
 	for (;;) {							\
 		long __int = prepare_to_swait_event(&wq, &__wait, state);\
-- 
2.17.1

