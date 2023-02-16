Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C87699535
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 14:08:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1BF910ED6D;
	Thu, 16 Feb 2023 13:08:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A07D210ED59
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 13:08:51 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 8ABD0660219B;
 Thu, 16 Feb 2023 13:08:48 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1676552929;
 bh=1aMvxDh8d3+C/+m2WmV57NMDEipr+R/LGtcHEX+eb0w=;
 h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
 b=bDnXrSwE0Bt+o5pYbEKkMcaJCFdrIPQl8oEZjJo2QaiwE9jk6bQCwtS/MdxO7iq96
 icDV3WdrMXQ9CZ25dvrmYvaMhKMBkAimClZ7oYANFD3zD0dO89V23UcWHSD2ub41bN
 7uJFzcBP4F6E1uaF5GeBdxmFiTr7CVlQxowFWpQeWGNEtCILN9mX1O9tXmocqkrikR
 bOY/Yr7hzKyxlYgwM3iDeh0A8+3wRFqWUDIyqTGxkIEGniFafb8clhDJWPjlK6FFyf
 2UmDBsw+qtP7yOxigjwkm0Sixspy9BYdhaKYhoIOfTNpT+PUxS0cu878EiVgP2ClpP
 yRjHSygR12XHw==
Message-ID: <9f34badc-53b2-1152-2900-8e105feec55b@collabora.com>
Date: Thu, 16 Feb 2023 14:08:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v10 00/11] Add generic memory shrinker to VirtIO-GPU and
 Panfrost DRM drivers
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230108210445.3948344-1-dmitry.osipenko@collabora.com>
 <e5e9e8dd-a5b6-cfd2-44d6-4d5aa768e56c@collabora.com>
 <20230127081339.yovxofpboc4gfdgo@sirius.home.kraxel.org>
 <0081b2c3-56c9-3ed8-b419-5ce8a151999e@collabora.com>
 <Y+4eYqdH1Xw2OYX5@phenom.ffwll.local>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <Y+4eYqdH1Xw2OYX5@phenom.ffwll.local>
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
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Gerd Hoffmann <kraxel@redhat.com>, kernel@collabora.com,
 Sumit Semwal <sumit.semwal@linaro.org>, Steven Price <steven.price@arm.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Qiang Yu <yuq825@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 16/02/23 13:15, Daniel Vetter ha scritto:
> On Mon, Jan 30, 2023 at 03:02:10PM +0300, Dmitry Osipenko wrote:
>> On 1/27/23 11:13, Gerd Hoffmann wrote:
>>> On Thu, Jan 26, 2023 at 01:55:09AM +0300, Dmitry Osipenko wrote:
>>>> Hello Thomas and Gerd,
>>>>
>>>> On 1/9/23 00:04, Dmitry Osipenko wrote:
>>>>> This series:
>>>>>
>>>>>    1. Makes minor fixes for drm_gem_lru and Panfrost
>>>>>    2. Brings refactoring for older code
>>>>>    3. Adds common drm-shmem memory shrinker
>>>>>    4. Enables shrinker for VirtIO-GPU driver
>>>>>    5. Switches Panfrost driver to the common shrinker
>>>>>
>>>>> Changelog:
>>>>>
>>>>> v10:- Rebased on a recent linux-next.
>>>>>
>>>>>      - Added Rob's ack to MSM "Prevent blocking within shrinker loop" patch.
>>>>>
>>>>>      - Added Steven's ack/r-b/t-b for the Panfrost patches.
>>>>>
>>>>>      - Fixed missing export of the new drm_gem_object_evict() function.
>>>>>
>>>>>      - Added fixes tags to the first two patches that are making minor fixes,
>>>>>        for consistency.
>>>>
>>>> Do you have comments on this version? Otherwise ack will be appreciated.
>>>> Thanks in advance!
>>>
>>> Don't feel like signing off on the locking changes, I'm not that
>>> familiar with the drm locking rules.  So someone else looking at them
>>> would be good.  Otherwise the series and specifically the virtio changes
>>> look good to me.
>>>
>>> Acked-by: Gerd Hoffmann <kraxel@redhat.com>
>>
>> Thomas was looking at the the DRM core changes. I expect he'll ack them.
>>
>> Thank you for reviewing the virtio patches!
> 


> I think best-case would be an ack from msm people that this looks good
> (even better a conversion for msm to start using this).
> 

Dmitry B, Konrad, can you please help with this one?

Thanks!

Regards,
Angelo

> Otherwise I think the locking looks reasonable, I think the tricky bits
> have been moving the dma-buf rules, but if you want I can try to take
> another in-depth look. But would need to be in 2 weeks since I'm going on
> vacations, pls ping me on irc if I'm needed.
> 
> Otherwise would be great if we can land this soon, so that it can soak the
> entire linux-next cycle to catch any driver specific issues.
> -Daniel

