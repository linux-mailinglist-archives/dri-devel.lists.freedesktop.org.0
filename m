Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D6C78FF7C
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 16:52:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05EDA10E7FE;
	Fri,  1 Sep 2023 14:52:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0303210E7FE
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 14:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693579933; x=1725115933;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=DnmCXYv/2EeBdxl0XNjUm7s0LTpnIhcycuFCieFQDkE=;
 b=LsyQzVWTHD48XK+OQU+0+V5lsBVn89C1Myh9ehTOCIPlqh0gR1gsiF+D
 bYM12ATfouFIHPdswfc2Sua5DllIV49SHvoLIBIxJE4QRr4qmiZojjmyM
 Zx200Eg3mfkBvI2SkD4L0d+kPpTD6hFnKEIfSy/BAq6Tvlzamyvz/MM6a
 32yqSCye3TdfzNjKoZQeXCNl9BugnSd5CrAXYL4vU+8qEtPgJPHLnzjq8
 VKpZntlkvtve17oVHUvGZIqgJ2LQTOGKEYDs4LSnsOce8KaZiYKm5NCV0
 v3sFPSglM1ribUToKXtFrs1UspMI3YoNFwVQYOvpr8CkTEyw+dIr7rYB6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="380023266"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; d="scan'208";a="380023266"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 07:52:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="810101413"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; d="scan'208";a="810101413"
Received: from epronina-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.34.21])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 07:52:06 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [RFC] drm/bridge: megachips-stdpxxxx-ge-b850v3-fw: switch to
 drm_do_get_edid()
In-Reply-To: <20230901102400.552254-1-jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230901102400.552254-1-jani.nikula@intel.com>
Date: Fri, 01 Sep 2023 17:52:02 +0300
Message-ID: <87jztahrot.fsf@intel.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Zheyu Ma <zheyuma97@gmail.com>,
 Robert Foss <rfoss@kernel.org>, Martyn Welch <martyn.welch@collabora.co.uk>,
 Jonas Karlman <jonas@kwiboo.se>, Peter Senna Tschudin <peter.senna@gmail.com>,
 Yuan Can <yuancan@huawei.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Ian Ray <ian.ray@ge.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Martin Donnelly <martin.donnelly@ge.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 01 Sep 2023, Jani Nikula <jani.nikula@intel.com> wrote:
> The driver was originally added in commit fcfa0ddc18ed ("drm/bridge:
> Drivers for megachips-stdpxxxx-ge-b850v3-fw (LVDS-DP++)"). I tried to
> look up the discussion, but didn't find anyone questioning the EDID
> reading part.
>
> Why does it not use drm_get_edid() or drm_do_get_edid()?
>
> I don't know where client->addr comes from, so I guess it could be
> different from DDC_ADDR, rendering drm_get_edid() unusable.
>
> There's also the comment:
>
> 	/* Yes, read the entire buffer, and do not skip the first
> 	 * EDID_LENGTH bytes.
> 	 */
>
> But again, there's not a word on *why*.
>
> Maybe we could just use drm_do_get_edid()? I'd like drivers to migrate
> away from their own EDID parsing and validity checks, including stop
> using drm_edid_block_valid(). (And long term switch to drm_edid_read(),
> struct drm_edid, and friends, but this is the first step.)
>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Ian Ray <ian.ray@ge.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Martin Donnelly <martin.donnelly@ge.com>
> Cc: Martyn Welch <martyn.welch@collabora.co.uk>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Peter Senna Tschudin <peter.senna@gmail.com>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Yuan Can <yuancan@huawei.com>
> Cc: Zheyu Ma <zheyuma97@gmail.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> ---
>
> I haven't even tried to compile this, and I have no way to test
> this. Apologies for the long Cc list; I'm hoping someone could explain
> the existing code, and perhaps give this approach a spin.
> ---
>  .../bridge/megachips-stdpxxxx-ge-b850v3-fw.c  | 57 +++----------------
>  1 file changed, 9 insertions(+), 48 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> index 460db3c8a08c..0d9eacf3d9b7 100644
> --- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> +++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> @@ -65,12 +65,11 @@ struct ge_b850v3_lvds {
>  
>  static struct ge_b850v3_lvds *ge_b850v3_lvds_ptr;
>  
> -static u8 *stdp2690_get_edid(struct i2c_client *client)
> +static int stdp2690_read_block(void *context, u8 *buf, unsigned int block, size_t len)
>  {
> +	struct i2c_client *client = context;
>  	struct i2c_adapter *adapter = client->adapter;
> -	unsigned char start = 0x00;
> -	unsigned int total_size;
> -	u8 *block = kmalloc(EDID_LENGTH, GFP_KERNEL);
> +	unsigned char start = block * EDID_LENGTH;
>  
>  	struct i2c_msg msgs[] = {
>  		{
> @@ -81,53 +80,15 @@ static u8 *stdp2690_get_edid(struct i2c_client *client)
>  		}, {
>  			.addr	= client->addr,
>  			.flags	= I2C_M_RD,
> -			.len	= EDID_LENGTH,
> -			.buf	= block,
> +			.len	= len,
> +			.buf	= buf,
>  		}
>  	};
>  
> -	if (!block)
> -		return NULL;
> +	if (i2c_transfer(adapter, msgs, 2) != 2)
> +		return -1;
>  
> -	if (i2c_transfer(adapter, msgs, 2) != 2) {
> -		DRM_ERROR("Unable to read EDID.\n");
> -		goto err;
> -	}
> -
> -	if (!drm_edid_block_valid(block, 0, false, NULL)) {
> -		DRM_ERROR("Invalid EDID data\n");
> -		goto err;
> -	}
> -
> -	total_size = (block[EDID_EXT_BLOCK_CNT] + 1) * EDID_LENGTH;
> -	if (total_size > EDID_LENGTH) {
> -		kfree(block);
> -		block = kmalloc(total_size, GFP_KERNEL);
> -		if (!block)
> -			return NULL;
> -
> -		/* Yes, read the entire buffer, and do not skip the first
> -		 * EDID_LENGTH bytes.
> -		 */
> -		start = 0x00;
> -		msgs[1].len = total_size;
> -		msgs[1].buf = block;
> -
> -		if (i2c_transfer(adapter, msgs, 2) != 2) {
> -			DRM_ERROR("Unable to read EDID extension blocks.\n");
> -			goto err;
> -		}
> -		if (!drm_edid_block_valid(block, 1, false, NULL)) {
> -			DRM_ERROR("Invalid EDID data\n");
> -			goto err;
> -		}
> -	}
> -
> -	return block;
> -
> -err:
> -	kfree(block);
> -	return NULL;
> +	return 0;
>  }
>  
>  static struct edid *ge_b850v3_lvds_get_edid(struct drm_bridge *bridge,
> @@ -137,7 +98,7 @@ static struct edid *ge_b850v3_lvds_get_edid(struct drm_bridge *bridge,
>  
>  	client = ge_b850v3_lvds_ptr->stdp2690_i2c;
>  
> -	return (struct edid *)stdp2690_get_edid(client);
> +	return drm_do_get_edid(connector, stdp2690_read_block, client, NULL);

The last NULL param should be dropped, as noted by the build bot.

BR,
Jani.


>  }
>  
>  static int ge_b850v3_lvds_get_modes(struct drm_connector *connector)

-- 
Jani Nikula, Intel Open Source Graphics Center
