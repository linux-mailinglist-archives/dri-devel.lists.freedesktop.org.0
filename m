Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D57C87264FA
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 17:46:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E56A10E09F;
	Wed,  7 Jun 2023 15:46:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8E3910E09F;
 Wed,  7 Jun 2023 15:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686152780; x=1717688780;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZqLH0wt1risVqqavdhUp4yeIAPUa4qllXt7Z2/77VqA=;
 b=Q6Wu2Wh1cj30yLacTq6GEqt8938BT0KlBBvvLl9zVB6CsaegRCU4YKvn
 V2Ef0olqSoM/w1rJdZlvmY6O6uimUFHyPuiJgNwCyvwkPLSCAHmDieCDu
 G3W3OzaDryB8q83TspFqr5EROJ+lXzPH0T4ujN19GQVdpaFZIKedprDsh
 UuqtOcqbcuPvXEKtmMFxug7bt31Ukf7OFJgguVWtGqVIUOWiHIg2W3FSb
 ck7/CCL7m4B3BP1yQKhluYyl6ZX6sv2pX22WDdwHEAA1py0NMd3VqQ0bv
 no34uFA/Gdd2ruv3YYDR1QxNgm/8LsF0Du3tIKJ/0zsYGpzskVQcmg7tU A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="357037861"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; d="scan'208";a="357037861"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 08:46:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="660004209"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; d="scan'208";a="660004209"
Received: from jjrevuel-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.249.42.202])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 08:46:12 -0700
Date: Wed, 7 Jun 2023 17:46:04 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v17 1/1] drm/i915: Allow user to set cache at BO creation
Message-ID: <ZICmPEvudJo2HycS@ashyti-mobl2.lan>
References: <20230606100042.482345-1-andi.shyti@linux.intel.com>
 <20230606100042.482345-2-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230606100042.482345-2-andi.shyti@linux.intel.com>
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
 Lihao Gu <lihao.gu@intel.com>, Jordan Justen <jordan.l.justen@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Fei Yang <fei.yang@intel.com>,
 Carl Zhang <carl.zhang@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Fei,

On Tue, Jun 06, 2023 at 12:00:42PM +0200, Andi Shyti wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> To comply with the design that buffer objects shall have immutable
> cache setting through out their life cycle, {set, get}_caching ioctl's
> are no longer supported from MTL onward. With that change caching
> policy can only be set at object creation time. The current code
> applies a default (platform dependent) cache setting for all objects.
> However this is not optimal for performance tuning. The patch extends
> the existing gem_create uAPI to let user set PAT index for the object
> at creation time.
> The new extension is platform independent, so UMD's can switch to using
> this extension for older platforms as well, while {set, get}_caching are
> still supported on these legacy paltforms for compatibility reason.
> However, since PAT index was not clearly defined for platforms prior to
> GEN12 (TGL), so we are limiting this externsion to GEN12+ platforms
> only. See ext_set_pat() in for the implementation details.
> 
> Note: The documentation related to the PAT/MOCS tables is currently
> available for Tiger Lake here:
> https://www.intel.com/content/www/us/en/docs/graphics-for-linux/developer-reference/1-0/tiger-lake.html
> 
> BSpec: 45101
> 
> Mesa support has been submitted in this merge request:
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/22878
> 
> The media driver is supported by the following commits:
> https://github.com/intel/media-driver/commit/92c00a857433ebb34ec575e9834f473c6fcb6341
> https://github.com/intel/media-driver/commit/fd375cf2c5e1f6bf6b43258ff797b3134aadc9fd
> https://github.com/intel/media-driver/commit/08dd244b22484770a33464c2c8ae85430e548000
> 
> The IGT test related to this change is
> igt@gem_create@create-ext-set-pat
> 
> Signed-off-by: Fei Yang <fei.yang@intel.com>
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> Acked-by: Jordan Justen <jordan.l.justen@intel.com>
> Tested-by: Jordan Justen <jordan.l.justen@intel.com>
> Acked-by: Carl Zhang <carl.zhang@intel.com>
> Tested-by: Lihao Gu <lihao.gu@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>

pushed to drm-intel-gt-next with:

 - Tvrtko's ack
 - Slawek's ack
 - the pull request link from media guys

Thank you!
Andi
