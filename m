Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F41242A0A2
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 11:06:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 925026E80B;
	Tue, 12 Oct 2021 09:06:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC86D6E80B;
 Tue, 12 Oct 2021 09:06:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 38E4720189;
 Tue, 12 Oct 2021 09:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1634029588; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=uSrXLVrPpCa+6u48GX+1yd8aXZAjPjzqC8eBojPc6dE=;
 b=UgEGQZxbVIjo+e2WvOToXqsmsMJ4SFwBug/p73slEpf2mYj0GVpb0f2ZoK3xXi8TrBnegS
 Jqh7Eadi2te4JPeL2a6FVfzP2NGX02JBcsZHUKicuybN4jFHn4ZndUUvwGoqja7KuIdURU
 d5endPGqroGCYSinWNFQJfDxp/ZnJes=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1634029588;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=uSrXLVrPpCa+6u48GX+1yd8aXZAjPjzqC8eBojPc6dE=;
 b=7yNHZz81rueif2vGgS0JC7nDeQAqlFXYQ15nd23qz9ON4snkYSHvhkcYvaFCLeVUH05t7M
 /7R0WhaECRevzGCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D4E38132D4;
 Tue, 12 Oct 2021 09:06:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id B01QMxNQZWH6WwAAMHmgww
 (envelope-from <vbabka@suse.cz>); Tue, 12 Oct 2021 09:06:27 +0000
From: Vlastimil Babka <vbabka@suse.cz>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 kasan-dev@googlegroups.com, Vlastimil Babka <vbabka@suse.cz>,
 Dmitry Vyukov <dvyukov@google.com>, Marco Elver <elver@google.com>,
 Vijayanand Jitta <vjitta@codeaurora.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Oliver Glitta <glittao@gmail.com>, Imran Khan <imran.f.khan@oracle.com>
Subject: [PATCH v2] lib/stackdepot: allow optional init and stack_table
 allocation by kvmalloc()
Date: Tue, 12 Oct 2021 11:06:21 +0200
Message-Id: <20211012090621.1357-1-vbabka@suse.cz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9943; h=from:subject;
 bh=HfbmzwDhXUrmy+xtvEqvLB/Yki46zd4v1cBuuNOeFt8=;
 b=owEBbQGS/pANAwAIAeAhynPxiakQAcsmYgBhZU/8kwOwccXDS+TdKj4Bn+8pHlZ6Ka62HIunEtF2
 Lpf8qA2JATMEAAEIAB0WIQSNS5MBqTXjGL5IXszgIcpz8YmpEAUCYWVP/AAKCRDgIcpz8YmpEKMiCA
 CzeR8Uc7Ltm469D8xi/HsCwK3g1XgNweDjRk6N7yg87kuxb7IHJeGJpYvVhOtDPiNPE4+V7vtCQP3E
 N4O4eScgP4zdSRysjZtjohQ6L7KNE3FIz8sjue9flrBzrYo7JwE3Hp9JZS3TC9Y3lABnphNjBvzz64
 5c1LgR7kXZFB+jxvxkTRpxhMLs/RbI3VP60W7Mirypqgf59Jgx0Yli56xpBHQKW/i2YqOGralxxdtl
 3I5Vz1GNNnpnWMPTwmQ7v6YJVB5Ab26xC/jBqvAa+fkva+sUiQaZTodh1RO76UO95G4tkjNS82zAEn
 mvzP/D8S10Ov+0WwtSS6vrDo58wu8J
X-Developer-Key: i=vbabka@suse.cz; a=openpgp;
 fpr=A940D434992C2E8E99103D50224FA7E7CC82A664
Content-Transfer-Encoding: 8bit
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

Currently, enabling CONFIG_STACKDEPOT means its stack_table will be allocated
from memblock, even if stack depot ends up not actually used. The default size
of stack_table is 4MB on 32-bit, 8MB on 64-bit.

This is fine for use-cases such as KASAN which is also a config option and
has overhead on its own. But it's an issue for functionality that has to be
actually enabled on boot (page_owner) or depends on hardware (GPU drivers)
and thus the memory might be wasted. This was raised as an issue [1] when
attempting to add stackdepot support for SLUB's debug object tracking
functionality. It's common to build kernels with CONFIG_SLUB_DEBUG and enable
slub_debug on boot only when needed, or create only specific kmem caches with
debugging for testing purposes.

It would thus be more efficient if stackdepot's table was allocated only when
actually going to be used. This patch thus makes the allocation (and whole
stack_depot_init() call) optional:

- Add a CONFIG_STACKDEPOT_ALWAYS_INIT flag to keep using the current
  well-defined point of allocation as part of mem_init(). Make CONFIG_KASAN
  select this flag.
- Other users have to call stack_depot_init() as part of their own init when
  it's determined that stack depot will actually be used. This may depend on
  both config and runtime conditions. Convert current users which are
  page_owner and several in the DRM subsystem. Same will be done for SLUB
  later.
- Because the init might now be called after the boot-time memblock allocation
  has given all memory to the buddy allocator, change stack_depot_init() to
  allocate stack_table with kvmalloc() when memblock is no longer available.
  Also handle allocation failure by disabling stackdepot (could have
  theoretically happened even with memblock allocation previously), and don't
  unnecessarily align the memblock allocation to its own size anymore.

[1] https://lore.kernel.org/all/CAMuHMdW=eoVzM1Re5FVoEN87nKfiLmM2+Ah7eNu2KXEhCvbZyA@mail.gmail.com/

Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
Acked-by: Dmitry Vyukov <dvyukov@google.com>
Cc: Marco Elver <elver@google.com>
Cc: Vijayanand Jitta <vjitta@codeaurora.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Alexander Potapenko <glider@google.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Dmitry Vyukov <dvyukov@google.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Oliver Glitta <glittao@gmail.com>
Cc: Imran Khan <imran.f.khan@oracle.com>
---
Changes in v2:
- Rebase to v5.15-rc5.
- Stylistic changes suggested by Marco Elver.
 drivers/gpu/drm/drm_dp_mst_topology.c   |  1 +
 drivers/gpu/drm/drm_mm.c                |  4 ++++
 drivers/gpu/drm/i915/intel_runtime_pm.c |  3 +++
 include/linux/stackdepot.h              | 25 ++++++++++++-------
 init/main.c                             |  2 +-
 lib/Kconfig                             |  4 ++++
 lib/Kconfig.kasan                       |  2 +-
 lib/stackdepot.c                        | 32 +++++++++++++++++++++----
 mm/page_owner.c                         |  2 ++
 9 files changed, 59 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 86d13d6bc463..b0ebdc843a00 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -5493,6 +5493,7 @@ int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
 	mutex_init(&mgr->probe_lock);
 #if IS_ENABLED(CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS)
 	mutex_init(&mgr->topology_ref_history_lock);
+	stack_depot_init();
 #endif
 	INIT_LIST_HEAD(&mgr->tx_msg_downq);
 	INIT_LIST_HEAD(&mgr->destroy_port_list);
diff --git a/drivers/gpu/drm/drm_mm.c b/drivers/gpu/drm/drm_mm.c
index 93d48a6f04ab..5916228ea0c9 100644
--- a/drivers/gpu/drm/drm_mm.c
+++ b/drivers/gpu/drm/drm_mm.c
@@ -983,6 +983,10 @@ void drm_mm_init(struct drm_mm *mm, u64 start, u64 size)
 	add_hole(&mm->head_node);
 
 	mm->scan_active = 0;
+
+#ifdef CONFIG_DRM_DEBUG_MM
+	stack_depot_init();
+#endif
 }
 EXPORT_SYMBOL(drm_mm_init);
 
diff --git a/drivers/gpu/drm/i915/intel_runtime_pm.c b/drivers/gpu/drm/i915/intel_runtime_pm.c
index eaf7688f517d..d083506986e1 100644
--- a/drivers/gpu/drm/i915/intel_runtime_pm.c
+++ b/drivers/gpu/drm/i915/intel_runtime_pm.c
@@ -78,6 +78,9 @@ static void __print_depot_stack(depot_stack_handle_t stack,
 static void init_intel_runtime_pm_wakeref(struct intel_runtime_pm *rpm)
 {
 	spin_lock_init(&rpm->debug.lock);
+
+	if (rpm->available)
+		stack_depot_init();
 }
 
 static noinline depot_stack_handle_t
diff --git a/include/linux/stackdepot.h b/include/linux/stackdepot.h
index 6bb4bc1a5f54..40fc5e92194f 100644
--- a/include/linux/stackdepot.h
+++ b/include/linux/stackdepot.h
@@ -13,6 +13,22 @@
 
 typedef u32 depot_stack_handle_t;
 
+/*
+ * Every user of stack depot has to call this during its own init when it's
+ * decided that it will be calling stack_depot_save() later.
+ *
+ * The alternative is to select STACKDEPOT_ALWAYS_INIT to have stack depot
+ * enabled as part of mm_init(), for subsystems where it's known at compile time
+ * that stack depot will be used.
+ */
+int stack_depot_init(void);
+
+#ifdef CONFIG_STACKDEPOT_ALWAYS_INIT
+static inline int stack_depot_early_init(void)	{ return stack_depot_init(); }
+#else
+static inline int stack_depot_early_init(void)	{ return 0; }
+#endif
+
 depot_stack_handle_t stack_depot_save(unsigned long *entries,
 				      unsigned int nr_entries, gfp_t gfp_flags);
 
@@ -21,13 +37,4 @@ unsigned int stack_depot_fetch(depot_stack_handle_t handle,
 
 unsigned int filter_irq_stacks(unsigned long *entries, unsigned int nr_entries);
 
-#ifdef CONFIG_STACKDEPOT
-int stack_depot_init(void);
-#else
-static inline int stack_depot_init(void)
-{
-	return 0;
-}
-#endif	/* CONFIG_STACKDEPOT */
-
 #endif
diff --git a/init/main.c b/init/main.c
index 81a79a77db46..ca2765c8e45c 100644
--- a/init/main.c
+++ b/init/main.c
@@ -842,7 +842,7 @@ static void __init mm_init(void)
 	init_mem_debugging_and_hardening();
 	kfence_alloc_pool();
 	report_meminit();
-	stack_depot_init();
+	stack_depot_early_init();
 	mem_init();
 	mem_init_print_info();
 	/* page_owner must be initialized after buddy is ready */
diff --git a/lib/Kconfig b/lib/Kconfig
index 5e7165e6a346..9d0569084152 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -671,6 +671,10 @@ config STACKDEPOT
 	bool
 	select STACKTRACE
 
+config STACKDEPOT_ALWAYS_INIT
+	bool
+	select STACKDEPOT
+
 config STACK_HASH_ORDER
 	int "stack depot hash size (12 => 4KB, 20 => 1024KB)"
 	range 12 20
diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
index cdc842d090db..879757b6dd14 100644
--- a/lib/Kconfig.kasan
+++ b/lib/Kconfig.kasan
@@ -38,7 +38,7 @@ menuconfig KASAN
 		    CC_HAS_WORKING_NOSANITIZE_ADDRESS) || \
 		   HAVE_ARCH_KASAN_HW_TAGS
 	depends on (SLUB && SYSFS) || (SLAB && !DEBUG_SLAB)
-	select STACKDEPOT
+	select STACKDEPOT_ALWAYS_INIT
 	help
 	  Enables KASAN (KernelAddressSANitizer) - runtime memory debugger,
 	  designed to find out-of-bounds accesses and use-after-free bugs.
diff --git a/lib/stackdepot.c b/lib/stackdepot.c
index 0a2e417f83cb..9bb5333bf02f 100644
--- a/lib/stackdepot.c
+++ b/lib/stackdepot.c
@@ -24,6 +24,7 @@
 #include <linux/jhash.h>
 #include <linux/kernel.h>
 #include <linux/mm.h>
+#include <linux/mutex.h>
 #include <linux/percpu.h>
 #include <linux/printk.h>
 #include <linux/slab.h>
@@ -146,6 +147,7 @@ static struct stack_record *depot_alloc_stack(unsigned long *entries, int size,
 #define STACK_HASH_MASK (STACK_HASH_SIZE - 1)
 #define STACK_HASH_SEED 0x9747b28c
 
+DEFINE_MUTEX(stack_depot_init_mutex);
 static bool stack_depot_disable;
 static struct stack_record **stack_table;
 
@@ -162,18 +164,38 @@ static int __init is_stack_depot_disabled(char *str)
 }
 early_param("stack_depot_disable", is_stack_depot_disabled);
 
-int __init stack_depot_init(void)
+/*
+ * __ref because of memblock_alloc(), which will not be actually called after
+ * the __init code is gone, because at that point slab_is_available() is true
+ */
+__ref int stack_depot_init(void)
 {
-	if (!stack_depot_disable) {
+	mutex_lock(&stack_depot_init_mutex);
+	if (!stack_depot_disable && stack_table == NULL) {
 		size_t size = (STACK_HASH_SIZE * sizeof(struct stack_record *));
 		int i;
 
-		stack_table = memblock_alloc(size, size);
-		for (i = 0; i < STACK_HASH_SIZE;  i++)
-			stack_table[i] = NULL;
+		if (slab_is_available()) {
+			pr_info("Stack Depot allocating hash table with kvmalloc\n");
+			stack_table = kvmalloc(size, GFP_KERNEL);
+		} else {
+			pr_info("Stack Depot allocating hash table with memblock_alloc\n");
+			stack_table = memblock_alloc(size, SMP_CACHE_BYTES);
+		}
+		if (stack_table) {
+			for (i = 0; i < STACK_HASH_SIZE;  i++)
+				stack_table[i] = NULL;
+		} else {
+			pr_err("Stack Depot failed hash table allocationg, disabling\n");
+			stack_depot_disable = true;
+			mutex_unlock(&stack_depot_init_mutex);
+			return -ENOMEM;
+		}
 	}
+	mutex_unlock(&stack_depot_init_mutex);
 	return 0;
 }
+EXPORT_SYMBOL_GPL(stack_depot_init);
 
 /* Calculate hash for a stack */
 static inline u32 hash_stack(unsigned long *entries, unsigned int size)
diff --git a/mm/page_owner.c b/mm/page_owner.c
index 62402d22539b..16a0ef903384 100644
--- a/mm/page_owner.c
+++ b/mm/page_owner.c
@@ -80,6 +80,8 @@ static void init_page_owner(void)
 	if (!page_owner_enabled)
 		return;
 
+	stack_depot_init();
+
 	register_dummy_stack();
 	register_failure_stack();
 	register_early_stack();
-- 
2.33.0

