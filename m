Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A9A422CE8
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 17:47:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 015EA6E427;
	Tue,  5 Oct 2021 15:47:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 461956E427
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 15:47:02 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10128"; a="206589268"
X-IronPort-AV: E=Sophos;i="5.85,349,1624345200"; d="scan'208";a="206589268"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2021 08:46:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,349,1624345200"; d="scan'208";a="559365575"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by FMSMGA003.fm.intel.com with SMTP; 05 Oct 2021 08:46:40 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 05 Oct 2021 18:46:39 +0300
Date: Tue, 5 Oct 2021 18:46:39 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, Rodrigo.Siqueira@amd.com,
 Harry.Wentland@amd.com, khsieh@codeaurora.org, Jerry.Zuo@amd.com,
 alexander.deucher@amd.com, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/edid: In connector_bad_edid() cap num_of_ext by
 num_blocks read
Message-ID: <YVxzX9h+jBqOj1/V@intel.com>
References: <20211005081022.1.Ib059f9c23c2611cb5a9d760e7d0a700c1295928d@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211005081022.1.Ib059f9c23c2611cb5a9d760e7d0a700c1295928d@changeid>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 05, 2021 at 08:10:28AM -0700, Douglas Anderson wrote:
> In commit e11f5bd8228f ("drm: Add support for DP 1.4 Compliance edid
> corruption test") the function connector_bad_edid() started assuming
> that the memory for the EDID passed to it was big enough to hold
> `edid[0x7e] + 1` blocks of data (1 extra for the base block). It
> completely ignored the fact that the function was passed `num_blocks`
> which indicated how much memory had been allocated for the EDID.
> 
> Let's fix this by adding a bounds check.
> 
> This is important for handling the case where there's an error in the
> first block of the EDID. In that case we will call
> connector_bad_edid() without having re-allocated memory based on
> `edid[0x7e]`.
> 
> Fixes: e11f5bd8228f ("drm: Add support for DP 1.4 Compliance edid corruption test")
> Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> This problem report came up in the context of a patch I sent out [1]
> and this is my attempt at a fix. The problem predates my patch,
> though. I don't personally know anything about DP compliance testing
> and what should be happening here, nor do I apparently have any
> hardware that actually reports a bad EDID. Thus this is just compile
> tested. I'm hoping that someone here can test this and make sure it
> seems OK to them.
> 
>  drivers/gpu/drm/drm_edid.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 9b19eee0e1b4..ccfa08631c57 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -1843,8 +1843,9 @@ static void connector_bad_edid(struct drm_connector *connector,
>  	u8 num_of_ext = edid[0x7e];
>  
>  	/* Calculate real checksum for the last edid extension block data */
> -	connector->real_edid_checksum =
> -		drm_edid_block_checksum(edid + num_of_ext * EDID_LENGTH);
> +	if (num_of_ext <= num_blocks - 1)

Something about that doesn't really agree with my brain.
It's correct but when I read it I can't immediately see it.

I guess what I'd like to see is something like:
last_block = edid[0x7e];
if (last_block < num_blocks)
	connector->real_edid_checksum =
		drm_edid_block_checksum(edid + last_block * EDID_LENGTH);

Techically exactly the same thing, but I don't have to read
the comparison twice to convince myself that it's correct.

Anyways, this is
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
either way.

> +		connector->real_edid_checksum =
> +			drm_edid_block_checksum(edid + num_of_ext * EDID_LENGTH);
>  
>  	if (connector->bad_edid_counter++ && !drm_debug_enabled(DRM_UT_KMS))
>  		return;
> -- 
> 2.33.0.800.g4c38ced690-goog

-- 
Ville Syrjälä
Intel
