Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E34A762F6F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 10:16:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 157CC10E439;
	Wed, 26 Jul 2023 08:16:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16E5310E439
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 08:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690359401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sBKsasH6aSCA6DMY4dfN1hY45Q1py7xwf31kafu3YjI=;
 b=ZnauYeTc8WLIhXGSxu5fuh9UYFU9B1kOce3h1ARdSIn31Z6kTc13QdHhKAyUx7NL86CbSN
 4PcO+I2LwmN9RmWsfU7huBEOSOQ93VtmSHQwwFu67M+3tvOgGsKgyu0hfkBSQVFlJd0IC3
 YhZViXdCABrMW16wPfqGMTr5hPKi3x4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-1t_X4odENM2JuEPx9_4lWg-1; Wed, 26 Jul 2023 04:16:39 -0400
X-MC-Unique: 1t_X4odENM2JuEPx9_4lWg-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-316f5d82bf4so3800614f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 01:16:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690359398; x=1690964198;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sBKsasH6aSCA6DMY4dfN1hY45Q1py7xwf31kafu3YjI=;
 b=YeLB5h1Xk/EKM5CmSWLbog4NtFwGZPe8tLNSG9Y2Up83J35K/HFby0AbVCHdvhFVTT
 ZXL1m1jICyIKeS+x0+5gMZkxIP8ozHjjRsBMZuIjiZX2/RosM/8LqszrIWhDr8cNMTPk
 KnmJQj6JXotA5ORy2rJN+YOI1pk3bz8pusnZgJkUXCUTJu56mryuGcBV0UoJTRg6g9c4
 zLbUWvwBUCm7OmYKTMqzDw3hUiG+ITXnFVLjfcAKdC4LpUDtYpSPjlzdTp8JirpXIAtX
 HyACtyD6UVcPZXAkIf+arVBH/CCIGdfZhRI57Nu/BDQmxv85ifR+VUj+2r3lsSDZz04T
 2NqQ==
X-Gm-Message-State: ABy/qLbxrdNUdZxPM+1QjS37T2Pw9c0o2Bzte0hz8hqw4UCmJCBexqL+
 PoXCuHjWnZ4hjluIJhidN3/majc7DHJLGuVUb066x3673OZEuJxjH9B/SPkRjRftIv6zsUWxWN/
 Vs9V/ub0ZPcXHLquc28NMm8CVsHvKnPnbZ2lF
X-Received: by 2002:a5d:5906:0:b0:313:f4e2:901d with SMTP id
 v6-20020a5d5906000000b00313f4e2901dmr779362wrd.22.1690359398601; 
 Wed, 26 Jul 2023 01:16:38 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEj5IRC8tG3bAu+cas2hyTzapuPnxlyZCBuTlxK5iXQi/UQPVOGBZCcvqVdFvyxIensUlrOQw==
X-Received: by 2002:a5d:5906:0:b0:313:f4e2:901d with SMTP id
 v6-20020a5d5906000000b00313f4e2901dmr779354wrd.22.1690359398320; 
 Wed, 26 Jul 2023 01:16:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:680e:9bf4:b6a9:959b?
 ([2a01:e0a:d5:a000:680e:9bf4:b6a9:959b])
 by smtp.gmail.com with ESMTPSA id
 i8-20020adff308000000b003176f2d9ce5sm3891794wro.71.2023.07.26.01.16.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jul 2023 01:16:37 -0700 (PDT)
Message-ID: <4e470182-d8da-b727-d163-d9c45bd0dc47@redhat.com>
Date: Wed, 26 Jul 2023 10:16:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/mgag200: Increase bandwidth for G200se A rev1
To: Roger Sewell <roger.sewell@cantab.net>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20230717133037.25941-1-jfalempe@redhat.com>
 <69a9ee2e-bd03-2a63-6651-0680475d7025@suse.de>
 <4f5d262c-527f-0fa6-45e3-a75aa22fcf0d@suse.de>
 <20230724215746.10928@revelation.broadband>
 <ca6cd674-d268-6210-c66d-4750e28a5c77@suse.de>
 <20230725223127.4184@revelation.broadband>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20230725223127.4184@revelation.broadband>
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

On 25/07/2023 23:31, Roger Sewell wrote:
> 
> Thomas,
> 
> Thank you for your reply.
> 
>>> Table 10 in the following document says that  1440x900@60Hz is
>>> supported:
>>> https://www.intel.com/content/dam/support/us/en/documents/motherboards/server/s5520ur/sb/e44031012_s5520ur_s5520urt_tps_r1_9.pdf
>>
>> That manual says that the resolution is only supported with at most
>> 24-bit colors. The old X code still supports that to some extend, but
>> modern userspace doesn't.
> 
> How can I check for sure whether I am using 24 or 32 bits per pixel ?

The easiest solution if you already rebuilt your kernel is to print the 
variable bpp here:

https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/mgag200/mgag200_mode.c#L326

pr_info("mgag200 bpp %d\n", bpp);

Also if you can run Wayland at 1440x900@60, that would mean the hardware 
is indeed able to handle it in 32bit.

> 
>>> so in particular the chip is said to be a G200e, not the G200SE-A
>>> that the kernel module seems to be interpreting it as.
> 
>> It actually is the G200SE-A. It's just named differently by lspci. The
>> PCI device id should be 0x0522.
> 
> It is indeed 0x0522.
> 
>> So the old kernel already did the right thing.
> 
> (but if I understand the situation right Xorg didn't ?)
> 
>> You can do
>>
>>    cat /sys/class/drm/card1-VGA-1/modes
>>
>> on the old and new kernel. With a monitor connector, it will tell you
>> the supported resolutions.
> 
> With the new kernel and the unmodified mgag200 module it tells me that
> 1440x900 is not on the list - but Xorg still lists it under
> Settings->Display (and Wayland doesn't). With the increased bandwidth
> module in place it tells me 1440x900 is on the list. I think this is as
> you expect as far as the kernel rather than Xorg is concerned.
> 
> Thanks,
> Roger.
> 

Best regards,

-- 

Jocelyn

