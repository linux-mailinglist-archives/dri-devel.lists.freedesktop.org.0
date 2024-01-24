Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B8883A95E
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 13:16:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8235B10F735;
	Wed, 24 Jan 2024 12:15:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.hynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 65C6910F6F4
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 12:15:10 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-e5-65b0fbb562db
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v11 10/26] dept: Apply sdt_might_sleep_{start,
 end}() to hashed-waitqueue wait
Date: Wed, 24 Jan 2024 20:59:21 +0900
Message-Id: <20240124115938.80132-11-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240124115938.80132-1-byungchul@sk.com>
References: <20240124115938.80132-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSfUzMcRzHfb+/x7scvx3ml+Zhh9kYYmWfhfiLn43N1h82z7fuN3fTxS5F
 nhaKlChWp8TqcM51PfjlIeraFVKeOrpxUkkzOT0qF9cTV+afz957v/d+ff55s4TyETWD1UUf
 EA3R6igVLSflXRPzF98fKhGDeypkkHEuGLw/k0nILbbR4CwqQGC7ewKD5+l6eD/QiWDoVT0B
 xkwngvzPzQTcrWlBYLecpKHhyyRweXtoqMtMpeHU9WIa3nQMY2jKuoihQNoEL9JNGBy+dhKM
 HhquGE9h//mGwWe2MmBOmA9tlhwGhj8vg7qWdxTYGxdB9rUmGirsdSTUlLVhaHiUS0OL7Q8F
 L2pqSXBmpFFQ2G2ioWPATIDZ28PAW0cehpJEP+h0/ygFz9IcGE7fuIPB9aEcQWVyKwbJ9o6G
 x95ODKVSJgGDt54iaDvfxUDSOR8DV06cR5CalEVC/cgzChKbQmHody69Nkx43NlDCImlBwX7
 QB4pPDfxwsOcZkZIrGxkhDwpVii1LBSuV3iwkN/npQTJepYWpL6LjJDS5cJC9+vXjFB7eYgU
 vriMeHPQVvkqjRilixMNS8N3y7XtzRnUfjd7aOTJQyYBuekUJGN5LoTPrneR//XPS2XMmKa5
 Bbzb7SPG9FRuDl+a9pVKQXKW4M4E8JbeV+PlKdwOfniw1x+wLMnN56UHkWO2glvB11b3M/+Y
 s/mCEsc4R+b3C7Mbx38puVC+1XqBGWPy3BkZn3zvN/WvEMhXWdxkOlLkoQlWpNRFx+nVuqiQ
 Jdr4aN2hJZH79BLyL8p8bHhbGepzRlQjjkWqiYq11mJRSanjYuL11YhnCdVUhTuwSFQqNOr4
 w6Jh3y5DbJQYU42CWFI1XbF84KBGye1RHxD3iuJ+0fA/xaxsRgKa1hj762XHpqsvu5NVETtn
 ObTHNSurnDM9Sa1PtH+Cqm6q1m1P/ZjTP3dmRN/tHVgduTvkqG3noEIbVr46SLPcOXtj/acj
 vgCtqWG0MnDyBZdng1HaMDo9OP1kQLnpWnNWmH1eiqu9bM2q7529ehRekn87HelHZoUunZQZ
 /mOddu4WFRmjVS9bSBhi1H8BjlB7+k0DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSf0yMcRzHfb/Pzy7HsxOelB87jGWpRvYhzMbmmWFpMxvz41bPdKuL3VVk
 TFSkhGM5FLvKzrku5YkJXUtxdRlFt5xWLc2ciBpdnK64mH8+e+393vv114clFMXULFadkipq
 U1TJSlpGyrbGZIXfH60SI8fzIkB/NhI8w7kkFFdaaWi7U47Aeu8Ehv5nG+HNyACC0RetBBgK
 2xCUvOsm4J69B4HNfJKG9vdTwOkZpMFRmE9DVlklDa8++zB0Xb6IoVzaAs8vlGKo97pJMPTT
 UGTIwv7zEYPXZGHAlLkQ+szXGPC9iwJHTwcFjdcdFNg6l8DVG1001NocJNhr+jC0Pyqmocf6
 m4Ln9mYS2vQFFFR8LaXh84iJAJNnkIHX9UYMVdl+26nv4xQ0FdRjOHXzLgbn28cI6nJ7MUjW
 DhoaPQMYqqVCAn7deoag79wXBnLOehkoOnEOQX7OZRJax5ooyO6KhtGfxfS6GKFxYJAQsqsP
 CbYRIym0lPLCw2vdjJBd18kIRilNqDaHCWW1/Vgo+eahBMlyhhakbxcZIe+LEwtfX75khOYr
 o6Tw3mnAsaE7ZasTxGR1uqiNWLtPluju1lMHXezhsacPmUzkovNQAMtzy/nhSzXMBNPcIt7l
 8hITHMTN46sLPlB5SMYS3OlA3jz04u9gGreb9/0a8hcsS3ILeelB/EQs51bwzQ3fmX/OuXx5
 Vf1fT4A/r7jaSU6wgovmey3nmQtIZkSTLChInZKuUamTo5fqkhIzUtSHl8Yf0EjI/zOmYz59
 DRpu39iAOBYpJ8vXWSpFBaVK12VoGhDPEsoguSv4jqiQJ6gyjojaA3u1acmirgGFsKRypnzT
 DnGfgtuvShWTRPGgqP3fYjZgViZa9gPHbn069bZ3s/mGOmRanP1tXXzZ4O8FgVxu+PzF20Lt
 wYs1T2IebVpZ07IhJMlnmr3d/SYubE5FkDQv9cgi6+NPzlWKWGO+YX9dU5xU4bC7o/Ql0Zpd
 RbdsbseC9YEoVbb3dMDQk/T2oyuOqwa2KIMDZ2iq7s4ndxX9HFkzvXGPktQlqqLCCK1O9Qdg
 X4soLwMAAA==
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

