Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C839D8AB0
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 17:55:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23B3D10E6BB;
	Mon, 25 Nov 2024 16:55:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="F8ckYirK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 029CC10E6BA
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 16:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1732553724;
 bh=g7ZFlFRwgvLlLhUGEJJ8enN5gy7+MkcR980Ufjiw3N0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=F8ckYirKSeB1nSa/dAQa+nGHYDN6IFCY2QLCzMNSq7/dlav3MOXuwyvaMi9j1FxIw
 8VGqeXiqYUMGsUQy/nRSgKlBqc/p4zpNI9GESE6g2skvZbqW3UeqbiDS6fq2EFmLqY
 7/I+Dud7vqPzeBRhPevUAOgsfE1Y6fiol+JZ5wkfjnHOpFssXl3A/9ChHGZWPpkXYA
 sFZZS5z05n8vpifBuQgwEvF93qDvgpIXbz4DMfvGghnXdUCgeHqMmzeetJ9fdQ31pk
 VKH3PWyJ+a7BVqlqcM0+kXSFhKLLDL21nwzEehBgGRqQWcAz88mqM6MJoZ2HNSww2n
 aMGx/GQrEBJOw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id C9CF617E376B;
 Mon, 25 Nov 2024 17:55:23 +0100 (CET)
Message-ID: <15864b39-c68d-4240-926b-87d5d3876c8c@collabora.com>
Date: Mon, 25 Nov 2024 17:55:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/6] drm/mediatek: mtk_dpi: Use an array for pixclk
 factor calculation
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Cc: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "mripard@kernel.org" <mripard@kernel.org>,
 =?UTF-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>
References: <20241120124420.133914-1-angelogioacchino.delregno@collabora.com>
 <20241120124420.133914-4-angelogioacchino.delregno@collabora.com>
 <6e07043e70111920848cc3d22e5c60371c0fb65d.camel@mediatek.com>
 <120c65e7c21821a72fa5165e578cc1c39cf0c864.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <120c65e7c21821a72fa5165e578cc1c39cf0c864.camel@mediatek.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 22/11/24 07:23, CK Hu (胡俊光) ha scritto:
> Hi, Angelo:
> 
> On Fri, 2024-11-22 at 11:54 +0800, CK Hu wrote:
>> Hi, Angelo:
>>
>> On Wed, 2024-11-20 at 13:44 +0100, AngeloGioacchino Del Regno wrote:
>>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>>>
>>>
>>> Setting the TVD PLL clock requires to multiply the target pixel
>>> clock by a specific constant factor to achieve the target PLL
>>> frequency, and this is done to reduce jitter to acceptable levels.
>>>
>>> On all MediaTek SoCs, the factor is not retrieved by any real kind
>>> of calculation but rather by checking if the target pixel clock
>>> is less than a specified frequency, hence assigning a function
>>> pointer for just a bunch of if branches does enlarge the code
>>> size for little reason.
>>>
>>> Remove all SoC-specific functions, add a structure `mtk_dpi_factor`
>>> that holds a clock frequency and corresponding PLL factor, and
>>> declare the constraints for each SoC in form of an array of said
>>> structure.
>>> Instead of function pointers, this structure (and its size) is then
>>> assigned to each SoC's platform data.
>>>
>>> The "calculation" is then performed with a new static function
>>> mtk_dpi_calculate_factor(dpi, mode_clk) that iterates through all
>>> of the entries of the aforementioned array and returns the right
>>> factor.
>>>
>>> If no factor is found, the lowest possible factor is returned,
>>> mimicking the same flow as all of the old per-SoC calculation
>>> functions.
>>>
>>> This commit brings no functional change.
>>
> 
> [snip]
> 
>>>   static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
>>>                                      struct drm_display_mode *mode)
>>>   {
>>> @@ -529,7 +550,7 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
>>>          unsigned int factor;
>>>
>>>          /* let pll_rate can fix the valid range of tvdpll (1G~2GHz) */
>>> -       factor = dpi->conf->cal_factor(mode->clock);
>>> +       factor = mtk_dpi_calculate_factor(dpi, mode_clk);
> 
> mode_clk is defined in next patch.
> keep mode->clock in this patch to keep my reviewed-by tag.
> 

Oh! Nice catch!
That happened during the final cleanup, heh :-)

Thanks btw, I will fix that in v2.

Cheers,
Angelo

> Regards,
> CK
> 
>>>          drm_display_mode_to_videomode(mode, &vm);
>>>          pll_rate = vm.pixelclock * factor;
>>>
>>> @@ -964,48 +985,6 @@ static const struct component_ops mtk_dpi_component_ops = {
>>>          .unbind = mtk_dpi_unbind,
>>>   };
>>>
> 
> 



