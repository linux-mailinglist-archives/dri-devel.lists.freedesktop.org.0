Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AB84EDC3C
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 16:59:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8619510F1EF;
	Thu, 31 Mar 2022 14:59:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A3E810F1EF;
 Thu, 31 Mar 2022 14:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648738791; x=1680274791;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=d012AU019HL64eGAi1+VsQPxYRiIhAjCpnZvaLC5gvs=;
 b=Z5keR11gkwSvtlmEKOMqpQ0LWPgWr/4+04wLv+pZwXlCWGby/hvDNX5Z
 jVU40VHFZr+q39JTItDUTkkkusNn3oPnGwbucRlmkTLqE6g7K7UzjwHJ3
 cry+27Li7M8RepRgstcQJl+I7LxTtLzqTq9LlGwuZlgBi0/rwFwae8HbU
 lVmjtsTnKJ+DJ6d8hj2tk49WcKSHzzAl14aAcLZ0ja8KhpJivPwGR7PVx
 6wTvJkkC5w1Pmx5kJi73DbrIH5K91z2cRNNEIde9VAIg6rPOGisJC7gHx
 bpEh+KooPfnCFBy+Pv1L1WFA7I3mOo6XjA1AnI1B21HaTqBdklz8HqrAo g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="240449821"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="240449821"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 07:59:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="606135726"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.61])
 by fmsmga008.fm.intel.com with SMTP; 31 Mar 2022 07:59:48 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 31 Mar 2022 17:59:48 +0300
Date: Thu, 31 Mar 2022 17:59:48 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 12/12] drm/edid: reduce magic when updating the EDID
 block checksum
Message-ID: <YkXB5ASH8F7KLANc@intel.com>
References: <cover.1648578814.git.jani.nikula@intel.com>
 <0ec68aa82b4be2d46e442e74e341419d10c4c41b.1648578814.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0ec68aa82b4be2d46e442e74e341419d10c4c41b.1648578814.git.jani.nikula@intel.com>
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

On Tue, Mar 29, 2022 at 09:42:19PM +0300, Jani Nikula wrote:
> The code modifying the EDID block should not need to do tricks to fix
> the checksum. We have a function for computing the checksum, use it.
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index d0a76781ed19..d2dfab28b5b7 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -1840,8 +1840,8 @@ static struct edid *edid_filter_invalid_blocks(const struct edid *edid,
>  			memcpy(base++, block, EDID_LENGTH);
>  	}
>  
> -	new->checksum += new->extensions - valid_extensions;
>  	new->extensions = valid_extensions;
> +	new->checksum = edid_block_compute_checksum(new);

Seems to happen after we've validated the base block so this won't
accidentally fix up an already bad checksum.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

>
>  out:
>  	kfree(edid);
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
