Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B63D49E1BF
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 12:57:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67B9B10E552;
	Thu, 27 Jan 2022 11:57:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A93910E444;
 Thu, 27 Jan 2022 11:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643284642; x=1674820642;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=ykwxbGE1mxGqjvO+nGA9W62Kj+d19cTCk91R/q0rkPg=;
 b=gfMQRDPz1+VOX6gcUyfPJ+ChSMiar7EiAa6Pw5KKHzGfbWV0eociJVPQ
 OkTvuZY5DGT9dFa2R/52vFMb5QQ4rvnppoFB9fjYVHO0tWIxO4ehPAsz2
 Cdmy3VfBPXRUPYBSG9WHPKBM/OcBN/EBqp3yEbdjH6RXtiYYC0g+hDrU5
 2tgIsQW/SbJmgtjTu9xXonNegjmE2tqX9YN9+5NFQQwz2L65sJhMw9OEG
 AmC5hFnO0JlivM4sZgFamDgnzz4dUN4rM6TsaB9Rz1q6YbdEMw7fXZ5E8
 uZd//PDZ8hEa5VkHM7MjZBbogErI/wHwC6uvVp0vO5thhJmzUitcgPtwt Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="234204522"
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; d="scan'208";a="234204522"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2022 03:57:21 -0800
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; d="scan'208";a="480262521"
Received: from grossi-mobl.ger.corp.intel.com (HELO [10.252.33.31])
 ([10.252.33.31])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2022 03:57:20 -0800
Message-ID: <dbd425f4-2398-124f-7d60-769d0e8a89aa@linux.intel.com>
Date: Thu, 27 Jan 2022 12:57:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.1
Subject: Re: [PATCH] drm/i915: Fix a race between vma / object destruction and
 unbinding
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220127115622.302970-1-thomas.hellstrom@linux.intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20220127115622.302970-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
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

Op 27-01-2022 om 12:56 schreef Thomas Hellström:
> The vma destruction code was using an unlocked advisory check for
> drm_mm_node_allocated() to avoid racing with eviction code unbinding
> the vma.
>
> This is very fragile and prohibits the dereference of non-refcounted
> pointers of dying vmas after a call to __i915_vma_unbind(). It also
> prohibits the dereference of vma->obj of refcounted pointers of
> dying vmas after a call to __i915_vma_unbind(), since even if a
> refcount is held on the vma, that won't guarantee that its backing
> object doesn't get destroyed.
>
> So introduce an unbind under the vm mutex at object destroy time,
> removing all weak references of the vma and its object from the
> object vma list and from the vm bound list.
>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_object.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> index 1a9e1f940a7d..e03e362d320b 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> @@ -280,6 +280,12 @@ void __i915_gem_object_pages_fini(struct drm_i915_gem_object *obj)
>  			GEM_BUG_ON(vma->obj != obj);
>  			spin_unlock(&obj->vma.lock);
>  
> +			/* Verify that the vma is unbound under the vm mutex. */
> +			mutex_lock(&vma->vm->mutex);
> +			atomic_and(~I915_VMA_PIN_MASK, &vma->flags);
> +			__i915_vma_unbind(vma);
> +			mutex_unlock(&vma->vm->mutex);
> +
>  			__i915_vma_put(vma);
>  
>  			spin_lock(&obj->vma.lock);

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>


