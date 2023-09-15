Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A54547A1BDE
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 12:16:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B325310E16F;
	Fri, 15 Sep 2023 10:16:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE78D10E16F
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 10:16:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id D9092CE2AD2;
 Fri, 15 Sep 2023 10:16:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71D74C433C7;
 Fri, 15 Sep 2023 10:16:19 +0000 (UTC)
Message-ID: <11cc64e0-ab30-4cb1-ae99-1ef72aff7bfb@xs4all.nl>
Date: Fri, 15 Sep 2023 12:16:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/14] add support MDP3 on MT8195 platform
Content-Language: en-US, nl
To: Chen-Yu Tsai <wenst@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230912075805.11432-1-moudy.ho@mediatek.com>
 <c0bd7428-1330-58c5-64d2-78af479dfcf4@collabora.com>
 <CAGXv+5FhsKVGwoJxLP=-gV+rSHbQ8DUX0YACy0mPxYw+MC85=g@mail.gmail.com>
 <d8bfbb5f-07a7-4beb-ac1c-049825caf934@collabora.com>
 <CAGXv+5EJ6W6XCJR3busZ0HVQjLytZvzMMjUhhpR5g6Jc8sJQ+A@mail.gmail.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <CAGXv+5EJ6W6XCJR3busZ0HVQjLytZvzMMjUhhpR5g6Jc8sJQ+A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Moudy Ho <moudy.ho@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/09/2023 12:28, Chen-Yu Tsai wrote:
> On Tue, Sep 12, 2023 at 5:43 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 12/09/23 11:37, Chen-Yu Tsai ha scritto:
>>> On Tue, Sep 12, 2023 at 5:00 PM AngeloGioacchino Del Regno
>>> <angelogioacchino.delregno@collabora.com> wrote:
>>>>
>>>> Il 12/09/23 09:57, Moudy Ho ha scritto:
>>>>> Changes since v4:
>>>>> - Rebase on v6.6-rc1
>>>>> - Remove any unnecessary DTS settings.
>>>>> - Adjust the usage of MOD and clock in blending components.
>>>>>
>>>>> Changes since v3:
>>>>> - Depend on :
>>>>>     [1] https://patchwork.kernel.org/project/linux-media/list/?series=719841
>>>>> - Suggested by Krzysztof, integrating all newly added bindings for
>>>>>     the mt8195 MDP3 into the file "mediatek,mt8195-mdp3.yaml".
>>>>> - Revise MDP3 nodes with generic names.
>>>>>
>>>>> Changes since v2:
>>>>> - Depend on :
>>>>>     [1] MMSYS/MUTEX: https://patchwork.kernel.org/project/linux-mediatek/list/?series=711592
>>>>>     [2] MDP3: https://patchwork.kernel.org/project/linux-mediatek/list/?series=711618
>>>>> - Suggested by Rob to revise MDP3 bindings to pass dtbs check
>>>>> - Add parallel paths feature.
>>>>> - Add blended components settings.
>>>>>
>>>>> Changes since v1:
>>>>> - Depend on :
>>>>>     [1] MDP3 : https://patchwork.kernel.org/project/linux-mediatek/list/?series=698872
>>>>>     [2] MMSYS/MUTEX: https://patchwork.kernel.org/project/linux-mediatek/list/?series=684959
>>>>> - Fix compilation failure due to use of undeclared identifier in file "mtk-mdp3-cmdq.c"
>>>>>
>>>>> Hello,
>>>>>
>>>>> This patch is used to add support for MDP3 on the MT8195 platform that
>>>>> contains more picture quality components, and can arrange more pipelines
>>>>> through two sets of MMSYS and MUTEX respectively.
>>>>>
>>>>> Moudy Ho (14):
>>>>>     arm64: dts: mediatek: mt8183: correct MDP3 DMA-related nodes
>>>>>     arm64: dts: mediatek: mt8195: add MDP3 nodes
>>>>
>>>> Please send the DTS patches separately, those go through a different maintainer.
>>>
>>> I thought most people prefer the _full_ view in a patchset?
>>>
>>
>> Yeah but those going through a different maintainer makes it more straightforward
>> to pick; besides, essentially, you can also get a full view with dt-bindings
>> patches instead of devicetrees, as the latter are "constructed from" bindings
>> anyway.
> 
> Sure, but testing, especially by people not in the recipients or CC list,
> is a bit painful when the full set of patches isn't bundled together.
> Having them bundled together shows what the submitter tested and makes
> it easier for others to reproduce.
> 
> AFAIK other ARM platforms have been sending patches all grouped together.
> It's MediaTek that has been different, as they normally have (for Chromebooks)
> a system integration engineer handling the device tree stuff, while component
> driver owners just handle the drivers, and by extension, the DT bindings.
> 
>> Moreover, it would be definitely nice to add a link to the devicetree series
>> in the cover letter of this series, so that people *do* get a full overview
>> by checking both series :-)
> 
> Most maintainers seem to know what to do: apply the subset destined for
> their tree. At least the subsystems that frequently deal with DT-based
> platforms anyway.

As maintainer I know that I need to skip dts patches, but there is a risk that
I forget to drop them. So my preference is also to have them as a separate
patch series, but it's a preference only. If you *do* send it as a separate series,
then also include the linux-media mailinglist in the CC, that way I do have
the full overview if I need it.

Regards,

	Hans

> 
> 
> ChenYu
> 
>> Cheers!
>>
>>>> P.S.: The dt-bindings patch can be sent inside of this series, please do that.
>>>>
>>>> Thanks!
>>>> Angelo
>>>>
>>>>
>>

