Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE9243B54F
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 17:17:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66A8889F31;
	Tue, 26 Oct 2021 15:17:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C68C89F31
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 15:17:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 9DB4A1F43A1C
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [RFC 06/13] soc: mediatek: apu: Add apu core driver
To: Flora Fu <flora.fu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Yong Wu <yong.wu@mediatek.com>, Pi-Cheng Chen <pi-cheng.chen@mediatek.com>
References: <20211023111409.30463-1-flora.fu@mediatek.com>
 <20211023111409.30463-7-flora.fu@mediatek.com>
Message-ID: <88a4e8f1-6ab7-cb2d-c88b-758b92b1811e@collabora.com>
Date: Tue, 26 Oct 2021 17:17:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211023111409.30463-7-flora.fu@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Il 23/10/21 13:14, Flora Fu ha scritto:
> Add apu core driver.
> The core driver will init the reset part of apu functions.
> 
> Signed-off-by: Flora Fu <flora.fu@mediatek.com>
> ---
>   drivers/soc/mediatek/Kconfig           | 18 +++++
>   drivers/soc/mediatek/apusys/Makefile   |  3 +
>   drivers/soc/mediatek/apusys/apu-core.c | 91 ++++++++++++++++++++++++++
>   drivers/soc/mediatek/apusys/apu-core.h | 11 ++++
>   4 files changed, 123 insertions(+)
>   create mode 100644 drivers/soc/mediatek/apusys/apu-core.c
>   create mode 100644 drivers/soc/mediatek/apusys/apu-core.h
> 

Hello Flora,

I don't think that this custom probe/init mechanism through apu-core.c
can ever be a thing: you should simply register a number of platform
drivers (likely modules) and let the kernel decide what to probe
first, what to probe last, as it's done for every kernel driver.

I understand that this may reduce probe deferrals, as it's a controlled
probe sequence, made specifically for apusys, but it's anyway something
that won't give you big gains (and if it was, then you should still let
the kernel decide and eventually optimize that mechanism somehow).


I want to note that, since this series is rather huge, I will probably
do more than one incremental review of it... and for how things look,
this will most probably be split to more than one series, to allow getting
reviews from specific subsystem maintainers, leading to better code quality
and robustness in the end.

Some more details are coming in reply of other patches in this series.

Thanks,
- Angelo
