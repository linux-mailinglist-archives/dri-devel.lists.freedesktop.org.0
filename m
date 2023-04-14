Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CADE6E29BC
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 19:55:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C13C10ED89;
	Fri, 14 Apr 2023 17:54:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7FD010E1D4;
 Fri, 14 Apr 2023 17:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681494896; x=1713030896;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CXHWJm6lBnu0hiNb7JHIMump0PBenoIoPnvGu4gcfdM=;
 b=aY0imZ+cqnjO2W6tmKAjJRKdCO+t4FRN4hJARdTnjKS/MuOcm5xCbjpW
 LL6TwPZyQk3uH5sQu1spES2d4Vzd5nqhhWlul4+ge97ZHfMTJQNgu41GS
 7br0JIM+l0ogD2aoYYGBT2QGbGKnSx7E6VP1QQ/YRe+UB3LmFz3fXmvSn
 KEk62qKSPVjgfcI5bp4ZeX+jejvcYlA9h4vFMraBzq+aJQofB/3hnoq3+
 4rx82q+DRpkFHRoLx/DmiS6JridQi8jOHbCgzpIxsnL7Mj0+JydPMIFx2
 iTFnj9n35+gCQZh1VhH43c053TJABCtuTJ0A69NcFoiEldfsf/pYmiYye Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="333305708"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; d="scan'208";a="333305708"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2023 10:54:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="833623248"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; d="scan'208";a="833623248"
Received: from hubehann-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.212.141])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2023 10:54:40 -0700
Date: Fri, 14 Apr 2023 19:54:14 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH] drm/i915/gt: Mask media GuC interrupts
Message-ID: <ZDmTRoS42XrkpuVd@ashyti-mobl2.lan>
References: <20230414162540.1042889-1-andi.shyti@linux.intel.com>
 <289dee9b-9388-316e-c777-7534608bb38e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <289dee9b-9388-316e-c777-7534608bb38e@intel.com>
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
Cc: Andi Shyti <andi.shyti@kernel.org>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniele,

> > MTL features a dedicated media engine that operates on its
> > independent GT, requiring activation of its specific interrupt
> > set.
> > 
> > Enable the necessary interrupts in a single action when the media
> > engine is present, bypassing the need to iterate through all the
> > GTs.
> > 
> > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> > ---
> > Hi,
> > 
> > I'm starting with v0 as this patch is very different from the
> > ones proposed recently.
> > 
> > After all the discussions on this patch, I took Matt's suggestion
> > since it seemed the most immediate.
> > 
> > However, in the long run, I agree that we should have a
> > specific mtl_ function for enabling interrupts.
> > 
> > Thank you Matt and Daniele for your input.
> > 
> > If this patch hasn't missed anything, is it too optimistic to
> > expect MTL to boot? :-)
> 
> The GSC engine also has interrupts tied to the media GT and those are
> conditional, so that engine won't work with just this patch. The system
> might boot because the GSC engine gets disabled if the FW is not there, but
> IMO if we want a single function to handle both GTs we need to do it proper
> support for the engines and not hack around just the GuC.

yeah... we are already having too many things to handle and at
this point I don't see any better way to handle this other than
using for_each_gt() as it was first sent.

Besides, they are different GT's, why not using for_each_gt?

Thank you, Daniele,
Andi
