Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 375C785D45D
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 10:50:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 934F810E6C0;
	Wed, 21 Feb 2024 09:50:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2588410E6A8
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 09:49:51 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-c8-65d5c73a9c46
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
Subject: [PATCH v12 20/27] dept: Apply timeout consideration to
 hashed-waitqueue wait
Date: Wed, 21 Feb 2024 18:49:26 +0900
Message-Id: <20240221094933.36348-21-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240221094933.36348-1-byungchul@sk.com>
References: <20240221094933.36348-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSbUxTZxTHfZ5773NvqzV3ncue4cxMg4644WRRd6JuMS7Lni9GEqMfxpLZ
 wVXqSjFFQFymKFUYClEUitKQFl3t2k6wSNANkJfx6kTEKmiQCDNsjUUULVkH6lqmX07++f3P
 +X06Eqe9LMRIBtNuxWzSG3VEzavH5zni13beUlZ090tw/OgKCD0r4MFW7SXQd96DwHvxAIZA
 +5cwMBVEMH3tOgfW0j4EjpF7HFzsGEbQ6DpI4OaD+eAPTRDoLj1CIO9MNYEbD2cwDJWVYPD4
 NsLVY1UYmsN/8WANEKiw5uHI+BtD2OkWwZm7BEZdp0WYGUmA7uHbAjTe/QBOVQ4RaGjs5qHj
 0iiGm7/aCAx7XwpwtaOLh77jRQL88qiKwMMpJwfO0IQI/c12DDWWiOjw0xcCdBY1Yzh89gIG
 /53fEDQV3Mfg894m0BYKYqj1lXLw77l2BKPF4yIcOhoWoeJAMYIjh8p4uP68UwDL0CqY/sdG
 1q9hbcEJjllqs1njlJ1nPVWUXT59T2SWprsis/syWa1rGTvTEMDMMRkSmM/9I2G+yRKRFY77
 MXvU2yuyrvJpnj3wW3Hiwq/U61IUoyFLMX/02TZ16h951WhXsbjn8VARzkUjQiFSSVReSW1/
 tvCFSJrNlv7YKCby+3RwMMxF8wJ5Ma0tGousqyVOzp9LXY+vkWjxpryF2p94uOgtLy+hAT+N
 Yo28mt5xnnulf496appnPaoI/7kiOMu18ip660YdF3VS+YSK5hU85f8/eIe2uAb5Y0hjR3Pc
 SGswZaXpDcaVy1NzTIY9y5PT03wo8lDOH2aSLqHJvs2tSJaQbp4mtd6vaAV9VkZOWiuiEqdb
 oOGzI0iTos/Zq5jTvzFnGpWMVrRQ4nVvaz6eyk7Ryjv0u5XvFGWXYn7dYkkVk4u+/9RT5o3z
 frh0zLjP1v5FZn5v08jOxOfJ+zYqxoG4E8FPdOOZ8a6lWkdxUqwqvMG1iVS6P4/9OtAz92TM
 hSsnBxLsJVsX1ySbNG11yeUF+w0vW+53teoS3lqbT2Lc8Yv66xvgjbp3v/09nY119DieaSup
 daytsry+yjSx/SeyvkHHZ6TqE5Zx5gz9f66TceRMAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0wTaRiF/b6Z+Waodp1gXUc00VSNiQaFCOR1JcToj36aqJvNGrOaKHWZ
 SGO5bIsVNGbRFkUUBBNEpbspoJUFFHdws3jBVIhgQZFLkYtIBA1KLOKFoly8tCb+OTl5znvO
 r1dgggu5EMGQmCKbEvVGLVGxqs1rrKE/NXTIYac+hELeyTDwjWayYK+sINBypRxBxbXDGIbu
 6qBzzItg8sFDBgryWxAU9T9h4Fp9H4Ka0iME2p//AB7fCAF3/gkC1pJKAq2vpjD0njmNoVzZ
 BE25xRhc4y9YKBgiUFhgxX55iWHcWcaDM30JDJSe52GqPxzcfY84qPvLzUFNz3I493cvgVs1
 bhbqqwcwtN+wE+ir+MJBU/09Flrysjm4/LqYwKsxJwNO3wgPbS4Hhqs2/9rR9585aMh2YTh6
 4V8Mnu6bCG5nPsWgVDwiUOfzYqhS8hmYuHQXwUDOMA8ZJ8d5KDycg+BExhkWHn5q4MDWGwmT
 H+1k7Rpa5x1hqK1qP60Zc7C0sVii188/4antdg9PHco+WlW6jJbcGsK06J2Po0rZcUKVd6d5
 mjXswfR1czNP752dZOlzTwH+ef52VXScbDRYZNPKmFhV/H1rJUrO4VPf9GbjdNTPZSFBkMQI
 yda2OAsFCURcKnV1jTMBrxEXSlXZg/4TlcCIx6ZLpW8ekEAwS9wqOd6WM4EuKy6RhjxSAKvF
 KKnbeYkLeElcIJVfdX3bCfLzfwq933iwGCl1tP7H5CKVA00rQxpDoiVBbzBGrjDvjU9LNKSu
 +D0pQUH+l3EemsqrRqPtulokCkg7Qx3/v0cO5vQWc1pCLZIERqtRs/v9SB2nTzsgm5J2mfYZ
 ZXMtmiew2jnqjdvk2GBxjz5F3ivLybLpe4qFoJB0FKMjus2NMy2zm35Li149Gffj7MGJInLQ
 qGjDOmy6PyLnouHdMZpjW1q9M6Ontf6ZFCpHbGjbsm5byGInRiW+Z3ZjR9uz5L5fXyZVj/ZE
 5NzZOWdR86rBI9aJYkvu9Lcl13d1I1j/y8WpszvSXc1RnS/yNbmpmSmPYzPoF3e/Yo/SsuZ4
 ffgyxmTWfwW0t9IeLgMAAA==
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

