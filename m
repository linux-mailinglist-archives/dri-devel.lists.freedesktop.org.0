Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 134F38E4ADD
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 23:32:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E898A10E2E0;
	Mon,  3 Jun 2024 21:32:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="RZMxWBoy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D6310E046
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 21:32:05 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 841BD87702;
 Mon,  3 Jun 2024 23:32:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1717450323;
 bh=YmwNla5lZc/8l/y+IArv+CSCVMWx3CXw6pnXC/xppcM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RZMxWBoySVLZx3KxXn16fDcZgO3gRzVz7QehYLNkhi3w1M4jZzaK2dEbwHZJrbNcT
 BrqwurRmO8ccDVeKFEuXULRHGFyw0izfzI0iBfS0q+/uxTi0xRJr6KXMq2I2rxmlzM
 rzjZ8vTdCn481I22fxo2Xontf9wRBjYEDlNsVA+xpBgD6rZd1G8SR7UX44xT5PzLji
 wOIFT6BGcYB9lPFlJKVP6oueD5aJ7RUVmP7R4UJTVJGEBgoP9AAPY6LbF40NhuQSSG
 W5x03jB9rDlbRS0teVa0z0wovi9XnkzZcWx/iZMH/vV9em/9p4I7dwG2BxaMUKeMh3
 O80nnV8MFcrWg==
Message-ID: <e713607f-4927-435f-bac0-be3344e45ef4@denx.de>
Date: Mon, 3 Jun 2024 23:25:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] drm/bridge: tc358767: Drop line_pixel_subtract
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, kernel@dh-electronics.com
References: <20240531204130.277800-1-marex@denx.de>
 <20240531204130.277800-3-marex@denx.de> <6053649.lOV4Wx5bFT@steina-w>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <6053649.lOV4Wx5bFT@steina-w>
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

On 6/3/24 2:18 PM, Alexander Stein wrote:
> Hi Marek,

Hi,

> Am Freitag, 31. Mai 2024, 22:39:49 CEST schrieb Marek Vasut:
>> This line_pixel_subtract is no longer needed now that the bridge can
>> request and obtain specific pixel clock on input to the bridge, with
>> clock frequency that matches the Pixel PLL frequency.
>>
>> The line_pixel_subtract is now always 0, so drop it entirely.
>>
>> The line_pixel_subtract was not reliable as it never worked when the
>> Pixel PLL and input clock were off just so that the required amount
>> of pixels to subtract would not be whole integer.
> 
> I think this is based on [1], no?

It is.

> I was wondering because it was not stated.

I thought [1] was already applied, but it seems it was only RBd.

I can either apply [1] and then add this on top, so the two commits can 
be reverted separately if this one breaks something, or squash [1] into 
this patch and send V2. Which one do you prefer ?

The [1] fixes a real nasty issue with DPI output which causes visible 
image corruption, so I would like to have [1] in, but it is obviously 
not perfect.
