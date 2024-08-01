Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5087944A7E
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 13:36:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BBF810E0A2;
	Thu,  1 Aug 2024 11:35:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PjyAxq7v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D1CA10E0A2
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 11:35:57 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-7a115c427f1so4312543a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Aug 2024 04:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722512157; x=1723116957; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ahAduSWWDHc6rTsON2tIDoOGddirMabU3Z6RKqvztKU=;
 b=PjyAxq7vjY/cXmvQ1dZ9KtbnO9OI0bVoAwgzcZ2bdkt7oWayVfe31t+Bn1t7HnrJql
 4w4iPBBrziw6fz4Nfyp5jiUu5Xt0QaSr2Ke228bz0ldRH6RRM5To/kE83OrXWf0CmAfH
 F6Z/dvNHAEB9+B7ewDVU+MZGZ4YWvOhiaDPEJGirYF1NHGC9ttwZyiShL0/TA0u1lBRV
 eoXb0Yt96xQ8TQYDKyNbPvyO9eLAkp3Yax3g5dYQjBvrkmuhEBrWx+p0mY03mfBcy5gs
 ZUGgZYcqvxQIzc4EK9duf6yZLwSn0whGbwHMbsPCe0VV49XJf3QhFwbmNWFXRCS+2Aqa
 iMcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722512157; x=1723116957;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ahAduSWWDHc6rTsON2tIDoOGddirMabU3Z6RKqvztKU=;
 b=NQGY4DCCYSFYXOuH3yERCIgwEC0WD2ki3g7wODFz9SnLMW4t79Def9GLFvjy/+1IAn
 f8oSC7ELJMO+/9Xao3wGO1UYvFGy56xPWQ4+SrCnERLedE0yYVRQswso8hRdLfpmw0r+
 lUvw9sBDxLIGq0SDestincj2iGmXNWnsARBd+WkOHksFyC5t3pC6VaajGgFJSw5epZOA
 BxSqShqMxA/WcWJ8q1CUGDvI2jQ7Iz6OCaY0ZxQyumV/cQ17ey4S+VQvAL0dkBraYtW9
 t9pvmHZK4jdoDUQPSVigDnGlRowBiwg8ZNUXqUAzptOD6avRVpyKtUj2hBF+0Tc5w+x/
 vrSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVvo84qgGLGqYAh7uLhXsZyjiCYo7URWWzAJOulbLYJ6GELIiYq/DUSVgKK8ovZ60gspnZY+DlpqJwx6fYukhsaqjqA5uG/adFIaRufUW8
X-Gm-Message-State: AOJu0YzdTom/iJzvUzAk9xEhbr1VZEw4saEebMECiVKyyLryS8HoJybI
 T3JCe5QCRKfLK/OnHbRd1GH9yd75/jGCdnGmlTnobTG/S4ZzXRVT
X-Google-Smtp-Source: AGHT+IHRZmtTgr6he6ex/3IxTum2N2nQFsd/76F6cHkWMDcWAlM/FcGS67DN5B0FCDeBvZy3n8DhQA==
X-Received: by 2002:a05:6a21:9989:b0:1c0:eb1e:868e with SMTP id
 adf61e73a8af0-1c68cec7a74mr3171675637.19.1722512156787; 
 Thu, 01 Aug 2024 04:35:56 -0700 (PDT)
Received: from [10.3.80.76] ([59.152.80.69]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2cfdc4513ecsm3072495a91.20.2024.08.01.04.35.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Aug 2024 04:35:56 -0700 (PDT)
Message-ID: <d1132708-204a-45fc-b14a-6432993cb33a@gmail.com>
Date: Thu, 1 Aug 2024 17:05:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/mipi-dsi: add more multi functions for better
 error handling
To: Jani Nikula <jani.nikula@linux.intel.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 neil.armstrong@linaro.org, quic_jesszhan@quicinc.com
Cc: dianders@chromium.org, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240730060659.455953-1-tejasvipin76@gmail.com>
 <20240730060659.455953-2-tejasvipin76@gmail.com> <87cymswld0.fsf@intel.com>
Content-Language: en-US
From: Tejas Vipin <tejasvipin76@gmail.com>
In-Reply-To: <87cymswld0.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/1/24 4:39 PM, Jani Nikula wrote:
> On Tue, 30 Jul 2024, Tejas Vipin <tejasvipin76@gmail.com> wrote:
>> Add more functions that can benefit from being multi style and mark
>> older variants as deprecated to eventually convert all mipi_dsi functions
>> to multi style.
> 
> What?
> 
> Why would a lot of regular DSI commands that are not exclusively used
> for one time setup need to be deprecated or converted to _multi()?
> 

All of the functions I've marked as deprecated here have a good amount
of their usage in conjunction with other mipi_dsi functions (an
exception being mipi_dsi_dcs_get_display_brightness which I have
realized is not suitable for this type of conversion). Them being
rewritten as multi style functions saves a lot of early returns and
errors being repeated over and over again across the codebase.

In the cases where they are just called by themselves, there is very little
overhead in replacing them with a multi variant. These functions would
be better off converted to multi variants, and the old versions removed
when all the function calls are replaced.

> BR,
> Jani.
> 
>>
>> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
>> ---
>>  drivers/gpu/drm/drm_mipi_dsi.c | 226 +++++++++++++++++++++++++++++++++
>>  include/drm/drm_mipi_dsi.h     |  12 ++
>>  2 files changed, 238 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
>> index a471c46f5ca6..05ea7df5dec1 100644
>> --- a/drivers/gpu/drm/drm_mipi_dsi.c
>> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
>> @@ -603,6 +603,8 @@ EXPORT_SYMBOL(mipi_dsi_shutdown_peripheral);
>>   * mipi_dsi_turn_on_peripheral() - sends a Turn On Peripheral command
>>   * @dsi: DSI peripheral device
>>   *
>> + * This function is deprecated. Use mipi_dsi_turn_on_peripheral_multi() instead.
>> + *
>>   * Return: 0 on success or a negative error code on failure.
>>   */
>>  int mipi_dsi_turn_on_peripheral(struct mipi_dsi_device *dsi)
>> @@ -652,6 +654,7 @@ EXPORT_SYMBOL(mipi_dsi_set_maximum_return_packet_size);
>>   * @pps_selector: Select PPS from the table of pre-stored or uploaded PPS entries
>>   *
>>   * Enable or disable Display Stream Compression on the peripheral.
>> + * This function is deprecated. Use mipi_dsi_compression_mode_ext_multi() instead.
>>   *
>>   * Return: 0 on success or a negative error code on failure.
>>   */
>> @@ -703,6 +706,7 @@ EXPORT_SYMBOL(mipi_dsi_compression_mode);
>>   * @pps: VESA DSC 1.1 Picture Parameter Set
>>   *
>>   * Transmit the VESA DSC 1.1 Picture Parameter Set to the peripheral.
>> + * This function is deprecated. Use mipi_dsi_picture_parameter_set_multi() instead.
>>   *
>>   * Return: 0 on success or a negative error code on failure.
>>   */
>> @@ -1037,6 +1041,8 @@ EXPORT_SYMBOL(mipi_dsi_dcs_read);
>>   * mipi_dsi_dcs_nop() - send DCS nop packet
>>   * @dsi: DSI peripheral device
>>   *
>> + * This function is deprecated. Use mipi_dsi_dcs_nop_multi() instead.
>> + *
>>   * Return: 0 on success or a negative error code on failure.
>>   */
>>  int mipi_dsi_dcs_nop(struct mipi_dsi_device *dsi)
>> @@ -1055,6 +1061,8 @@ EXPORT_SYMBOL(mipi_dsi_dcs_nop);
>>   * mipi_dsi_dcs_soft_reset() - perform a software reset of the display module
>>   * @dsi: DSI peripheral device
>>   *
>> + * This function is deprecated. Use mipi_dsi_dcs_soft_reset_multi() instead.
>> + *
>>   * Return: 0 on success or a negative error code on failure.
>>   */
>>  int mipi_dsi_dcs_soft_reset(struct mipi_dsi_device *dsi)
>> @@ -1124,6 +1132,8 @@ EXPORT_SYMBOL(mipi_dsi_dcs_get_pixel_format);
>>   *    display module except interface communication
>>   * @dsi: DSI peripheral device
>>   *
>> + * This function is deprecated. Use mipi_dsi_dcs_enter_sleep_mode_multi() instead.
>> + *
>>   * Return: 0 on success or a negative error code on failure.
>>   */
>>  int mipi_dsi_dcs_enter_sleep_mode(struct mipi_dsi_device *dsi)
>> @@ -1143,6 +1153,8 @@ EXPORT_SYMBOL(mipi_dsi_dcs_enter_sleep_mode);
>>   *    module
>>   * @dsi: DSI peripheral device
>>   *
>> + * This function is deprecated. Use mipi_dsi_dcs_exit_sleep_mode_multi() instead.
>> + *
>>   * Return: 0 on success or a negative error code on failure.
>>   */
>>  int mipi_dsi_dcs_exit_sleep_mode(struct mipi_dsi_device *dsi)
>> @@ -1162,6 +1174,8 @@ EXPORT_SYMBOL(mipi_dsi_dcs_exit_sleep_mode);
>>   *    display device
>>   * @dsi: DSI peripheral device
>>   *
>> + * This function is deprecated. Use mipi_dsi_dcs_set_display_off_multi() instead.
>> + *
>>   * Return: 0 on success or a negative error code on failure.
>>   */
>>  int mipi_dsi_dcs_set_display_off(struct mipi_dsi_device *dsi)
>> @@ -1181,6 +1195,8 @@ EXPORT_SYMBOL(mipi_dsi_dcs_set_display_off);
>>   *    display device
>>   * @dsi: DSI peripheral device
>>   *
>> + * This function is deprecated. Use mipi_dsi_dcs_set_display_on_multi() instead.
>> + *
>>   * Return: 0 on success or a negative error code on failure
>>   */
>>  int mipi_dsi_dcs_set_display_on(struct mipi_dsi_device *dsi)
>> @@ -1202,6 +1218,9 @@ EXPORT_SYMBOL(mipi_dsi_dcs_set_display_on);
>>   * @start: first column of frame memory
>>   * @end: last column of frame memory
>>   *
>> + * This function is deprecated. Use mipi_dsi_dcs_set_column_address_multi()
>> + * instead.
>> + *
>>   * Return: 0 on success or a negative error code on failure.
>>   */
>>  int mipi_dsi_dcs_set_column_address(struct mipi_dsi_device *dsi, u16 start,
>> @@ -1226,6 +1245,9 @@ EXPORT_SYMBOL(mipi_dsi_dcs_set_column_address);
>>   * @start: first page of frame memory
>>   * @end: last page of frame memory
>>   *
>> + * This function is deprecated. Use mipi_dsi_dcs_set_page_address_multi()
>> + * instead.
>> + *
>>   * Return: 0 on success or a negative error code on failure.
>>   */
>>  int mipi_dsi_dcs_set_page_address(struct mipi_dsi_device *dsi, u16 start,
>> @@ -1268,6 +1290,8 @@ EXPORT_SYMBOL(mipi_dsi_dcs_set_tear_off);
>>   * @dsi: DSI peripheral device
>>   * @mode: the Tearing Effect Output Line mode
>>   *
>> + * This function is deprecated. Use mipi_dsi_dcs_set_tear_on_multi() instead.
>> + *
>>   * Return: 0 on success or a negative error code on failure
>>   */
>>  int mipi_dsi_dcs_set_tear_on(struct mipi_dsi_device *dsi,
>> @@ -1291,6 +1315,9 @@ EXPORT_SYMBOL(mipi_dsi_dcs_set_tear_on);
>>   * @dsi: DSI peripheral device
>>   * @format: pixel format
>>   *
>> + * This function is deprecated. Use mipi_dsi_dcs_set_pixel_format_multi()
>> + * instead.
>> + *
>>   * Return: 0 on success or a negative error code on failure.
>>   */
>>  int mipi_dsi_dcs_set_pixel_format(struct mipi_dsi_device *dsi, u8 format)
>> @@ -1334,6 +1361,9 @@ EXPORT_SYMBOL(mipi_dsi_dcs_set_tear_scanline);
>>   * @dsi: DSI peripheral device
>>   * @brightness: brightness value
>>   *
>> + * This function is deprecated. Use mipi_dsi_dcs_set_display_brightness_multi()
>> + * instead.
>> + *
>>   * Return: 0 on success or a negative error code on failure.
>>   */
>>  int mipi_dsi_dcs_set_display_brightness(struct mipi_dsi_device *dsi,
>> @@ -1357,6 +1387,9 @@ EXPORT_SYMBOL(mipi_dsi_dcs_set_display_brightness);
>>   * @dsi: DSI peripheral device
>>   * @brightness: brightness value
>>   *
>> + * This function is deprecated. Use mipi_dsi_dcs_get_display_brightness_multi()
>> + * instead.
>> + *
>>   * Return: 0 on success or a negative error code on failure.
>>   */
>>  int mipi_dsi_dcs_get_display_brightness(struct mipi_dsi_device *dsi,
>> @@ -1639,6 +1672,199 @@ void mipi_dsi_dcs_set_tear_on_multi(struct mipi_dsi_multi_context *ctx,
>>  }
>>  EXPORT_SYMBOL(mipi_dsi_dcs_set_tear_on_multi);
>>  
>> +/**
>> + * mipi_dsi_turn_on_peripheral_multi() - sends a Turn On Peripheral command
>> + * @ctx: Context for multiple DSI transactions
>> + *
>> + * Like mipi_dsi_turn_on_peripheral() but deals with errors in a way that
>> + * makes it convenient to make several calls in a row.
>> + */
>> +void mipi_dsi_turn_on_peripheral_multi(struct mipi_dsi_multi_context *ctx)
>> +{
>> +	struct mipi_dsi_device *dsi = ctx->dsi;
>> +	struct device *dev = &dsi->dev;
>> +	int ret;
>> +
>> +	if (ctx->accum_err)
>> +		return;
>> +
>> +	ret = mipi_dsi_turn_on_peripheral(dsi);
>> +	if (ret < 0) {
>> +		ctx->accum_err = ret;
>> +		dev_err(dev, "Failed to turn on peripheral: %d\n",
>> +			ctx->accum_err);
>> +	}
>> +}
>> +EXPORT_SYMBOL(mipi_dsi_turn_on_peripheral_multi);
>> +
>> +/**
>> + * mipi_dsi_dcs_soft_reset_multi() - perform a software reset of the display module
>> + * @ctx: Context for multiple DSI transactions
>> + *
>> + * Like mipi_dsi_dcs_soft_reset() but deals with errors in a way that
>> + * makes it convenient to make several calls in a row.
>> + */
>> +void mipi_dsi_dcs_soft_reset_multi(struct mipi_dsi_multi_context *ctx)
>> +{
>> +	struct mipi_dsi_device *dsi = ctx->dsi;
>> +	struct device *dev = &dsi->dev;
>> +	int ret;
>> +
>> +	if (ctx->accum_err)
>> +		return;
>> +
>> +	ret = mipi_dsi_dcs_soft_reset(dsi);
>> +	if (ret < 0) {
>> +		ctx->accum_err = ret;
>> +		dev_err(dev, "Failed to mipi_dsi_dcs_soft_reset: %d\n",
>> +			ctx->accum_err);
>> +	}
>> +}
>> +EXPORT_SYMBOL(mipi_dsi_dcs_soft_reset_multi);
>> +
>> +/**
>> + * mipi_dsi_dcs_set_display_brightness_multi() - sets the brightness value of
>> + *	the display
>> + * @ctx: Context for multiple DSI transactions
>> + * @brightness: brightness value
>> + *
>> + * Like mipi_dsi_dcs_set_display_brightness() but deals with errors in a way that
>> + * makes it convenient to make several calls in a row.
>> + */
>> +void mipi_dsi_dcs_set_display_brightness_multi(struct mipi_dsi_multi_context *ctx,
>> +					       u16 brightness)
>> +{
>> +	struct mipi_dsi_device *dsi = ctx->dsi;
>> +	struct device *dev = &dsi->dev;
>> +	int ret;
>> +
>> +	if (ctx->accum_err)
>> +		return;
>> +
>> +	ret = mipi_dsi_dcs_set_display_brightness(dsi, brightness);
>> +	if (ret < 0) {
>> +		ctx->accum_err = ret;
>> +		dev_err(dev, "Failed to write display brightness: %d\n",
>> +			ctx->accum_err);
>> +	}
>> +}
>> +EXPORT_SYMBOL(mipi_dsi_dcs_set_display_brightness_multi);
>> +
>> +/**
>> + * mipi_dsi_dcs_set_pixel_format_multi() - sets the pixel format for the RGB image
>> + *	data used by the interface
>> + * @ctx: Context for multiple DSI transactions
>> + * @format: pixel format
>> + *
>> + * Like mipi_dsi_dcs_set_pixel_format() but deals with errors in a way that
>> + * makes it convenient to make several calls in a row.
>> + */
>> +void mipi_dsi_dcs_set_pixel_format_multi(struct mipi_dsi_multi_context *ctx,
>> +					 u8 format)
>> +{
>> +	struct mipi_dsi_device *dsi = ctx->dsi;
>> +	struct device *dev = &dsi->dev;
>> +	int ret;
>> +
>> +	if (ctx->accum_err)
>> +		return;
>> +
>> +	ret = mipi_dsi_dcs_set_pixel_format(dsi, format);
>> +	if (ret < 0) {
>> +		ctx->accum_err = ret;
>> +		dev_err(dev, "Failed to set pixel format: %d\n",
>> +			ctx->accum_err);
>> +	}
>> +}
>> +EXPORT_SYMBOL(mipi_dsi_dcs_set_pixel_format_multi);
>> +
>> +/**
>> + * mipi_dsi_dcs_set_column_address_multi() - define the column extent of the
>> + *	frame memory accessed by the host processor
>> + * @ctx: Context for multiple DSI transactions
>> + * @start: first column of frame memory
>> + * @end: last column of frame memory
>> + *
>> + * Like mipi_dsi_dcs_set_column_address() but deals with errors in a way that
>> + * makes it convenient to make several calls in a row.
>> + */
>> +void mipi_dsi_dcs_set_column_address_multi(struct mipi_dsi_multi_context *ctx,
>> +					   u16 start, u16 end)
>> +{
>> +	struct mipi_dsi_device *dsi = ctx->dsi;
>> +	struct device *dev = &dsi->dev;
>> +	int ret;
>> +
>> +	if (ctx->accum_err)
>> +		return;
>> +
>> +	ret = mipi_dsi_dcs_set_column_address(dsi, start, end);
>> +	if (ret < 0) {
>> +		ctx->accum_err = ret;
>> +		dev_err(dev, "Failed to set column address: %d\n",
>> +			ctx->accum_err);
>> +	}
>> +}
>> +EXPORT_SYMBOL(mipi_dsi_dcs_set_column_address_multi);
>> +
>> +/**
>> + * mipi_dsi_dcs_set_page_address_multi() - define the page extent of the
>> + *	frame memory accessed by the host processor
>> + * @ctx: Context for multiple DSI transactions
>> + * @start: first page of frame memory
>> + * @end: last page of frame memory
>> + *
>> + * Like mipi_dsi_dcs_set_page_address() but deals with errors in a way that
>> + * makes it convenient to make several calls in a row.
>> + */
>> +void mipi_dsi_dcs_set_page_address_multi(struct mipi_dsi_multi_context *ctx,
>> +					 u16 start, u16 end)
>> +{
>> +	struct mipi_dsi_device *dsi = ctx->dsi;
>> +	struct device *dev = &dsi->dev;
>> +	int ret;
>> +
>> +	if (ctx->accum_err)
>> +		return;
>> +
>> +	ret = mipi_dsi_dcs_set_page_address(dsi, start, end);
>> +	if (ret < 0) {
>> +		ctx->accum_err = ret;
>> +		dev_err(dev, "Failed to set page address: %d\n",
>> +			ctx->accum_err);
>> +	}
>> +}
>> +EXPORT_SYMBOL(mipi_dsi_dcs_set_page_address_multi);
>> +
>> +/**
>> + * mipi_dsi_dcs_get_display_brightness_multi() - gets the current brightness value
>> + *    of the display
>> + * @ctx: Context for multiple DSI transactions
>> + * @brightness: brightness value
>> + *
>> + * Like mipi_dsi_dcs_get_display_brightness() but deals with errors in a way that
>> + * makes it convenient to make several calls in a row.
>> + */
>> +void mipi_dsi_dcs_get_display_brightness_multi(struct mipi_dsi_multi_context *ctx,
>> +					       u16 *brightness)
>> +{
>> +	struct mipi_dsi_device *dsi = ctx->dsi;
>> +	struct device *dev = &dsi->dev;
>> +	int ret;
>> +
>> +	if (ctx->accum_err)
>> +		return;
>> +
>> +	ret = mipi_dsi_dcs_get_display_brightness(dsi, brightness);
>> +	if (ret < 0) {
>> +		ctx->accum_err = ret;
>> +		dev_err(dev, "Failed to get display brightness: %d\n",
>> +			ctx->accum_err);
>> +	}
>> +}
>> +EXPORT_SYMBOL(mipi_dsi_dcs_get_display_brightness_multi);
>> +
>> +
>>  static int mipi_dsi_drv_probe(struct device *dev)
>>  {
>>  	struct mipi_dsi_driver *drv = to_mipi_dsi_driver(dev->driver);
>> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
>> index 0f520eeeaa8e..7c6239d7b492 100644
>> --- a/include/drm/drm_mipi_dsi.h
>> +++ b/include/drm/drm_mipi_dsi.h
>> @@ -365,6 +365,18 @@ void mipi_dsi_dcs_set_display_off_multi(struct mipi_dsi_multi_context *ctx);
>>  void mipi_dsi_dcs_set_display_on_multi(struct mipi_dsi_multi_context *ctx);
>>  void mipi_dsi_dcs_set_tear_on_multi(struct mipi_dsi_multi_context *ctx,
>>  				    enum mipi_dsi_dcs_tear_mode mode);
>> +void mipi_dsi_turn_on_peripheral_multi(struct mipi_dsi_multi_context *ctx);
>> +void mipi_dsi_dcs_soft_reset_multi(struct mipi_dsi_multi_context *ctx);
>> +void mipi_dsi_dcs_set_display_brightness_multi(struct mipi_dsi_multi_context *ctx,
>> +					       u16 brightness);
>> +void mipi_dsi_dcs_set_pixel_format_multi(struct mipi_dsi_multi_context *ctx,
>> +					 u8 format);
>> +void mipi_dsi_dcs_set_column_address_multi(struct mipi_dsi_multi_context *ctx,
>> +					   u16 start, u16 end);
>> +void mipi_dsi_dcs_set_page_address_multi(struct mipi_dsi_multi_context *ctx,
>> +					   u16 start, u16 end);
>> +void mipi_dsi_dcs_get_display_brightness_multi(struct mipi_dsi_multi_context *ctx,
>> +					       u16 *brightness);
>>  
>>  /**
>>   * mipi_dsi_generic_write_seq - transmit data using a generic write packet
> 

-- 
Tejas Vipin
