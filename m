Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CB36AB1AA
	for <lists+dri-devel@lfdr.de>; Sun,  5 Mar 2023 19:09:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0471D10E313;
	Sun,  5 Mar 2023 18:09:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7588110E170
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Mar 2023 15:22:51 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 9AFF0240053
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Mar 2023 16:22:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1678029769; bh=HraIK6gm6OETfvcUrxACKDYA3j56egB75Am4rplKIjs=;
 h=Date:From:To:Subject:From;
 b=WWsyMmC++B14sd86/xYTjUuisCEyIQ1ubwEBZws/eTgpTeQeHULGsyU5s55I3hH0d
 pSI+TpPJsqmQ5Fow9Ty/+yJqIAIFqkUWSFm/FUoAI9zU7FNWH7W+BlL8ktaHuPPonA
 v5RWnJcyB3bRKf7Ap+y06+ueNCuOsh/zE9Cly6KhLx4J9vawiQR6mPr/Q5RVjqCRiM
 mjAe8gA0/TxP6F1xz+Ky+mmScpje1vZPqiF07L96DfoBmIOUZgARRjwGMo1uej1Bye
 MX+DzbMxd/Wd4V4eCQQaGZN2GIXZ2FlVeFABCReNnabHcl8t4gf5YXWiLMEVJZGsdY
 934hA8EA9pHPQ==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4PV57D6nbcz6trV
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Mar 2023 16:22:48 +0100 (CET)
Date: Sun,  5 Mar 2023 15:22:48 +0000
From: Patrick Boettcher <patrick.boettcher@posteo.de>
To: dri-devel@lists.freedesktop.org
Subject: IMX8MM: assign panel to mipi_dsi in a device tree
Message-ID: <20230305162248.06ba45ab@yaise-pc1>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sun, 05 Mar 2023 18:09:03 +0000
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

Hi list,

After several days of trying I realize my too small/old brain is unable
to map around how to assign/connect a panel to the mipi_dsi-node in a
device.

We are using a 'tdo,tl070wsh30' panel connected to the
mipi-dsi-interface of a imx8mm.

Of all the references I found on the in public repositories none of
them is using this exact panel. Well.

Looking at other device trees I came up with the following dts-node add
to the mipi_dsi-node:

&mipi_dsi {
	#address-cells = <1>;
	#size-cells = <0>;
	status = "okay";

	port@0 {
		reg = <0>;
		mipi_dsi_panel0_out: endpoint {
			remote-endpoint = <&panel0_in>;
			attach-bridge;
		};
	};

	panel@0 {
		compatible = "tdo,tl070wsh30";
		reg = <0>;

		pinctrl-0 = <&pinctrl_mipi_dsi>;
		pinctrl-names = "default";
		reset-gpios = <&gpio4 4 GPIO_ACTIVE_LOW>;
		enable-gpios = <&gpio4 6 GPIO_ACTIVE_LOW>;

		backlight = <&panel_gpio_backlight>;
		power-supply = <&panel_gpio_regulator>;

		dsi-lanes = <4>;

		video-mode = <0>; 

		panel-width-mm = <157>;
		panel-height-mm = <86>;

		status = "okay";

		port {
			panel0_in: endpoint {
				remote-endpoint =<&mipi_dsi_panel0_out>;
 			};
		};
	};
};


You'll see that I used the attach-bridge-option, which is maybe not
necessary. I found this during a debug-print-session in the
drm-bridge-driver, it wasn't attaching a bridge. But maybe I don't need
a bridge as the panel-driver contains everything to control the
controllers of the panel. I don't really know.

However, with this I have the following messages:

[    0.393985] [drm:drm_bridge_attach] *ERROR* failed to attach bridge /soc@0/bus@32c00000/mipi_dsi@32e10000 to encoder DSI-34: -19
[    0.405626] imx_sec_dsim_drv 32e10000.mipi_dsi: Failed to attach bridge: 32e10000.mipi_dsi
[    0.413974] imx_sec_dsim_drv 32e10000.mipi_dsi: failed to bind sec dsim bridge: -517

The panel driver is never instantiated.

I'm using 5.15.51 (-imx). mipi_dsi and the panel-driver are built into
the kernel.

I have to say that I'm basically trying to imitate the
device-tree-implementation based on example rather than understanding
the exact details of how to correctly work with mipi_dsi and the panel.

I'd appreciate any help and pointers which lead me into the right
direction.

Thanks in advance.

--
Patrick.






