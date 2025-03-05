Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DE9A4FD12
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 12:03:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69DCE10E28E;
	Wed,  5 Mar 2025 11:03:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Ca+GaY1N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03DB810E28E
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 11:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1741172600;
 bh=RGJcaalCEarW5jwI3J/1uzxBnyofX9WJFnHBzN1I0u4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Ca+GaY1NHRG821pXxcN2YgQThJ4wozNyL5ewinAdLGmBBu63gQ4riKGjkQoaXPy1h
 eQsSYsnKtxuH2MRuR2tF4y/rz1OBlc8q1pp9rsyBnCFu5jp5LEo3f+0cE7D5AG0PoP
 1NqkHaf481Ivk35YPtiZybbVokgSfncR19+jtcHfh8PKwfhCb1dsZnu0j0ELO0QfRx
 +U880/O+Uxtq1Rjpz/ef54E3OVaFFjIo3ePswS8+azo/gVyuPNmx4bB7SOTsa3qtLf
 5Z6c7ceG9rRTfPt7bRyt90UtUc7SLVunx9GHUUzETVutemstvWn1oDcI8Yh8MXiL6B
 C4rVCXAnzNf+Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9C09017E0343;
 Wed,  5 Mar 2025 12:03:19 +0100 (CET)
Message-ID: <8203317e-7f99-4ea5-bda0-fcd791602a9f@collabora.com>
Date: Wed, 5 Mar 2025 12:03:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/8] soc: mediatek: mtk-cmdq: Add pa_base parsing for
 unsupported subsys ID hardware
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 =?UTF-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
 =?UTF-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?UTF-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
 <Xiandong.Wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "fshao@chromium.org" <fshao@chromium.org>,
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?= <Xavier.Chang@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "treapking@chromium.org" <treapking@chromium.org>
References: <20250218054405.2017918-1-jason-jh.lin@mediatek.com>
 <20250218054405.2017918-5-jason-jh.lin@mediatek.com>
 <581fc075-25d8-4104-a4ee-8c97e1a017e6@collabora.com>
 <03c523e66fd56442f49c38456476cf18be59e8fb.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <03c523e66fd56442f49c38456476cf18be59e8fb.camel@mediatek.com>
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

Il 05/03/25 10:46, Jason-JH Lin (林睿祥) ha scritto:
> On Tue, 2025-03-04 at 10:35 +0100, AngeloGioacchino Del Regno wrote:
>>
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>
>>
>> Il 18/02/25 06:41, Jason-JH Lin ha scritto:
>>> When GCE executes instructions, the corresponding hardware register
>>> can be found through the subsys ID. For hardware that does not
>>> support
>>> subsys ID, its subsys ID will be set to invalid value and its
>>> physical
>>> address needs to be used to generate GCE instructions.
>>>
>>> This commit adds a pa_base parsing flow to the cmdq_client_reg
>>> structure
>>> for these unsupported subsys ID hardware.
>>>
>>
>> Does this work only for the MMINFRA located GCEs, or does this work
>> also for
>> the legacy ones in MT8173/83/88/92/95 // MT6795/6893/etc?
>>
>> In order to actually review and decide, I do need to know :-)
>>
> 
> Yes, it's for the SoCs without subsys ID, it's not related to the
> MMINFRA.
> 
> This can also work on MT8173/83/92/95 // MT6795/6893/etc.
> You can remove the `mediatek,gce-client-reg` properties in their dtsi
> and cherry-pick this series to verify it. :-)
> 

This is curious - and that brings more questions to the table (for curiosity
more than anything else at this point).

Since this is a way to make use of the CMDQ for address ranges that are not tied
to any subsys id (hence no gce-client-reg and just physical address parsing for
generating instructions), do you know what are the performance implications of
using this, instead of subsys IDs on SoCs that do support them?

Being clear: if we were to migrate a SoC like MT8195 to using this globally
instead of using subsys ids, would the performance be degraded?
And if yes, do you know by how much?

What you're proposing almost looks like being too good to be true - and makes
me wonder, at this point, why the subsys id was used in the first place :-)

Cheers!
Angelo

> Regards,
> Jason-JH Lin
> 
>> Thanks,
>> Angelo
>>
>>
> 



