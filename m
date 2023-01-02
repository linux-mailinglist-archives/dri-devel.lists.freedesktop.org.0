Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C80665B458
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 16:40:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7201910E351;
	Mon,  2 Jan 2023 15:40:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2BEF10E351
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 15:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nrsUu9fxqgxPMipuOD/r/iNsFaXM33W06ySnxh7/cJg=; b=iQ7WnmdeTFfEC9ZO2nimFRO62r
 hZ1rNws7lHv6QYV54g6PWyMuqK4EM7Z00WAPgWYkDQuz6RY0xidYUhmb4ifaaS3WAWRtUG1/CPR5i
 jQVnug/cQGOzzQqgud2qJTExZkWFR/X0U4zXiYitUB1/BI3oEVFrq4P6c24tk0sBCMeJDuF2OVwq8
 xGz05mpP4HGbT7ENWDGnfk2RuURnD+mpdnEOAaAu83o9c/xq/agE6iZnWAUkYBISSMIlsCeeKAjov
 rM5S641q/f1S6xJtsucuyLgJ7u0RlXeeOFSXhDoVoyfcLKfPWfy/we0gAseBaogFfTDaScEagyYYY
 AORmlvFw==;
Received: from [187.36.234.139] (helo=[192.168.1.195])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pCMuj-00FMm4-K2; Mon, 02 Jan 2023 16:39:49 +0100
Message-ID: <799183a2-fa3e-44bb-36a8-ee5eb16afb32@igalia.com>
Date: Mon, 2 Jan 2023 12:39:40 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm/vc4: Check for valid formats
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230102135757.262676-1-mcanal@igalia.com>
 <a4d642d8-5556-7efb-308f-ab5f9c7284b0@suse.de>
 <3db30278-c106-cb3b-e581-9165446857f1@igalia.com>
 <33e42652-cec2-83eb-5000-5358f3f456e3@suse.de>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <33e42652-cec2-83eb-5000-5358f3f456e3@suse.de>
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
Cc: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/2/23 12:21, Thomas Zimmermann wrote:
> Hi
> 
> Am 02.01.23 um 15:29 schrieb Maíra Canal:
>> Hi,
>>
>> On 1/2/23 11:20, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> Am 02.01.23 um 14:57 schrieb Maíra Canal:
>>>> Currently, vc4 is not checking valid formats before creating a
>>>> framebuffer, which is triggering the IGT test
>>>> igt@kms_addfb_basic@addfb25-bad-modifier to fail, as vc4 accepts
>>>> to create a framebuffer with an invalid modifier. Therefore, check
>>>> for valid formats before creating framebuffers on vc4 and vc5 in
>>>> order to avoid creating framebuffers with invalid formats.
>>>>
>>>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>>>> ---
>>>>   drivers/gpu/drm/vc4/vc4_kms.c | 23 ++++++++++++++++++++++-
>>>>   1 file changed, 22 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
>>>> index 53d9f30460cf..5d1afd66fcc1 100644
>>>> --- a/drivers/gpu/drm/vc4/vc4_kms.c
>>>> +++ b/drivers/gpu/drm/vc4/vc4_kms.c
>>>> @@ -500,6 +500,27 @@ static struct drm_framebuffer *vc4_fb_create(struct drm_device *dev,
>>>>         mode_cmd = &mode_cmd_local;
>>>>     }
>>>>
>>>> +    if (!drm_any_plane_has_format(dev, mode_cmd->pixel_format,
>>>> +                      mode_cmd->modifier[0])) {
>>>> +        drm_dbg_kms(dev, "Unsupported pixel format %p4cc / modifier 0x%llx\n",
>>>> +                &mode_cmd->pixel_format, mode_cmd->modifier[0]);
>>>> +        return ERR_PTR(-EINVAL);
>>>> +    }
>>>
>>> This might be a stupid question, but why doesn't drm_fbgem_fb_create() do this test already? It seems like a no-brainer and *not* testing for the plane formats should be the exception.
>>
>> I thought the same initially, but then I found this mention on the TODO list [1]. So, it
>> is not possible to test it on drm_gem_fb_create() because, for non-atomic, checking
>> drm_any_plane_has_format() is not possible since like the format list for the primary plane
>> is fake and we'd therefor reject valid formats.
> 
> Thanks for the pointer to the docs.
> 
> I see two options:
> 
> 1) Testing for atomic modesetting can be done via drm_core_check_feature(dev, DRIVER_ATOMIC).  If true, drm_gem_fb_create() can further test for the plane formats. For non-atomic drivers, just skip the format test.
> 
> 2) As an alternative, we could invert the IGT test and explicitly allow any format to be allocated. Almost no drivers currently bother with the format test anyway. And DRM will already fail if userspace attaches a framebuffer to a plane with incompatible formats. [1]  (I'd personally prefer this option, but I'm not sure if there's any consensus on that.)

I guess the second option will probably break Intel's CI, which I'm not sure if it is a good
idea. Maybe the first option is a bit less intrusive and will help the DRM helper to have the
same behavior as drivers like i915 and AMDGPU.

Thanks for the suggestions!

Best Regards,
- Maíra Canal

> 
> With either implemented, the TODO item could be remvoed AFAICT.
> 
> Best regards
> Thomas
> 
> [1] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_plane.c#L789
> 
>>
>> I'm not sure if anything changed since this was written, but that was the reason that I
>> decided to introduce the check in the driver instead of the API.
>>
>> [1] https://cgit.freedesktop.org/drm/drm/tree/Documentation/gpu/todo.rst#n279
>>
>> Best Regards,
>> - Maíra Canal
>>
>>>
>>> Best regards
>>> Thomas
>>>
>>>> +
>>>> +    return drm_gem_fb_create(dev, file_priv, mode_cmd);
>>>> +}
>>>> +
>>>> +static struct drm_framebuffer *vc5_fb_create(struct drm_device *dev,
>>>> +                         struct drm_file *file_priv,
>>>> +                         const struct drm_mode_fb_cmd2 *mode_cmd)
>>>> +{
>>>> +    if (!drm_any_plane_has_format(dev, mode_cmd->pixel_format,
>>>> +                      mode_cmd->modifier[0])) {
>>>> +        drm_dbg_kms(dev, "Unsupported pixel format %p4cc / modifier 0x%llx\n",
>>>> +                &mode_cmd->pixel_format, mode_cmd->modifier[0]);
>>>> +        return ERR_PTR(-EINVAL);
>>>> +    }
>>>> +
>>>>     return drm_gem_fb_create(dev, file_priv, mode_cmd);
>>>>   }
>>>>
>>>> @@ -1033,7 +1054,7 @@ static const struct drm_mode_config_funcs vc4_mode_funcs = {
>>>>   static const struct drm_mode_config_funcs vc5_mode_funcs = {
>>>>     .atomic_check = vc4_atomic_check,
>>>>     .atomic_commit = drm_atomic_helper_commit,
>>>> -    .fb_create = drm_gem_fb_create,
>>>> +    .fb_create = vc5_fb_create,
>>>>   };
>>>>
>>>>   int vc4_kms_load(struct drm_device *dev)
>>>> -- 
>>>> 2.38.1
>>>>
>>>
> 
