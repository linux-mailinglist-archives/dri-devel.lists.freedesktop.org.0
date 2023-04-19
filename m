Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 235446E79DA
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 14:38:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD91010E96E;
	Wed, 19 Apr 2023 12:38:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6295D10E96E;
 Wed, 19 Apr 2023 12:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681907929; x=1713443929;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Oif4obrEKjhIatbSCuOZFh8TipKriU+kuxbPcGPiED0=;
 b=GEH5xTaymC49C+0TWyLGxEXVB20nndrxhVJv9MCa+NcDSW5HK0BmZCAE
 xeNp/mzi17hvypAzpfqR2cUHHBFZ7FxMhInCt4Sa0kmf4RbMR7N/ZRMN/
 /Rtpwpd63qHWIv7XkcoI5JmYYFzSYmhoYAZ34n8WGVS1DO968zkf6TXwu
 ax8HqTezfWHjs1Ao2pTgsKZ8s3RduGB/vLrl3PFASI97T5zINv+Z0K9F0
 ur5AX1rRxrRHaN/erLQWlIc8S0uzoDxJpCr0t3pPjc16DZ8Annd/oeDYo
 D7YOR8cx8I0mVUbHlP1CIgB1kjDE5rgB/XlbykEIrI3ikwQbf5X/u3+hO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="334243597"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="334243597"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 05:38:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="694039576"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="694039576"
Received: from crijnder-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.35.137])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 05:38:42 -0700
Date: Wed, 19 Apr 2023 14:38:39 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: fei.yang@intel.com
Subject: Re: [Intel-gfx] [PATCH 4/8] drm/i915/mtl: workaround coherency issue
 for Media
Message-ID: <ZD/gz8xW7VYBGBPk@ashyti-mobl2.lan>
References: <20230417062503.1884465-1-fei.yang@intel.com>
 <20230417062503.1884465-5-fei.yang@intel.com>
 <ZD/JeMMuiJNpBX1B@ashyti-mobl2.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZD/JeMMuiJNpBX1B@ashyti-mobl2.lan>
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

On Wed, Apr 19, 2023 at 12:59:09PM +0200, Andi Shyti wrote:
> Hi Fei,
> 
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> > @@ -743,6 +743,13 @@ struct i915_vma *intel_guc_allocate_vma(struct intel_guc *guc, u32 size)
> >  	if (IS_ERR(obj))
> >  		return ERR_CAST(obj);
> >  
> > +	/*
> > +	 * Wa_22016122933: For MTL the shared memory needs to be mapped
> > +	 * as WC on CPU side and UC (PAT index 2) on GPU side
> 
> Isn't UC PAT index 3?

Sorry, it's 2... I was reading the wrong table.

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
