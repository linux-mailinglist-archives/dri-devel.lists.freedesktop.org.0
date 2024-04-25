Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7428B1CB3
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 10:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6ADD10FD4B;
	Thu, 25 Apr 2024 08:19:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I6KCWD+1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 531181137BC
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 08:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714033195; x=1745569195;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=X0LexaSUYca3KBoxilRdzCtdkjqHtHxgzOLPDEOLU4Q=;
 b=I6KCWD+1iw5Vm6Nnjiwx6gMBCjQ587F552mwTwzrj6j1nA9MnvLKR1d6
 pQvnJymvQMkKRLzaq+mZOlQSbBQjKrIH7+ku9sgigKQNvGhLJ4xpENQMJ
 k3e0YAKXpbog8xvhF24iW4x227obls/K773etBnbmSE5NF/DbVnBFxyBL
 giUi9nda+xyjZdyoWRl2gQKdXUlX2SJebdF103JTKLXCgHb3q5idnHpF+
 0TA1JE9ZGy+nE9D9/nSQ95NEwWHBZCGn3Az1sp/Qxx23tihegAqVDrb7M
 DjGRqpyBptb6NAz8W7QM7CvMDba0Pu8BmUEFHr4Wfdl5X9c1qN6YeGv5W Q==;
X-CSE-ConnectionGUID: lepDiUmtS72xMUVOk08oMg==
X-CSE-MsgGUID: KjRuWDusTNOvY2vsSjbZmA==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9815794"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="9815794"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 01:19:53 -0700
X-CSE-ConnectionGUID: 6XyZWAvmRVOwKqK+3DMurw==
X-CSE-MsgGUID: NUqMB8tkRQuRepSk1h6YIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; d="scan'208";a="24868019"
Received: from scojocar-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.46.44])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 01:19:46 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org
Cc: Javier Martinez Canillas <javierm@redhat.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, linus.walleij@linaro.org, Cong Yang
 <yangcong5@huaqin.corp-partner.google.com>,
 lvzhaoxiong@huaqin.corp-partner.google.com, Hsin-Yi Wang
 <hsinyi@google.com>, Sam Ravnborg <sam@ravnborg.org>, Douglas Anderson
 <dianders@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, David Airlie
 <airlied@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/mipi-dsi: Reduce driver bloat of
 mipi_dsi_*_write_seq()
In-Reply-To: <20240424172017.1.Id15fae80582bc74a0d4f1338987fa375738f45b9@changeid>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240424172017.1.Id15fae80582bc74a0d4f1338987fa375738f45b9@changeid>
Date: Thu, 25 Apr 2024 11:19:43 +0300
Message-ID: <87pludq2g0.fsf@intel.com>
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

On Wed, 24 Apr 2024, Douglas Anderson <dianders@chromium.org> wrote:
> The consensus of many DRM folks is that we want to move away from DSI
> drivers defining tables of init commands. Instead, we want to move to
> init functions that can use common DRM functions. The issue thus far
> has been that using the macros mipi_dsi_generic_write_seq() and
> mipi_dsi_dcs_write_seq() bloats the driver using them.
>
> Through a cooperative effort between Hsin-Yi Wang and Dmitry
> Baryshkov, we have realized that the majority of the bloat is the fact
> that we have the dev_err_ratelimited() directly in the macros. Let's
> hoist this call into drm_mipi_dsi.c by adding a "chatty" version of
> the functions that includes the print.
>
> Without any changes to clients this gives a dramatic savings. Building
> with my build system shows one example:
>
> $ scripts/bloat-o-meter \
>   .../before/panel-novatek-nt36672e.ko \
>   .../after/panel-novatek-nt36672e.ko
>
> add/remove: 0/1 grow/shrink: 1/1 up/down: 6/-19652 (-19646)
> Function                                     old     new   delta
> __UNIQUE_ID_vermagic520                       64      70      +6
> nt36672e_1080x2408_60hz_init               16592    7260   -9332
> nt36672e_1080x2408_60hz_init._rs           10320       -  -10320
> Total: Before=31503, After=11857, chg -62.36%
>
> Note that given the change in location of the print it's harder to
> include the "cmd" in the printout for mipi_dsi_dcs_write_seq() since,
> theoretically, someone could call the new chatty function with a
> zero-size array and it would be illegal to dereference data[0].
> There's a printk format to print the whole buffer and this is probably
> more useful for debugging anyway. Given that we're doing this for
> mipi_dsi_dcs_write_seq(), let's also print the buffer for
> mipi_dsi_generic_write_seq() in the error case.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> The MIPI device I have in front of me (wormdingler) hasn't been
> converted to use these functions yet, so this is just compile
> tested. It's about my end of day so I'm sending this out since it's
> pretty straightforward. Hopefully others can confirm it works well for
> them and also saves space under their compilers.
>
>  drivers/gpu/drm/drm_mipi_dsi.c | 54 ++++++++++++++++++++++++++++++++++
>  include/drm/drm_mipi_dsi.h     | 31 ++++++++-----------
>  2 files changed, 67 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
> index 795001bb7ff1..5ded6aef38ed 100644
> --- a/drivers/gpu/drm/drm_mipi_dsi.c
> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> @@ -764,6 +764,33 @@ ssize_t mipi_dsi_generic_write(struct mipi_dsi_device *dsi, const void *payload,
>  }
>  EXPORT_SYMBOL(mipi_dsi_generic_write);
>  
> +/**
> + * mipi_dsi_generic_write_chatty() - mipi_dsi_generic_write() w/ an error log
> + * @dsi: DSI peripheral device
> + * @payload: buffer containing the payload
> + * @size: size of payload buffer
> + *
> + * Just like mipi_dsi_generic_write() but includes a dev_err_ratelimited()
> + * call for you.
> + *
> + * Return: The number of bytes transmitted on success or a negative error code
> + * on failure.
> + */
> +ssize_t mipi_dsi_generic_write_chatty(struct mipi_dsi_device *dsi,
> +				      const void *payload, size_t size)
> +{
> +	struct device *dev = &dsi->dev;
> +	int ret;
> +
> +	ret = mipi_dsi_generic_write(dsi, payload, size);
> +	if (ret < 0)
> +		dev_err_ratelimited(dev, "sending generic data %*ph failed: %d\n",
> +				    (int)size, payload, ret);

Why does this even need to be ratelimited? See below.

> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(mipi_dsi_generic_write_chatty);
> +
>  /**
>   * mipi_dsi_generic_read() - receive data using a generic read packet
>   * @dsi: DSI peripheral device
> @@ -852,6 +879,33 @@ ssize_t mipi_dsi_dcs_write_buffer(struct mipi_dsi_device *dsi,
>  }
>  EXPORT_SYMBOL(mipi_dsi_dcs_write_buffer);
>  
> +/**
> + * mipi_dsi_dcs_write_buffer_chatty - mipi_dsi_dcs_write_buffer() w/ an error log
> + * @dsi: DSI peripheral device
> + * @data: buffer containing data to be transmitted
> + * @len: size of transmission buffer
> + *
> + * Just like mipi_dsi_dcs_write_buffer() but includes a dev_err_ratelimited()
> + * call for you.
> + *
> + * Return: The number of bytes successfully transmitted or a negative error
> + * code on failure.
> + */
> +ssize_t mipi_dsi_dcs_write_buffer_chatty(struct mipi_dsi_device *dsi,
> +					 const void *data, size_t len)
> +{
> +	struct device *dev = &dsi->dev;
> +	int ret;
> +
> +	ret = mipi_dsi_dcs_write_buffer(dsi, data, len);
> +	if (ret < 0)
> +		dev_err_ratelimited(dev, "sending dcs data %*ph failed: %d\n",
> +				    (int)len, data, ret);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(mipi_dsi_dcs_write_buffer_chatty);
> +
>  /**
>   * mipi_dsi_dcs_write() - send DCS write command
>   * @dsi: DSI peripheral device
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index 82b1cc434ea3..784e425dc4c8 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -256,6 +256,8 @@ int mipi_dsi_picture_parameter_set(struct mipi_dsi_device *dsi,
>  
>  ssize_t mipi_dsi_generic_write(struct mipi_dsi_device *dsi, const void *payload,
>  			       size_t size);
> +ssize_t mipi_dsi_generic_write_chatty(struct mipi_dsi_device *dsi,
> +				      const void *payload, size_t size);
>  ssize_t mipi_dsi_generic_read(struct mipi_dsi_device *dsi, const void *params,
>  			      size_t num_params, void *data, size_t size);
>  
> @@ -279,6 +281,8 @@ enum mipi_dsi_dcs_tear_mode {
>  
>  ssize_t mipi_dsi_dcs_write_buffer(struct mipi_dsi_device *dsi,
>  				  const void *data, size_t len);
> +ssize_t mipi_dsi_dcs_write_buffer_chatty(struct mipi_dsi_device *dsi,
> +					 const void *data, size_t len);
>  ssize_t mipi_dsi_dcs_write(struct mipi_dsi_device *dsi, u8 cmd,
>  			   const void *data, size_t len);
>  ssize_t mipi_dsi_dcs_read(struct mipi_dsi_device *dsi, u8 cmd, void *data,
> @@ -317,14 +321,10 @@ int mipi_dsi_dcs_get_display_brightness_large(struct mipi_dsi_device *dsi,
>  #define mipi_dsi_generic_write_seq(dsi, seq...)                                \
>  	do {                                                                   \
>  		static const u8 d[] = { seq };                                 \
> -		struct device *dev = &dsi->dev;                                \
>  		int ret;                                                       \
> -		ret = mipi_dsi_generic_write(dsi, d, ARRAY_SIZE(d));           \
> -		if (ret < 0) {                                                 \
> -			dev_err_ratelimited(dev, "transmit data failed: %d\n", \
> -					    ret);                              \
> +		ret = mipi_dsi_generic_write_chatty(dsi, d, ARRAY_SIZE(d));    \
> +		if (ret < 0)                                                   \
>  			return ret;                                            \
> -		}                                                              \
>  	} while (0)

The one thing that I've always disliked about these macros (even if I've
never actually used them myself) is that they hide control flow from the
caller, i.e. return directly. You don't see that in the code, it's not
documented, and if you wanted to do better error handling yourself,
you're out of luck.

Be that as it may, the combo of ratelimited error printing and return on
errors does not make much sense to me. If there's something to print,
you bail out, that's it. I suspect we never hit the ratelimit.

You might even want to try *only* changing the ratelimited printing to a
regular error message, and see if the compiler can combine the logging
to a single exit point in the callers. Ratelimited it obviously can't
because every single one of them is unique.

BR,
Jani.

>  
>  /**
> @@ -333,18 +333,13 @@ int mipi_dsi_dcs_get_display_brightness_large(struct mipi_dsi_device *dsi,
>   * @cmd: Command
>   * @seq: buffer containing data to be transmitted
>   */
> -#define mipi_dsi_dcs_write_seq(dsi, cmd, seq...)                           \
> -	do {                                                               \
> -		static const u8 d[] = { cmd, seq };                        \
> -		struct device *dev = &dsi->dev;                            \
> -		int ret;                                                   \
> -		ret = mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));    \
> -		if (ret < 0) {                                             \
> -			dev_err_ratelimited(                               \
> -				dev, "sending command %#02x failed: %d\n", \
> -				cmd, ret);                                 \
> -			return ret;                                        \
> -		}                                                          \
> +#define mipi_dsi_dcs_write_seq(dsi, cmd, seq...)                               \
> +	do {                                                                   \
> +		static const u8 d[] = { cmd, seq };                            \
> +		int ret;                                                       \
> +		ret = mipi_dsi_dcs_write_buffer_chatty(dsi, d, ARRAY_SIZE(d)); \
> +		if (ret < 0)                                                   \
> +			return ret;                                            \
>  	} while (0)
>  
>  /**

-- 
Jani Nikula, Intel
