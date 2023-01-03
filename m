Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD39265C41E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 17:40:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9377A10E26E;
	Tue,  3 Jan 2023 16:40:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C651510E26E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jan 2023 16:40:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 819861516;
 Tue,  3 Jan 2023 08:40:51 -0800 (PST)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 804AE3F71A;
 Tue,  3 Jan 2023 08:40:07 -0800 (PST)
Message-ID: <832f3200-77ac-1ee0-e1b5-5f56353cba36@arm.com>
Date: Tue, 3 Jan 2023 16:39:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 2/3] iommu/sound: Use component_match_add_of helper
Content-Language: en-GB
To: Maxime Ripard <maxime@cerno.tech>
References: <20221222233759.1934852-1-sean.anderson@seco.com>
 <20221222233759.1934852-3-sean.anderson@seco.com>
 <7897d4a6-bf43-becd-3437-7a254f38f6be@arm.com>
 <20230103161550.4tui3ihl65olvkd7@houat>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20230103161550.4tui3ihl65olvkd7@houat>
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
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Sean Anderson <sean.anderson@seco.com>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, iommu@lists.linux.dev,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Yong Wu <yong.wu@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/01/2023 4:15 pm, Maxime Ripard wrote:
> Hi Robin,
> 
> On Tue, Jan 03, 2023 at 01:01:07PM +0000, Robin Murphy wrote:
>> Hi Sean,
>>
>> On 22/12/2022 11:37 pm, Sean Anderson wrote:
>>> Convert users of component_match_add_release with component_release_of
>>> and component_compare_of to component_match_add_of.
>>>
>>> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
>>> Acked-by: Mark Brown <broonie@kernel.org>
>>> ---
>>>
>>> Changes in v2:
>>> - Split off from helper addition
>>>
>>>    drivers/iommu/mtk_iommu.c    | 3 +--
>>>    drivers/iommu/mtk_iommu_v1.c | 3 +--
>>>    sound/soc/codecs/wcd938x.c   | 6 ++----
>>>    3 files changed, 4 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
>>> index 2ab2ecfe01f8..483b7a9e4410 100644
>>> --- a/drivers/iommu/mtk_iommu.c
>>> +++ b/drivers/iommu/mtk_iommu.c
>>> @@ -1079,8 +1079,7 @@ static int mtk_iommu_mm_dts_parse(struct device *dev, struct component_match **m
>>>    		}
>>>    		data->larb_imu[id].dev = &plarbdev->dev;
>>> -		component_match_add_release(dev, match, component_release_of,
>>> -					    component_compare_of, larbnode);
>>> +		component_match_add_of(dev, match, larbnode);
>>
>> I've long since given up trying to make sense of how the DRM tree works, but
>> the conflicting change is definitely already in mainline:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=b5765a1b44bea9dfcae69c53ffeb4c689d0922a7
> 
> As far as I can see, that patch doesn't affect DRM at all, and the
> commit you pointed to doesn't either, nor has it been merged through the
> DRM tree.

Right it doesn't affect DRM, and was merged via the IOMMU tree, but it 
does affect *this* patch, which Sean has based on a drm-next branch that 
seemingly still wasn't up to date with 6.2-rc1 at the time.

Since v2 had already been posted, it seemed like a bright idea to 
comment here to clarify that it was still relevant, rather than bumping 
the old thread to reply directly. Apologies for any confusion.

In practical terms I think it's merely a case of dropping this hunk; the 
other one in mtk_iommu_v1.c looks fine to me.

Cheers,
Robin.

> Can you expand a bit on how we're involved in this, what we should
> clarify or help with?
> 
> Maxime
