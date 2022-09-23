Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 448EE5E83A5
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 22:30:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B82DA10E968;
	Fri, 23 Sep 2022 20:29:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3E6710E1C0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 20:28:26 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 s90-20020a17090a2f6300b00203a685a1aaso1281157pjd.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 13:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=eujrtSGOq59jOTSlMyMtJHMRMoZFoV7+aKKL9WahR+Y=;
 b=k4UX3TCq1IIsSInyemqFsmh0WiCy1eONpqV6WBGxZOR4dzhiLq2Vz0kHlsMvoPHk21
 PqPMhE0urE8JD1PtTXSL5tC7rmO6ToYRGxo5SlhGZBhYNFB788EhnZRkgoATYMEx3h/T
 hPotEfYpuuB9+pAHdhqWiFVdKm1koPQoMd3VI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=eujrtSGOq59jOTSlMyMtJHMRMoZFoV7+aKKL9WahR+Y=;
 b=BdN1hGfxK9TzCi0b52kfNmeNyH/V+LImKQuQQwKA48W1VNKWF7chn57vQk2PiUfPmz
 76SND1iWBa9KAqKXAyDuqxMtquCJK4nNu++5Cf/TInospzR4hBHt0f90FcFHjlta2Jpa
 IBQSrMedvMGHyFZVs1eCw/b6SeiPaTJ7azr/7OmZxmfrwuHSF9gAVuDA73DppMnFYX/a
 d/SKbQ4y1cAAwzsQbOx1+utvxJprrjNPWXenPOVDSTyJ/MXCUA/UaKO23SWw/BFByqfg
 5n2lusx+d7ojjk6QAs4Kyv4mINdfwQ433X/avLcWcfzqoxHEDdf+3q9e5qE5kXvtfhZW
 tKpA==
X-Gm-Message-State: ACrzQf3oPzp3B0vzl/8bL9DB3Fp4PIa8or/tdlZrXxoDbwNBFe3iZ4pp
 KI/xn0xk85mR+Ap93tePGuoCYg==
X-Google-Smtp-Source: AMsMyM4arELcwEhiFv6uNVRK1EaBx84nve4igHInBCGM2aOxeYsKhiPbrVjYcaijK4hZz+7Wtmnbxw==
X-Received: by 2002:a17:90b:3752:b0:200:b29b:f592 with SMTP id
 ne18-20020a17090b375200b00200b29bf592mr11404886pjb.81.1663964906237; 
 Fri, 23 Sep 2022 13:28:26 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 i4-20020a626d04000000b0054a1534516dsm6997283pfc.97.2022.09.23.13.28.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 13:28:25 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: [PATCH v2 02/16] slab: Introduce kmalloc_size_roundup()
Date: Fri, 23 Sep 2022 13:28:08 -0700
Message-Id: <20220923202822.2667581-3-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923202822.2667581-1-keescook@chromium.org>
References: <20220923202822.2667581-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7107; h=from:subject;
 bh=ctoECA+6FJaPyb38XvF9+OFYpV5OXgZbVo3ZPutoUjY=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBjLhbjUYOOZ7bQgh4tD/x26R+LVBeSKkGK0b8hyrFm
 j130NpWJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYy4W4wAKCRCJcvTf3G3AJtXaEA
 CKrYiDUN4IYzrCIGMgThdl68WEcVnsfmsISajqW1pS1PpX/7csAs7zEHuc4aiHGOuiIaH+DJHpGfLL
 DIL3lxVEdV+ODoDczAW/2FdIZ+iI9vim+KLP/kWkBUaUFFii75vz9kvknS3mWn5P11TwKPGqi/W2P4
 uEtng14BAapuZT0Q7tQ9SxpB1Y777eEGYvXOm9tw3vdOrDfUOD9EznvADwMu3Ry8C+wkCtnvE5BCdT
 Ebka8l0Kp8EOUqK+zPLzQCpp6ko0d8pfn+rEaQGghCKzjukSnrBv50BDTJhgU4I96egmD/O5x6utBl
 VMd9cHrXpoQX1m8qm7tBXnfpmU84bA+22D2ZBUwR1zOMuSWS+G2rmlY8u5bGvkll3WPwXmcrvjkueA
 P0yJVtSOapf50Df2ug7tk4aXVQ1t3A1rAvlW+zUEb5wvC8dUUS91TN5obYVzkRJHH3j0jx+IjUThl3
 UJnUD9or3++iRNE8vEGAUq0dJiwDAxt/TBRqbs+/ING+aPt3aEHmJHFbwwZ/tkUtc+pG98uuIomqcP
 frdsPLeoYkdNyoTUZrYCgmUK/g8uT6s+SyM7hlZmzyJmSx5zhZ2ieM1ayHGui9Q5DH+w0ZZiYhmD15
 k5ZMDJwqUzCSVlUY+Z8dRljudxu8GLQFuP07VbLhhHRLERwMtuGVAY3oFr0A==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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
Cc: llvm@lists.linux.dev, dri-devel@lists.freedesktop.org, "Ruhl,
 Michael J" <michael.j.ruhl@intel.com>, Eric Dumazet <edumazet@google.com>,
 linux-hardening@vger.kernel.org, Hyeonggon Yoo <42.hyeyoo@gmail.com>,
 Christoph Lameter <cl@linux.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 dev@openvswitch.org, x86@kernel.org,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 intel-wired-lan@lists.osuosl.org, David Rientjes <rientjes@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>,
 Josef Bacik <josef@toxicpanda.com>, linaro-mm-sig@lists.linaro.org,
 Yonghong Song <yhs@fb.com>, David Sterba <dsterba@suse.com>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, Alex Elder <elder@kernel.org>,
 linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Pekka Enberg <penberg@kernel.org>, Daniel Micay <danielmicay@gmail.com>,
 netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the effort to help the compiler reason about buffer sizes, the
__alloc_size attribute was added to allocators. This improves the scope
of the compiler's ability to apply CONFIG_UBSAN_BOUNDS and (in the near
future) CONFIG_FORTIFY_SOURCE. For most allocations, this works well,
as the vast majority of callers are not expecting to use more memory
than what they asked for.

There is, however, one common exception to this: anticipatory resizing
of kmalloc allocations. These cases all use ksize() to determine the
actual bucket size of a given allocation (e.g. 128 when 126 was asked
for). This comes in two styles in the kernel:

1) An allocation has been determined to be too small, and needs to be
   resized. Instead of the caller choosing its own next best size, it
   wants to minimize the number of calls to krealloc(), so it just uses
   ksize() plus some additional bytes, forcing the realloc into the next
   bucket size, from which it can learn how large it is now. For example:

	data = krealloc(data, ksize(data) + 1, gfp);
	data_len = ksize(data);

2) The minimum size of an allocation is calculated, but since it may
   grow in the future, just use all the space available in the chosen
   bucket immediately, to avoid needing to reallocate later. A good
   example of this is skbuff's allocators:

	data = kmalloc_reserve(size, gfp_mask, node, &pfmemalloc);
	...
	/* kmalloc(size) might give us more room than requested.
	 * Put skb_shared_info exactly at the end of allocated zone,
	 * to allow max possible filling before reallocation.
	 */
	osize = ksize(data);
        size = SKB_WITH_OVERHEAD(osize);

In both cases, the "how much was actually allocated?" question is answered
_after_ the allocation, where the compiler hinting is not in an easy place
to make the association any more. This mismatch between the compiler's
view of the buffer length and the code's intention about how much it is
going to actually use has already caused problems[1]. It is possible to
fix this by reordering the use of the "actual size" information.

We can serve the needs of users of ksize() and still have accurate buffer
length hinting for the compiler by doing the bucket size calculation
_before_ the allocation. Code can instead ask "how large an allocation
would I get for a given size?".

Introduce kmalloc_size_roundup(), to serve this function so we can start
replacing the "anticipatory resizing" uses of ksize().

[1] https://github.com/ClangBuiltLinux/linux/issues/1599
    https://github.com/KSPP/linux/issues/183

Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Christoph Lameter <cl@linux.com>
Cc: Pekka Enberg <penberg@kernel.org>
Cc: David Rientjes <rientjes@google.com>
Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/linux/slab.h | 31 +++++++++++++++++++++++++++++++
 mm/slab.c            |  9 ++++++---
 mm/slab_common.c     | 20 ++++++++++++++++++++
 3 files changed, 57 insertions(+), 3 deletions(-)

diff --git a/include/linux/slab.h b/include/linux/slab.h
index 41bd036e7551..727640173568 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -188,7 +188,21 @@ void * __must_check krealloc(const void *objp, size_t new_size, gfp_t flags) __r
 void kfree(const void *objp);
 void kfree_sensitive(const void *objp);
 size_t __ksize(const void *objp);
+
+/**
+ * ksize - Report actual allocation size of associated object
+ *
+ * @objp: Pointer returned from a prior kmalloc()-family allocation.
+ *
+ * This should not be used for writing beyond the originally requested
+ * allocation size. Either use krealloc() or round up the allocation size
+ * with kmalloc_size_roundup() prior to allocation. If this is used to
+ * access beyond the originally requested allocation size, UBSAN_BOUNDS
+ * and/or FORTIFY_SOURCE may trip, since they only know about the
+ * originally allocated size via the __alloc_size attribute.
+ */
 size_t ksize(const void *objp);
+
 #ifdef CONFIG_PRINTK
 bool kmem_valid_obj(void *object);
 void kmem_dump_obj(void *object);
@@ -779,6 +793,23 @@ extern void kvfree(const void *addr);
 extern void kvfree_sensitive(const void *addr, size_t len);
 
 unsigned int kmem_cache_size(struct kmem_cache *s);
+
+/**
+ * kmalloc_size_roundup - Report allocation bucket size for the given size
+ *
+ * @size: Number of bytes to round up from.
+ *
+ * This returns the number of bytes that would be available in a kmalloc()
+ * allocation of @size bytes. For example, a 126 byte request would be
+ * rounded up to the next sized kmalloc bucket, 128 bytes. (This is strictly
+ * for the general-purpose kmalloc()-based allocations, and is not for the
+ * pre-sized kmem_cache_alloc()-based allocations.)
+ *
+ * Use this to kmalloc() the full bucket size ahead of time instead of using
+ * ksize() to query the size after an allocation.
+ */
+size_t kmalloc_size_roundup(size_t size);
+
 void __init kmem_cache_init_late(void);
 
 #if defined(CONFIG_SMP) && defined(CONFIG_SLAB)
diff --git a/mm/slab.c b/mm/slab.c
index 10e96137b44f..2da862bf6226 100644
--- a/mm/slab.c
+++ b/mm/slab.c
@@ -4192,11 +4192,14 @@ void __check_heap_object(const void *ptr, unsigned long n,
 #endif /* CONFIG_HARDENED_USERCOPY */
 
 /**
- * __ksize -- Uninstrumented ksize.
+ * __ksize -- Report full size of underlying allocation
  * @objp: pointer to the object
  *
- * Unlike ksize(), __ksize() is uninstrumented, and does not provide the same
- * safety checks as ksize() with KASAN instrumentation enabled.
+ * This should only be used internally to query the true size of allocations.
+ * It is not meant to be a way to discover the usable size of an allocation
+ * after the fact. Instead, use kmalloc_size_roundup(). Using memory beyond
+ * the originally requested allocation size may trigger KASAN, UBSAN_BOUNDS,
+ * and/or FORTIFY_SOURCE.
  *
  * Return: size of the actual memory used by @objp in bytes
  */
diff --git a/mm/slab_common.c b/mm/slab_common.c
index 457671ace7eb..d7420cf649f8 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -721,6 +721,26 @@ struct kmem_cache *kmalloc_slab(size_t size, gfp_t flags)
 	return kmalloc_caches[kmalloc_type(flags)][index];
 }
 
+size_t kmalloc_size_roundup(size_t size)
+{
+	struct kmem_cache *c;
+
+	/* Short-circuit the 0 size case. */
+	if (unlikely(size == 0))
+		return 0;
+	/* Short-circuit saturated "too-large" case. */
+	if (unlikely(size == SIZE_MAX))
+		return SIZE_MAX;
+	/* Above the smaller buckets, size is a multiple of page size. */
+	if (size > KMALLOC_MAX_CACHE_SIZE)
+		return PAGE_SIZE << get_order(size);
+
+	/* The flags don't matter since size_index is common to all. */
+	c = kmalloc_slab(size, GFP_KERNEL);
+	return c ? c->object_size : 0;
+}
+EXPORT_SYMBOL(kmalloc_size_roundup);
+
 #ifdef CONFIG_ZONE_DMA
 #define KMALLOC_DMA_NAME(sz)	.name[KMALLOC_DMA] = "dma-kmalloc-" #sz,
 #else
-- 
2.34.1

