Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C800483A964
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 13:16:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B52510F733;
	Wed, 24 Jan 2024 12:15:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1790F10F703
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 12:15:10 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-75-65b0fbb74679
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v11 19/26] dept: Apply timeout consideration to waitqueue wait
Date: Wed, 24 Jan 2024 20:59:30 +0900
Message-Id: <20240124115938.80132-20-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240124115938.80132-1-byungchul@sk.com>
References: <20240124115938.80132-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSWUxTeRTG/d+91Zpr3a5iHK0xxl2M6FEZ48Mk839RSdSYqFEbuUojVFIU
 xC1VKjpVGGWmRZYQFlOaslpwLSUIAVoRrYK1VkDElQBC0BJrQYQaX05++c75vu/lcKTcRs/m
 VOpjokatjFYwUkraNylv+Z1Aubjqv+7FcO3KKvB9vURBdlkxA67SIgTFlecI6K7/G14M9SII
 ND8hId3gQpD3pp2EyoYOBHbzeQZa3k2GVl8/A07DZQaSCsoYeNozTECbMY2AIusWaLqaT0CN
 /yMF6d0MZKUnEWPjEwF+k4UFk3YhdJkzWRh+EwrODjcNdu9SyMhpY6DK7qSg4W4XAS33sxno
 KB6loanBQYHrWgoNJZ/zGegZMpFg8vWz8Kwml4By3VhQ8pcfNDSm1BCQfOMmAa0vbQiqL3US
 YC12M1Dn6yWgwmog4XthPYKu1D4WLlzxs5B1LhXB5QtGCp6MNNKgawuDwLdsZvMGXNfbT2Jd
 RQK2D+VS+GG+gO9ltrNYV+1lca71OK4wL8EFVd0Ezhv00dhq+YfB1sE0Fuv7Wgn8+fFjFjuu
 Byj8rjWdiAjZLQ2PFKNV8aJm5aYD0qi8agcZe4s9ceOiF2mRjtEjCSfwa4RCbRH6zc5XDdQ4
 M/wiwePxk+M8jZ8nVKR8oPVIypH8xYmCeaA5aJ7KbxXO17UHjyh+oWCrGgmyjF8r+JMesL9C
 /xCKymuCumRML8nwBgvkfJjQafmXHQ8V+CSJ0NjUQ/4yzBIemD3UVSTLRRMsSK5Sx8coVdFr
 VkQlqlUnVhw8GmNFYy9lOjO85y4adG2vRTyHFJNkmy1lopxWxsclxtQigSMV02SeWaWiXBap
 TDwpao7u1xyPFuNqUQhHKWbKVg8lRMr5w8pj4hFRjBU1v7cEJ5mtRf/v97zP/BQ+s/m1y1E4
 VX974rJw59zOucY/Yx3mb5ZbUeWrfclqfcF6b4F718BGNxXmcp9aqn1kIKcvkJzcOxphrKqf
 rgwZeH52RkA2EpogO5jaUmaWzE+YY4N5Wwz2HTvfpmVVnxVGX1VyXdtt2pxCT07E6b+meLcd
 wmv3rUs1Kqi4KGXoElITp/wJkO8o2E4DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0iTcRTG+//f21wtXpbQmxXFIAK7Q8ahRVhf+tNFi4jALznqJZc6Y8ul
 Xch03TQtK7OLlbemzKU2i6ymLceWq7xbmamZdNM0zZw15ypb9OXw4znneZ4vR0LJrzFBErVm
 n6jVqGIUrJSWhilTFt3zlotLB8YwZJ5eCu6RkzTklJlZaCwtQWC+cxRDr2MdvBrtR+Cta6Ag
 O6sRQd67TgruOLsQVBUns9Dyfiq0ugdZcGWlsZBSUMZC05dxDB0Xz2EosWyCZ2fzMdg8n2jI
 7mXhanYKnhifMXiMJg6MSfOgp/gKB+PvloGr6yUD9msuBqraF8Dl6x0sWKtcNDgrezC0PMhh
 ocv8m4FnzloaGjPTGbj1NZ+FL6NGCozuQQ6abbkYyg0Tace//2LgSboNw/HC2xhaXz9EUH2y
 G4PF/JIFu7sfQ4Uli4KxIgeCnowBDo6d9nBw9WgGgrRjF2lo8D1hwNARAt6fOWyoktj7Byli
 qNhPqkZzafI0XyD3r3RyxFDdzpFcSzypKA4mBdZeTPKG3QyxmE6xxDJ8jiOpA62YfK2v50jt
 JS9N3rdm482zIqSrdokxar2oXbI6UhqVV11L7b3LJRSeaEdJyMCmogCJwC8XXG+c9F9m+flC
 W5uH+suB/FyhIv0jk4qkEoo/MVkoHqrzG6bxYUKyvdN/RPPzhIdWn59l/ArBk/KY+xc6Rygp
 t/n1gAn91uV2f4GcDxG6TWe4s0iaiyaZUKBao49VqWNCFuuioxI16oTFO+NiLWjiaYyHxzMr
 0UjLuhrES5BiiizUVCbKGZVelxhbgwQJpQiUtc0oFeWyXarEA6I2boc2PkbU1aCZEloxXbZ+
 uxgp53er9onRorhX1P7fYklAUBLaObi26L5t+MaWlj5fuG/ojONTyZBMWXkkP6Pj7edtallG
 Ibsw1BG2JnxL04YPnReYtsY961XfMvFGpzU8ubnOATeUmpuzX5zn7ButeuPdIG8cqVw5O2Qs
 LKJuZM6hH2AOHikd46W67b/7lI+2Hl4z7OsOOLgh7TkX2SvVP06OVtC6KNWyYEqrU/0BL/Mk
 kDADAAA=
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
index ebeb4678859f..e5e3fb2981f4 100644
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

