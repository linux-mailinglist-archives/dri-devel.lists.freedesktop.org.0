Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5770A2ECBE6
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 09:51:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5152989BC2;
	Thu,  7 Jan 2021 08:51:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C60A789BC2
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 08:51:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: tomeu) with ESMTPSA id E026A1F462C2
Subject: Re: [PATCH v7 3/4] drm/panfrost: devfreq: Disable devfreq when
 num_supplies > 1
To: Nicolas Boichat <drinkcat@chromium.org>
References: <20210107082653.3519337-1-drinkcat@chromium.org>
 <20210107162632.v7.3.I3af068abe30c9c85cabc4486385c52e56527a509@changeid>
 <a1367c40-7c30-95c2-0c7f-7eec58f04b9e@collabora.com>
 <CANMq1KDXomm4X8vyDPCHRy_KmHuqdschOhWRjiaR1Zzb6Rs8Pw@mail.gmail.com>
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Message-ID: <b7254087-179b-11a3-a958-0154a31f532f@collabora.com>
Date: Thu, 7 Jan 2021 09:51:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CANMq1KDXomm4X8vyDPCHRy_KmHuqdschOhWRjiaR1Zzb6Rs8Pw@mail.gmail.com>
Content-Language: en-US
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
Cc: Fei Shao <fshao@chromium.org>, David Airlie <airlied@linux.ie>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Kristian Kristensen <hoegsberg@chromium.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/7/21 9:49 AM, Nicolas Boichat wrote:
> On Thu, Jan 7, 2021 at 4:31 PM Tomeu Vizoso <tomeu.vizoso@collabora.com> wrote:
>>
>> On 1/7/21 9:26 AM, Nicolas Boichat wrote:
>>> GPUs with more than a single regulator (e.g. G72 on MT8183) will
>>> require platform-specific handling, disable devfreq for now.
>>>
>>> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
>>> ---
>>>
>>> Changes in v7:
>>>    - Fix GPU ID in commit message
>>>
>>> Changes in v6:
>>>    - New change
>>>
>>>    drivers/gpu/drm/panfrost/panfrost_devfreq.c | 9 +++++++++
>>>    1 file changed, 9 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
>>> index f44d28fad085..1f49043aae73 100644
>>> --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
>>> +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
>>> @@ -92,6 +92,15 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
>>>        struct thermal_cooling_device *cooling;
>>>        struct panfrost_devfreq *pfdevfreq = &pfdev->pfdevfreq;
>>>
>>> +     if (pfdev->comp->num_supplies > 1) {
>>> +             /*
>>> +              * GPUs with more than 1 supply require platform-specific handling:
>>> +              * continue without devfreq
>>> +              */
>>> +             DRM_DEV_ERROR(dev, "More than 1 supply is not supported yet\n");
>>
>> Should this be info instead?
> 
> Sure, will fix in v8.

Thanks. With that change, patches 3 and 4 are R-b.

Thanks again!

Tomeu

>>
>> Regards,
>>
>> Tomeu
>>
>>> +             return 0;
>>> +     }
>>> +
>>>        opp_table = dev_pm_opp_set_regulators(dev, pfdev->comp->supply_names,
>>>                                              pfdev->comp->num_supplies);
>>>        if (IS_ERR(opp_table)) {
>>>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
