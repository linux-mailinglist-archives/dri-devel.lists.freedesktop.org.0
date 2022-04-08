Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D5D4F8D34
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 07:01:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D6C510F613;
	Fri,  8 Apr 2022 05:01:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7CCE10F611;
 Fri,  8 Apr 2022 05:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649394067; x=1680930067;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=KV+wOdANaLqcyIoVaKJhEwe3kWPlSyKxVDvjkaC0ff4=;
 b=IMUAqNq/03IwRjS6fU3it1vD6fKLxi28Z/L/Vh3GNFxBsP7mxsAlwgQN
 zAYweQhipXHeWFvcU16YlbqMOUhZyEEgLnQ21wBQg4+ApKvffU4aHWcf9
 1T/oV9qagZX9LNThTJFi1gTR+jK23OXUcz8rfrN1PN4R4NS6a+iec3h82
 jR7z+4sohjF/lwVKbjCdlOS5hVJxJYfxI56Veb26a+fsSY+6EZNzoHK5k
 +VmwSUmgOxKLj1D5PcN25Qo51Ujntn++OkCGpwdmLSgOwqjGrH2CqqpGj
 m/x/xcKC5YbfulH+Hvq/viKdA0g4AYCV77co064CDGzBFF5VtwlVsXQLK Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="242106116"
X-IronPort-AV: E=Sophos;i="5.90,244,1643702400"; d="scan'208";a="242106116"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 22:00:46 -0700
X-IronPort-AV: E=Sophos;i="5.90,244,1643702400"; d="scan'208";a="589093644"
Received: from aalkukhu-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.172.187])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 22:00:45 -0700
Date: Thu, 7 Apr 2022 22:00:44 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915: fix
 i915_gem_object_wait_moving_fence
Message-ID: <20220408050044.7wd54sjbzzkzpqzr@ldmartin-desk2>
References: <20220407164532.1242578-1-matthew.auld@intel.com>
 <20220407164532.1242578-2-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220407164532.1242578-2-matthew.auld@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 07, 2022 at 05:45:32PM +0100, Matthew Auld wrote:
>All of CI is just failing with the following, which prevents loading of
>the module:
>
>    i915 0000:03:00.0: [drm] *ERROR* Scratch setup failed
>
>Best guess is that this comes from the pin_map() for the scratch page,
>which does an i915_gem_object_wait_moving_fence() somewhere. It looks
>like this now calls into dma_resv_wait_timeout() which can return the
>remaining timeout, leading to the caller thinking this is an error.
>
>Fixes: 1d7f5e6c5240 ("drm/i915: drop bo->moving dependency")
>Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>Cc: Christian König <christian.koenig@amd.com>
>Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>---
> drivers/gpu/drm/i915/gem/i915_gem_object.c | 9 +++++++--
> 1 file changed, 7 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>index 2998d895a6b3..1c88d4121658 100644
>--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
>+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>@@ -772,9 +772,14 @@ int i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj,
> int i915_gem_object_wait_moving_fence(struct drm_i915_gem_object *obj,
> 				      bool intr)
> {
>+	long ret;
>+
> 	assert_object_held(obj);
>-	return dma_resv_wait_timeout(obj->base. resv, DMA_RESV_USAGE_KERNEL,
>-				     intr, MAX_SCHEDULE_TIMEOUT);
>+
>+	ret = dma_resv_wait_timeout(obj->base. resv, DMA_RESV_USAGE_KERNEL,
>+				    intr, MAX_SCHEDULE_TIMEOUT);
>+
>+	return ret < 0 ? ret : 0;

shouldn't == 0 also be an error since it would be a timeout?

Lucas De Marchi
