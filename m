Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9BD9A5281
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2024 07:02:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D3410E280;
	Sun, 20 Oct 2024 05:02:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="jrIOnf+m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3500410E280
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Oct 2024 05:02:47 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 0742D88E51;
 Sun, 20 Oct 2024 07:02:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1729400565;
 bh=hYRBZQsmpk838yCvMz6guFI1ilJdszUEzAPlUeDX8ck=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jrIOnf+miP+e+nCClb/sp1LFMaw4aTBCXLnGGS2GqwfKTOGYm+XQpEZAgSALiGil6
 fjEtu9SKs1o/TMoaaMjqQTHM5/l0NzznNdsKG7Hr56x91vapmUh463s0QrAF7GbrPm
 oOvzgYBw3TZrjcKcIWMYpDrqSX92WSBbtbfIVQ2ZupUkwMFozKzp9xUzsnCh9MJgyu
 kmTIYWVGzU8JPup67CQVe3pEzyhuZb3gYQDFFU6XirFmQyktBkmI1GnOfm1xYIFRRp
 zX1BbD/JPNabIHrNDZt1xjfa7ZLQrQtuD5Fx+IuP5d/o9/3d+ITtqSRfasfpOLxcob
 0Js2VldSDEV2A==
Message-ID: <eee5649b-ca5a-42c5-a6ec-246ee21fb6e4@denx.de>
Date: Sun, 20 Oct 2024 04:49:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: lcdif: Use adjusted_mode .clock instead of
 .crtc_clock
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Isaac Scott <isaac.scott@ideasonboard.com>, Liu Ying <victor.liu@nxp.com>,
 dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>,
 "Lukas F.Hartmann" <lukas@mntmn.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, kernel@dh-electronics.com,
 linux-arm-kernel@lists.infradead.org
References: <20240531202813.277109-1-marex@denx.de>
 <ab2eb32e-a458-4c9b-8324-27ccb00336c5@denx.de>
 <7ae0cd7774f4b3e30cc033a7e543546732dbced0.camel@ideasonboard.com>
 <de285fc0-728f-4ba0-86e0-0069d2cc9a35@denx.de>
 <64e18ceed5279a9346a6a1141f02ead93383bd1e.camel@ideasonboard.com>
 <84f505af-1066-4fcf-84b7-28c152c09b89@denx.de>
 <a7143bd9-a5e0-4afc-98ed-2d4d58171a32@nxp.com>
 <d70a9c51-6fd7-46fe-8009-b42d0ab4e142@denx.de>
 <23d9df90-cb80-4d97-afd6-5c573face4bc@nxp.com>
 <f4b083ec-58b5-477a-a0a4-c4c8d02027a7@denx.de>
 <172937454426.2485972.12472740284222343769@ping.linuxembedded.co.uk>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <172937454426.2485972.12472740284222343769@ping.linuxembedded.co.uk>
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

On 10/19/24 11:49 PM, Kieran Bingham wrote:
> Quoting Marek Vasut (2024-10-12 21:37:59)
>> On 10/11/24 5:10 AM, Liu Ying wrote:
>>
>> Hi,
>>
>>>>>> This Video PLL1 configuration since moved to &media_blk_ctrl {} , but it is still in the imx8mp.dtsi . Therefore, to make your panel work at the correct desired pixel clock frequency instead of some random one inherited from imx8mp.dtsi, add the following to the pollux DT, I believe that will fix the problem and is the correct fix:
>>>>>>
>>>>>> &media_blk_ctrl {
>>>>>>       // 506800000 = 72400000 * 7 (for single-link LVDS, this is enough)
>>>>>>       // there is no need to multiply the clock by * 2
>>>>>>       assigned-clock-rates = <500000000>, <200000000>, <0>, <0>, <500000000>, <506800000>;
>>>>>
>>>>> This assigns "video_pll1" clock rate to 506.8MHz which is currently not
>>>>> listed in imx_pll1443x_tbl[].
>>>>
>>>> Since commit b09c68dc57c9 ("clk: imx: pll14xx: Support dynamic rates") the 1443x PLLs can be configured to arbitrary rates which for video PLL is desirable as those should produce accurate clock.
>>>
>>> Ack.
>>>
>>>>
>>>>> Does the below patch[1] fix the regression issue? It explicitly sets
>>>>> the clock frequency of the panel timing to 74.25MHz.
>>>>>
>>>>> [1] https://patchwork.freedesktop.org/patch/616905/?series=139266&rev=1
>>>> That patch is wrong, there is an existing entry for this panel in panel-simple.c which is correct and precise, please do not add that kind of imprecise duplicate timings into DT.
>>>
>>> At least the patch[1] is legitimate now to override the display
>>> timing of the panel because the override mode is something
>>> panel-simple.c supports.
>>
>> It may be possible to override the mode, but why would this be the
>> desired if the panel-simple.c already contains valid accurate timings
>> for this particular panel ?
> 
> I'm confused a little here. Why is it that setting the panel timings in
> the DT as per [1] make the display work, while the panel timeings in
> panel-simple alone are not enough?
> 
> Is there some difference in code path for 'how' the panel timings are
> set as to whether they will apply fully or not ?
Because [1] sets inaccurate pixel clock of 74.25 MHz, which can be 
divided down from random default Video PLL setting of 1039.5 MHz set in 
imx8mp.dtsi media_blk_ctrl , 1039.5 / 74.25 = 14 .

The panel-simple pixel clock are 72.4 MHz, to achieve that accurately, 
it is necessary to reconfigure the Video PLL frequency to 506.8 MHz , 
which LCDIFv3 can do, but LDB can not, hence it has to be done in DT for 
now.
