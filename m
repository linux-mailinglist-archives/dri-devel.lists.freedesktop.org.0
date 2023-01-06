Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F8F65FF99
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 12:34:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC2810E866;
	Fri,  6 Jan 2023 11:34:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39CA810E866
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 11:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RAh/H92xEYVo5o58sqTvmbMC43uXwNikMW2I9xNmuxM=; b=douUQnQQJMXVJHuKWu0YKhqXnj
 kvtwxU9m09LtpThJQzJEiwbfKmIED6cPxJ3jIIRnPMY49lbY0IzpT0bZKJrbbaT9cUfwfKrXkSCGj
 xTz7LS8t8HnYLlg+kWiVPRVW6ojyow2JDeIWIPZY1a61O63ptnXLHFr1bmcl3364xn46/CWpR0fyS
 O1NFJ6viU4PtsW6z1gziSp7oDKEdSpHh1qQ/AORenJ4Qg1aVr24QoXTYNTQSVNVoVYHJAGElzT1FO
 Bo9MVfKwCYQYiZvr+2nxs1oxsvOMii9Cfr58LUXfj6aD5KwlSsAhvt5nO7TlaE2kLECjCAqQ/KskG
 IZcyiJbw==;
Received: from [187.36.234.139] (helo=[192.168.1.195])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pDkzM-000niQ-RZ; Fri, 06 Jan 2023 12:34:21 +0100
Message-ID: <19951367-2ef0-0f26-ddf0-893259d9a5ef@igalia.com>
Date: Fri, 6 Jan 2023 08:34:13 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm/vkms: introduce prepare_fb and cleanup_fb functions
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, Melissa Wen <mwen@igalia.com>
References: <20230105162148.234218-1-mcanal@igalia.com>
 <20230105184313.uziimfnsk3cu3gzd@mail.igalia.com>
 <e1ba3ad8-a6fe-4279-1d98-e060fc845fea@suse.de>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <e1ba3ad8-a6fe-4279-1d98-e060fc845fea@suse.de>
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
Cc: Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Thanks for the review!

On 1/6/23 05:10, Thomas Zimmermann wrote:
> Hi
> 
> Am 05.01.23 um 19:43 schrieb Melissa Wen:
>> On 01/05, Maíra Canal wrote:
>>> With commit 359c6649cd9a ("drm/gem: Implement shadow-plane {begin,
>>> end}_fb_access with vmap"), the behavior of the shadow-plane helpers
>>> changed and the vunmap is now performed at the end of
>>> the current pageflip, instead of the end of the following pageflip.
>>>
>>> By performing the vunmap at the end of the current pageflip, invalid
>>> memory is accessed by the vkms during the plane composition, as the data
>>> is being unmapped before being used.
>>
>> Hi Maíra,
>>
>> Thanks for investigating this issue. Can you add in the commit message
>> the kernel Oops caused by this change?
>>
>> Besides that, I wonder if the right thing would be to restore the
>> previous behavior of vunmap in shadow-plane helpers, instead of
>> reintroduce driver-specific hooks for vmap/vunmap correctly to vkms.
>>
>> Maybe Thomas has some inputs on this shadow-plane changing to help us on
>> figuring out the proper fix (?)
> 
> The fix looks good. I left some minor-important comments below.
> 
> I would suggest to rethink the overall driver design. Instead of keeping these buffer pinned for long. It might be better to have a per-plane intermediate buffer that you update on each call to atomic_update. That's how real drivers interact with their hardware.
> 
>>
>> Best Regards,
>>
>> Melissa
>>
>>>
>>> Therefore, introduce again prepare_fb and cleanup_fb functions to the
>>> vkms, which were previously removed on commit b43e2ec03b0d ("drm/vkms:
>>> Let shadow-plane helpers prepare the plane's FB").
>>>
>>> Fixes: 359c6649cd9a ("drm/gem: Implement shadow-plane {begin, end}_fb_access with vmap")
>>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> 
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
>>> ---
>>>   drivers/gpu/drm/vkms/vkms_plane.c | 36 ++++++++++++++++++++++++++++++-
>>>   1 file changed, 35 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
>>> index c3a845220e10..b3f8a115cc23 100644
>>> --- a/drivers/gpu/drm/vkms/vkms_plane.c
>>> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
>>> @@ -160,10 +160,44 @@ static int vkms_plane_atomic_check(struct drm_plane *plane,
>>>     return 0;
>>>   }
>>>
>>> +static int vkms_prepare_fb(struct drm_plane *plane,
>>> +               struct drm_plane_state *state)
>>> +{
>>> +    struct drm_shadow_plane_state *shadow_plane_state;
>>> +    struct drm_framebuffer *fb = state->fb;
>>> +    int ret;
>>> +
>>> +    if (!fb)
>>> +        return 0;
> 
> IIRC this cannot be NULL. Only active planes will be 'prepared'.> 
>>> +
>>> +    shadow_plane_state = to_drm_shadow_plane_state(state);
>>> +
>>> +    ret = drm_gem_plane_helper_prepare_fb(plane, state);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    return drm_gem_fb_vmap(fb, shadow_plane_state->map, shadow_plane_state->data);
>>> +}
>>> +
>>> +static void vkms_cleanup_fb(struct drm_plane *plane,
>>> +                struct drm_plane_state *state)
>>> +{
>>> +    struct drm_shadow_plane_state *shadow_plane_state;
>>> +    struct drm_framebuffer *fb = state->fb;
>>> +
>>> +    if (!fb)
>>> +        return;
> 
> Same here. This function won't be called if there has not been a framebuffer.

After removing those two checks, I started to get some NULL pointer dereference
errors, so I believe they are somehow necessary.

> 
>>> +
>>> +    shadow_plane_state = to_drm_shadow_plane_state(state);
>>> +
>>> +    drm_gem_fb_vunmap(fb, shadow_plane_state->map);
>>> +}
>>> +
>>>   static const struct drm_plane_helper_funcs vkms_primary_helper_funcs = {
>>>     .atomic_update        = vkms_plane_atomic_update,
>>>     .atomic_check        = vkms_plane_atomic_check,
>>> -    DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
> 
> You're still installing {being/end}_fb_access, which should not be necessary now. Open-coding DRM_GEM_SHADOW_PLANE_HELPER_FUNCS without those helpers would fix that.

I'm sorry but I didn't understand this comment. AFAIK I {being/end}_fb_access are
NULL as I removed the DRM_GEM_SHADOW_PLANE_HELPER_FUNCS macro.

Best Regards,
- Maíra Canal

> 
> Best regards
> Thomas
> 
>>> +    .prepare_fb        = vkms_prepare_fb,
>>> +    .cleanup_fb        = vkms_cleanup_fb,
>>>   };
>>>
>>>   struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
>>> -- 
>>> 2.39.0
>>>
> 
