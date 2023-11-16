Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A834C7EE6AB
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 19:25:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A19C710E2B0;
	Thu, 16 Nov 2023 18:25:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 483 seconds by postgrey-1.36 at gabe;
 Thu, 16 Nov 2023 18:25:16 UTC
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49E2210E2B0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 18:25:16 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id DFAA1874AB;
 Thu, 16 Nov 2023 19:17:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1700158629;
 bh=IuFABVM7kZSpA09E94Xi1oNJwlHBKLMQfnPbvM07d+U=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=N+o0AuAr+aMwkfm2WD5clyclPcc0IDkqBU5I1zQcBLgHnOEsruf5aKVq/59ObOCaP
 cdVFl7Db7GsCzK0aXL+OZkfTQxwvnmGqW8u9NkwkUJli580Ozp9WzrnOmjV4Vn7Wq5
 tYDdw+K0/n/YKl7fz7zw1/noecYnSt7fNUyCxG11aKnhdl/El5ZQCrN0ihpSc7yNpA
 DKi8aSrKqcWAIINgxrXiFEo0KWoE8W9roMb+/3lRm2Bjuewoo3SIGWSvOotpyGmiOP
 tvYdj2wDkZrCUWePElaDW821tirWUMHqKJl0iGaOqkp3WBz4KRJ++cHooYavek87UA
 6oKpw6hZvlTRg==
Message-ID: <d85f5c30-3960-4bdd-bff0-32158c1633a5@denx.de>
Date: Thu, 16 Nov 2023 19:17:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/bridge: tc358762: Instruct DSI host to generate
 HSE packets
To: Marc Kleine-Budde <mkl@pengutronix.de>
References: <20230615201902.566182-1-marex@denx.de>
 <20230615201902.566182-3-marex@denx.de>
 <20231116-tarantula-posing-b941e929b40d-mkl@pengutronix.de>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20231116-tarantula-posing-b941e929b40d-mkl@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/16/23 17:06, Marc Kleine-Budde wrote:
> Hey Marek,
> 
> On 15.06.2023 22:19:00, Marek Vasut wrote:
>> This bridge seems to need the HSE packet, otherwise the image is
>> shifted up and corrupted at the bottom. This makes the bridge
>> work with Samsung DSIM on i.MX8MM and i.MX8MP.
> 
> I'm using v6.6 (which includes this series) on an i.MX8MP with the 7inch
> Rspi Panel ("powertip,ph800480t013-idf02"), but I cannot get a stable
> image.
> 
> With an unmodified imx8mp clock tree the lower 1/4 of the image sheers
> to the left.
> 
> With 24.75 MHz on the media_disp1_pix and media_mipi_phy1_ref and 792
> MHz on video_pll1_out, the image is not static, but wobbly and it's
> wrapped around half of the image.
> 
>      video_pll1_ref_sel                1        1        0    24000000          0     0  50000         Y
>         video_pll1                     1        1        0   792000000          0     0  50000         Y
>            video_pll1_bypass           1        1        0   792000000          0     0  50000         Y
>               video_pll1_out           2        2        0   792000000          0     0  50000         Y
>                  media_mipi_phy1_ref       1        1        0    24750000          0     0  50000         Y
>                     media_mipi_phy1_ref_root       0        0        0    24750000          0     0  50000         Y
>                  media_disp2_pix       0        0        0   792000000          0     0  50000         N
>                     media_disp2_pix_root_clk       0        0        0   792000000          0     0  50000         N
>                  media_disp1_pix       1        1        0    24750000          0     0  50000         Y
>                     media_disp1_pix_root_clk       1        1        0    24750000          0     0  50000         Y
> 
> Do you have a working device tree for such a setup? regards, Marc

This seems to be what I used last time I tried (notice the 
samsung,burst-clock-frequency = <720000000>; ), but this was a few 
months ago:

/ {
         panel {
                 compatible = "powertip,ph800480t013-idf02";
                 backlight = <&attiny>;
                 enable-gpio = <&attiny 0 GPIO_ACTIVE_HIGH>;
                 power-supply = <&attiny>;

                 port {
                         panel_in: endpoint {
                                 remote-endpoint = <&bridge_out>;
                         };
                 };
         };
};

&mipi_dsi {
         /*
          * This is DSIM PLL frequency, DSI HS clock lane frequency
          * is half of the "samsung,burst-clock-frequency" value.
          */
         samsung,burst-clock-frequency = <720000000>;
         status = "okay";

         bridge@0 {
                 compatible = "toshiba,tc358762";
                 reg = <0>;
                 vddc-supply = <&attiny>;
                 #address-cells = <1>;
                 #size-cells = <0>;
                 status = "okay";

                 port@0 {
                         reg = <0>;
                         bridge_in: endpoint {
                                 data-lanes = <1>;
                                 remote-endpoint = <&dsi_out>;
                         };
                 };

                 port@1 {
                         reg = <1>;
                         bridge_out: endpoint {
                                 remote-endpoint = <&panel_in>;
                         };
                 };
         };
};

&dsi_out {
         data-lanes = <1>;
         remote-endpoint = <&bridge_in>;
};

&i2cmuxed0 {
         #address-cells = <1>;
         #size-cells = <0>;

         touchscreen: touchscreen@38 {
                 compatible = "edt,edt-ft5406";
                 reg = <0x38>;
                 reset-gpios = <&attiny 1 GPIO_ACTIVE_LOW>;
                 /*
                  * Disabled, since the IRQ line is not on
                  * the FPC cable, so we cannot get touch
                  * IRQs unless its connected otherwise. In
                  * that case, add entry like this one and
                  * enable below.
                  *
                  * interrupt-parent = <&gpiog>;
                  * interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
                  */
                 status = "disabled";
         };

         attiny: regulator@45 {
                 compatible = 
"raspberrypi,7inch-touchscreen-panel-regulator";
                 gpio-controller;
                 #gpio-cells = <2>;
                 reg = <0x45>;
         };
};

&pwm1 {
         status = "okay";
};

&lcdif1 {
         status = "okay";
};

