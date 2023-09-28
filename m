Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 933CC7B1835
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 12:24:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA5F010E0AB;
	Thu, 28 Sep 2023 10:24:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F68B10E0AB
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 10:24:40 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id AA06A6607330;
 Thu, 28 Sep 2023 11:24:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695896678;
 bh=5hCbgR+BACDhVeYZKUOi0bMLQ8NC+PJjXquJc5GRf98=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Ld5ACCr/B7/IiU8odH20F4Td3WX4xDZs0EwgfnDXiFT9fZtAblS9mr9bwIGislksT
 e/pXGo5ahcuj5++F+CthhX4Jp9TmVkdI4Yqe/E4OaM5glFtKRu1LQKCDzZFANDd5pH
 AMbx6tm2ahnklinuCOPjkmDP1FaKGHqHVvofvuV+aIIPICtu0EyqVQCxj4teY4Pthu
 kih+i8XE9Y/9Jx5IOP960coCEZ6prEr+F5aYrA0nzyhfavnebCPP8kevL+zjW3LBez
 1xMAm+Y8KOl1zGDGORtl+YEnmm9Y3gJMUp9LAHExSkM2FkWwoUZFA+SGgk4yf4w3Gn
 tsa0zBvWZp2Rw==
Message-ID: <5d1669c0-64c3-8a5d-6f4e-88f72d4b40b4@collabora.com>
Date: Thu, 28 Sep 2023 12:24:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [RESEND PATCH v6 17/20] drm/mediatek: Support MT8188 Padding in
 display driver
Content-Language: en-US
To: =?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
References: <20230911074233.31556-1-shawn.sung@mediatek.com>
 <20230911074233.31556-18-shawn.sung@mediatek.com>
 <9fc58793d90b7a984dc3d40ac44719e9869b1202.camel@mediatek.com>
 <f28018229a5c0c232535da929e9d27cb7f649b7e.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <f28018229a5c0c232535da929e9d27cb7f649b7e.camel@mediatek.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 28/09/23 05:39, Shawn Sung (宋孝謙) ha scritto:
> Hi CK,
> 
> On Thu, 2023-09-28 at 03:05 +0000, CK Hu (胡俊光) wrote:
>> Hi, Hsiao-chien:
>>
>> On Mon, 2023-09-11 at 15:42 +0800, Hsiao Chien Sung wrote:
>>> Padding is a new display module on MT8188, it provides ability
>>> to add pixels to width and height of a layer with specified colors.
>>>
>>> Due to hardware design, Mixer in VDOSYS1 requires width of a layer
>>> to be 2-pixel-align, or 4-pixel-align when ETHDR is enabled,
>>> we need Padding to deal with odd width.
>>>
>>> Please notice that even if the Padding is in bypass mode,
>>> settings in register must be cleared to 0,
>>> or undefined behaviors could happen.
>>
>> You just set padding to bypass mode and not clear settings to 0. Any
>> thing wrong?
>>
> 
> Since the deafult value of all the registers in Padding is zero, and
> we are not using Padding currently, it's fine if we just set padding to
> bypass mode witout clearing other registers.
> 
> The comment is just a reminder in case we forget it in the future.

Do *not* rely on default register values, because you don't know what booted
Linux in the first place: you shall *not* expect a clean state and you shall
*not* expect a clean boot.

Besides, what I see is that you're setting GENMASK(1, 0) without explaining
why in the code: you have to add at least the definitions for PADDING_EN and
PADDING_BYPASS.

I also don't see why you shouldn't add at least basic handling for this block,
as it looks easy enough: after all, you anyway have to make sure that the
registers are cleared - might as well just add a little more effort on top
and actually set them to meaningful values? That's ultimately your choice, but
I don't want to see any GENMASK(31,0) write even for register clearing.

Please make this driver proper.

Thanks,
Angelo

> 
> Regards,
> Hsiao Chien Sung

