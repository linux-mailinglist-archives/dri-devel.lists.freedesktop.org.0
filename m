Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C50E9C4724
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 21:49:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C3E810E1EA;
	Mon, 11 Nov 2024 20:49:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="idqHsMN3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D8710E1EA;
 Mon, 11 Nov 2024 20:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DcoLgfpvNyWqfXxcmK7BuKelHVN6Q08MXY7ZZYZCOPo=; b=idqHsMN3YUJLnN3HVsA007hWPy
 frV9ySAbHMiGwsXlYioVaRwDWm9DsU6hrrxOm7pyqzIROZscbq55V8T8g3K8OeJL+GPd3L2Teswkr
 cKtSlYqVJarxuOl0worW9I5pedJuti38ke3MM9LtR5jJDoO4+deJ+7P7sm2LGhY8RLsXENW15ddCy
 aj4+zI4d1CnyWu3NXvw0OtaAtjgI6FAyGtwn9ApGCM753A5dxryaLw4LUsmwUzgdxRDWTARCyDDup
 jH57aZyT+ckqFdh2QAspvnO1coL3bOf0WmxKYbHNtTrTqG/upXQUuFcgON+FUxBEYXhDVfSpUOAV1
 Fy4ydrpA==;
Received: from [189.6.17.125] (helo=[192.168.0.55])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tAbLQ-005d48-SK; Mon, 11 Nov 2024 21:49:09 +0100
Message-ID: <6c8a797a-a1f7-4436-8231-d059d85446cf@igalia.com>
Date: Mon, 11 Nov 2024 17:49:02 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/1] SWDEV476969 - dm: Fail dm_atomic_check if cursor
 overlay is required at MAX_SURFACES
To: Leo Li <sunpeng.li@amd.com>, Zaeem Mohamed <zaeem.mohamed@amd.com>,
 harry.wentland@amd.com, Rodrigo.Siqueira@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, daniel@ffwll.ch, christian.koenig@amd.com,
 alexander.deucher@amd.com, airlied@gmail.com, Xinhui.Pan@amd.com
References: <20241025193727.765195-1-zaeem.mohamed@amd.com>
 <20241025193727.765195-2-zaeem.mohamed@amd.com>
 <575d66c7-e77d-42ea-acbf-412d6e508a0b@igalia.com>
 <fc596eeb-0d46-4f9e-93a3-d4ef87e736c5@amd.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <fc596eeb-0d46-4f9e-93a3-d4ef87e736c5@amd.com>
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




On 28/10/2024 16:04, Leo Li wrote:
>
>
>
> On 2024-10-25 22:01, Melissa Wen wrote:
>>
>>
>>
>> On 25/10/2024 16:37, Zaeem Mohamed wrote:
>>> [why]
>>> Prevent index-out-of-bounds due to requiring cursor overlay when
>>> plane_count is MAX_SURFACES.
>> Hi Zaeem,
>>
>> Thanks for working on this fix.
>>>
>>> [how]
>>> Bounds check on plane_count when requiring overlay cursor.
>> I agree. Atomic check makes sense.
>>
>> 1) Since the native cursor mode was previously the unique mode 
>> avaliable, I
>> wonder if the driver should fall to native cursor mode in favor of 
>> the overlay
>> planes advertised. I.e. if driver says it supports two overlay planes 
>> and
>> the userspace requested both, cursor overlay mode should not be 
>> available or
>> should switch to native cursor mode, as before the introduction of 
>> cursor
>> overlay mode.
>
> Hey Melissa,
>
> The overlay cursor implementation today should still do native cursor 
> in all
> cases, except for when it is not possible: if there is a underlying 
> scaled or
> YUV plane.
>
> In such cases, we previously rejected the atomic commit, since the hw 
> won't be
> able to produce the rendering intent. Now, we try to accommodate it by 
> using a
> dedicated overlay plane. IOW, fallback to native here is equivalent to 
> an atomic
> reject.
>
>>
>> 2) Then my second question: can we increase the number of surfaces to 
>> 4 first to
>> accommodate more than one active overlay plane with cursor overly 
>> mode enabled.
>> If four is still possible, this increase can reduce the number of commit
>> failure scenarios and mitigate current userspace issues first. After 
>> addressing
>> current array-out-of-bounds, follow-up patches can do the proper 
>> changes and
>> checks.
>>
>
> My initial thought was to merge the proper fix first to address the 
> current
> issues. But if increasing MAX_SURFACES->4 also helps, I don't have a 
> strong
> opinion about it :)
>
> I think Zaeem is working on MAX_SURFACES->4 as well, but there's some 
> detangling
> work required in DC to accommodate another OS that dc supports. I have 
> a feeling
> this fix may land earlier than the ->4 patch. (see my patch comments 
> below)

Hi Leo,

Thanks for explaining these issues.

I thought changing MAX_SURFACES -> 4 would be faster than reworking 
atomic checks for properly handling active planes, but I understand your 
approach now, since this change impacts other OSes.

BTW, I've been away for the last few weeks and may have missed some 
updates. Any news on this?

Melissa

>
>> 3) IMHO, the incoherence between MAX_SURFACE_NUM and MAX_SURFACE 
>> should be
>> addressed before adding debugging points. For example, there are part 
>> of the
>> DC code using MAX_SURFACE_NUM == MAX_PLANE == 6 to allocate 
>> dc_surface_update
>> arrays, instead of using MAX_SURFACE value. You can find one of this 
>> case here:
>> https://gitlab.freedesktop.org/agd5f/linux/-/blob/amd-staging-drm-next/drivers/ 
>> gpu/drm/amd/display/dc/core/dc.c#L4507
>> It doesn't make sense to me and it can contribute to an incomplete 
>> solution.
>
> Right, also see below
>
>>
>> Also, please add the references of bugs reported in the amd tracker, 
>> so far:
>>
>> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/3693
>> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/3594
>>> Co-developed-by: Melissa Wen <mwen@igalia.com>
>> I don't think I contributed enough to your code to get any credits.
>> Thanks, but you can remove my co-dev-by :)
>>
>> Best Regards,
>>
>> Melissa
>>> Signed-off-by: Zaeem Mohamed <zaeem.mohamed@amd.com>
>>> ---
>>>   amdgpu_dm/amdgpu_dm.c | 16 +++++++++++++++-
>>>   1 file changed, 15 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/amdgpu_dm/amdgpu_dm.c b/amdgpu_dm/amdgpu_dm.c
>>> index df83e7b42b..c2595efb74 100644
>>> --- a/amdgpu_dm/amdgpu_dm.c
>>> +++ b/amdgpu_dm/amdgpu_dm.c
>>> @@ -11676,6 +11676,12 @@ static int amdgpu_dm_atomic_check(struct 
>>> drm_device *dev,
>>>            * need to be added for DC to not disable a plane by mistake
>>>            */
>>>           if (dm_new_crtc_state->cursor_mode == 
>>> DM_CURSOR_OVERLAY_MODE) {
>>> + if(dc->current_state->stream_status->plane_count >= MAX_SURFACES){
>>> +                drm_dbg_driver(crtc->dev,
>>> +                       "Can't enable cursor plane with %d 
>>> planes\n", MAX_SURFACES);
>>> +                ret = -EINVAL;
>>> +                goto fail;
>>> +            }
>
> Hey Zaeem,
>
> I took a tour through DC, and it seems to me that MAX_SURFACE_NUM can 
> be made
> equal to MAX_SURFACES in all cases. I wonder, if we simply replace
> MAX_SURFACE_NUM with MAX_SURFACES = 3, will we still need these 
> explicit fails?
> FWICT, `dc_state_add_plane` should fail for us.
>
> Thanks,
> Leo
>
>>>               ret = drm_atomic_add_affected_planes(state, crtc);
>>>               if (ret)
>>>                   goto fail;
>>> @@ -11769,8 +11775,16 @@ static int amdgpu_dm_atomic_check(struct 
>>> drm_device *dev,
>>>           /* Overlay cusor not subject to native cursor restrictions */
>>>           dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
>>> -        if (dm_new_crtc_state->cursor_mode == DM_CURSOR_OVERLAY_MODE)
>>> +        if (dm_new_crtc_state->cursor_mode == DM_CURSOR_OVERLAY_MODE){
>>> + if(dc->current_state->stream_status->plane_count > MAX_SURFACES){
>>> +                drm_dbg_driver(crtc->dev,
>>> +                       "Can't enable cursor plane with %d 
>>> planes\n", MAX_SURFACES);
>>> +                ret = -EINVAL;
>>> +                goto fail;
>>> +            }
>>> +
>>>               continue;
>>> +        }
>>>           /* Check if rotation or scaling is enabled on DCN401 */
>>>           if ((drm_plane_mask(crtc->cursor) & 
>>> new_crtc_state->plane_mask) &&
>>
>

