Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 175DD591916
	for <lists+dri-devel@lfdr.de>; Sat, 13 Aug 2022 08:59:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20ED912B054;
	Sat, 13 Aug 2022 06:59:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BAF712BC86
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Aug 2022 06:59:00 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id o22so3667009edc.10
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 23:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:content-language:in-reply-to:mime-version
 :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc;
 bh=Bh55z1Hp0WJEYTzj+LaFpkJb2RB0LuhnuVVGTz/wbDw=;
 b=eHI+KRZy9vkjG/178q3LpEXhyPT3N1+yA6v+lgLuwqADp8ZOHQ9EVstVj8qQ0T0qH8
 OU+WPg8eV/lZ5A48AH22CHlc3G9xC+Ezg/+CmrDKRCKGilolY+u2b+fSUP622ZJHeYae
 Cz68oiNud8p1L733x1h1P60tSIi37QH2mDg6PwcLShCF5JyXZt5Cw6zNcsIuGo3RC8gH
 L31QC9vHafReLCkyA039cLD+Sv628zS6W66TYqqD6i/uDadz36NqxNcCPDinBMZGfybH
 SLRkL/mJ4Fjd4udBbIgSveUWhpMucgJp2zODrDDUVHhrUK23jvg2/63ik00VbMe+hgFN
 xh5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:content-language:in-reply-to:mime-version
 :user-agent:date:message-id:from:references:cc:to:subject
 :x-gm-message-state:from:to:cc;
 bh=Bh55z1Hp0WJEYTzj+LaFpkJb2RB0LuhnuVVGTz/wbDw=;
 b=tm8MBzbqmmLlRgBOkYDGYCyoJmqEVzSSINDnK9RsmklgCXDkhSQK/kByZapoPyO87t
 q1048hNSxed3RVWY7yb3NEQzPNnNjwBzu1bZ8PvFsIgZ/tzoTkvvuSHE9oMrlcT1Wmcr
 r4J5FLmum1kXw5Ea71IgLRDp5qdn25W2AvLK8bM3RyvhKTk3BSHm7yW97pqt1AeSgyLI
 vT+fTbagJ3RlM/NkrZmQQ/EZeoQaqzM+OoqdLwCA+NbryJuHUqhgfebUljOwMeKFs13O
 xsghji81na8h7xTqYhSxKs+zGDRb4BhBT52P59EN/ouF2DjwDHrdK9ArhPFjUQJU9ik2
 93YQ==
X-Gm-Message-State: ACgBeo2Dl9lfAPRqk0lbw6cUJ5mykSscsPX6G6MlJmH81Hndcrw1gsD8
 cH88Tv+rlRWqFhZ/xWqPA8s=
X-Google-Smtp-Source: AA6agR545Lqp/BpBXBaV6bLUlLym+P/SibTONO5Iz6yoO/jpdhU3lRkF0Xqh23G8OMWM6AV2TVrJDw==
X-Received: by 2002:a05:6402:11cf:b0:43d:fc84:c51a with SMTP id
 j15-20020a05640211cf00b0043dfc84c51amr6281037edw.80.1660373938600; 
 Fri, 12 Aug 2022 23:58:58 -0700 (PDT)
Received: from [192.168.1.10] ([46.249.74.23])
 by smtp.googlemail.com with ESMTPSA id
 eu18-20020a170907299200b00731582babcasm1562796ejc.71.2022.08.12.23.58.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Aug 2022 23:58:58 -0700 (PDT)
Subject: Re: [PATCH 3/3] drm: omapdrm: Do no allocate non-scanout GEMs through
 DMM/TILER
To: Yongqin Liu <yongqin.liu@linaro.org>
References: <1642587791-13222-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <1642587791-13222-4-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <5b6d3e7f-c638-fdc7-5080-44d34abed610@ideasonboard.com>
 <a3ed3a2c-86ce-1c85-e8aa-c08b54ad1a43@gmail.com>
 <CAMSo37XdZSZUHLWJj373DdtOBA9=uD8SJ7ywWCYF2pU1i4cB_g@mail.gmail.com>
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Message-ID: <ed4fe238-4fcd-1253-658f-18fe1e1f13b0@gmail.com>
Date: Sat, 13 Aug 2022 09:58:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Firefox/60.0 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAMSo37XdZSZUHLWJj373DdtOBA9=uD8SJ7ywWCYF2pU1i4cB_g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: "Bajjuri, Praneeth" <praneeth@ti.com>, tomba@kernel.org, airlied@linux.ie,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, merlijn@wizzup.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tony@atomide.com, linux-omap@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Liu,

On 12.08.22 г. 7:35 ч., Yongqin Liu wrote:
> Hi, Ivaylo, Tomi
> 
> We have one X15 Android AOSP master build, it could not have the home
> screen displayed
> on the hdmi monitor connected with this change, with the following
> message printed on the serial console
>      [  607.404205] omapdrm omapdrm.0: Failed to setup plane plane-0
>      [  607.410522] omapdrm omapdrm.0: Failed to setup plane plane-1
>      [  607.416381] omapdrm omapdrm.0: Failed to setup plane plane-2
>      [  607.422088] omapdrm omapdrm.0: Failed to setup plane plane-3
> 
>     # for details, please check the link here: http://ix.io/47m1
> 
> It will work with home screen displayed on the hdmi monitor if this
> change is reverted.
> 
> Is this the broken problem you talked about here?
> 
> And could you please give some suggestions on how to have the x15
> Android build work with this change?
> 

Make sure scanout (i.e. those to be displayed) buffers are actually 
allocated as such - OMAP_BO_SCANOUT flag must be set when calling 
omap_bo_new().

Regards,
Ivo.


> Thanks,
> Yongqin Liu
> On Thu, 17 Feb 2022 at 23:29, Ivaylo Dimitrov
> <ivo.g.dimitrov.75@gmail.com> wrote:
>>
>>
>>
>> On 17.02.22 г. 14:46 ч., Tomi Valkeinen wrote:
>>> Hi,
>>>
>>> On 19/01/2022 12:23, Ivaylo Dimitrov wrote:
>>>> On devices with DMM, all allocations are done through either DMM or
>>>> TILER.
>>>> DMM/TILER being a limited resource means that such allocations will start
>>>> to fail before actual free memory is exhausted. What is even worse is
>>>> that
>>>> with time DMM/TILER space gets fragmented to the point that even if we
>>>> have
>>>> enough free DMM/TILER space and free memory, allocation fails because
>>>> there
>>>> is no big enough free block in DMM/TILER space.
>>>>
>>>> Such failures can be easily observed with OMAP xorg DDX, for example -
>>>> starting few GUI applications (so buffers for their windows are
>>>> allocated)
>>>> and then rotating landscape<->portrait while closing and opening new
>>>> windows soon results in allocation failures.
>>>>
>>>> Fix that by mapping buffers through DMM/TILER only when really needed,
>>>> like, for scanout buffers.
>>>
>>> Doesn't this break users that get a buffer from omapdrm and expect it to
>>> be contiguous?
>>>
>>
>> If you mean dumb buffer, then no, this does not break users as dumb
>> buffers are allocated as scanout:
>>
>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/omapdrm/omap_gem.c#L603
>>
>> If you mean omap_bo allocated buffers, then if users want
>> linear(scanout) buffer, then they request it explicitly by passing
>> OMAP_BO_SCANOUT.
>>
>> Ivo
> 
> 
> 
