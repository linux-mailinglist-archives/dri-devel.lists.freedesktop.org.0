Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA6F699E0F
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 21:43:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF00510E375;
	Thu, 16 Feb 2023 20:43:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 764EC10E377
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 20:43:44 +0000 (UTC)
Received: from [192.168.2.109] (unknown [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 35A1566021BE;
 Thu, 16 Feb 2023 20:43:41 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1676580222;
 bh=Ee5MRJEIOkcO3PfINM3BRzeUZD79otGICIShIQBleMk=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=I3haBrx0ZX/OSyd1ngjdwyQwNZyAwkGAKYN4OsEOHMgvbCtOYUUx+dwugfZgNFZhD
 VP/rvTD3/FAlGgEORn0VP4upH7mftUn7xwNBRylCBRoXEtBWAQwauM7/qBfe5ncxWc
 QEJKOAXJ+d9qEEYLRR+jZq83FwqrEN8YU+besWCfKRhkCGVwvLE2stxyCic4JNU5CU
 OsygyTgzLYiVyfBllzdXXFhcXK4qB6mxel/H0kdjYHN11/7vtJTebwcRCsJKua53BP
 WM6hVW/jn2jAXI02ni2YRN0dIc8gtphez0MCn4ik72VpbxteRaEl0utQMYo8H58t7m
 YD02KbEIB4FeQ==
Message-ID: <c6ae4f5f-7fe1-5497-a611-bee57672c289@collabora.com>
Date: Thu, 16 Feb 2023 23:43:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v10 00/11] Add generic memory shrinker to VirtIO-GPU and
 Panfrost DRM drivers
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 virtualization@lists.linux-foundation.org, David Airlie <airlied@gmail.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Herring <robh@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230108210445.3948344-1-dmitry.osipenko@collabora.com>
 <e5e9e8dd-a5b6-cfd2-44d6-4d5aa768e56c@collabora.com>
 <20230127081339.yovxofpboc4gfdgo@sirius.home.kraxel.org>
 <0081b2c3-56c9-3ed8-b419-5ce8a151999e@collabora.com>
 <Y+4eYqdH1Xw2OYX5@phenom.ffwll.local>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <Y+4eYqdH1Xw2OYX5@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
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

On 2/16/23 15:15, Daniel Vetter wrote:
> On Mon, Jan 30, 2023 at 03:02:10PM +0300, Dmitry Osipenko wrote:
>> On 1/27/23 11:13, Gerd Hoffmann wrote:
>>> On Thu, Jan 26, 2023 at 01:55:09AM +0300, Dmitry Osipenko wrote:
>>>> Hello Thomas and Gerd,
>>>>
>>>> On 1/9/23 00:04, Dmitry Osipenko wrote:
>>>>> This series:
>>>>>
>>>>>   1. Makes minor fixes for drm_gem_lru and Panfrost
>>>>>   2. Brings refactoring for older code
>>>>>   3. Adds common drm-shmem memory shrinker
>>>>>   4. Enables shrinker for VirtIO-GPU driver
>>>>>   5. Switches Panfrost driver to the common shrinker
>>>>>
>>>>> Changelog:
>>>>>
>>>>> v10:- Rebased on a recent linux-next.
>>>>>
>>>>>     - Added Rob's ack to MSM "Prevent blocking within shrinker loop" patch.
>>>>>
>>>>>     - Added Steven's ack/r-b/t-b for the Panfrost patches.
>>>>>
>>>>>     - Fixed missing export of the new drm_gem_object_evict() function.
>>>>>
>>>>>     - Added fixes tags to the first two patches that are making minor fixes,
>>>>>       for consistency.
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

The MSM pretty much isn't touched by this patchset, apart from the minor
common shrinker fix. Moving whole MSM to use drm_shmem should be a big
change to the driver.

The Panfrost and VirtIO-GPU drivers already got the acks. I also tested
the Lima driver, which uses drm-shmem helpers. Other DRM drivers should
be unaffected by this series.

> Otherwise I think the locking looks reasonable, I think the tricky bits
> have been moving the dma-buf rules, but if you want I can try to take
> another in-depth look. But would need to be in 2 weeks since I'm going on
> vacations, pls ping me on irc if I'm needed.

The locking conversion is mostly a straightforward replacement of mutex
with resv lock for drm-shmem. The dma-buf rules were tricky, another
tricky part was fixing the lockdep warning for the bogus report of
fs_reclaim vs GEM shrinker at the GEM destroy time where I borrowed the
drm_gem_shmem_resv_assert_held() solution from the MSM driver where Rob
had a similar issue.

> Otherwise would be great if we can land this soon, so that it can soak the
> entire linux-next cycle to catch any driver specific issues.

That will be great. Was waiting for Thomas to ack the shmem patches
since he reviewed the previous versions, but if you or anyone else could
ack them, then will be good too. Thanks!

-- 
Best regards,
Dmitry

