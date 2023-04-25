Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DF96EE897
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 21:49:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6ED710E083;
	Tue, 25 Apr 2023 19:49:40 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AD5110E083;
 Tue, 25 Apr 2023 19:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682452178; x=1713988178;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+A55figV2KY0Lbwx7DKL+lUi654PZn0kCZuRq6PAiTc=;
 b=bvFyVPQTOu4YTsHQSjIZh1WHxpBnYYhZK7a5tB/abxp1W8uB9N5mrJ9i
 WjMPtSIvnML8su+2Cd+z3QLM9w92fyocp6E6iBWCa5GGa9+/C6/HO6jyz
 nIORiGm+Tn+jfy+33iTCKaAVfBOz0wbXiv117yH34m0UZfN8iSi7YEJDi
 6g5MKudr/O3LFwmrVVaHFr4dPxQDHwUvwd2miJDnITM+ezqYE0zHfiNue
 hcLXzorJNFOAJiwpifNjWmZSmBI+kBA+LVHzj2XE69OzCacAVXDK4ciAv
 IFSrdG2wbPgkDXGKeho5CJE2FnTy+8IbDt6xdK6CfiSrThDcxZLGYYVps A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="374833799"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; d="scan'208";a="374833799"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 12:49:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="817837806"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; d="scan'208";a="817837806"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.59.107])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 12:49:33 -0700
Date: Tue, 25 Apr 2023 21:49:30 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: John.C.Harrison@intel.com
Subject: Re: [PATCH] drm/i915/guc: Actually return an error if GuC version
 range check fails
Message-ID: <ZEguyolJp/kM73AP@ashyti-mobl2.lan>
References: <20230421224742.2357198-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230421224742.2357198-1-John.C.Harrison@Intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>, Dan Carpenter <error27@gmail.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Intel-GFX@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 DRI-Devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi John,

> Dan Carpenter pointed out that 'err' was not being set in the case
> where the GuC firmware version range check fails. Fix that.
> 
> Note that while this is bug fix for a previous patch (see Fixes tag

is _a_ bug fix.

> below). It is an exceedingly low risk bug. The range check is
> asserting that the GuC firmware version is within spec. So it should
> not be possible to ever have a firmware file that fails this check. If
> larger version numbers are required in the future, that would be a
> backwards breaking spec change and thus require a major version bump,
> in which case an old i915 driver would not load that new version anyway.
> 
> Fixes: 9bbba0667f37 ("drm/i915/guc: Use GuC submission API version number")
> Reported-by: Dan Carpenter <error27@gmail.com>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
