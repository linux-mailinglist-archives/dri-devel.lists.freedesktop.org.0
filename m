Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 124EF7F15BB
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 15:31:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C86110E3EA;
	Mon, 20 Nov 2023 14:31:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9DCB10E3E5;
 Mon, 20 Nov 2023 14:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700490659; x=1732026659;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=p6lc/Yg+JpINLljoOwVBcamQg6BYTNdq8G7Ol7M4H3M=;
 b=Sk8MYQT/ZWLDwoftkpMMv9R8D/vJUR8CD/aGIRqCMNrpY3hOGIZaF5Tz
 Rq8eeNy4l0VOk80e728Btu4azMUdAoF6Mo6W3QjN38z/XUMk6pw44i38h
 OqvpkenbNtdbSG6qrWEpwlekKcyOjzC/i7wIrj3PiCxupIce5jNNGLD1g
 mgxzDvIeAgs9UwhVl2zA1UvbYjm0/gjt60neKpc9qq/CiCmNj++NwXZjQ
 d/YwSu6ac/ddQ+nv8aH9Gg8YquYaJtvpKx2es2G32NILR/dj/eumLUx1M
 TqCa8XthzyWm9EY30tx7J422YVUHQMiScAXoniZmyyu/sjJ36ilxjInq2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="422722763"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="422722763"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 06:30:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="759798576"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="759798576"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga007.jf.intel.com with SMTP; 20 Nov 2023 06:30:54 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 20 Nov 2023 16:30:53 +0200
Date: Mon, 20 Nov 2023 16:30:53 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 0/4] drm/i915: Fix LUT rounding
Message-ID: <ZVttnXE_P9xzXlZT@intel.com>
References: <20231013131402.24072-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231013131402.24072-1-ville.syrjala@linux.intel.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 13, 2023 at 04:13:58PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> The current LUT rounding is generating weird results. Adjust
> it to follow the OpenGL int<->float conversion rules.
> 
> Ville Syrjälä (4):
>   drm: Fix color LUT rounding
    ^
I'd like to merge this via drm-intel-next as needs to match
the rounding done in the readout path in i915.

Maarten,Maxime,Thomas can I get an ack for that?

>   drm/i915: Adjust LUT rounding rules
>   drm/i915: s/clamp()/min()/ in i965_lut_11p6_max_pack()
>   drm/i915: Fix glk+ degamma LUT conversions
> 
>  drivers/gpu/drm/i915/display/intel_color.c | 70 +++++++++++-----------
>  include/drm/drm_color_mgmt.h               | 18 +++---
>  2 files changed, 42 insertions(+), 46 deletions(-)
> 
> -- 
> 2.41.0

-- 
Ville Syrjälä
Intel
