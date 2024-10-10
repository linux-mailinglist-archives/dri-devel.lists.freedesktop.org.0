Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 188FF998E5C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 19:32:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ADE610E97C;
	Thu, 10 Oct 2024 17:32:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="T10ECyw9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC98010E982
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 17:32:19 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id A078888C4D;
 Thu, 10 Oct 2024 19:32:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1728581538;
 bh=whVPNiD48iq4xnM5NE3XZjeKQAj/SaELDNhmlyjaFuc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=T10ECyw9dzjf6mzqhX1FM6UD8931MbNFhBm+OsnIN4kcO0UWcDmcKIfJqrzH4SGcC
 rYL90t81XbzK5NxR0LrR1BoISqtL5N//4RhKEzXLqtalwrVmmKVFOCrVdTlF2eifdQ
 SPXJwnfnOzwHCsa0y/CUvYVnt0OBi+HAW1rVMyjcNSrObN0S1hL29lTy4ZXBYqV/Go
 gJwJ4TZVBI//jqjx3t1MYybjNhRM655GivIj9HfnG6WNB4+ZU9EFLe48HuXm494ME7
 GXQhXnzzjlZ9M7drcOclEGlrpcURpA7mbhljWbYAt7reIfEDt9q5mKy9VuskptjLA4
 QUCBAg3LMnSvg==
Message-ID: <d70a9c51-6fd7-46fe-8009-b42d0ab4e142@denx.de>
Date: Thu, 10 Oct 2024 19:29:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: lcdif: Use adjusted_mode .clock instead of
 .crtc_clock
To: Liu Ying <victor.liu@nxp.com>, Isaac Scott <isaac.scott@ideasonboard.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>,
 "Lukas F . Hartmann" <lukas@mntmn.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, kernel@dh-electronics.com,
 linux-arm-kernel@lists.infradead.org, kieran.bingham@ideasonboard.com
References: <20240531202813.277109-1-marex@denx.de>
 <1897634.CQOukoFCf9@steina-w> <ab2eb32e-a458-4c9b-8324-27ccb00336c5@denx.de>
 <7ae0cd7774f4b3e30cc033a7e543546732dbced0.camel@ideasonboard.com>
 <de285fc0-728f-4ba0-86e0-0069d2cc9a35@denx.de>
 <64e18ceed5279a9346a6a1141f02ead93383bd1e.camel@ideasonboard.com>
 <84f505af-1066-4fcf-84b7-28c152c09b89@denx.de>
 <a7143bd9-a5e0-4afc-98ed-2d4d58171a32@nxp.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <a7143bd9-a5e0-4afc-98ed-2d4d58171a32@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/10/24 7:31 AM, Liu Ying wrote:

Hi,

>> This Video PLL1 configuration since moved to &media_blk_ctrl {} , but it is still in the imx8mp.dtsi . Therefore, to make your panel work at the correct desired pixel clock frequency instead of some random one inherited from imx8mp.dtsi, add the following to the pollux DT, I believe that will fix the problem and is the correct fix:
>>
>> &media_blk_ctrl {
>>     // 506800000 = 72400000 * 7 (for single-link LVDS, this is enough)
>>     // there is no need to multiply the clock by * 2
>>     assigned-clock-rates = <500000000>, <200000000>, <0>, <0>, <500000000>, <506800000>;
> 
> This assigns "video_pll1" clock rate to 506.8MHz which is currently not
> listed in imx_pll1443x_tbl[].

Since commit b09c68dc57c9 ("clk: imx: pll14xx: Support dynamic rates") 
the 1443x PLLs can be configured to arbitrary rates which for video PLL 
is desirable as those should produce accurate clock.

> Does the below patch[1] fix the regression issue? It explicitly sets
> the clock frequency of the panel timing to 74.25MHz.
> 
> [1] https://patchwork.freedesktop.org/patch/616905/?series=139266&rev=1
That patch is wrong, there is an existing entry for this panel in 
panel-simple.c which is correct and precise, please do not add that kind 
of imprecise duplicate timings into DT.

[...]
