Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A7BCC2F6B
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 13:52:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 414EA10E119;
	Tue, 16 Dec 2025 12:52:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="um9TU7IT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 685CC10E119;
 Tue, 16 Dec 2025 12:51:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1BD004383F;
 Tue, 16 Dec 2025 12:51:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EFACC4CEF5;
 Tue, 16 Dec 2025 12:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765889519;
 bh=nLGMKa8GAhOECGEH8Z5temkXugV9kUm9LAzLBglxrsA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=um9TU7ITAShTdHjRqEQUIT21NioxifFtpmoxqtmWMkZfqzxGoZh5QTQ/jcwVmCWvA
 7c7+D3DuwDzMPrc98bmb0OFMTxqhtyS+60I+WiP5hDcmjiBmQh2iBHgavwQGVJPd3n
 aeev7JArwHTp7GkqmtKNXxy3q3FclkKLzUUFuMJyXOup1fIFAb7jnI5kw9eyBB6AQ3
 z/59u9/t0NERZTU0P3Q2qe++Lgkx/7rGszlCG9D6fcLjmDXf9zof+8RYMdRTKt5kTn
 rbennJKuCoHluKstPQVnDhh1QA45X/LtMFTlzE8DyIApky7yLX4bhAJKbMQhxkSotQ
 OyDUHS+3kDrKA==
Date: Tue, 16 Dec 2025 13:51:55 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 stable@vger.kernel.org, =?utf-8?B?6rmA6rCV66+8?= <km.kim1503@gmail.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Chris Wilson <chris.p.wilson@linux.intel.com>, 
 Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>, 
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Subject: Re: [PATCH v4] drm/i915/gem: Zero-initialize the eb.vma array in
 i915_gem_do_execbuffer
Message-ID: <rry4vms675np6isl4qgd6z7latqit4dintqptegjg6xduc4mvl@b2mtbzsu4yx3>
References: <20251212150611.18757-2-krzysztof.niemiec@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212150611.18757-2-krzysztof.niemiec@intel.com>
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

Hi Krzysztof,

...

> In eb_lookup_vmas(), eb->vma[i].vma is set to NULL if either the helper
> function eb_lookup_vma() or eb_validate_vma() fails. eb->vma[i+1].vma is
> set to NULL in case i915_gem_object_userptr_submit_init() fails; the
> current one needs to be cleaned up by eb_release_vmas() at this point,
> so the next one is set. If eb_add_vma() fails, neither the current nor
> the next vma is nullified, which is a source of a NULL deref bug

/nullified/set to NULL/

> described in [1].

The [1] reference is out of the commit log :-)

> When entering eb_lookup_vmas(), the vma pointers are set to the slab
> poison value, instead of NULL. This doesn't matter for the actual
> lookup, since it gets overwritten anyway, however the eb_release_vmas()
> function only recognizes NULL as the stopping value, hence the pointers
> are being nullified as they go in case of intermediate failure. This

/nullified/set to NULL/

> patch changes the approach to filling them all with NULL at the start
> instead, rather than handling that manually during failure.

...

>  static int eb_lock_vmas(struct i915_execbuffer *eb)
> @@ -3375,7 +3360,8 @@ i915_gem_do_execbuffer(struct drm_device *dev,
>  
>  	eb.exec = exec;
>  	eb.vma = (struct eb_vma *)(exec + args->buffer_count + 1);
> -	eb.vma[0].vma = NULL;
> +	memset(eb.vma, 0x00, args->buffer_count * sizeof(struct eb_vma));

/0x00/0/

Should this be buffer_count + 1?

> +
>  	eb.batch_pool = NULL;
>  
>  	eb.invalid_flags = __EXEC_OBJECT_UNKNOWN_FLAGS;
> @@ -3584,7 +3570,18 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
>  	if (err)
>  		return err;
>  
> -	/* Allocate extra slots for use by the command parser */
> +	/*
> +	 * Allocate extra slots for use by the command parser.
> +	 *
> +	 * Note that this allocation handles two different arrays (the
> +	 * exec2_list array, and the eventual eb.vma array introduced in
> +	 * i915_gem_do_execubuffer()), that reside in virtually contiguous

/execubuffer/execbuffer/

> +	 * memory. Also note that the allocation intentionally doesn't fill the
> +	 * area with zeros (because the exec2_list part doesn't need to be, as
> +	 * it's immediately overwritten by user data a few lines below).

No need to put this last sentence within brackets, it's just a
continuation sentence.

Except for the "+ 1" note, everything is trivial:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Given that this has failed in patchwork, can you please resend a
v5 if there are no other comments from your side?

Thanks,
Andi

> +	 * However, the eb.vma part is explicitly zeroed later in
> +	 * i915_gem_do_execbuffer().
> +	 */
>  	exec2_list = kvmalloc_array(count + 2, eb_element_size(),
>  				    __GFP_NOWARN | GFP_KERNEL);
>  	if (exec2_list == NULL) {
> -- 
> 2.45.2
> 
