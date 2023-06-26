Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0570473EC74
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 23:04:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0E6410E251;
	Mon, 26 Jun 2023 21:03:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 90B5010E1F5
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 12:13:54 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-46-64997d6c0259
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v10 11/25] dept: Apply sdt_might_sleep_{start,
 end}() to hashed-waitqueue wait
Date: Mon, 26 Jun 2023 20:56:46 +0900
Message-Id: <20230626115700.13873-12-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230626115700.13873-1-byungchul@sk.com>
References: <20230626115700.13873-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0hTYRjHe8/lPWfLxWGVni5UTLppF7vyQBEJQYcoKPrShS7LnXQ0NbY0
 DQIzFZspaulMLXTWWjq1tm6ms6VmLrtomq2YVlKZphnWLHNdptSXhx/PH37/58PDknIHPZ1V
 Rx0RtVFKjQJLKemAX/FizfFzqpB7r4Mg63QIeL6lUlBYacHQUlGGwHL9BAG99zfCi+F+BKOP
 n5JgyGlBUPy2k4TrjV0I7OZEDG3vJkG7ZxCDMycNw8mSSgytn7wEuHOzCSizboHmTCMBjpEe
 Cgy9GAoMJwnf+EjAiKmUAVPCXOg25zPgfbsMnF0dNNhfBcO5C24MNXYnBY23uwlou1OIocvy
 h4bmxiYKWrLSaSj/bMTwadhEgskzyMAzRxEBV5N8oj6vnYCUr79peJDu8NHFawS0v6xGUJv6
 hgCrpQNDvaefAJs1h4Sfl+8j6M4YYCD59AgDBScyEKQl51Lw9NcDGpLcq2D0RyFev0ao7x8k
 hSTbUcE+XEQJD428UJXfyQhJta8YocgaI9jMQUJJTS8hFA95aMFaegoL1qFsRtAPtBOCu6MG
 C5+fPGGEprxRauvMXdK1KlGjjhW1S9ftl0b0dGbRh11s3K+GKiYBubAeSVieW8k/SmxF/znV
 +50aY8zN512uEXKMp3BzeFv6B1qPpCzJlUzke5oamLFgMreHr7yiH2eKm8snNzvHWcat5o13
 Pv4rmM2XXXWMiyS+ffUj43iZnFvFJ7rr8JiU585I+G77jX9XTOPvmV1UJpIVoQmlSK6Oio1U
 qjUrl0TER6njloRFR1qR769Mx727b6Ohlu11iGORwk8WMitPJaeVsbr4yDrEs6Riisz/h0El
 l6mU8cdEbfQ+bYxG1NWhGSylCJAtHz6qknPhyiPiIVE8LGr/pwQrmZ6AdHnmRcpbGefPZz7r
 6aMapm4Osyx4Y62tXHjXsKLVHnpgQc2FXmOAIo4J3kZXW9b9vNXXlbJjw9J50YsC1wRWxBxs
 a/U/kx/CpFVtpct3DN0IPbS9c2P4gbCbjP/OL9c2FUvF35HTnr8Ptu19Qbv0KWf9NI+d+kQ2
 wF+Se+mu3HilQEHpIpTLgkitTvkXnAPZ7FMDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzXSa0xTZxgHcN9zec+hrnrWke2EXVhqjAYzwETI4yXG7AuvS6bOxBhNjNT1
 ZHS0xbTKwISEq2IRQ02giqhYtCAg6AEdINWuCFIugkBY5woZzIAoQkSLsNZthWxfnvzy/yf/
 Tw9Pq+xsBK8zHpNMRo1ejRWMYtfWnK/0GRe0sYNXVGA9Ewv+t/kMlNXXYuivq0FQ25hFwVR7
 Avw6P40g0NtHg624H8HVsREaGjtGETirsjEMPlsFQ/5ZDJ7iAgw5FfUYnrwMUuArOUdBjfwt
 dBfZKXAtTjJgm8Jw0ZZDhc5zChYd1Rw4MtfCeFUpB8GxjeAZHWah7ZKHBefTDXDhsg9Dq9PD
 QEfTOAWDLWUYRmv/YaG7o5OBfmshCzdn7BhezjtocPhnORhwlVNwKze09iLopODkm79ZeFTo
 CunabQqGfruH4H7+HxTItcMY2vzTFDTIxTT8VdmOYPzsKw7yzixycDHrLIKCvBIG+t4/YiHX
 FweBhTK8Yxtpm56lSW7DT8Q5X86QLrtImktHOJJ7/ylHyuXjpKEqilS0TlHk6pyfJXL1aUzk
 uXMcsbwaoohvuBWTmcePOdJ5PsDs+fygYptW0utSJVPM9kRF0uSIlT3q5dPeP2zmMpEXW1AY
 LwqbxPzgO2bJWFgner2L9JLDhS/FhsIJ1oIUPC1UrBQnOx9yS8VHwiGx/oZl2YywVszr9ixb
 KcSL9pbn/41GijW3XMtDYaH8Xo8dLVklxInZPjcuQopytKIaheuMqQaNTh8XbU5OSjfq0qK/
 TzHIKPQ5joygtQm9HUxwI4FH6g+UsV+c16pYTao53eBGIk+rw5UfL9i0KqVWk35CMqUcNh3X
 S2Y3+pRn1J8ov9kvJaqEHzTHpGRJOiqZ/m8pPiwiE/XM75tuLFq1vs6Pd6RSlbbfY2ylWQsT
 2UcyNu/65cfdpxKVvRUl7jXXd98pkD67PvDz3b58Q6Njiz++7nS7Y84m93KGPbLl9YoT3z1o
 ef0s1pLgdbYUr1udXOmaiWgKSAOBy0aSHp389UTX8IHSMWb/TpV2deSf+xaMHTutH97dG6lm
 zEmajVG0yaz5F7H2sVY1AwAA
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 26 Jun 2023 21:03:34 +0000
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
 linux-fsdevel@vger.kernel.org, jglisse@redhat.com, paolo.valente@linaro.org,
 viro@zeniv.linux.org.uk, longman@redhat.com, tglx@linutronix.de,
 vbabka@suse.cz, melissa.srw@gmail.com, sj@kernel.org, tytso@mit.edu,
 rodrigosiqueiramelo@gmail.com, kernel-team@lge.com, gregkh@linuxfoundation.org,
 jlayton@kernel.org, penberg@kernel.org, minchan@kernel.org,
 max.byungchul.park@gmail.com, hannes@cmpxchg.org, tj@kernel.org,
 akpm@linux-foundation.org, torvalds@linux-foundation.org
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

