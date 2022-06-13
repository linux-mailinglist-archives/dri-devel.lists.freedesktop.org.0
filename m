Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D2E54A114
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 23:15:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E57310FA93;
	Mon, 13 Jun 2022 21:15:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C66E110FA93
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 21:15:09 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5953C84339;
 Mon, 13 Jun 2022 23:15:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1655154907;
 bh=bSTFq4rH12sUU6UXLZQbYlh478rm8gjmjbqevUkewho=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=avXafnJXO70oB7bYOObCzqlpequhmL0ss9XF0un1hL7vsbUSrQMSVHNQgjc+/mygo
 6kr4k75Z0QGWq1XApwtYZ/Gsj/CgGl4wX3BOTfSbZlOr3Ow2c42gO0sbEx3xC7jjuf
 wSH54tO6h4Id4M88gwSy1x63h/J1jtCjORGOiEG/r5YkQjBjStePcnRruAlX8HLuDg
 HQWRNVvANWGKliYQyyTWTunt0FkrUPaV4XFE/nfAY5bXs9n5aqVel/PS9IwUJGroeK
 hU/+Q0f6Agm7QgcnbjGWG0+IMv5YljTuwdapCy2jzzEEKrxyERUJP5MEOeyUm22B1r
 VU7DXZpImLH+g==
Message-ID: <c9acc625-5cf5-5a6e-c853-5779289b811a@denx.de>
Date: Mon, 13 Jun 2022 23:15:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 2/2] drm: lcdif: Add support for i.MX8MP LCDIF variant
Content-Language: en-US
To: Alexander Stein <alexander.stein@ew.tq-group.com>
References: <20220519114849.69918-1-marex@denx.de>
 <4403432.LvFx2qVVIh@steina-w> <0bf5532b-f4d9-fbf5-0037-61887fc8512e@denx.de>
 <2893424.e9J7NaK4W3@steina-w>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <2893424.e9J7NaK4W3@steina-w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
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
Cc: Peng Fan <peng.fan@nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 martyn.welch@collabora.com, robert.foss@linaro.org,
 dri-devel@lists.freedesktop.org, Robby Cai <robby.cai@nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/30/22 11:27, Alexander Stein wrote:
> Hi Marek,

Hi,

[...]

> I got this working, somehow. The root cause was that the LDB clock was not the
> media_disp2_pix_root_clk clock * 7, which is mandatory for LVDS (single link).
> 
> excerpt from clk_summary:
> video_pll1_out     2 2 0   594000000          0     0  50000         Y
>     media_ldb       1 1 0   594000000          0     0  50000         Y
>     media_disp2_pix 1 1 0    66000000          0     0  50000         Y
> 
> media_ldb is too high (should be 462000000). I wonder why media_ldb is not a
> child from media_disp2_pix (or vice versa) when there is a hard dependency.

Probably that's a matter of imx8mp.dtsi patch ?

> There are several solutions:
> 1.
> Set video_pll1 to 1039500000 and adjust requested pixel clock of the panel
> (74250000 in this case). Now the dividers match hit the clock rates exactly.
> But this renders the display list in panel-simple a bit useless.
> 
> 2.
> Adjust video_pll1_out only (e.g. 478757145). Now the calculated clocks comply
> to their mandated ratio. But this might affect other users, e.g. DSI displays
> 
> 3.
> Improve fsl_ldb_atomic_check to set adjusted_mode.clock to an achievable
> clock. This way lcdif will pick the new pixelclock to match their ratio.
> But there is more work necessary, e.g. ensure the new pixelclock is in the
> valid range of the display.

So far, I'm adjusting the LDB clock to match the panel in DT, but that 
indeed could use an improvement.

> To summarize:
> For both HDMI and LVDS using changes unrelated to this lcdif driver:
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Thanks
