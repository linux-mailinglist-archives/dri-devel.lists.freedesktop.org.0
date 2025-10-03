Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5F1BB60DC
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 09:01:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04DC410E8A4;
	Fri,  3 Oct 2025 07:01:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.hynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id A5DF510E7A4
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 08:28:47 +0000 (UTC)
X-AuditID: a67dfc5b-c45ff70000001609-ef-68de340f0035
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
 melissa.srw@gmail.com, hamohammed.sa@gmail.com, harry.yoo@oracle.com,
 chris.p.wilson@intel.com, gwan-gyeong.mun@intel.com,
 max.byungchul.park@gmail.com, boqun.feng@gmail.com, longman@redhat.com,
 yunseong.kim@ericsson.com, ysk@kzalloc.com, yeoreum.yun@arm.com,
 netdev@vger.kernel.org, matthew.brost@intel.com, her0gyugyu@gmail.com,
 corbet@lwn.net, catalin.marinas@arm.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 luto@kernel.org, sumit.semwal@linaro.org, gustavo@padovan.org,
 christian.koenig@amd.com, andi.shyti@kernel.org, arnd@arndb.de,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, rppt@kernel.org,
 surenb@google.com, mcgrof@kernel.org, petr.pavlu@suse.com,
 da.gomez@kernel.org, samitolvanen@google.com, paulmck@kernel.org,
 frederic@kernel.org, neeraj.upadhyay@kernel.org, joelagnelf@nvidia.com,
 josh@joshtriplett.org, urezki@gmail.com, mathieu.desnoyers@efficios.com,
 jiangshanlai@gmail.com, qiang.zhang@linux.dev, juri.lelli@redhat.com,
 vincent.guittot@linaro.org, dietmar.eggemann@arm.com, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, chuck.lever@oracle.com,
 neil@brown.name, okorniev@redhat.com, Dai.Ngo@oracle.com, tom@talpey.com,
 trondmy@kernel.org, anna@kernel.org, kees@kernel.org,
 bigeasy@linutronix.de, clrkwllms@kernel.org, mark.rutland@arm.com,
 ada.coupriediaz@arm.com, kristina.martsenko@arm.com,
 wangkefeng.wang@huawei.com, broonie@kernel.org, kevin.brodsky@arm.com,
 dwmw@amazon.co.uk, shakeel.butt@linux.dev, ast@kernel.org, ziy@nvidia.com,
 yuzhao@google.com, baolin.wang@linux.alibaba.com, usamaarif642@gmail.com,
 joel.granados@kernel.org, richard.weiyang@gmail.com,
 geert+renesas@glider.be, tim.c.chen@linux.intel.com, linux@treblig.org,
 alexander.shishkin@linux.intel.com, lillian@star-ark.net,
 chenhuacai@kernel.org, francesco@valla.it, guoweikang.kernel@gmail.com,
 link@vivo.com, jpoimboe@kernel.org, masahiroy@kernel.org,
 brauner@kernel.org, thomas.weissschuh@linutronix.de, oleg@redhat.com,
 mjguzik@gmail.com, andrii@kernel.org, wangfushuai@baidu.com,
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-i2c@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-modules@vger.kernel.org, rcu@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: [PATCH v17 21/47] dept: apply timeout consideration to waitqueue wait
Date: Thu,  2 Oct 2025 17:12:21 +0900
Message-Id: <20251002081247.51255-22-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251002081247.51255-1-byungchul@sk.com>
References: <20251002081247.51255-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzXSa0iTYRQH8J737nL0ssyeNKgGFnQxDY0DRReieiGIosuHgnLlmxtemeUl
 CCzcUGcmks60yaYi6kaZpimVmOYsVzrN3AxNTTPFTBJdXqkt6tuPc/7/8+lwpCyT9uNUMddF
 dYwiSs5IKMmUd/EuPuSzMigjPxgePrYw8GupkISVHCsLlqe3CcgdHmVguiwTQcFYIQsTrcfB
 4fqOYCUvEvS5dgSm4QESeuamGTDeeUlDnqGaAlt2MQH6CQYWyipZeFfST8GjqU4aBtu0NDwo
 6mcgbWUWgbX+CwGZVbU0pBT+osHeZKOh22ynYHjISYMryx8mXWUkdDcZCbj9qoSCsY9aAqxG
 X5gpdVGgLX1CQE/fcwSNaUMEvH78jIBvBQYCFgfqaWhfbCdAk7nAQu5yGgM6TR4F81UjNMya
 K5lDQYKlyIKEpcUcJGiy3XrpMlJCQ8EAK6Q2fmIFY/UNoaZ8u1DyYoIQqivTGcG0NE4KPzo6
 WOFN/hIljPboCcGUkksKg7o24tS6C5L94WKUKkFU7z4QJlHa9eNkXC2bVGguZlNQKpOBOA7z
 ITjLGvGfmt/nM5AXx/DbsNO5QHrsw2/GNXfHaI9J3rYR93bt9HgtfxKPZs0xHlN8ALb15hEe
 S/m9OHXRyXqM+U3YXNX0946Xe/5h2EZ5LONDsWY61Z2XuDNmL1xravxX2IBflTupbCQ1olWV
 SKaKSYhWqKJCApXJMaqkwKux0dXI/SNlt5Yv1qMZ+5lmxHNI7i21BwwoZbQiIT45uhlhjpT7
 SMPK+5Uyabgi+aaojr2svhElxjcjf46Sr5fucSWGy/gIxXUxUhTjRPX/LcF5+aWgtcdKt/I6
 gySxRdc6Hz7fa61o2e/Y127Z0W6HNX14teO8AbB/Onukc7bzPV5zTv7TmbTQpAi8VBF67bRj
 7txMDXmxTV+Uf2K54eiZk2dH7m8arIOjk9rnRUMbrjh0y/q3/XWsts51Yd5E3ev66nsMpzke
 GpIOH9xiCO5q9amRU/FKRfB2Uh2v+APcyL4RHwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzXSe0xTZxQAcL97b797aazedExvUNQ0IRqjMDNYTnQa/zDziwY1RjFZ4qTR
 W9rxXMuYbFks0mqjm2JjS6SCBUPD2k5YC8uAlfDIyLaOQMUhKhUwHUIA8UFRXnatif+c/M4j
 J+ePw9HyJkkCp8krFLV5yhwFljLSQ7tKt69Ofaz+6ILzYxgoaWcgPGti4Ga9G4PJc0MCfXdc
 CIbDJgSvF200GJsjDCybu1mYnX/EQsTXjcAaMNPgbiyh4FXDWwyTXS8RWEZDGMonShiYcfyA
 oGLMxsLEH/therhVApHgUwruz00hcITeUhBqv4hg2ZoNt2q8GBZ7emkot/QhqB4N0jDeEG02
 dj9G4Ks7j+G/siYa+kOr4F54BsNflssYpgM3KXjWgMF+3ieBSpsZQentegzWSg8DzSMtLAQm
 lygYspopcHnSYdgxxoC/rIaK3hed+mUt2MpLqWgYp8DycysF8w4nC//cHmLAoU8CW0+/BJ7U
 VbCwNLoDIvZ86HY9ZSF41cLAneleyV4LIq+NVxji9P5KEePdZUzcVW5EFhfMiMzWltLEWBZN
 u6ZmaGLwfkNq/VOYLIT/xcQ3Z2fI3zUCudaznTRXBFliaHvIHtn5ufTTM2KOpkjUpuzJlKr7
 ysfpgib2rM1Vw+qRAV9CHCfwqYIxknEJxXGY3ywMDs7TMcfzmwTvj2OSmGnev14YCGyL+QP+
 kBC6EsYxM3yS4B+wUjHL+E8Ew8IgG7PAbxRcDe3v9sRF6/2jfiZmOZ8mGGcMVBmS2tEKJ4rX
 5BXlKjU5acm6bHVxnuZs8un8XA+KPpPj+6Vrv6HZ/v2diOeQYqUskBRUyyXKIl1xbicSOFoR
 L8usG1LLZWeUxd+K2vxT2q9zRF0nWscxirWyAyfETDmfpSwUs0WxQNS+71JcXIIejVSrPsMr
 H6hedOih+uizLwq+3L3meJtqzpK4oUPRtSj+mdWjYg+e3JbB6WQ+cnTnljeXPe6f2us7r7ec
 aP1uNaieHG9cvpDaWzUyaD+Xvuv3FKV5T1Jl8+FkF7E+T5xY410VkrGJRxKcX+07mGLyX0xX
 TfL6Y6evmj7cwD9PuD6vYHRq5Y6ttFan/B8Rux29SAMAAA==
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 03 Oct 2025 07:00:55 +0000
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
consideration to waitqueue wait, assuming an input 'ret' in
___wait_event() macro is used as a timeout value.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/wait.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/wait.h b/include/linux/wait.h
index 65dd50f25e54..902a2e5381db 100644
--- a/include/linux/wait.h
+++ b/include/linux/wait.h
@@ -306,7 +306,7 @@ extern void init_wait_entry(struct wait_queue_entry *wq_entry, int flags);
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

