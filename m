Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EAA52EEF0
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 17:21:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1FA210E625;
	Fri, 20 May 2022 15:20:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F35D10E4C8
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 15:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653060055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yz0Slx19JCBpazZ4tpi7ccIYyos4fCxXXdsKFOTN7dA=;
 b=Bbymod5vmp7CQErUjoqRfh/WRFOteWZnZRrUuTIIV8+qgR6cc9PzWjCxX2CfUYmyx1VuT5
 pE3XMt/7VCE7eqTfWGAiMYhqoy3M/9eEorpeGW+BYI8LIUA6JXdKAMNHIRYaSCWwVXzdEm
 ID18X25r6ow+EZccUB1f2foQmB8mbxI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-Nxuf3RFVPn6smcGIR2PsYg-1; Fri, 20 May 2022 11:20:53 -0400
X-MC-Unique: Nxuf3RFVPn6smcGIR2PsYg-1
Received: by mail-ej1-f69.google.com with SMTP id
 oz9-20020a1709077d8900b006f3d9488090so4174176ejc.6
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 08:20:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yz0Slx19JCBpazZ4tpi7ccIYyos4fCxXXdsKFOTN7dA=;
 b=8M4S+brnPikH0t0jrjcSt3pe2p53EFpq2dSQ7J1Ta2Wwgp340gKCiv4OtnE57Q8TWq
 ormkTISFMIpXVv5WnRiabk2yuX6tZdEerwx09JTLLE4iFXqBoK3gaHHKicuoBDiGV9i+
 udvKQiICA9aWohUbgrCCmQcxYTBJwUc0xwTw4qf3i9ppSdc+MjoL63S3k9Z3VwwGWjK5
 ejWOqUPbsWcwyCEGWQ3S4CaP6/djxjKNz/S5pvZn+WMOYQuBmMDFytn4xTFN0OMskzbP
 utOJtwrQ8RZFxlilb7293i6oD1IZvA1gb32I/ypPclQJSFiRTnX5mVmsel1Adpx54NBy
 5E9A==
X-Gm-Message-State: AOAM531Luy5IBIoG5mjMPwY05sbj/X5CkLk+HGXf6dVY7eTHCoUWPsXH
 ZhxDOJPmuD1ieZn0TATMqOO/C1c+jJR3tlSfrGF8u2UCB2aOcVdNQWxCQzZWjzVOXsUCo7ePOks
 fBH7KQl4NePsF/kGo2qq7yBvIdoLC
X-Received: by 2002:a17:906:6a1c:b0:6f4:b0e0:2827 with SMTP id
 qw28-20020a1709066a1c00b006f4b0e02827mr8755723ejc.249.1653060052523; 
 Fri, 20 May 2022 08:20:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2RvBjxmRR2qs6xK5yCatioK5zm43Ve9kb1bq94UCE1TZqaZBL5SaDvD3e4zSyeeTqTP7mTA==
X-Received: by 2002:a17:906:6a1c:b0:6f4:b0e0:2827 with SMTP id
 qw28-20020a1709066a1c00b006f4b0e02827mr8755712ejc.249.1653060052288; 
 Fri, 20 May 2022 08:20:52 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6?
 (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170906329100b006f3ef214dd2sm3287991ejw.56.2022.05.20.08.20.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 May 2022 08:20:51 -0700 (PDT)
Message-ID: <57d16ed5-8bfc-ce29-9250-14e2de18710a@redhat.com>
Date: Fri, 20 May 2022 17:20:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: How should "max bpc" KMS property work?
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Pekka Paalanen <ppaalanen@gmail.com>
References: <20220426113502.224d0a90@eldfell> <YmgyArRaJCh6JkQh@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YmgyArRaJCh6JkQh@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 =?UTF-8?Q?Jonas_=c3=85dahl?= <jadahl@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 4/26/22 19:55, Ville Syrjälä wrote:
> On Tue, Apr 26, 2022 at 11:35:02AM +0300, Pekka Paalanen wrote:
>> Hi all,
>>
>> I'm working on setting HDR & WCG video modes in Weston, and I thought
>> setting "max bpc" KMS property on the connector would be a good idea.
>> I'm confused about how it works though.
>>
>> I did some digging in https://gitlab.freedesktop.org/wayland/weston/-/issues/612
>>
>> Summary:
>>
>> - Apparently the property was originally added as a manual workaround
>>   for sink hardware behaving badly with high depth. A simple end user
>>   setting for "max bpc" would suffice for this use.
>>
>> - Drivers will sometimes automatically choose a lower bpc than the "max
>>   bpc" value, but never bigger.
>>
>> - amdgpu seems to (did?) default "max bpc" to 8, meaning that I
>>   definitely want to raise it.
> 
> I've occasionally pondered about doing the same for i915, just to have
> the safest default possible. But I'd hate to lose the deep color testing
> coverage knowing very few people would in practice raise the limit.
> Also the number of systems where deep color doesn't work reliably
> (or can't be made to work by not using a crap cable) seems to be quite
> low.

I got pointed to this thread by Jonas Ådahl while asking some questions
the "max bpc" property related to:

https://gitlab.freedesktop.org/plymouth/plymouth/-/issues/102#note_1382328

The current i915 behavior which you describe here, which if I understand
things correctly is for "max bpc" to default to as high as possible is
causing problems with flickerfree boot in plymouth. Plymouth does a modeset
on the monitor's native resolution in case the BIOS/GOP setup the monitor
in a non native mode. Plymouth does not touch the "max bpc" property when
doing this modeset. Normally this works fine and when the BIOS/GOP has
already configured the monitor at the native resolution the i915 driver
will do a fastset and all is well.

Still the modeset is causing the screen to go black for multiple seconds,
despite the resolution being unchanged. What is happening according to
the on screen mode info from the monitor is that on plymouth's modeset
the link is being configured changes from 8 bpc to 10 bpc.

Is there anyway to avoid this without hardcoding "max bpc" to 8 in
plymouth (which would cause the same problem in the other direction
if the firmware sets up the link for 10bpc I believe) ?

Regards,

Hans

