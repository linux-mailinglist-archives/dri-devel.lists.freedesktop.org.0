Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFD323A0D1
	for <lists+dri-devel@lfdr.de>; Mon,  3 Aug 2020 10:21:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B6E892F6;
	Mon,  3 Aug 2020 08:20:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-out.m-online.net (mail-out.m-online.net
 [IPv6:2001:a60:0:28:0:1:25:1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C09C56E213
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Aug 2020 07:23:14 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4BKq9V5zt9z1rtjS;
 Mon,  3 Aug 2020 09:23:10 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4BKq9V4bqgz1r17V;
 Mon,  3 Aug 2020 09:23:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id AQdAicsk8cKc; Mon,  3 Aug 2020 09:23:09 +0200 (CEST)
X-Auth-Info: VbxUOCNC5k0FCeyHUUC65DDgP9aDNWXtdyTiPutvOXc=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon,  3 Aug 2020 09:23:09 +0200 (CEST)
Subject: Re: [RFC][PATCH] regulator: rpi-panel: Add regulator/backlight driver
 for RPi panel
To: Mark Brown <broonie@kernel.org>
References: <20200729214645.247185-1-marex@denx.de>
 <20200730155944.GA1477410@ravnborg.org>
 <87447ebd-2838-c6bb-1dd4-28104f09dbb9@denx.de>
 <20200730191300.GJ5055@sirena.org.uk>
 <5cfc1d07-c8ce-47d7-8763-1efa0316d05a@denx.de>
 <20200801011653.GD4510@sirena.org.uk>
From: Marek Vasut <marex@denx.de>
Message-ID: <20116f3c-64d7-0f52-b38a-56c62398a5e9@denx.de>
Date: Mon, 3 Aug 2020 09:21:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200801011653.GD4510@sirena.org.uk>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 03 Aug 2020 08:20:37 +0000
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
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/1/20 3:16 AM, Mark Brown wrote:
> On Thu, Jul 30, 2020 at 09:37:48PM +0200, Marek Vasut wrote:
>> On 7/30/20 9:13 PM, Mark Brown wrote:
>>> On Thu, Jul 30, 2020 at 06:28:07PM +0200, Marek Vasut wrote:
> 
>>>> about it ? I can over-complicate this and split it into multiple
>>>> drivers, but I don't think it's worth the complexity, considering that
>>>> this is likely a one-off device which will never be re-used elsewhere,
>>>> except on this one particular display module for RPi.
> 
>>> Now you've written that you've pretty much guaranteed someone's going to
>>> use the same component elsewhere :)
> 
>> How? The firmware is closed and not available, neither is documentation
>> for it, sadly.
> 
> Companies often find other markets for their one off things, the
> original RPi is a great example of this!

I suspect the firmware in this ATTINY88 is written specifically for this
board, so I doubt re-use in its current form will happen. If there is
ever another display board, the firmware will likely be different to
match the new board. But that's all pure speculation.

>>> I don't 100% follow how this would actually get used in a
>>> system (perhaps the binding would help) but for these things if there's
>>> only one tightly coupled user that's possible it's sometimes simpler to
>>> just skip APIs and do things directly.
> 
>> That's what I'm trying to replace by this patch and tc358762 bridge
>> driver and panel driver, the combined version is already in tree:
>> drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
>> but the tc358762 is clearly a generic bridge and the panel is generic
>> too, so combining it into one panel driver doesn't seem right.
> 
> I see, so this is the remaining bits.  Perhaps the binding might help me
> see how things fit together - I don't know anything about the system
> really.  It's not doing anything that looks like it should cause the
> framework too many problems so I'm not overly worried from that point of
> view but equally well it's obviously not ideal.

See below:

/ {
  panel: panel {
    compatible = "powertip,ph800480t013-idf02";
    power-supply = <&attiny>;
    backlight = <&attiny>;
    port {
      panel_in: endpoint {
        remote-endpoint = <&bridge_out>;
      };
    };
  };
};

&i2c {
  attiny: regulator@45 {
    compatible = "raspberrypi,7inch-touchscreen-panel-regulator";
    reg = <0x45>;
  };
};

&ltdc {
  status = "okay";

  port {
    ltdc_ep0_out: endpoint@0 {
      reg = <0>;
      remote-endpoint = <&dsi_in>;
    };
  };
};

&dsi {
  #address-cells = <1>;
  #size-cells = <0>;
  status = "okay";
  phy-dsi-supply = <&reg18>;

  bridge@0 {
    compatible = "toshiba,tc358762";
    reg = <0>;
    vddc-supply = <&attiny>;
    #address-cells = <1>;
    #size-cells = <0>;
    status = "okay";

    ports {
      #address-cells = <1>;
      #size-cells = <0>;

      port@0 {
        reg = <0>;
        bridge_in: endpoint {
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

  ports {
    #address-cells = <1>;
    #size-cells = <0>;

    port@0 {
      reg = <0>;
      dsi_in: endpoint {
        remote-endpoint = <&ltdc_ep0_out>;
      };
    };

    port@1 {
      reg = <1>;
      dsi_out: endpoint {
        remote-endpoint = <&bridge_in>;
      };
    };
  };
};
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
