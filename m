Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBFF4EDF5F
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 19:07:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1375210F433;
	Thu, 31 Mar 2022 17:07:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F6E610F42D;
 Thu, 31 Mar 2022 17:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648746452; x=1680282452;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=VnajxgruJJNT5XcFrM9Uh2LW5SyRCbn3uR1hEGDGdQ0=;
 b=YChhlnO3XT69w9PNOqym6G96g7XXwmz1Px8wusZIWbxySL4KscWnTsjk
 OxdFWeLNUhDSmryzMtMFExSsT9G/i7IcqBs8Yv+zleUH98gxgkw/A5QKZ
 vCNnvpXllB20psKZZ2MnkuheCncuPe5JOLC887B8JFyHzKKRJ3ReVb3XU
 06jbXuQRFWCH+Rkql6K7xNeXY/Kjn9zNjxB7XV+A/rGdpcUXLhxTuaatA
 qqWeHH1Yiol8db+aW6iCB36e4UEC4lYNxvboLEx6tYy/z/6rkCkFWwnuo
 mz6vGEUXO7/GVyV2GYLLrm9rSvDHc+sbcPPKnwyUlFEi9Fcczoy5FOCO5 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="240490677"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="240490677"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 10:07:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="547420058"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.61])
 by orsmga007.jf.intel.com with SMTP; 31 Mar 2022 10:07:29 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 31 Mar 2022 20:07:28 +0300
Date: Thu, 31 Mar 2022 20:07:28 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 00/12] drm/edid: cleanup and refactoring around validity
 checks
Message-ID: <YkXf0PMEqlKsOyif@intel.com>
References: <cover.1648578814.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1648578814.git.jani.nikula@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Emil Velikov <emil.l.velikov@gmail.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 29, 2022 at 09:42:07PM +0300, Jani Nikula wrote:
> Another day, another batch of EDID code refactoring.
> 
> Mostly the goal was to simplify drm_do_get_edid(), but trying to extract
> a const function for checking a single block validity lead me down a
> rabbit hole...
> 
> BR,
> Jani.
> 
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Emil Velikov <emil.l.velikov@gmail.com>
> 
> Jani Nikula (12):
>   drm/edid: use struct edid * in drm_do_get_edid()
>   drm/edid: clean up EDID block checksum functions
>   drm/edid: add edid_block_tag() helper to get the EDID extension tag
>   drm/edid: make drm_edid_header_is_valid() accept void pointer
>   drm/edid: clean up edid_is_zero()
>   drm/edid: split out edid_header_fix()
>   drm/edid: split drm_edid_block_valid() to check and act parts
>   drm/edid: use a better variable name for EDID block read retries
>   drm/edid: simplify block check when filtering invalid blocks
>   drm/edid: split out invalid block filtering to a separate function
>   drm/edid: track invalid blocks in drm_do_get_edid()
>   drm/edid: reduce magic when updating the EDID block checksum

With the few bugs I spotted fixed the series is
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> 
>  drivers/gpu/drm/drm_edid.c | 293 +++++++++++++++++++++----------------
>  include/drm/drm_edid.h     |   2 +-
>  2 files changed, 171 insertions(+), 124 deletions(-)
> 
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
