Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D56BF3991
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 23:00:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBD1010E513;
	Mon, 20 Oct 2025 21:00:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="I3T+6rlf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCE0610E513
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 21:00:39 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-b47a5a17303so77744766b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 14:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760994038; x=1761598838; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tI1RtufrnCfn5YC744MSI0dkUCZVt+o4Wi2kRqCU9cQ=;
 b=I3T+6rlfAqffwwPP6kRZPlOAE9y3mfFmUkNt8aM7OEpvU/ztD2lb/n0bFceQJ3Xp0f
 yPaxitJIv8iFiIGqQXspViCtOC1DJUl/Ip9tvC1IInPB/D+tSNWOMvwGx/EZIMQiK02c
 +X2q0IHtk2gbNUVyzt5L2CihduzvDsviCt67KblhpvIsIeaFe2gw9VVvMzh1di85ktGc
 ayfmZqJnPlwUfaLMtSIEiS9gn50kp6T+B1hA8nrIrrS+xt+eeTEF7heJWzeF7rLcjNHr
 juICX0BfG4U7QvRUNCJCkU+aQTGWl+jC1US2tEpox9nasPxRsuOHdofVdtMcL4JIbkof
 7QxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760994038; x=1761598838;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tI1RtufrnCfn5YC744MSI0dkUCZVt+o4Wi2kRqCU9cQ=;
 b=ZcTpOftDmFzVRvfpTsyyzyH3EKmIp3APfgmq3fEcJuTLtGRM55DNPBDPJ+c38rvSCT
 N+rSd2ygcpIel6Y/Q280e7jdRpgRICTcPB5NVeMjDIGVCz1hDZ1nKEmaHZk5sc6Xc5d4
 /LNpVehmc6cVGrOCmoxDwhxtuwqlRDZ6A3XeAmwS9OlFplHFhbvuNZQPiLQvdOsnKNkF
 rsFHpeCUt2aDtamcZFyXmyk/5iP4TVs3H2GrulYStFvHvbPlljWybAgd2YexTsmbGXZX
 dge4EC753+X/kvHhHh0hLC0hXyUFuO+L0if7J+UNSxhmmw1Pi6SAL2XEH6ETXevjuAaw
 PJGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV13zxwdHx+w7AlrgaCNpBYNI5kQpuiXwfgw37AD6EUkKwdz0rSFTrTr8iuDxVetq7I6AB+Rc6yxUA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycbUaaCRWqlAdbkybEU4TdnJ0Pb7p8Pmbm41WamGTzg6lpoTVN
 nHAI0fBFCO90O9G4VVYT7p9tBsztcANfONKRrq1mUFnqkh7rc2yKbHMS
X-Gm-Gg: ASbGncvnGcfW1a9mH2wEBKjqrsKz0IgR/jeiaVzQOVfn8m8vSXq5F1EB7aKk+T1GVhW
 pOr17oqXSJW34c9KWRvFJTpO41LDOqyRB+BIJ8GJ/MYaK31tTmSIHE3CYArYeJ9BXNmpMe1KFVx
 7Wmu+xRJFj6i6eVKTHm84SQABYiR6CnjtDQdyJshvI6dKZz5d+Dbq1/aHjGDeNSAydPBLF5ezJI
 4/JRdIAj1t6YEe8LjRXFLfhfVtz8w/JZ+DpYfP1+kMtks+8mhD+gzgeAhuKcGC1nsGdxCZcI9uh
 +pHPCmaPHFp6YDyCURyKaR3chC1NNF5pNVhO1gHYtYMoGCIgtcfk3w7qnmCi/kw4Rj4yuJz35LL
 ikSMXxJlYvyt+YHlP9u2I8iN2ckoi3bA2Vt+2glsES2wvJSqCbNDbjVoyCYyZDtrWBZPEAgfXID
 2USk5JXZHL6yvOUlGp8eoF8SEuLrVY
X-Google-Smtp-Source: AGHT+IEaUHrZm36TzujHB3atkHpPtOn7/1/PguhG61tVYMTx0+WCsxhMTWkx0TTDhC0ihbzPgU9YGg==
X-Received: by 2002:a17:907:2d29:b0:b50:891f:66ae with SMTP id
 a640c23a62f3a-b6c78839802mr77886466b.9.1760994037800; 
 Mon, 20 Oct 2025 14:00:37 -0700 (PDT)
Received: from [192.168.1.105] ([165.50.73.64])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b65e838b946sm872537866b.19.2025.10.20.14.00.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 14:00:37 -0700 (PDT)
Message-ID: <1a25af58-3504-4b98-9d1d-63974491ee95@gmail.com>
Date: Mon, 20 Oct 2025 23:00:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/tiny: Use kmalloc_array() instead of kmalloc()
To: Shuah Khan <skhan@linuxfoundation.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Greg KH <gregkh@linuxfoundation.org>
Cc: lanzano.alex@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 david.hunter.linux@gmail.com, khalid@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20251019151247.171558-1-mehdi.benhadjkhelifa@gmail.com>
 <2025101910-dipper-suburb-1755@gregkh>
 <cb0f0a36-0593-4d4c-8450-d086b9c99d87@suse.de>
 <d072dfe7-e0e9-49f6-89ed-25d194035e3b@gmail.com>
 <02e617bec795d2ef371069f2d5fb954dfb31a450@intel.com>
 <ea12faad-1735-4a49-a70d-d4cac5629042@linuxfoundation.org>
 <b0b1c2e9-c367-4e9c-b931-d3e1b0ba7f5b@gmail.com>
 <21415b1d-17c0-42a0-961c-a4aee16d20d1@linuxfoundation.org>
Content-Language: en-US
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
In-Reply-To: <21415b1d-17c0-42a0-961c-a4aee16d20d1@linuxfoundation.org>
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

On 10/20/25 9:22 PM, Shuah Khan wrote:
> On 10/20/25 15:11, Mehdi Ben Hadj Khelifa wrote:
>> On 10/20/25 9:06 PM, Shuah Khan wrote:
>>> On 10/20/25 03:50, Jani Nikula wrote:
>>>> On Sun, 19 Oct 2025, Mehdi Ben Hadj Khelifa 
>>>> <mehdi.benhadjkhelifa@gmail.com> wrote:
>>>>> On 10/19/25 3:47 PM, Thomas Zimmermann wrote:
>>>>>> Hi
>>>>>>
>>>>>> Am 19.10.25 um 16:34 schrieb Greg KH:
>>>>>>> On Sun, Oct 19, 2025 at 04:12:28PM +0100, Mehdi Ben Hadj Khelifa 
>>>>>>> wrote:
>>>>>>>> Replace kmalloc() with kmalloc_array() to correctly
>>>>>>>> handle array allocations and benefit from built-in overflow 
>>>>>>>> checking[1].
>>>>>>>>
>>>>>>>> [1]:https://docs.kernel.org/process/deprecated.html
>>>>>>>>
>>>>>>>> Signed-off-by: Mehdi Ben Hadj Khelifa 
>>>>>>>> <mehdi.benhadjkhelifa@gmail.com>
>>>>>>>> ---
>>>>>>>>    drivers/gpu/drm/tiny/repaper.c | 2 +-
>>>>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/
>>>>>>>> repaper.c
>>>>>>>> index 4824f863fdba..290132c24ff9 100644
>>>>>>>> --- a/drivers/gpu/drm/tiny/repaper.c
>>>>>>>> +++ b/drivers/gpu/drm/tiny/repaper.c
>>>>>>>> @@ -534,7 +534,7 @@ static int repaper_fb_dirty(struct
>>>>>>>> drm_framebuffer *fb, const struct iosys_map *
>>>>>>>>        DRM_DEBUG("Flushing [FB:%d] st=%ums\n", fb->base.id,
>>>>>>>>              epd->factored_stage_time);
>>>>>>>> -    buf = kmalloc(fb->width * fb->height / 8, GFP_KERNEL);
>>>>>>>> +    buf = kmalloc_array(fb->height / 8, fb->width, GFP_KERNEL);
>>>>
>>>> Also worth emphasizing that this is wildly wrong for any height that is
>>>> not a multiple of 8.
>>>>
>>>> And I thought I shot down a similar patch not long ago.
>>>>
>>>> Is there some tool that suggests doing this? Fix the tool instead
>>>> please.
>>>>
>>>
>>> They are documented in https://docs.kernel.org/process/deprecated.html
>>> Mu understanding is that this document lists deprecates APIs so people
>>> don't keep adding new ones.
>>>
>>> I didn't get the impression that we are supposed to go delete them from
>>> the kernel and cause a churn.
>>>
>> I have sent an appropriate v2 specifically to suit the case that we 
>> have here. But the document[1] specifically quotes the following:"
>> Dynamic size calculations (especially multiplication) should not be 
>> performed in memory allocator (or similar) function arguments due to 
>> the risk of them overflowing. This could lead to values wrapping 
>> around and a smaller allocation being made than the caller was 
>> expecting. Using those allocations could lead to linear overflows of 
>> heap memory and other misbehaviors. (One exception to this is literal 
>> values where the compiler can warn if they might overflow. However, 
>> the preferred way in these cases is to refactor the code as suggested 
>> below to avoid the open-coded arithmetic.)"
>> Specifically mentionned the refactor of the code base in such cases 
>> which is why i'm doing the patches in the first place.Also i'm trying 
>> the best to send patches related to the issue where such issues of 
>> overflow are present or to be consistent with the same API used within 
>> the same subsystem.
>> [1]:https://docs.kernel.org/process/deprecated.html
>>
> 
> How are you testing these changes? Next time give more details on the
> where you found the problem - it is easy to miss the link unless you
> state that it is coming from the deprecated document.
> 
For my testing I have used a raspberry pi zero 2wh with an e-paper 
display to test. I have installed the custom kernel with my 
patch.Confirmed module loading in dmesg and ran modetest with no signs 
of regressions or errors in dmesg.
If further proof is needed I will be happy to provide it.
I will be mentionning the deprecated document more clearly next time.
> Even so you have to explain why the change is applicable to the code
> you are changing. How are you testing these changes. I have seen more
> patches from you in drm drivers and lib code.
> 
I have sent a v2 and it has the more suitable changes for this case as i 
said which was suggested by thomas. here is v2.
Important to note that my last testing was on v2 changes.
Link:https://lore.kernel.org/all/20251020115803.192572-1-mehdi.benhadjkhelifa@gmail.com/> 
thanks,
> -- Shuah

