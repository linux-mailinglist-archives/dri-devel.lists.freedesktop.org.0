Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DE85ED212
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 02:37:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63FEC10E052;
	Wed, 28 Sep 2022 00:37:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B15C10E052
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 00:37:08 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 661B784CB6;
 Wed, 28 Sep 2022 02:37:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1664325426;
 bh=AFExt7Q17xOJalXC8QGukOa5V+GCRd4+XVnOyYfg6yQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YuI7OumQcuQRO4KVgBVD1gbTBmoB/AK9KAPFtPXj+fc6QSd6gCeTaan98TgYa+kpc
 fOHcTLtDbaEx5qKghTY34rgJqTRLXlBQekF5/QxMk8gGfzGmFyGa8nwMniEDAwO52w
 /6DL9vY2xst3Ei2q7ZY8ild/MbFNrAIGOKEfucvEbAdBVjJUa5s8GQoIa9fhwYngwL
 PF/dVm5g87jj04aSdbi9Ime73/VJ/3ZkdE+tbwjhL7apEttGwjQN+fqQPaL75KI9dY
 Wfhnnrlxs60v/R0fp5xLbduMQ8guHU4HoogsbMjMoKiKrGCUy2Vo9tzrKXIx0DcnHu
 pzLhmZwZ4gaxA==
Message-ID: <d89388e9-a7bf-3540-dcc9-c4ba9efe2044@denx.de>
Date: Wed, 28 Sep 2022 02:37:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 3/4] drm: lcdif: Switch to limited range for RGB to YUV
 conversion
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20220927233821.8007-1-laurent.pinchart@ideasonboard.com>
 <20220927233821.8007-4-laurent.pinchart@ideasonboard.com>
 <303e8be8-41a6-e63f-f2f5-6fc3271886ed@denx.de>
 <YzOTj+QgYnn8RU84@pendragon.ideasonboard.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <YzOTj+QgYnn8RU84@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
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
Cc: Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Daniel Scally <dan.scally@ideasonboard.com>, dri-devel@lists.freedesktop.org,
 Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/28/22 02:21, Laurent Pinchart wrote:

Hi,

[...]

>>> -		/* CSC: BT.601 Full Range RGB to YCbCr coefficients. */
>>> -		writel(CSC0_COEF0_A2(0x096) | CSC0_COEF0_A1(0x04c),
>>> +		/* CSC: BT.601 Limited Range RGB to YCbCr coefficients. */
>>> +		writel(CSC0_COEF0_A2(0x081) | CSC0_COEF0_A1(0x042),
>>>    		       lcdif->base + LCDC_V8_CSC0_COEF0);
>>> -		writel(CSC0_COEF1_B1(0x7d5) | CSC0_COEF1_A3(0x01d),
>>> +		writel(CSC0_COEF1_B1(0x7da) | CSC0_COEF1_A3(0x019),
>>>    		       lcdif->base + LCDC_V8_CSC0_COEF1);
>>> -		writel(CSC0_COEF2_B3(0x080) | CSC0_COEF2_B2(0x7ac),
>>> +		writel(CSC0_COEF2_B3(0x070) | CSC0_COEF2_B2(0x7b6),
>>>    		       lcdif->base + LCDC_V8_CSC0_COEF2);
>>> -		writel(CSC0_COEF3_C2(0x795) | CSC0_COEF3_C1(0x080),
>>> +		writel(CSC0_COEF3_C2(0x7a2) | CSC0_COEF3_C1(0x070),
>>>    		       lcdif->base + LCDC_V8_CSC0_COEF3);
>>> -		writel(CSC0_COEF4_D1(0x000) | CSC0_COEF4_C3(0x7ec),
>>> +		writel(CSC0_COEF4_D1(0x010) | CSC0_COEF4_C3(0x7ee),
>>>    		       lcdif->base + LCDC_V8_CSC0_COEF4);
>>>    		writel(CSC0_COEF5_D3(0x080) | CSC0_COEF5_D2(0x080),
>>>    		       lcdif->base + LCDC_V8_CSC0_COEF5);
>>
>> Would it make sense to use the same coeffs as csc2_coef_bt601_lim in
>> drivers/media/platform/nxp/imx-pxp.c , since the block is most likely
>> identical ?
> 
> The coefficients in this patch have been computed to distribute the
> error in such a way that the sum of all lines stays the same. This
> avoids biases and overflow, but it likely makes very little difference
> in practice. I'm thus fine with the coefficients from imx-pxp.c.

Would it then make sense to update the coeffs in the pxp driver instead?

Either option works for me.
