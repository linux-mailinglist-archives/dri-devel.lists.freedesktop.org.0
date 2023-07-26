Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9255A763541
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 13:39:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51CE510E464;
	Wed, 26 Jul 2023 11:39:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FE1A10E464
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 11:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690371565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1nBurKbPp07JesoyVQ3GmKpdOAlKpPU+rBLmxuc7kg0=;
 b=X0/XMO0765odXI5WW6Nidm7Y+wQkk1zeN6VKfsHxIbdxNYTFnFrQ7cNk/9+QXF1OObGh5W
 kOqCW2ZF5ibny4Z6KX/6fFC1A4KFrlMM4nRNvjSVYdoOt6FOLzdoYCnGTT9YiNG6ftOivk
 2wCz9ESCz4SERzpJ6Pb2L8T7cFpeSPw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-3RflExH6PPmcXyYC2-oQYA-1; Wed, 26 Jul 2023 07:39:23 -0400
X-MC-Unique: 3RflExH6PPmcXyYC2-oQYA-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-31701b27d19so475633f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 04:39:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690371562; x=1690976362;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1nBurKbPp07JesoyVQ3GmKpdOAlKpPU+rBLmxuc7kg0=;
 b=NntebxLDVImTmmfY0TCEReqWByeaLSVB6SG6UW6e0IpFUmL9rs5twuzJqsN5Wt3zg+
 VJ9uSG1Ton5SLI1T158DymuYNRinBiQyu/Mur9MXqatJyeHP2SXv6NCJGuz4cwn6YJZV
 cP7/yHJ3HjYaM6tTkfClyKL1TXqPzPnmcMEafOEuZN5ZngWTeUaRvatFQyO7NoLNrW6/
 huQUE3XQRYEt7gTB3ZPWoLrWfr9zyLZ9blNhNjJJHT87y+L0iJrdeFcmPSCJrBenttOs
 V/w6opyKQOMvDg0Yway5TmsZw/J2EuRbajQTC11G6pVWq9guO10zSbeTTen88tIO67QZ
 znmg==
X-Gm-Message-State: ABy/qLZyFhf1B9veyD5UbhF0cyBx1DTj4xv0FM7mjQ9NpCH7Zv1mydGS
 bs5/KS5wVMgPiyJy8axpkEppnmQSGuEqGKt+v3JB/krbjkXxfwRsoDx6E7bw1RtvN9oTjZ1pvdL
 o7ulpqexl+y45MNaBdGSMHhqwRtda
X-Received: by 2002:adf:ee51:0:b0:317:36d8:d6e8 with SMTP id
 w17-20020adfee51000000b0031736d8d6e8mr4214507wro.25.1690371562587; 
 Wed, 26 Jul 2023 04:39:22 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEey8ZTPhsEi4ZBivO/5K9jghGDJpzkTWthoTmSmVhdVZ4+ZVOJjYnrIkrrAZBTffbOzdbXpg==
X-Received: by 2002:adf:ee51:0:b0:317:36d8:d6e8 with SMTP id
 w17-20020adfee51000000b0031736d8d6e8mr4214495wro.25.1690371562314; 
 Wed, 26 Jul 2023 04:39:22 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:680e:9bf4:b6a9:959b?
 ([2a01:e0a:d5:a000:680e:9bf4:b6a9:959b])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a5d4e0f000000b003142c85fbcdsm19463352wrt.11.2023.07.26.04.39.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jul 2023 04:39:21 -0700 (PDT)
Message-ID: <0fc5a88e-99df-78d3-ad41-2a7273a02906@redhat.com>
Date: Wed, 26 Jul 2023 13:39:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/mgag200: Increase bandwidth for G200se A rev1
To: Roger Sewell <roger.sewell@cantab.net>
References: <20230717133037.25941-1-jfalempe@redhat.com>
 <69a9ee2e-bd03-2a63-6651-0680475d7025@suse.de>
 <4f5d262c-527f-0fa6-45e3-a75aa22fcf0d@suse.de>
 <20230724215746.10928@revelation.broadband>
 <ca6cd674-d268-6210-c66d-4750e28a5c77@suse.de>
 <20230725223127.4184@revelation.broadband>
 <4e470182-d8da-b727-d163-d9c45bd0dc47@redhat.com>
 <20230726111114.5287@revelation.broadband>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20230726111114.5287@revelation.broadband>
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
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/07/2023 12:11, Roger Sewell wrote:
> 
> Jocelyn,
> 
>>> How can I check for sure whether I am using 24 or 32 bits per pixel
>>> ?
>>
>> The easiest solution if you already rebuilt your kernel is to print
>> the variable bpp here:
>>
>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/mgag200/mgag200_mode.c#L326
>>
>> pr_info("mgag200 bpp %d\n", bpp);
> 
> Did that, and I get "mgag200 bpp 32".
> 
>> Also if you can run Wayland at 1440x900@60, that would mean the
>> hardware is indeed able to handle it in 32bit.
> 
> I can indeed run Wayland at 1440x900@60.
> 
> So I think I'm right in saying that my graphics chip can handle
> 1440x900@60 with 32 bits per pixel.

Thanks for confirming that. So either the specification is a bit too 
conservative, or your specific hardware is above average.
> 
> However, while searching /var/log/messages for the bpp output above, I
> also found these two lines:
> 
> /usr/libexec/gdm-x-session[2366]: (==) modeset(0): Depth 24, (==) framebuffer bpp 32
> /usr/libexec/gdm-x-session[2366]: (==) modeset(0): RGB weight 888

Yes in 32bits, only 24 are actual color, the remaining 8 bits are 
discarded. In newer monitor, you can have 10 bits per color, but that 
would still be 32bits per pixel. Thus in your case the color depth is 24 
and bits_per_pixel is 32, which is the most common.
> 
> in case it makes a difference.
> 
> Thanks,
> Roger.
> 

