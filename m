Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4FAAB1778
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 16:32:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2227410E26D;
	Fri,  9 May 2025 14:32:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3858E10E26D
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 14:32:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B67FF1595;
 Fri,  9 May 2025 07:31:58 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 041953F5A1;
 Fri,  9 May 2025 07:32:06 -0700 (PDT)
Date: Fri, 9 May 2025 15:32:04 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ryan@testtoast.com,
 macromorgan@hotmail.com, p.zabel@pengutronix.de, tzimmermann@suse.de,
 maarten.lankhorst@linux.intel.com, simona@ffwll.ch, airlied@gmail.com,
 mripard@kernel.org, samuel@sholland.org, jernej.skrabec@gmail.com,
 wens@csie.org, conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH V9 23/24] arm64: dts: allwinner: rg35xx: Add GPIO
 backlight control
Message-ID: <20250509153204.05317413@donnerap.manchester.arm.com>
In-Reply-To: <20250507201943.330111-24-macroalpha82@gmail.com>
References: <20250507201943.330111-1-macroalpha82@gmail.com>
 <20250507201943.330111-24-macroalpha82@gmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Wed,  7 May 2025 15:19:42 -0500
Chris Morgan <macroalpha82@gmail.com> wrote:

Hi Chris,

> From: Chris Morgan <macromorgan@hotmail.com>
> 
> The LCD backlight for this device can be exposed as a simple GPIO-
> controlled device. It would be more accurately modelled using PWM to
> enable brightness control, however the PWM driver design for the H616 is
> not yet upstreamed.

I don't think this is right then: First there should be no notion of a
"driver being upstreamed" in a *DT* patch, as "the driver" is a Linux
speciality, which the DT itself doesn't care about.
And secondly we should not chicken out and go with an interim solution.

So I guess we need to wait for the PWM binding to appear.

Cheers,
Andre

> Add a GPIO backlight node to the DTS.
> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  .../boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> index 7e17ca07892d..95f2ae04bd95 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> @@ -21,6 +21,12 @@ aliases {
>  		serial0 = &uart0;
>  	};
>  
> +	backlight: backlight {
> +		compatible = "gpio-backlight";
> +		gpios = <&pio 3 28 GPIO_ACTIVE_HIGH>; // PD28
> +		default-on;
> +	};
> +
>  	battery: battery {
>  		compatible = "simple-battery";
>  		constant-charge-current-max-microamp = <1024000>;

