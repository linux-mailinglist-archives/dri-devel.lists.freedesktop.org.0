Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22939546CCC
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 20:57:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 094D610E41A;
	Fri, 10 Jun 2022 18:57:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11C5710E41A;
 Fri, 10 Jun 2022 18:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654887422; x=1686423422;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=gCLNmlKmgz57Itq34+/6mvtMazegs+TY66MFEGdL0qY=;
 b=Mf42xuwbecsT83fvi2gSCBtQR5NXgh7T78gLFPwFZQgQI6ZqTMZLjK4V
 NQqU7a+iQdO09SPAQH5QuUFsJFkxxdKqGTzjdZ5s9cBbRMTfiLcJrE1qI
 wDlfHlZQryifICZ0eTY8w9jXiQKYA+ZmFWhbM/uv+/n9tfwtc/L3NjVic
 6xscAYE6nJ5r4430kcBPkEzZ7isIFzl9B54qEe5cohV4Uh41irOGO3GNl
 TTB/DTMhlHaFch0Vm+IqwEI2YQfbk3Bpo3ej/5WqD/D52Pnnzce6eklsF
 pmP3pabqvB/yosgViXbkQw+/JcTR/zXjz92/GdhKqgN0+n+HGlFBAJojn g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10374"; a="277752105"
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; d="scan'208";a="277752105"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 11:57:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; d="scan'208";a="684703049"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.163])
 by fmsmga002.fm.intel.com with SMTP; 10 Jun 2022 11:56:59 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 10 Jun 2022 21:56:58 +0300
Date: Fri, 10 Jun 2022 21:56:58 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2 01/15] drm/edid: fix CTA data block collection size
 for CTA version 3
Message-ID: <YqOT+qvLv0TqtPOL@intel.com>
References: <cover.1654674560.git.jani.nikula@intel.com>
 <2a4c94417f024cbafc5d4ca0a74e4617fc4325d1.1654674560.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2a4c94417f024cbafc5d4ca0a74e4617fc4325d1.1654674560.git.jani.nikula@intel.com>
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

On Wed, Jun 08, 2022 at 10:50:31AM +0300, Jani Nikula wrote:
> The CTA Data Block Collection is valid only for CTA extension version
> 3. In versions 1 and 2, it is a reserved block, which we ignore.
> 
> The DTD start offset (byte 2, or d in CTA-861 spec), which determines
> the CTA Data Block Collection size, is specified slightly differently
> for different versions:
> 
> Version 1:
>     d = offset for the byte following the reserved data block. If no
>     data is provided in the reserved data block, then d=4. If no DTDs
>     are provided, then d=0
> 
> Version 2:
>     d = offset for the byte following the reserved data block. If no
>     data is provided in the reserved data block, then d=4. If d=0, then
>     no detailed timing descriptors are provided, and no data is provided
>     in the reserved data block.
> 
> Version 3:
>     d = offset for the byte following the data block collection. If no
>     data is provided in the data block collection, then d=4. If d=0,
>     then no detailed timing descriptors are provided, and no data is
>     provided in the data block collection.
> 
> Ever since commit 9e50b9d55e9c ("drm: edid: Add some bounds checking"),
> we've interpreted 0 to mean there are no DTDs but it's all Data
> Blocks. Per the spec, Data Blocks are only valid for version 3, where we
> should interpret 0 to mean there are no data blocks.
> 
> Follow the spec (and hope the EDIDs follow it too).
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 929fc0e46751..c57f6333ea7d 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -4498,8 +4498,6 @@ static const void *__cea_db_iter_edid_next(struct cea_db_iter *iter)
>  
>  		iter->index = 4;
>  		iter->end = ext[2];
> -		if (iter->end == 0)
> -			iter->end = 127;

Not really sure how I came up with this interpretation of the spec.

Looks like I at least fixed up the 18byte descriptor parsing
correctly in commit 7304b9810a73 ("drm/edid: Check the number
of detailed timing descriptors in the CEA ext block")

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

>  		if (iter->end < 4 || iter->end > 127)
>  			continue;
>  
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
