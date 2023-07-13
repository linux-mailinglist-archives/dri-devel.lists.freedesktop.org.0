Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2689751DF4
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 11:58:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D658C10E665;
	Thu, 13 Jul 2023 09:58:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8BD810E663
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 09:57:57 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 0B14B6600357;
 Thu, 13 Jul 2023 10:57:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1689242275;
 bh=OsUnMN6xFiwrV7MDZ1vBbrbeI1v6NYM0LSL5IWTwHcM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SNQNnZ6fjqW2a8RkQbknz/F5AJEifndAUx3dkB1acOVunO6VwvjbSXZmA+FHrYVrH
 EgBp50wIa4pmmHmSPpzpJD2RrH0ECOAbqhAA9y4lmYyywVQ4y3gR5BCNGb+SMY/Nc7
 NOA30epCygncCV0X+8H5mys+IB3T0Xn29cZ5Whf9Zp67M5LqpbkmuUEJpe9X9sksmA
 GmG/pR151JylpupTiQE46AoBRUIpABhLgg+lrtsyebZz5rdnM4bgepXeO5AvYW0+6U
 pdSI93jTmQdlJg14ArCh32CxU08sdszdwxzqpRtlQuk9t7e2VqynT9fq9OgEwuoehH
 Vn6nnqYOIoXJg==
Message-ID: <f6d01998-b469-99d3-48ed-0360c9378af5@collabora.com>
Date: Thu, 13 Jul 2023 11:57:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5 00/10] MediaTek DisplayPort: support eDP and aux-bus
To: Chen-Yu Tsai <wenst@chromium.org>
References: <20230713090152.140060-1-angelogioacchino.delregno@collabora.com>
 <CAGXv+5FFO3pDM=2eDscGnRVj34+8t6L02nt7OvPEO_FV8_POVQ@mail.gmail.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5FFO3pDM=2eDscGnRVj34+8t6L02nt7OvPEO_FV8_POVQ@mail.gmail.com>
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
Cc: chunkuang.hu@kernel.org, nfraprado@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 13/07/23 11:54, Chen-Yu Tsai ha scritto:
> On Thu, Jul 13, 2023 at 5:01 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Changes in v5:
>>   - Added .wait_hpd_asserted() callback for aux-bus
>>   - Avoid enabling and registering HPD interrupt + handlers for
>>     eDP case only (keeps HPD interrupts enabled for full DP case)
>>   - Support not always-on eDP panels (boot with regulator off,
>>     suspend with regulator off) for power saving in PM suspend.
> 
> This still doesn't work when the DRM driver is builtin, and the panel
> driver is a module. This is still with regulator-always-on.
> 
>  From what I can tell from the kernel logs, the DRM driver is not waiting
> for eDP panel to probe (which sort of makes sense?), and simply uses
> the default EDID. When the panel does probe, nothing triggers the DRM
> driver to update its connector.
> 
> [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:32:eDP-1]
> [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:32:eDP-1]
> status updated from unknown to connected
> [drm:drm_mode_debug_printmodeline] Modeline "640x480": 60 25175 640
> 656 752 800 480 490 492 525 0x40 0xa
> [drm:drm_mode_prune_invalid] Not using 640x480 mode: CLOCK_HIGH
> [drm:drm_mode_debug_printmodeline] Modeline "800x600": 56 36000 800
> 824 896 1024 600 601 603 625 0x40 0x5
> [drm:drm_mode_prune_invalid] Not using 800x600 mode: CLOCK_HIGH
> [drm:drm_mode_debug_printmodeline] Modeline "800x600": 60 40000 800
> 840 968 1056 600 601 605 628 0x40 0x5
> [drm:drm_mode_prune_invalid] Not using 800x600 mode: CLOCK_HIGH
> [drm:drm_mode_debug_printmodeline] Modeline "848x480": 60 33750 848
> 864 976 1088 480 486 494 517 0x40 0x5
> [drm:drm_mode_prune_invalid] Not using 848x480 mode: CLOCK_HIGH
> [drm:drm_mode_debug_printmodeline] Modeline "1024x768": 60 65000 1024
> 1048 1184 1344 768 771 777 806 0x40 0xa
> [drm:drm_mode_prune_invalid] Not using 1024x768 mode: CLOCK_HIGH
> [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:34:DP-1]
> [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:34:DP-1]
> status updated from unknown to disconnected
> [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:34:DP-1] disconnected
> [drm:drm_client_modeset_probe] No connectors reported connected with modes
> [drm:drm_client_modeset_probe] connector 32 enabled? yes
> [drm:drm_client_modeset_probe] connector 34 enabled? no
> [drm:drm_client_firmware_config.constprop.0.isra.0] Not using firmware
> configuration
> [drm:drm_client_modeset_probe] looking for cmdline mode on connector 32
> [drm:drm_client_modeset_probe] looking for preferred mode on connector 32 0
> [drm:drm_client_modeset_probe] found mode none
> [drm:drm_client_modeset_probe] picking CRTCs for 4096x4096 config
> mediatek-drm mediatek-drm.12.auto:
> [drm:__drm_fb_helper_initial_config_and_unlock] test CRTC 0 primary
> plane
> mediatek-drm mediatek-drm.12.auto: [drm] Cannot find any crtc or sizes
> mediatek-drm mediatek-drm.12.auto: [drm:drm_dp_dpcd_probe] aux_mtk_dp:
> 0x00000 AUX -> (ret=  1) 14
> mediatek-drm mediatek-drm.12.auto: [drm:drm_dp_dpcd_read] aux_mtk_dp:
> 0x00000 AUX -> (ret= 15) 14 0a 84 41 00 00 01 80 02 00 00 00 0f 09 80
> mediatek-drm mediatek-drm.12.auto: [drm:drm_dp_dpcd_probe] aux_mtk_dp:
> 0x00000 AUX -> (ret=  1) 14
> mediatek-drm mediatek-drm.12.auto: [drm:drm_dp_dpcd_read] aux_mtk_dp:
> 0x02200 AUX -> (ret= 15) 14 0a 84 41 00 00 01 80 02 00 00 00 0f 01 80
> mediatek-drm mediatek-drm.12.auto: [drm:drm_dp_read_dpcd_caps]
> aux_mtk_dp: Base DPCD: 14 0a 84 41 00 00 01 80 02 00 00 00 0f 09 80
> mediatek-drm mediatek-drm.12.auto: [drm:drm_dp_read_dpcd_caps]
> aux_mtk_dp: DPCD: 14 0a 84 41 00 00 01 80 02 00 00 00 0f 01 80
> mediatek-drm mediatek-drm.12.auto: [drm:drm_dp_dpcd_probe] aux_mtk_dp:
> 0x00000 AUX -> (ret=  1) 14
> mediatek-drm mediatek-drm.12.auto: [drm:drm_dp_dpcd_read] aux_mtk_dp:
> 0x00021 AUX -> (ret=  1) 00
> panel-simple-dp-aux aux-1c500000.edp-tx: Detected BOE NE135FBM-N41 v8.1 (0x095f)
> 
> If the panel is also built-in, then the eDP panel probe happens between
> the drm driver adding components and binding to them, and everything seems
> to work OK.
> 

Argh. I actually forgot to test that case. Sorry about that.

Anyway, you don't need regulator-always-on anymore, nor regulator-boot-on...
...I'll recheck with panel-edp as module and fix.

Cheers,
Angelo

> 
> ChenYu
> 
>> Changes in v4:
>>   - Set data lanes to idle to prevent stalls if bootloader didn't
>>     properly close the eDP port
>>   - Now using the .done_probing() callback for AUX bus to prevent
>>     probe deferral loops in case the panel-edp driver is a module
>>     as previously seen with another bridge driver (ANX7625) on
>>     some other SoCs (MT8192 and others)
>>   - Rebased over next-20230706
>>   - Dropped Chen-Yu's T-b tag on last patch as some logic changed
>>     (before, I wasn't using the .done_probing() callback).
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
>>
>> pp3300_disp_x: regulator-pp3300-disp-x {
>>          compatible = "regulator-fixed";
>>          regulator-name = "pp3300_disp_x";
>>          regulator-min-microvolt = <3300000>;
>>          regulator-max-microvolt = <3300000>;
>>          enable-active-high;
>>          gpio = <&pio 55 GPIO_ACTIVE_HIGH>;
>>          pinctrl-names = "default";
>>          pinctrl-0 = <&panel_fixed_pins>;
>> };
>>
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
>> AngeloGioacchino Del Regno (10):
>>    drm/mediatek: dp: Move AUX and panel poweron/off sequence to function
>>    drm/mediatek: dp: Change logging to dev for mtk_dp_aux_transfer()
>>    drm/mediatek: dp: Use devm variant of drm_bridge_add()
>>    drm/mediatek: dp: Move AUX_P0 setting to
>>      mtk_dp_initialize_aux_settings()
>>    drm/mediatek: dp: Enable event interrupt only when bridge attached
>>    drm/mediatek: dp: Avoid mutex locks if audio is not supported/enabled
>>    drm/mediatek: dp: Move PHY registration to new function
>>    drm/mediatek: dp: Add support for embedded DisplayPort aux-bus
>>    drm/mediatek: dp: Add .wait_hpd_asserted() for AUX bus
>>    drm/mediatek: dp: Don't register HPD interrupt handler for eDP case
>>
>>   drivers/gpu/drm/mediatek/Kconfig  |   1 +
>>   drivers/gpu/drm/mediatek/mtk_dp.c | 335 ++++++++++++++++++++----------
>>   2 files changed, 224 insertions(+), 112 deletions(-)
>>
>> --
>> 2.40.1
>>
> 

