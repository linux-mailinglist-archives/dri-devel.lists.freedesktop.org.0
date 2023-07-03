Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CFD745907
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 11:50:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D168910E201;
	Mon,  3 Jul 2023 09:49:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4FAAD10E1FE
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 09:49:45 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-3b-64a299b4365d
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v10 rebased on v6.4 22/25] dept: Apply timeout consideration
 to dma fence wait
Date: Mon,  3 Jul 2023 18:47:49 +0900
Message-Id: <20230703094752.79269-23-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230703094752.79269-1-byungchul@sk.com>
References: <20230703094752.79269-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAz2SbUxTZxiGfd9zzntOCzVnlbij/tA0Mzo/8GOgT5xxJvvhq5lGs+mykaiN
 PZNqqaYoirgMpSqCBZFAAesGZZQGEPWAEac1DCdfRulGw6pDNvBjEIsoUmIFphQz/zy5ct+5
 r1+PwGivcdMFo3mfbDHrTTqiZtX9kSULawudhsVNb2Ih59RiCA6ls+C4UEXAW12JoKr2CIa+
 W2vgz+EAgpE7bQzY87wISrofMFDb2IXA4z5KoP3RZPAFBwi05GUSSCu9QOD3p6MYOvPPYKhU
 1sPt004M9aF/WbD3EThrT8PjpxdDyFXBgyt1NvS4i3gY7V4CLV0dHHjuz4fCHzsJXPe0sNBY
 14Oh/RcHga6qNxzcbmxmwZtj4+D8MyeBp8MuBlzBAR7+qC/GcNE6Ljr+8j8Ommz1GI7/fAmD
 7941BDfS/8GgVHUQuBkMYKhR8hh4XX4LQU9WPw/HToV4OHskC0HmsXwW2saaOLB2xsLIKwdZ
 vYLeDAww1FpzgHqGi1na6pTo1aIHPLXeuM/TYmU/rXHPo6XX+zAtGQxyVKk4SagyeIanGf0+
 TJ/dvcvT5oIRlj7y2fHGGd+qVxpkkzFJtixatV0dP+j9De1tFw76R3rZVFTJZyCVIIkx0glv
 1nu2/d2Gw0zEOZLfH2LCHCXOkmpsT7gMpBYY8USE5H5+h4SLKeJWyfO4dWLAirOlsivVEwON
 uEzKz84l76QzpcqL9RO5ajx//CoLhVkrxkqdhV0kLJXEXJV05fIQfjeYJv3q9rOnkaYYTapA
 WqM5KUFvNMVExyebjQejd+xJUND4S7m+H42rQ4PeLxuQKCBdpMafUmLQcvqkxOSEBiQJjC5K
 k9b9k0GrMeiTD8mWPdss+01yYgOaIbC6DzVLhw8YtOJO/T55tyzvlS3/t1hQTU9Fjo8DZVEJ
 YvYL7YKIT23KR9khK6xasaw1d/65sWmbA5qCLzzfbF5XMeoq2/QXcpz7Sh2y52zL5CI9RamF
 zT/M7f1EVT6Hy384K8K5PFqOCq6dKsREm00dH/iU18+/i/vs8+qkr3eLxrFdMw8zJ9PWHX4J
 NCV9aO2Lpqkb7sVtqUtR69jEeP2SeYwlUf8WgJPvAE4DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSe0xTdxzF/f3uvb97qVbvOpLdoAbThCyiU0nG8k18zMyoPxV1/5n4Go29
 G42lYItV3FxQqgIK8gggUrZStRLoRFuysc2yhpcUQ0FpsCPIgPgiIihaYgc+AOM/J5+ck3P+
 OgKjquCiBJ0hTTYaNHo1UbCKHaszv6grs2tX/R5aBAXnVkHoVRYL1longa5rNQicdScwDLds
 hnsTIwgmOzoZKC3uQlA5eJ+ButZ+BJ6qkwS6H8yHQGiMgK/4LIHMS7UE7jydwtBXUoihxrUd
 bufbMXjDj1koHSZQXpqJp+UJhrCjmgdHRgwMVV3kYWowDnz9PRw0Vfg48PQug7Jf+gjc9PhY
 aK0fwtD9l5VAv/MdB7db21joKsjl4LdRO4GnEw4GHKExHu56bRiuW6bXTr98y8GtXC+G05dv
 YAj8+zeChqwBDC5nD4Gm0AgGt6uYgf+vtiAYynvGw6lzYR7KT+QhOHuqhIXON7c4sPTFw+Rr
 K1m/mjaNjDHU4j5CPRM2lrbbJfrnxfs8tTT08tTmOkzdVbH00s1hTCvHQxx1VWcT6hov5GnO
 swCmo34/T9suTLL0QaAUf7tot2KNVtbrzLJx5bpERdJ4VzNK7RaOBiefsBmohs9BEYIkfinl
 /teJZ5iIn0vBYJiZ4UhxieTOfcTlIIXAiGfmSlXPO8hM8Km4X/I8bJ8tsGKMdOWPa7MFpfiV
 VHK+iHwYjZZqrntn/Yhp/+HrPDTDKjFe6ivrJ/lIYUNzqlGkzmBO1uj08StMB5PSDbqjKw6k
 JLvQ9Gkcx6cK6tGr7s2NSBSQep4y+GOlVsVpzKb05EYkCYw6Upk5+KtWpdRq0o/JxpTvjIf1
 sqkRLRRY9WfKrbvkRJX4gyZNPijLqbLxY4qFiKgMZE00Lx0oth/CC2M2tHib1i2OXmBLCAcM
 Zqd+SnzHD9Q2b/vHr3dvuZfzUwubEJ26MexYVpTv3x/8ein9hrjbbmQlxG7qjfP/3MxbGnlt
 4MXK55e3+BqWPz6e31N4Nduasq/ekbR9bP6e9dnBI8G7FWnS2k8Gdrfv7RjdWW7/XlukZk1J
 mrhYxmjSvAe7+XJlMAMAAA==
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
consideration to dma fence wait.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 drivers/dma-buf/dma-fence.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index ad2d7a94c868..ab10b228a147 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -783,7 +783,7 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
 	cb.task = current;
 	list_add(&cb.base.node, &fence->cb_list);
 
-	sdt_might_sleep_start(NULL);
+	sdt_might_sleep_start_timeout(NULL, timeout);
 	while (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags) && ret > 0) {
 		if (intr)
 			__set_current_state(TASK_INTERRUPTIBLE);
@@ -887,7 +887,7 @@ dma_fence_wait_any_timeout(struct dma_fence **fences, uint32_t count,
 		}
 	}
 
-	sdt_might_sleep_start(NULL);
+	sdt_might_sleep_start_timeout(NULL, timeout);
 	while (ret > 0) {
 		if (intr)
 			set_current_state(TASK_INTERRUPTIBLE);
-- 
2.17.1

