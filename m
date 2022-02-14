Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5114B48E6
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 11:07:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40F2B10E409;
	Mon, 14 Feb 2022 10:07:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.103])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2DB8710E409
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 10:07:32 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:35964.414113341
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id CD6CD10029D;
 Mon, 14 Feb 2022 18:07:27 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-b7fbf7d79-vjdjk with ESMTP id
 2ce5d89c9d2b4751bf53523b557ba63b for jiaxun.yang@flygoat.com; 
 Mon, 14 Feb 2022 18:07:29 CST
X-Transaction-ID: 2ce5d89c9d2b4751bf53523b557ba63b
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <79f30dcb-48f5-e8b4-7cdd-770dd30d4896@189.cn>
Date: Mon, 14 Feb 2022 18:07:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v7 0/7] drm/lsdc: add drm driver for loongson display
 controller
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Roland Scheidegger <sroland@vmware.com>, Zack Rusin <zackr@vmware.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Sam Ravnborg <sam@ravnborg.org>, "David S . Miller" <davem@davemloft.net>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Ilia Mirkin <imirkin@alum.mit.edu>, Qing Zhang <zhangqing@loongson.cn>,
 Li Yi <liyi@loongson.cn>, suijingfeng <suijingfeng@loongson.cn>
References: <20220213141649.1115987-1-15330273260@189.cn>
 <380d93a4-6f36-00d2-6cd3-e4428534cbb1@flygoat.com>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <380d93a4-6f36-00d2-6cd3-e4428534cbb1@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022/2/14 13:54, Jiaxun Yang wrote:
>
>
> 在 2022/2/13 14:16, Sui Jingfeng 写道:
>> There is a display controller in loongson's LS2K1000 SoC and LS7A1000
>> bridge chip, the DC is a PCI device in those chips. It has two display
>> pipes but with only one hardware cursor. Each way has a DVO interface
>> which provide RGB888 signals, vertical & horizontal synchronisations,
>> data enable and the pixel clock. Each CRTC is able to scanout from
>> 1920x1080 resolution at 60Hz. The maxmium resolution is 2048x2048
>> according to the hardware spec.
>
> Hi Jiangfeng,
>
> I see you added dts for those boards, but I didn't see you wire up them
> in Makefile and code? How can you use them in present systems?
>
> I guess to make those dts work for general all-in-one kernel, what you
> need to do is, for example Lemota A1901:
>
> 1. Add __dtb_lemote_a1901 to builtin_dtbs.h
>
> 2. Wire up with something like:
>
> if (!strcmp("LEMOTE-/LS3A4000/-7A1000-1w-V01-pc", eboard->name)
>     loongson_fdt_blob = __dtb_lemote_a1901
>
> In arch/mips/loongson64/env.c.
>
> Thanks.
> - Jiaxun

For most board, this driver is ready to be use out of box.
Device tree is for supplement purpose.

