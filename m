Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C996972AE8A
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jun 2023 22:07:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2B2510E086;
	Sat, 10 Jun 2023 20:07:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod2-cph3.one.com
 (mailrelay1-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:400::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4E9310E086
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jun 2023 20:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=vNLOnFr3fB+dinB0faKYzau3ZDNdEJ6+XHNH0SBMIYY=;
 b=m+VFkNXkLpiSWuEPyBuyml1EjHkvwSGXVtzZu+pS09erEM5h1yuTRl/O4ZfOOitG4TSLk2LaFOpMj
 NXL8zHkTZ10lpzLQJFEHWcLLBq9/1ehiyN01/592xyPV3zZD9mdn4dfJbnwzURtqQJ/2Loof8XiFSx
 oMs+GePPnWcghALYjjDvl8XY9gTgglG0LEIi0XmqWhCKxI2qfiCXoGdQRpZ5GopBNyskw3yj5ON+En
 p2T/KPdalaOrTTJmi8n6lodliqZ+HY0qBNQawXDs6GVZ6vc3tuehrPuBEub4dbeKX+jt2FZmsIwKVn
 C21frQwuViqyUvx/ceNyaLwhB/Fwf1Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=vNLOnFr3fB+dinB0faKYzau3ZDNdEJ6+XHNH0SBMIYY=;
 b=ZNODsH1372gMopyDwehhgK6QRMUN2EOI3xx9Z63PB5adc/N3vz01derHgDw3ZL1Ew0whblaCKtiJf
 4B4iBUQCA==
X-HalOne-ID: 5a4f9149-07ca-11ee-b3ad-99461c6a3fe8
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1 (Halon) with ESMTPSA
 id 5a4f9149-07ca-11ee-b3ad-99461c6a3fe8;
 Sat, 10 Jun 2023 20:06:59 +0000 (UTC)
Date: Sat, 10 Jun 2023 22:06:58 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 1/7] drm/panel: sitronix-st7789v: Prevent core spi warnings
Message-ID: <20230610200658.GB1041001@ravnborg.org>
References: <20230609145951.853533-1-miquel.raynal@bootlin.com>
 <20230609145951.853533-2-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230609145951.853533-2-miquel.raynal@bootlin.com>
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
Cc: devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 09, 2023 at 04:59:45PM +0200, Miquel Raynal wrote:
> The spi core warns us about using an of_device_id table without a
> spi_device_id table aside for module utilities in orter to not rely on
> OF modaliases. Just add this table using the device name without the
> vendor prefix (as it is usually done).
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> index bbc4569cbcdc..c67b9adb157f 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> @@ -400,9 +400,16 @@ static const struct of_device_id st7789v_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, st7789v_of_match);
>  
> +static const struct spi_device_id st7789v_ids[] = {
> +	{ "st7789v", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(spi, st7789v_ids);
> +
>  static struct spi_driver st7789v_driver = {
>  	.probe = st7789v_probe,
>  	.remove = st7789v_remove,
> +	.id_table = st7789v_ids,
>  	.driver = {
>  		.name = "st7789v",
>  		.of_match_table = st7789v_of_match,
> -- 
> 2.34.1
