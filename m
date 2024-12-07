Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 926379E7FF9
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2024 13:59:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 438A210E227;
	Sat,  7 Dec 2024 12:59:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="w1in2OrS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF0510E227
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2024 12:59:02 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id A0CCB89189;
 Sat,  7 Dec 2024 13:59:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1733576341;
 bh=7jvUGToMgi/9xHKjwBVv+KG7oBqg7mzOct80Gxkc0dg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=w1in2OrStApeE/WFBr6GJYJE7SSm/IIdjz1Pb9bLVG7cIVIz2MGNGT+eNUIQ8S09Y
 jS2eItDqgHQPINFAld0PhY4dlLVV0kGti1Kdcbw8Juo/VQZPjYXxEfM7ruIE7/FA3l
 2S/qdqLVqvjUUh6BsuUMgutY26o4WwMy3f8DFnZ60QLepgL6Wf6wOdYXNOL+vOno9N
 05TCcI3vYSaFebCKm35VxhJotJWJW6SWID/xpHN9PJmVODXYNjkaO3T7XcHJ/7J7oS
 StLiBqdrRO4mHG2khYyNt23k69YP++jN/NlDyGIsdxcZwVFSLi5EnFSue1/d2/YnAZ
 Y1a8tYFZzXKIw==
Message-ID: <5a6ab24d-6c74-497f-828e-b3e7645d664a@denx.de>
Date: Sat, 7 Dec 2024 12:46:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm: bridge: fsl-ldb: fixup mode on freq mismatch
To: Nikolaus Voss <nv@vosn.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Liu Ying <victor.liu@nxp.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabio Estevam <festevam@denx.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 miquel.raynal@bootlin.com, nikolaus.voss@haag-streit.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241203191111.47B56F7@mail.steuer-voss.de>
 <2d7f8afc-119a-4080-93be-bf3daf017e5e@denx.de>
 <abcc89936f44fd884b9c5da65ea64c42@vosn.de>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <abcc89936f44fd884b9c5da65ea64c42@vosn.de>
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

On 12/4/24 11:40 AM, Nikolaus Voss wrote:

Hi,

>>> LDB clock has to be a fixed multiple of the pixel clock.
>>> As LDB and pixel clock are derived from different clock sources
>>
>> Can you please share the content of /sys/kernel/debug/clk/clk_summary ?
> 
> Sure. Without my patch:
> 
>      video_pll1_ref_sel               1       1        0        24000000 
>    0          0     50000      Y      deviceless no_connection_id
>         video_pll1                    1       1        0 1039500000  
> 0          0     50000      Y         deviceless          no_connection_id
>            video_pll1_bypass          1       1        0 1039500000  
> 0          0     50000      Y            deviceless             
> no_connection_id
>               video_pll1_out          2       2        0 1039500000  
> 0          0     50000      Y               deviceless                
> no_connection_id
>                  media_ldb            1       1        0        
> 346500000   0          0     50000      Y 32ec0000.blk- 
> ctrl:bridge@5c     ldb
>                                                   deviceless         
> no_connection_id
>                     media_ldb_root_clk 0       0        0 346500000   
> 0          0     50000      Y                     deviceless 
>                       no_connection_id
>                  media_disp2_pix      1       1        0        51975000 
>    0          0     50000      Y                  deviceless         
> no_connection_id
>                     media_disp2_pix_root_clk 1       1        0 
> 51975000    0          0     50000      Y 32e90000.display- 
> controller     pix
> 
> Here 346500000 (media_ldb) != 7 * 51975000 (media_disp2_pix)
>    -> distorted panel image (if any).
> The requested panel pixel clock from EDID is 51200000.

Right, this is what Miquel is trying to solve with their series.

> This is the same with my patch:
> 
>      video_pll1_ref_sel               1       1        0        24000000 
>    0          0     50000      Y      deviceless no_connection_id
>         video_pll1                    1       1        0 1039500000  
> 0          0     50000      Y         deviceless          no_connection_id
>            video_pll1_bypass          1       1        0 1039500000  
> 0          0     50000      Y            deviceless             
> no_connection_id
>               video_pll1_out          2       2        0 1039500000  
> 0          0     50000      Y               deviceless                
> no_connection_id
>                  media_ldb            1       1        0        
> 346500000   0          0     50000      Y 32ec0000.blk- 
> ctrl:bridge@5c     ldb
>                                                   deviceless         
> no_connection_id
>                     media_ldb_root_clk 0       0        0 346500000   
> 0          0     50000      Y                     deviceless 
>                       no_connection_id
>                  media_disp2_pix      1       1        0        49500000 
>    0          0     50000      Y                  deviceless         
> no_connection_id
>                     media_disp2_pix_root_clk 1       1        0 
> 49500000    0          0     50000      Y 32e90000.display- 
> controller     pix
> 
> So, here 346500000 (media_ldb) = 7 * 49500000 (media_disp2_pix).
>    -> stable panel image, but pixel clock reduced to 49.5 MHz from 
> requested 51.2 MHz.

Inaccurate pixel clock and non-60Hz frame rate is not a win either.

> My conclusion: The clock source is the same

I agree .

You wrote "derived from different clock sources" above, 
keyword:different, which is not correct.

> , nevertheless the
> ldb/pixel clock constraint cannot be satisfied without either
> modifying the pll clock or the pixel clock.
In this particular case, you surely do want to modify the PLL settings 
to achieve accurate pixel clock.
