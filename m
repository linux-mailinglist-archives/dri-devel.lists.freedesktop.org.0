Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7E29E0BF5
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 20:23:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6ED510E1D8;
	Mon,  2 Dec 2024 19:23:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="vsW7wSUM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDAA110E1D8
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 19:23:42 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 4FA40893A0;
 Mon,  2 Dec 2024 20:23:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1733167420;
 bh=LiLtYIiTAff/Hsw2l8C4sQY7A+FQLI+hk7tFJuMi/9w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=vsW7wSUMtLnGLVRa0Wkc8FkCwRyg9xo8cD/C6SZBxyNfo6fCIH+E9P4uk5/9/AMzH
 xdxOugrX+C49sp5VfWe/Tp2Tl/KpwbJzylzkjfgapImeBTS9cLzozI3VsABncdRmL5
 GdRN4HLnIU9vzDaApj75MSJQawp/1cNEM8779JIOGptG8WkOjTBfDGuYTzWnz3JzUH
 XP9XHyebu2C4rIUnTCUVJKHMyQ/lWOArdYEry15MFxpP+q/MQHPBQFjRHHsCxuVjgS
 zAnaB0Q5s5Ym4dH3Qsy26q+AmpiLY1Yj9ScqvPuZB9nzA8Pqtx8JRRNO565M4B1kxR
 o1k9Wk2YpRp2w==
Message-ID: <230b3977-fa4f-4297-a05e-796c0df90d48@denx.de>
Date: Mon, 2 Dec 2024 20:11:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: bridge: fsl-ldb: fixup mode on freq mismatch
To: Nikolaus Voss <nv@vosn.de>
Cc: Liu Ying <victor.liu@oss.nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Liu Ying <victor.liu@nxp.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabio Estevam <festevam@denx.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Miquel Raynal <miquel.raynal@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, nikolaus.voss@haag-streit.com
References: <20241126172610.AD8B51622C@mail.steuer-voss.de>
 <1f0a307a-666f-4647-9f73-e9bddd6c7eff@oss.nxp.com>
 <50ee0207-b37a-4a6a-83fe-32a7a43645ce@denx.de>
 <9cc55af202690bad0616bee76430133d@vosn.de>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <9cc55af202690bad0616bee76430133d@vosn.de>
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

On 12/2/24 6:03 PM, Nikolaus Voss wrote:
> On 02.12.2024 13:56, Marek Vasut wrote:
>> On 12/2/24 7:32 AM, Liu Ying wrote:
>>> On 11/27/2024, Nikolaus Voss wrote:
>>>> LDB clock has to be a fixed multiple of the pixel clock.
>>>> As LDB and pixel clock are derived from different clock sources
>>>> (at least on imx8mp), this constraint cannot be satisfied for
>>>> any pixel clock, which leads to flickering and incomplete
>>>> lines on the attached display.
>>>>
>>>> To overcome this, check this condition in mode_fixup() and
>>>> adapt the pixel clock accordingly.
>>>>
>>>> Cc: <stable@vger.kernel.org>
>>>
>>> It looks like stable is not effectively Cc'ed.
>>> Need a Fixes tag?
>> Isn't this fix effectively superseded by series
>>
>> [PATCH 0/5] clk: Fix simple video pipelines on i.MX8
>>
>> ?
> 
> Maybe. I wasn't aware of the series. Looking at it, the change is
> rather complex and not suitable for the stable series.
> 
> My intention was to get a simple fix which doesn't potentially
> break anything. It wouldn't even break the patch series you mentioned.
I know, the proper fix is indeed complex and not yet fully figured out.

The fix for stable for existing hardware is similar to this commit I think:

4fbb73416b10 ("arm64: dts: imx8mp-phyboard-pollux: Set Video PLL1 
frequency to 506.8 MHz")
