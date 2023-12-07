Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C5D8086E4
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 12:43:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B418110E882;
	Thu,  7 Dec 2023 11:43:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD49610E876;
 Thu,  7 Dec 2023 11:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701949413; x=1733485413;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4Oo9oE5b4D5IFiGjzaPy3YHlDbkF5OxHE0CWtGJ82hc=;
 b=LB5T6hydQqbC0jmGZsee2DpeuJWzH4n894vyEogwh1heWY8ozfJiUyv1
 sgzTkPCw1BuJIbnUY0VHi0hJoK/RCH/m4i7QaFhnLn25QOaAXO6Qbp/mm
 puSXqRUvD/YRpCBZMLZhPvXk7JeUFqVi6cubLWXILdg+LjWo0BoyZwi67
 RjJKRxdiGuGoNlGQax7m48vvrPI2TfK7uuUDkuJ4htLoIH5fbdD/aTX0E
 6a/qe6ACJz5HW2uSTPpxRgGynLxlm/3594Y4nbEjuRBNZOo9SGfaunL66
 yY7h9NUl7xn2B6JQrlxMHPOFQ4gnbEW9r14OF01jZoMCOCyOo0Hs+Ix/X A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="384622792"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="384622792"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 03:43:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="842182742"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="842182742"
Received: from jbuller-mobl.ger.corp.intel.com (HELO [10.213.214.207])
 ([10.213.214.207])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 03:43:30 -0800
Message-ID: <3b38e862-7a45-48b9-9310-b751d797a9ef@linux.intel.com>
Date: Thu, 7 Dec 2023 11:43:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/i915/selftests: Fix engine reset count storage
 for multi-tile
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20231201122109.729006-1-tvrtko.ursulin@linux.intel.com>
 <ZXGr7s7wkYZexDuc@ashyti-mobl2.lan>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ZXGr7s7wkYZexDuc@ashyti-mobl2.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Intel-gfx@lists.freedesktop.org,
 Tejas Upadhyay <tejas.upadhyay@intel.com>, dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 07/12/2023 11:26, Andi Shyti wrote:
> Hi Tvrtko,
> 
>> Engine->id namespace is per-tile so struct igt_live_test->reset_engine[]
>> needs to be two-dimensional so engine reset counts from all tiles can be
>> stored with no aliasing. With aliasing, if we had a real multi-tile
>> platform, the reset counts would be incorrect for same engine instance on
>> different tiles.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Fixes: 0c29efa23f5c ("drm/i915/selftests: Consider multi-gt instead of to_gt()")
>> Reported-by: Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>
>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> 
> sorry for being late here... the patch makes sense to me and the
> CI failures don't look related.
> 
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks pushed!

There is more work to be done with the fact i915_reset_engine_count has 
it's own aliasing when used like this, but I opted to leave that for 
some other time.

Regards,

Tvrtko
