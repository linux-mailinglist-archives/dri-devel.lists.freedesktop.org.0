Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8563424AFA6
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 09:15:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FEBD6E8CA;
	Thu, 20 Aug 2020 07:14:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 887006E1F7
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 13:01:00 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id h2so369298plr.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 06:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qNJVZUa8vOnjh3Y4FbI7cu96rnOZczrpWszoc4OM35E=;
 b=ZtDUAentzHDOfXLt1WNpX0PqLZgZi3vnfEc6anllVjv7Z89UoKoCCMUiljAdsTAGBL
 DEVHOWuWzMZeIuJcHwUlptWZjkCaOp1ZUKAoSs/2jyyTPejnx1zCbjPUY7C9na+Ftk+x
 wpw/pPjI4UYNDosNdy4j7LcDWUJhwNxLapyy4W7f1U00+fT6jVYw1uO8CMpHCStxGd8w
 JLOisGYqnJmeY5ie8I+x4A4vKZtwoQ6PsaOc8UAPD7eTAFlJwORflpx8o8EPJZR8cuSG
 1j977OWh0YEI5r2DXie/ItwJ0iuosRobp25OObO0Ld6mXVix+wRg8r73enQ5lMOcXAoG
 tjpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qNJVZUa8vOnjh3Y4FbI7cu96rnOZczrpWszoc4OM35E=;
 b=gUxgwaIQTVFfyB+7cjkTsJwCxlkG5/iL4uFaUcmUH0Ds5Jk4Q2X+GYONETi16tgCxH
 XkunUPwdzRSmgDOLa6EUbeePymORiHPmLNdkeo44qIVAZJlv/mH7343EsLSjKpqPRVGL
 kQQsUHuMwwqomfEJb8AutYkaL7AN+Ra+AKkSTDtPa6ERP1MsDknj01o6nzWTV1LvXKTL
 gklPKkbOJIKbeFJOzWqdUIV3rUvYTFzj6HYSVluoCw/9Z2RYFhAgzfH0CI5xCxCls9D2
 rcMBFhhrbzz7BTzxL1DR7wM0ANZ+vuEt1+DSTYqupEzLpTD2e48dlhQUH8Gx5FAk66q1
 N/KA==
X-Gm-Message-State: AOAM530il4hMtI9dYRvyoMbEZvM1ljfmYzq8IT4mt7dBcwYbA4Hr3f72
 FT401iC3eSGxZIJ7RWu16QMFWg==
X-Google-Smtp-Source: ABdhPJwcWyLwqgVIDq5QVfeKWIJZ1zweeStVncOtMpfxCFFFEuEh0sSa6pW/Ah5NefbMm4I9GwEzLw==
X-Received: by 2002:a17:90b:285:: with SMTP id
 az5mr3983315pjb.118.1597842058708; 
 Wed, 19 Aug 2020 06:00:58 -0700 (PDT)
Received: from [192.168.1.182] ([66.219.217.173])
 by smtp.gmail.com with ESMTPSA id d23sm20502027pgm.11.2020.08.19.06.00.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2020 06:00:58 -0700 (PDT)
Subject: Re: [PATCH] block: convert tasklets to use new tasklet_setup() API
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
 Kees Cook <keescook@chromium.org>
References: <20200817091617.28119-1-allen.cryptic@gmail.com>
 <20200817091617.28119-2-allen.cryptic@gmail.com>
 <b5508ca4-0641-7265-2939-5f03cbfab2e2@kernel.dk>
 <202008171228.29E6B3BB@keescook>
 <161b75f1-4e88-dcdf-42e8-b22504d7525c@kernel.dk>
 <202008171246.80287CDCA@keescook>
 <df645c06-c30b-eafa-4d23-826b84f2ff48@kernel.dk>
 <1597780833.3978.3.camel@HansenPartnership.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <f3312928-430c-25f3-7112-76f2754df080@kernel.dk>
Date: Wed, 19 Aug 2020 07:00:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1597780833.3978.3.camel@HansenPartnership.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 20 Aug 2020 07:14:47 +0000
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
Cc: ulf.hansson@linaro.org, linux-atm-general@lists.sourceforge.net,
 manohar.vanga@gmail.com, airlied@linux.ie, Allen Pais <allen.lkml@gmail.com>,
 linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kys@microsoft.com,
 anton.ivanov@cambridgegreys.com, devel@driverdev.osuosl.org,
 linux-s390@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
 maximlevitsky@gmail.com, richard@nod.at, deller@gmx.de,
 jassisinghbrar@gmail.com, 3chas3@gmail.com, intel-gfx@lists.freedesktop.org,
 kuba@kernel.org, mporter@kernel.crashing.org, jdike@addtoit.com,
 oakad@yahoo.com, s.hauer@pengutronix.de, linux-input@vger.kernel.org,
 linux-um@lists.infradead.org, linux-block@vger.kernel.org, broonie@kernel.org,
 openipmi-developer@lists.sourceforge.net, mitch@sfgoth.com,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, martyn@welchs.me.uk, dmitry.torokhov@gmail.com,
 linux-mmc@vger.kernel.org, sre@kernel.org, linux-spi@vger.kernel.org,
 alex.bou9@gmail.com, Allen Pais <allen.cryptic@gmail.com>,
 stefanr@s5r6.in-berlin.de, linux-ntb@googlegroups.com,
 Romain Perier <romain.perier@gmail.com>, shawnguo@kernel.org,
 davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/18/20 1:00 PM, James Bottomley wrote:
> On Mon, 2020-08-17 at 13:02 -0700, Jens Axboe wrote:
>> On 8/17/20 12:48 PM, Kees Cook wrote:
>>> On Mon, Aug 17, 2020 at 12:44:34PM -0700, Jens Axboe wrote:
>>>> On 8/17/20 12:29 PM, Kees Cook wrote:
>>>>> On Mon, Aug 17, 2020 at 06:56:47AM -0700, Jens Axboe wrote:
>>>>>> On 8/17/20 2:15 AM, Allen Pais wrote:
>>>>>>> From: Allen Pais <allen.lkml@gmail.com>
>>>>>>>
>>>>>>> In preparation for unconditionally passing the
>>>>>>> struct tasklet_struct pointer to all tasklet
>>>>>>> callbacks, switch to using the new tasklet_setup()
>>>>>>> and from_tasklet() to pass the tasklet pointer explicitly.
>>>>>>
>>>>>> Who came up with the idea to add a macro 'from_tasklet' that
>>>>>> is just container_of? container_of in the code would be
>>>>>> _much_ more readable, and not leave anyone guessing wtf
>>>>>> from_tasklet is doing.
>>>>>>
>>>>>> I'd fix that up now before everything else goes in...
>>>>>
>>>>> As I mentioned in the other thread, I think this makes things
>>>>> much more readable. It's the same thing that the timer_struct
>>>>> conversion did (added a container_of wrapper) to avoid the
>>>>> ever-repeating use of typeof(), long lines, etc.
>>>>
>>>> But then it should use a generic name, instead of each sub-system 
>>>> using some random name that makes people look up exactly what it
>>>> does. I'm not huge fan of the container_of() redundancy, but
>>>> adding private variants of this doesn't seem like the best way
>>>> forward. Let's have a generic helper that does this, and use it
>>>> everywhere.
>>>
>>> I'm open to suggestions, but as things stand, these kinds of
>>> treewide
>>
>> On naming? Implementation is just as it stands, from_tasklet() is
>> totally generic which is why I objected to it. from_member()? Not
>> great with naming... But I can see this going further and then we'll
>> suddenly have tons of these. It's not good for readability.
> 
> Since both threads seem to have petered out, let me suggest in
> kernel.h:
> 
> #define cast_out(ptr, container, member) \
> 	container_of(ptr, typeof(*container), member)
> 
> It does what you want, the argument order is the same as container_of
> with the only difference being you name the containing structure
> instead of having to specify its type.

Not to incessantly bike shed on the naming, but I don't like cast_out,
it's not very descriptive. And it has connotations of getting rid of
something, which isn't really true.

FWIW, I like the from_ part of the original naming, as it has some clues
as to what is being done here. Why not just from_container()? That
should immediately tell people what it does without having to look up
the implementation, even before this becomes a part of the accepted
coding norm.

-- 
Jens Axboe

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
