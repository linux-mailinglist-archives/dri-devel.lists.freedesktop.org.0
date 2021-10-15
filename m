Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0C842ECF0
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 10:57:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E543D8984D;
	Fri, 15 Oct 2021 08:57:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 179E86ED01;
 Fri, 15 Oct 2021 08:57:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7E2EF21A5C;
 Fri, 15 Oct 2021 08:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1634288234; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1gJCQ4LKq38Wz8fQyxCuZehL+Con9ahBr+7Hnu4iI6I=;
 b=F/r+O+h+iiCGNp8KwZBMENDfACFkFv6d6ZqDw/HzgdY9FPQsFXmjr+XBgfDafwPyPlvjLr
 cv1FM7lLUVEWR36EcsyHyQ4/LTSrBYa7POxhrGK3rXJyDCpUpr9q4dPgIMYfvdbQU29mw8
 kQN/FeVyFSq8LWEm86jsroGvst3aKdA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1634288234;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1gJCQ4LKq38Wz8fQyxCuZehL+Con9ahBr+7Hnu4iI6I=;
 b=8Ac48pcXCsDs029dgkoosGntR8ftiitK/LY3GrjgF0Qb8QXn6VhOzoPZ4SoP4O2j0PCm8p
 3Q5Gbqe5LNpgwkCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3098F13B87;
 Fri, 15 Oct 2021 08:57:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CuQlC2pCaWHeIgAAMHmgww
 (envelope-from <vbabka@suse.cz>); Fri, 15 Oct 2021 08:57:14 +0000
Message-ID: <6abd9213-19a9-6d58-cedc-2414386d2d81@suse.cz>
Date: Fri, 15 Oct 2021 10:57:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3] lib/stackdepot: allow optional init and stack_table
 allocation by kvmalloc()
Content-Language: en-US
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 kasan-dev@googlegroups.com, Dmitry Vyukov <dvyukov@google.com>,
 Marco Elver <elver@google.com>, Vijayanand Jitta <vjitta@codeaurora.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Oliver Glitta
 <glittao@gmail.com>, Imran Khan <imran.f.khan@oracle.com>,
 Mike Rapoport <rppt@kernel.org>, kernel test robot <oliver.sang@intel.com>
References: <20211012090621.1357-1-vbabka@suse.cz>
 <20211013073005.11351-1-vbabka@suse.cz>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20211013073005.11351-1-vbabka@suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 10/13/21 09:30, Vlastimil Babka wrote:
> Currently, enabling CONFIG_STACKDEPOT means its stack_table will be allocated
> from memblock, even if stack depot ends up not actually used. The default size
> of stack_table is 4MB on 32-bit, 8MB on 64-bit.
> 
> This is fine for use-cases such as KASAN which is also a config option and
> has overhead on its own. But it's an issue for functionality that has to be
> actually enabled on boot (page_owner) or depends on hardware (GPU drivers)
> and thus the memory might be wasted. This was raised as an issue [1] when
> attempting to add stackdepot support for SLUB's debug object tracking
> functionality. It's common to build kernels with CONFIG_SLUB_DEBUG and enable
> slub_debug on boot only when needed, or create only specific kmem caches with
> debugging for testing purposes.
> 
> It would thus be more efficient if stackdepot's table was allocated only when
> actually going to be used. This patch thus makes the allocation (and whole
> stack_depot_init() call) optional:
> 
> - Add a CONFIG_STACKDEPOT_ALWAYS_INIT flag to keep using the current
>   well-defined point of allocation as part of mem_init(). Make CONFIG_KASAN
>   select this flag.
> - Other users have to call stack_depot_init() as part of their own init when
>   it's determined that stack depot will actually be used. This may depend on
>   both config and runtime conditions. Convert current users which are
>   page_owner and several in the DRM subsystem. Same will be done for SLUB
>   later.
> - Because the init might now be called after the boot-time memblock allocation
>   has given all memory to the buddy allocator, change stack_depot_init() to
>   allocate stack_table with kvmalloc() when memblock is no longer available.
>   Also handle allocation failure by disabling stackdepot (could have
>   theoretically happened even with memblock allocation previously), and don't
>   unnecessarily align the memblock allocation to its own size anymore.
> 
> [1] https://lore.kernel.org/all/CAMuHMdW=eoVzM1Re5FVoEN87nKfiLmM2+Ah7eNu2KXEhCvbZyA@mail.gmail.com/
...
> ---
> Changes in v3:
> - stack_depot_init_mutex made static and moved inside stack_depot_init()
>   Reported-by: kernel test robot <lkp@intel.com>
> - use !stack_table condition instead of stack_table == NULL
>   reported by checkpatch on freedesktop.org patchwork

The last change above was missing because I forgot git commit --amend before
git format-patch. More importantly there was a bot report for FLATMEM. Please
add this fixup. Thanks.

----8<----
From a971a1670491f8fbbaab579eef3c756a5263af95 Mon Sep 17 00:00:00 2001
From: Vlastimil Babka <vbabka@suse.cz>
Date: Thu, 7 Oct 2021 10:49:09 +0200
Subject: [PATCH] lib/stackdepot: allow optional init and stack_table
 allocation by kvmalloc() - fixup

On FLATMEM, we call page_ext_init_flatmem_late() just before kmem_cache_init()
which means stack_depot_init() (called by page owner init) will not recognize
properly it should use kvmalloc() and not memblock_alloc(). memblock_alloc()
will also not issue a warning and return a block memory that can be invalid and
cause kernel page fault when saving stacks, as reported by the kernel test
robot [1].

Fix this by moving page_ext_init_flatmem_late() below kmem_cache_init() so that
slab_is_available() is true during stack_depot_init(). SPARSEMEM doesn't have
this issue, as it doesn't do page_ext_init_flatmem_late(), but a different
page_ext_init() even later in the boot process.

Thanks to Mike Rapoport for pointing out the FLATMEM init ordering issue.

While at it, also actually resolve a checkpatch warning in stack_depot_init()
from DRM CI, which was supposed to be in the original patch already.

[1] https://lore.kernel.org/all/20211014085450.GC18719@xsang-OptiPlex-9020/

Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
Reported-by: kernel test robot <oliver.sang@intel.com>
---
 init/main.c      | 7 +++++--
 lib/stackdepot.c | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/init/main.c b/init/main.c
index ca2765c8e45c..0ab632f681c5 100644
--- a/init/main.c
+++ b/init/main.c
@@ -845,9 +845,12 @@ static void __init mm_init(void)
 	stack_depot_early_init();
 	mem_init();
 	mem_init_print_info();
-	/* page_owner must be initialized after buddy is ready */
-	page_ext_init_flatmem_late();
 	kmem_cache_init();
+	/*
+	 * page_owner must be initialized after buddy is ready, and also after
+	 * slab is ready so that stack_depot_init() works properly
+	 */
+	page_ext_init_flatmem_late();
 	kmemleak_init();
 	pgtable_init();
 	debug_objects_mem_init();
diff --git a/lib/stackdepot.c b/lib/stackdepot.c
index 049d7d025d78..1f8ea6d0899b 100644
--- a/lib/stackdepot.c
+++ b/lib/stackdepot.c
@@ -172,7 +172,7 @@ __ref int stack_depot_init(void)
 	static DEFINE_MUTEX(stack_depot_init_mutex);
 
 	mutex_lock(&stack_depot_init_mutex);
-	if (!stack_depot_disable && stack_table == NULL) {
+	if (!stack_depot_disable && !stack_table) {
 		size_t size = (STACK_HASH_SIZE * sizeof(struct stack_record *));
 		int i;
 
-- 
2.33.0

