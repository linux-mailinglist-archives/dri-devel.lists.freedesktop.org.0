Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 605824E5696
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 17:36:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BC5910E56D;
	Wed, 23 Mar 2022 16:36:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AA3410E56D;
 Wed, 23 Mar 2022 16:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648053397; x=1679589397;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=bvxX4JxdigmZWKi5JpSC33lJ9t2EByxxhJpQAqlYc8A=;
 b=D/13IcoMrnk2no++HgfCfUbdq7UfS6UtbwBbVQjKikjf/SHCNNohVyLI
 lOGuiV7WfmoN2eCoZ1TUhdcSOumBLpezUY9YJPhAUoZ+ppm9sMvzkq+Z/
 0+pzO/YxVLEyimaH9KXwQLeWkbImI2JldUthy7489EHlWI1U6JeHuZ33D
 LK5SmM6yZaZA5zxkl+8gSNPX8NeGW2VZo1AqAsIh6ws1tYNESoI5n+9cq
 mI04E+jAK5mJvJwDviIfHoJfGg+OPBVIaaV4DXzW+OIFjOY2XjmaFE8/a
 bOiCM4s5APfsXlLLJpBbsROwkMEn/L3Y7Ogn9i8tQmM/QwjWY7JABEpNw w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="283010211"
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; d="scan'208";a="283010211"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 09:36:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; d="scan'208";a="583760981"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.61])
 by orsmga001.jf.intel.com with SMTP; 23 Mar 2022 09:36:34 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 23 Mar 2022 18:36:33 +0200
Date: Wed, 23 Mar 2022 18:36:33 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [RFC 19/19] drm/edid: sunset drm_find_cea_extension()
Message-ID: <YjtMkddPzskdi3oJ@intel.com>
References: <cover.1647985054.git.jani.nikula@intel.com>
 <091dcecb74a14b2cb618f2fc494fd0b52bf535b2.1647985054.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <091dcecb74a14b2cb618f2fc494fd0b52bf535b2.1647985054.git.jani.nikula@intel.com>
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

On Tue, Mar 22, 2022 at 11:40:48PM +0200, Jani Nikula wrote:
> Convert drm_find_cea_extension() to a predicate function to check if the
> EDID has a CEA extension or a DisplayID CTA data block. This is mainly
> to avoid adding new users that only find the first CEA extension.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index dfaa21f00941..84314b65b75b 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -3422,30 +3422,29 @@ const u8 *drm_find_edid_extension(const struct edid *edid,
>  	return edid_ext;
>  }
>  
> -static const u8 *drm_find_cea_extension(const struct edid *edid)
> +/* Return true if the EDID has a CEA extension or a DisplayID CTA data block */
> +static bool drm_edid_has_cea_extension(const struct edid *edid)
>  {
>  	const struct displayid_block *block;
>  	struct displayid_iter iter;
> -	const u8 *cea;
>  	int ext_index = 0;
> +	bool found = false;
>  
>  	/* Look for a top level CEA extension block */
> -	/* FIXME: make callers iterate through multiple CEA ext blocks? */
> -	cea = drm_find_edid_extension(edid, CEA_EXT, &ext_index);
> -	if (cea)
> -		return cea;
> +	if (drm_find_edid_extension(edid, CEA_EXT, &ext_index))
> +		return true;
>  
>  	/* CEA blocks can also be found embedded in a DisplayID block */
>  	displayid_iter_edid_begin(edid, &iter);
>  	displayid_iter_for_each(block, &iter) {
>  		if (block->tag == DATA_BLOCK_CTA) {
> -			cea = (const u8 *)block;
> +			found = true;
>  			break;
>  		}
>  	}
>  	displayid_iter_end(&iter);
>  
> -	return cea;
> +	return found;
>  }
>  
>  static __always_inline const struct drm_display_mode *cea_mode_for_vic(u8 vic)
> @@ -3715,7 +3714,7 @@ add_alternate_cea_modes(struct drm_connector *connector, struct edid *edid)
>  	int modes = 0;
>  
>  	/* Don't add CEA modes if the CEA extension block is missing */
> -	if (!drm_find_cea_extension(edid))
> +	if (!drm_edid_has_cea_extension(edid))

I'm thinking we could just do
if (modes)
	modes += add_alternate_cea_modes(...);
at the end of add_cea_modes().

Or perhaps
if (found)
	modes += add_alternate_cea_modes(...);
if we think that adding the alternate modes would be apporpriate
even when add_cea_modes() didn't add anything. Not sure.

Yes, that would still introduce a sligth change in behaviour
in case we have a CEA ext block/DisplayID CTA block without
any of the video/hdmi/y420vdb blocks, but that edge case
doesn't feel like a deal-breaker to me.

-- 
Ville Syrjälä
Intel
