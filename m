Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCDBA0B8E8
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 14:59:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E53610E047;
	Mon, 13 Jan 2025 13:59:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="dGb0uA4y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B818C10E047
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 13:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1736776731;
 bh=Fxot0/yllsfFV5MpcU+4oD888BMjMbr6+B9CyzdSk2A=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=dGb0uA4y3MK0iODtk5hcPqliinJfUVu12AvzbkKAuD8ezo4OmZyvS7IqIolui1RMS
 fHnjAGS1j66g3CZbVWjyVxp1QVMlb+ZsFnQGBdKql1h6Z9IJVcHciM8fwUQm1GikTs
 r+upWgRknwrFxnxkrjvsybcMpVV17TJs4oBAR330FbfX3hZefckL0goxO/nJNV0u0t
 2BHDmKYRr1Y87xF9ohjzRcuhH/0AZU6kCVfqU5u0jzDHi14GEV1IzcQjx2Fcv4ESTs
 jGQg6mJ2XTwxzklEDB8arc/sIy5aDexGFU7rypzRxKmf61eSpHaVt/O73ylf+98xlI
 oz1oKPUYaFQJg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E245117E0E64;
 Mon, 13 Jan 2025 14:58:50 +0100 (CET)
Message-ID: <fcf8ebde-46c9-406e-b4d9-933623a9786b@collabora.com>
Date: Mon, 13 Jan 2025 14:58:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/mediatek/hdmi: Use
 syscon_regmap_lookup_by_phandle_args
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250112134708.46100-1-krzysztof.kozlowski@linaro.org>
 <516d16e3-6fc6-49ba-a0ce-f451b65a6c1a@collabora.com>
 <fef6b198-d916-4b71-86ed-0cbdd55cb3c4@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <fef6b198-d916-4b71-86ed-0cbdd55cb3c4@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 13/01/25 14:05, Krzysztof Kozlowski ha scritto:
> On 13/01/2025 13:41, AngeloGioacchino Del Regno wrote:
>> Il 12/01/25 14:47, Krzysztof Kozlowski ha scritto:
>>> Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
>>> syscon_regmap_lookup_by_phandle() combined with getting the syscon
>>> argument.  Except simpler code this annotates within one line that given
>>> phandle has arguments, so grepping for code would be easier.
>>>
>>> There is also no real benefit in printing errors on missing syscon
>>> argument, because this is done just too late: runtime check on
>>> static/build-time data.  Dtschema and Devicetree bindings offer the
>>> static/build-time check for this already.
>>>
>>
>> I agree with this change but can you please rebase it over [1]?
>>
>> The same code got migrated to mtk_hdmi_common.c instead :-)
>>
>> [1]:
>> https://lore.kernel.org/r/20250108112744.64686-1-angelogioacchino.delregno@collabora.com
> My is 2-patch cleanup, your is 34 patch rework and new features with
> existing build reports, so rebase is not reasonable. It would make this
> 2-patch cleanup wait for many cycles.
> 
If adding the `#include <linux/bitfield.h>` line to a file would take
*many cycles*, that'd be a bit weird, wouldn't it? :-)

Regards,
Angelo
