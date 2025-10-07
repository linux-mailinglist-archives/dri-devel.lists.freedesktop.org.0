Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E682BC0FA8
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 12:14:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B124510E181;
	Tue,  7 Oct 2025 10:14:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PisdVE2p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC89610E181;
 Tue,  7 Oct 2025 10:14:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1192A601DC;
 Tue,  7 Oct 2025 10:14:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 522B1C4CEF1;
 Tue,  7 Oct 2025 10:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759832073;
 bh=3esV0ytccBxzur/KLi5NKJu08t5jZgIJWULK85MYAJ4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PisdVE2pmak6fACq2DRWMwHrPN9glJkXCwwTLPTb7uNbkEvwpZ3bqo2OndZuIuHGL
 8YxK1rvL8iXv2lnQb+DVLBQunfJTkSELnuzhZCiaXB2nUdmDyYiIOOxxM7p2Vy8DYe
 d7Zri/4ZtyC30D6ohhMFqJAd5+G5Fjovi4L9NU084ka3XbqwbDyXSm7pHO0gExx1nB
 thqy7ZijQipGP3zCULTMdYqiEzeHfC3BpaIVavZiSm19hVTjuY31n6faDTgAWv+PU4
 dqb3E5gz/hlLLpO5I5aNbGHlx1ZfbTtfC7z37Xac4xPaqj7EkiBqzeLTkRNRFxH3YK
 XVkjlGh7VKhMQ==
Date: Tue, 7 Oct 2025 12:14:30 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Alexandr Sapozhnkiov <alsp705@gmail.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 lvc-project@linuxtesting.org
Subject: Re: [PATCH 5.10] gpu/i915: fix error return in mmap_offset_attach()
Message-ID: <ris5iw6gdn7squdjpo5kapdyd7jqwbzy3kbpnzspp7jhpm4tlj@osq47p45ydcv>
References: <20251002084828.11-1-alsp705@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251002084828.11-1-alsp705@gmail.com>
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

Hi,

On Thu, Oct 02, 2025 at 11:48:26AM +0300, Alexandr Sapozhnkiov wrote:
> From: Alexandr Sapozhnikov <alsp705@gmail.com>
> 
> In the drm_vma_node_allow function, kmalloc may 
> return NULL, in which case the file element will not be 
> added to the mmo->vma_node list. It would be good to 
> not ignore this event, but at least log an error message.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Signed-off-by: Alexandr Sapozhnikov <alsp705@gmail.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_mman.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> index a2195e28b625..adaef8f09d59 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> @@ -706,8 +706,11 @@ mmap_offset_attach(struct drm_i915_gem_object *obj,
>  	mmo = insert_mmo(obj, mmo);
>  	GEM_BUG_ON(lookup_mmo(obj, mmap_type) != mmo);
>  out:
> -	if (file)
> -		drm_vma_node_allow_once(&mmo->vma_node, file);
> +	if (file) {
> +		err = drm_vma_node_allow_once(&mmo->vma_node, file);
> +		if (err)
> +			goto err;
> +	}

NACK here! You have received several reviews on this patch and
didn't react to them. Please, read carefully the reviews you
received and send a second version of the patch.

Please do use versioning properly in your title and add a
changelog.

Before sending patches, please read the documentation[*].

Andi

[*] https://www.kernel.org/doc/html/v4.17/process/submitting-patches.html

>  	return mmo;
>  
>  err:
> -- 
> 2.43.0
> 
