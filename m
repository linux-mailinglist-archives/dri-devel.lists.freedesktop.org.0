Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 944355393AB
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 17:10:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4ABF10F510;
	Tue, 31 May 2022 15:10:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DCF110F510
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 15:10:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 96F2261338;
 Tue, 31 May 2022 15:10:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DEC4C385A9;
 Tue, 31 May 2022 15:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654009845;
 bh=kcOpjEbcM1P7hxyPfcu7JpujlY9DO0o6QJabWGXyDkY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K9izann2VCWeMlDXb+py3m+WYPzUJJsLMkTTmjQRYc8r8QEctIHfIAv8HArRXWVop
 FwkdlKmqQZIphOhHnnaEL606qAftdn9g/EQSAg3sMaOBPqADxx7rqdVvES2oi2P/Ie
 1494fvP3XMvqxs9SGrSP1YOUWTLTM27enxwg/7jdpzbZIpxuhpJHYyxZf81Fhf+xAm
 eU5CfCZO8hAPY7NsnnmyLgw3w+srwgTKQ1gvM68SW81LIIXBhNaltmmR6Dd2Z2AtIO
 boesLdIsbjPXUG8lCpVIoO8iNrkCykNPEFmXdjVWFr0QS8JGm0y8oz4mom6I/sWMfy
 Cq/eCb1U4Cv/w==
Date: Tue, 31 May 2022 08:10:42 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH] drm/ssd130x: Only define a SPI device ID table when
 built as a module
Message-ID: <YpYv8islaEySOEtg@dev-arch.thelio-3990X>
References: <20220530140246.742469-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220530140246.742469-1-javierm@redhat.com>
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
Cc: kernel test robot <lkp@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 30, 2022 at 04:02:46PM +0200, Javier Martinez Canillas wrote:
> The kernel test robot reports a compile warning due the ssd130x_spi_table
> variable being defined but not used. This happen when ssd130x-spi driver
> is built-in instead of being built as a module, i.e:
> 
>   CC      drivers/gpu/drm/solomon/ssd130x-spi.o
>   AR      drivers/base/firmware_loader/built-in.a
>   AR      drivers/base/built-in.a
>   CC      kernel/trace/trace.o
> drivers/gpu/drm/solomon/ssd130x-spi.c:155:35: warning: ‘ssd130x_spi_table’ defined but not used [-Wunused-const-variable=]
>   155 | static const struct spi_device_id ssd130x_spi_table[] = {
>       |                                   ^~~~~~~~~~~~~~~~~
> 
> The driver shouldn't need a SPI device ID table and only have an OF device
> ID table, but the former is needed to workaround an issue in the SPI core.
> This always reports a MODALIAS of the form "spi:<device>" even for devices
> registered through Device Trees.
> 
> But the table is only needed when the driver built as a module to populate
> the .ko alias info. It's not needed when the driver is built-in the kernel.
> 
> Fixes: 74373977d2ca ("drm/solomon: Add SSD130x OLED displays SPI support")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
>  drivers/gpu/drm/solomon/ssd130x-spi.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/solomon/ssd130x-spi.c b/drivers/gpu/drm/solomon/ssd130x-spi.c
> index 43722adab1f8..07802907e39a 100644
> --- a/drivers/gpu/drm/solomon/ssd130x-spi.c
> +++ b/drivers/gpu/drm/solomon/ssd130x-spi.c
> @@ -143,6 +143,7 @@ static const struct of_device_id ssd130x_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, ssd130x_of_match);
>  
> +#if IS_MODULE(CONFIG_DRM_SSD130X_SPI)
>  /*
>   * The SPI core always reports a MODALIAS uevent of the form "spi:<dev>", even
>   * if the device was registered via OF. This means that the module will not be
> @@ -160,6 +161,7 @@ static const struct spi_device_id ssd130x_spi_table[] = {
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(spi, ssd130x_spi_table);
> +#endif
>  
>  static struct spi_driver ssd130x_spi_driver = {
>  	.driver = {
> -- 
> 2.36.1
> 
