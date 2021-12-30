Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E40B0481E72
	for <lists+dri-devel@lfdr.de>; Thu, 30 Dec 2021 18:11:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A0110E13B;
	Thu, 30 Dec 2021 17:11:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34A7510E13B
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Dec 2021 17:11:14 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 24D212A5;
 Thu, 30 Dec 2021 18:11:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1640884272;
 bh=2i0Xf3+MqKuDzJ3qo4MKmI3c87rR/zqriiPRHez0XuM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aiVqldI2TWABX/6mPYzPYKzI1nF3DUmu6OnLSODulyBRABjHGL+RZI2ywnWal4Y+Q
 pJnpuxSdGCefFpuWqOa1he6/StifB5lD0qONkkCYN36WDL0Abzl4QsrWtPNEm7HBtM
 /+A2USHDKLGLBwt2lratcXZ2/fjlBbyuABHzfMQE=
Date: Thu, 30 Dec 2021 19:11:11 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a77961: Add lvds0 device node
Message-ID: <Yc3oL5lrUTObye7A@pendragon.ideasonboard.com>
References: <20211224052309.1997096-1-nikita.yoush@cogentembedded.com>
 <20211224052309.1997096-3-nikita.yoush@cogentembedded.com>
 <YcyTV4fJqMHIeyYB@pendragon.ideasonboard.com>
 <87626d61-ada0-c220-bea5-5330f5256629@cogentembedded.com>
 <YcyXQxW3kRqQ2Yv0@pendragon.ideasonboard.com>
 <39f70781-831e-c86a-ec5f-68f2b4bd3d62@cogentembedded.com>
 <Ycy4AMAT53Uzf+K7@pendragon.ideasonboard.com>
 <bb6ef732-7cd2-5ba9-0eef-caf2fbfbf829@cogentembedded.com>
 <Ycze8wzD3Qi8YVAa@pendragon.ideasonboard.com>
 <123e3993-cb71-b6dc-e4f4-4cad1eb51b00@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <123e3993-cb71-b6dc-e4f4-4cad1eb51b00@cogentembedded.com>
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
Cc: devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nikita,

On Thu, Dec 30, 2021 at 08:30:43AM +0300, Nikita Yushchenko wrote:
> >> I'd prefer to make each DT fragment to use only either entities defined in that fragment itself, or
> >> defined "interface entities" between this and "neighbor" DT fragment.
> >>
> >> Such as:
> >> - SoC's DT fragment defines a named port/endpoint to export video stream at
> >> - board's DT fragment defines a named panel node corresponding to panel plugged into board's physical
> >> connector, and connects endpoints with SoC's video export,
> >> - panel's DT fragment extends the panel node from board with video mode information for this particular
> >> panel.
> >> ...
>  >
> > I agree it's annoying, but we'll have a similar problem, just the other
> > way around, with an endpoint defined in the SoC dtsi. Many R-Car SoCs
> > have two LVDS encoders, and you can attach a panel to either of them.
> > Some boards use LVDS0, some boards use LVDS1, and some boards could even
> > use both.
> 
> The case of "some boards use LVDS0, some boards use LVDS1" is directly addressed by what I'm trying to 
> suggest. The per-board DT fragment can completely hide board's connection details, without a need for 
> any new concept.

We could do this by adding a label to the port instead of the endpoint
in the SoC .dtsi.

lvds0: lvds@.... {
	...

	ports {
		port@0 {
			lvds0_in: endpoint {
				remote-endpoint = <&du_out_lvds0>;
			};
		};

		lvds_out_panel_port: port@1 {
		};
};

It would however likely be better do add the label to port@1 in the
board .dts though, as usage of a particular LVDS output is a board
property, not an SoC property.

Then, in the overlay,

panel {
	port {
		panel_in: endpoint {
			remote_endpoint <&lvds_out_panel>;
		};
	};
};

&lvds_out_panel_port {
	lvds_out_panel: endpoint {
		remote-endpoint = <&panel_in>;
	};
};

There's one caveat though: The LVDS DT nodes are disabled in the SoC
.dtsi, so the overlay would need to have

&lvds0 {
	status = "okay";
};

and that would need to reference the correct lvds node. Without
parameterized overlays, I don't think we can solve this issue neatly
(especially given that panels will often have control GPIOs, or
GPIO-controlled regulators, that could be wired to different SoC GPIOs
on different boards).

> The case of "some boards could even use both" indeed needs a some way to parametrize panel's DT 
> fragment, and perhaps load two instances of it with different parameters. To some extent this is doable 
> via preprocessor magic and multiple includes, although this approach has obvious disadvantages.
> 
> > A real solution for this problem will require a new concept. The "DT
> > connector" proposal is related to this problem space. There's also a
> > proprietary implementation in the Rapsberry Pi boot loader of a
> > mechanism to support parametrized overlays ([2] and [3], or [4] for an
> > example of how a panel reset or backlight GPIO can be parametrized).
> 
> So the problem is already recognized for years...  what stops from
> wider adoption of this or similar solutions?

Someone to continue working on it I suppose :-)

> And - if/while that is not being done - can't we at least try to
> follow more portable DT coding pattern while staying within existing
> concepts?

We could use a label for the port node as shown above. It's not a
complete solution, but it may help. I'm not sure how to solve the
enabling of the lvds encoder DT node though.

-- 
Regards,

Laurent Pinchart
