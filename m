Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DB1523349
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 14:43:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D814E10EE69;
	Wed, 11 May 2022 12:42:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3062210EE49;
 Wed, 11 May 2022 12:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652272977; x=1683808977;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GFhebHzBmdSTAm8X/ZQTSJF1RxXHbmrgrGWBEpfUvdY=;
 b=RJA4OTVoW8+souIAiqPMBdZCtU2qB8qfVRXwEm5RPUQr3GBkjA8+QUxh
 m8XL0i338LiKaSa8K72n3JZnxQl0Dvcgi/RMryZPdnrfU2l4yLINuQJhw
 AA15HgV5IIyfShNlJnuBY7Ofo437/ZT7otBs1rpCHdrlG9CkjMomHli4F
 a1zsZf9k9DXasTHz9i283yOKiV+Veu88YbY1/1etiODe0sfhxohjj+VIi
 yE85gz4rs4vI/995ZMgR0wtlkuyYLLH0EOlzJbUSTtPcJyQC00CF/BfR7
 N8wmH8x/Kxjo3MWPj/BLBY960OPP1k6SBHCuzp4c9qQNs89+VhqLQahmC Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="269817627"
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; d="scan'208";a="269817627"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 05:42:56 -0700
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; d="scan'208";a="739204285"
Received: from mstribae-mobl1.ger.corp.intel.com (HELO [10.249.254.135])
 ([10.249.254.135])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 05:42:53 -0700
Message-ID: <3ce81c514959e43f5afd7e74489dd5b89b1cd633.camel@linux.intel.com>
Subject: Re: [PATCH 3/4] drm/i915: allow volatile buffers to use ttm pool
 allocator
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Robert Beckett <bob.beckett@collabora.com>, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Jani
 Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>,  Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 11 May 2022 14:42:51 +0200
In-Reply-To: <20220503191316.1145124-4-bob.beckett@collabora.com>
References: <20220503191316.1145124-1-bob.beckett@collabora.com>
 <20220503191316.1145124-4-bob.beckett@collabora.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-3.fc34) 
MIME-Version: 1.0
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
Cc: Matthew Auld <matthew.auld@intel.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Bob,

On Tue, 2022-05-03 at 19:13 +0000, Robert Beckett wrote:
> internal buffers should be shmem backed.
> if a volatile buffer is requested, allow ttm to use the pool
> allocator
> to provide volatile pages as backing
> 
> Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index 4c25d9b2f138..fdb3a1c18cb6 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -309,7 +309,8 @@ static struct ttm_tt *i915_ttm_tt_create(struct
> ttm_buffer_object *bo,
>                 page_flags |= TTM_TT_FLAG_ZERO_ALLOC;
>  
>         caching = i915_ttm_select_tt_caching(obj);
> -       if (i915_gem_object_is_shrinkable(obj) && caching ==
> ttm_cached) {
> +       if (i915_gem_object_is_shrinkable(obj) && caching ==
> ttm_cached &&
> +           !i915_gem_object_is_volatile(obj)) {
>                 page_flags |= TTM_TT_FLAG_EXTERNAL |
>                               TTM_TT_FLAG_EXTERNAL_MAPPABLE;
>                 i915_tt->is_shmem = true;

While this is ok, I think it also needs adjustment in the i915_ttm
shrink callback. If someone creates a volatile smem object which then
hits the shrinker, I think we might hit asserts that it's a is_shem
ttm?

In this case, the shrink callback should just i915_ttm_purge().

/Thomas


