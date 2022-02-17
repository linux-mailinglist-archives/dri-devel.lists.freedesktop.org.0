Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C1A4BC74D
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 11:02:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4846A10F671;
	Sat, 19 Feb 2022 10:02:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B970510E1F7
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 17:00:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id A6F431F46171
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645117258;
 bh=ff3TSiMV7RvAbS0hNd/AGstmXBT++vNiyhhx50+xrd8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dBdEbVdp2EEfpi/vkF5YuEEUhxfieguPC+aO0KJIceXvBmWhA4SPcAdagW1ZAQz1H
 xE6PRIb1Fq2LB4lvWqaF5kQti083FrfgjZsN6EgfyHbZqKoylouXB6RZdrUgPU7vRX
 NCWZ1VP4+ZkMG/1VZC1W0Tqge1pfUomwOoLsmYgCpWbQgRL69zL2jlucUzRKvF3cts
 xuuW80kMPuliMf04HN+qIuaKU8cTT8DS3o37OM1gvPzDuGm9GxIcJkGi7OKldabNPc
 0qZFmCCDMJ+vA1mtStR9RdXedEbUJRBTvH8iVjiMV40d3ZyQPm4xwy9U1TGxt6s0U0
 m1lV+rXcuBNpw==
Message-ID: <0c6bd002-dbb3-aa44-9508-974c3ebda778@collabora.com>
Date: Thu, 17 Feb 2022 20:00:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 13/23] drm/rockchip: dw_hdmi: Set cur_ctr to 0 always
Content-Language: en-US
To: Sascha Hauer <s.hauer@pengutronix.de>
References: <20220217082954.2967889-1-s.hauer@pengutronix.de>
 <20220217082954.2967889-14-s.hauer@pengutronix.de>
 <f5abe6aa-473a-a00d-2bc5-b8a1d0560d1f@collabora.com>
 <20220217151259.GT18637@pengutronix.de>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20220217151259.GT18637@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 19 Feb 2022 10:01:55 +0000
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, kernel@pengutronix.de,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, Yakir Yang <ykk@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



17.02.2022 18:12, Sascha Hauer пишет:
> On Thu, Feb 17, 2022 at 05:00:37PM +0300, Dmitry Osipenko wrote:
>> 17.02.2022 11:29, Sascha Hauer пишет:
>>> From: Douglas Anderson <dianders@chromium.org>
>>>
>>> Jitter was improved by lowering the MPLL bandwidth to account for high
>>> frequency noise in the rk3288 PLL.  In each case MPLL bandwidth was
>>> lowered only enough to get us a comfortable margin.  We believe that
>>> lowering the bandwidth like this is safe given sufficient testing.
>>
>> There are no device-trees that use "rockchip,rk3288-cru", AFAICS..
> 
> What do you mean? In my tree I have:
> 
> arch/arm/boot/dts/rk3288.dtsi:863:              compatible = "rockchip,rk3288-cru";
> drivers/clk/rockchip/clk-rk3288.c:985:CLK_OF_DECLARE(rk3288_cru, "rockchip,rk3288-cru", rk3288_clk_init);

Oh, it is ARM32, I was looking at ARM64 only. My bad.

>> Was this change tested on a non-RK3288 devices?
> 
> Yes, on a rk3568 ;)
> 
> The patch has been posted back in 2015 and was added to the Rockchip
> downstream kernel in 2016. I don't know how thoroughly Rockchip tests
> their kernels, but I assume the patch wouldn't be there if it caused
> any problems.

Thank you for the clarification.
