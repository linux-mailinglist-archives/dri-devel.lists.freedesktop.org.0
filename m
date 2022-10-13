Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1125FDA55
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 15:19:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3489A10E239;
	Thu, 13 Oct 2022 13:19:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8225D10E8AC
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 13:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665667137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bnGHmdZi092aIlDjHqyRWgiSoKoQkS2avXHSik3fEks=;
 b=F377+mWXXekVsy3VoA0ZcopeFGqn0Hb1+oiTW5mtTw2A1qM3xYFhCCGq2ki4iosamOT03e
 lMakEr8tfAbks4rXxiO5cZg6NOlN7LOzHXDkAx2Ils62zPew2uppd5XfGE8BHdyzxPPecN
 tCntifYSAtWnlPmDNrgS5zwqQLFCygw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-588-SuJwfri4P4yTMZQPbqT2bw-1; Thu, 13 Oct 2022 09:18:56 -0400
X-MC-Unique: SuJwfri4P4yTMZQPbqT2bw-1
Received: by mail-wm1-f69.google.com with SMTP id
 c130-20020a1c3588000000b003b56be513e1so1186614wma.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 06:18:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bnGHmdZi092aIlDjHqyRWgiSoKoQkS2avXHSik3fEks=;
 b=r47B8RKy0N4TTXj0N52dcQT7hxMkEY+zxAbYC9jEBsekG/yztmMe6d5V9MleJOZpcx
 TGEIW9aeGafdv7NIhuPbOqapI+vYE5lUiLh0BE8/3BFyl+9xX6CuQa/eVHaju5xs7L+G
 JV/a/mMQy7hc9Cc/8Pej+RjSFzGNMkpe2LPnxJ7fQj4zsXDkxFnKFxLgy44YQt9RoTmG
 uOmloJoYhY4msLjvUe2olPiF5Nd+7NnupjRvF9UJV7dcZhHq51LiuVzKUCpbhQ06u0Ay
 7IAHuiu/2BIUmMq3RNnkgJoUMMFscHphYLYnqCI0lT+xmA9AIYgiXSN8g4PE96a+mA5V
 yKDg==
X-Gm-Message-State: ACrzQf2izPMxpyPZPtTg1CzrQLu0nzgGag66L3QRSKblE1BxAyoVbwqX
 3ubDhC79jXAMcpRI0KvYnnjvmcMCmQwdbn9uu90KToSGyYrvQRwN6/7G8Y11Qo8Kt5L+UobNLaI
 4R6Y09r2fOa8j5dcB1o2dh4aK00ZkyKMXSs7WI45HRkcVDf5TAvLMoivYlJLWJChV8z4fQZ3mjO
 Jehkr5
X-Received: by 2002:a5d:584a:0:b0:231:636c:de28 with SMTP id
 i10-20020a5d584a000000b00231636cde28mr8604267wrf.175.1665667135101; 
 Thu, 13 Oct 2022 06:18:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4ETZilnbfjxkiMRxvM4/xdwF2l7685fcRguGraexWCdHFAwKL62p52WN9XT5j+cOe+MpW4aw==
X-Received: by 2002:a5d:584a:0:b0:231:636c:de28 with SMTP id
 i10-20020a5d584a000000b00231636cde28mr8604246wrf.175.1665667134600; 
 Thu, 13 Oct 2022 06:18:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:c13d:8f66:ffd1:f7f4?
 ([2a01:e0a:c:37e0:c13d:8f66:ffd1:f7f4])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a7bcd06000000b003b4a699ce8esm4485504wmj.6.2022.10.13.06.18.53
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Oct 2022 06:18:54 -0700 (PDT)
Message-ID: <b3792f67-e902-4f34-49d1-d35261689008@redhat.com>
Date: Thu, 13 Oct 2022 15:18:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] drm/mgag200: Fix PLL setup for G200_SE_A rev >=4
To: dri-devel@lists.freedesktop.org
References: <20221013082901.471417-1-jfalempe@redhat.com>
 <db634341-da68-e8a6-1143-445f17262c63@suse.de> <Y0fqLofkA7O4IEbQ@intel.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <Y0fqLofkA7O4IEbQ@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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

On 13/10/2022 12:36, Ville Syrjälä wrote:
> On Thu, Oct 13, 2022 at 11:05:19AM +0200, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 13.10.22 um 10:29 schrieb Jocelyn Falempe:
>>> For G200_SE_A, PLL M setting is wrong, which leads to blank screen,
>>> or "signal out of range" on VGA display.
>>> previous code had "m |= 0x80" which was changed to
>>> m |= ((pixpllcn & BIT(8)) >> 1);
>>>
>>> Tested on G200_SE_A rev 42
>>>
>>> This line of code was moved to another file with
>>> commit 85397f6bc4ff ("drm/mgag200: Initialize each model in separate
>>> function") but can be easily backported before this commit.
>>>
>>> Fixes: 2dd040946ecf ("drm/mgag200: Store values (not bits) in struct mgag200_pll_values")
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>>> ---
>>>    drivers/gpu/drm/mgag200/mgag200_g200se.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
>>> index be389ed91cbd..4ec035029b8b 100644
>>> --- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
>>> +++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
>>> @@ -284,7 +284,7 @@ static void mgag200_g200se_04_pixpllc_atomic_update(struct drm_crtc *crtc,
>>>    	pixpllcp = pixpllc->p - 1;
>>>    	pixpllcs = pixpllc->s;
>>>    
>>> -	xpixpllcm = pixpllcm | ((pixpllcn & BIT(8)) >> 1);
>>> +	xpixpllcm = pixpllcm | BIT(7);
>>
>> Thanks for figuring this out. G200SE apparently is special compared to
>> the other models. The old MGA docs only list this bit as <reserved>.
>> Really makes me wonder why this is different.
> 
> Could measure eg. the vblank interval with and without that bit set
> and see what effect it has. Assuming the PLL locks without the bit
> of course.
> 

Thanks for the pointer, but I don't have physical access to the system, 
so I'm not able to check that.
I think reverting to the previous setting that used to work is the safer 
approach here.

-- 

Jocelyn

