Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 756AE96DE8F
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 17:41:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C214610E858;
	Thu,  5 Sep 2024 15:41:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D151B10E858
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 15:41:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98A71FEC;
 Thu,  5 Sep 2024 08:42:01 -0700 (PDT)
Received: from [10.1.29.28] (e122027.cambridge.arm.com [10.1.29.28])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D0B7D3F73B;
 Thu,  5 Sep 2024 08:41:32 -0700 (PDT)
Message-ID: <d24272d4-e21a-4f62-8797-ce29dd6d2147@arm.com>
Date: Thu, 5 Sep 2024 16:41:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/panthor: Add PANTHOR_GROUP_PRIORITY_REALTIME
 group priority
To: Mihail Atanassov <mihail.atanassov@arm.com>,
 Mary Guillemard <mary.guillemard@collabora.com>, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Christopher Healy <healych@amazon.com>, kernel@collabora.com,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 nd <nd@arm.com>
References: <20240905111338.95714-1-mary.guillemard@collabora.com>
 <20240905111338.95714-2-mary.guillemard@collabora.com>
 <2b2d13a9-9e84-406a-a803-5366036fa761@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <2b2d13a9-9e84-406a-a803-5366036fa761@arm.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mihail,

On 05/09/2024 14:54, Mihail Atanassov wrote:
> Hi Mary,
> 
> On 05/09/2024 12:13, Mary Guillemard wrote:
>> This adds a new value to drm_panthor_group_priority exposing the
>> realtime priority to userspace.
>>
>> This is required to implement NV_context_priority_realtime in Mesa.
>>
>> Signed-off-by: Mary Guillemard <mary.guillemard@collabora.com>
>> ---
>>   drivers/gpu/drm/panthor/panthor_drv.c   | 2 +-
>>   drivers/gpu/drm/panthor/panthor_sched.c | 2 --
>>   include/uapi/drm/panthor_drm.h          | 7 +++++++
>>   3 files changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c
>> b/drivers/gpu/drm/panthor/panthor_drv.c
>> index 0caf9e9a8c45..7b1db2adcb4c 100644
>> --- a/drivers/gpu/drm/panthor/panthor_drv.c
>> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
>> @@ -1041,7 +1041,7 @@ static int group_priority_permit(struct drm_file
>> *file,
>>                    u8 priority)
>>   {
>>       /* Ensure that priority is valid */
>> -    if (priority > PANTHOR_GROUP_PRIORITY_HIGH)
>> +    if (priority > PANTHOR_GROUP_PRIORITY_REALTIME)
>>           return -EINVAL;
>>         /* Medium priority and below are always allowed */
>> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c
>> b/drivers/gpu/drm/panthor/panthor_sched.c
>> index 91a31b70c037..86908ada7335 100644
>> --- a/drivers/gpu/drm/panthor/panthor_sched.c
>> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
>> @@ -137,8 +137,6 @@ enum panthor_csg_priority {
>>        * non-real-time groups. When such a group becomes executable,
>>        * it will evict the group with the lowest non-rt priority if
>>        * there's no free group slot available.
>> -     *
>> -     * Currently not exposed to userspace.
>>        */
>>       PANTHOR_CSG_PRIORITY_RT,
>>   diff --git a/include/uapi/drm/panthor_drm.h
>> b/include/uapi/drm/panthor_drm.h
>> index 1fd8473548ac..011a555e4674 100644
>> --- a/include/uapi/drm/panthor_drm.h
>> +++ b/include/uapi/drm/panthor_drm.h
>> @@ -720,6 +720,13 @@ enum drm_panthor_group_priority {
>>        * Requires CAP_SYS_NICE or DRM_MASTER.
>>        */
>>       PANTHOR_GROUP_PRIORITY_HIGH,
>> +
>> +    /**
>> +     * @PANTHOR_GROUP_PRIORITY_REALTIME: Realtime priority group.
>> +     *
>> +     * Requires CAP_SYS_NICE or DRM_MASTER.
>> +     */
>> +    PANTHOR_GROUP_PRIORITY_REALTIME,
> 
> This is a uapi change, but doesn't have a corresponding driver version
> bump in the same patch. You also document the addition of this enum
> value in the next patch, which also is a tad wonky. If you reversed the
> order of the patches, they'd make more sense IMO.

You can't reverse the order because then the version bump would be
before all the features were present. Generally we put the version bump
at the end of a patch series because it's indicating to user space that
the new features can be used. This way round if a bisect lands in the
middle of the series then the new priority is there but won't be used
because user space won't know about it (which is fine).

Steve

>>   };
>>     /**
> 

