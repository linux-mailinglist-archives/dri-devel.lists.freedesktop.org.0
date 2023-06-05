Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D4B722A2E
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 17:04:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 520B210E2B6;
	Mon,  5 Jun 2023 15:04:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C98B510E2B6;
 Mon,  5 Jun 2023 15:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685977472; x=1717513472;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=1RjZRxyaGZbsDN3KVJJy9A/eP5QxEFeX3mpJSrufzKo=;
 b=JSIlPTkhbDSr6EdQxtE5Z4cbOPspjQilMqIdLmPI9b+T3/8j6nyrkv6I
 cYJ+yyUeYMoNYif9rNaFHc9aHJ1ESPNk+uOEbNKMMqfNueMmd/xFekgdx
 aCWYPIGCpmjuzWMNMqgAwxId8zXpqkQEYMYpktF+Szd3O6rdirnoDHDNq
 LTQ9knvY5juLf0wwA6+Y2qMln0ELJXOn/xT5BUOcA5uwQ9PVMQp35Cyy1
 k9CwlGXOQ/gH7ARTZBlu6Iyo8m5T6uBeeQfq5XhnYO8muEGN60G2kf9FG
 IN2VbGVGSjibeQgIcP4UBHtCdC12qrqhoQQsQq+5CW2R8efx28XZTdIWq g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="336010556"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; d="scan'208";a="336010556"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 08:04:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="659127419"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; d="scan'208";a="659127419"
Received: from twgeistx-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.42.176])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 08:04:14 -0700
Date: Mon, 5 Jun 2023 17:04:08 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v15 0/1] drm/i915: Allow user to set cache at
 BO creation
Message-ID: <ZH35aKO5BlAPERPB@ashyti-mobl2.lan>
References: <20230531171008.1738759-1-fei.yang@intel.com>
 <f7000b2e-e809-3801-48ba-d2a242dcb124@linux.intel.com>
 <2bc9cf75-e8b8-5a98-682b-630685bbe839@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2bc9cf75-e8b8-5a98-682b-630685bbe839@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 fei.yang@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 05, 2023 at 10:16:22AM +0100, Tvrtko Ursulin wrote:
> 
> On 05/06/2023 09:53, Tvrtko Ursulin wrote:
> > 
> > On 31/05/2023 18:10, fei.yang@intel.com wrote:
> > > From: Fei Yang <fei.yang@intel.com>
> > > 
> > > This series introduce a new extension for GEM_CREATE,
> > > 1. end support for set caching ioctl [PATCH 1/2]
> > > 2. add set_pat extension for gem_create [PATCH 2/2]
> > > 
> > > v2: drop one patch that was merged separately
> > >      commit 341ad0e8e254 ("drm/i915/mtl: Add PTE encode function")
> > > v3: rebased on https://patchwork.freedesktop.org/series/117082/
> > > v4: fix missing unlock introduced in v3, and
> > >      solve a rebase conflict
> > > v5: replace obj->cache_level with pat_set_by_user,
> > >      fix i915_cache_level_str() for legacy platforms.
> > > v6: rebased on https://patchwork.freedesktop.org/series/117480/
> > > v7: rebased on https://patchwork.freedesktop.org/series/117528/
> > > v8: dropped the two dependent patches that has been merged
> > >      separately. Add IGT link and Tested-by (MESA).
> > > v9: addressing comments (Andi)
> > > v10: acked-by and tested-by MESA
> > > v11: drop "end support for set caching ioctl" (merged)
> > >       remove tools/include/uapi/drm/i915_drm.h
> > > v12: drop Bspec reference in comment. add to commit message instead
> > > v13: sent to test with igt@gem_create@create-ext-set-pat
> > > v14: sent to test with igt@gem_create@create-ext-set-pat
> > > v15: update commit message with documentation note and t-b/a-b from
> > >       Media driver folks.
> > > 
> > > Fei Yang (1):
> > >    drm/i915: Allow user to set cache at BO creation
> > > 
> > >   drivers/gpu/drm/i915/gem/i915_gem_create.c | 36 +++++++++++++++++++
> > >   drivers/gpu/drm/i915/gem/i915_gem_object.c |  6 ++++
> > >   include/uapi/drm/i915_drm.h                | 41 ++++++++++++++++++++++
> > >   3 files changed, 83 insertions(+)
> > > 
> > 
> > Try with:
> > 
> > Test-with: 20230526172221.1438998-1-fei.yang@intel.com
> > 
> > That is how it is supposed to be done, to do a CI run against a test
> > case not yet merged that is.
> 
> Or I see that IGT has been since merged so you probably have results
> already?

CI has stopped somewhere in the BAT tests. Can anyone hit the
"Test revision 1 again" button? Fei, would you?

We had it tested some revisions back, though.

Andi
