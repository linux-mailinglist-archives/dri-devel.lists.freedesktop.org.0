Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 418F795F8BA
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 20:04:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 961C310E262;
	Mon, 26 Aug 2024 18:04:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="X8EC1OnI";
	dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="NSIOLCp7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A336A10E262
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2024 18:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
 t=1724695437; bh=w2NohdGsHE7UuVvNyUIet5xboNMEuVw8vNSv42GIyco=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X8EC1OnIgXRJWvQug5TUsDcfsPT7RGt37xENs5hsudAbQyMn9tomEzbYz4nqOEpGJ
 Hl6Odo0Lw7OaDXb5hkesdJP8o1SDto8XXqnUMiI1utcVee3pegwPfyka5ZVGO4XUD0
 vTgeH2reDxV7JRtP6V3W0EfKApTjwfBl8PmqqwmHj2g6IE4D0SOTyE3+eG0ly+EWuL
 bRywGSLU1dgKyNBjsVqxOc8fBixlSeKB3+HoW/Lwwa7jj3lGkVS7psxJRhEEeD2ecq
 1h0AKrg7lcr37vbJiI7y8APqQr33K3+qXr/d8Tes7w2Br1ZMg2VGhd9hRnAo3Yx4IT
 DcgrSnTbS3RGw==
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id D657CFB03;
 Mon, 26 Aug 2024 20:03:57 +0200 (CEST)
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4KBdoFnrlicg; Mon, 26 Aug 2024 20:03:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
 t=1724695436; bh=w2NohdGsHE7UuVvNyUIet5xboNMEuVw8vNSv42GIyco=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NSIOLCp7MTG8rtp/EBWKcFDUcrlyU2tAz/6NdG0kXbdW9OcbF2UUKq0Wai9Tk2U4t
 k80gjOigWjyqzm1e+joRpaTiF46SC7CCBOs4N7NpgJwtFXBV6s/yAs1AbsZsN8CCbe
 2kYK2KANqOTDhfmG2pkKG3vH5fkG0GE8TeTd70O6UV//aBujCCzHo4KSgjSFPqoOJn
 BlwP7tsjpev1WOkIDo5TtmfRJ+XAji+2mjJkUsTqKJBMCC1qi7sc8wDW8GTWEYbiSY
 CFsjzNNUYgWVnUWTvBFEz60M048C6A8bpGVtUTNqqeon4jXMyjQLr1HLSIcYZnhNWl
 OLwRA7GB9Ybuw==
Date: Mon, 26 Aug 2024 20:03:54 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Abhishek Tamboli <abhishektamboli9@gmail.com>
Cc: kernel@puri.sm, neil.armstrong@linaro.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 quic_jesszhan@quicinc.com, skhan@linuxfoundation.org, rbmarliere@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panel: mantix: Transition to multi-context write
 sequence
Message-ID: <ZszDipyk1Ey8M0JZ@qwark.sigxcpu.org>
References: <20240826160328.12685-1-abhishektamboli9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826160328.12685-1-abhishektamboli9@gmail.com>
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

Hi Abhishektamboli,

I think this was already handled in

https://lore.kernel.org/dri-devel/20240820091556.1032726-2-tejasvipin76@gmail.com/

and applied

https://lore.kernel.org/dri-devel/172414629205.2571141.13215409630895562248.b4-ty@linaro.org/#t

Cheers,
 -- Guido

On Mon, Aug 26, 2024 at 09:33:28PM +0530, Abhishek Tamboli wrote:
> Replace deprecated 'mipi_dsi_generic_write_seq()' macro
> to 'mipi_dsi_generic_write_seq_multi()' macro in mantix_init_sequence
> function.
> 
> Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> ---
>  .../gpu/drm/panel/panel-mantix-mlaf057we51.c  | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> index ea4a6bf6d35b..f276c65cc9bb 100644
> --- a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> +++ b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> @@ -49,22 +49,25 @@ static int mantix_init_sequence(struct mantix *ctx)
>  {
>  	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
>  	struct device *dev = ctx->dev;
> +	struct mipi_dsi_multi_context dsi_ctx = {
> +		.dsi = dsi
> +	};
> 
>  	/*
>  	 * Init sequence was supplied by the panel vendor.
>  	 */
> -	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A);
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A);
> 
> -	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_INT_CANCEL, 0x03);
> -	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A, 0x03);
> -	mipi_dsi_generic_write_seq(dsi, 0x80, 0xA9, 0x00);
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MANTIX_CMD_INT_CANCEL, 0x03);
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A, 0x03);
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x80, 0xA9, 0x00);
> 
> -	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A, 0x09);
> -	mipi_dsi_generic_write_seq(dsi, 0x80, 0x64, 0x00, 0x64, 0x00, 0x00);
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A, 0x09);
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x80, 0x64, 0x00, 0x64, 0x00, 0x00);
>  	msleep(20);
> 
> -	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_SPI_FINISH, 0xA5);
> -	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x00, 0x2F);
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MANTIX_CMD_SPI_FINISH, 0xA5);
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x00, 0x2F);
>  	msleep(20);
> 
>  	dev_dbg(dev, "Panel init sequence done\n");
> --
> 2.34.1
> 
