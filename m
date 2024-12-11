Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B69CB9ED28C
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 17:47:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 093EE10E3F8;
	Wed, 11 Dec 2024 16:47:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.steuer-voss.de (mail.steuer-voss.de [85.183.69.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B1110E3F8
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 16:47:51 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.steuer-voss.de
Received: from mail.steuer-voss.de (localhost [127.0.0.1])
 by mail.steuer-voss.de (Postfix) with ESMTP id 723402468;
 Wed, 11 Dec 2024 17:47:46 +0100 (CET)
MIME-Version: 1.0
Date: Wed, 11 Dec 2024 17:47:46 +0100
From: Nikolaus Voss <nv@vosn.de>
To: Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, Liu Ying
 <victor.liu@nxp.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Fabio
 Estevam <festevam@denx.de>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 miquel.raynal@bootlin.com, nikolaus.voss@haag-streit.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm: bridge: fsl-ldb: fixup mode on freq mismatch
In-Reply-To: <fba91fbb-e819-4b08-9845-fa1138773113@denx.de>
References: <20241203191111.47B56F7@mail.steuer-voss.de>
 <2d7f8afc-119a-4080-93be-bf3daf017e5e@denx.de>
 <abcc89936f44fd884b9c5da65ea64c42@vosn.de>
 <5a6ab24d-6c74-497f-828e-b3e7645d664a@denx.de>
 <027aac3abff3f84a0ebf461653ed6c9b@vosn.de>
 <fba91fbb-e819-4b08-9845-fa1138773113@denx.de>
User-Agent: Roundcube Webmail/1.5.0
Message-ID: <ed914413fd0e9dc38887b139da733499@vosn.de>
X-Sender: nv@vosn.de
Content-Type: text/plain; charset=UTF-8;
 format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

On 09.12.2024 22:51, Marek Vasut wrote:
> On 12/9/24 10:27 AM, Nikolaus Voss wrote:
>> On 07.12.2024 12:46, Marek Vasut wrote:
>>> On 12/4/24 11:40 AM, Nikolaus Voss wrote:
>>>>>> LDB clock has to be a fixed multiple of the pixel clock.
>>>>>> As LDB and pixel clock are derived from different clock sources
>>>>> 
>>>>> Can you please share the content of 
>>>>> /sys/kernel/debug/clk/clk_summary ?
>>>> 
>>>> Sure. Without my patch:
>>>> 
>>>>      video_pll1_ref_sel               1       1        0 24000000    
>>>> 0          0     50000      Y      deviceless no_connection_id
>>>>         video_pll1                    1       1        0 1039500000 
>>>> 0          0     50000      Y         deviceless no_connection_id
>>>>            video_pll1_bypass          1       1        0 1039500000 
>>>> 0          0     50000      Y            deviceless no_connection_id
>>>>               video_pll1_out          2       2        0 1039500000 
>>>> 0          0     50000      Y               deviceless 
>>>> no_connection_id
>>>>                  media_ldb            1       1        0 346500000   
>>>> 0          0     50000      Y 32ec0000.blk- ctrl:bridge@5c     ldb
>>>>                                                   deviceless 
>>>> no_connection_id
>>>>                     media_ldb_root_clk 0       0        0 346500000 
>>>> 0          0     50000      Y                     deviceless 
>>>>                      no_connection_id
>>>>                  media_disp2_pix      1       1        0 51975000    
>>>> 0          0     50000      Y                  deviceless        
>>>> no_connection_id
>>>>                     media_disp2_pix_root_clk 1       1        0 
>>>> 51975000    0          0     50000      Y 32e90000.display- 
>>>> controller     pix
>>>> 
>>>> Here 346500000 (media_ldb) != 7 * 51975000 (media_disp2_pix)
>>>>    -> distorted panel image (if any).
>>>> The requested panel pixel clock from EDID is 51200000.
>>> 
>>> Right, this is what Miquel is trying to solve with their series.
>>> 
>>>> This is the same with my patch:
>>>> 
>>>>      video_pll1_ref_sel               1       1        0 24000000    
>>>> 0          0     50000      Y      deviceless no_connection_id
>>>>         video_pll1                    1       1        0 1039500000 
>>>> 0          0     50000      Y         deviceless no_connection_id
>>>>            video_pll1_bypass          1       1        0 1039500000 
>>>> 0          0     50000      Y            deviceless no_connection_id
>>>>               video_pll1_out          2       2        0 1039500000 
>>>> 0          0     50000      Y               deviceless 
>>>> no_connection_id
>>>>                  media_ldb            1       1        0 346500000   
>>>> 0          0     50000      Y 32ec0000.blk- ctrl:bridge@5c     ldb
>>>>                                                   deviceless 
>>>> no_connection_id
>>>>                     media_ldb_root_clk 0       0        0 346500000 
>>>> 0          0     50000      Y                     deviceless 
>>>>                      no_connection_id
>>>>                  media_disp2_pix      1       1        0 49500000    
>>>> 0          0     50000      Y                  deviceless        
>>>> no_connection_id
>>>>                     media_disp2_pix_root_clk 1       1        0 
>>>> 49500000    0          0     50000      Y 32e90000.display- 
>>>> controller     pix
>>>> 
>>>> So, here 346500000 (media_ldb) = 7 * 49500000 (media_disp2_pix).
>>>>    -> stable panel image, but pixel clock reduced to 49.5 MHz from 
>>>> requested 51.2 MHz.
>>> 
>>> Inaccurate pixel clock and non-60Hz frame rate is not a win either.
>> 
>> Some percents of deviation is usually not visible.
> 
> The PLL is accurate, so this kind of non-60 Hz frame rate compromise
> really should not be necessary.
> 
>>>> My conclusion: The clock source is the same
>>> 
>>> I agree .
>>> 
>>> You wrote "derived from different clock sources" above,
>>> keyword:different, which is not correct.
>>> 
>>>> , nevertheless the
>>>> ldb/pixel clock constraint cannot be satisfied without either
>>>> modifying the pll clock or the pixel clock.
>>> In this particular case, you surely do want to modify the PLL 
>>> settings
>>> to achieve accurate pixel clock.
>> 
>> No, in this case there is a 3 percent deviation, resulting in 58 Hz
>> frame rate instead of 60 Hz.
> Consider e.g. 60 FPS video playback, on 58 Hz refresh panel it will
> suffer from some stutter . It is better to aim for the 60 Hz then .

This is a relevant use case, I agree. But even with a dedicated video
PLL (what a luxury in the embedded world!) you will eventually have to
drop or double a frame as the clocks are asynchronous. And the sync
problem still exists with 25 or 50 FPS videos.

-- 
Nikolaus Voss
