Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 176F0433F0C
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 21:12:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF98A6E1D5;
	Tue, 19 Oct 2021 19:12:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com
 [IPv6:2607:f8b0:4864:20::92b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 295C66E1D5
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 19:12:47 +0000 (UTC)
Received: by mail-ua1-x92b.google.com with SMTP id f4so2060029uad.4
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 12:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UL2YWvVo40k3t4YquvgzfNyGVxoWuhyDYA5TDAnYaqE=;
 b=XhFSPrpOjgsv8KEQw7fqBFsEbBSYxR3HokS9HBLiBqjgviw64athINP2fH7Y/2bB2a
 G4W1EELpCpPpkZhK1IW99mWADLO8p6uQXPwtgHDWZevBZrgsbqoziSzNEl+REjUszxQk
 KGsUming6DmMk/tQi9zkfsU7meppqZ59upelZVK4s3y9mS2cbsd0P19E5iEl9XjQfxX7
 EsCqDfXoYae7Xiypa7gpRnkze8Q9EQ97fMPLcOlTs8tVctWKrAWKtE/BwHNVN6jkqxlj
 oEUKLYo6/jw7taJB0ZxaNnkm4MLbYFdnAs8q+4jm1avG81vm0L/ENgROSDb3k3STburd
 BvgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UL2YWvVo40k3t4YquvgzfNyGVxoWuhyDYA5TDAnYaqE=;
 b=ASlQnNMQaP9XrKcceoM3s7832roTIxkZDqQ7C4g7CISl7g8+bkMuYMnkpkVC5L6ZtW
 0QHSFErvh17ikUjjV+pUUWE9+0ZEH39VyCrOKJmW0+IHrKqJiRsS96mPJKsbSTVXop8F
 ZYiwlusVKJPB9ilSqw7b5J2zRiqqAqz58A5bT/6VuvbvKDHpcSoUSJJ3tZAv8BNOX7ss
 faJljkAvUamfh+9ZUyqCsYGJrBhPJw2alcOdk0jAvFfo7o2syHbVSxtrVkQFTQNPvFuK
 eGD3UjtRsYc4YHvPI1BMCQdPvpwPb8TK5Z43h2SdC4TuIIiHwSoKCnJXQndCQvjjs7J/
 k9EQ==
X-Gm-Message-State: AOAM532HbENthxCsrB2tGTTVPhsdH6Mz/GlQH17eLEd1gDrWhgfPpaQR
 4fMwyhBqsqCuS8DYLOjN6Nw=
X-Google-Smtp-Source: ABdhPJy+bqHMFR+qhpS79F3P6nzKEvZAUNkMkSHHF9xEtGfVOoCuHJhhn6PP3nJEztxC5RiEmToGSw==
X-Received: by 2002:a05:6102:956:: with SMTP id
 a22mr14433080vsi.20.1634670766080; 
 Tue, 19 Oct 2021 12:12:46 -0700 (PDT)
Received: from ?IPv6:2804:431:c7f4:b20b:270b:2d4a:f08:5534?
 ([2804:431:c7f4:b20b:270b:2d4a:f08:5534])
 by smtp.gmail.com with ESMTPSA id w27sm11708299vsi.25.2021.10.19.12.12.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 12:12:45 -0700 (PDT)
Subject: Re: [PATCH 5/6] drm: vkms: Prepare `vkms_wb_encoder_atomic_check` to
 accept multiple formats
To: Thomas Zimmermann <tzimmermann@suse.de>, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com
Cc: hamohammed.sa@gmail.com, daniel@ffwll.ch, airlied@linux.ie,
 contact@emersion.fr, leandro.ribeiro@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20211005201637.58563-1-igormtorrente@gmail.com>
 <20211005201637.58563-6-igormtorrente@gmail.com>
 <5507450a-eb69-b24c-9f43-a1780dafbfa9@suse.de>
 <e9cbdad7-416a-65fe-eb50-1cbb42a01e7b@gmail.com>
 <9dbd2c55-2c29-eb12-94d0-dbd5110c302e@suse.de>
 <4d573cd9-ac1b-59d6-fb97-e5c24152892b@gmail.com>
 <f20d3359-1ec8-35ca-e885-bd35caa55c50@suse.de>
From: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
Message-ID: <fbe3ad70-375e-0f14-dba3-8f2e3f081457@gmail.com>
Date: Tue, 19 Oct 2021 16:12:42 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <f20d3359-1ec8-35ca-e885-bd35caa55c50@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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

Hi Thomas,

On 10/19/21 4:17 AM, Thomas Zimmermann wrote:
> Hi
> 
> Am 18.10.21 um 21:32 schrieb Igor Matheus Andrade Torrente:
>> Hi Thomas,
>>
>> On 10/18/21 3:06 PM, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> Am 18.10.21 um 19:41 schrieb Igor Matheus Andrade Torrente:
>>>> Hello,
>>>>
>>>> On 10/18/21 7:14 AM, Thomas Zimmermann wrote:
>>>>> Hi
>>>>>
>>>>> Am 05.10.21 um 22:16 schrieb Igor Matheus Andrade Torrente:
>>>>>> Currently, the vkms atomic check only goes through the first
>>>>>> position of
>>>>>> the `vkms_wb_formats` vector.
>>>>>>
>>>>>> This change prepares the atomic_check to check the entire vector.
>>>>>>
>>>>>> Signed-off-by: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
>>>>>> ---
>>>>>>    drivers/gpu/drm/vkms/vkms_writeback.c | 11 ++++++++++-
>>>>>>    1 file changed, 10 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c
>>>>>> b/drivers/gpu/drm/vkms/vkms_writeback.c
>>>>>> index 5a3e12f105dc..56978f499203 100644
>>>>>> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
>>>>>> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
>>>>>> @@ -30,6 +30,8 @@ static int vkms_wb_encoder_atomic_check(struct
>>>>>> drm_encoder *encoder,
>>>>>>    {
>>>>>>        struct drm_framebuffer *fb;
>>>>>>        const struct drm_display_mode *mode = &crtc_state->mode;
>>>>>> +    bool format_supported = false;
>>>>>> +    int i;
>>>>>>        if (!conn_state->writeback_job ||
>>>>>> !conn_state->writeback_job->fb)
>>>>>>            return 0;
>>>>>> @@ -41,7 +43,14 @@ static int vkms_wb_encoder_atomic_check(struct
>>>>>> drm_encoder *encoder,
>>>>>>            return -EINVAL;
>>>>>>        }
>>>>>> -    if (fb->format->format != vkms_wb_formats[0]) {
>>>>>> +    for (i = 0; i < ARRAY_SIZE(vkms_wb_formats); i++) {
>>>>>> +        if (fb->format->format == vkms_wb_formats[i]) {
>>>>>> +            format_supported = true;
>>>>>> +            break;
>>>>>> +        }
>>>>>> +    }
>>>>>
>>>>> At a minimum, this loop should be in a helper function. But more
>>>>> generally, I'm surprised that this isn't already covered by the
>>>>> DRM's atomic helpers.
>>>>
>>>> Ok, I can wrap it in a new function.
>>>>
>>>> AFAIK the DRM doesn't cover it. But I may be wrong...
>>>
>>> I couldn't find anything either.
>>>
>>> Other drivers do similar format and frambuffer checks. So I guess a
>>> helper could be implemented. All plane's are supposed to call
>>> drm_atomic_helper_check_plane_state() in their atomic_check() code.
>>> You could add a similar helper, say
>>> drm_atomic_helper_check_writeback_encoder_state(), that tests for the
>>> format and maybe other things as well.
>>
>> Do you think this should be done before or after this patch series?
> 
> Just add it as part of this series and use it for vkms. Other drivers
> can adopt it later on. The rcar-du code [1] looks similar to the one in
> vkms. Maybe put the common tests in to the new helper. You can extract
> the list of supported formats from the property blob, I think.
> 

OK, Thanks!

> Best regards
> Thomas
> 
> [1]
> https://elixir.bootlin.com/linux/v5.14.13/source/drivers/gpu/drm/rcar-du/rcar_du_writeback.c#L140
> 
>>
>>>
>>> Best regards
>>> Thomas
>>>
>>>>
>>>>>
>>>>> Best regards
>>>>> Thomas
>>>>>
>>>>>> +
>>>>>> +    if (!format_supported) {
>>>>>>            DRM_DEBUG_KMS("Invalid pixel format %p4cc\n",
>>>>>>                      &fb->format->format);
>>>>>>            return -EINVAL;
>>>>>>
>>>>>
>>>
>>
>> Thanks,
>> Igor Torrente
> 
