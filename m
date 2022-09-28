Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B7B5ED83F
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 10:51:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE1E10E37B;
	Wed, 28 Sep 2022 08:51:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4456E10E37A;
 Wed, 28 Sep 2022 08:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664355071; x=1695891071;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=eltQSsd00+eTulXtPk3YMa9SYpcWVAR8VjdLyZ6mqho=;
 b=TX6LxgvBl9PoKJlK3CM8KVaicM2epzP5Uzmej/+pz8zOG4RqFioMK0Zb
 tzxx4niOiQOzzOnb94tyVyU/oh6EkdMZVqIZnV/2qpNgV3T9snzG2j1q2
 ykVjc6occI0KIWM7fZnG31g77yOUwAxNgpy7J6MRkPbVmVLh4v8hSdGSa
 O6Yq/bQwQel1LG5e8iJSCURanGXEVRl6DZLF4wv2KWYDtsv+a9LteVs22
 10jgfEA0ciSuZuNMKAkeFiX/6HoCqcbg85TEX8oXGDN/jLh97k44Qbfw6
 +rN+2mpTUphV7TbXkMZFsbVhkSX8JkyfJcFeygHQJiIoOd0NZIfe9GQAr Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="303029446"
X-IronPort-AV: E=Sophos;i="5.93,351,1654585200"; d="scan'208";a="303029446"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 01:51:10 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="866895387"
X-IronPort-AV: E=Sophos;i="5.93,351,1654585200"; d="scan'208";a="866895387"
Received: from novermar-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.61.30])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 01:51:03 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v13 5/9] drm/i915: Check for integer truncation on
 scatterlist creation
In-Reply-To: <20220928081300.101516-6-gwan-gyeong.mun@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220928081300.101516-1-gwan-gyeong.mun@intel.com>
 <20220928081300.101516-6-gwan-gyeong.mun@intel.com>
Date: Wed, 28 Sep 2022 11:51:00 +0300
Message-ID: <87edvvzxu3.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: gustavoars@kernel.org, trix@redhat.com, dlatypov@google.com,
 llvm@lists.linux.dev, linux@rasmusvillemoes.dk,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 linux-hardening@vger.kernel.org, andrzej.hajda@intel.com,
 linux-sparse@vger.kernel.org, matthew.auld@intel.com,
 andi.shyti@linux.intel.com, airlied@redhat.com,
 thomas.hellstrom@linux.intel.com, keescook@chromium.org, nathan@kernel.org,
 mchehab@kernel.org, mauro.chehab@linux.intel.com, ndesaulniers@google.com,
 linux-kernel@vger.kernel.org, vitor@massaru.org, luc.vanoostenryck@gmail.com,
 nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 28 Sep 2022, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com> wrote:
> diff --git a/drivers/gpu/drm/i915/i915_scatterlist.h b/drivers/gpu/drm/i915/i915_scatterlist.h
> index 9ddb3e743a3e..1d1802beb42b 100644
> --- a/drivers/gpu/drm/i915/i915_scatterlist.h
> +++ b/drivers/gpu/drm/i915/i915_scatterlist.h
> @@ -220,4 +220,15 @@ struct i915_refct_sgt *i915_rsgt_from_buddy_resource(struct ttm_resource *res,
>  						     u64 region_start,
>  						     u32 page_alignment);
>  
> +/* Wrap scatterlist.h to sanity check for integer truncation */
> +typedef unsigned int __sg_size_t; /* see linux/scatterlist.h */
> +#define sg_alloc_table(sgt, nents, gfp) \
> +	overflows_type(nents, __sg_size_t) ? -E2BIG \
> +		: ((sg_alloc_table)(sgt, (__sg_size_t)(nents), gfp))
> +
> +#define sg_alloc_table_from_pages_segment(sgt, pages, npages, offset, size, max_segment, gfp) \
> +	overflows_type(npages, __sg_size_t) ? -E2BIG \
> +		: ((sg_alloc_table_from_pages_segment)(sgt, pages, (__sg_size_t)(npages), offset, \
> +						       size, max_segment, gfp))
> +
>  #endif

No. I don't think we should shadow sg_alloc_table() and
sg_alloc_table_from_pages_segment().

Either get this in scatterlist.h (preferred) or prefix with i915_ or
whatever to indicate it's our local thing.

i915_scatterlist.h already has too much scatterlist "namespace" abuse
that I'd rather see gone than violated more.


BR,
Jani.



-- 
Jani Nikula, Intel Open Source Graphics Center
