Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B157155B2
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 08:52:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C6210E347;
	Tue, 30 May 2023 06:52:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CFAF10E347
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 06:52:11 +0000 (UTC)
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown
 [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 963C26602121;
 Tue, 30 May 2023 07:52:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1685429529;
 bh=N8OkzhPbnw0+40Fz41gVmzeKRGnKSGVpRy8eQG6Dhe0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DsjbEEDYb6sQm2KmN8lx+MXTGsmD7ysu8OPxeix+Z7dbDRfFqFCg10dW31jzqS+jc
 Yf+PEH1RhH3gc+fy5+J5wVo4kCAAyHvzHRG+noVAH2tLAXbCN6okBtpqpm8zU5wRcM
 FxN0P36++oARF0aDjW7zqT6OGh/z9KT136VnDWnJcko9cNRv6HF4uNgHEKHcLEc+IS
 8TyFus8AnLksrpvht836lhiC0V07ELlBtNhE7nVRDwAW8/792+umDMDxxJndROySJB
 Ujj5nznzEd13IH84WupL7U+ExkkQjwesz/hdeVBONoifMFurvc+oCEdMvh24EaAOfM
 /CFzQ7gWu6ZkQ==
Message-ID: <6d870923-ce25-08f6-c3aa-453a4737953b@collabora.com>
Date: Tue, 30 May 2023 08:52:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 0/9] MediaTek DisplayPort: support eDP and aux-bus
Content-Language: en-US
To: chunkuang.hu@kernel.org
References: <20230404104800.301150-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230404104800.301150-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, wenst@chromium.org, matthias.bgg@gmail.com,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 04/04/23 12:47, AngeloGioacchino Del Regno ha scritto:

Hello CK,

Gentle ping for this series.

Thanks,
Angelo

> Changes in v3:
>   - Added DPTX AUX block initialization before trying to communicate
>     to stop relying on the bootloader keeping it initialized before
>     booting Linux.
>   - Fixed commit description for patch [09/09] and removed commented
>     out code (that slipped from dev phase.. sorry!).
> 
> This series adds "real" support for eDP in the mtk-dp DisplayPort driver.
> 
> Explaining the "real":
> Before this change, the DisplayPort driver did support eDP to some
> extent, but it was treating it entirely like a regular DP interface
> which is partially fine, after all, embedded DisplayPort *is* actually
> DisplayPort, but there might be some differences to account for... and
> this is for both small performance improvements and, more importantly,
> for correct functionality in some systems.
> 
> Functionality first:
> 
> One of the common differences found in various boards implementing eDP
> and machines using an eDP panel is that many times the HPD line is not
> connected. This *must* be accounted for: at startup, this specific IP
> will raise a HPD interrupt (which should maybe be ignored... as it does
> not appear to be a "real" event...) that will make the eDP panel to be
> detected and to actually work but, after a suspend-resume cycle, there
> will be no HPD interrupt (as there's no HPD line in my case!) producing
> a functionality issue - specifically, the DP Link Training fails because
> the panel doesn't get powered up, then it stays black and won't work
> until rebooting the machine (or removing and reinserting the module I
> think, but I haven't tried that).
> 
> Now for.. both:
> eDP panels are *e*DP because they are *not* removable (in the sense that
> you can't unplug the cable without disassembling the machine, in which
> case, the machine shall be powered down..!): this (correct) assumption
> makes us able to solve some issues and to also gain a little performance
> during PM operations.
> 
> What was done here is:
>   - Caching the EDID if the panel is eDP: we're always going to read the
>     same data everytime, so we can just cache that (as it's small enough)
>     shortening PM resume times for the eDP driver instance;
>   - Always return connector_status_connected if it's eDP: non-removable
>     means connector_status_disconnected can't happen during runtime...
>     this also saves us some time and even power, as we won't have to
>     perform yet another power cycle of the HW;
>   - Added aux-bus support!
>     This makes us able to rely on panel autodetection from the EDID,
>     avoiding to add more and more panel timings to panel-edp and, even
>     better, allowing to use one panel node in devicetrees for multiple
>     variants of the same machine since, at that point, it's not important
>     to "preventively know" what panel we have (eh, it's autodetected...!).
> 
> This was tested on a MT8195 Cherry Tomato Chromebook (panel-edp on aux-bus)
> 
> 
> P.S.: For your own testing commodity, here's a reference devicetree:
> &edp_tx {
> 	status = "okay";
> 
> 	pinctrl-names = "default";
> 	pinctrl-0 = <&edptx_pins_default>;
> 
> 	ports {
> 		#address-cells = <1>;
> 		#size-cells = <0>;
> 
> 		port@0 {
> 			reg = <0>;
> 			edp_in: endpoint {
> 				remote-endpoint = <&dp_intf0_out>;
> 			};
> 		};
> 
> 		port@1 {
> 			reg = <1>;
> 			edp_out: endpoint {
> 				data-lanes = <0 1 2 3>;
> 				remote-endpoint = <&panel_in>;
> 			};
> 		};
> 	};
> 
> 	aux-bus {
> 		panel: panel {
> 			compatible = "edp-panel";
> 			power-supply = <&pp3300_disp_x>;
> 			backlight = <&backlight_lcd0>;
> 			port {
> 				panel_in: endpoint {
> 					remote-endpoint = <&edp_out>;
> 				};
> 			};
> 		};
> 	};
> };
> 
> AngeloGioacchino Del Regno (9):
>    drm/mediatek: dp: Cache EDID for eDP panel
>    drm/mediatek: dp: Move AUX and panel poweron/off sequence to function
>    drm/mediatek: dp: Always return connected status for eDP in .detect()
>    drm/mediatek: dp: Always set cable_plugged_in at resume for eDP panel
>    drm/mediatek: dp: Change logging to dev for mtk_dp_aux_transfer()
>    drm/mediatek: dp: Enable event interrupt only when bridge attached
>    drm/mediatek: dp: Use devm variant of drm_bridge_add()
>    drm/mediatek: dp: Move AUX_P0 setting to
>      mtk_dp_initialize_aux_settings()
>    drm/mediatek: dp: Add support for embedded DisplayPort aux-bus
> 
>   drivers/gpu/drm/mediatek/mtk_dp.c | 186 +++++++++++++++++++-----------
>   1 file changed, 116 insertions(+), 70 deletions(-)
> 

