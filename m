Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D233782233
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 06:05:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6D9910E1A5;
	Mon, 21 Aug 2023 04:05:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.hynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 078D410E192
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 04:05:00 +0000 (UTC)
X-AuditID: a67dfc5b-d6dff70000001748-3b-64e2ded6c3cd
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v10 21/25] dept: Apply timeout consideration to
 hashed-waitqueue wait
Date: Mon, 21 Aug 2023 12:46:33 +0900
Message-Id: <20230821034637.34630-22-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230821034637.34630-1-byungchul@sk.com>
References: <20230821034637.34630-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAz2SbUxTZxTH9zz3tZVuN5VkV6pzaUKWsIhKZDshxi3ZB+5cfEmWmOgwckdv
 pLGgKe9sJCCIyJugAr6gASS1owxYIQtDq7UEEBEoQrAyaNbOTYkUEGmhwsRW476c/HL+//P7
 dFhC2UWFsdrkVEmfLOrUtJyUe0LqtzxyujXb7PMfQWXpNvAuFpFQ29pMg73FhKC5Iw/DdE8s
 PPLNIFgZHCagpsqOoN41RUBHrxOBxXiShtEnH8KYd46G/qoSGvKvt9Iw8nwVw2T1OQwm8x4Y
 qGjAYPU/JaFmmoYrNfk4MJ5h8BuaGDDkhoPbeJmBVdd26HeOU2CZ+BwuXZuk4Zaln4TeTjeG
 0a5aGpzNaxQM9N4jwV5ZRsGvsw00PPcZCDB45xh4aK3D0FYQEBW+fE1BX5kVQ2HjbxjGHt9E
 cLvoLwzm5nEaur0zGNrNVQS8utGDwF3uYeBUqZ+BK3nlCEpOVZMw/F8fBQWT0bCyXEt/HSN0
 z8wRQkF7hmDx1ZHC/QZe+OPyFCMU3J5ghDpzmtBujBCu35rGQv2ClxLMTWdowbxwjhGKPWNY
 mB0aYoR7F1dI4clYDd6vOiTfqZF02nRJv3VXvDzxQX4rOlHOZM5PluFc5KKKkYzluR38RYPv
 f24842eCTHOf8Q6HnwhyKPcp3172b6AjZwnu9DreOD9IB4P1XBxf2lj5tkRy4XzVyzWyGLGs
 gvuCL16OeufczJvarG8rssDafLMLBVnJRfMvXH+TQSfPnZbx18ZbyXcHG/i7RgdZgRR16IMm
 pNQmpyeJWt2OyMSsZG1mZMLxJDMKfJQhZ/WHTrRg/96GOBapQxTxG90aJSWmp2Ql2RDPEupQ
 hWrJpVEqNGJWtqQ/fkSfppNSbEjFkuqPFVG+DI2SOyqmSsck6YSkf59iVhaWi1QHY4+s2219
 hl/9WX54yWH65cC3ewfrOzzOuJ91mbbYsImRTTlrRU2pXz422aJzXvzYvSGOVryOiDTsPTqk
 OrilsGdxoeWnhL6ctu9kYnbF+Y0olOpskNTRloTfYw7/07JoCv/m6qLh7Fe7Yz65c0EZc0MM
 UZYMWfd1xFef93QtOdRqMiVR3B5B6FPEN1LS1UdNAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0hTcRjG+//PdavFYS06qFSspDCyq/GCIVJRp6Dok0EEemgnXW1qW1kW
 krVZampOmlZamMoaallHP1ReEDVTu1maXbDVllSmpZnTpnaZRV9efjzPj+fTyxLqIiqA1ccf
 kkzxokFLK0nljnDL8h6XR7eyPCMMbFkrwTuaTkJRVSUNnTcqEFTWnMTQf28LvBgbRDD56AkB
 BfZOBFfdbwioaXUhqHeeoqGrbzZ0e4doaLefpcFSWkXD04EpDL35eRgq5O3wILcEQ6PvIwkF
 /TQUFliw/3zC4HOUM+BIDQaP8xIDU+5V0O7qoaD5cjsF9a+XwcUrvTTU1beT0Hrbg6HrbhEN
 rsrfFDxobSOh05ZNwfWvJTQMjDkIcHiHGHjWWIzhptW/dvr7LwruZzdiOF12C0P3q1oEDenv
 MMiVPTQ0ewcxVMt2Aiau3UPgyfnCQFqWj4HCkzkIzqblk/Dk530KrL1hMPmjiI4MF5oHhwjB
 Wn1EqB8rJoWOEl64c+kNI1gbXjNCsXxYqHaGCKV1/Vi4OuKlBLk8gxbkkTxGyPzSjYWvjx8z
 QtuFSVLo6y7AO4N2K9frJIM+STKtiIhRxj20VKHEHObocG82TkVuKhMpWJ5by5dl+Jhpprkl
 /MuXPmKaNdxCvjr7g99RsgR3ZibvHH5ETxdzuD18Vpntr0Rywbz9+28yE7GsilvHZ/5Y/W9z
 AV9xs/GvovDHcu1dNM1qLoz/5n5P5iJlMZpRjjT6+CSjqDeEhZoPxCXH64+G7k0wysj/M46U
 KdttNNq1pQlxLNLOUsUEeXRqSkwyJxubEM8SWo0qcNytU6t0YvIxyZQQbTpskMxNKJAltfNU
 23ZJMWouVjwkHZCkRMn0v8WsIiAVHT9ReCSAjX12rKll88T8O/I5UVxvjJ2lMKifvhpZOtFs
 j7ZEuT6btrZcTnqHJna/tQWtmaNYPehJHkiJHI/c2aGLiHYMkVHplh2+utwsKzdT6zRvCCzV
 JEZpckznh888n1zUYEl5P7t2Q/jFwrzFGzf1Ldo+d9/+4Nj8gyVrricYtaQ5TlwVQpjM4h/H
 eh1gLwMAAA==
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
consideration to hashed-waitqueue wait, assuming an input 'ret' in
___wait_var_event() macro is used as a timeout value.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/wait_bit.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/wait_bit.h b/include/linux/wait_bit.h
index fe89282c3e96..3ef450d9a7c5 100644
--- a/include/linux/wait_bit.h
+++ b/include/linux/wait_bit.h
@@ -247,7 +247,7 @@ extern wait_queue_head_t *__var_waitqueue(void *p);
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

