Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9BF8BFA0F
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 12:03:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B69A11354B;
	Wed,  8 May 2024 10:03:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id B76E7113533
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 10:02:55 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-f6-663b4a3a5441
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
 melissa.srw@gmail.com, hamohammed.sa@gmail.com, 42.hyeyoo@gmail.com,
 chris.p.wilson@intel.com, gwan-gyeong.mun@intel.com,
 max.byungchul.park@gmail.com, boqun.feng@gmail.com, longman@redhat.com,
 hdanton@sina.com, her0gyugyu@gmail.com
Subject: [PATCH v14 14/28] dept: Apply sdt_might_sleep_{start,
 end}() to hashed-waitqueue wait
Date: Wed,  8 May 2024 18:47:11 +0900
Message-Id: <20240508094726.35754-15-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240508094726.35754-1-byungchul@sk.com>
References: <20240508094726.35754-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAz3Sa0yTZxQHcJ73TkP1tcPwjpFMmxAVM4YG9UxxMYbpM4mJ15hIjOvgReoA
 tVUQGQlIuchFgQWqgKaAKRWqaOEDIrgKgiApdti4QrhMNCIKNDKK1lY3Ltm+nPxyLv9PhyNl
 jbQ/p0w4LaoSFHFyRkJJJn0qv9m8a0tMSEuXHIryQ8A5k0NBRb2RAeutOgTGxnQCxjt2wp+z
 EwjclickaEusCCqfD5HQ2DmMoNVwnoGnL5eAzelgoLskj4GM6noG/njrIWCwtJiAOtNu6Cms
 IsDsGqNAO85AuTaDmCuvCXDpa1nQpwXCqKGMBc/zddA9/IyG1oG1cOXaIAMtrd0UdDaNEvC0
 uYKBYeM/NPR0dlFgLSqg4eZUFQNvZ/Uk6J0OFvrMOgJua+aCsv7+TMOjAjMBWdfvEGDrv4fg
 fs5fBJiMzxhod04Q0GAqIeFjTQeC0YuTLGTmu1goT7+IIC+zlALN4AZwf6hgtn2H2yccJNY0
 JOHWWR2FH1cJ+G7ZEIs19wdYrDOdwQ2GIFzdMk7gymknjU21Fxhsmi5mce6kjcBTvb0s7rrs
 pvBLm5bY439YEhYtxikTRdW33/8kiR0bKqJP2rmznx7eZdOQnclF3pzAhwo5ngv/u/txDTlv
 hl8l2O2uBfvyK4SGglf0vEl+QiJc790x7y/4I8KlN5ULtxQfKDR35C1Yym8UjPZacjHza6Hu
 tnnB3nP9/rEpNG8Zv0G4l1HGLu7McMI7S8iivxQeGOxUIZLqkFctkikTEuMVyrjQ4NjkBOXZ
 4KgT8SY090v6VE9kE5q27m9DPIfkPlKz3+YYGa1IVCfHtyGBI+W+0o7sTTEyabQi+ZyoOnFU
 dSZOVLehrzhK7iddP5sULeOPKU6Lv4jiSVH135TgvP3T0KqIX90jL/rZlPOW0ON7jL+9dgR/
 6nuYfWnlVU3NgZ2HUlLKLafa8/22uX4PzxxYtjT8zkzA8oA1UXorrvuxuWmr9ENq8I0e2Sbf
 gvDtHvdItjpCu/GU3pP//oewnw2Wg9X12z/ug9V9LUntxie5tii/EMfezGmdV1ZAVuFIM3vj
 c6ScUscq1gWRKrXiX7YHUApHAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAAzXSbUhTYRQH8J778tzrcHFbUpcsymFUWmaQdUgrP1RejKRPBkLkqGsb6Yyt
 LKNAU3vRfFmhs2kyzaZt86XZB2taos5akVmKTVHJFak1FapJS3tRoy+HH+fP+X86LCnT06tY
 lfqMqFErkuVYQkniIrO27IqNTAofNfiD7kY4eL9fo6C8wYqhp96CwPowk4AJRwy8m/EgmH31
 mgR9cQ+CytFhEh52jSBorb2MoffjUujzTmNwFudhyLrbgOHNlzkChkpuEmCxHYKXRVUEtPnG
 KNBPYCjTZxHzY5wAn8nMgCljPbhrDQzMjW4D50g/DR13nDS0DobC7YohDC2tTgq6mt0E9D4u
 xzBi/UPDy67nFPTo8mmom6rC8GXGRILJO83A2zYjAY3Z821Xvv2m4Vl+GwFXqh8Q0DdgR/Dk
 2nsCbNZ+DB1eDwFNtmISftY4ELgLJhnIueFjoCyzAEFeTgkF2UMRMPujHEfvEjo806SQ3XRO
 aJ0xUsKLKl54ZBhmhOwng4xgtJ0VmmpDhLstE4RQ+dVLCzbzdSzYvt5khNzJPkKY6u5mhOel
 s5TwsU9PHA5MkESdEJNVaaJm655EiXJsWEefdrHnf3U+YjKQC+ciP5bntvPOFzXkgjG3gXe5
 fIsO4NbxTfmf6AWTnEfCV3cfWPBy7ihf+Lly8Zbi1vOPHXmLlnI7eKvLTP7rXMtbGtsW7Te/
 HxibQguWcRG8PcvAFCGJES0xowCVOi1FoUqOCNOeUqarVefDjqem2ND8u5guzema0ffemHbE
 sUjuL+3BkUkyWpGmTU9pRzxLygOkjqs7k2TSE4r0C6Im9ZjmbLKobUeBLCVfKY09IibKuJOK
 M+IpUTwtav6nBOu3KgPdWmNsiJIlRLGdIUFGd2Vzp8VdOG738RmpG+/tV45Z64I6Vw+Nh81J
 YoJn7YV5xvCZ+44PdRWeUX1w2Yr6Bl0MUicESrfmuEyOZZveXdzydJ9oie6ofmvGObilsDRX
 0zWy+fUOZf/uB6b4fH9laFzB3vZ936IO2uNDDSm/42k5pVUqtoWQGq3iL4Oqv/cqAwAA
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

Makes Dept able to track dependencies by hashed-waitqueue waits.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/wait_bit.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/wait_bit.h b/include/linux/wait_bit.h
index 7725b7579b78..fe89282c3e96 100644
--- a/include/linux/wait_bit.h
+++ b/include/linux/wait_bit.h
@@ -6,6 +6,7 @@
  * Linux wait-bit related types and methods:
  */
 #include <linux/wait.h>
+#include <linux/dept_sdt.h>
 
 struct wait_bit_key {
 	void			*flags;
@@ -246,6 +247,7 @@ extern wait_queue_head_t *__var_waitqueue(void *p);
 	struct wait_bit_queue_entry __wbq_entry;			\
 	long __ret = ret; /* explicit shadow */				\
 									\
+	sdt_might_sleep_start(NULL);					\
 	init_wait_var_entry(&__wbq_entry, var,				\
 			    exclusive ? WQ_FLAG_EXCLUSIVE : 0);		\
 	for (;;) {							\
@@ -263,6 +265,7 @@ extern wait_queue_head_t *__var_waitqueue(void *p);
 		cmd;							\
 	}								\
 	finish_wait(__wq_head, &__wbq_entry.wq_entry);			\
+	sdt_might_sleep_end();						\
 __out:	__ret;								\
 })
 
-- 
2.17.1

