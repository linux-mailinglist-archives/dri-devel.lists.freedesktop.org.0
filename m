Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 196484F7F64
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 14:44:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7517C10EA1D;
	Thu,  7 Apr 2022 12:44:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C20F10E143;
 Thu,  7 Apr 2022 12:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649335476; x=1680871476;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=N46ExJswRpvvd5NOFLfzp8dYRuQKIC8K28XUEea7Up8=;
 b=guTx69k5rYKEiLsKZmid4BPwR/9JNBhq6vSJtXl1lBldG8SQYax1Toxu
 zHng/xrAQfO8wN7krDY2EOn4U+HCZBdBSo19yFzWKbmb+lBdsN5XlzB/n
 LN7kolOcjLcDRNN8PoE7uuDW388WgDzWC2b/Xkffb7Pf2tgts2dz2JIdK
 nW+ZoyfAjEMtPMXp8bkrRFw5ybe1O2bllzr9mTVRlNcUqPlccu4kXpuHq
 nW395pWnzwHVTr/WwCdXDbVO8+vEbCwTNd385KIvbybsUob1OxFORthtI
 THTXllo1yCWBUAjg+zfn5nuZO2bxph+EKVxDWF/mvVhk2TiIxcHfH4D30 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10309"; a="261489886"
X-IronPort-AV: E=Sophos;i="5.90,242,1643702400"; d="scan'208";a="261489886"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 05:44:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,242,1643702400"; d="scan'208";a="588790631"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.51])
 by orsmga001.jf.intel.com with SMTP; 07 Apr 2022 05:44:33 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 07 Apr 2022 15:44:32 +0300
Date: Thu, 7 Apr 2022 15:44:32 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 00/12] drm/edid: low level EDID block read refactoring etc.
Message-ID: <Yk7csG+mdZ9LwA4+@intel.com>
References: <cover.1649322799.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1649322799.git.jani.nikula@intel.com>
X-Patchwork-Hint: comment
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 07, 2022 at 12:14:26PM +0300, Jani Nikula wrote:
> Ever so slowly moving towards cleaner EDID reading.
> 
> Jani Nikula (12):
>   drm/edid: convert edid_is_zero() to edid_block_is_zero() for blocks
>   drm/edid: have edid_block_check() detect blocks that are all zero
>   drm/edid: refactor EDID block status printing
>   drm/edid: add a helper to log dump an EDID block
>   drm/edid: pass struct edid to connector_bad_edid()
>   drm/edid: add typedef for block read function
>   drm/edid: abstract an EDID block read helper
>   drm/edid: use EDID block read helper in drm_do_get_edid()
>   drm/edid: convert extension block read to EDID block read helper
>   drm/edid: drop extra local var
>   drm/edid: add single point of return to drm_do_get_edid()
>   drm/edid: add EDID block count and size helpers

Some of the stuff was a bit hard to follow, but I suppose that's mostly
an indication of the messy state of the current code. Didn't spot
anything obviously wrong at least.

Series is
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> 
>  drivers/gpu/drm/drm_edid.c | 350 ++++++++++++++++++++++++-------------
>  1 file changed, 225 insertions(+), 125 deletions(-)
> 
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
