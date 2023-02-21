Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5E869E4A3
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 17:28:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C8D10E87B;
	Tue, 21 Feb 2023 16:28:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E27510E87B;
 Tue, 21 Feb 2023 16:28:27 +0000 (UTC)
Received: from [192.168.2.6] (109-252-117-89.nat.spd-mgts.ru [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C6F6C66021C8;
 Tue, 21 Feb 2023 16:28:25 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1676996906;
 bh=cn2bkUsq8dT8462Iy/9YPWUd9S0sCHl47HCgtR/oLYk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=A0gX0/tT4u1ZVTISyD7Q/3PsKQHrHA0Kh27DmRWClDyVUjhF3oVqp9kCxlb2bHxbo
 bu7m9NJvKbW7DICZEdWA8nCTBj+6Bb3tVrXgy44in737vX142C8+ItiGWhwwnY+DC8
 Uwr7h2LcIaEUwbPCYscG7s3iup4FARvx3OgRgLt42rDmUUrfrcH4V+/iDuN0QjNv3a
 4YrC1Yh0mZr6X42XkcOE3RClxW863YGgkJ6JhwpgEqV9bdsvtLlGV1sd/J1ilT2srV
 7WXDuIdM51h1RYywHrsPlyvQ/jr+u0c5tgZmeaO7zi00sRqJeJ1FhViIOlNgWPZUSk
 KanSzXiZtPV2A==
Message-ID: <2027fbce-6ed4-3e85-0cc3-1317a945c862@collabora.com>
Date: Tue, 21 Feb 2023 19:28:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 5/4] drm/edid: parse Tiled Display Topology Data Block for
 DisplayID 2.0
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
References: <cover.1676580180.git.jani.nikula@intel.com>
 <20230217104627.1360015-1-jani.nikula@intel.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230217104627.1360015-1-jani.nikula@intel.com>
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

On 2/17/23 13:46, Jani Nikula wrote:
> Currently we only parse the Tiled Display Topology Data Block for
> DisplayID structure version 1.2, but not 2.0. The contents seem to be
> the same for both, so expand the parsing to structure version 2.0.
> 
> Note that DisplayID spec version is not the same as DisplayID structure
> version; DisplayID 1.3 uses structure version 1.2, and DisplayID 2.0-2.1
> use structure version 2.0. Lovely.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 03ad53a1ba82..ebab862b8b1a 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -7267,6 +7267,15 @@ static void drm_parse_tiled_block(struct drm_connector *connector,
>  	}
>  }
>  
> +static bool displayid_is_tiled_block(const struct displayid_iter *iter,
> +				     const struct displayid_block *block)
> +{
> +	return (displayid_version(iter) == DISPLAY_ID_STRUCTURE_VER_12 &&
> +		block->tag == DATA_BLOCK_TILED_DISPLAY) ||
> +		(displayid_version(iter) == DISPLAY_ID_STRUCTURE_VER_20 &&
> +		 block->tag == DATA_BLOCK_2_TILED_DISPLAY_TOPOLOGY);
> +}
> +
>  static void _drm_update_tile_info(struct drm_connector *connector,
>  				  const struct drm_edid *drm_edid)
>  {
> @@ -7277,7 +7286,7 @@ static void _drm_update_tile_info(struct drm_connector *connector,
>  
>  	displayid_iter_edid_begin(drm_edid, &iter);
>  	displayid_iter_for_each(block, &iter) {
> -		if (block->tag == DATA_BLOCK_TILED_DISPLAY)
> +		if (displayid_is_tiled_block(&iter, block))
>  			drm_parse_tiled_block(connector, block);
>  	}
>  	displayid_iter_end(&iter);

I don't have display setup to test this, but looks okay.

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry

