Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 871CE5ABDBB
	for <lists+dri-devel@lfdr.de>; Sat,  3 Sep 2022 10:00:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3FC10E9A0;
	Sat,  3 Sep 2022 07:59:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 345 seconds by postgrey-1.36 at gabe;
 Sat, 03 Sep 2022 07:59:48 UTC
Received: from mail-m11874.qiye.163.com (mail-m11874.qiye.163.com
 [115.236.118.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F01510E9A4
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Sep 2022 07:59:48 +0000 (UTC)
Received: from [172.16.12.141] (unknown [58.22.7.114])
 by mail-m11874.qiye.163.com (Hmail) with ESMTPA id 9B6753C0308;
 Sat,  3 Sep 2022 15:53:57 +0800 (CST)
Message-ID: <bb8152e7-8c52-090e-1a41-953f789eaf15@rock-chips.com>
Date: Sat, 3 Sep 2022 15:53:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/2] drm/rockchip: dw_hdmi: Add 4k@30 support
Content-Language: en-US
To: Sascha Hauer <s.hauer@pengutronix.de>
References: <20220822152017.1523679-1-s.hauer@pengutronix.de>
 <20220824070742.GA28387@pengutronix.de>
From: Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <20220824070742.GA28387@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFJSktLSjdXWS1ZQUlXWQ8JGhUIEh9ZQVlDSkoaVhgaTR5ISB4fQk8eT1UTARMWGhIXJB
 QOD1lXWRgSC1lBWU5DVUlJVUxVSkpPWVdZFhoPEhUdFFlBWU9LSFVKSktDSUNVSktLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NCI6Myo6Cz0eKjkfPT0SPDUw
 MChPCj1VSlVKTU1JSkJKTUhDSkNOVTMWGhIXVRoVHwJVAhoVOwkUGBBWGBMSCwhVGBQWRVlXWRIL
 WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSE1JSzcG
X-HM-Tid: 0a830257953c2eb0kusn9b6753c0308
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
Cc: algea.cao@rock-chips.com, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sascha:

On 8/24/22 15:07, Sascha Hauer wrote:
> Hi Andy Et al.,
>
> On Mon, Aug 22, 2022 at 05:20:15PM +0200, Sascha Hauer wrote:
>> This series adds support for 4k@30 to the rockchip HDMI controller. This
>> has been tested on a rk3568 rock3a board. It should be possible to add
>> 4k@60 support the same way, but it doesn't work for me, so let's add
>> 4k@30 as a first step.
> I tried adding 4k@60 support the same way, just by adding the missing
> fields for 600MHz in the PLL/phy settings. I get a picture on the
> screen, but it's not very stable: The monitor often gets black, scans
> through the different HDMI inputs and then syncs again. Also when I
> re-plug the cable while weston is running I won't get any picture
> anymore (the same works fine with lower resolutions). I also tried
> the Rock3a 4.19 Kernel which is based on the Rockchip Kernel and I saw
> similar problems there.
>
> Do you have an idea what could go wrong there?


4K HDMI output from hdmi need very carefully tuning  of HDMI PHY and PLL.

I can make sure that HDMI 4K output on rk3399/rk3288/rk356x are work 
fine with our

vendor kernel, but the upstream kernel is only can run at 1080p output, 
I have tested

on rk3399 and rk3568-evb1[0]


I am not  familiar with hdmi tuning, so I am sorry i can't give detail 
idea about this issue,

maybe a more carefully comparison with hdmi driver and pll 
configuration  between upstream kernel and rockchip 4.19 kernel?

I think you have rk356x evb board, do you have a detail test about 4K 
HDMI output with this board? If you have issue about 4k hdmi output

on this board with rockchip 4.19 kernel, we can help to figure it out.

Anyway, I loop Algea to the list, he is maintaining our hdmi 
development, but I am sorry to say that he is

also very busy😅

I don't have a rock3a, so I can't confirm the problem you described on 
4.19 kernel.




[0]https://patchwork.kernel.org/project/linux-rockchip/patch/20220225075150.2729401-16-s.hauer@pengutronix.de/



>
> Sascha
>
>
