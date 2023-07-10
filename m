Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 328F874CE9E
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 09:38:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DB0C10E1FC;
	Mon, 10 Jul 2023 07:38:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30CAE10E1FC
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 07:38:38 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B81236606FF3;
 Mon, 10 Jul 2023 08:38:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1688974715;
 bh=LOXc+6Sqq2SjuM4ZCBO1k8rnrrk3ScMPXrSUxS0CCuE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=iNE1sJ53UJG7JThYzk3vZyGbX3LodamTt5AcFLXPDLZtowxiXEgaeH4JdralBhJPp
 XugpSEzAqLSOrwg3ORcljgb8vJIk90v8Pc7pny3Z0E6w55h+DHac3pDQbTh70+JZ5f
 si2VcCK0bzBONTIAsWq2tN3LQPXdQ+6bRbxfjIZIpMHBhMTYE9XoTwqJ5utxJsw0v2
 7E8FwkkufVJatjHiJnJ7F8dILMLB8aw4NA7N70ryufi4hprpNePY9XT3k1Kzc8ynmr
 7aI38MKT9IwbuZnla3AwTW5IIK1+OboP8oUG6XXSSX8NvjFdlCzSm3413bLNWRwo7x
 zuJ6z1l/ljQEQ==
Message-ID: <da4847bb-d4b1-7810-3b5f-1200596b19fd@collabora.com>
Date: Mon, 10 Jul 2023 09:38:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 0/9] MediaTek DisplayPort: support eDP and aux-bus
To: Chen-Yu Tsai <wenst@chromium.org>
References: <20230706123025.208408-1-angelogioacchino.delregno@collabora.com>
 <CAGXv+5HzQhoz0OUhifQC0vr44O5VwvuYnsHSA2jK0FjwJT3OBA@mail.gmail.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5HzQhoz0OUhifQC0vr44O5VwvuYnsHSA2jK0FjwJT3OBA@mail.gmail.com>
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

Il 07/07/23 10:23, Chen-Yu Tsai ha scritto:
> On Thu, Jul 6, 2023 at 8:30 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
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
> 
> Do you have panel-edp built as a module? If I have it built in, the panel
> can correctly display stuff. If I have it built as a module, the panel is
> correctly detected, but the panel stays black even if DRM thinks it is
> displaying stuff.
> 

I tested both. I'll recheck on a clean tree just to be sure...

> And it looks like EDID reading and panel power sequencing is still not
> working correctly, i.e. needs regulator-always-on?

Yeah that's still needed with this version, I'm still trying to get *at least*
some support upstreamed before refining it.

Cheers,
Angelo

> 
> ChenYu
> 
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
>>
>>   drivers/gpu/drm/mediatek/mtk_dp.c | 197 +++++++++++++++++++-----------
>>   1 file changed, 127 insertions(+), 70 deletions(-)
>>
>> --
>> 2.40.1
>>



