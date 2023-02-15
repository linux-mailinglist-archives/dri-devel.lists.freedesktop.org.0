Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F0F6990BF
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 11:11:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D0CA10ECCE;
	Thu, 16 Feb 2023 10:11:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1977 seconds by postgrey-1.36 at gabe;
 Wed, 15 Feb 2023 09:56:00 UTC
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4EA010E1BB
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 09:56:00 +0000 (UTC)
X-QQ-mid: bizesmtp71t1676452965t41009ye
Received: from [192.168.30.129] ( [92.202.159.105])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 15 Feb 2023 17:22:42 +0800 (CST)
X-QQ-SSF: 01100000002000B0E000B00A0000000
X-QQ-FEAT: Sq1LnYMfAwmoBjvnIEJmOxVDAemDz55fYRmB6YOuB1tKSy1DRFCkQgobhe8M8
 KsF940IXOM3qfjLczBQEfwPzckdszYlUYYmwrCTTDtAKakYR+Yeu52Bwy4nUj32ja7nIGQf
 wnaZl1nsgHKTXwDI3cKp5xCCVNdvFgSnGEJvys+68fsASRZZGumXt0GeDCdPYnjUWR+Mo+Q
 wCQrp5ClXxmazZ7StkPRVa8fC825A6ZJp1qxuNxS7wE1DEhWWeaGX6nDMgjUPcOpUcEolEG
 4zEHu33/r8KtKSd89PAg28Z6coBx8whahqkNFINNxWoH2bJ1uHO2GLsQp8qQ1GWOBXyj7ud
 SRveQWxefBDunOe80SD72II8pxrmKdILoZrv/G+X75LE/Kcja+1t/Lu6Ed6ig==
X-QQ-GoodBg: 0
Message-ID: <07B52E90388B2C3C+dce2736d-7976-a3ce-d805-28997dee7b18@radxa.com>
Date: Wed, 15 Feb 2023 18:22:42 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v5 0/4] drm/rockchip: dw_hdmi: Add 4k@30 support
To: Sascha Hauer <s.hauer@pengutronix.de>
References: <20230208090816.3810589-1-s.hauer@pengutronix.de>
 <43BFE269C2D3B94A+72719122-bfdd-8e99-9176-a6f5e30abfb2@radxa.com>
 <20230214154304.GK10447@pengutronix.de>
Content-Language: en-US
From: FUKAUMI Naoki <naoki@radxa.com>
In-Reply-To: <20230214154304.GK10447@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:radxa.com:qybglogicsvr:qybglogicsvr5
X-Mailman-Approved-At: Thu, 16 Feb 2023 10:11:15 +0000
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
Cc: Dan Johansen <strit@manjaro.org>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

hi,

On 2/15/23 00:43, Sascha Hauer wrote:
> On Mon, Feb 13, 2023 at 04:11:46PM +0900, FUKAUMI Naoki wrote:
>> hi,
>>
>> on my rk3399 boards(ROCK Pi 4B+ and ROCK 4C+), fb0 is configured as
>> 1920x1080, and nothing is displayed... "no signal" on display.
> 
> I can confirm this.
> 
> First of all there is a stupid bug in my patch:
> 
>> +       if (vop->data->max_output.width && mode->hdisplay > vop->data->max_output.height)
>> +               return MODE_BAD_HVALUE;
> 
> The comparison should be against the width here of course, not against
> the height. Fixing this should at least allow you to display something
> when a 1080p display is connected.

with above fix, and modified dts either VOPL or VOPB enabled, I could 
get expected resolution on the display.

thank you so much for your nice work :)

--
FUKAUMI Naoki

> The other problem comes with the legacy fbdev emulation. I think failure
> is pretty much expected here. The fbdev emulation happens to use the
> VOPL to display a 4k picture, but the VOPL can only do up to 2560x1600
> and so the mode is denied in vop_crtc_mode_valid(). Quoting Daniel Stone
> on this topic:
> 
>> You've done the right thing. Userspace should detect this and try with
>> alternative CRTC routing. The kernel shouldn't be trying to solve this
>> problem.
> 
> Trying an alternative CRTC routing is exactly what the fbdev emulation
> doesn't do. Now my "userspace" is in kernel and the kernel shouldn't try
> to solve this problem. We're trapped :-/
> 
> Sascha
> 
>>
>> --
>> FUKAUMI Naoki
>>
>> On 2/8/23 18:08, Sascha Hauer wrote:
>>> Some more small changes to this series, see changelog.
>>>
>>> Sascha
>>>
>>> Changes since v4:
>>> - Use struct vop_reg to store resolutions
>>> - Only check for valid clock rates when clock != NULL
>>>
>>> Changes since v3
>>> - Add patch to limit VOP resolutions to hardware capabilitie
>>>
>>> Changes since v2:
>>> - Use correct register values for mpll_cfg
>>> - Add patch to discard modes we cannot achieve
>>>
>>> Changes since v1:
>>> - Allow non standard clock rates only on Synopsys phy as suggested by
>>>     Robin Murphy
>>>
>>> Sascha Hauer (4):
>>>     drm/rockchip: vop: limit maximium resolution to hardware capabilities
>>>     drm/rockchip: dw_hdmi: relax mode_valid hook
>>>     drm/rockchip: dw_hdmi: Add support for 4k@30 resolution
>>>     drm/rockchip: dw_hdmi: discard modes with unachievable pixelclocks
>>>
>>>    drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c  | 41 ++++++++++++++++----
>>>    drivers/gpu/drm/rockchip/rockchip_drm_vop.c  | 15 +++++++
>>>    drivers/gpu/drm/rockchip/rockchip_drm_vop.h  |  6 +++
>>>    drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  5 ---
>>>    drivers/gpu/drm/rockchip/rockchip_vop_reg.c  | 18 +++++++++
>>>    5 files changed, 73 insertions(+), 12 deletions(-)
>>>
>>
> 
