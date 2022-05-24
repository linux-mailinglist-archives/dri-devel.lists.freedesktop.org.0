Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59175532680
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 11:36:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7ACD10F43E;
	Tue, 24 May 2022 09:36:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C5A810F435
 for <dri-devel@lists.freedesktop.org>; Tue, 24 May 2022 09:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653384986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/9eD1mHz71vyUxVmIchZTTTOa0qrQvull/rACVzBDNk=;
 b=ZE5st6qyjs2UH244Ja34DL2iPxx7Zqmyfc/L5gIwJ1U25WRTk/ZQ6Hy2d1T1PFsT0PV7O+
 FApwjE7Wmi4UjzyZ8rnftSl1R2DaMnPaDj0LxBQK/9rGMqF0RPmJIjJsmZMj4LfkHdnN0b
 ZEudVOi6QJouk5rD0IQwPmLsZQeMSZg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-k10Huta1Oh66UhnaY66vKA-1; Tue, 24 May 2022 05:36:25 -0400
X-MC-Unique: k10Huta1Oh66UhnaY66vKA-1
Received: by mail-wm1-f71.google.com with SMTP id
 bg13-20020a05600c3c8d00b003974d0ff917so1040207wmb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 May 2022 02:36:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/9eD1mHz71vyUxVmIchZTTTOa0qrQvull/rACVzBDNk=;
 b=TXtBFhH689TmJ6H4jl9g0Rf+Xzhca1hUJT32NGXfzqloW8RwHC5VmmoTGSt9X1DHuq
 D2RL+rUSEO8ibTeFhG3NfQkgiHGv4jQavmKQQxyJcTtzGUPOBwssJlcwyW84GSVsbn5H
 zWphwWEfChVb/EPPFv0tZ9/AJqhs/KOvE/Voq7XI32dvIU2UY1J6Ys7dw4mUPblIJI5K
 PtoJvhy66C9JFAdxlkFG7Rr0wduqsS9bHlnSFOi5REwdGavBG7wOSaIdXoKU4gY7Wn5z
 4HTy56LUngRvzvMYxvl6+rNp6P3syxp82biDsfaBs9RbqpabC51fPfOPbKY5viJajVKq
 JiIg==
X-Gm-Message-State: AOAM530Eu50Y49ElYp6kjOmkbR8DoEu2IWCqBVCRKTvHNp3FvUk5Wg5s
 g1nMgSvxlS92eXBP200jCqsddIXoZRTwY5Py3tz2fcd4r8VLhHhVo/fdTmY2Jcpj5vMQ5odi/MQ
 5b/O9Ki6jY/HJi2nvzh2Z00zRSWFb
X-Received: by 2002:a05:6000:168a:b0:20f:d6e8:a5b with SMTP id
 y10-20020a056000168a00b0020fd6e80a5bmr8833554wrd.41.1653384983817; 
 Tue, 24 May 2022 02:36:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaAL3/tpx09T38CG2pv0dRj74DgG98TlpoutqWUsqZjtGLiIlUqpdossNMqpMrvpFqAFmPig==
X-Received: by 2002:a05:6000:168a:b0:20f:d6e8:a5b with SMTP id
 y10-20020a056000168a00b0020fd6e80a5bmr8833538wrd.41.1653384983627; 
 Tue, 24 May 2022 02:36:23 -0700 (PDT)
Received: from [10.128.38.70] ([141.113.64.80])
 by smtp.gmail.com with ESMTPSA id
 h19-20020adfaa93000000b0020c5253d8f7sm12499054wrc.67.2022.05.24.02.36.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 May 2022 02:36:23 -0700 (PDT)
Message-ID: <d9c4b940-4a16-cd6f-2672-752a2678c32c@redhat.com>
Date: Tue, 24 May 2022 11:36:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: How should "max bpc" KMS property work?
To: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <ppaalanen@gmail.com>
References: <20220426113502.224d0a90@eldfell> <YmgyArRaJCh6JkQh@intel.com>
 <57d16ed5-8bfc-ce29-9250-14e2de18710a@redhat.com>
 <20220523112246.056ddc99@eldfell>
 <CA+hFU4wTHR9kLrFY3XkbeROZgxWamiZ6yGYL4jH+wpe8MzLvMw@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CA+hFU4wTHR9kLrFY3XkbeROZgxWamiZ6yGYL4jH+wpe8MzLvMw@mail.gmail.com>
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
Cc: =?UTF-8?Q?Jonas_=c3=85dahl?= <jadahl@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 5/23/22 13:54, Sebastian Wick wrote:
> On Mon, May 23, 2022 at 10:23 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>>
>> On Fri, 20 May 2022 17:20:50 +0200
>> Hans de Goede <hdegoede@redhat.com> wrote:
>>
>>> I got pointed to this thread by Jonas Ådahl while asking some questions
>>> the "max bpc" property related to:
>>>
>>> https://gitlab.freedesktop.org/plymouth/plymouth/-/issues/102#note_1382328
>>>
>>> The current i915 behavior which you describe here, which if I understand
>>> things correctly is for "max bpc" to default to as high as possible is
>>> causing problems with flickerfree boot in plymouth. Plymouth does a modeset
>>> on the monitor's native resolution in case the BIOS/GOP setup the monitor
>>> in a non native mode. Plymouth does not touch the "max bpc" property when
>>> doing this modeset. Normally this works fine and when the BIOS/GOP has
>>> already configured the monitor at the native resolution the i915 driver
>>> will do a fastset and all is well.
>>>
>>> Still the modeset is causing the screen to go black for multiple seconds,
>>> despite the resolution being unchanged. What is happening according to
>>> the on screen mode info from the monitor is that on plymouth's modeset
>>> the link is being configured changes from 8 bpc to 10 bpc.
>>>
>>> Is there anyway to avoid this without hardcoding "max bpc" to 8 in
>>> plymouth (which would cause the same problem in the other direction
>>> if the firmware sets up the link for 10bpc I believe) ?
>>
>> Hi Hans,
>>
>> there was an attempt to get much of the current link state information
>> delivered to userspace, but I've forgot most about it.
>> I did find https://lkml.org/lkml/2021/6/18/294 linked from
>> https://gitlab.freedesktop.org/drm/amd/-/issues/476#note_963469 .
>> I said the same in the Plymouth Gitlab issue you linked to.
>>
>> Personally, I would need to know all current link details for
>> (professional) color management: am I still driving the monitor with
>> the same signal as I did when I measured the monitor one reboot ago?
>> If not, I cannot trust the color output and need to measure again.
> 
> I would go further and say that not being in control of all the link
> details is an issue for user space.
> 
> Max bpc doesn't give us a minimum guarantee.
> Bpc doesn't really make sense for YUV.
> We don't know if the link is using RGB or YUV.
> The Colorspace property requires user space to know if the link is RGB
> or YUV (or does the link change depending on the Colorspace property?
> What about the default Colorspace?).
> Link compression can mess up colors.
> 
> There simply is no way to write a proper user space with the current KMS API.
> 
>>
>> Nice to see there would be other uses for knowing which might be higher
>> priority to the larger community.
>>
>> Would it be proper to initialize 'max bpc' to the link depth used by
>> boot-up firmware? I guess it could make things more reliable and solve
>> the Plymouth blanking issue, but not the professional color management
>> use cases.
> 
> I was always under the impression that if you do an atomic commit
> without changing any properties that it won't result in a mode set
> which would clearly make the current behavior a bug.

I agree, IMHO the i915 driver currently setting max-bpc to 12 by default,
causing an unrequested link re-negotation on the first modeset is
a bug in the i195 driver and is also the root cause of this
plymouth bug-report:

https://gitlab.freedesktop.org/plymouth/plymouth/-/issues/102

Regards,

Hans

