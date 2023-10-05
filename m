Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4727BA0B9
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 16:41:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A2910E41A;
	Thu,  5 Oct 2023 14:41:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81C9210E414;
 Thu,  5 Oct 2023 14:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696516896; x=1728052896;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=cwMMzUWf9bNC4gOrY9JBethMndsYDf5WuH5DgSe2mv4=;
 b=S4TEihb8s/YLThlFIiSxhjloGuGiJ52eE7iTV7F+QUmTenJR+ph7bFqI
 p4AErwsKDtfr2zxxUc7Ja9yPhXRsqRthOii2QdkuMDa1cxlPWh9Udu1AX
 x0AQszAuehPdsDkCMRE5AC0OR4qFXodSvTWXVLwV4uonjBFdfN8A7H7zf
 nZeRWGG6miv5KrCGie0lUF9af0+0OcT8ex/qlchEsnkLlp74VdI/yi3Rs
 qFvITIBmRvNY533Q5C9X2g8WoOSDTP8EUZoUTKRwEFY47sfxzsmh6HhR8
 sYxLvGK/CA4565KPd7erskxMc1veRBCQjj7sWVvwZGow9zXifSe8HgT+8 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="363797255"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="363797255"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 07:41:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="745471600"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="745471600"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.162])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 07:41:32 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dave Airlie <airlied@redhat.com>
Subject: Re: linux-next: manual merge of the drm-intel tree with the drm tree
In-Reply-To: <20231003110957.34fc9483@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231003110957.34fc9483@canb.auug.org.au>
Date: Thu, 05 Oct 2023 17:41:28 +0300
Message-ID: <87zg0xb087.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Matt Roper <matthew.d.roper@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 03 Oct 2023, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> Today's linux-next merge of the drm-intel tree got a conflict in:
>
>   drivers/gpu/drm/i915/i915_drv.h
>
> between commits:
>
>   c9517783060a ("drm/i915/dg2: Drop Wa_16011777198")
>   5a213086a025 ("drm/i915: Eliminate IS_MTL_GRAPHICS_STEP")
>   81af8abe6513 ("drm/i915: Eliminate IS_MTL_MEDIA_STEP")
>
> from the drm tree and commits:
>
>   e50086f3d313 ("drm/i915/dg2: Drop pre-production display workarounds")
>   213454b3af2e ("drm/i915: Eliminate IS_MTL_DISPLAY_STEP")
>
> from the drm-intel tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Should be fixed now.

BR,
Jani.


-- 
Jani Nikula, Intel
