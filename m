Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 060796A1D26
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 14:53:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A65F410EA31;
	Fri, 24 Feb 2023 13:53:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 455AC10E17D
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 13:53:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C76CC1042;
 Fri, 24 Feb 2023 05:53:49 -0800 (PST)
Received: from [10.1.38.16] (e122027.cambridge.arm.com [10.1.38.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 454093F71A;
 Fri, 24 Feb 2023 05:53:04 -0800 (PST)
Message-ID: <8c20f01a-2123-b76d-bf70-bf75aec9efb8@arm.com>
Date: Fri, 24 Feb 2023 13:53:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 08/11] drm/panfrost: Add the MT8192 GPU ID
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
References: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com>
 <20230223133440.80941-9-angelogioacchino.delregno@collabora.com>
 <CAGXv+5Hzin_5aTqMRRztWbDR64z6_oFOx2hUVnpJBvk9xDzrfw@mail.gmail.com>
 <61ebdd1a-2737-0516-08fd-3b9aa0ddd4fe@collabora.com>
Content-Language: en-GB
From: Steven Price <steven.price@arm.com>
In-Reply-To: <61ebdd1a-2737-0516-08fd-3b9aa0ddd4fe@collabora.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/02/2023 13:08, AngeloGioacchino Del Regno wrote:
> Il 24/02/23 11:06, Chen-Yu Tsai ha scritto:
>> On Thu, Feb 23, 2023 at 9:35 PM AngeloGioacchino Del Regno
>> <angelogioacchino.delregno@collabora.com> wrote:
>>>
>>> From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
>>>
>>> MediaTek MT8192 has a Mali-G57 with a special GPU ID. Add its GPU ID,
>>> but treat it as otherwise identical to a standard Mali-G57.
>>>
>>> We do _not_ fix up the GPU ID here -- userspace needs to be aware of the
>>> special GPU ID, in case we find functional differences between
>>> MediaTek's implementation and the standard Mali-G57 down the line.
>>>
>>> Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
>>> Signed-off-by: AngeloGioacchino Del Regno
>>> <angelogioacchino.delregno@collabora.com>
>>> Reviewed-by: Steven Price <steven.price@arm.com>
>>
>> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
>>
>> As previously mentioned, MT8195 Mali G57 has minor revision number 1.
>> Do we need to handle that?
>>
> 
> Maybe something went wrong while sending the reply to the same question
> on v2?
> 
> Anyway, from what I can see on my MT8195 machine, it works fine without
> adding
> any particular handling...
> 
> Alyssa, Steven,
> are you aware of anything that we should consider?

The minor revision means that the set of HW workarounds might be
different. Specifically it appears that "BASE_HW_ISSUE_TTRX_3485"
applies to G57 ('Natt') r0p0 but not r0p1.

That particular workaround is a horrendous "dummy job" in kbase and we
don't have an implementation in Panfrost. However Panfrost also doesn't
(yet[1]) proactively SOFT_STOP jobs so is also unlikely to be affected.

TLDR; Minor revision 1 has a HW bug fixed, Panfrost isn't affected by
the bug anyway.

Steve

[1] It's been on my todo list for a while to look at improving job
scheduling, but to be honest I doubt I'm going to get round to it with
Panfrost, and PanCSF obviously changes the job scheduling anyway.

> Regards,
> Angelo
> 
>>> ---
>>>   drivers/gpu/drm/panfrost/panfrost_gpu.c | 8 ++++++++
>>>   1 file changed, 8 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c
>>> b/drivers/gpu/drm/panfrost/panfrost_gpu.c
>>> index 6452e4e900dd..d28b99732dde 100644
>>> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
>>> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
>>> @@ -204,6 +204,14 @@ static const struct panfrost_model gpu_models[] = {
>>>
>>>          GPU_MODEL(g57, 0x9001,
>>>                  GPU_REV(g57, 0, 0)),
>>> +
>>> +       /* MediaTek MT8192 has a Mali-G57 with a different GPU ID
>>> from the
>>> +        * standard. Arm's driver does not appear to handle this model.
>>> +        * ChromeOS has a hack downstream for it. Treat it as
>>> equivalent to
>>> +        * standard Mali-G57 for now.
>>> +        */
>>> +       GPU_MODEL(g57, 0x9003,
>>> +               GPU_REV(g57, 0, 0)),
>>>   };
>>>
>>>   static void panfrost_gpu_init_features(struct panfrost_device *pfdev)
>>> -- 
>>> 2.39.2
>>>
> 
> 

