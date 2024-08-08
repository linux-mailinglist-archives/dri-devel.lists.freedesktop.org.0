Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B4494C63C
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 23:19:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E18C810E81C;
	Thu,  8 Aug 2024 21:19:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="T0g0qS3H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A57710E81C
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 21:19:43 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 478Jl1T2022527
 for <dri-devel@lists.freedesktop.org>; Thu, 8 Aug 2024 21:19:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Tc0NoPtW1csEfIK1eBAX3Y7A5xmfYZgq1wGiHg2qy9k=; b=T0g0qS3HjywjL5pJ
 WiOgt1lyRdmKUErpY33aWgt2V1yt2lSC3p5K3CKudeUTSnVCWBODuSOj20JjXnx7
 B8C5nzqPoX+JK/hD2i6KLF2gdhzKWUn7oT93vfbeBQKDAN+Z/q3aKkMRwxVBxph9
 beTrV9gf8VxFnTCCc6An7cDZzqhVDXZmsMbsDojd3yfI0B03Y+RbnidwHihUNoYk
 UtPqJr2cHxU7244jPPSH85cqDYTjRJBEsquLXDzF3wELyhPhpNKkmdfQM/+db7hO
 qbeesKMpbsAM9dZEpn1OubxSR/azcVJMtvqq5D/YrQLGrUU0IbQTan5bH/Pff1DO
 3+L7qA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40vtbct1c5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Aug 2024 21:19:41 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 478LJeKh007140
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 8 Aug 2024 21:19:40 GMT
Received: from [10.71.108.229] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 8 Aug 2024
 14:19:40 -0700
Message-ID: <38b7ff51-cd8e-4a21-aa55-e32fedbcefba@quicinc.com>
Date: Thu, 8 Aug 2024 14:19:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/mipi-dsi: add more multi functions for better
 error handling
To: <dri-devel@lists.freedesktop.org>
References: <20240806135949.468636-1-tejasvipin76@gmail.com>
 <20240806135949.468636-2-tejasvipin76@gmail.com>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240806135949.468636-2-tejasvipin76@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: GoK5WuFzs5O3fYEdFwLy5rry1oOdKvnx
X-Proofpoint-ORIG-GUID: GoK5WuFzs5O3fYEdFwLy5rry1oOdKvnx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-08_21,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 mlxscore=0 mlxlogscore=817 clxscore=1015 impostorscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408080151
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



On 8/6/2024 6:59 AM, Tejas Vipin wrote:
> Add more functions that can benefit from being multi style and mark
> older variants as deprecated to eventually convert all mipi_dsi functions
> to multi style.
> 
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>

Acked-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/drm_mipi_dsi.c | 194 +++++++++++++++++++++++++++++++++
>   include/drm/drm_mipi_dsi.h     |  10 ++
>   2 files changed, 204 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
> index a471c46f5ca6..8d0a866cf1e0 100644
> --- a/drivers/gpu/drm/drm_mipi_dsi.c
> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> @@ -603,6 +603,8 @@ EXPORT_SYMBOL(mipi_dsi_shutdown_peripheral);
>    * mipi_dsi_turn_on_peripheral() - sends a Turn On Peripheral command
>    * @dsi: DSI peripheral device
>    *
> + * This function is deprecated. Use mipi_dsi_turn_on_peripheral_multi() instead.
> + *
>    * Return: 0 on success or a negative error code on failure.
>    */
>   int mipi_dsi_turn_on_peripheral(struct mipi_dsi_device *dsi)
> @@ -652,6 +654,7 @@ EXPORT_SYMBOL(mipi_dsi_set_maximum_return_packet_size);
>    * @pps_selector: Select PPS from the table of pre-stored or uploaded PPS entries
>    *
>    * Enable or disable Display Stream Compression on the peripheral.
> + * This function is deprecated. Use mipi_dsi_compression_mode_ext_multi() instead.
>    *
>    * Return: 0 on success or a negative error code on failure.
>    */
> @@ -703,6 +706,7 @@ EXPORT_SYMBOL(mipi_dsi_compression_mode);
>    * @pps: VESA DSC 1.1 Picture Parameter Set
>    *
>    * Transmit the VESA DSC 1.1 Picture Parameter Set to the peripheral.
> + * This function is deprecated. Use mipi_dsi_picture_parameter_set_multi() instead.
>    *
>    * Return: 0 on success or a negative error code on failure.
>    */
> @@ -1037,6 +1041,8 @@ EXPORT_SYMBOL(mipi_dsi_dcs_read);
>    * mipi_dsi_dcs_nop() - send DCS nop packet
>    * @dsi: DSI peripheral device
>    *
> + * This function is deprecated. Use mipi_dsi_dcs_nop_multi() instead.
> + *
>    * Return: 0 on success or a negative error code on failure.
>    */
>   int mipi_dsi_dcs_nop(struct mipi_dsi_device *dsi)
> @@ -1055,6 +1061,8 @@ EXPORT_SYMBOL(mipi_dsi_dcs_nop);
>    * mipi_dsi_dcs_soft_reset() - perform a software reset of the display module
>    * @dsi: DSI peripheral device
>    *
> + * This function is deprecated. Use mipi_dsi_dcs_soft_reset_multi() instead.
> + *
>    * Return: 0 on success or a negative error code on failure.
>    */
>   int mipi_dsi_dcs_soft_reset(struct mipi_dsi_device *dsi)
> @@ -1124,6 +1132,8 @@ EXPORT_SYMBOL(mipi_dsi_dcs_get_pixel_format);
>    *    display module except interface communication
>    * @dsi: DSI peripheral device
>    *
> + * This function is deprecated. Use mipi_dsi_dcs_enter_sleep_mode_multi() instead.
> + *
>    * Return: 0 on success or a negative error code on failure.
>    */
>   int mipi_dsi_dcs_enter_sleep_mode(struct mipi_dsi_device *dsi)
> @@ -1143,6 +1153,8 @@ EXPORT_SYMBOL(mipi_dsi_dcs_enter_sleep_mode);
>    *    module
>    * @dsi: DSI peripheral device
>    *
> + * This function is deprecated. Use mipi_dsi_dcs_exit_sleep_mode_multi() instead.
> + *
>    * Return: 0 on success or a negative error code on failure.
>    */
>   int mipi_dsi_dcs_exit_sleep_mode(struct mipi_dsi_device *dsi)
> @@ -1162,6 +1174,8 @@ EXPORT_SYMBOL(mipi_dsi_dcs_exit_sleep_mode);
>    *    display device
>    * @dsi: DSI peripheral device
>    *
> + * This function is deprecated. Use mipi_dsi_dcs_set_display_off_multi() instead.
> + *
>    * Return: 0 on success or a negative error code on failure.
>    */
>   int mipi_dsi_dcs_set_display_off(struct mipi_dsi_device *dsi)
> @@ -1181,6 +1195,8 @@ EXPORT_SYMBOL(mipi_dsi_dcs_set_display_off);
>    *    display device
>    * @dsi: DSI peripheral device
>    *
> + * This function is deprecated. Use mipi_dsi_dcs_set_display_on_multi() instead.
> + *
>    * Return: 0 on success or a negative error code on failure
>    */
>   int mipi_dsi_dcs_set_display_on(struct mipi_dsi_device *dsi)
> @@ -1202,6 +1218,9 @@ EXPORT_SYMBOL(mipi_dsi_dcs_set_display_on);
>    * @start: first column of frame memory
>    * @end: last column of frame memory
>    *
> + * This function is deprecated. Use mipi_dsi_dcs_set_column_address_multi()
> + * instead.
> + *
>    * Return: 0 on success or a negative error code on failure.
>    */
>   int mipi_dsi_dcs_set_column_address(struct mipi_dsi_device *dsi, u16 start,
> @@ -1226,6 +1245,9 @@ EXPORT_SYMBOL(mipi_dsi_dcs_set_column_address);
>    * @start: first page of frame memory
>    * @end: last page of frame memory
>    *
> + * This function is deprecated. Use mipi_dsi_dcs_set_page_address_multi()
> + * instead.
> + *
>    * Return: 0 on success or a negative error code on failure.
>    */
>   int mipi_dsi_dcs_set_page_address(struct mipi_dsi_device *dsi, u16 start,
> @@ -1268,6 +1290,8 @@ EXPORT_SYMBOL(mipi_dsi_dcs_set_tear_off);
>    * @dsi: DSI peripheral device
>    * @mode: the Tearing Effect Output Line mode
>    *
> + * This function is deprecated. Use mipi_dsi_dcs_set_tear_on_multi() instead.
> + *
>    * Return: 0 on success or a negative error code on failure
>    */
>   int mipi_dsi_dcs_set_tear_on(struct mipi_dsi_device *dsi,
> @@ -1291,6 +1315,9 @@ EXPORT_SYMBOL(mipi_dsi_dcs_set_tear_on);
>    * @dsi: DSI peripheral device
>    * @format: pixel format
>    *
> + * This function is deprecated. Use mipi_dsi_dcs_set_pixel_format_multi()
> + * instead.
> + *
>    * Return: 0 on success or a negative error code on failure.
>    */
>   int mipi_dsi_dcs_set_pixel_format(struct mipi_dsi_device *dsi, u8 format)
> @@ -1334,6 +1361,9 @@ EXPORT_SYMBOL(mipi_dsi_dcs_set_tear_scanline);
>    * @dsi: DSI peripheral device
>    * @brightness: brightness value
>    *
> + * This function is deprecated. Use mipi_dsi_dcs_set_display_brightness_multi()
> + * instead.
> + *
>    * Return: 0 on success or a negative error code on failure.
>    */
>   int mipi_dsi_dcs_set_display_brightness(struct mipi_dsi_device *dsi,
> @@ -1639,6 +1669,170 @@ void mipi_dsi_dcs_set_tear_on_multi(struct mipi_dsi_multi_context *ctx,
>   }
>   EXPORT_SYMBOL(mipi_dsi_dcs_set_tear_on_multi);
>   
> +/**
> + * mipi_dsi_turn_on_peripheral_multi() - sends a Turn On Peripheral command
> + * @ctx: Context for multiple DSI transactions
> + *
> + * Like mipi_dsi_turn_on_peripheral() but deals with errors in a way that
> + * makes it convenient to make several calls in a row.
> + */
> +void mipi_dsi_turn_on_peripheral_multi(struct mipi_dsi_multi_context *ctx)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct device *dev = &dsi->dev;
> +	int ret;
> +
> +	if (ctx->accum_err)
> +		return;
> +
> +	ret = mipi_dsi_turn_on_peripheral(dsi);
> +	if (ret < 0) {
> +		ctx->accum_err = ret;
> +		dev_err(dev, "Failed to turn on peripheral: %d\n",
> +			ctx->accum_err);
> +	}
> +}
> +EXPORT_SYMBOL(mipi_dsi_turn_on_peripheral_multi);
> +
> +/**
> + * mipi_dsi_dcs_soft_reset_multi() - perform a software reset of the display module
> + * @ctx: Context for multiple DSI transactions
> + *
> + * Like mipi_dsi_dcs_soft_reset() but deals with errors in a way that
> + * makes it convenient to make several calls in a row.
> + */
> +void mipi_dsi_dcs_soft_reset_multi(struct mipi_dsi_multi_context *ctx)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct device *dev = &dsi->dev;
> +	int ret;
> +
> +	if (ctx->accum_err)
> +		return;
> +
> +	ret = mipi_dsi_dcs_soft_reset(dsi);
> +	if (ret < 0) {
> +		ctx->accum_err = ret;
> +		dev_err(dev, "Failed to mipi_dsi_dcs_soft_reset: %d\n",
> +			ctx->accum_err);
> +	}
> +}
> +EXPORT_SYMBOL(mipi_dsi_dcs_soft_reset_multi);
> +
> +/**
> + * mipi_dsi_dcs_set_display_brightness_multi() - sets the brightness value of
> + *	the display
> + * @ctx: Context for multiple DSI transactions
> + * @brightness: brightness value
> + *
> + * Like mipi_dsi_dcs_set_display_brightness() but deals with errors in a way that
> + * makes it convenient to make several calls in a row.
> + */
> +void mipi_dsi_dcs_set_display_brightness_multi(struct mipi_dsi_multi_context *ctx,
> +					       u16 brightness)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct device *dev = &dsi->dev;
> +	int ret;
> +
> +	if (ctx->accum_err)
> +		return;
> +
> +	ret = mipi_dsi_dcs_set_display_brightness(dsi, brightness);
> +	if (ret < 0) {
> +		ctx->accum_err = ret;
> +		dev_err(dev, "Failed to write display brightness: %d\n",
> +			ctx->accum_err);
> +	}
> +}
> +EXPORT_SYMBOL(mipi_dsi_dcs_set_display_brightness_multi);
> +
> +/**
> + * mipi_dsi_dcs_set_pixel_format_multi() - sets the pixel format for the RGB image
> + *	data used by the interface
> + * @ctx: Context for multiple DSI transactions
> + * @format: pixel format
> + *
> + * Like mipi_dsi_dcs_set_pixel_format() but deals with errors in a way that
> + * makes it convenient to make several calls in a row.
> + */
> +void mipi_dsi_dcs_set_pixel_format_multi(struct mipi_dsi_multi_context *ctx,
> +					 u8 format)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct device *dev = &dsi->dev;
> +	int ret;
> +
> +	if (ctx->accum_err)
> +		return;
> +
> +	ret = mipi_dsi_dcs_set_pixel_format(dsi, format);
> +	if (ret < 0) {
> +		ctx->accum_err = ret;
> +		dev_err(dev, "Failed to set pixel format: %d\n",
> +			ctx->accum_err);
> +	}
> +}
> +EXPORT_SYMBOL(mipi_dsi_dcs_set_pixel_format_multi);
> +
> +/**
> + * mipi_dsi_dcs_set_column_address_multi() - define the column extent of the
> + *	frame memory accessed by the host processor
> + * @ctx: Context for multiple DSI transactions
> + * @start: first column of frame memory
> + * @end: last column of frame memory
> + *
> + * Like mipi_dsi_dcs_set_column_address() but deals with errors in a way that
> + * makes it convenient to make several calls in a row.
> + */
> +void mipi_dsi_dcs_set_column_address_multi(struct mipi_dsi_multi_context *ctx,
> +					   u16 start, u16 end)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct device *dev = &dsi->dev;
> +	int ret;
> +
> +	if (ctx->accum_err)
> +		return;
> +
> +	ret = mipi_dsi_dcs_set_column_address(dsi, start, end);
> +	if (ret < 0) {
> +		ctx->accum_err = ret;
> +		dev_err(dev, "Failed to set column address: %d\n",
> +			ctx->accum_err);
> +	}
> +}
> +EXPORT_SYMBOL(mipi_dsi_dcs_set_column_address_multi);
> +
> +/**
> + * mipi_dsi_dcs_set_page_address_multi() - define the page extent of the
> + *	frame memory accessed by the host processor
> + * @ctx: Context for multiple DSI transactions
> + * @start: first page of frame memory
> + * @end: last page of frame memory
> + *
> + * Like mipi_dsi_dcs_set_page_address() but deals with errors in a way that
> + * makes it convenient to make several calls in a row.
> + */
> +void mipi_dsi_dcs_set_page_address_multi(struct mipi_dsi_multi_context *ctx,
> +					 u16 start, u16 end)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct device *dev = &dsi->dev;
> +	int ret;
> +
> +	if (ctx->accum_err)
> +		return;
> +
> +	ret = mipi_dsi_dcs_set_page_address(dsi, start, end);
> +	if (ret < 0) {
> +		ctx->accum_err = ret;
> +		dev_err(dev, "Failed to set page address: %d\n",
> +			ctx->accum_err);
> +	}
> +}
> +EXPORT_SYMBOL(mipi_dsi_dcs_set_page_address_multi);
> +
>   static int mipi_dsi_drv_probe(struct device *dev)
>   {
>   	struct mipi_dsi_driver *drv = to_mipi_dsi_driver(dev->driver);
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index 0f520eeeaa8e..602be6ce081a 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -365,6 +365,16 @@ void mipi_dsi_dcs_set_display_off_multi(struct mipi_dsi_multi_context *ctx);
>   void mipi_dsi_dcs_set_display_on_multi(struct mipi_dsi_multi_context *ctx);
>   void mipi_dsi_dcs_set_tear_on_multi(struct mipi_dsi_multi_context *ctx,
>   				    enum mipi_dsi_dcs_tear_mode mode);
> +void mipi_dsi_turn_on_peripheral_multi(struct mipi_dsi_multi_context *ctx);
> +void mipi_dsi_dcs_soft_reset_multi(struct mipi_dsi_multi_context *ctx);
> +void mipi_dsi_dcs_set_display_brightness_multi(struct mipi_dsi_multi_context *ctx,
> +					       u16 brightness);
> +void mipi_dsi_dcs_set_pixel_format_multi(struct mipi_dsi_multi_context *ctx,
> +					 u8 format);
> +void mipi_dsi_dcs_set_column_address_multi(struct mipi_dsi_multi_context *ctx,
> +					   u16 start, u16 end);
> +void mipi_dsi_dcs_set_page_address_multi(struct mipi_dsi_multi_context *ctx,
> +					   u16 start, u16 end);
>   
>   /**
>    * mipi_dsi_generic_write_seq - transmit data using a generic write packet
> -- 
> 2.46.0
> 
