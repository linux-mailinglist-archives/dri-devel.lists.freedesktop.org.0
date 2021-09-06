Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A1140196F
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 12:05:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C208946E;
	Mon,  6 Sep 2021 10:05:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7775289487
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Sep 2021 10:05:44 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10098"; a="207051587"
X-IronPort-AV: E=Sophos;i="5.85,272,1624345200"; d="scan'208";a="207051587"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 03:05:43 -0700
X-IronPort-AV: E=Sophos;i="5.85,272,1624345200"; d="scan'208";a="536701783"
Received: from isandweg-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.251.212.194])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 03:05:37 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Douglas Anderson <dianders@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linus W <linus.walleij@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 devicetree@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 03/16] drm/edid: Allow the querying/working with the
 panel ID from the EDID
In-Reply-To: <20210901131531.v3.3.I4a672175ba1894294d91d3dbd51da11a8239cf4a@changeid>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210901201934.1084250-1-dianders@chromium.org>
 <20210901131531.v3.3.I4a672175ba1894294d91d3dbd51da11a8239cf4a@changeid>
Date: Mon, 06 Sep 2021 13:05:34 +0300
Message-ID: <87h7ey81e9.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 01 Sep 2021, Douglas Anderson <dianders@chromium.org> wrote:
> EDIDs have 32-bits worth of data which is intended to be used to
> uniquely identify the make/model of a panel. This has historically
> been used only internally in the EDID processing code to identify
> quirks with panels.
>
> We'd like to use this panel ID in panel-simple to identify which panel
> is hooked up and from that information figure out power sequence
> timings. Let's expose this information from the EDID code and also
> allow it to be accessed early, before a connector has been created.
>
> To make matching in the panel-simple code easier, we'll return the
> panel ID as a 32-bit value. We'll provide some functions for
> converting this value back and forth to something more human readable.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v3:
> - Decode hex product ID w/ same endianness as everyone else.
>
>  drivers/gpu/drm/drm_edid.c | 59 ++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_edid.h     | 47 ++++++++++++++++++++++++++++++
>  2 files changed, 106 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index a22c38482a90..ac128bc3478a 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -2086,6 +2086,65 @@ struct edid *drm_get_edid(struct drm_connector *connector,
>  }
>  EXPORT_SYMBOL(drm_get_edid);
>  
> +/**
> + * drm_get_panel_id - Get a panel's ID through DDC
> + * @adapter: I2C adapter to use for DDC
> + *
> + * This function reads the first block of the EDID of a panel and (assuming
> + * that the EDID is valid) extracts the ID out of it. The ID is a 32-bit value
> + * (16 bits of manufacturer ID and 16 bits of per-manufacturer ID) that's
> + * supposed to be different for each different modem of panel.
> + *
> + * This function is intended to be used during early probing on devices where
> + * more than one panel might be present. Because of its intended use it must
> + * assume that the EDID of the panel is correct, at least as far as the ID
> + * is concerned (in other words, we don't process any overrides here).
> + *
> + * NOTE: it's expected that this function and drm_do_get_edid() will both
> + * be read the EDID, but there is no caching between them. Since we're only
> + * reading the first block, hopefully this extra overhead won't be too big.
> + *
> + * Return: A 32-bit ID that should be different for each make/model of panel.
> + *         See the functions encode_edid_id() and decode_edid_id() for some
> + *         details on the structure of this ID.
> + */
> +u32 drm_get_panel_id(struct i2c_adapter *adapter)

Please call it drm_edid_get_panel_id() because that's what it is, and
this is in drm_edid.[ch].

> +{
> +	struct edid *edid;
> +	u32 val;
> +
> +	edid = drm_do_get_edid_blk0(drm_do_probe_ddc_edid, adapter, NULL, NULL);
> +
> +	/*
> +	 * There are no manufacturer IDs of 0, so if there is a problem reading
> +	 * the EDID then we'll just return 0.
> +	 */
> +	if (IS_ERR_OR_NULL(edid))
> +		return 0;
> +
> +	/*
> +	 * In theory we could try to de-obfuscate this like edid_get_quirks()
> +	 * does, but it's easier to just deal with a 32-bit number.

Hmm, but is it, really? AFAICT this is just an internal representation
for a table, where it could just as well be stored in a struct that
could be just as compact now, but extensible later. You populate the
table via an encoding macro, then decode the id using a function - while
it could be in a format that's directly usable without the decode. If
suitably chosen, the struct could perhaps be reused between the quirks
code and your code.

> +	 *
> +	 * NOTE that we deal with endianness differently for the top half
> +	 * of this ID than for the bottom half. The bottom half (the product
> +	 * id) gets decoded as little endian by the EDID_PRODUCT_ID because
> +	 * that's how everyone seems to interpret it. The top half (the mfg_id)
> +	 * gets stored as big endian because that makes encode_edid_id() and
> +	 * decode_edid_id() easier to write (it's easier to extract the ASCII).
> +	 * It doesn't really matter, though, as long as the number here is
> +	 * unique.
> +	 */
> +	val = (u32)edid->mfg_id[0] << 24   |
> +	      (u32)edid->mfg_id[1] << 16   |
> +	      (u32)EDID_PRODUCT_ID(edid);
> +
> +	kfree(edid);
> +
> +	return val;
> +}
> +EXPORT_SYMBOL(drm_get_panel_id);
> +
>  /**
>   * drm_get_edid_switcheroo - get EDID data for a vga_switcheroo output
>   * @connector: connector we're probing
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index deccfd39e6db..73da40d0b5d1 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -508,6 +508,52 @@ static inline u8 drm_eld_get_conn_type(const uint8_t *eld)
>  	return eld[DRM_ELD_SAD_COUNT_CONN_TYPE] & DRM_ELD_CONN_TYPE_MASK;
>  }
>  
> +/**
> + * encode_edid_id - Encode an ID for matching against drm_get_panel_id()
> + * @vend_chr_0: First character of the vendor string.
> + * @vend_chr_2: Second character of the vendor string.
> + * @vend_chr_3: Third character of the vendor string.
> + * @product_id: The 16-bit product ID.
> + *
> + * This is a macro so that it can be calculated at compile time and used
> + * as an initializer.
> + *
> + * For instance:
> + *   encode_edid_id('B', 'O', 'E', 0x2d08) => 0x09e52d08
> + *
> + * Return: a 32-bit ID per panel.
> + */
> +#define encode_edid_id(vend_chr_0, vend_chr_1, vend_chr_2, product_id) \
> +	((((u32)(vend_chr_0) - '@') & 0x1f) << 26 | \
> +	 (((u32)(vend_chr_1) - '@') & 0x1f) << 21 | \
> +	 (((u32)(vend_chr_2) - '@') & 0x1f) << 16 | \
> +	 ((product_id) & 0xffff))
> +
> +/**
> + * decode_edid_id - Decode a panel ID from encode_edid_id()
> + * @panel_id: The panel ID to decode.
> + * @vend: A 4-byte buffer to store the 3-letter vendor string plus a '\0'
> + *	  termination
> + * @product_id: The product ID will be returned here.
> + *
> + * For instance, after:
> + *   decode_edid_id(0x09e52d08, vend, &product_id)
> + * These will be true:
> + *   vend[0] = 'B'
> + *   vend[1] = 'O'
> + *   vend[2] = 'E'
> + *   vend[3] = '\0'
> + *   product_id = 0x2d08
> + */
> +static inline void decode_edid_id(u32 panel_id, char vend[4], u16 *product_id)
> +{
> +	*product_id = (u16)(panel_id & 0xffff);
> +	vend[0] = '@' + ((panel_id >> 26) & 0x1f);
> +	vend[1] = '@' + ((panel_id >> 21) & 0x1f);
> +	vend[2] = '@' + ((panel_id >> 16) & 0x1f);
> +	vend[3] = '\0';
> +}

I think the names here could use a drm_edid_ prefix too.

Maybe drm_edid_encode_panel_id and drm_edid_decode_panel_id, aligning
nicely with drm_edid_get_panel_id.

BR,
Jani.

> +
>  bool drm_probe_ddc(struct i2c_adapter *adapter);
>  struct edid *drm_do_get_edid(struct drm_connector *connector,
>  	int (*get_edid_block)(void *data, u8 *buf, unsigned int block,
> @@ -515,6 +561,7 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
>  	void *data);
>  struct edid *drm_get_edid(struct drm_connector *connector,
>  			  struct i2c_adapter *adapter);
> +u32 drm_get_panel_id(struct i2c_adapter *adapter);
>  struct edid *drm_get_edid_switcheroo(struct drm_connector *connector,
>  				     struct i2c_adapter *adapter);
>  struct edid *drm_edid_duplicate(const struct edid *edid);

-- 
Jani Nikula, Intel Open Source Graphics Center
