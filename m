Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C46778BFA0D
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 12:03:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82DC7113543;
	Wed,  8 May 2024 10:03:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 41DB0113527
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 10:02:56 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-59-663b4a3b5c02
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
Subject: [PATCH v14 20/28] dept: Apply timeout consideration to
 hashed-waitqueue wait
Date: Wed,  8 May 2024 18:47:17 +0900
Message-Id: <20240508094726.35754-21-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240508094726.35754-1-byungchul@sk.com>
References: <20240508094726.35754-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSe0hTcRTH+/3u0+HqtgJvBhmLsCx7iNXpJRGVlyAqoogKdOU1R2oxXxkU
 lrNMm5Rhmo9SZ2vMtekUqUxZmpZptmqUxRQd9hhODWviUqpp9M/hw+ec7/evwxKyeiqQVSYm
 i6pERbyclpCSYf+K0M27N8eueWabCzeurQHPz2wSSs1GGmymagTG+osYXG2R8GHcjWDy1WsC
 CgtsCCoGegmob+9D0KS/RMO7wdlg94zS0FGQS0Om1kzDm6EpDI5b+RiqLXug83olBqv3KwmF
 LhpKCjOxb3zD4NUZGNBlLAWnvpiBqYG10NH3noKmTyvg9h0HDU+aOkhof+jE8O5xKQ19xj8U
 dLa/IMF2Q0PBg5FKGobGdQToPKMMvLWWY6hR+4ou//hNwXONFcPlqloM9o+NCJqz+zFYjO9p
 aPW4MdRZCgj4db8NgTNvmIGsa14GSi7mIcjNukWC2rEOJidK6W0bhVb3KCGo69KEpvFyUnhZ
 yQuPinsZQd38iRHKLSlCnT5E0D5xYaFizEMJFsNVWrCM5TNCzrAdCyPd3YzwomiSFAbthXhf
 4BHJlhgxXpkqqlZHREviujLN6Ewec/a7Q4Mz0ACVg/xYngvnb6r1xH9uuHd/xtNcMN/T453x
 87nFfJ3my4wnOLeEr+reNc3zuIP8qK2FmWaSW8oPPOjDOYhlpdx6vqtL/q8yiK+usc7U+Pn0
 x68jaJpl3Dq+MbPYF5X4biZY3vGmBP8LLOCf6nvI60hajmYZkEyZmJqgUMaHr4pLT1SeXXXi
 dIIF+X5Jd37q6EM0ZjvQgjgWyf2l1oBNsTJKkZqUntCCeJaQz5e2XdkQK5PGKNLPiarTUaqU
 eDGpBS1kSXmANGw8LUbGnVQki6dE8Yyo+r/FrF9gBuL4w4bJYG1DY+uOsm+v8n+GRlU1eJcd
 7x+KdrEROxc1owufGSo17bv7+Na7Kc7ONL3CdkwcrF25a1bRgQ9hv5ebIpvtMVqTIdhcFKYc
 LNJ5Ip1fQsuW7Z2jqSwJ2d5JBkz4L6k6ZNzv8j7qXWBSB77OCjJr2QtGzJjU4dVKQk4mxSnW
 hhCqJMVf/xghQ0cDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0hTYRzGe99zdbQ6LKGDBsW6CEaWkfVPK6QP+RIYQUTRBRt2zJE3tjSN
 LGublaWloJZZqNUSnZlTKvOCzlzespWjUqbkLZVMy5q1tIsafXn48Tzw+/TwlCKL8eDVUSck
 TZQqQsnKaNmuAN0a/50BYet+tWyG9CvrwPntIg25pSYWbA+KEZgqzmEYaQyCt5OjCKZevKQg
 O9OGIL+3m4IKaw+CmsLzLHQMLAC7c5yF5szLLOjulLLw6uM0BkdWBoZiczC0XivAUOcaoiF7
 hIWb2To8E8MYXMYiDoxJK6GvMIeD6V5faO55w0DDrWYGarpWw43bDhaqa5ppsD7pw9DxNJeF
 HtMfBlqtTTTY0lMZKBkrYOHjpJECo3Ocg9d1eRge6mdsyV9/M/A8tQ5D8t0yDPbOKgS1F99j
 MJvesNDgHMVQbs6k4Of9RgR9aZ84MFxxcXDzXBqCy4YsGvQOP5j6kcsG+pOG0XGK6MtPkprJ
 PJq0FIikMqebI/raLo7kmWNJeaE3uVM9gkn+hJMh5qJLLDFPZHAk5ZMdk7H2do40XZ+iyYA9
 G+/2PCDbclSKUMdJmrXbjsjC23SlKCaNi//sSMVJqJdJQW68KGwQH927P8es4CW+e+eiZtld
 WCaWp36Y6ylhVCbebd8xy4uEveK4zcLNMi2sFHtLenAK4nm5sFFsa1P+Uy4Vix/WzWncZurO
 oTE0ywrBT6zS5XDXkCwPzStC7uqouEiVOsLPR3s8PCFKHe8TGh1pRjNvMSZOpz9B3zqCLEjg
 kXK+3MYGhCkYVZw2IdKCRJ5SussbL2wKU8iPqhJOSZroEE1shKS1IE+eVi6W79wnHVEIx1Qn
 pOOSFCNp/q+Yd/NIQh5VvnvOFyy5Gpgp5MukwEuLDNMbvZYPEfeDRY7vz7YNSsEtreHV1hAL
 eAZ3fYlR7kpcf2jKK9Znf2WL5F2Ktvzy7x5cNjzctkczGGSoL1uVb/2RoXgQutVlus1FRr8o
 0Z4+U5nYFR+b3H+9X1+v0D/eXrZi4nCTwXTWd2GIPX5ASWvDVb7elEar+gs90H2lKQMAAA==
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

