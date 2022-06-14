Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFAF54B1E6
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 15:05:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82B8910F8BE;
	Tue, 14 Jun 2022 13:05:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB6B410F8BE
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 13:05:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 72EE11F899;
 Tue, 14 Jun 2022 13:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1655211928; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l5MLiLIewYAuhnoSSewDxITeaWh65ALzvG8g23+AsnQ=;
 b=XAKIbySfJeZlWAUb4XvzTdwWr6jaBJyunR3aCj3Y4AJ3reNnXfUYIorazWg7V8/i2MYkhk
 iIbCg4DHno/OCqGLwq+dC209Rmk5BL4cBYpHxZ7V/pwsbDFl3+2Xrk9TZ7Rc6mrz5FST7a
 bm2bb65Fpi13BVw9qfJtSuTXQWTwZO8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1655211928;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l5MLiLIewYAuhnoSSewDxITeaWh65ALzvG8g23+AsnQ=;
 b=bAtm/E8qWNtDo8C7WiG6NK/GYLAXvmm0ue8eoR0TEXWBPVNt/rgE2p4uliOiJq0J0dCUmM
 i/OUR1TH97ND+WDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 487851361C;
 Tue, 14 Jun 2022 13:05:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qBrrEJiHqGKeHgAAMHmgww
 (envelope-from <vbabka@suse.cz>); Tue, 14 Jun 2022 13:05:28 +0000
Message-ID: <c5a0e1e5-026a-19ba-ac5e-7a0012acd8ee@suse.cz>
Date: Tue, 14 Jun 2022 15:05:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/3] mm/slab: delete cache_alloc_debugcheck_before()
Content-Language: en-US
To: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>
References: <20220605152539.3196045-1-daniel.vetter@ffwll.ch>
 <20220605152539.3196045-2-daniel.vetter@ffwll.ch>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20220605152539.3196045-2-daniel.vetter@ffwll.ch>
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
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Pekka Enberg <penberg@kernel.org>, linux-mm@kvack.org,
 David Rientjes <rientjes@google.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Christoph Lameter <cl@linux.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/5/22 17:25, Daniel Vetter wrote:
> It only does a might_sleep_if(GFP_RECLAIM) check, which is already
> covered by the might_alloc() in slab_pre_alloc_hook(). And all callers
> of cache_alloc_debugcheck_before() call that beforehand already.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Christoph Lameter <cl@linux.com>
> Cc: Pekka Enberg <penberg@kernel.org>
> Cc: David Rientjes <rientjes@google.com>
> Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Roman Gushchin <roman.gushchin@linux.dev>
> Cc: linux-mm@kvack.org

Thanks, added to slab/for-5.20/cleanup as it's slab-specific and independent
from 1/3 and 3/3.

> ---
>  mm/slab.c | 10 ----------
>  1 file changed, 10 deletions(-)
> 
> diff --git a/mm/slab.c b/mm/slab.c
> index b04e40078bdf..75779ac5f5ba 100644
> --- a/mm/slab.c
> +++ b/mm/slab.c
> @@ -2973,12 +2973,6 @@ static void *cache_alloc_refill(struct kmem_cache *cachep, gfp_t flags)
>  	return ac->entry[--ac->avail];
>  }
>  
> -static inline void cache_alloc_debugcheck_before(struct kmem_cache *cachep,
> -						gfp_t flags)
> -{
> -	might_sleep_if(gfpflags_allow_blocking(flags));
> -}
> -
>  #if DEBUG
>  static void *cache_alloc_debugcheck_after(struct kmem_cache *cachep,
>  				gfp_t flags, void *objp, unsigned long caller)
> @@ -3219,7 +3213,6 @@ slab_alloc_node(struct kmem_cache *cachep, gfp_t flags, int nodeid, size_t orig_
>  	if (unlikely(ptr))
>  		goto out_hooks;
>  
> -	cache_alloc_debugcheck_before(cachep, flags);
>  	local_irq_save(save_flags);
>  
>  	if (nodeid == NUMA_NO_NODE)
> @@ -3304,7 +3297,6 @@ slab_alloc(struct kmem_cache *cachep, struct list_lru *lru, gfp_t flags,
>  	if (unlikely(objp))
>  		goto out;
>  
> -	cache_alloc_debugcheck_before(cachep, flags);
>  	local_irq_save(save_flags);
>  	objp = __do_cache_alloc(cachep, flags);
>  	local_irq_restore(save_flags);
> @@ -3541,8 +3533,6 @@ int kmem_cache_alloc_bulk(struct kmem_cache *s, gfp_t flags, size_t size,
>  	if (!s)
>  		return 0;
>  
> -	cache_alloc_debugcheck_before(s, flags);
> -
>  	local_irq_disable();
>  	for (i = 0; i < size; i++) {
>  		void *objp = kfence_alloc(s, s->object_size, flags) ?: __do_cache_alloc(s, flags);

