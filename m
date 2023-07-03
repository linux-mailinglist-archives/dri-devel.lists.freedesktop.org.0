Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 647F0745914
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 11:50:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD2BF10E1F7;
	Mon,  3 Jul 2023 09:49:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id D130810E1FA
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 09:49:44 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-1b-64a299b4ca43
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v10 rebased on v6.4 20/25] dept: Apply timeout consideration
 to waitqueue wait
Date: Mon,  3 Jul 2023 18:47:47 +0900
Message-Id: <20230703094752.79269-21-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230703094752.79269-1-byungchul@sk.com>
References: <20230703094752.79269-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0hTcRjG+//P1eXksIxOCRUjK4wuVtpL9yjofAm6fBAyqtEOOZpm07x0
 Ic1puVKyWOal2qbMpZY1DTJTluWti1mNXGaSYhfLtbK2nNPKGX15+fE8PL9PL0vIaqkZrCou
 UdTEKdRyWkJKnIHGhTUFJuWSz0WhkHd2Cbh/niahuKqSho4bFQgqa9IxDDRthk7PIALf02cE
 5Os7EBh73xJQ09yDoN5ykoaX/UFgd7toaNOfoSGjpIqG519GMXRfPI+hwroFHp8zYbB5P5KQ
 P0BDUX4GHj+fMHjN5QyY00Khz1LIwGhvOLT1vKKgvmsBFFzppuFefRsJzXf6MLy8W0xDT+Uf
 Ch43t5LQkZdDwfWvJhq+eMwEmN0uBl7YDBhuasdFWT9+U9CSY8OQVXoLg/11HYKG0+8wWCtf
 0fDAPYih2qonYKSsCUFfrpOBzLNeBorScxGcybxIwrOxFgq03RHgGy6m168UHgy6CEFbnSzU
 ewyk8MjEC7WFbxlB29DFCAbrYaHaEiaU3BvAgnHITQnW8mxasA6dZwSd046Fr+3tjNB6yUcK
 /fZ8vDVkp2S1UlSrkkTN4rV7JTGG7y4q/jaTcnlAnYa0tA4FsDy3nM9y6RgdYidYrw33xzQ3
 j3c4vISfg7nZfHXOB0qHJCzBnZrMW749ndhO4Xbz+mwL6WeSC+Vr655TfpZykXxhlxb/88/i
 K27aJkQB4/n74VzkZxkXwXcX9NB+Kc9dCODLHOnMv8F0/r7FQZ5DUgOaVI5kqrikWIVKvXxR
 TGqcKmXRvoOxVjT+UObjo9F30FDHjkbEsUgeKHUcNSpllCIpITW2EfEsIQ+WZvReVcqkSkXq
 EVFzcI/msFpMaEQhLCmfJl3qSVbKuP2KRPGAKMaLmv8tZgNmpKGZ3zuL44Pmt09NnJUH22SR
 I56N+1d37S4X2+csDFtz+8nm+7vG1hH2DSuOrfQtrlMf1w/WnfBlJoJv+x+j7RDv1D+sckp8
 1rFNpSdq31y/JmkxSdelHWUvVPRnZ0+ZHeVtjZirCJMkhxs/yH8t+2Tu3NCmCYoqiWSaWne+
 S1kV7ZGTCTGK8DBCk6D4CxOfu69MAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAAzXSbUxTZxgG4L3vOec9h47iSUe2EzHTdFGjiw4WWZ4FZ/jnmxnFHxq/EqXa
 E6mWj7TSibqsjoqKgEBSkIJa0NQK+HVA5wcQUkK1GhRGwxgpjZBu2oBWHSV04CZdsj9Prtx3
 cv96BEZTzy0UDHmHZFOezqglKla1KaN4VXtdkz614noSVJWlQnTqFAsNN1oJ9F9vQdDafhxD
 uHc9/DY9iWC27xkDtfZ+BI1jowy0e4MIOt0/ExgMJYE/GiHgs58hUHzpBoGBiTkMgZpqDC3K
 RnhS2YShO/aChdowgfraYjx/XmKIuZp5cFmXwrjbwcPcWBr4gkMc9Jz3cdA58iXUXQgQ6Oj0
 seC9O45h8H4DgWDrvxw88T5iob+qnINrr5sITEy7GHBFIzz82u3EcNM2v1by1z8cPCzvxlBy
 +RYG/+8PEHSdeo5BaR0i0BOdxNCm2Bn4+0ovgvGKVzycKIvxUH+8AsGZEzUsPHv/kANbIB1m
 ZxpIZgbtmYww1Nb2A+2cdrL0cZNE7zlGeWrrGuGpUymkbe6V9FJHGNPGd1GOKs2nCVXeVfO0
 9JUf09dPn/L00blZlob8tXjzop2qtXrZaLDIpq/WZatynG8jXMFt/vD5sNGKbKQUCYIkrpHs
 trRSlCAQcbk0PBxj4k4Wl0ht5X9ypUglMOLJjyX3mz4SLz4Rd0v20242blZcKt17MMDFrRa/
 kRwjNhy3JC6WWm52/zeUMJ//MVOB4taI6VKgLkgqkcqJPmpGyYY8S67OYExfbT6YU5RnOLx6
 X36uguZfxvXjXNVdNDW43oNEAWkT1cNHG/UaTmcxF+V6kCQw2mR18dhFvUat1xUdkU35e0yF
 RtnsQSkCq/1M/f02OVsj7tcdkg/KcoFs+r/FQsJCK+rYzmd/+8XU2O7exmOh54o1K3ONEFo2
 6svKVD5dsS2xK+WnBZUHet9zBrpKP/vmTp+y6BerumrL3kDGnQmLY+ZxamK1ZkflUMmGwmDA
 U7AYq7d+Hrq6I99bMuA4W7bL8XX6dE312mX6cU34O2nnvpSI721Z0hFv1rqY09Lv9yw5oGXN
 Obq0lYzJrPsA5RcDsy4DAAA=
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
consideration to waitqueue wait, assuming an input 'ret' in
___wait_event() macro is used as a timeout value.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/wait.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/wait.h b/include/linux/wait.h
index ff349e609da7..aa1bd964be1e 100644
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

