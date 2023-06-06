Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F26F7240A2
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 13:15:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 562DD10E235;
	Tue,  6 Jun 2023 11:15:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A882F10E220;
 Tue,  6 Jun 2023 11:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686050103; x=1717586103;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ovPlpw2hIo6ckI6MPzIS0HwU1hhEufTIrY0AN3MthdQ=;
 b=e8z9xF5lw3CFiZqWfam+UFhxQb+eB3aHkkiZEtcki71aVbP/xsIIORAw
 4KJlr7/nXPsOjao8vWhdcWzGkNwyOsC82HND3H9pMXt6t3oFQG2jT3T2O
 VTLcmt/uTFUqoXvmbkdKsikSV8/HlhZD6gX9LUnqWcc3VRPlbyIGIuBVD
 sJ6yozGISsUd7Pgq/SEZqtjoP3lUCczmkE+oTwC//48Z+rLdc1llcHzWD
 bW0wS1s/gkJaSF/BRcoH81L/75lvW/oBJ/MCefOAw4ZABNHvN0W3J7f7a
 D10zrOAJ5CoOfUnTFkJfndvlGoEx5jEPsI3Q1a0A6z1ZfpQuchHhciYwa w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="359092898"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="359092898"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 04:15:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="833191798"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="833191798"
Received: from yuguen-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.252.57.68])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 04:14:59 -0700
Date: Tue, 6 Jun 2023 13:14:53 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH v17 1/1] drm/i915: Allow user to set cache at BO creation
Message-ID: <ZH8VLY8a9d7i96cw@ashyti-mobl2.lan>
References: <20230606100042.482345-1-andi.shyti@linux.intel.com>
 <20230606100042.482345-2-andi.shyti@linux.intel.com>
 <ec219702-8608-e919-cbcd-f271646845d1@linux.intel.com>
 <ZH8H3ovN20uVO+tK@ashyti-mobl2.lan>
 <168604992363.24014.14317865195655387952@jlahtine-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <168604992363.24014.14317865195655387952@jlahtine-mobl.ger.corp.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Lihao Gu <lihao.gu@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Fei Yang <fei.yang@intel.com>,
 Carl Zhang <carl.zhang@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > > > To comply with the design that buffer objects shall have immutable
> > > > cache setting through out their life cycle, {set, get}_caching ioctl's
> > > > are no longer supported from MTL onward. With that change caching
> > > > policy can only be set at object creation time. The current code
> > > > applies a default (platform dependent) cache setting for all objects.
> > > > However this is not optimal for performance tuning. The patch extends
> > > > the existing gem_create uAPI to let user set PAT index for the object
> > > > at creation time.
> > > > The new extension is platform independent, so UMD's can switch to using
> > > > this extension for older platforms as well, while {set, get}_caching are
> > > > still supported on these legacy paltforms for compatibility reason.
> > > > However, since PAT index was not clearly defined for platforms prior to
> > > > GEN12 (TGL), so we are limiting this externsion to GEN12+ platforms
> > > > only. See ext_set_pat() in for the implementation details.
> > > > 
> > > > Note: The documentation related to the PAT/MOCS tables is currently
> > > > available for Tiger Lake here:
> > > > https://www.intel.com/content/www/us/en/docs/graphics-for-linux/developer-reference/1-0/tiger-lake.html
> > > > 
> > > > BSpec: 45101
> > > > 
> > > > Mesa support has been submitted in this merge request:
> > > > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/22878
> > > > 
> > > > The media driver is supported by the following commits:
> > > > https://github.com/intel/media-driver/commit/92c00a857433ebb34ec575e9834f473c6fcb6341
> > > > https://github.com/intel/media-driver/commit/fd375cf2c5e1f6bf6b43258ff797b3134aadc9fd
> > > > https://github.com/intel/media-driver/commit/08dd244b22484770a33464c2c8ae85430e548000
> 
> Andi, let's still get these corrected before merging once the media-driver
> revert is completed.

Sure!

At least this doesn't need a new version to be respinned.

Please, Carl, link the new pull request and I will update the
commit log.

Andi
