Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB215B5C82
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 16:42:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8035910E591;
	Mon, 12 Sep 2022 14:42:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D6EE10E590
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 14:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662993757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G4CvOh9tTP6mx8NvmQ+rRskXFnhfhDqQRZXhv5skm7I=;
 b=DTdTynjSfZp1DSPxwHasLE63XEPItpGMJzl25fclXzlP+AeXbkiUo3BEkDviU/idfyvuuJ
 AnX3YwEqUrtslSM0xYJbAJR6iQAj2HV5rMugqYeoxcA2Mh3loyFBnQJidoJqchZpwAvcsZ
 l3CogLDIsrIwaNZJ86G095UwgfMokBk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-261-2OUYkJsHPCOlZGHq-Ya8hA-1; Mon, 12 Sep 2022 10:42:36 -0400
X-MC-Unique: 2OUYkJsHPCOlZGHq-Ya8hA-1
Received: by mail-wr1-f71.google.com with SMTP id
 s1-20020adf9781000000b002286cd81376so1768915wrb.22
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 07:42:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=G4CvOh9tTP6mx8NvmQ+rRskXFnhfhDqQRZXhv5skm7I=;
 b=Ji8KZAAfj3tJfIrPSi0uzRi9zmAYI9Fty4AaILUHC2lztlYxWzxlYWUMzE9iVfMS/c
 a5M1iGU0+Uc34Olfp/8lGX8aWlek+WzrcWeXkmKEMuZatXckR+e9IPhPhWjUnqi7yhIk
 qs0lfrDuqdBY0LnN38tGE0C3H8sgemGXtUny3YVYPhKI+ClNz8y9R72Q5aGVZ/idw8RP
 x8ZWyUpXeKJ6Z9waZ8iEU0vF7UC9mhNvt74YhBZva7gZHMwLjw7f5dxRqo559HbUZcad
 4td5OrS+TXQVNvdBbuWpbaLq1Ne2Xj3YLGR1eMjNJ4HOOUEjUcTygJcw491N9QkBI4q2
 +e/g==
X-Gm-Message-State: ACgBeo2LV4QAgssAUxu69VFA8RnSUgKw/Pl0PBfNBVK7PCK74DL8Kp/a
 zmNhQMTtffycl4l3GbwKQwj7YE9wtqGY4VDFHzermXXpEQeYeryBfSO+m5ZvpzVJbNpNdMEVn9J
 wv0LsT5bkq7+5lDqT0t+cKHzoZon0
X-Received: by 2002:a5d:6d8a:0:b0:22a:9f79:9452 with SMTP id
 l10-20020a5d6d8a000000b0022a9f799452mr2031941wrs.620.1662993755272; 
 Mon, 12 Sep 2022 07:42:35 -0700 (PDT)
X-Google-Smtp-Source: AA6agR49PQRjF0EWfk0MYVyKPl9HsvKjNtRcBeAEkJfK+2sOEMrm27CNYFuEhH1+SKqutJIIIbl1IA==
X-Received: by 2002:a5d:6d8a:0:b0:22a:9f79:9452 with SMTP id
 l10-20020a5d6d8a000000b0022a9f799452mr2031934wrs.620.1662993755071; 
 Mon, 12 Sep 2022 07:42:35 -0700 (PDT)
Received: from [172.16.38.252] ([185.122.133.20])
 by smtp.gmail.com with ESMTPSA id
 i12-20020a1c540c000000b003b47ff3807fsm5339820wmb.5.2022.09.12.07.42.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Sep 2022 07:42:34 -0700 (PDT)
Message-ID: <734a2141-448a-8ecd-2924-d6f8bc4d9b2d@redhat.com>
Date: Mon, 12 Sep 2022 16:42:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] drm/plane-helper: Add a drm_plane_helper_atomic_check()
 helper
To: Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20220912101522.69482-1-javierm@redhat.com>
 <Yx8Ms2jhgwpiDqA6@intel.com> <c6ce4e99-571b-e046-6f03-ab87bd173869@suse.de>
 <Yx8Vo4x7frhbElPq@intel.com> <4002a4d6-04cb-b342-952f-b42ef3188df4@suse.de>
 <Yx8nXZnTDEwuPEvP@intel.com> <d4c00bb6-03be-0348-6a75-c678608114f1@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <d4c00bb6-03be-0348-6a75-c678608114f1@suse.de>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Ville and Thomas,

On 9/12/22 16:22, Thomas Zimmermann wrote:

[...]

>>>>>>> +
>>>>>>> +/**
>>>>>>> + * drm_plane_helper_atomic_check() - Helper to check primary planes states
>>>>>>> + * @plane: plane to check
>>>>>>> + * @new_state: plane state to check
>>>>>>
>>>>>> That is not a plane state. Also should s/new_// since it's just

Right. What's the proper name? hardware state, modeset state, atomic state ?

>>>>>> the overall atomic state thing rather than some new or old state.
>>>>>
>>>>> Using only 'state' is non-intuitive and has lead to bugs where sub-state
>>>>> was retrieved from the wrong state information. So we've been using
>>>>> 'new_state' and 'old_state' explicitly in several places now.
>>>>
>>>> There is no old or new drm_atomic_state. It contains both.
>>>
>>> I (vaguely) remember a bug where a driver tried
>>> drm_atomic_get_new_plane_state() with the (old) state that's passed to
>>> atomic_update. It didn't return the expected results and modesetting
>>> gave slightly wrong results.
>>
>> As there is no wrong drm_atomic_state to pass I don't think it could
>> have been the case.
>>
>>> So we began to be more precise about new
>>> and old. And whatever is stored in 'plane->state' is then just 'the state'.
>>
>> There were certainly a lot of confusion before the explicit new/old
>> state stuff was added whether foo->state/etc. was the old or the
>> new state. And labeling things as explicitly old vs. new when passing
>> in individual object states certainly makes sense. But that doesn't
>> really have anything to do with mislabeling the overall drm_atomic_state.
>>
>>>
>>> I understand that the semantics of atomic_check are different from
>>> atomic_update, but it still doesn't hurt to talk of new_state IMHO.
>>
>> IMO it's just confusing. Makes the reader think there is somehow
>> different drm_atomic_states for old vs. new states when there isn't.
>> I also wouldn't call it new_state for .atomic_update() either.
>>
>> In both cases you have the old and new states in there and how
>> exactly they get used in the hooks is more of an implementation
>> detail. The only rules you would have to follow is that at the
>> end of .atomic_update() the hardware state matches the new state,
>> and .atomic_check() makes sure the transition from the old to the
>> new state is possible.
> 
>  From what I understand:
> 
> In atomic_check(), plane->state is the current state and the state 
> argument is the state to be validated. Calling 
> drm_atomic_get_new_plane_state() will return the plane's new state.
>

That's my understanding as well.
 
> If you call drm_atomic_get_old_plane_state() from atomic_check(), what 
> will it return?
> 
> In atomic_update() plane->state is the state to be committed and the 
> state argument is the old state before the start of the atomic commit. 
> And calling drm_atomic_get_new_plane_state() will *not* the return the 
> plane's new state (i.e., the one in plane->state) IIRC. (As I mentioned, 
> there was a related bug in one of the drivers.) So we began to call this 
> 'old_state'.
> 
> My point is: the state passed to the check and commit functions are 
> different things, even though they appear to be the same.
>

Agree.

Maybe instead of new and old `current_state` and `commit_state` would
be more clear ?
 
>>
>> I've proposed renaming drm_atomic_state to eg. drm_atomic_transaction
>> a few times before but no one took the bait so far...
>>
> 
> If you really don't like new_state, then let's call it state_tx.
>

I would prefer if for this patch we call it either `new_state` or just
`state` to be consistent with the other helpers. And then we can as a
follow-up change the naming used by all the helpers.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

