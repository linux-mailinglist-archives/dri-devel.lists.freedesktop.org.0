Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A10744EC52B
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 15:05:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4955810E330;
	Wed, 30 Mar 2022 13:05:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3843C10E2BE;
 Wed, 30 Mar 2022 13:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648645519; x=1680181519;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=RwztRpReOG2+Vz2GBTz2y2/hCNNeX1ZdXOYiN/5abzE=;
 b=VthIKgdsi3hVR9nzQcEA4Sq3SBFxG5Pru+WWbZLxwMMMwFLRUnWtIc1G
 /r6JoG1auQtPq5vHDmhSwo51oWgEawMl1BN5sFTyWKtJ4jXp4KDdtu3IV
 fgbu2z6zVxzhpfGa4G6jAkwnZAY87w/MnhXqByYiF8YOrq4yMfTYtXFde
 rcxLhwyRinp4T+3sEkD37rtT/oUo7FSfMu4w/3Tv5SGN7vINmM3eyfy/g
 quqo77K4HBktmmsT1298YAzIzi/SaF0MX62xp3oOwsaxfJa6xERvanUmi
 f5ZdbSU6Pzm7FZ4fiDn/VAi16+qEAA0yZaNEDrmaHcuit+OOlejIhyZRU w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="239466959"
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; d="scan'208";a="239466959"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 06:05:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; d="scan'208";a="639723725"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.61])
 by FMSMGA003.fm.intel.com with SMTP; 30 Mar 2022 06:05:14 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 30 Mar 2022 16:05:14 +0300
Date: Wed, 30 Mar 2022 16:05:14 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 01/12] drm/edid: use struct edid * in drm_do_get_edid()
Message-ID: <YkRViiFfSOJQnsoI@intel.com>
References: <cover.1648578814.git.jani.nikula@intel.com>
 <380b903fb91b1e20a1a7af61db40b6c7c5617005.1648578814.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <380b903fb91b1e20a1a7af61db40b6c7c5617005.1648578814.git.jani.nikula@intel.com>
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

On Tue, Mar 29, 2022 at 09:42:08PM +0300, Jani Nikula wrote:
> Mixing u8 * and struct edid * is confusing, switch to the latter.
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 31 +++++++++++++++----------------
>  1 file changed, 15 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index d79b06f7f34c..0650b9217aa2 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -1991,29 +1991,28 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
>  	void *data)
>  {
>  	int i, j = 0, valid_extensions = 0;
> -	u8 *edid, *new;
> -	struct edid *override;
> +	struct edid *edid, *new, *override;
>  
>  	override = drm_get_override_edid(connector);
>  	if (override)
>  		return override;
>  
> -	edid = (u8 *)drm_do_get_edid_base_block(connector, get_edid_block, data);
> +	edid = drm_do_get_edid_base_block(connector, get_edid_block, data);
>  	if (!edid)
>  		return NULL;
>  
>  	/* if there's no extensions or no connector, we're done */
> -	valid_extensions = edid[0x7e];
> +	valid_extensions = edid->extensions;
>  	if (valid_extensions == 0)
> -		return (struct edid *)edid;
> +		return edid;
>  
>  	new = krealloc(edid, (valid_extensions + 1) * EDID_LENGTH, GFP_KERNEL);
>  	if (!new)
>  		goto out;
>  	edid = new;
>  
> -	for (j = 1; j <= edid[0x7e]; j++) {
> -		u8 *block = edid + j * EDID_LENGTH;
> +	for (j = 1; j <= edid->extensions; j++) {
> +		void *block = edid + j;
>  
>  		for (i = 0; i < 4; i++) {
>  			if (get_edid_block(data, block, j, EDID_LENGTH))
> @@ -2026,13 +2025,13 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
>  			valid_extensions--;
>  	}
>  
> -	if (valid_extensions != edid[0x7e]) {
> -		u8 *base;
> +	if (valid_extensions != edid->extensions) {
> +		struct edid *base;

This one points to extension blocks too so using 
struct edid doesn't seem entirely appropriate.

>  
> -		connector_bad_edid(connector, edid, edid[0x7e] + 1);
> +		connector_bad_edid(connector, (u8 *)edid, edid->extensions + 1);
>  
> -		edid[EDID_LENGTH-1] += edid[0x7e] - valid_extensions;
> -		edid[0x7e] = valid_extensions;
> +		edid->checksum += edid->extensions - valid_extensions;
> +		edid->extensions = valid_extensions;
>  
>  		new = kmalloc_array(valid_extensions + 1, EDID_LENGTH,
>  				    GFP_KERNEL);
> @@ -2040,21 +2039,21 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
>  			goto out;
>  
>  		base = new;
> -		for (i = 0; i <= edid[0x7e]; i++) {
> -			u8 *block = edid + i * EDID_LENGTH;
> +		for (i = 0; i <= edid->extensions; i++) {
> +			void *block = edid + i;

Hmm. This code seems very broken to me. We read each block
into its expected offset based on the original base block extension
count, but here we only iterate up to the new ext block count. So
if we had eg. a 4 block EDID where block 2 is busted, we set 
the new ext count to 2, copy over blocks 0 and 1, skip block 2,
and then terminate the loop. So instead of copying block 3 from
the orignal EDID into block 2 of the new EDID, we leave the
original garbage block 2 in place.

Also this memcpy() business seems entirely poinless in the sense
that we could just read each ext block into the final offset
directly AFAICS.

>  
>  			if (!drm_edid_block_valid(block, i, false, NULL))
>  				continue;
>  
>  			memcpy(base, block, EDID_LENGTH);
> -			base += EDID_LENGTH;
> +			base++;
>  		}
>  
>  		kfree(edid);
>  		edid = new;
>  	}
>  
> -	return (struct edid *)edid;
> +	return edid;
>  
>  out:
>  	kfree(edid);
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
