Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0844779E7ED
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 14:29:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC7910E4AE;
	Wed, 13 Sep 2023 12:29:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D80B10E00F;
 Wed, 13 Sep 2023 12:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694608162; x=1726144162;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=7A4kyUCSjNWFECtS+BLiDlWZ6CnSqgRpWVxVF8IpY+U=;
 b=cjvuWZIstNQGnlkYI1Aa1Ut9GPTIeDhVRsoHkWYXTu8tL2kTV1mmAPNg
 5mx9c0kX3pLL+3gCx9Sijl8Lc5LAH9M1jzrI194eVS/0jyCzL6m74MJkL
 BneBxHjKjb82xFr8eBDslwLIEZ7Vxk3nVshlVdhxl/4nmac0LMwJjaOtf
 PnC++LGfP+gT7KwhMN7+WPg+cm8tZ/4kumbfjY4qNJHjL1QOOzZ3e7lml
 6yfRybDRQEaDNZx5lDEUXIlIVlw7SYvUaYVYQ+8QhEkj4IFnJ7GUtaupo
 psgJcqovU8Y5DTJ6QNztiOAgHsneCd3tSNvnt9YBUdegi9L+R7RRv/zWP Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="358915236"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; d="scan'208";a="358915236"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 05:29:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="867773552"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; d="scan'208";a="867773552"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.153])
 by orsmga004.jf.intel.com with SMTP; 13 Sep 2023 05:29:00 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 13 Sep 2023 15:28:59 +0300
Date: Wed, 13 Sep 2023 15:28:59 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 00/12] drm/i915: Populate connector->ddc always
Message-ID: <ZQGrCwXTE2Kg0amU@intel.com>
References: <20230829113920.13713-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230829113920.13713-1-ville.syrjala@linux.intel.com>
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

On Tue, Aug 29, 2023 at 02:39:08PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Populate connector->ddc for all output types that don't already
> do so, and clean up a bunch of code as a result of having the
> ddc i2c adapter in easy reach. And this also provides the sysfs
> "ddc" symlink.
> 
> There are potentially a few oddball (mostly DVI-I) cases where
> the connector detection/EDID read uses an alternate DDC bus
> internally, and so for those the symlink might not point at the
> correct i2c adapter. I'm not interested in spending extra brain
> cells on those, so we'll leave them as is for now.
> 
> Ville Syrjälä (12):
>   drm: Reorder drm_sysfs_connector_remove() vs.
>     drm_debugfs_connector_remove()
>   drm/sysfs: Register "ddc" symlink later

Maarten/Maxime/Thomas can I get an ack for merging these two
via drm-intel-next? Would avoid having to wait for a backmerge...

>   drm/i915: Call the DDC bus i2c adapter "ddc"
>   drm/i915/lvds: Populate connector->ddc
>   drm/i915/crt: Populate connector->ddc
>   drm/i915/dvo: Populate connector->ddc
>   drm/i915/dp: Populate connector->ddc
>   drm/i915/mst: Populate connector->ddc
>   drm/i915/hdmi: Use connector->ddc everwhere
>   drm/i915/hdmi: Nuke hdmi->ddc_bus
>   drm/i915/hdmi: Remove old i2c symlink
>   drm/i915/sdvo: Constify mapping structs
> 
>  drivers/gpu/drm/drm_connector.c               | 11 ++-
>  drivers/gpu/drm/drm_internal.h                |  2 +
>  drivers/gpu/drm/drm_sysfs.c                   | 22 +++--
>  .../gpu/drm/i915/display/intel_connector.c    |  6 +-
>  .../gpu/drm/i915/display/intel_connector.h    |  2 +-
>  drivers/gpu/drm/i915/display/intel_crt.c      | 38 +++----
>  drivers/gpu/drm/i915/display/intel_ddi.c      |  5 +-
>  .../drm/i915/display/intel_display_types.h    |  1 -
>  drivers/gpu/drm/i915/display/intel_dp.c       |  9 +-
>  drivers/gpu/drm/i915/display/intel_dp_mst.c   |  6 +-
>  drivers/gpu/drm/i915/display/intel_dvo.c      | 11 +--
>  drivers/gpu/drm/i915/display/intel_hdmi.c     | 98 ++++++-------------
>  drivers/gpu/drm/i915/display/intel_lspcon.c   | 14 +--
>  drivers/gpu/drm/i915/display/intel_lvds.c     | 23 +++--
>  drivers/gpu/drm/i915/display/intel_sdvo.c     |  6 +-
>  15 files changed, 119 insertions(+), 135 deletions(-)
> 
> -- 
> 2.41.0

-- 
Ville Syrjälä
Intel
