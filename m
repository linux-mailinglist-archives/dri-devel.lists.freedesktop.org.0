Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 949C46E8474
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 00:17:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 555FD10EB34;
	Wed, 19 Apr 2023 22:17:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 699A110EB34;
 Wed, 19 Apr 2023 22:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681942654; x=1713478654;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=h8vHE+xYlguKJ694HM63t+5X3e6sqvRohqToAGfcB1E=;
 b=eyXM4GrqXFjgSpSGazupbKb7KBxMTnMjU6qskcvm0Z4KlV9SDSO7S/4Z
 8Ry6NGqu0n+KMximTpAGe53binWrqVc28yWKEiRpqV7gtR/gQUEdOnTdr
 8rAtZV2u6njq7JE9splyKoJ55DiUrvj/4G4+hR0LEyFSIS9wqBwVXa4tX
 4CntQv4zAtImbHVl4wQz9XFFrJgZ4X3JROK+6ZgUMPsQFXZS0OxquNtdf
 Wed3ZRXsW5akHC88TjWAJ6qLIp7f4zsHFUaQyHGHQ2eHMyW7hM0XHju2J
 K/3gEtcAwGOtS4xVpBWD5fPqkX/pIjaQC432K85SRnQnguJLGLYeP99np g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="325906383"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="325906383"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 15:12:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="780997441"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="780997441"
Received: from mmzakhar-mobl2.ccr.corp.intel.com (HELO intel.com)
 ([10.251.213.234])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 15:12:40 -0700
Date: Thu, 20 Apr 2023 00:12:36 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: fei.yang@intel.com
Subject: Re: [PATCH 6/8] drm/i915: preparation for using PAT index
Message-ID: <ZEBnVKi4ikadUt+f@ashyti-mobl2.lan>
References: <20230419211219.2574008-1-fei.yang@intel.com>
 <20230419211219.2574008-7-fei.yang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230419211219.2574008-7-fei.yang@intel.com>
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Fei,

On Wed, Apr 19, 2023 at 02:12:17PM -0700, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> This patch is a preparation for replacing enum i915_cache_level with PAT
> index. Caching policy for buffer objects is set through the PAT index in
> PTE, the old i915_cache_level is not sufficient to represent all caching
> modes supported by the hardware.
> 
> Preparing the transition by adding some platform dependent data structures
> and helper functions to translate the cache_level to pat_index.
> 
> cachelevel_to_pat: a platform dependent array mapping cache_level to
>                    pat_index.
> 
> max_pat_index: the maximum PAT index supported by the hardware. Needed for
>                validating the PAT index passed in from user space.
> 
> i915_gem_get_pat_index: function to convert cache_level to PAT index.
> 
> obj_to_i915(obj): macro moved to header file for wider usage.
> 
> I915_MAX_CACHE_LEVEL: upper bound of i915_cache_level for the
>                       convenience of coding.
> 
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Signed-off-by: Fei Yang <fei.yang@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
