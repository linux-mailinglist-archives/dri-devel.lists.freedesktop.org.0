Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 980A0758F52
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 09:41:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC05D10E403;
	Wed, 19 Jul 2023 07:41:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04D2210E40D
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 07:41:33 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 192E8660704A;
 Wed, 19 Jul 2023 08:41:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1689752491;
 bh=uZqnrEnBk5Se4RejQnYLycu1F8p+fOOtdn+tXfzQsxw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Ub5kiqFAv2Hv41uw6NuoUWUVEErCHDCarMo4w2yE1D3ZM4QDY7CLpF71o90PzLbjB
 XDEF2/WLdcem/xIIcmvXCYWBmc7mRArz3ZvkzY0ugbTqzy1srXzo7KJwIatAaJhWQ5
 XUcBlkG6EejAai4BgT2Cd376Iheyi5H2Y3fUnJt6dcCqUnzFwYZmyTpo3ZIUM6hmw0
 GCi2gtKAbRtkVJbGVxRmIuWpzze0pR7FskPTBQKyGQmqJNEMfLgCyM6PtalytgYBEe
 +jfJzaQktIYhbyVMFFLNlkEXeQQ4N5EOQkYCvzL/YeTY8BLk1EDLfOk98wtIr/P63c
 tGETluUrU+oCA==
Message-ID: <d5c9f1c8-6c05-7679-777a-aa6cec01a3f6@collabora.com>
Date: Wed, 19 Jul 2023 09:41:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 0/3] MediaTek DRM: Clean up CMDQ support and ifdefs
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>, chunkuang.hu@kernel.org
References: <20230623094931.117918-1-angelogioacchino.delregno@collabora.com>
 <6c71deca-112e-2ef6-9098-902bc4b92324@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <6c71deca-112e-2ef6-9098-902bc4b92324@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, wenst@chromium.org, matthias.bgg@gmail.com,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 23/06/23 14:49, Alexandre Mergnat ha scritto:
> 
> 
> On 23/06/2023 11:49, AngeloGioacchino Del Regno wrote:
>> This series changes MediaTek CMDQ support to use the mtk-cmdq-helper
>> functions, removing duplicated cmdq setup code in mtk-drm and also
>> removing all instances of `#if IS_REACHABLE(CONFIG_MTK_CMDQ)` while
>> keeping compatibility with both CONFIG_MTK_CMDQ=n and =m/=y.
>>
>> This applies on top of [1] and [2].
>>
>> [1]:https://lore.kernel.org/lkml/20230524093412.92211-1-angelogioacchino.delregno@collabora.com
>> [2]:https://lore.kernel.org/lkml/20230608084727.74403-1-angelogioacchino.delregno@collabora.com
> 
> Hi Angelo,
> 
> Can you provide a public branch to test it please ?
> I tried to apply the dependencies but still have an issue with the 3rd one:
> 
> https://lore.kernel.org/lkml/20230523104234.7849-1-angelogioacchino.delregno@collabora.com
> OK
> 
> https://lore.kernel.org/lkml/20230524093412.92211-1-angelogioacchino.delregno@collabora.com
> OK
> 
> https://lore.kernel.org/lkml/20230608084727.74403-1-angelogioacchino.delregno@collabora.com
> KO
> 
> Thanks
> 

Sorry for the very late reply; I've somehow lost this email in the haystack...

There you go:
https://gitlab.collabora.com/google/chromeos-kernel/-/commits/for-kernelci/

Cheers,
Angelo
