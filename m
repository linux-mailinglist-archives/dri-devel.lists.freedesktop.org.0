Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1726D9173
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 10:25:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5A0A10EB22;
	Thu,  6 Apr 2023 08:25:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8204B10EB22
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 08:25:29 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 97A4D66031BB;
 Thu,  6 Apr 2023 09:25:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1680769526;
 bh=HGttVBIYMIvKIIUpkbznYW0QnoXaVAXMe4WzNLSPBLg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Xt6rgnD63RGe7sgBPSqFUIKo+/Wp12HvHWXjcq0oagnHoaTyrJpBsIrGdR9ejX7X2
 Zy/LQrBTPstDPFCHaeyPUByuYSiOIwzZxUxfypMTRo7ew7GncNH1h227Nkhwh8BxQ0
 vatX+S0llKIGpW8GNdmzR1sFBHfy7cXg53CWIa//hQ4UWoGarJwh2/ti1qdk5ZpxCk
 +ZGBqgCBlpoOGslTiHXyHDda4/K02De1P0Eoxs6M7LqZV/cwTWSj40oL3CMHhcjBRH
 IXv21/TzheL7l3hAGYbV/ErNVgBOFpN7Dq7ijehYfhzbqku1VM3niOmhp+TQgb1Eo6
 hiKxBqKiVX46w==
Message-ID: <46a65c4b-4407-d19a-0e4b-6ceab97d8e64@collabora.com>
Date: Thu, 6 Apr 2023 10:25:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v3 0/9] MediaTek DisplayPort: support eDP and aux-bus
To: Chen-Yu Tsai <wenst@chromium.org>
References: <20230404104800.301150-1-angelogioacchino.delregno@collabora.com>
 <CAGXv+5FEEkMg+SY7ZkSHN2G9jtT6TBiN9MadZmYGMX_uVi5=gQ@mail.gmail.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5FEEkMg+SY7ZkSHN2G9jtT6TBiN9MadZmYGMX_uVi5=gQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: chunkuang.hu@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 06/04/23 09:20, Chen-Yu Tsai ha scritto:
> On Tue, Apr 4, 2023 at 6:48 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Changes in v3:
>>   - Added DPTX AUX block initialization before trying to communicate
>>     to stop relying on the bootloader keeping it initialized before
>>     booting Linux.
>>   - Fixed commit description for patch [09/09] and removed commented
>>     out code (that slipped from dev phase.. sorry!).
>>
>> This series adds "real" support for eDP in the mtk-dp DisplayPort driver.
>>
>> Explaining the "real":
>> Before this change, the DisplayPort driver did support eDP to some
>> extent, but it was treating it entirely like a regular DP interface
>> which is partially fine, after all, embedded DisplayPort *is* actually
>> DisplayPort, but there might be some differences to account for... and
>> this is for both small performance improvements and, more importantly,
>> for correct functionality in some systems.
>>
>> Functionality first:
>>
>> One of the common differences found in various boards implementing eDP
>> and machines using an eDP panel is that many times the HPD line is not
>> connected. This *must* be accounted for: at startup, this specific IP
>> will raise a HPD interrupt (which should maybe be ignored... as it does
>> not appear to be a "real" event...) that will make the eDP panel to be
>> detected and to actually work but, after a suspend-resume cycle, there
>> will be no HPD interrupt (as there's no HPD line in my case!) producing
>> a functionality issue - specifically, the DP Link Training fails because
>> the panel doesn't get powered up, then it stays black and won't work
>> until rebooting the machine (or removing and reinserting the module I
>> think, but I haven't tried that).
>>
>> Now for.. both:
>> eDP panels are *e*DP because they are *not* removable (in the sense that
>> you can't unplug the cable without disassembling the machine, in which
>> case, the machine shall be powered down..!): this (correct) assumption
>> makes us able to solve some issues and to also gain a little performance
>> during PM operations.
>>
>> What was done here is:
>>   - Caching the EDID if the panel is eDP: we're always going to read the
>>     same data everytime, so we can just cache that (as it's small enough)
>>     shortening PM resume times for the eDP driver instance;
>>   - Always return connector_status_connected if it's eDP: non-removable
>>     means connector_status_disconnected can't happen during runtime...
>>     this also saves us some time and even power, as we won't have to
>>     perform yet another power cycle of the HW;
>>   - Added aux-bus support!
>>     This makes us able to rely on panel autodetection from the EDID,
>>     avoiding to add more and more panel timings to panel-edp and, even
>>     better, allowing to use one panel node in devicetrees for multiple
>>     variants of the same machine since, at that point, it's not important
>>     to "preventively know" what panel we have (eh, it's autodetected...!).
>>
>> This was tested on a MT8195 Cherry Tomato Chromebook (panel-edp on aux-bus)
>>
>>
>> P.S.: For your own testing commodity, here's a reference devicetree:
>> &edp_tx {
>>          status = "okay";
>>
>>          pinctrl-names = "default";
>>          pinctrl-0 = <&edptx_pins_default>;
>>
>>          ports {
>>                  #address-cells = <1>;
>>                  #size-cells = <0>;
>>
>>                  port@0 {
>>                          reg = <0>;
>>                          edp_in: endpoint {
>>                                  remote-endpoint = <&dp_intf0_out>;
>>                          };
>>                  };
>>
>>                  port@1 {
>>                          reg = <1>;
>>                          edp_out: endpoint {
>>                                  data-lanes = <0 1 2 3>;
>>                                  remote-endpoint = <&panel_in>;
>>                          };
>>                  };
>>          };
>>
>>          aux-bus {
>>                  panel: panel {
>>                          compatible = "edp-panel";
>>                          power-supply = <&pp3300_disp_x>;
>>                          backlight = <&backlight_lcd0>;
>>                          port {
>>                                  panel_in: endpoint {
>>                                          remote-endpoint = <&edp_out>;
>>                                  };
>>                          };
>>                  };
>>          };
>> };
>>
>> AngeloGioacchino Del Regno (9):
>>    drm/mediatek: dp: Cache EDID for eDP panel
>>    drm/mediatek: dp: Move AUX and panel poweron/off sequence to function
>>    drm/mediatek: dp: Always return connected status for eDP in .detect()
>>    drm/mediatek: dp: Always set cable_plugged_in at resume for eDP panel
>>    drm/mediatek: dp: Change logging to dev for mtk_dp_aux_transfer()
>>    drm/mediatek: dp: Enable event interrupt only when bridge attached
>>    drm/mediatek: dp: Use devm variant of drm_bridge_add()
>>    drm/mediatek: dp: Move AUX_P0 setting to
>>      mtk_dp_initialize_aux_settings()
>>    drm/mediatek: dp: Add support for embedded DisplayPort aux-bus
> 
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> 
> on MT8195 Tomato: eDP panel works if the display panel regulator is always
> on. External DP works.
> 
> Maybe it has something to do with the driver not supporting .wait_hpd_asserted
> and not using a GPIO for HPD?

Even before this change I couldn't get the panel to reliably work without keeping 
the regulator always on (just to point out that I'm not introducing regressions).

I am already trying to understand why this happens... and I'm still researching...
but there's what I've seen for now:
  * Set the panel regulator as regulator-boot-on;
  * Boot: edp-panel will correctly read the EDID, then will run the PM suspend
    handler
  * mtk-dp's .get_edid() callback gets called but, at that time, edp-panel will
    still be suspended (PM resume handler didn't get called)
    * Regulator is still down
  * Failure.

That's not right and probably the .get_edid() callback in mtk-dp has an abuse:
there, mtk_dp_parse_capabilities() gets called, which performs initialization
of some variables for DP link training (essential to get the DP going!).

The question that I am making to myself is whether I should move that elsewhere,
if so, what's the right place (making me able to remove the DRM_BRIDGE_OP_EDID
bridge flag when eDP + aux-bus), or if I should leave that and make sure that the
panel-edp's resume callback is called before .get_edid() from mtk-dp gets called.

That can get done in a separated series (or single patch?)... so that if we get
this one picked sooner than later, we can start upstreaming the panel nodes in
the Cherry devicetrees and only remove the regulator-always-on later.

Thoughts?

Cheers,
Angelo
