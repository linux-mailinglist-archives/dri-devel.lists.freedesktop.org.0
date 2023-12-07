Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1458086F9
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 12:46:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24DF510E886;
	Thu,  7 Dec 2023 11:46:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77ED110E886;
 Thu,  7 Dec 2023 11:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701949588; x=1733485588;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ibTDdrni4yWhfLkLOyB9bzRYt0BcCqerkJOS4heUlZw=;
 b=Qds3Y8eghmWIQwLBOliRi1nP5yAAoBmnGA3NspKEpALWHBXPJN5k2Glp
 PcT3ROKX6nuOdFFP+LAxgI69vcChPNW64+I0JTzgda8d7o47q08YxPMd4
 ZWlLcBAjnKEK6KLSObSS4CergYZq6EySjstFMww1v65qy6jyj8G0FpIPA
 hJrdtooK7gYiSBYEdHo83Syncy7BROuqIsns2neirrxbRUhXmnUIh4+fu
 e0NIv/3gVprVl7t2onKau8nNQ+aIQO5R0wt3kNtXXU3m+nCbQrEnjmHwH
 iKkzhgWZzQ6uSzZRH513nOzp6lZZBMqRL8LPNL/ZepEnWe+kO7U6vB7sc Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="12931323"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="12931323"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 03:46:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1103173733"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="1103173733"
Received: from wokeeffe-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.46.171])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 03:46:24 -0800
Date: Thu, 7 Dec 2023 12:46:21 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/i915/selftests: Fix engine reset count storage
 for multi-tile
Message-ID: <ZXGwjTj3vsI6NAcI@ashyti-mobl2.lan>
References: <20231201122109.729006-1-tvrtko.ursulin@linux.intel.com>
 <ZXGr7s7wkYZexDuc@ashyti-mobl2.lan>
 <3b38e862-7a45-48b9-9310-b751d797a9ef@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b38e862-7a45-48b9-9310-b751d797a9ef@linux.intel.com>
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
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 07, 2023 at 11:43:28AM +0000, Tvrtko Ursulin wrote:
> 
> On 07/12/2023 11:26, Andi Shyti wrote:
> > Hi Tvrtko,
> > 
> > > Engine->id namespace is per-tile so struct igt_live_test->reset_engine[]
> > > needs to be two-dimensional so engine reset counts from all tiles can be
> > > stored with no aliasing. With aliasing, if we had a real multi-tile
> > > platform, the reset counts would be incorrect for same engine instance on
> > > different tiles.
> > > 
> > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > > Fixes: 0c29efa23f5c ("drm/i915/selftests: Consider multi-gt instead of to_gt()")
> > > Reported-by: Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>
> > > Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > Cc: Andi Shyti <andi.shyti@linux.intel.com>
> > > Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > 
> > sorry for being late here... the patch makes sense to me and the
> > CI failures don't look related.
> > 
> > Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> 
> Thanks pushed!
> 
> There is more work to be done with the fact i915_reset_engine_count has it's
> own aliasing when used like this, but I opted to leave that for some other
> time.

feel free to share if you have some preparatory work done already
and I can try to help out. Otherwise I can take a look at it, as
well.

Andi
