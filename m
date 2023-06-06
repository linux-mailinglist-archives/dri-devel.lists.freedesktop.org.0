Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2296D723F24
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 12:18:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA20A10E32A;
	Tue,  6 Jun 2023 10:18:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5209710E234;
 Tue,  6 Jun 2023 10:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686046697; x=1717582697;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8rSzs5/AQ7K1IzWwFTyHRwcbT5kqGyq+YIynI1ob1rM=;
 b=JnYMMX+nbEfwzig8kH42cH8v86D4tCVNK8EL/B5uwMMtJntxk17ypRCw
 4mm5QJv0DwyqnQumwRuhA+aWDbeJ4c0TK63QngG2sq/fh//a75ONp7O/M
 WJIAbOgyQHZoGYgk/V+FhJOeXwWCtSwwcXXIi+L3b1Me/qFp3rDRdvdTu
 nFqXOezDmjIgfBeCnSm1YPo1MSX3kPO2G12BybgHeBm0ZKw3j5PF10mMs
 gDTlIK8imJa762t7jbaeW/sL40v8+8ebkHOHzbt2XJgk97q6BR19mu53O
 LIqd2uh/NtZvXPS+TzqDQYjnxFxZI0AaFcuHhEqkqj1W4o5btbJgadyoi w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="359080219"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="359080219"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 03:18:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="955700928"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="955700928"
Received: from yuguen-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.252.57.68])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 03:18:12 -0700
Date: Tue, 6 Jun 2023 12:18:06 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH v17 1/1] drm/i915: Allow user to set cache at BO creation
Message-ID: <ZH8H3ovN20uVO+tK@ashyti-mobl2.lan>
References: <20230606100042.482345-1-andi.shyti@linux.intel.com>
 <20230606100042.482345-2-andi.shyti@linux.intel.com>
 <ec219702-8608-e919-cbcd-f271646845d1@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec219702-8608-e919-cbcd-f271646845d1@linux.intel.com>
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
Cc: Lihao Gu <lihao.gu@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Fei Yang <fei.yang@intel.com>,
 Carl Zhang <carl.zhang@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 06, 2023 at 11:10:04AM +0100, Tvrtko Ursulin wrote:
> 
> On 06/06/2023 11:00, Andi Shyti wrote:
> > From: Fei Yang <fei.yang@intel.com>
> > 
> > To comply with the design that buffer objects shall have immutable
> > cache setting through out their life cycle, {set, get}_caching ioctl's
> > are no longer supported from MTL onward. With that change caching
> > policy can only be set at object creation time. The current code
> > applies a default (platform dependent) cache setting for all objects.
> > However this is not optimal for performance tuning. The patch extends
> > the existing gem_create uAPI to let user set PAT index for the object
> > at creation time.
> > The new extension is platform independent, so UMD's can switch to using
> > this extension for older platforms as well, while {set, get}_caching are
> > still supported on these legacy paltforms for compatibility reason.
> > However, since PAT index was not clearly defined for platforms prior to
> > GEN12 (TGL), so we are limiting this externsion to GEN12+ platforms
> > only. See ext_set_pat() in for the implementation details.
> > 
> > Note: The documentation related to the PAT/MOCS tables is currently
> > available for Tiger Lake here:
> > https://www.intel.com/content/www/us/en/docs/graphics-for-linux/developer-reference/1-0/tiger-lake.html
> > 
> > BSpec: 45101
> > 
> > Mesa support has been submitted in this merge request:
> > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/22878
> > 
> > The media driver is supported by the following commits:
> > https://github.com/intel/media-driver/commit/92c00a857433ebb34ec575e9834f473c6fcb6341
> > https://github.com/intel/media-driver/commit/fd375cf2c5e1f6bf6b43258ff797b3134aadc9fd
> > https://github.com/intel/media-driver/commit/08dd244b22484770a33464c2c8ae85430e548000
> > 
> > The IGT test related to this change is
> > igt@gem_create@create-ext-set-pat
> > 
> > Signed-off-by: Fei Yang <fei.yang@intel.com>
> > Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Cc: Andi Shyti <andi.shyti@linux.intel.com>
> > Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> > Acked-by: Jordan Justen <jordan.l.justen@intel.com>
> > Tested-by: Jordan Justen <jordan.l.justen@intel.com>
> > Acked-by: Carl Zhang <carl.zhang@intel.com>
> > Tested-by: Lihao Gu <lihao.gu@intel.com>
> > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> 
> Acked-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Fiuuu! Thanks a lot, Tvrtko!

As soon as CI gives green light, I will get this in.

Andi
