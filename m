Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A926D1AF4
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 10:57:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CFD410F154;
	Fri, 31 Mar 2023 08:57:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C77A10F154
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 08:57:51 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 5E4D76603190;
 Fri, 31 Mar 2023 09:57:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1680253069;
 bh=kcPN1LESjMGlvYHh32VNBYjE211/RT+t+3JV3fuxe/4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JK6VgM0JosGm7ivI/dYsHa0iTCZNRgc7OoQGJxkgMH68bZwcU8LDC9VRNfP+udOd4
 tE24j5wOJkUKBXtWOsHhbk6W782RADZrWgMHGpaSzLM1PtxiGIMNLv4kcrK7Hg+KYJ
 EkSmSbjpbv0UmVHLOIJIfeE23YNHdV1sVj4dOtWFLtZ0tcW4hwYRZfpcdI2lJ7H/ia
 vd7yRV70idFiTD5SiRDuca7PQNfQHHU2gpkhb5scX4geCfrxv/2EHsFPAR/MNjMl1R
 D2HjLNMGdECeRXqgEoJ0A27REigZuXx0xcsXnNCH93wpJGD12TP3viVkH1OlmwkqNp
 caDiJ0ff4NYZg==
Message-ID: <fb19c82b-f2bf-7f22-ba5c-e1a1c98f987f@collabora.com>
Date: Fri, 31 Mar 2023 10:57:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 RESEND 2/2] drm/panfrost: Add basic support for speed
 binning
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20230323090822.61766-1-angelogioacchino.delregno@collabora.com>
 <20230323090822.61766-3-angelogioacchino.delregno@collabora.com>
 <5814d779-0635-43fe-3fe8-31c130f05b3a@collabora.com>
 <20230331104914.708b194e@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230331104914.708b194e@collabora.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com, robh+dt@kernel.org,
 alyssa.rosenzweig@collabora.com, wenst@chromium.org, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 31/03/23 10:49, Boris Brezillon ha scritto:
> On Fri, 31 Mar 2023 10:11:07 +0200
> AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> wrote:
> 
>> Il 23/03/23 10:08, AngeloGioacchino Del Regno ha scritto:
>>> Some SoCs implementing ARM Mali GPUs are subject to speed binning:
>>> this means that some versions of the same SoC model may need to be
>>> limited to a slower frequency compared to the other:
>>> this is being addressed by reading nvmem (usually, an eFuse array)
>>> containing a number that identifies the speed binning of the chip,
>>> which is usually related to silicon quality.
>>>
>>> To address such situation, add basic support for reading the
>>> speed-bin through nvmem, as to make it possible to specify the
>>> supported hardware in the OPP table for GPUs.
>>> This commit also keeps compatibility with any platform that does
>>> not specify (and does not even support) speed-binning.
>>>
>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>
>> Hello maintainers,
>> I've seen that this got archived in the dri-devel patchwork; because of that and
>> only that, I'm sending this ping to get this patch reviewed.
> 
> Looks good to me. If you can get a DT maintainer to review the binding
> (Rob?), I'd be happy to queue the series to drm-misc-next.
> 

The binding was acked by Krzysztof already... so, just to be sure:

Krzysztof, can the binding [1] get picked?

Cheers,
Angelo

[1]: 
https://lore.kernel.org/all/20230323090822.61766-2-angelogioacchino.delregno@collabora.com/


