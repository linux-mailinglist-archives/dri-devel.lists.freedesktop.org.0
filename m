Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BEE7F1017
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 11:17:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3A8F10E398;
	Mon, 20 Nov 2023 10:17:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 903B310E398;
 Mon, 20 Nov 2023 10:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700475423; x=1732011423;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1RbzHU9hGAKb03+oXFOpkvhNF04CcTDjh9zb67dT58U=;
 b=FoHDl9yjbuNbPjAqkkej1yH7le5Aid+W1yqrNwJGHuuYkTV1DmTqiEBg
 YFKcrxuhYLFpRyhr0G3kH+hyCHVRsQkNtJ0wE4bZ785qw5JSVDH989My+
 CzSdoVDaAWXFgNQl9nRmLPEpaECFe3EiI2afJIG9q/RHbd0wYbQrHrZxe
 82yJe2I430szxn7m+aB9RfPJ94F5TXNBgPrrPsfU5LAZp/4JXFyR8BqWx
 pU06otZPvIZ2Ihv+jNSDwwMvqFYGlOLiUkvX3/Xd6WTjopXbNed8KLUDn
 v12VEgrVbP0RHiXhzjB1whuKyDV7Uh52oy7qn8AUS136SDTXZtl/Njia8 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="4708864"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; 
   d="scan'208";a="4708864"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 02:17:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; 
   d="scan'208";a="7509718"
Received: from kdaxer-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.249.46.237])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 02:17:01 -0800
Date: Mon, 20 Nov 2023 11:16:57 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH 2/2] drm/i915: Add __rcu annotation to cursor when
 iterating client objects
Message-ID: <ZVsyGRdsB1ptHCCR@ashyti-mobl2.lan>
References: <20231113085457.199053-1-tvrtko.ursulin@linux.intel.com>
 <20231113085457.199053-2-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231113085457.199053-2-tvrtko.ursulin@linux.intel.com>
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
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tvrtko,

On Mon, Nov 13, 2023 at 08:54:57AM +0000, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> __rcu annotation is needed to avoid the sparse warnings such as:
> 
>   .../i915_drm_client.c:92:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
>   .../i915_drm_client.c:92:9: sparse:    struct list_head [noderef] __rcu *
>   .../i915_drm_client.c:92:9: sparse:    struct list_head *
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Fixes: 968853033d8a ("drm/i915: Implement fdinfo memory stats printing")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202311110610.h0m6ydI5-lkp@intel.com/
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
