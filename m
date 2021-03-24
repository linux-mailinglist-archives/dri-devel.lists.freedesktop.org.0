Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3B9347A64
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 15:14:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C6D36EB8D;
	Wed, 24 Mar 2021 14:14:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF9136EB8D
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 14:14:39 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id l4so33114521ejc.10
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 07:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FCHZXs+Na6H0beDmf/OCng/T5K6DKQZL7k9xPgulymE=;
 b=CSmURK4SwSnVaLiGIPpo0hW0XaafR3WnY0Kktfn6Q8w2WAkQ2pI/vtZsaqDMr+Rrqm
 3j9+izYQ4UqWXHMKZToSCUpFRjOnIXY8UJy2FWXpJpqMTZ1LwLqfqxHXjI3T7WuIhnJ3
 rDX0OvQ/BcN4cPnIJD1S57p05tgOJZ1lraw5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FCHZXs+Na6H0beDmf/OCng/T5K6DKQZL7k9xPgulymE=;
 b=TceopF+pitCF36Gs5IZzZ0QLaXWKaKoUYCpyJeQxKqg73biag8A8578kNPElPKtsCr
 CcEKQZhoGTPqVl8fkfb4zV7VIt/ZlIYt/AqCMyvO9WbExf2bbjlx/726HdeCdTuN4qrp
 h3Ke9BGI9ILvMqb7MUiFYRGmcv17Y3JG0O4J0/DYFeVhn0szSA/ThoO8/tkjcr38sE3p
 zP9cvNFASDT54Sl3Jjyrv5SDDX9d+Ju3yo7NwWKDfQJPI22FSwC8bvkazOMyfqXCr5ql
 wqFxt4Seo2WCHF1WF5ckHgSvRr96O6i9O/bJvCSkQ4AxEamjDE7Ae/OVO9foefrYOekR
 dLDQ==
X-Gm-Message-State: AOAM532tZKpa9LyP6cQVQvZnB4kK6QEcYodTL7MzAtxZDzGb2l37zYyD
 lJSx71HzHlvFrRcSDv7qgQt1ig==
X-Google-Smtp-Source: ABdhPJww1pdM64UL62x05vVdAART6xCBNzDfZeqUIHi/5inBRmV8dfVIuzHdABjEJtiJD1nhk3/fww==
X-Received: by 2002:a17:906:8447:: with SMTP id
 e7mr3979848ejy.523.1616595278353; 
 Wed, 24 Mar 2021 07:14:38 -0700 (PDT)
Received: from [192.168.1.149] ([80.208.71.248])
 by smtp.gmail.com with ESMTPSA id c10sm1179885edt.64.2021.03.24.07.14.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 07:14:37 -0700 (PDT)
Subject: Re: [PATCH] amdgpu: fix gcc -Wrestrict warning
To: Arnd Bergmann <arnd@kernel.org>
References: <20210323130430.2250052-1-arnd@kernel.org>
 <f8cd5d0b-0c50-a2e9-a5a1-a2358419dd44@rasmusvillemoes.dk>
 <CAK8P3a17=PdOqKrvemuP1OCzoxRZ0HLBje-tV4Ssc=kZeVbQRw@mail.gmail.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <4e63dbbc-0aa3-2950-dda1-1e6aa19d7d5d@rasmusvillemoes.dk>
Date: Wed, 24 Mar 2021 15:14:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAK8P3a17=PdOqKrvemuP1OCzoxRZ0HLBje-tV4Ssc=kZeVbQRw@mail.gmail.com>
Content-Language: en-US
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
Cc: Jinzhou Su <Jinzhou.Su@amd.com>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Huang Rui <ray.huang@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/03/2021 14.33, Arnd Bergmann wrote:
> On Tue, Mar 23, 2021 at 4:57 PM Rasmus Villemoes
> <linux@rasmusvillemoes.dk> wrote:
>> On 23/03/2021 14.04, Arnd Bergmann wrote:
>>>                       if (securedisplay_cmd->status == TA_SECUREDISPLAY_STATUS__SUCCESS) {
>>> +                             int pos = 0;
>>>                               memset(i2c_output,  0, sizeof(i2c_output));
>>>                               for (i = 0; i < TA_SECUREDISPLAY_I2C_BUFFER_SIZE; i++)
>>> -                                     sprintf(i2c_output, "%s 0x%X", i2c_output,
>>> +                                     pos += sprintf(i2c_output + pos, " 0x%X",
>>>                                               securedisplay_cmd->securedisplay_out_message.send_roi_crc.i2c_buf[i]);
>>>                               dev_info(adev->dev, "SECUREDISPLAY: I2C buffer out put is :%s\n", i2c_output);
>>
>> Eh, why not get rid of the 256 byte stack allocation and just replace
>> all of this by
>>
>>   dev_info(adev->dev, ""SECUREDISPLAY: I2C buffer out put is: %*ph\n",
>> TA_SECUREDISPLAY_I2C_BUFFER_SIZE,
>> securedisplay_cmd->securedisplay_out_message.send_roi_crc.i2c_buf);
>>
>> That's much less code (both in #LOC and .text), and avoids adding yet
>> another place that will be audited over and over for "hm, yeah, that
>> sprintf() is actually not gonna overflow".
>>
>> Yeah, it'll lose the 0x prefixes for each byte and use lowercase hex chars.
> 
> Ah, I didn't know the kernel's sprintf could do that, that's really nice.

If you're bored, you can "git grep -E -C4 '%[0.]2[xX]'" and find places
that are inside a small loop, many can trivially be converted to %ph,
though often with some small change in formatting. If you're lucky, you
even get to fix real bugs when people pass a "char" to %02x and "know"
that that will produce precisely two bytes of output, so they've sized
their stack buffer accordingly - boom when "char" happens to be signed
and one of the bytes have a value beyond ascii and %02x produces 0xffffffXX.

%ph has a hard-coded upper bound of 64 bytes, I think that's silly
because people instead do these inefficient and very verbose loops
instead, wasting stack, .text and runtime.

Rasmus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
