Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F01E893759D
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2024 11:20:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACB1610EB87;
	Fri, 19 Jul 2024 09:20:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="VdOah8/+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20BB110EB87
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 09:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1721380805;
 bh=yAETZC0ppWDyfmBdfHX8Kz6iCIh8buKJ8L4qqK40C4M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VdOah8/+V/XtUxxIeVO4oIpiIH0uCMgVd99oNApZzhhpP3jQV5Kljtp9IeuvGwNXB
 e2skTMRVBepNfeZO52MHmQMCeVo/k3JiAnLmji+QAvdPtChjV5azSSkVAsWW4XnYbv
 U7LIw1ghoUkOPUzSPRgCwacR5Qiy8O4/6hFQEE5V773FAd5HLYJ/DNigf9qQyGFm3b
 pHHNxN/cR4drlZg5v2+6rYcKBy/I1fBMnPpbqb5zIspHImL1NM4apEP0CITd0p1d/B
 UeeSScaI2QHoygyMFiMCa9mnxInK/BXRnQe8X8ehq8RDyVU27h5otNIM6T1BY9biSW
 PGjRwfbOlrPCg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id D57D73782063;
 Fri, 19 Jul 2024 09:20:04 +0000 (UTC)
Message-ID: <c5ba072f-5a38-4faf-9b8f-906bc896881d@collabora.com>
Date: Fri, 19 Jul 2024 11:20:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: Set sensible cursor width/height values to
 fix crash
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "daniel@fooishbar.org" <daniel@fooishbar.org>
Cc: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "kernel@collabora.com" <kernel@collabora.com>,
 =?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "fshao@chromium.org" <fshao@chromium.org>
References: <20240718082410.204459-1-angelogioacchino.delregno@collabora.com>
 <CAGXv+5GBg73kWuiDt=9s7M4oJeHhWOF3bPY7Ju+qn1kJgNNaGw@mail.gmail.com>
 <CAC=S1nigoJWAECBrm-Q=Co1-qd_yUhx3R4D9=dYeUV=gr5UYfQ@mail.gmail.com>
 <74e7477b-81c7-4713-80cc-1cb476185bc9@collabora.com>
 <CAPj87rPZRjmMPjaOY-UH4auTuMS6mh9N7=maRBzxut2OgtALbw@mail.gmail.com>
 <d6f20609-5127-4010-b691-40cd3b253283@collabora.com>
 <e74e25b01f85fb33d95e073f18a8049288b5c70d.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <e74e25b01f85fb33d95e073f18a8049288b5c70d.camel@mediatek.com>
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

Il 19/07/24 10:42, CK Hu (胡俊光) ha scritto:
> Hi, Angelo:
> 
> On Thu, 2024-07-18 at 13:23 +0200, AngeloGioacchino Del Regno wrote:
>> Il 18/07/24 13:10, Daniel Stone ha scritto:
>>> Hi all,
>>>
>>> On Thu, 18 Jul 2024 at 11:24, AngeloGioacchino Del Regno
>>> <angelogioacchino.delregno@collabora.com> wrote:
>>>> Il 18/07/24 11:27, Fei Shao ha scritto:
>>>>> This matches my preference in [1], so of course I'd like to see it
>>>>> merged... if maintainers are okay with it.
>>>>> Given I've tested the exact same change before:
>>>>> Reviewed-by: Fei Shao <fshao@chromium.org>
>>>>> Tested-by: Fei Shao <fshao@chromium.org>
>>>>
>>>> Thanks!
>>>
>>> And:
>>> Reviewed-by: Daniel Stone <daniels@collabora.com>
>>>
>>>>>> OOTH, Intel recently added a feature for enumerating "suggested"
>>>>>> cursor sizes. See https://urldefense.com/v3/__https://patchwork.freedesktop.org/patch/583299/__;!!CTRNKA9wMg0ARbw!nRf6mf-9tnE7vLYracLE6Xq_oblRvtENffF73fRzgz_E3zPc3yxeQPE5yPw95sj-ZeoiYJCQSIPWFZ0C3HCXpBkHikWK$
>>>>>>
>>>>>> Not sure if other compositors will end up using it or not.
>>>>
>>>> Yeah, that's good, and we might do that as well in MediaTek DRM... in a slightly
>>>> different way, as it looks like they are simply hinting the same values as the
>>>> mode_config is declaring... while we'd be adding a hint with a sensible size that
>>>> is less than the maximum supported one from the overlay.
>>>>
>>>> In reality, here, the issue is that the most popular compositors do not support
>>>> overlay planes (as in, they don't use them at all)... my first idea was to remove
>>>> the CURSOR plane entirely and declare it as per what it is for real (an OVERLAY),
>>>> but that would only give a performance penalty as that'd become yet another unused
>>>> plane and nothing else.
>>>>
>>>> If at least the most popular compositors did support overlay planes, I'd have done
>>>> that instead... but oh, well!
>>>>
>>>> And anyway I hope that the maintainers are okay with this because, well, otherwise
>>>> MediaTek SoCs won't be usable with any popular WM.
>>>
>>> Every compositor is going to use it, yeah. But until it does, people
>>> are just going to use cursor_width and cursor_size. A lot of older
>>> desktop hardware supports only a single fixed dimension for the cursor
>>> plane (hence the single values), so rather than guess if it needs to
>>> be 32x32 or 64x64 or whatever, people just allocate to the size. Not
>>> to mention that the old pre-atomic cursor ioctls actually require that
>>> you allocate for cursor_width x cursor_height.
>>>
>>> So yeah, this is the right fix - though you could even be more
>>> aggressive and reduce it to 256x256 - and supporting the CURSOR_SIZE
>>> property would be even more useful again.
>>>
>>
>> I thought about being more aggressive, but then I saw that IGT tests for up to 512
>> and that MSM also declares the same, so, making IGT happy because we can indeed
>> support that much (since we can support even more, but doesn't make sense) :-)
>>
>> Regarding CURSOR_SIZE ... right, I can take a look at that a bit later, most
>> probably not for this merge window, though.
> 
> This patch looks acceptable but it could be better.
> It's urgent to fix the crash, if better solution does not come out soon,
> I would apply this patch first.
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> 
> I will remove the Fixes tag because Shawn's patch has no logical problem but the system resource is not enough.
> 
> It's a dilemma that small size has no resource problem but application is limited
> and large size has resource problem but support more application.
> 

Thanks, but the Fixes tag is important, as otherwise v6.11 will be unusable :-)

Regards,
Angelo

> Regards,
> CK
> 
>>
>> Cheers!
>>
>>> Cheers,
>>> Daniel
>>
>>

