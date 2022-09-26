Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7011E5EAE9E
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 19:50:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9662410E4CE;
	Mon, 26 Sep 2022 17:50:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9317710E4C0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 17:50:39 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 s90-20020a17090a2f6300b00203a685a1aaso7681024pjd.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 10:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=TNDUsCjQ4zB2/5GZ7X+uS9zeoK4Uz9rg4Dmc7gG+Kts=;
 b=diPFMelUGqg5Olz6I8z2UqQgP/qT0p6U2CTPr1IKXAPPQDlXjIbGiW+Mq8ZW/AJerP
 YVtmTqGjAus4WfzbTh4Tizc48Roo/vvFh6ncx714UJ4hLWN/DikhBXoZzoyhCy7LE6Y/
 3OYOMIYymLSLRxuRHD8IaRlLtQ4iFKBE+1Png=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=TNDUsCjQ4zB2/5GZ7X+uS9zeoK4Uz9rg4Dmc7gG+Kts=;
 b=FfaA6g+loaEYA3cUoZGOCFioGss880u9oIilQFaEbQfR01istBeOq3L4kXl9mfs/bf
 FE1I/H9SXe+3Nsi1T+QP+LNv07oOjEa/3uAlc2EgYbGdUqnBRdPYoDEebEkJCmt2Q/om
 FqpBJ9FUO64K6lbY0VE7SMu8ZvkXvq5X47vEvsQD/DP6CD+RfkTbYHlERmUtiYTxwJDi
 OVZmwKvO1ol50NdHxIc/LLNL1JaO01x+Gr0q+QpsEDzyK38d0TtdVrj2UNQYLvmbN8ka
 06dhCfxVoPUYz79suyri+xf/9DPu4x5suwvkx8V7q8B/qCWtNtE0d5BfQCFWyW/H1v5r
 6ENA==
X-Gm-Message-State: ACrzQf3pMFLN/02i2cMwjfKYzJ1xXFYcbiSxwWIbqvcCoDOPMs6lbsqP
 8gF5l6oY66BvLcRVHKEObWmRYQ==
X-Google-Smtp-Source: AMsMyM53HUNBt6kGZBRWVtwFK3cgJAVMJrfeOBQoCVB2uG4qpYwM3FiGKu6g/YmgMRQUrRqqychKmQ==
X-Received: by 2002:a17:90a:a09:b0:202:ab93:2afb with SMTP id
 o9-20020a17090a0a0900b00202ab932afbmr37124281pjo.60.1664214639071; 
 Mon, 26 Sep 2022 10:50:39 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa79f0d000000b00536097dd45bsm12539497pfr.134.2022.09.26.10.50.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 10:50:37 -0700 (PDT)
Date: Mon, 26 Sep 2022 10:50:36 -0700
From: Kees Cook <keescook@chromium.org>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH v2 02/16] slab: Introduce kmalloc_size_roundup()
Message-ID: <202209261050.560459B@keescook>
References: <20220923202822.2667581-1-keescook@chromium.org>
 <20220923202822.2667581-3-keescook@chromium.org>
 <e0326835-9b0d-af1b-bd22-2aadb178bd25@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0326835-9b0d-af1b-bd22-2aadb178bd25@suse.cz>
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
 Miguel Ojeda <ojeda@kernel.org>, Yonghong Song <yhs@fb.com>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Marco Elver <elver@google.com>, Josef Bacik <josef@toxicpanda.com>,
 linaro-mm-sig@lists.linaro.org, Jakub Kicinski <kuba@kernel.org>,
 David Sterba <dsterba@suse.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Alex Elder <elder@kernel.org>, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Pekka Enberg <penberg@kernel.org>, Daniel Micay <danielmicay@gmail.com>,
 netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 26, 2022 at 03:15:22PM +0200, Vlastimil Babka wrote:
> On 9/23/22 22:28, Kees Cook wrote:
> > In the effort to help the compiler reason about buffer sizes, the
> > __alloc_size attribute was added to allocators. This improves the scope
> > of the compiler's ability to apply CONFIG_UBSAN_BOUNDS and (in the near
> > future) CONFIG_FORTIFY_SOURCE. For most allocations, this works well,
> > as the vast majority of callers are not expecting to use more memory
> > than what they asked for.
> > 
> > There is, however, one common exception to this: anticipatory resizing
> > of kmalloc allocations. These cases all use ksize() to determine the
> > actual bucket size of a given allocation (e.g. 128 when 126 was asked
> > for). This comes in two styles in the kernel:
> > 
> > 1) An allocation has been determined to be too small, and needs to be
> >     resized. Instead of the caller choosing its own next best size, it
> >     wants to minimize the number of calls to krealloc(), so it just uses
> >     ksize() plus some additional bytes, forcing the realloc into the next
> >     bucket size, from which it can learn how large it is now. For example:
> > 
> > 	data = krealloc(data, ksize(data) + 1, gfp);
> > 	data_len = ksize(data);
> > 
> > 2) The minimum size of an allocation is calculated, but since it may
> >     grow in the future, just use all the space available in the chosen
> >     bucket immediately, to avoid needing to reallocate later. A good
> >     example of this is skbuff's allocators:
> > 
> > 	data = kmalloc_reserve(size, gfp_mask, node, &pfmemalloc);
> > 	...
> > 	/* kmalloc(size) might give us more room than requested.
> > 	 * Put skb_shared_info exactly at the end of allocated zone,
> > 	 * to allow max possible filling before reallocation.
> > 	 */
> > 	osize = ksize(data);
> >          size = SKB_WITH_OVERHEAD(osize);
> > 
> > In both cases, the "how much was actually allocated?" question is answered
> > _after_ the allocation, where the compiler hinting is not in an easy place
> > to make the association any more. This mismatch between the compiler's
> > view of the buffer length and the code's intention about how much it is
> > going to actually use has already caused problems[1]. It is possible to
> > fix this by reordering the use of the "actual size" information.
> > 
> > We can serve the needs of users of ksize() and still have accurate buffer
> > length hinting for the compiler by doing the bucket size calculation
> > _before_ the allocation. Code can instead ask "how large an allocation
> > would I get for a given size?".
> > 
> > Introduce kmalloc_size_roundup(), to serve this function so we can start
> > replacing the "anticipatory resizing" uses of ksize().
> > 
> > [1] https://github.com/ClangBuiltLinux/linux/issues/1599
> >      https://github.com/KSPP/linux/issues/183
> > 
> > Cc: Vlastimil Babka <vbabka@suse.cz>
> > Cc: Christoph Lameter <cl@linux.com>
> > Cc: Pekka Enberg <penberg@kernel.org>
> > Cc: David Rientjes <rientjes@google.com>
> > Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: linux-mm@kvack.org
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> 
> OK, added patch 1+2 to slab.git for-next branch.
> Had to adjust this one a bit, see below.
> 
> > ---
> >   include/linux/slab.h | 31 +++++++++++++++++++++++++++++++
> >   mm/slab.c            |  9 ++++++---
> >   mm/slab_common.c     | 20 ++++++++++++++++++++
> >   3 files changed, 57 insertions(+), 3 deletions(-)
> > 
> > diff --git a/include/linux/slab.h b/include/linux/slab.h
> > index 41bd036e7551..727640173568 100644
> > --- a/include/linux/slab.h
> > +++ b/include/linux/slab.h
> > @@ -188,7 +188,21 @@ void * __must_check krealloc(const void *objp, size_t new_size, gfp_t flags) __r
> >   void kfree(const void *objp);
> >   void kfree_sensitive(const void *objp);
> >   size_t __ksize(const void *objp);
> > +
> > +/**
> > + * ksize - Report actual allocation size of associated object
> > + *
> > + * @objp: Pointer returned from a prior kmalloc()-family allocation.
> > + *
> > + * This should not be used for writing beyond the originally requested
> > + * allocation size. Either use krealloc() or round up the allocation size
> > + * with kmalloc_size_roundup() prior to allocation. If this is used to
> > + * access beyond the originally requested allocation size, UBSAN_BOUNDS
> > + * and/or FORTIFY_SOURCE may trip, since they only know about the
> > + * originally allocated size via the __alloc_size attribute.
> > + */
> >   size_t ksize(const void *objp);
> > +
> >   #ifdef CONFIG_PRINTK
> >   bool kmem_valid_obj(void *object);
> >   void kmem_dump_obj(void *object);
> > @@ -779,6 +793,23 @@ extern void kvfree(const void *addr);
> >   extern void kvfree_sensitive(const void *addr, size_t len);
> >   unsigned int kmem_cache_size(struct kmem_cache *s);
> > +
> > +/**
> > + * kmalloc_size_roundup - Report allocation bucket size for the given size
> > + *
> > + * @size: Number of bytes to round up from.
> > + *
> > + * This returns the number of bytes that would be available in a kmalloc()
> > + * allocation of @size bytes. For example, a 126 byte request would be
> > + * rounded up to the next sized kmalloc bucket, 128 bytes. (This is strictly
> > + * for the general-purpose kmalloc()-based allocations, and is not for the
> > + * pre-sized kmem_cache_alloc()-based allocations.)
> > + *
> > + * Use this to kmalloc() the full bucket size ahead of time instead of using
> > + * ksize() to query the size after an allocation.
> > + */
> > +size_t kmalloc_size_roundup(size_t size);
> > +
> >   void __init kmem_cache_init_late(void);
> >   #if defined(CONFIG_SMP) && defined(CONFIG_SLAB)
> > diff --git a/mm/slab.c b/mm/slab.c
> > index 10e96137b44f..2da862bf6226 100644
> > --- a/mm/slab.c
> > +++ b/mm/slab.c
> > @@ -4192,11 +4192,14 @@ void __check_heap_object(const void *ptr, unsigned long n,
> >   #endif /* CONFIG_HARDENED_USERCOPY */
> >   /**
> > - * __ksize -- Uninstrumented ksize.
> > + * __ksize -- Report full size of underlying allocation
> >    * @objp: pointer to the object
> >    *
> > - * Unlike ksize(), __ksize() is uninstrumented, and does not provide the same
> > - * safety checks as ksize() with KASAN instrumentation enabled.
> > + * This should only be used internally to query the true size of allocations.
> > + * It is not meant to be a way to discover the usable size of an allocation
> > + * after the fact. Instead, use kmalloc_size_roundup(). Using memory beyond
> > + * the originally requested allocation size may trigger KASAN, UBSAN_BOUNDS,
> > + * and/or FORTIFY_SOURCE.
> >    *
> >    * Return: size of the actual memory used by @objp in bytes
> >    */
> > diff --git a/mm/slab_common.c b/mm/slab_common.c
> > index 457671ace7eb..d7420cf649f8 100644
> > --- a/mm/slab_common.c
> > +++ b/mm/slab_common.c
> > @@ -721,6 +721,26 @@ struct kmem_cache *kmalloc_slab(size_t size, gfp_t flags)
> >   	return kmalloc_caches[kmalloc_type(flags)][index];
> >   }
> > +size_t kmalloc_size_roundup(size_t size)
> > +{
> > +	struct kmem_cache *c;
> > +
> > +	/* Short-circuit the 0 size case. */
> > +	if (unlikely(size == 0))
> > +		return 0;
> > +	/* Short-circuit saturated "too-large" case. */
> > +	if (unlikely(size == SIZE_MAX))
> > +		return SIZE_MAX;
> > +	/* Above the smaller buckets, size is a multiple of page size. */
> > +	if (size > KMALLOC_MAX_CACHE_SIZE)
> > +		return PAGE_SIZE << get_order(size);
> > +
> > +	/* The flags don't matter since size_index is common to all. */
> > +	c = kmalloc_slab(size, GFP_KERNEL);
> > +	return c ? c->object_size : 0;
> > +}
> > +EXPORT_SYMBOL(kmalloc_size_roundup);
> 
> We need a SLOB version too as it's not yet removed... I added this:
> 
> diff --git a/mm/slob.c b/mm/slob.c
> index 2bd4f476c340..5dbdf6ad8bcc 100644
> --- a/mm/slob.c
> +++ b/mm/slob.c
> @@ -574,6 +574,20 @@ void kfree(const void *block)
>  }
>  EXPORT_SYMBOL(kfree);
> +size_t kmalloc_size_roundup(size_t size)
> +{
> +       /* Short-circuit the 0 size case. */
> +       if (unlikely(size == 0))
> +               return 0;
> +       /* Short-circuit saturated "too-large" case. */
> +       if (unlikely(size == SIZE_MAX))
> +               return SIZE_MAX;
> +
> +       return ALIGN(size, ARCH_KMALLOC_MINALIGN);
> +}
> +
> +EXPORT_SYMBOL(kmalloc_size_roundup);

Ah, perfect! Thanks for catching that. :)

FWIW:

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
