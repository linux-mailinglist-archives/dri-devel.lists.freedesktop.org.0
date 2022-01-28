Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBBF49F7C8
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 12:02:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1400E10E532;
	Fri, 28 Jan 2022 11:02:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4397710E532;
 Fri, 28 Jan 2022 11:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id A12873F570;
 Fri, 28 Jan 2022 12:02:47 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Authentication-Results: pio-pvt-msa1.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ICy-_SbHDo1k; Fri, 28 Jan 2022 12:02:46 +0100 (CET)
Received: by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 29AE33F52E;
 Fri, 28 Jan 2022 12:02:44 +0100 (CET)
Received: from [192.168.0.209] (unknown [192.55.55.53])
 by mail1.shipmail.org (Postfix) with ESMTPSA id A07DC3626A5;
 Fri, 28 Jan 2022 12:02:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1643367764; bh=VA/Ar+Sk10+sABpZUnxhPdMAutfj6i72idFLdugSLRM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nh3uqnWq4NH2lZIPyIyDWt4q9f9Y2LMNPpvQEhVig40w+gA3XhZT+yYYt2d8V+oyy
 2sMKJomJ+Qd/S+QmHGP2FMq9BEsld7fyncD5BGTXVzw/PRobEbikZ0f2Qq2Cyibr2q
 mt5nlMd6VeSmiJuDgXlM+MTVPNGXK0NMSa0BFkGI=
Message-ID: <a5ee6bb7-f0ad-b3db-da7f-b912f5242297@shipmail.org>
Date: Fri, 28 Jan 2022 12:02:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Allow dead vm to unbind vma's
 without lock.
Content-Language: en-US
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20220128085739.1464568-1-maarten.lankhorst@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
In-Reply-To: <20220128085739.1464568-1-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/28/22 09:57, Maarten Lankhorst wrote:
> i915_gem_vm_close may take the lock, and we currently have no better way
> of handling this. At least for now, allow a path in which holding vm->mutex
> is sufficient. This is the case, because the object destroy path will
> forcefully take vm->mutex now.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Reviewed-by: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>


> ---
>   drivers/gpu/drm/i915/i915_vma.c | 15 +++++++++++++--
>   1 file changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index b959e904c4d3..14a301c4069f 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -40,6 +40,17 @@
>   #include "i915_vma.h"
>   #include "i915_vma_resource.h"
>   
> +static inline void assert_vma_held_evict(const struct i915_vma *vma)
> +{
> +	/*
> +	 * We may be forced to unbind when the vm is dead, to clean it up.
> +	 * This is the only exception to the requirement of the object lock
> +	 * being held.
> +	 */
> +	if (atomic_read(&vma->vm->open))
> +		assert_object_held_shared(vma->obj);
> +}
> +
>   static struct kmem_cache *slab_vmas;
>   
>   static struct i915_vma *i915_vma_alloc(void)
> @@ -1779,7 +1790,7 @@ struct dma_fence *__i915_vma_evict(struct i915_vma *vma, bool async)
>   	struct dma_fence *unbind_fence;
>   
>   	GEM_BUG_ON(i915_vma_is_pinned(vma));
> -	assert_object_held_shared(vma->obj);
> +	assert_vma_held_evict(vma);
>   
>   	if (i915_vma_is_map_and_fenceable(vma)) {
>   		/* Force a pagefault for domain tracking on next user access */
> @@ -1846,7 +1857,7 @@ int __i915_vma_unbind(struct i915_vma *vma)
>   	int ret;
>   
>   	lockdep_assert_held(&vma->vm->mutex);
> -	assert_object_held_shared(vma->obj);
> +	assert_vma_held_evict(vma);
>   
>   	if (!drm_mm_node_allocated(&vma->node))
>   		return 0;
