Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C804976666F
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 10:09:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D48F810E680;
	Fri, 28 Jul 2023 08:09:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 310B310E680
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 08:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690531757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wio6vexWDLrnY6B4fx/kR5CJLCoLSmZhiCLRsBuutjI=;
 b=Q3ofZl/tDfZEQvpsOSOucK1RVCWagiarWlgPX4tVXVQP1XuDuWIXkNo7PmphiXfnh2E+gr
 3lk93U6G2eMdcfPAV12gfWudlHPYSbw7HM834Cw+27aiHdfsCrGochBLYwm1YhjIWHIghN
 J/iG87427aDNppreSyYxyeYfVaOC5lw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-UhyJlxU_PU65gqRsNjmJfw-1; Fri, 28 Jul 2023 04:09:15 -0400
X-MC-Unique: UhyJlxU_PU65gqRsNjmJfw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3fd2dec82b7so12368535e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 01:09:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690531754; x=1691136554;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wio6vexWDLrnY6B4fx/kR5CJLCoLSmZhiCLRsBuutjI=;
 b=a3tpSu4nebZ78T/R0GDDWKx37e0VgivSPGuLN98r6mbimA0QU5ziBOe1KRTxi4t8rx
 py8PwJkCGehESuNyo/J27B/7jap3SWQ0bHLQ9tctpEjHQL+llnRZ+iCS+z1uGfQ2Vgkv
 EpzLkzs4I7gBSEJc5VYLDfYHl4BcJ1uxjc+fuvvPUxeJtS1odVKfiDOgnLcCkV4uKO5B
 LXk9aZtfg81C8z2WinDPrXBougwWSu3q7IlFPR40HFoTixmst0E5Lr5hBUJ1Vf6ngu5l
 nAf24nZoukq9bXBvGkwhmKGS0vcRRdtxR18h9HUphjcl58JQXEZb4/MWLY/S/Xz/qRKV
 5y8Q==
X-Gm-Message-State: ABy/qLZ3EW5trc5rwwvi1qOs2QpB8wTBa5ujhHy+zUs2FU1qY0+33NiW
 m/X7qrj5gsCJx/QXVAgqg+gU7Dltvmhme7btJt1s0aDu7uKG0vPlBvx8KfQrrP42T4ocd9IkWlF
 S+UMan2GxpIwwcXNWu6ty04cLVNj2
X-Received: by 2002:a7b:c4d0:0:b0:3fb:ac9c:e6f with SMTP id
 g16-20020a7bc4d0000000b003fbac9c0e6fmr1081779wmk.38.1690531754792; 
 Fri, 28 Jul 2023 01:09:14 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGO4aL4q1CpEit2guvveJ3+SXdvj5FRKDit0pM1+B8xbIwdASYuA08rkLw1vDwpQ9srNdxORw==
X-Received: by 2002:a7b:c4d0:0:b0:3fb:ac9c:e6f with SMTP id
 g16-20020a7bc4d0000000b003fbac9c0e6fmr1081763wmk.38.1690531754517; 
 Fri, 28 Jul 2023 01:09:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:680e:9bf4:b6a9:959b?
 ([2a01:e0a:d5:a000:680e:9bf4:b6a9:959b])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a05600c044f00b003fbb1a9586esm6479447wmb.15.2023.07.28.01.09.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jul 2023 01:09:14 -0700 (PDT)
Message-ID: <3ff67cb3-c477-b834-3d6c-4eb99952d59b@redhat.com>
Date: Fri, 28 Jul 2023 10:09:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/mgag200: Increase bandwidth for G200se A rev1
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Roger Sewell <roger.sewell@cantab.net>
References: <20230717133037.25941-1-jfalempe@redhat.com>
 <69a9ee2e-bd03-2a63-6651-0680475d7025@suse.de>
 <4f5d262c-527f-0fa6-45e3-a75aa22fcf0d@suse.de>
 <20230724215746.10928@revelation.broadband>
 <ca6cd674-d268-6210-c66d-4750e28a5c77@suse.de>
 <20230725223127.4184@revelation.broadband>
 <9c8a0a5f-fd7f-cf6d-7e6e-ca90bdf957c5@suse.de>
 <20230727223438.4658@revelation.broadband>
 <d5156750-34d4-87dc-41ff-f3c3ca1f48c3@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <d5156750-34d4-87dc-41ff-f3c3ca1f48c3@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/07/2023 09:45, Thomas Zimmermann wrote:
> Hi
> 
> Am 27.07.23 um 23:34 schrieb Roger Sewell:
>>
>> Thomas, Jocelyn,
>>
>> As a result of the collection of the Xorg logs requested by Thomas, I've
>> realised that at some long-past point upgrade the 1440x900@60 mode
>> disappeared, and in order to get it back I introduced the file
>> /etc/X11/xorg.conf.d/20-screen.conf attached.
>>
>> If I remove this file, then with the unmodified new mgag200 module in
>> place, on going to Settings->Display I am no longer even offered the
>> 1440x900 option - presumably as a result of
>> mgag200_mode_config_mode_valid returning MODE_BAD.
>>
>> With this file in place, and with the unmodified new mgag200 module in
>> place, I am offered this setting, but if I pick it then it is not used
>> but *is* written into ~/.config/monitors.xml, and then on next login
>> graphics fail completely.
> 
> Thanks for this information. If you configure a screen and/or modes via 
> config file, such as 20-screen.conf, it overrides Xorg's autodetection. 
> So X will happily use whatever you configured. This explains my other 
> mail's question why Xorg even tries 1440x900 at all.
> 
>>
>> Hypothesis: there are two different places in the code where mode_valid
>> is potentially checked, both of which use the mgag200 module, and the
>> old module only does this check at one of them (deciding which modes to
>> offer) (which check is bypassed for modes requested in xorg.conf.d),
>> while the new module does it at both (and hence fails invalid modes
>> requested in xorg.conf.d) ??
> 
> There's mode detection, which does the general test with mode_valid. It 
> returns a list with possible modes. And there's mode setting, which 
> tests if the display setting as a whole (mode, color format, outputs, 
> and more) can can be programmed in the given combination. That's what 
> fails with the new driver, but worked with the old driver.
> 
> I guess that the configured mode of 1440x900 somehow passed testing in 
> the old driver. And as your chip could handle the overclocked pixelrate 
> settings, you got a stable output even with 32-bit colors.
> 
> I assume that the new driver is somehow more strict in testing and 
> rejects the overclocked pixel rate. (But I cannot see that in the code 
> TBH).

I think the culprit is probably this patch:
https://patchwork.freedesktop.org/patch/486242/

before this patch,
mgag200_simple_display_pipe_mode_valid() always return MODE_OK

after this patch, it checks the bandwidth limit too.

> 
>>
>> Looking for possible reasons why this might be the case (and straying
>> way beyond my competence), I note that in the old module
>> mga_vga_mode_valid is made known to other parts of the system in a
>> different way than mgag200_mode_config_mode_valid is in the new module
>> (and indeed they have different parameter types). (Might this be
>> relevant ?)
> 
> I'm not quite sure how to proceed here, as the driver is correct and the 
> problem came from a mismatching config file on your system.

So the bandwidth limit was not really enforced before, and the more 
strict behavior breaks the user's configuration that are over the limit.

> 
> Best regards
> Thomas
> 
>>
>> Best wishes,
>> Roger.
>>
>>
> 

