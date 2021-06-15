Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2213A7E42
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 14:35:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10A586E2E3;
	Tue, 15 Jun 2021 12:35:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C05366E2E3;
 Tue, 15 Jun 2021 12:35:22 +0000 (UTC)
IronPort-SDR: PHKsVc0H80ADA/jvX5KjlBHi1LogSAcZQF04iNRgjBWmYxSwfQOoceLLz8Yb4OwuiLQL07kJ2U
 CQs+HhHUM7cA==
X-IronPort-AV: E=McAfee;i="6200,9189,10015"; a="269829221"
X-IronPort-AV: E=Sophos;i="5.83,275,1616482800"; d="scan'208";a="269829221"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2021 05:35:20 -0700
IronPort-SDR: 0ppNb/nI+vahgTzDi26pSb+IbJ3yS7yB3SPGF0rePm3iTDY3yYmeExgvzccD5a/9bj+GPPyFaq
 kMtiX7DKorbQ==
X-IronPort-AV: E=Sophos;i="5.83,275,1616482800"; d="scan'208";a="484455237"
Received: from aperelma-mobl.ger.corp.intel.com (HELO [10.252.37.64])
 ([10.252.37.64])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2021 05:35:18 -0700
Subject: Re: [PATCH] drm/i915/ttm: Fix memory leaks
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210615122408.32347-1-thomas.hellstrom@linux.intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <222f7ebd-d746-f6b9-3524-f3195a95e3aa@linux.intel.com>
Date: Tue, 15 Jun 2021 14:35:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210615122408.32347-1-thomas.hellstrom@linux.intel.com>
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
Cc: matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Op 15-06-2021 om 14:24 schreef Thomas Hellström:
> Fix two memory leaks introduced with the ttm backend.
>
> Fixes: 213d50927763 ("drm/i915/ttm: Introduce a TTM i915 gem object backend")
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index 08b72c280cb5..8059cb61bc3c 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -122,6 +122,7 @@ static void i915_ttm_tt_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
>  	struct i915_ttm_tt *i915_tt = container_of(ttm, typeof(*i915_tt), ttm);
>  
>  	ttm_tt_destroy_common(bdev, ttm);
> +	ttm_tt_fini(ttm);
>  	kfree(i915_tt);
>  }
>  
> @@ -217,6 +218,7 @@ static void i915_ttm_delete_mem_notify(struct ttm_buffer_object *bo)
>  
>  	if (likely(obj)) {
>  		/* This releases all gem object bindings to the backend. */
> +		i915_ttm_free_cached_io_st(obj);
>  		__i915_gem_free_object(obj);
>  	}
>  }

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

