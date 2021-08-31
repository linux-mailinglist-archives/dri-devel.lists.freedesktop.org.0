Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 019103FC4B9
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 11:29:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C476B897C5;
	Tue, 31 Aug 2021 09:29:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0610D8975F;
 Tue, 31 Aug 2021 09:29:45 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10092"; a="198673876"
X-IronPort-AV: E=Sophos;i="5.84,366,1620716400"; d="scan'208";a="198673876"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 02:29:45 -0700
X-IronPort-AV: E=Sophos;i="5.84,366,1620716400"; d="scan'208";a="531025500"
Received: from wenqitan-mobl1.ger.corp.intel.com (HELO [10.252.59.180])
 ([10.252.59.180])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 02:29:41 -0700
Subject: Re: [PATCH 10/11] drm/i915: use xa_lock/unlock for fpriv->vm_xa
 lookups
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Dave Airlie <airlied@redhat.com>, Jason Ekstrand <jason@jlekstrand.net>
References: <20210813203033.3179400-1-daniel.vetter@ffwll.ch>
 <20210813203033.3179400-10-daniel.vetter@ffwll.ch>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <cfd5c846-fbc5-4d7d-230a-0a1afe3e88de@linux.intel.com>
Date: Tue, 31 Aug 2021 11:29:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210813203033.3179400-10-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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

Op 13-08-2021 om 22:30 schreef Daniel Vetter:
> We don't need the absolute speed of rcu for this. And
> i915_address_space in general dont need rcu protection anywhere else,
> after we've made gem contexts and engines a lot more immutable.
>
> Note that this semantically reverts
>
> commit aabbe344dc3ca5f7d8263a02608ba6179e8a4499
> Author: Chris Wilson <chris@chris-wilson.co.uk>
> Date:   Fri Aug 30 19:03:25 2019 +0100
>
>     drm/i915: Use RCU for unlocked vm_idr lookup
>
> except we have the conversion from idr to xarray in between.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Jon Bloomfield <jon.bloomfield@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> ---
>  drivers/gpu/drm/i915/i915_drv.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 005b1cec7007..e37fac8fac0c 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -1881,11 +1881,11 @@ i915_gem_vm_lookup(struct drm_i915_file_private *file_priv, u32 id)
>  {
>  	struct i915_address_space *vm;
>  
> -	rcu_read_lock();
> +	xa_lock(&file_priv->vm_xa);
>  	vm = xa_load(&file_priv->vm_xa, id);
>  	if (vm && !kref_get_unless_zero(&vm->ref))
>  		vm = NULL;
I think this could be a plain i915_vm_get now, kref_get_unless_zero is not guarded by RCU any more.
> -	rcu_read_unlock();
> +	xa_unlock(&file_priv->vm_xa);
>  
>  	return vm;
>  }

Apart from that, all looks good.

With this fix, for patch 2-11:

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>


