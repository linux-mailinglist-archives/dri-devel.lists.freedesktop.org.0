Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAECF8B448A
	for <lists+dri-devel@lfdr.de>; Sat, 27 Apr 2024 08:34:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E19C810F31F;
	Sat, 27 Apr 2024 06:34:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.b="IewcLyW5";
	dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="zVDS9FE+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay6-1.pub.mailoutpod2-cph3.one.com
 (mailrelay6-1.pub.mailoutpod2-cph3.one.com [46.30.211.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BDE910F31F
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Apr 2024 06:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=ec9lAzcjCON+j70wbK+o0qqyRqRnZ6NwtKhIea0xhVE=;
 b=IewcLyW5OZhWJ9xBcznao1kvHf9DWJP3OaspsYfueBhsro/GXKGrSFhv4NMQU5hIj7UJ5iR8V//N6
 SGjbLpxUHXf2cxoWMCP8lEQt93iKkW9rFVVC9g+Ykbch8OL23v1v20EtYYH7DXhMy2Y3VI5aIjVMcB
 rr/BmyLnoSESb1D6F2bsR3q5qCgSJuslnYMIdfAj7ARo5QuKOrC13q0dgZKaS0rlIJI3ev+YrTHsQB
 okHivnHXq7M3wYDx0BP8tBooMTP7vqsWTQ8Ze4sse2GyNAuK4+kUVZZBXXpdg78xNTm98Q4Qz0L+FR
 GxtNTjGhIutw2sFga942qaUxMujfbYQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=ec9lAzcjCON+j70wbK+o0qqyRqRnZ6NwtKhIea0xhVE=;
 b=zVDS9FE+iZDbPevL1q+sAfvAFGfoBi3/B542U+LWg9gWbmmYafi7m7DBbHE53Opa99mUovT8r4vCn
 JqdNB0zDg==
X-HalOne-ID: f81909a5-045f-11ef-8438-f528319a6ef4
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay6.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
 id f81909a5-045f-11ef-8438-f528319a6ef4;
 Sat, 27 Apr 2024 06:32:59 +0000 (UTC)
Date: Sat, 27 Apr 2024 08:32:50 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, Linus Walleij <linus.walleij@linaro.org>,
 lvzhaoxiong@huaqin.corp-partner.google.com,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Hsin-Yi Wang <hsinyi@google.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Joel Selvaraj <jo@jsfamily.in>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/8] drm/mipi-dsi: Introduce
 mipi_dsi_*_write_seq_multi()
Message-ID: <20240427063250.GB1137299@ravnborg.org>
References: <20240426235857.3870424-1-dianders@chromium.org>
 <20240426165839.v2.4.Ie94246c30fe95101e0e26dd5f96e976dbeb8f242@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240426165839.v2.4.Ie94246c30fe95101e0e26dd5f96e976dbeb8f242@changeid>
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

Hi Douglas.

On Fri, Apr 26, 2024 at 04:58:37PM -0700, Douglas Anderson wrote:
> The current mipi_dsi_*_write_seq() macros are non-intutitive because
> they contain a hidden "return" statement that will return out of the
> _caller_ of the macro. Let's mark them as deprecated and instead
> introduce some new macros that are more intuitive.
> 
> These new macros are less optimal when an error occurs but should
> behave more optimally when there is no error. Specifically these new
> macros cause smaller code to get generated and the code size savings
> (less to fetch from RAM, less cache space used, less RAM used) are
> important. Since the error case isn't something we need to optimize
> for and these new macros are easier to understand and more flexible,
> they should be used.

The whole ignore-and-return-early-if-an-error-occured concept is nice
and make this easy to understand and use. I have a few nits in the
following, but the overall concept is nice.

	Sam

> 
> After converting to use these new functions, one example shows some
> nice savings while also being easier to understand.
> 
> $ scripts/bloat-o-meter \
>   ...after/panel-novatek-nt36672e.ko \
>   ...ctx/panel-novatek-nt36672e.ko
> add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-988 (-988)
> Function                                     old     new   delta
> nt36672e_1080x2408_60hz_init                6236    5248    -988
> Total: Before=10651, After=9663, chg -9.28%
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> Right now this patch introduces two new functions in
> drm_mipi_dsi.c. Alternatively we could have changed the prototype of
> the "chatty" functions and made the deprecated macros adapt to the new
> prototype. While this sounds nice, it bloated callers of the
> deprecated functioin a bit because it caused the compiler to emit less
> optimal code. It doesn't seem terrible to add two more functions, so I
> went that way.
The concern here is when it will be cleaned up. As a minimum please
consider adding an item to todo.rst that details what should be done
to get rid of the now obsolete chatty functions so someone can pick it
up.


> 
> Changes in v2:
> - New
> 
>  drivers/gpu/drm/drm_mipi_dsi.c | 56 +++++++++++++++++++++++++++++++++
>  include/drm/drm_mipi_dsi.h     | 57 ++++++++++++++++++++++++++++++++++
>  2 files changed, 113 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
> index 1e062eda3b88..b7c75a4396e6 100644
> --- a/drivers/gpu/drm/drm_mipi_dsi.c
> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> @@ -792,6 +792,34 @@ int mipi_dsi_generic_write_chatty(struct mipi_dsi_device *dsi,
>  }
>  EXPORT_SYMBOL(mipi_dsi_generic_write_chatty);
>  
> +/**
> + * mipi_dsi_generic_write_multi() - mipi_dsi_generic_write_chatty() w/ accum_err
> + * @ctx: Context for multiple DSI transactions
> + * @payload: buffer containing the payload
> + * @size: size of payload buffer
> + *
> + * Like mipi_dsi_generic_write_chatty() but deals with errors in a way that
> + * makes it convenient to make several calls in a row.
> + */
> +void mipi_dsi_generic_write_multi(struct mipi_dsi_multi_context *ctx,
> +				  const void *payload, size_t size)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct device *dev = &dsi->dev;
> +	ssize_t ret;
> +
> +	if (ctx->accum_err)
> +		return;
> +
> +	ret = mipi_dsi_generic_write(dsi, payload, size);
> +	if (ret < 0) {
> +		ctx->accum_err = ret;
> +		dev_err_ratelimited(dev, "sending generic data %*ph failed: %d\n",
> +				    (int)size, payload, ctx->accum_err);
> +	}
I see no point in using ratelimited and then change it in the next
patch.

> +}
> +EXPORT_SYMBOL(mipi_dsi_generic_write_multi);
> +
>  /**
>   * mipi_dsi_generic_read() - receive data using a generic read packet
>   * @dsi: DSI peripheral device
> @@ -908,6 +936,34 @@ int mipi_dsi_dcs_write_buffer_chatty(struct mipi_dsi_device *dsi,
>  }
>  EXPORT_SYMBOL(mipi_dsi_dcs_write_buffer_chatty);
>  
> +/**
> + * mipi_dsi_dcs_write_buffer_multi - mipi_dsi_dcs_write_buffer_chatty() w/ accum_err
> + * @ctx: Context for multiple DSI transactions
> + * @data: buffer containing data to be transmitted
> + * @len: size of transmission buffer
> + *
> + * Like mipi_dsi_dcs_write_buffer_chatty() but deals with errors in a way that
> + * makes it convenient to make several calls in a row.
> + */
> +void mipi_dsi_dcs_write_buffer_multi(struct mipi_dsi_multi_context *ctx,
> +				     const void *data, size_t len)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct device *dev = &dsi->dev;
> +	ssize_t ret;
> +
> +	if (ctx->accum_err)
> +		return;
> +
> +	ret = mipi_dsi_dcs_write_buffer(dsi, data, len);
> +	if (ret < 0) {
> +		ctx->accum_err = ret;
> +		dev_err_ratelimited(dev, "sending dcs data %*ph failed: %d\n",
> +				    (int)len, data, ctx->accum_err);
> +	}
> +}
> +EXPORT_SYMBOL(mipi_dsi_dcs_write_buffer_multi);
> +
>  /**
>   * mipi_dsi_dcs_write() - send DCS write command
>   * @dsi: DSI peripheral device
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index 6d68d9927f46..379594649a42 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -197,6 +197,22 @@ struct mipi_dsi_device {
>  	struct drm_dsc_config *dsc;
>  };
>  
> +/**
> + * struct mipi_dsi_multi_context - Context to call multiple MIPI DSI funcs in a row
> + * @dsi: Pointer to the MIPI DSI device
> + * @accum_err: Storage for the accumulated error over the multiple calls. Init
> + *	to 0. If a function encounters an error then the error code will be
> + *	stored here. If you call a function and this points to a non-zero
> + *	value then the function will be a noop. This allows calling a function
> + *	many times in a row and just checking the error at the end to see if
> + *	any of them failed.
> + */
> +
> +struct mipi_dsi_multi_context {
> +	struct mipi_dsi_device *dsi;
> +	int accum_err;
> +};
Inline comments is - I think - preferred.



> +
>  #define MIPI_DSI_MODULE_PREFIX "mipi-dsi:"
>  
>  #define to_mipi_dsi_device(__dev)	container_of_const(__dev, struct mipi_dsi_device, dev)
> @@ -258,6 +274,8 @@ ssize_t mipi_dsi_generic_write(struct mipi_dsi_device *dsi, const void *payload,
>  			       size_t size);
>  int mipi_dsi_generic_write_chatty(struct mipi_dsi_device *dsi,
>  				  const void *payload, size_t size);
> +void mipi_dsi_generic_write_multi(struct mipi_dsi_multi_context *ctx,
> +				  const void *payload, size_t size);
>  ssize_t mipi_dsi_generic_read(struct mipi_dsi_device *dsi, const void *params,
>  			      size_t num_params, void *data, size_t size);
>  
> @@ -283,6 +301,8 @@ ssize_t mipi_dsi_dcs_write_buffer(struct mipi_dsi_device *dsi,
>  				  const void *data, size_t len);
>  int mipi_dsi_dcs_write_buffer_chatty(struct mipi_dsi_device *dsi,
>  				     const void *data, size_t len);
> +void mipi_dsi_dcs_write_buffer_multi(struct mipi_dsi_multi_context *ctx,
> +				     const void *data, size_t len);
>  ssize_t mipi_dsi_dcs_write(struct mipi_dsi_device *dsi, u8 cmd,
>  			   const void *data, size_t len);
>  ssize_t mipi_dsi_dcs_read(struct mipi_dsi_device *dsi, u8 cmd, void *data,
> @@ -319,6 +339,9 @@ int mipi_dsi_dcs_get_display_brightness_large(struct mipi_dsi_device *dsi,
>   * This macro will print errors for you and will RETURN FROM THE CALLING
>   * FUNCTION (yes this is non-intuitive) upon error.
>   *
> + * Because of the non-intuitive return behavior, THIS MACRO IS DEPRECATED.
> + * Please replace calls of it with mipi_dsi_generic_write_seq_multi().
> + *
>   * @dsi: DSI peripheral device
>   * @seq: buffer containing the payload
>   */
> @@ -331,12 +354,30 @@ int mipi_dsi_dcs_get_display_brightness_large(struct mipi_dsi_device *dsi,
>  			return ret;                                            \
>  	} while (0)
>  
> +/**
> + * mipi_dsi_generic_write_seq_multi - transmit data using a generic write packet
> + *
> + * This macro will print errors for you and error handling is optimized for
> + * callers that call this multiple times in a row.
> + *
> + * @ctx: Context for multiple DSI transactions
> + * @seq: buffer containing the payload
> + */
> +#define mipi_dsi_generic_write_seq_multi(ctx, seq...)                \
> +	do {                                                         \
> +		static const u8 d[] = { seq };                       \
> +		mipi_dsi_generic_write_multi(ctx, d, ARRAY_SIZE(d)); \
> +	} while (0)
> +
>  /**
>   * mipi_dsi_dcs_write_seq - transmit a DCS command with payload
>   *
>   * This macro will print errors for you and will RETURN FROM THE CALLING
>   * FUNCTION (yes this is non-intuitive) upon error.
>   *
> + * Because of the non-intuitive return behavior, THIS MACRO IS DEPRECATED.
> + * Please replace calls of it with mipi_dsi_dcs_write_seq_multi().
> + *
>   * @dsi: DSI peripheral device
>   * @cmd: Command
>   * @seq: buffer containing data to be transmitted
> @@ -350,6 +391,22 @@ int mipi_dsi_dcs_get_display_brightness_large(struct mipi_dsi_device *dsi,
>  			return ret;                                            \
>  	} while (0)
>  
> +/**
> + * mipi_dsi_dcs_write_seq_multi - transmit a DCS command with payload
> + *
> + * This macro will print errors for you and error handling is optimized for
> + * callers that call this multiple times in a row.
> + *
> + * @ctx: Context for multiple DSI transactions
> + * @cmd: Command
> + * @seq: buffer containing data to be transmitted
> + */
> +#define mipi_dsi_dcs_write_seq_multi(ctx, cmd, seq...)                  \
> +	do {                                                            \
> +		static const u8 d[] = { cmd, seq };                     \
> +		mipi_dsi_dcs_write_buffer_multi(ctx, d, ARRAY_SIZE(d)); \
> +	} while (0)
> +
>  /**
>   * struct mipi_dsi_driver - DSI driver
>   * @driver: device driver model driver
> -- 
> 2.44.0.769.g3c40516874-goog
