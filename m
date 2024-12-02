Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 679989E02C6
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 14:04:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5974E10E2FC;
	Mon,  2 Dec 2024 13:04:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="h+yj/f3N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 050D810E1B3
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 13:04:23 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 6DB6988A3C;
 Mon,  2 Dec 2024 14:04:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1733144661;
 bh=b09IRayHwKFz5QGfAbSRVqGIdYJP6UQsFIWjXyUo8oY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=h+yj/f3NFDdx+V0dgz4eU4yQI74vVHUnS8pMIYyABCxKMdE9HLVtixAhSauNvfcgN
 AVxxTdXdwbK+kcJ5V7GAbZWMfJu/XaIDeZpx5fiNBp20ApLDNA/BxZQjKTaY7G2JzP
 uJv5+CtMqmavmHAa98O9KSzI96vmDbO03Kfa4Ep8kFKO2ESfbO7vaxX3nIAaKkaVQY
 Vo9Wtvi2dT7RP+OBlzmZem9+OUyrWtdIO0/XPSkeSJlJK1K23F7GX0nL3ON9oYahWM
 XKEWh8G9f+nQ6Uq5TCytf/VadexunrmWC93FifVLY/n4vBWIDZBFnJ7x13vo1MReKF
 FcaosijILgbUQ==
Message-ID: <50ee0207-b37a-4a6a-83fe-32a7a43645ce@denx.de>
Date: Mon, 2 Dec 2024 13:56:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: bridge: fsl-ldb: fixup mode on freq mismatch
To: Liu Ying <victor.liu@oss.nxp.com>, Nikolaus Voss <nv@vosn.de>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Liu Ying <victor.liu@nxp.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabio Estevam <festevam@denx.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nikolaus.voss@haag-streit.com
References: <20241126172610.AD8B51622C@mail.steuer-voss.de>
 <1f0a307a-666f-4647-9f73-e9bddd6c7eff@oss.nxp.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <1f0a307a-666f-4647-9f73-e9bddd6c7eff@oss.nxp.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/2/24 7:32 AM, Liu Ying wrote:
> On 11/27/2024, Nikolaus Voss wrote:
>> LDB clock has to be a fixed multiple of the pixel clock.
>> As LDB and pixel clock are derived from different clock sources
>> (at least on imx8mp), this constraint cannot be satisfied for
>> any pixel clock, which leads to flickering and incomplete
>> lines on the attached display.
>>
>> To overcome this, check this condition in mode_fixup() and
>> adapt the pixel clock accordingly.
>>
>> Cc: <stable@vger.kernel.org>
> 
> It looks like stable is not effectively Cc'ed.
> Need a Fixes tag?
Isn't this fix effectively superseded by series

[PATCH 0/5] clk: Fix simple video pipelines on i.MX8

?
