Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48127A34E1F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 19:56:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6076010EB7D;
	Thu, 13 Feb 2025 18:56:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QXkdg6Yl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0EE410EB7C;
 Thu, 13 Feb 2025 18:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739472984; x=1771008984;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=J36vDmz64IqzcqCcIxnJ6jD1YjtOO5MSz5lNbJVMmzw=;
 b=QXkdg6Yltmz+XU9AqJC09tPznAMXRMwLymgxSOdWfKiW9jJxUCX5z2wm
 3zWs8Srye4C94v1ANxD6WH5DZcJ/6YUFjCePcAM0n5Fslc0JyfWmPhQ9m
 gFT6T4D61iwGgeeYiWlanCwrDV0G1u++rXv/VM0j+sCAqrPX0c+G++fQF
 lcCEIwwldkLrtGdaABIZVeFikVI39bqm+s4jkmWkw39ZAIFFuBv8XSPSr
 J//dDnDhQSqyAoE75aHowceFNZfdhu4cENFzIO00L0+b9a4soSvj4OZs1
 K/XrYJwDffMSlaWYZcAcrkt/PmG7WnDH/hdAdVPAWXB+zZP3YGND9B/Ly w==;
X-CSE-ConnectionGUID: LrJBd05JTgWrJDy7u8b34g==
X-CSE-MsgGUID: 3hjUek6qRWSxQNrDHduotg==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40059589"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="40059589"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 10:56:24 -0800
X-CSE-ConnectionGUID: ukCFf0GBT0Otm0dYotWJhA==
X-CSE-MsgGUID: jzqqrSP6Q6uQfjzS3E7JWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="113186953"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.5])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 10:56:20 -0800
Date: Thu, 13 Feb 2025 19:56:16 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 John Harrison <John.C.Harrison@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: Re: [PATCH v3] drm/i915/gt: Use spin_lock_irqsave() in interruptible
 context
Message-ID: <Z65AUD8Z6cfteuLd@ashyti-mobl2.lan>
References: <pusppq5ybyszau2oocboj3mtj5x574gwij323jlclm5zxvimmu@mnfg6odxbpsv>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pusppq5ybyszau2oocboj3mtj5x574gwij323jlclm5zxvimmu@mnfg6odxbpsv>
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

Hi Krzysztof,

On Thu, Jan 16, 2025 at 10:40:46AM +0000, Krzysztof Karas wrote:
> spin_lock/unlock() functions used in interrupt contexts could
> result in a deadlock, as seen in GitLab issue #13399:
> https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13399,

I moved this link in the tag sectoin as Closes:

> which occurs when interrupt comes in while holding a lock.
> 
> Try to remedy the problem by saving irq state before spin lock
> acquisition.
> 
> v2: add irqs' state save/restore calls to all locks/unlocks in
>  signal_irq_work() execution (Maciej)
> 
> v3: use with spin_lock_irqsave() in guc_lrc_desc_unpin() instead
>  of other lock/unlock calls and add Fixes and Cc tags (Tvrtko);
>  change title and commit message
> 
> Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>
> Fixes: 2f2cc53b5fe7 ("drm/i915/guc: Close deregister-context race against CT-loss")

I moved Fixes: above your SoB.

> Cc: <stable@vger.kernel.org> # v6.9+

Anyway, good catch, but please, remember next time to relly add
in Cc the stable kernel mailing list, the guc guys in Cc for GuC
related patches and the author of the patch you are fixing.

Reviewed and merged in drm-intel-gt-next.

Thanks,
Andi
