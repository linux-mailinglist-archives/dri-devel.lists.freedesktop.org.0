Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E46D4E5652
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 17:27:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C947610E6E0;
	Wed, 23 Mar 2022 16:27:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 601C310E290;
 Wed, 23 Mar 2022 16:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648052858; x=1679588858;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=MYuECh6fuUVEGKelEUsTRQJZ1caHRKaD8i26G/qP4og=;
 b=HGN8sPRuKkZ318hS5eZ5GFNNQeRwvOhk4O+qVebysqztjB19bOM/zZEp
 nNvx5aXbOYOQ824PyUhKMnhv9pQl1gos8DeXpZesLhs9JcLPh8BaUnXjt
 m6uN8oNswOnx4ZiWtHws8GVqC7N3pBhxKdr/9kJ3h5J+/kHADfY/32je3
 RAteZge53ZnkbFtjIQYnkNx+LoZGJAYoHU8QTvM4wKheh+JuAbeIKkCOZ
 syfSlkZ8m3TQFsd5slxhWhAaqm4Gkmf1i0qLFHUlsMhnwjcNwtxaU3vo/
 kFzkO7fnJudia5T+0NQBAwx2Oi0A/RUe29yFutRVD8T45M4D2Un7lICdk w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="283006025"
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; d="scan'208";a="283006025"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 09:18:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; d="scan'208";a="519420543"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.61])
 by orsmga006.jf.intel.com with SMTP; 23 Mar 2022 09:18:41 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 23 Mar 2022 18:18:40 +0200
Date: Wed, 23 Mar 2022 18:18:40 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [Intel-gfx] [RFC 09/19] drm/edid: convert drm_edid_to_sad() to
 use cea db iter
Message-ID: <YjtIYButRBTVm5rx@intel.com>
References: <cover.1647985054.git.jani.nikula@intel.com>
 <fb35ac3c561f6ff98374ebeb2fb3a4fb8a22974e.1647985054.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fb35ac3c561f6ff98374ebeb2fb3a4fb8a22974e.1647985054.git.jani.nikula@intel.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 22, 2022 at 11:40:38PM +0200, Jani Nikula wrote:
> Use the cea db iterator for short audio descriptors. We'll still stop at
> the first audio data block, but not at the first CEA extension if that
> doesn't have the info.

This stuff should probably be converted over to the drm_edid_to_eld()
approach which looks up all the SADs from the whole EDID. But that's
something for amdgpu/radeon folks to think about since they're the only
user.

> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 34 +++++++++-------------------------
>  1 file changed, 9 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 992b3578a73f..e341790521d6 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -4854,40 +4854,21 @@ static void drm_edid_to_eld(struct drm_connector *connector, struct edid *edid)
>   */
>  int drm_edid_to_sad(struct edid *edid, struct cea_sad **sads)
>  {
> +	const struct cea_db *db;
> +	struct cea_db_iter iter;
>  	int count = 0;
> -	int i, start, end, dbl;
> -	const u8 *cea;
> -
> -	cea = drm_find_cea_extension(edid);
> -	if (!cea) {
> -		DRM_DEBUG_KMS("SAD: no CEA Extension found\n");
> -		return 0;
> -	}
> -
> -	if (cea_revision(cea) < 3) {
> -		DRM_DEBUG_KMS("SAD: wrong CEA revision\n");
> -		return 0;
> -	}
> -
> -	if (cea_db_offsets(cea, &start, &end)) {
> -		DRM_DEBUG_KMS("SAD: invalid data block offsets\n");
> -		return -EPROTO;
> -	}
> -
> -	for_each_cea_db(cea, i, start, end) {
> -		const u8 *db = &cea[i];
>  
> +	cea_db_iter_edid_begin(edid, &iter);
> +	cea_db_iter_for_each(db, &iter) {
>  		if (cea_db_tag(db) == CEA_DB_AUDIO) {
>  			int j;
>  
> -			dbl = cea_db_payload_len(db);
> -
> -			count = dbl / 3; /* SAD is 3B */
> +			count = cea_db_payload_len(db) / 3; /* SAD is 3B */
>  			*sads = kcalloc(count, sizeof(**sads), GFP_KERNEL);
>  			if (!*sads)
>  				return -ENOMEM;
>  			for (j = 0; j < count; j++) {
> -				const u8 *sad = &db[1 + j * 3];
> +				const u8 *sad = &db->data[j * 3];
>  
>  				(*sads)[j].format = (sad[0] & 0x78) >> 3;
>  				(*sads)[j].channels = sad[0] & 0x7;
> @@ -4897,6 +4878,9 @@ int drm_edid_to_sad(struct edid *edid, struct cea_sad **sads)
>  			break;
>  		}
>  	}
> +	cea_db_iter_end(&iter);
> +
> +	DRM_DEBUG_KMS("Found %d Short Audio Descriptors\n", count);
>  
>  	return count;
>  }
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
