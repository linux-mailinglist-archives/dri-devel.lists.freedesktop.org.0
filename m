Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A29C0A50903
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 19:13:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C726891B4;
	Wed,  5 Mar 2025 18:08:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="BgTVMv1f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16889891B4
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 18:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1741198089;
 bh=RSrGA34yP7qtDktQg873/4X5XR2J1ZoUMnU85sv0+14=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BgTVMv1fqV1j9qJ2GNvgOfdOeYCxa7JsX7HymNujv2pzgOhAjxjWwXSRmfJh1ZtSd
 q8XiB5unEJBko8+PkZ1NJR0TND/dAh8rLegGtjSE481p+QUbIqoc6ZI6FMSc6AwCpz
 9d81cYy/gblpx+soZ4ar8a+HBXjnVJSNiGujXU1DAaU6Orddlt/Q+JhZpnMflYQ5mO
 A2bk7clUtWz38Z0QhdU5v1uG2qKkLVspiGm/8LyNyB6KBpt1TfV3+tDgKKxmhHEmpR
 vqkF6UnYlgkl06AXSAew8RVcYM0kFfhowcGXAb537SkzF8CtqBD9eMC3q4LWWGsESf
 GnDhTNmP1RxMw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 2B21117E0599;
 Wed,  5 Mar 2025 19:08:08 +0100 (CET)
Message-ID: <d02b6bbe-0d32-4e3f-985e-a0b610f72d98@collabora.com>
Date: Wed, 5 Mar 2025 19:08:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/8] soc: mediatek: Add programming flow for
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
 <20250218054405.2017918-7-jason-jh.lin@mediatek.com>
 <c52b132b-fc08-4d1c-8276-1771f7457014@collabora.com>
 <ddcf01c82f92ee461875e1122b009b7fca691127.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <ddcf01c82f92ee461875e1122b009b7fca691127.camel@mediatek.com>
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

Il 05/03/25 17:12, Jason-JH Lin (林睿祥) ha scritto:
> On Tue, 2025-03-04 at 10:41 +0100, AngeloGioacchino Del Regno wrote:
>>
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>
>>
>> Il 18/02/25 06:41, Jason-JH Lin ha scritto:
>>> To support hardware without subsys IDs on new SoCs, add a
>>> programming
>>> flow that checks whether the subsys ID is valid. If the subsys ID
>>> is
>>> invalid, the flow will call 2 alternative CMDQ APIs:
>>> cmdq_pkt_assign() and cmdq_pkt_write_s_value() to achieve the same
>>> functionality.
>>>
>>> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
>>> ---
>>>    drivers/soc/mediatek/mtk-mmsys.c | 14 +++++++++++---
>>>    drivers/soc/mediatek/mtk-mutex.c | 11 +++++++++--
>>>    2 files changed, 20 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/soc/mediatek/mtk-mmsys.c
>>> b/drivers/soc/mediatek/mtk-mmsys.c
>>> index bb4639ca0b8c..ce949b863b05 100644
>>> --- a/drivers/soc/mediatek/mtk-mmsys.c
>>> +++ b/drivers/soc/mediatek/mtk-mmsys.c
>>> @@ -167,9 +167,17 @@ static void mtk_mmsys_update_bits(struct
>>> mtk_mmsys *mmsys, u32 offset, u32 mask,
>>>        u32 tmp;
>>>
>>>        if (mmsys->cmdq_base.size && cmdq_pkt) {
>>> -             ret = cmdq_pkt_write_mask(cmdq_pkt, mmsys-
>>>> cmdq_base.subsys,
>>> -                                       mmsys->cmdq_base.offset +
>>> offset, val,
>>> -                                       mask);
>>> +             offset += mmsys->cmdq_base.offset;
>>> +             if (mmsys->cmdq_base.subsys != CMDQ_SUBSYS_INVALID) {
>>
>> You're still anyway passing the subsys to cmdq_pkt_write_mask(),
>> right?!
>> Why don't you just handle this in cmdq_pkt_write_mask() then? ;-)
>>
>> I can see this pattern being repeated over and over in both
>> drm/mediatek and MDP3
>> drivers, and it's not necessary to duplicate this many times when you
>> can write it
>> just once.
>>
>> Would've also been faster for you to implement... :-D
>>
> 
> I think did it in the series V1:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20241121042602.32730-5-jason-jh.lin@mediatek.com/
> 
> Because it'll need to passing the base_pa and that will need to change
> the interface for original APIs.
> 
> And CK think that's not a necessary to change the APIs. It can be done
> by cmdq_pkt_assign() + cmdq_pkt_write_s_mask_value() in the client
> drivers. Then you can see this pattern in everywhere. :-)
> 

Using likely(x) and unlikely(x) should be avoided, really, unless it's something
that is really really really really ... really ... rea.... likely or unlikely :-)

Btw. Changing the APIs is a bit difficult, but I disagree with CK about not
"inventing" a new API for the unsupported-subsys flow.

It's true, it is not *strictly* needed to add a function, but it's good for any
kind of future maintainability - as I explained, it's easier then to fix a problem
if there's one.... and well, I can see that you agree with me, because effectively
you did it the first time :-)

CK mentioned using cmdq_pkt_write() *or* cmdq_pkt_assignwrite/cmdq_pkt_write_pa()
(however you wanna call it, it's fine for me), in drivers that know that there
always is or there always isn't a subsys ID: that's a good suggestion, as this can
be eventually done with assigning a function pointer, so, no conditionals at each
operation.

My point of view, finally, is:
  - This is just another way of doing cmdq_pkt_write()
    - This, at the end of the day, does exactly what cmdq_pkt_write() is doing,
      except it's doing it with two instructions instead of one;
  - The same thing can be done in two different ways (depending on SoC)
    - This same thing should have a function that does it.

A function that does it can be

int cmdq_pkt_write_pa(struct cmdq_pkt *pkt, u8 subsys /*unused*/, u32 pa_base, u16 
offset, u32 value)
{
	err = cmdq_pkt_assign(pkt, 0, CMDQ_ADDR_HIGH(pa_base));
	if (err < 0)
		return err;

	return cmdq_pkt_write_s_value( .... etc)
}

int cmdq_pkt_write() <--- unchanged, scheduled for removal after all drivers migrated

int cmdq_pkt_write_subsys(struct cmdq_pkt *pkt, u8 subsys, u32 pa_base /*unused*/, 
u16 offset, u32 value)
{
	/* This function will get the contents of cmdq_pkt_write once removed,
            but, in the meanwhile, to avoid duplication we just call that: */

	return cmdq_pkt_write(pkt, subsys, offset, value);
}

- Are we adding one more function parameter? Yes
- Is this impacting performance overall? Not really

After all, we're living in an ARMv8 (actually, ARMv9 for new ones) world, so
one more function param won't hurt anyone.

I think that's the best of both worlds, and makes everyone happy.
Are you happy with that? :-)

Cheers,
Angelo

