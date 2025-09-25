Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C680CB9E108
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 10:32:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0529010E296;
	Thu, 25 Sep 2025 08:32:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ispras.ru header.i=@ispras.ru header.b="TdUU5r7X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FFFB10E296
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 08:32:53 +0000 (UTC)
Received: from localhost (unknown [10.10.165.19])
 by mail.ispras.ru (Postfix) with UTF8SMTPSA id 751A340A327F;
 Thu, 25 Sep 2025 08:32:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 751A340A327F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1758789170;
 bh=uF++8OOm94LNs+zLFNRWXX3dSoN0NrPv7HsDF6GaeFg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TdUU5r7XH8j54tB6O3sp2bTkzmOQHYRTQuxsEuZgsLgU+0gL/i/Rf/d/1rBuryJy8
 OZLGt8z8jg92d4b/Ns5P9QGC+0yNQs2ooraBzcV7NmnnWt99FPeeU82B2KwO32lvst
 z4kjDeJlOXhC4yseYcgzl4oeCmsp/JMToFZM0vR0=
Date: Thu, 25 Sep 2025 11:32:50 +0300
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Alexandr Sapozhnkiov <alsp705@gmail.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Krzysztof Karas <krzysztof.karas@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
 linux-media@vger.kernel.org
Subject: Re: [lvc-project] [PATCH] gpu: i915: fix error return in
 mmap_offset_attach()
Message-ID: <20250925112453-9f2adbf071ed0db667442c83-pchelkin@ispras>
References: <20250924124852.11-1-alsp705@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250924124852.11-1-alsp705@gmail.com>
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

On Wed, 24. Sep 15:48, Alexandr Sapozhnkiov wrote:
> Return value of function drm_vma_node_allow_once(), 
> called at i915_gem_mman.c:672, is not checked.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Signed-off-by: Alexandr Sapozhnikov <alsp705@gmail.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_mman.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> index 75f5b0e871ef..eb76f8f2bd95 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> @@ -758,8 +758,11 @@ mmap_offset_attach(struct drm_i915_gem_object *obj,
>  	mmo = insert_mmo(obj, mmo);
>  	GEM_BUG_ON(lookup_mmo(obj, mmap_type) != mmo);
>  out:
> -	if (file)
> -		drm_vma_node_allow_once(&mmo->vma_node, file);
> +	if (file) {
> +		err = drm_vma_node_allow_once(&mmo->vma_node, file);
> +		if (err)
> +			goto err;

insert_mmo() inserts mmo into rb tree associated with obj.  So it should
be removed from the tree before mmo is freed on error path.

Is it probably better to return directly without going to the 'err' label?
There should be no memory leaks in such case I guess.

> +	}
>  	return mmo;
>  
>  err:
> -- 
> 2.43.0
