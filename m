Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3624569E4A1
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 17:27:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0813010E887;
	Tue, 21 Feb 2023 16:27:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 493FA10E884;
 Tue, 21 Feb 2023 16:27:49 +0000 (UTC)
Received: from [192.168.2.6] (unknown [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id CE1D666021C8;
 Tue, 21 Feb 2023 16:27:47 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1676996868;
 bh=sOjJ9+kk8UGwAKdofcgRGiFBQMsAxmnOXdhUIDqan2g=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=iCEk31V3XCdo6/rAOf4mHGJH+dPkAlqjSxmB1Ed+Rb2PgSb+V1AgLhSP1YdiibVbj
 3iLVCpAcCx5ETpicjQt03t+ps+H8Qo/UiHY0ZEOZ0VlshunSeKxotdejlkdm48CCI/
 f/9z7BYB/VW6OBMNckJD8oXOVgNQPuv9SPzO2IDpo/ySjNWykXiaBNZy9r+akyTK+j
 ffDt4GEkQXu9u52CmUWphLnqjJfsD2xcsEuQa3eAXeYl7bTppxvZy7xDz4+PDdEeby
 OO6FUijWADuSA+pNzGsQo4alZqyzqSyK0dCHf1SVw9w83jJHUrqlztO+B4na1Lk+23
 baxAlEnphRQkg==
Message-ID: <1016bdca-573a-02b5-9ecf-4cbe973a99af@collabora.com>
Date: Tue, 21 Feb 2023 19:27:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 4/4] drm/edid: update non-desktop use also from DisplayID
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
References: <cover.1676580180.git.jani.nikula@intel.com>
 <de75b2edddd7d30216e4dd5699a064dc737688f5.1676580180.git.jani.nikula@intel.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <de75b2edddd7d30216e4dd5699a064dc737688f5.1676580180.git.jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: intel-gfx@lists.freedesktop.org, Iaroslav Boliukin <iam@lach.pw>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/16/23 23:45, Jani Nikula wrote:
> Use the DisplayID 2.0 primary use case information to deduce whether
> this is a head-mounted display, and should not be used for desktop.
> 
> Cc: Iaroslav Boliukin <iam@lach.pw>
> Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 3d0a4da661bc..03ad53a1ba82 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -6433,6 +6433,29 @@ static void drm_reset_display_info(struct drm_connector *connector)
>  	info->quirks = 0;
>  }
>  
> +static void update_displayid_info(struct drm_connector *connector,
> +				  const struct drm_edid *drm_edid)
> +{
> +	struct drm_display_info *info = &connector->display_info;
> +	const struct displayid_block *block;
> +	struct displayid_iter iter;
> +
> +	displayid_iter_edid_begin(drm_edid, &iter);
> +	displayid_iter_for_each(block, &iter) {
> +		if (displayid_version(&iter) == DISPLAY_ID_STRUCTURE_VER_20 &&
> +		    (displayid_primary_use(&iter) == PRIMARY_USE_HEAD_MOUNTED_VR ||
> +		     displayid_primary_use(&iter) == PRIMARY_USE_HEAD_MOUNTED_AR))
> +			info->non_desktop = true;
> +
> +		/*
> +		 * We're only interested in the base section here, no need to
> +		 * iterate further.
> +		 */
> +		break;
> +	}
> +	displayid_iter_end(&iter);
> +}
> +
>  static void update_display_info(struct drm_connector *connector,
>  				const struct drm_edid *drm_edid)
>  {
> @@ -6463,6 +6486,8 @@ static void update_display_info(struct drm_connector *connector,
>  	info->color_formats |= DRM_COLOR_FORMAT_RGB444;
>  	drm_parse_cea_ext(connector, drm_edid);
>  
> +	update_displayid_info(connector, drm_edid);
> +
>  	/*
>  	 * Digital sink with "DFP 1.x compliant TMDS" according to EDID 1.3?
>  	 *

Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com> # HTC VIVE Pro 2
Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry

