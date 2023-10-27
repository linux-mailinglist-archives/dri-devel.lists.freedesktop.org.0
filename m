Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D35A7D9436
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 11:51:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB8F510E968;
	Fri, 27 Oct 2023 09:51:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 052B810E009
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 09:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698400294; x=1729936294;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=8mZ3o7Q6lskEQ8SbqrpCuF4j40QsjWDA4t0KQr5qHW4=;
 b=TmF5uvIFQWJ8br0cZWhB320tD5whDoRtA4HiArWL8xeajgesWVEqoKeX
 a7NmmU/9LEzmT80tBR4o1v48vg/pgMMtptco6jN1E8n7GbkVUXsAgdqsp
 0RiJHHDYODL1GpFDAVFXsjl6WrO65x71kzpI9wIMClOYIqjPwQUpKHNmY
 axC/QhmC1GxOKr5GGGlLcnPbAFqHoCfWI2oXQFufeBimdbHkZhHjXtcOn
 lecxWPpy/nDyMRdxT5hXyRknufh4879YQEW/ov9xPF0AfOWYfq66dE2zz
 9S5tQk5kMUza0Vqv03i3Rq3o6zpA4kSTuKBNXTcikxtZsADSCNORxdxer Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="564753"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="564753"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 02:51:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="794533480"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; d="scan'208";a="794533480"
Received: from jhajducz-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.34.19])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 02:51:11 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm: bridge: adv7511: fix reading edid segments
In-Reply-To: <20231026113029.575846-1-emas@bang-olufsen.dk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231026113029.575846-1-emas@bang-olufsen.dk>
Date: Fri, 27 Oct 2023 12:51:07 +0300
Message-ID: <87y1fo5r78.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 26 Oct 2023, Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk> wrote:
> Currently reading EDID only works because usually only two EDID blocks
> of 128 bytes is used. Where an EDID segment holds 256 bytes or two EDID
> blocks. And the first EDID segment read works fine but E-EDID specifies
> up to 128 segments.
>
> The logic is broken so change EDID segment index to multiple of 256
> bytes and not 128 (block size).
>
> Also change check of DDC status. Instead of silently not reading EDID
> when in "IDLE" state [1]. Check if the DDC controller is in reset
> instead (no HPD).

"Also" in a commit message is often a good indication that the patch
should be split to do the "also" in a separate patch. One "thing" per
patch. Here, it'll be useful for debugging [1], too, to figure out which
part broken things. (I suspect it's the status handling.)


BR,
Jani.


[1] https://lore.kernel.org/r/5aa375f1-07cd-4e28-8cd5-7e10b4b05c6a@kontron.de


>
> [1]
> ADV7511 Programming Guide: Table 11: DDCController Status:
>
>   0xC8 [3:0]  DDC Controller State
>
>   0000        In Reset (No Hot Plug Detected)
>   0001        Reading EDID
>   0010        IDLE (Waiting for HDCP Requested)
>   0011        Initializing HDCP
>   0100        HDCP Enabled
>   0101        Initializing HDCP Repeater
>
> Signed-off-by: Emil Svendsen <emas@bang-olufsen.dk>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 24 ++++++++++++--------
>  1 file changed, 15 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index 8be235144f6d..c641c2ccd412 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -537,6 +537,8 @@ static int adv7511_get_edid_block(void *data, u8 *buf, unsigned int block,
>  				  size_t len)
>  {
>  	struct adv7511 *adv7511 = data;
> +	struct device* dev = &adv7511->i2c_edid->dev;
> +	int edid_segment = block / 2;
>  	struct i2c_msg xfer[2];
>  	uint8_t offset;
>  	unsigned int i;
> @@ -545,7 +547,7 @@ static int adv7511_get_edid_block(void *data, u8 *buf, unsigned int block,
>  	if (len > 128)
>  		return -EINVAL;
>  
> -	if (adv7511->current_edid_segment != block / 2) {
> +	if (adv7511->current_edid_segment != edid_segment) {
>  		unsigned int status;
>  
>  		ret = regmap_read(adv7511->regmap, ADV7511_REG_DDC_STATUS,
> @@ -553,15 +555,19 @@ static int adv7511_get_edid_block(void *data, u8 *buf, unsigned int block,
>  		if (ret < 0)
>  			return ret;
>  
> -		if (status != 2) {
> -			adv7511->edid_read = false;
> -			regmap_write(adv7511->regmap, ADV7511_REG_EDID_SEGMENT,
> -				     block);
> -			ret = adv7511_wait_for_edid(adv7511, 200);
> -			if (ret < 0)
> -				return ret;
> +		if (!(status & 0x0F)) {
> +			dev_dbg(dev, "DDC in reset no hot plug detected %x\n",
> +				 status);
> +			return -EIO;
>  		}
>  
> +		adv7511->edid_read = false;
> +		regmap_write(adv7511->regmap, ADV7511_REG_EDID_SEGMENT,
> +			     edid_segment);
> +		ret = adv7511_wait_for_edid(adv7511, 200);
> +		if (ret < 0)
> +			return ret;
> +
>  		/* Break this apart, hopefully more I2C controllers will
>  		 * support 64 byte transfers than 256 byte transfers
>  		 */
> @@ -589,7 +595,7 @@ static int adv7511_get_edid_block(void *data, u8 *buf, unsigned int block,
>  			offset += 64;
>  		}
>  
> -		adv7511->current_edid_segment = block / 2;
> +		adv7511->current_edid_segment = edid_segment;
>  	}
>  
>  	if (block % 2 == 0)

-- 
Jani Nikula, Intel
