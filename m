Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 796CF87EC25
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 16:27:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B7AA10FA2B;
	Mon, 18 Mar 2024 15:27:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="gQrgSVIm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5B8A10E77A
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 15:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g/yrJhHpWEK8h2yuVA/h39Mrnwl0MZC8CF+WSJwnrAo=; b=gQrgSVImaqa79bUBUU1GbA76yI
 fqSxdrZL183aMFcE2FtXB9YZEHas7WjNLkmqOB3nO2tzgspI4csQlzOpgrdXlY6ux7k/QwDLlWkP8
 6u7gPQnvOCNZCReuXhaMsdSivSaweb05nDCxm0G/CGOv4Wk5qZoWJKqeNEa6OQlclruDn8Ed4weJm
 f5Egd+iQmzd5HUR/Kw6lSMYvJOxplvgBJDrNSfJ4lNxvvnkujaLnFzy/bOmuM61KWC/6Aj4Jjsikr
 J/y4kSKwr0LNhRP811wYZiJt67iWgxVgvg2bh6Kab07Z+VUu0w7j8/S8GuP5dTncJ98l9qu2xVjM/
 igtWg7Pg==;
Received: from [84.65.0.132] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1rmEtR-00C05E-4A; Mon, 18 Mar 2024 16:27:17 +0100
Message-ID: <0aeba332-73f9-46a7-a6d4-dc1822216b67@igalia.com>
Date: Mon, 18 Mar 2024 15:27:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] drm/gem: Add a mountpoint parameter to
 drm_gem_object_init()
Content-Language: en-GB
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 Russell King <linux@armlinux.org.uk>, Lucas Stach <l.stach@pengutronix.de>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Sui Jingfeng <suijingfeng@loongson.cn>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Thierry Reding
 <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Huang Rui <ray.huang@amd.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Hugh Dickins <hughd@google.com>,
 linux-mm@kvack.org
References: <20240311100959.205545-1-mcanal@igalia.com>
 <20240311100959.205545-3-mcanal@igalia.com>
 <30a7f20b-1f2c-41cb-b193-03429c160b63@igalia.com>
 <3a5d07c0-120f-47f9-a35a-31f3bfcc9330@amd.com>
 <07885e3b-ee7b-456b-9fad-17d9009a4cb7@igalia.com>
 <a0ac2e10-f5f5-4fbb-b591-bd188967ce53@amd.com>
 <e8165baa-9ded-4149-aaa6-6713d112b621@igalia.com>
 <69576e6d-9704-42b9-905f-289f9f9017b9@amd.com>
 <ed7ecd56-0b5e-4543-80f6-7d28ddf8e2ec@igalia.com>
 <9cfb7f83-2d76-4e8d-9052-5975da71e0dc@amd.com>
 <2118492c-f223-41e9-8c1e-3c03d976301e@igalia.com>
 <68452c6c-12d7-4e60-9598-369acc9fc360@amd.com>
 <a07e4bc2-04af-4e98-8a9c-ccab31bca854@igalia.com>
 <5f1a758b-b4f6-4fc3-b16b-29d731415636@amd.com>
 <00a4aa2e-e279-48ff-bc1f-8a72ef5b4491@igalia.com>
 <28ee9d07-059b-4ac1-97f7-21a74b532b12@amd.com>
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <28ee9d07-059b-4ac1-97f7-21a74b532b12@amd.com>
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


On 18/03/2024 15:05, Christian König wrote:
> Am 18.03.24 um 15:24 schrieb Maíra Canal:
>> Not that the CC list wasn't big enough, but I'm adding MM folks
>> in the CC list.
>>
>> On 3/18/24 11:04, Christian König wrote:
>>> Am 18.03.24 um 14:28 schrieb Maíra Canal:
>>>> Hi Christian,
>>>>
>>>> On 3/18/24 10:10, Christian König wrote:
>>>>> Am 18.03.24 um 13:42 schrieb Maíra Canal:
>>>>>> Hi Christian,
>>>>>>
>>>>>> On 3/12/24 10:48, Christian König wrote:
>>>>>>> Am 12.03.24 um 14:09 schrieb Tvrtko Ursulin:
>>>>>>>>
>>>>>>>> On 12/03/2024 10:37, Christian König wrote:
>>>>>>>>> Am 12.03.24 um 11:31 schrieb Tvrtko Ursulin:
>>>>>>>>>>
>>>>>>>>>> On 12/03/2024 10:23, Christian König wrote:
>>>>>>>>>>> Am 12.03.24 um 10:30 schrieb Tvrtko Ursulin:
>>>>>>>>>>>>
>>>>>>>>>>>> On 12/03/2024 08:59, Christian König wrote:
>>>>>>>>>>>>> Am 12.03.24 um 09:51 schrieb Tvrtko Ursulin:
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Hi Maira,
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> On 11/03/2024 10:05, Maíra Canal wrote:
>>>>>>>>>>>>>>> For some applications, such as using huge pages, we might 
>>>>>>>>>>>>>>> want to have a
>>>>>>>>>>>>>>> different mountpoint, for which we pass in mount flags 
>>>>>>>>>>>>>>> that better match
>>>>>>>>>>>>>>> our usecase.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Therefore, add a new parameter to drm_gem_object_init() 
>>>>>>>>>>>>>>> that allow us to
>>>>>>>>>>>>>>> define the tmpfs mountpoint where the GEM object will be 
>>>>>>>>>>>>>>> created. If
>>>>>>>>>>>>>>> this parameter is NULL, then we fallback to 
>>>>>>>>>>>>>>> shmem_file_setup().
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> One strategy for reducing churn, and so the number of 
>>>>>>>>>>>>>> drivers this patch touches, could be to add a lower level 
>>>>>>>>>>>>>> drm_gem_object_init() (which takes vfsmount, call it 
>>>>>>>>>>>>>> __drm_gem_object_init(), or drm__gem_object_init_mnt(), 
>>>>>>>>>>>>>> and make drm_gem_object_init() call that one with a NULL 
>>>>>>>>>>>>>> argument.
>>>>>>>>>>>>>
>>>>>>>>>>>>> I would even go a step further into the other direction. 
>>>>>>>>>>>>> The shmem backed GEM object is just some special handling 
>>>>>>>>>>>>> as far as I can see.
>>>>>>>>>>>>>
>>>>>>>>>>>>> So I would rather suggest to rename all drm_gem_* function 
>>>>>>>>>>>>> which only deal with the shmem backed GEM object into 
>>>>>>>>>>>>> drm_gem_shmem_*.
>>>>>>>>>>>>
>>>>>>>>>>>> That makes sense although it would be very churny. I at 
>>>>>>>>>>>> least would be on the fence regarding the cost vs benefit.
>>>>>>>>>>>
>>>>>>>>>>> Yeah, it should clearly not be part of this patch here.
>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>>> Also the explanation why a different mount point helps with 
>>>>>>>>>>>>> something isn't very satisfying.
>>>>>>>>>>>>
>>>>>>>>>>>> Not satisfying as you think it is not detailed enough to say 
>>>>>>>>>>>> driver wants to use huge pages for performance? Or not 
>>>>>>>>>>>> satisying as you question why huge pages would help?
>>>>>>>>>>>
>>>>>>>>>>> That huge pages are beneficial is clear to me, but I'm 
>>>>>>>>>>> missing the connection why a different mount point helps with 
>>>>>>>>>>> using huge pages.
>>>>>>>>>>
>>>>>>>>>> Ah right, same as in i915, one needs to mount a tmpfs instance 
>>>>>>>>>> passing huge=within_size or huge=always option. Default is 
>>>>>>>>>> 'never', see man 5 tmpfs.
>>>>>>>>>
>>>>>>>>> Thanks for the explanation, I wasn't aware of that.
>>>>>>>>>
>>>>>>>>> Mhm, shouldn't we always use huge pages? Is there a reason for 
>>>>>>>>> a DRM device to not use huge pages with the shmem backend?
>>>>>>>>
>>>>>>>> AFAIU, according to b901bb89324a ("drm/i915/gemfs: enable THP"), 
>>>>>>>> back then the understanding was within_size may overallocate, 
>>>>>>>> meaning there would be some space wastage, until the memory 
>>>>>>>> pressure makes the thp code split the trailing huge page. I 
>>>>>>>> haven't checked if that still applies.
>>>>>>>>
>>>>>>>> Other than that I don't know if some drivers/platforms could 
>>>>>>>> have problems if they have some limitations or hardcoded 
>>>>>>>> assumptions when they iterate the sg list.
>>>>>>>
>>>>>>> Yeah, that was the whole point behind my question. As far as I 
>>>>>>> can see this isn't driver specific, but platform specific.
>>>>>>>
>>>>>>> I might be wrong here, but I think we should then probably not 
>>>>>>> have that handling in each individual driver, but rather 
>>>>>>> centralized in the DRM code.
>>>>>>
>>>>>> I don't see a point in enabling THP for all shmem drivers. A huge 
>>>>>> page
>>>>>> is only useful if the driver is going to use it. On V3D, for example,
>>>>>> I only need huge pages because I need the memory contiguously 
>>>>>> allocated
>>>>>> to implement Super Pages. Otherwise, if we don't have the Super Pages
>>>>>> support implemented in the driver, I would be creating memory 
>>>>>> pressure
>>>>>> without any performance gain.
>>>>>
>>>>> Well that's the point I'm disagreeing with. THP doesn't seem to 
>>>>> create much extra memory pressure for this use case.
>>>>>
>>>>> As far as I can see background for the option is that files in 
>>>>> tmpfs usually have a varying size, so it usually isn't beneficial 
>>>>> to allocate a huge page just to find that the shmem file is much 
>>>>> smaller than what's needed.
>>>>>
>>>>> But GEM objects have a fixed size. So we of hand knew if we need 
>>>>> 4KiB or 1GiB and can therefore directly allocate huge pages if they 
>>>>> are available and object large enough to back them with.
>>>>>
>>>>> If the memory pressure is so high that we don't have huge pages 
>>>>> available the shmem code falls back to standard pages anyway.
>>>>
>>>> The matter is: how do we define the point where the memory pressure 
>>>> is high?
>>>
>>> Well as driver developers/maintainers we simply don't do that. This 
>>> is the job of the shmem code.
>>>
>>>> For example, notice that in this implementation of Super Pages
>>>> for the V3D driver, I only use a Super Page if the BO is bigger than 
>>>> 2MB. I'm doing that because the Raspberry Pi only has 4GB of RAM 
>>>> available for the GPU. If I created huge pages for every BO 
>>>> allocation (and initially, I tried that), I would end up with hangs 
>>>> in some applications.
>>>
>>> Yeah, that is what I meant with the trivial optimisation to the shmem 
>>> code. Essentially when you have 2MiB+4KiB as BO size then the shmem 
>>> code should use a 2MiB and a 4KiB page to back them, but what it 
>>> currently does is to use two 2MiB pages and then split up the second 
>>> page when it find that it isn't needed.
>>>
>>> That is wasteful and leads to fragmentation, but as soon as we stop 
>>> doing that we should be fine to enable it unconditionally for all 
>>> drivers.
>>
>> I see your point, but I believe that it would be tangent to the goal of
>> this series. As you mentioned, currently, we have a lot of memory
>> fragmentation when using THP and while we don't solve that (at the tmpfs
>> level), I believe we could move on with the current implementation (with
>> improvements proposed by Tvrtko).
> 
> Oh, I seriously don't want to block this patch set here. Just asking if 
> it's the right approach.
> 
> Point is we might need to revert the driver changes again when THP is 
> further optimized and the options aren't needed any more.
> 
> But if and how that should happen is perfectly up to Tvrtko.

Seem I got some un-intended voting powers here. :)

What I think would work best is, if Maíra solves the v3d part first and 
then she can propose/float the wider DRM/GEM change to always use THP. 
Because that one will require some wider testing and acks.

My concern there will be the behaviour of within_size mode. I was 
reading 465c403cb508 (drm/i915: introduce simple gemfs) the other day 
which made my think even then THP would initially over allocate. Or 
maybe the comment added in that commit wasn't fully accurate. If 
within_size is not high impact like that, then it GEM wide change might 
be feasible. With some opt-out facility or not I don't know.

In any case, as long as the v3d work can be done with not too much churn 
to common code, I think separating that as follow up should not cause a 
lot of additional churn. Should all be hidden in the implementation 
details if all goes to plan.

Regards,

Tvrtko
