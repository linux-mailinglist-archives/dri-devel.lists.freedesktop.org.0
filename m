Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E14A65AD1E1
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 13:55:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FAD010E065;
	Mon,  5 Sep 2022 11:55:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3327B10E065
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 11:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662378911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dN+gArBAb1MXvGBnjXPIWD80ttEdRkSoYzrprgnDVV0=;
 b=bZDAwNklR70SMRAmORe6LIuKLI7teFrNZkNZi0NhKg/0XQNJE9EicNo8M60vwgGEydcc5V
 n0E0Bvh8GWEbT2JZSqylZNxKSuQGFqP3Oq7hY9hX6hbS/Mzfrb/L4pR79OMXYPW11NL5Gz
 d4darvYgr0uwuLFi4WqajnJAFriAmoY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-669-5FYwNlmYPUCKQd4_0zsRDA-1; Mon, 05 Sep 2022 07:55:04 -0400
X-MC-Unique: 5FYwNlmYPUCKQd4_0zsRDA-1
Received: by mail-wr1-f71.google.com with SMTP id
 c14-20020adfa30e000000b00228655c4208so575515wrb.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 04:55:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=dN+gArBAb1MXvGBnjXPIWD80ttEdRkSoYzrprgnDVV0=;
 b=mhD1mlfPSF+PHoD2jz9tE9AxoeQqKc7RkENdiX7n2UQgseWLjKZ5AwHjR6TvOY5tjA
 HVUAkbSVPQaSjxAbVQ5RE9fHZCbnZT3+vquL58GuPbeBhrES/pBBvtykJlBrOeGY3zZH
 PmxYremU48GFG3YOEeSbnzrzoauI7WBytH/QQiXM+f1PFAoAH3uHW0BgGLqXeHKGLRUD
 A2LUSQNRlSbv5thSWFmPFOU2qpK2RzaUbhGge2W7jxJMa0+b4NsDiTfyClhWuOhSQeRi
 rc/nE6DQMUHBMet/MZ8O2eHllzPqGJjajb3DFZntckMbkSMkWoN9wWAeDTyJU3A+xnyx
 qRtQ==
X-Gm-Message-State: ACgBeo07CTZCRhiD0+XWkntwPSAtrLCacxGj4AhUwmPTix7exjL+JHWo
 3CGa1uglOc4gN0ak9oI3IXawPNSn4mFA1p1U8AMuUGAmgwbixzCGymPKSjPZuql+4PL5092YoNY
 Q0RAE63QInrI94rAZQM+OixKT0Yam
X-Received: by 2002:adf:d846:0:b0:226:defc:3a01 with SMTP id
 k6-20020adfd846000000b00226defc3a01mr18853183wrl.313.1662378903320; 
 Mon, 05 Sep 2022 04:55:03 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4KV4ZibjWbGN6YgO4KVDqVIO2XVkXWu4lHnfwaE7vitwyhRqHtdISnnm2nghZt1WcwxckCTA==
X-Received: by 2002:adf:d846:0:b0:226:defc:3a01 with SMTP id
 k6-20020adfd846000000b00226defc3a01mr18853174wrl.313.1662378903090; 
 Mon, 05 Sep 2022 04:55:03 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 g11-20020a05600c310b00b003a5ea1cc63csm17694363wmo.39.2022.09.05.04.55.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 04:55:02 -0700 (PDT)
Message-ID: <49b62a63-a1d7-ca3f-abfc-df08edb46da3@redhat.com>
Date: Mon, 5 Sep 2022 13:55:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] drm/ssd130x: Replace simple display helpers with the
 atomic helpers
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20220828151114.1141510-1-javierm@redhat.com>
 <6f499b1e-daa4-7de1-6ffc-151663807910@suse.de>
 <03b207a8-e09c-2858-fd54-b95f2e8e8d11@redhat.com>
 <bd987b93-ebcc-8fad-ee5e-2e25f4d64eaf@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <bd987b93-ebcc-8fad-ee5e-2e25f4d64eaf@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/5/22 13:34, Thomas Zimmermann wrote:

[...]

>>>
>>
>> Yes, I was abusing the concept of encoder here just to have a place where
>> I could hook the enable / disable logic, since I was looking at the other
>> DRM objects helper operations structures and found that these were only
>> defined for the encoder.
> 
> I liked the idea of handling backlighting here. Power on/off also seems 
> sensible.
>

Ok. I'll keep that then.
 
>>
>> But there is technically no encoder on this device. As you can see, I was
>> using DRM_MODE_ENCODER_NONE when the encoder is initialized.
>>
>> But I notice now that the struct drm_crtc_helper_funcs also have .enable
>> and .disable callbacks, it seems I was just blind and didn't see before.
> 
> You certainly want to use atomic_enable/atomic_disable. They are 
> mutually exclusive with the other enable/disable functions.
> 

Ah, then I wasn't blind after all. It was because the encoder was the
only DRM object that had .atomic_{en,dis}able. The CRTC only had some
.{en,disable} helper callbacks.

>>
>> Would having the init and poweroff logic in the CRTC helpers be correct
>> to you or was do you have in mind ?
> 
> There's quite a bit happening in the init function. Does it have to be 
> re-initialized on each enable operation?  If it survives the power-off 
> call, the initial init can be done in the CRTC reset function. It's 
> purpose is to set hardware and software to a clean state.
>

I need to check if it survives a disable/enable cycle. Specially since
on disable the VCC regulator is disabled, which might lead to the chip
state to get lost.
 
> Best regards
> Thomas
> 
>>
>>> Best regards
>>> Thomas
> 

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

