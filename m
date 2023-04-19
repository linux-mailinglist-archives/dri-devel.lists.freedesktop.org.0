Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A646E8468
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 00:13:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AE5110E1FA;
	Wed, 19 Apr 2023 22:13:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ADDF10EB2A;
 Wed, 19 Apr 2023 22:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681942398; x=1713478398;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1waZmVrmZnkmyQ8yjdIPsKpPGVwusBBNhJer8ykmCRg=;
 b=V3BV3luEqFFha9Yi0WwXCpEwHzZQLXLiAmcdhd4qQqNuorgyjG9qpFwI
 vRcYiB1HW6qMcmrT++IjyewWGdUXBmjb/TOTWRS7DlA1W2pRKqj0BOeZu
 VYoXALayrFhZret4zQ+ZFCfunfmPG0/6+a0KIoYU8dbRRUTCfPaSi0J3Z
 B3B6Sa6+PTKMRTy41MlNVq0ana3+6LfBhk8eefeShdmaLPnLqAePFkd/f
 kpuomwAHHIqqrjddXwtBOqHCjp+f0H1HAlWVEZMn4QIDYikDzn1CXbksj
 Ai9yidoBw5VKlxKaIFlsmyn3WO9TZLKjLqYGXOjcbzWQTYwNQ1hjaX+4x w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="325184228"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="325184228"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 15:09:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="724192252"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="724192252"
Received: from mmzakhar-mobl2.ccr.corp.intel.com (HELO intel.com)
 ([10.251.213.234])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 15:09:53 -0700
Date: Thu, 20 Apr 2023 00:09:49 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: fei.yang@intel.com
Subject: Re: [Intel-gfx] [PATCH 7/8] drm/i915: use pat_index instead of
 cache_level
Message-ID: <ZEBmrT3rTQw/I3ew@ashyti-mobl2.lan>
References: <20230419211219.2574008-1-fei.yang@intel.com>
 <20230419211219.2574008-8-fei.yang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230419211219.2574008-8-fei.yang@intel.com>
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
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Fei,

> Currently the KMD is using enum i915_cache_level to set caching policy for
> buffer objects. This is flaky because the PAT index which really controls
> the caching behavior in PTE has far more levels than what's defined in the
> enum. In addition, the PAT index is platform dependent, having to translate
> between i915_cache_level and PAT index is not reliable, and makes the code
> more complicated.
> 
> >From UMD's perspective there is also a necessity to set caching policy for
> performance fine tuning. It's much easier for the UMD to directly use PAT
> index because the behavior of each PAT index is clearly defined in Bspec.
> Having the abstracted i915_cache_level sitting in between would only cause
> more ambiguity.
> 
> For these reasons this patch replaces i915_cache_level with PAT index. Also
> note, the cache_level is not completely removed yet, because the KMD still
> has the need of creating buffer objects with simple cache settings such as
> cached, uncached, or writethrough. For such simple cases, using cache_level
> would help simplify the code.
> 
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Fei Yang <fei.yang@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
