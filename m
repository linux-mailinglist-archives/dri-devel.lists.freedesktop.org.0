Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 138D44DDB22
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 15:01:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B635010E76F;
	Fri, 18 Mar 2022 14:01:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2DFB10E203;
 Fri, 18 Mar 2022 14:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647612093; x=1679148093;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=/YjPztvGbbAUqzyjeMXQ1WcJ0nwjS1gYa9d1fF9pfdc=;
 b=ejrLvYr9+Mwl4w/P/mD8jCzqc8o5l+quglfuGlIuZp8WmyaLnuAa7yH5
 P7bq6nbJ6gCkRjeqlGlSb+aYZXZmDm+snVPt0fvkIteZzMaFz1fINK9UC
 qJnDzTG3TqKcPJCyLv0MSTRnJwjCb9xXthmXiX6KZHCiZBrn9w2N8WA0l
 NAvHCerBKJgXYxgUa0+eDKJtbzB0mQSqBayodRfBvwMkI/brsmDv2QBqX
 Eub215ZH+RbUP+Q+3mXytYQUqsrEqR6B/s6/Qni5j9vg9vy6EJb4GaVli
 vP+LSuWCYbDCTJuC74OGybc4+9iCp/fXI3bdY99hPDi+4gmE893zI+JGN Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="237751857"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="237751857"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 07:01:19 -0700
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="541856185"
Received: from aquilante.fi.intel.com (HELO intel.com) ([10.237.72.158])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 07:01:14 -0700
Date: Fri, 18 Mar 2022 16:01:12 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v6 4/7] drm/i915/gt: create per-tile sysfs interface
Message-ID: <YjSQqEU7NJTS49W6@intel.intel>
References: <20220318021046.40348-1-andi.shyti@linux.intel.com>
 <20220318021046.40348-5-andi.shyti@linux.intel.com>
 <dde37ab3-7065-d1b6-df4c-937001a038c0@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dde37ab3-7065-d1b6-df4c-937001a038c0@intel.com>
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
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>, Andi Shyti <andi@etezian.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 18, 2022 at 01:19:18PM +0000, Matthew Auld wrote:
> On 18/03/2022 02:10, Andi Shyti wrote:
> > Now that we have tiles we want each of them to have its own
> > interface. A directory "gt/" is created under "cardN/" that will
> > contain as many diroctories as the tiles.
> > 
> > In the coming patches tile related interfaces will be added. For
> > now the sysfs gt structure simply has an id interface related
> > to the current tile count.
> > 
> > The directory structure will follow this scheme:
> > 
> >      /sys/.../card0
> >               └── gt
> >                   ├── gt0
> >                   │   └── id
> >                   :
> > 		 :
> > 		 └─- gtN
> >                       └── id
> > 
> > This new set of interfaces will be a basic tool for system
> > managers and administrators when using i915.
> > 
> > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > Reviewed-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> > ---
> >   drivers/gpu/drm/i915/Makefile            |   1 +
> >   drivers/gpu/drm/i915/gt/intel_gt.c       |   2 +
> >   drivers/gpu/drm/i915/gt/intel_gt_sysfs.c | 103 +++++++++++++++++++++++
> >   drivers/gpu/drm/i915/gt/intel_gt_sysfs.h |  34 ++++++++
> >   drivers/gpu/drm/i915/i915_drv.h          |   2 +
> >   drivers/gpu/drm/i915/i915_sysfs.c        |   7 +-
> >   drivers/gpu/drm/i915/i915_sysfs.h        |   3 +
> >   scripts/extract-cert                     | Bin 0 -> 17952 bytes
> 
> What is extract-cert?

it's the result of a "git add ." ... thanks, I did not notice it.

Andi
