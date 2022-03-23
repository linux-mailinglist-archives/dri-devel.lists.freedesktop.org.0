Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDD24E552A
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 16:25:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B33710E6FD;
	Wed, 23 Mar 2022 15:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94FCE10E6F5;
 Wed, 23 Mar 2022 15:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648049099; x=1679585099;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=TRb01S1s/f986ZpNokOsVT5j+DvzC9gNjD+IelhYAC0=;
 b=mYIbGItN2nwkrjWZYhQr/eDDSjWbKpmhxcIBWXxJ3PtUIGQvnEGACu7V
 GmubBAXDakFDmqb5zssfZqdess2kZZh8LtJgPEDF4a3SatPEsZp1dFyXv
 mvYRJzFVjH7oBwaeQ9v0k0VMALnQcxDcKvFgHqVNK9Bz6VSd59HjBklyZ
 Zx0dhBnhywMfsNaKnq5O4TKtXiNoxTqe7I1LCG3w9TnGA8dGGI3itaqjh
 wRtMMyK824Cb3Gja1T9K03yMm/vn6WxbEKHRlz+7SZ+0IOcFNbzsClsrr
 67uQtuBViM18qcZcIiZedPqd+PHY7DZO177fwXkbOYJ44yvwNIlO2Pagl A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="258324508"
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; d="scan'208";a="258324508"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 08:24:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; d="scan'208";a="544233409"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.61])
 by orsmga007.jf.intel.com with SMTP; 23 Mar 2022 08:24:56 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 23 Mar 2022 17:24:55 +0200
Date: Wed, 23 Mar 2022 17:24:55 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [RFC 02/19] drm: use drm_edid_extension_block_count() and
 drm_edid_size()
Message-ID: <Yjs7xws+Eg4danMQ@intel.com>
References: <cover.1647985054.git.jani.nikula@intel.com>
 <1a98752e8f23f4a981feb3471f46c3d2b4b2b93c.1647985054.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1a98752e8f23f4a981feb3471f46c3d2b4b2b93c.1647985054.git.jani.nikula@intel.com>
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

On Tue, Mar 22, 2022 at 11:40:31PM +0200, Jani Nikula wrote:
> Use the block count and size helpers in all drm core code.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_connector.c |  2 +-
>  drivers/gpu/drm/drm_debugfs.c   |  3 +--
>  drivers/gpu/drm/drm_edid.c      | 14 +++++++-------
>  3 files changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 76a8c707c34b..cfed43e61380 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -2138,7 +2138,7 @@ int drm_connector_update_edid_property(struct drm_connector *connector,
>  		return 0;
>  
>  	if (edid)
> -		size = EDID_LENGTH * (1 + edid->extensions);
> +		size = drm_edid_size(edid);
>  
>  	/* Set the display info, using edid if available, otherwise
>  	 * resetting the values to defaults. This duplicates the work
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index 7f1b82dbaebb..a832ef6b33fe 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -362,8 +362,7 @@ static ssize_t edid_write(struct file *file, const char __user *ubuf,
>  	if (len == 5 && !strncmp(buf, "reset", 5)) {
>  		connector->override_edid = false;
>  		ret = drm_connector_update_edid_property(connector, NULL);
> -	} else if (len < EDID_LENGTH ||
> -		   EDID_LENGTH * (1 + edid->extensions) > len)
> +	} else if (len < EDID_LENGTH || drm_edid_size(edid) > len)
>  		ret = -EINVAL;
>  	else {
>  		connector->override_edid = false;
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index f4b49693e666..b96906774433 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -1643,8 +1643,8 @@ bool drm_edid_are_equal(const struct edid *edid1, const struct edid *edid2)
>  		return false;
>  
>  	if (edid1) {
> -		edid1_len = EDID_LENGTH * (1 + edid1->extensions);
> -		edid2_len = EDID_LENGTH * (1 + edid2->extensions);
> +		edid1_len = drm_edid_size(edid1);
> +		edid2_len = drm_edid_size(edid2);
>  
>  		if (edid1_len != edid2_len)
>  			return false;
> @@ -1770,7 +1770,7 @@ bool drm_edid_is_valid(struct edid *edid)
>  	if (!edid)
>  		return false;
>  
> -	for (i = 0; i <= edid->extensions; i++)
> +	for (i = 0; i <= drm_edid_extension_block_count(edid); i++)
>  		if (!drm_edid_block_valid(raw + i * EDID_LENGTH, i, true, NULL))

Maybe we should also have drm_edid_block_count(), drm_edid_block_data(),
drm_edid_extension_block_data() etc.?

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

>  			return false;
>  
> @@ -2224,7 +2224,7 @@ EXPORT_SYMBOL(drm_edid_size);
>   */
>  struct edid *drm_edid_duplicate(const struct edid *edid)
>  {
> -	return kmemdup(edid, (edid->extensions + 1) * EDID_LENGTH, GFP_KERNEL);
> +	return kmemdup(edid, drm_edid_size(edid), GFP_KERNEL);
>  }
>  EXPORT_SYMBOL(drm_edid_duplicate);
>  
> @@ -3353,17 +3353,17 @@ const u8 *drm_find_edid_extension(const struct edid *edid,
>  	int i;
>  
>  	/* No EDID or EDID extensions */
> -	if (edid == NULL || edid->extensions == 0)
> +	if (edid == NULL || drm_edid_extension_block_count(edid) == 0)
>  		return NULL;
>  
>  	/* Find CEA extension */
> -	for (i = *ext_index; i < edid->extensions; i++) {
> +	for (i = *ext_index; i < drm_edid_extension_block_count(edid); i++) {
>  		edid_ext = (const u8 *)edid + EDID_LENGTH * (i + 1);
>  		if (edid_ext[0] == ext_id)
>  			break;
>  	}
>  
> -	if (i >= edid->extensions)
> +	if (i >= drm_edid_extension_block_count(edid))
>  		return NULL;
>  
>  	*ext_index = i + 1;
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
