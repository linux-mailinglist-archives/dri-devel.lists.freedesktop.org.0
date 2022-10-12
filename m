Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 756C55FC80F
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 17:16:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C10D310E519;
	Wed, 12 Oct 2022 15:16:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22F0E10E519
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Oct 2022 15:16:13 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 43225660037C;
 Wed, 12 Oct 2022 16:16:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1665587771;
 bh=3+fGB/65ejU9q7GUMaC7sKOP/HgDUmBA+dw0IyewzE8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SoIIVHoaco8/OyxxveuNgb9Lhyv/OXfpquRyrU9psOC7prSoAY3gUmq9UzEAu55n1
 j2HTt7VI3X+uxfm046LpPTIOxOzDVZBN+zhUD87pM0+uLwy6G6SKl/k5KHt6UcM+vP
 VFJ3Qr63T39gi+onlgO6E2sY9KLAaiGpH09Y1UFeTelbiukOw7uIi1bHoF+xLTv7l5
 T/NLbNYiPo9GitAyk2p7bA4GXu7QFQlDC9hJm7hwa+SyBjUob2kxmk4nVIfpLU9V+y
 zS7G6VQ37QRY3jf+mQpi4lNXh7xY7K003R/IDN+gK6JIcwlxzObILR2BWdqT6e0tjz
 MYXV/Tphx/FuQ==
Message-ID: <163306ba-09a1-3b27-0c0d-5bafc871f7dc@collabora.com>
Date: Wed, 12 Oct 2022 17:16:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [RESEND PATCH v2] drm/mediatek: Add AFBC support to Mediatek DRM
 driver
Content-Language: en-US
To: Justin Green <greenjustin@chromium.org>
References: <20221010150157.1864492-1-greenjustin@google.com>
 <664e32dc-3f91-48ae-64a1-6dcecc9dfb5b@collabora.com>
 <CAHC42Rf7o61NF3LNQkm4BFcBHMKEP2np3sZMvM7KYczCsurHKA@mail.gmail.com>
 <6548c0ea-d1c0-2de2-99b6-4cfc27e8b938@collabora.com>
 <CAHC42RfKROmaPTkf73eCuU7CV3YhhxyCVEp9UA94XNjMfSzLAQ@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAHC42RfKROmaPTkf73eCuU7CV3YhhxyCVEp9UA94XNjMfSzLAQ@mail.gmail.com>
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
Cc: chunkuang.hu@kernel.org, airlied@linux.ie, jason-jh.lin@mediatek.com,
 justin.yeh@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, wenst@chromium.org, matthias.bgg@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 12/10/22 16:12, Justin Green ha scritto:
>> These would be different from the macros that are available in bitfield.h, but
>> not *fundamentally* different, so these would look a little redundant...
>>
>> I think that you refer to that `pitch` variable that's coming from the DRM(/fb)
>> API... and bitfield macros are for register access... so I guess that one clean
>> way of avoiding the magic shifting (that is purely used to split the 32-bits
>> number in two 16-bits 'chunks') would be to perhaps use a union, so that you
>> will have something like u.pitch_lsb, u.pitch_msb (with lsb/msb being two u16).
> 
> Do you mean something like this?
> 
> union pitch_val {
>       struct split_pitch_val {
>            uint16_t lsb;
>            uint16_t msb;
>       } split;
>       uint32_t val;
> };
> 
> I think my concern with that approach would be it assumes the compiler
> packs structs tightly and it also assumes the endianness of the
> machine, whereas a bitshift is maybe more portable. Is this an issue
> worth considering since we know this driver will only run on specific
> MTK SoCs?

Yes I mean something like that (except, use u16, u32 short form)... and that
should be safe really. As for the endianness, a lot more would break already,
so I don't see that as a concern right now.
