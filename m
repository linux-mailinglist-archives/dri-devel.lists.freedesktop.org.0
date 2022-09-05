Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D3B5AD12C
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 13:06:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BED710E2FA;
	Mon,  5 Sep 2022 11:06:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A62F10E2FA
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 11:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662375970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fO1i55RplxPZ02kGwMsg/12FGLiwqlnF30GYvzC7fc4=;
 b=jKbj9MRYlfSjYjo16U/IAGn8p0R79VJvS2sDiYL2ymUhKGC/NEwNO4dk9jDiMFLSWgZ/yS
 viXvIDPccBRx9ZYR4OAlQ2pWZLZn+V+ZKImRUwuWjYJ7RytyLlKhkb5J1Eh/r3fnozPUUh
 J5i44AvOZgGwrlNGfiDlQ+sMSXiK2Ho=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-265-Pl1EQEmnOYiClPkFfzmOHw-1; Mon, 05 Sep 2022 07:06:09 -0400
X-MC-Unique: Pl1EQEmnOYiClPkFfzmOHw-1
Received: by mail-wm1-f71.google.com with SMTP id
 f18-20020a05600c4e9200b003a5f81299caso5221785wmq.7
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 04:06:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=fO1i55RplxPZ02kGwMsg/12FGLiwqlnF30GYvzC7fc4=;
 b=CCrW8jgqfANQi5OitqUuT6rg9WPSxJ8MsIBhxPnDo/h4KnemZiWdK91tNNCY05iWiA
 Oe3SefD3xHQ6hXoy2fmPCZiG64t5daKle5aHXfG3KVqeEToTtw72ue7HWSLYnN9DK1Jw
 JNuPmYw5X4uCHQjkMXHXm07zenqmNLbvKpN6P5CPHUnNyCEMyfyhxWhuuwGBSOm7EzFC
 Mfg/YLA513a4GJ0XlU4oJ4fqkGKo7Sc2KIjfrbykn/PPl+KurPUZgYjJwxOhit/QcwuI
 ZWwTVAvxglcWPMMWwLowSXmhFst3Y5sFyfdcbdJLzfjwnQOpzOF3NvCnOfKJhFoptVyn
 v/Sw==
X-Gm-Message-State: ACgBeo0BA6DU8sp6/8skdUqjyOx5rPYTnSh+/X0PjmM0/Kkp9UN0vMvq
 0PnjvS/qcx3uN7mrQkA5qDHjE2463FsNS12O2v3U4gABpg8PqI0N7Y/3YC5jfkMzdKsxaVh9Ptw
 wx9ag6mzIwcsn3nh5zL2HJOzMs3KB
X-Received: by 2002:a05:600c:22c7:b0:3a6:68e4:1e5f with SMTP id
 7-20020a05600c22c700b003a668e41e5fmr10553353wmg.46.1662375967616; 
 Mon, 05 Sep 2022 04:06:07 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7TMlz0cg+Da+T5vw7hPchTgHKEuLCta7hHxP5YSvjT2BsJts1L8D8WV3F+qViax1jfzeQyfw==
X-Received: by 2002:a05:600c:22c7:b0:3a6:68e4:1e5f with SMTP id
 7-20020a05600c22c700b003a668e41e5fmr10553335wmg.46.1662375967344; 
 Mon, 05 Sep 2022 04:06:07 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 az24-20020adfe198000000b00228619a097esm6007312wrb.49.2022.09.05.04.06.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 04:06:07 -0700 (PDT)
Message-ID: <3cb956d7-aac0-6a1a-6be1-098057e2fd03@redhat.com>
Date: Mon, 5 Sep 2022 13:06:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] drm/simpledrm: Drop superfluous primary plane
 .atomic_check return logic
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20220831111243.1530620-1-javierm@redhat.com>
 <43e3dead-6089-c342-5050-34d7325bcb24@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <43e3dead-6089-c342-5050-34d7325bcb24@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 9/5/22 12:57, Thomas Zimmermann wrote:
> Hi Javier
> 
> Am 31.08.22 um 13:12 schrieb Javier Martinez Canillas:
>> The simpledrm_primary_plane_helper_atomic_check() function is more complex
>> than needed. It first checks drm_atomic_helper_check_plane_state() returns
>> value to decide whether to return this or zero.
>>
>> But it could just return that function return value directly. It also does
>> a check if new_plane_state->visible isn't set, but returns zero regardless.
>>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>> ---
>>
>>   drivers/gpu/drm/tiny/simpledrm.c | 15 ++++-----------
>>   1 file changed, 4 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
>> index a81f91814595..0be47f40247a 100644
>> --- a/drivers/gpu/drm/tiny/simpledrm.c
>> +++ b/drivers/gpu/drm/tiny/simpledrm.c
>> @@ -485,21 +485,14 @@ static int simpledrm_primary_plane_helper_atomic_check(struct drm_plane *plane,
>>   	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(new_state, plane);
>>   	struct drm_crtc *new_crtc = new_plane_state->crtc;
>>   	struct drm_crtc_state *new_crtc_state = NULL;
>> -	int ret;
>>   
>>   	if (new_crtc)
>>   		new_crtc_state = drm_atomic_get_new_crtc_state(new_state, new_crtc);
>>   
>> -	ret = drm_atomic_helper_check_plane_state(new_plane_state, new_crtc_state,
>> -						  DRM_PLANE_NO_SCALING,
>> -						  DRM_PLANE_NO_SCALING,
>> -						  false, false);
>> -	if (ret)
>> -		return ret;
>> -	else if (!new_plane_state->visible)
>> -		return 0;
>> -
>> -	return 0;
>> +	return drm_atomic_helper_check_plane_state(new_plane_state, new_crtc_state,
>> +						   DRM_PLANE_NO_SCALING,
>> +						   DRM_PLANE_NO_SCALING,
>> +						   false, false);
> 
> I'm undecided on this change. I know it's correct and more to the point. 
> But the call's logic is non-intuitive: the call either returns an error 
> or we have to test ->visible afterwards. So I wrote it explicitly.
>

Yes, but the check has no effect so I found it even less intuitive. Maybe
add a comment then if you wan to keep the current code?
 
> I saw that your change to ssd130x also uses the pattern. If we find more 
> such drivers, we could implement the atomic check as a helper. I suggest 
> drm_plane_helper_atomic_check_fixed() in drm_plane_helper.c
>

Sure. I can add a preparatory change in v2 that adds that helper and then
use it in the follow-up patch.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

