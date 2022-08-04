Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E9A5899D9
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 11:22:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D88E192F85;
	Thu,  4 Aug 2022 09:22:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 325412BF78
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 09:22:29 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id gb36so10199098ejc.10
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Aug 2022 02:22:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=KLFS4WUlaqxZbqoy7i8FOJPlIwGNfBkjIWJSYKEP0DM=;
 b=YI4z+BamjCLzN+Q+V2Li6/9OqTFmOgY6kc9xqL077vqHiW6k5CIiLfec7+qQyqFzEb
 xzn4xRNpML/clsVx2UxssxEbUdtUxBMhEukzkC1marEuEsEJZc9u6/8zvbeQx1If3I7U
 NgvLY9Uo4mu8R+sklkytd3TbP7OYYFBkJIiv9OGuUVeV6DVe4wYGXCDNoaLPjglI2zTD
 69u8grCd4VRm/rP5eWIbftz5CgFd8nbfvKRKzEyNrkl2PxaGy7cmnOeDpCdTah1QML+f
 dKSv2VMxQcI8F8Dpnml3LR/rBDs0ODdkj3sFoZHHrCx6jfsWcuvP04f0hbr2zngPufxu
 dSjA==
X-Gm-Message-State: ACgBeo0/S4YV3coIqn5BWHwqVbU65j2nvlELK5pJXvcrNyetN3IoImg2
 Ny7797XjlnbbF2RFNe0Fv+8=
X-Google-Smtp-Source: AA6agR7nr7rXhSDs20ISvDf9usQGNbKryjMfX5Glou808Dft/hnakz10xMZehmVM2yJKUeqPtOtHwQ==
X-Received: by 2002:a17:907:b14:b0:730:abbd:e965 with SMTP id
 h20-20020a1709070b1400b00730abbde965mr711749ejl.245.1659604947641; 
 Thu, 04 Aug 2022 02:22:27 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
 by smtp.gmail.com with ESMTPSA id
 a17-20020aa7cf11000000b0043cfb6af49asm377023edy.16.2022.08.04.02.22.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Aug 2022 02:22:27 -0700 (PDT)
Message-ID: <2d4e82f9-e370-bb01-8656-fe0376c22a77@kernel.org>
Date: Thu, 4 Aug 2022 11:22:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] tty: vt: selection: Add check for valid tiocl_selection
 values
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, Khalid Masum <khalid.masum.92@gmail.com>,
 syzbot <syzbot+14b0e8f3fd1612e35350@syzkaller.appspotmail.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <000000000000bbdd0405d120c155@google.com>
 <20220729065139.6529-1-khalid.masum.92@gmail.com>
 <eb4a26aa-da30-ceee-7d27-c1e902dd4218@gmx.de> <YuV9PybMPgc83Jis@p100>
 <1eb62346-304b-54d5-8a62-8a35888d51bd@kernel.org>
 <35e860bb-c76c-ca5f-3f48-2bf6cb798689@gmx.de>
 <0fbc2150-b4aa-f2cb-5084-3a9f69b3455d@gmx.de>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <0fbc2150-b4aa-f2cb-5084-3a9f69b3455d@gmx.de>
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

On 04. 08. 22, 10:44, Helge Deller wrote:
> On 8/4/22 09:15, Helge Deller wrote:
>> Hello Jiri,
>>
>> Thanks for looking into this patch!
>>
>> On 8/4/22 07:47, Jiri Slaby wrote:
>>> On 30. 07. 22, 20:49, Helge Deller wrote:
>>>> The line and column numbers for the selection need to start at 1.
>>>> Add the checks to prevent invalid input.
>>>>
>>>> Signed-off-by: Helge Deller <deller@gmx.de>
>>>> Reported-by: syzbot+14b0e8f3fd1612e35350@syzkaller.appspotmail.com
>>>>
>>>> diff --git a/drivers/tty/vt/selection.c b/drivers/tty/vt/selection.c
>>>> index f7755e73696e..58692a9b4097 100644
>>>> --- a/drivers/tty/vt/selection.c
>>>> +++ b/drivers/tty/vt/selection.c
>>>> @@ -326,6 +326,9 @@ static int vc_selection(struct vc_data *vc, struct tiocl_selection *v,
>>>>            return 0;
>>>>        }
>>>>
>>>> +    if (!v->xs || !v->ys || !v->xe || !v->ye)
>>>> +        return -EINVAL;
>>>
>>> Hmm, I'm not sure about this. It potentially breaks userspace (by
>>> returning EINVAL now).
>>
>> Right.
>> According to the code below, my interpretation is that all xs/ys/xe/ye values
>> should be > 0. But of course I might be wrong on this, as I didn't find any
>> documentation for TIOCL_SETSEL.
>>
>> And if userspace tries to set an invalid selection (e.g. by selecting row 0),
>> my patch now returns -EINVAL, while it returned success before.
>>
>>> And the code below should handle this just fine, right:
>>>>        v->xs = min_t(u16, v->xs - 1, vc->vc_cols - 1);
>>>>        v->ys = min_t(u16, v->ys - 1, vc->vc_rows - 1);
>>>>        v->xe = min_t(u16, v->xe - 1, vc->vc_cols - 1);
>>
>> It "handles it fine" in the sense that it can cope with the
>> input and will not crash.
>> But it returns (maybe?) unexpected results...
> 
> After some more thinking maybe you are right.
> In case a user provided invalid values in the past, simply an unexpected
> selection was set, but nothing broke.
> Since the patch doesn't fix any critical issue, we could just drop this patch
> and leave it as is.

We can still do a trial and revert it if something breaks... It's just 
that _noone_ knows with all this undocumented stuff ;).

But in fact, 0 currently means full row/column. Isn't it on purpose?

Today, we are out of luck, codesearch.debian.net gives no clue about users:
https://codesearch.debian.net/search?q=%5CbTIOCL_SETSEL%5Cb&literal=0

thanks,
-- 
js
suse labs
