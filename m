Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DB783A962
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 13:16:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CA1C10F739;
	Wed, 24 Jan 2024 12:15:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2C7DF10F6C2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 12:15:11 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-85-65b0fbb7a24d
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v11 20/26] dept: Apply timeout consideration to
 hashed-waitqueue wait
Date: Wed, 24 Jan 2024 20:59:31 +0900
Message-Id: <20240124115938.80132-21-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240124115938.80132-1-byungchul@sk.com>
References: <20240124115938.80132-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAz2SW0xTWRSG3ftc26HmTNXMEWM0NUanRgcVzZoZo/hgPF5DML7ogzbDybQZ
 qKZFBJPBKsULUlSSggiaFrQ2BSm0GhltlYHIRQVRqhamkILEkQBC0CK1eCkYfVn5sta/vqef
 JeS3qVhWo00TdVpVioKWktLhGOvyW5FqMc4TWA3n8+Ig9O4UCaXOShraqyoQVN44hmHg/mZ4
 MT6EINL6mIAiczsCa283ATcaexB47cdp6OifCb7QCA0t5jM0ZJc7aXgyOIkhUFiAocK1Ax6e
 K8NQF/6fhKIBGkqKsnF0vMYQtjkYsBkWQ5/9IgOTvSuhpec5Bd6uZVB8OUCDx9tCQmNtH4aO
 26U09FR+puBhYzMJ7edNFFx/U0bD4LiNAFtohIGndRYM1cao6MTbTxQ0meownLhSg8HXeQfB
 3VNBDK7K5zQ0hIYwuF1mAj5cu4+gL3+YgZy8MAMlx/IRnMkpJOHxxyYKjIE1EJkopRN+ExqG
 RgjB6D4seMctpPCgjBf+udjNCMa7XYxgcR0S3HalUO4ZwIJ1LEQJLsdpWnCNFTBC7rAPC2/a
 2hih+UKEFPp9RThx3h7pumQxRZMu6n5Zv1+qfpTtRAfzmYzRgAkbUC+ViyQsz8XzZkvkO78c
 u0lMMc0t4f3+8DTP5hbybtOraEbKEtzJH3j7aCudi1h2Frebfx9WTmVIbjH/6n0xOcUybi3/
 YfIS89W5gK+orpv2SKL768Vd0xk5t4YPOs4yU06ey5bwDQED8fVhLv+v3U+eQzILmuFAco02
 PVWlSYlfoc7UajJW/HEg1YWijbL9Pbm3Fo2176pHHIsUMbIEh1OUU6p0fWZqPeJZQjFb5p9b
 JcplyarMI6LuwD7doRRRX4/msaTiJ9mq8cPJcu5PVZr4lygeFHXfrpiVxBpQgu6/R+qZknVZ
 2nJRaeNHg5uumRKzjm696r4cszPfqdqfNkPZXLPdKnMGkzr8Cb5yZXDk9x3mz9bWm53LjHHJ
 /fPvSCc8hZ7RpLzurC07Z71UFjTlWDa602t/vhcfm6r+tXPbHL2rZNCb+SzDkLQkbfuPx9sW
 SiY2LDItYhOXmrCC1KtVK5WETq/6Ajv6e5lNAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSfUyMcRzA/X7Pa4+OZ6fm8W63GcvkZeI7Gf1hPGNizJgxPePhbip2RznG
 okNdLmpLSuiFq11XlyvvrqV2KXkphbSTiiFSLa6cOy9X5p/vPvt+P/v89WUJZQ41kdXEHpC1
 sVK0iuZILjI8cc4tb5k8r26Ag7Qz88D9PYmEHJuVhsbSYgTWiuMYup2r4NVgDwLvk2cEZGY0
 IsjrfENARW07AkfRCRqa34+BFncfDfUZKTQkFthoaPriw+A6n46h2L4WGs7lY6jyfCQhs5uG
 i5mJ2D8+YfCYLQyYE2ZAV1E2A77O+VDf/pKCmkv1FDjaZkPWZRcN9x31JNTe7sLQfDeHhnbr
 HwoaautIaEwzUVDSm0/Dl0EzAWZ3HwPPq3IxlBn8tVPfflPw0FSF4dTV6xhaXt9DUJnUgcFu
 fUlDjbsHQ7k9g4CfhU4EXalfGTh5xsPAxeOpCFJOnifh2a+HFBhcYeD9kUNHhIs1PX2EaCiP
 Fx2DuaT4KF8Q72S/YURDZRsj5toPiuVFIWLB/W4s5g24KdFuSaZF+0A6Ixq/tmCx9+lTRqy7
 4CXF9y2ZeP3krdzSXXK0Jk7Wzl0WxakfJ9rQ/lTmUL/LhBNQJ2VEAazALxTeDdwghpnmZwqt
 rZ4RDuKnC+WmD36HYwn+9GihqP8JbUQsO47fJAx5QoYdkp8hfBjKIodZwS8SfvouMf+a04Ti
 sqqRToB/X5LVNuIo+TChw3KWOYe4XDTKgoI0sXExkiY6LFS3V62P1RwK3bkvxo78P2M+6ku7
 jb43r6pGPItUgYoIi01WUlKcTh9TjQSWUAUpWieUykrFLkl/WNbu26E9GC3rqtEkllSNV6ze
 LEcp+T3SAXmvLO+Xtf+vmA2YmICcHflT2/vzSusWOHxJ8ZW9Vo0+eEXkixIwLj+WfGT9NdPN
 wikfietqi5p7UBgpeTca1J2h4VuTUUTK88B1Y7dJcVxD3prAWWN2f9Z5fhd03HMkbTCmpx7O
 2tMU/DY7Unkl+NsWve3T0Fnf0CLL3MUPrPHbXYuXLHBuHuectGRa00oVqVNL80MIrU76C1s9
 GEgvAwAA
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

