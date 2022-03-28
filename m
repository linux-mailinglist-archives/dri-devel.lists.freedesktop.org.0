Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A8D4E9F3B
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 20:55:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DE9510E92C;
	Mon, 28 Mar 2022 18:55:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64FB610E75D;
 Mon, 28 Mar 2022 18:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648493746; x=1680029746;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=/kVOMGipEs5lDL5nN72dENXwsF0nEarT+l+QcS0Uu7k=;
 b=hCTwXDxFBljKM6VV9b3eGnnXCluveyPimG8kpHM1rYA5xUKNpRP+EITN
 i2eUz/chmHPSsuwFYPGGZo8CBhN1RcqUlYgCxMXmy9QRRXmNaK10yQ/ct
 10S5dd9oofIN0zwiKC9uGJ9ne6h/X6bX1SmxAZLLhbeDDtunWYavu/llr
 UXXp8miK8YQclp7Ij9NkKmnrrKeuT7WbxDML9l5VOEkcA1lwy1arvki1P
 NOZLjZebaI+XdaBK8/WTAd7pgTuyjLeR5+Cvitx7wUnfEmn5fKnaO6cVy
 eQv4dBREqujp9xMH2BlAg0hUaTajWt615+2q6LmmoVGNcKQZ0jxuEtW/H A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="257909100"
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; d="scan'208";a="257909100"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 11:55:42 -0700
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; d="scan'208";a="546075467"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.203.144.108])
 by orsmga007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2022 11:55:39 -0700
Date: Tue, 29 Mar 2022 00:26:18 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Thomas =?utf-8?B?SGVsbHN0csO2bSAoSW50ZWwp?= <thomas_os@shipmail.org>
Subject: Re: [Intel-gfx] [PATCH v5 6/9] drm/i915/gt: offset handling for
 multiple copy engines
Message-ID: <20220328185618.GA19751@intel.com>
References: <20220321224459.12223-1-ramalingam.c@intel.com>
 <20220321224459.12223-7-ramalingam.c@intel.com>
 <6eebe04c-da24-600d-1c46-8ae341d7a061@shipmail.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6eebe04c-da24-600d-1c46-8ae341d7a061@shipmail.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-03-24 at 17:20:28 +0100, Thomas Hellström (Intel) wrote:
> 
> On 3/21/22 23:44, Ramalingam C wrote:
> > Handle the src and dst chunk offsets for different instances of the copy
> > engines.
> > 
> > Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gt/intel_migrate.c | 3 +++
> >   1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
> > index 39a5f8ae664d..5f6341f91622 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_migrate.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
> > @@ -614,6 +614,9 @@ static int emit_copy(struct i915_request *rq,
> >   	u32 instance = rq->engine->instance;
> >   	u32 *cs;
> > +	src_offset += (u64)rq->engine->instance << 32;
> > +	dst_offset += (u64)rq->engine->instance << 32;
> > +
> 
> Again, these are nops since the offsets are 32-bit.
> 
> Also the instance selection is already handled in the functon, so I think
> this patch can be dropped.

Thanks. Dropped this patch. and made copy and clear uniform with respect to
engine index handling for offset.

Ram.
> 
> 
> >   	cs = intel_ring_begin(rq, ver >= 8 ? 10 : 6);
> >   	if (IS_ERR(cs))
> >   		return PTR_ERR(cs);
