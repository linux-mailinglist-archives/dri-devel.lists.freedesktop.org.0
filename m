Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 643596E845F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 00:08:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAF3B10E1FC;
	Wed, 19 Apr 2023 22:07:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C60B10E1FC;
 Wed, 19 Apr 2023 22:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681942077; x=1713478077;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rK8sLc3EiEhfHPI2e0rRFtUbIgDe3kgPmzmEGzn4Ccw=;
 b=ls1Xbugv24hLVQcOAuXUF+ClMOoZITgv/ome2iDjmxwpgf9iDa4JIyjV
 Tl8FdiTI7T+XlnJnOhlEwrzN17IPaQGuH1a+voQzZTdgTQvD2LZmebvvM
 Xi7HRjMbVojQChteWPs6bNZaAxUn8nxOJqxIlokJUD8TKM4Jvl66AP+Sq
 m8s69XB+qmVY/2qVBTTLMvjvOXlvAKHdFwSgWJ7n9BR97rcuul0XWG48t
 1U6zJ4aiTnsiALOCOQV+Q3jQIk61xsN6ZGbsJFC6f3Mp6aeCQXJ/mWx4w
 BnHTL4+f520Hr0JJW9x+U4QOMyaQO3htpmYaeGszZhoYYb49VZyTSB/2A w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="345571586"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="345571586"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 15:07:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="760898894"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="760898894"
Received: from mmzakhar-mobl2.ccr.corp.intel.com (HELO intel.com)
 ([10.251.213.234])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 15:07:53 -0700
Date: Thu, 20 Apr 2023 00:07:50 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: fei.yang@intel.com
Subject: Re: [Intel-gfx] [PATCH 4/8] drm/i915/mtl: workaround coherency issue
 for Media
Message-ID: <ZEBmNnHdMsCdkL5m@ashyti-mobl2.lan>
References: <20230419211219.2574008-1-fei.yang@intel.com>
 <20230419211219.2574008-5-fei.yang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230419211219.2574008-5-fei.yang@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Fei,

On Wed, Apr 19, 2023 at 02:12:15PM -0700, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> This patch implements Wa_22016122933.
> 
> In MTL, memory writes initiated by Media tile update the whole
> cache line even for partial writes. This creates a coherency
> problem for cacheable memory if both CPU and GPU are writing data
> to different locations within a single cache line. CTB communication
> is impacted by this issue because the head and tail pointers are
> adjacent words within a cache line (see struct guc_ct_buffer_desc),
> where one is written by GuC and the other by the host.
> This patch circumvents the issue by making CPU/GPU shared memory
> uncacheable (WC on CPU side, and PAT index 2 for GPU). Also for
> CTB which is being updated by both CPU and GuC, mfence instruction
> is added to make sure the CPU writes are visible to GPU right away
> (flush the write combining buffer).
> 
> While fixing the CTB issue, we noticed some random GSC firmware
> loading failure because the share buffers are cacheable (WB) on CPU
> side but uncached on GPU side. To fix these issues we need to map
> such shared buffers as WC on CPU side. Since such allocations are
> not all done through GuC allocator, to avoid too many code changes,
> the i915_coherent_map_type() is now hard coded to return WC for MTL.
> 
> BSpec: 45101
> 
> Signed-off-by: Fei Yang <fei.yang@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Acked-by: Nirmoy Das <nirmoy.das@intel.com>

Still one comment below.

[...]

> +	/*
> +	 * Wa_22016122933: Making sure the head update is
> +	 * visible to GuC right away
> +	 */
> +	intel_guc_write_barrier(ct_to_guc(ct));

I thought you were going to revert this. Is this really needed,
BTW? I'm fine with leaving it.

Andi
