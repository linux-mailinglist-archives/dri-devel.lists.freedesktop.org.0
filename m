Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E863877F7
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 13:44:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BE486E107;
	Tue, 18 May 2021 11:44:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9FCB6E107;
 Tue, 18 May 2021 11:44:45 +0000 (UTC)
IronPort-SDR: jfEn8YzdpfBlHsstugyIxS81sYmoVSY4NdVmbe60j1ZafE3jGiS55VKTdB+UgImcePoQ0Pctg8
 13UG6Qp4hM5g==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="198737821"
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; d="scan'208";a="198737821"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 04:44:44 -0700
IronPort-SDR: y0RAYaHjVUz9YEUa/3UsihrDAquGBM4pMCX7XZXXXORH/IoBznbUQd41k3srGw8khf644Yztnc
 aWTDShUHU3cQ==
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; d="scan'208";a="439403255"
Received: from cbackhau-mobl.ger.corp.intel.com (HELO [10.252.37.121])
 ([10.252.37.121])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 04:44:43 -0700
Subject: Re: [PATCH v2 06/15] drm/i915/ttm: Embed a ttm buffer object in the
 i915 gem object
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210518082701.997251-1-thomas.hellstrom@linux.intel.com>
 <20210518082701.997251-7-thomas.hellstrom@linux.intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <ce76a4ba-36a2-fb8c-bf47-366e8b030b29@linux.intel.com>
Date: Tue, 18 May 2021 13:44:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210518082701.997251-7-thomas.hellstrom@linux.intel.com>
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

Op 18-05-2021 om 10:26 schreef Thomas Hellström:
> Embed a struct ttm_buffer_object into the i915 gem object, making sure
> we alias the gem object part. It's a bit unfortunate that the
> struct ttm_buffer_ojbect embeds a gem object since we otherwise could
> make the TTM part private to the TTM backend, and use the usual
> i915 gem object for the other backends.
> To make this a bit more storage efficient for the other backends,
> we'd have to use a pointer for the gem object which would require
> a lot of changes in the driver. We postpone that for later.
>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_object.c       |  7 +++++++
>  drivers/gpu/drm/i915/gem/i915_gem_object_types.h | 12 +++++++++++-
>  2 files changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> index abadf0994ad0..c8953e3f5c70 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> @@ -62,6 +62,13 @@ void i915_gem_object_init(struct drm_i915_gem_object *obj,
>  			  const struct drm_i915_gem_object_ops *ops,
>  			  struct lock_class_key *key, unsigned flags)
>  {
> +	/*
> +	 * A gem object is embedded both in a struct ttm_buffer_object :/ and
> +	 * in a drm_i915_gem_object. Make sure they are aliased.
> +	 */
> +	BUILD_BUG_ON(offsetof(typeof(*obj), base) !=
> +		     offsetof(typeof(*obj), __do_not_access.base));
> +
>  	spin_lock_init(&obj->vma.lock);
>  	INIT_LIST_HEAD(&obj->vma.list);
>  
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> index dbd7fffe956e..98f69d8fd37d 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> @@ -10,6 +10,7 @@
>  #include <linux/mmu_notifier.h>
>  
>  #include <drm/drm_gem.h>
> +#include <drm/ttm/ttm_bo_api.h>
>  #include <uapi/drm/i915_drm.h>
>  
>  #include "i915_active.h"
> @@ -99,7 +100,16 @@ struct i915_gem_object_page_iter {
>  };
>  
>  struct drm_i915_gem_object {
> -	struct drm_gem_object base;
> +	/*
> +	 * We might have reason to revisit the below since it wastes
> +	 * a lot of space for non-ttm gem objects.
> +	 * In any case, always use the accessors for the ttm_buffer_object
> +	 * when accessing it.
> +	 */
> +	union {
> +		struct drm_gem_object base;
> +		struct ttm_buffer_object __do_not_access;
> +	};
>  
>  	const struct drm_i915_gem_object_ops *ops;
>  

Considering Dave did roughly the same in his patches, I don't think there's a better way to do this.

Although he just wrapped base.base using sizes. This works too. It probably needs someone else's r-b too, to ensure this is allowed.

Acked-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

