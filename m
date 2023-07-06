Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBD3749AA8
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 13:32:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5AB010E4E8;
	Thu,  6 Jul 2023 11:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7182010E4E8
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 11:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688643119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hx4ikHLkguuqxeZYFkKsn+v0PANTFIpKgvR5A11guvw=;
 b=YafJV6drIFhIjGzxRUCAqAZ0lCa5B1hpvIzvKUTQt5joinbOYXIMOj8cFHHJkBHx6O3YL/
 XJ7A835CNugUqezdbcVd1g88Sfn3IpC0ty+FtGNlrAQH7vQiz+bwg/6Bkj+siZiskiqkI3
 RmGsxZWN8ZtXu0fOXhCoadNGDCK4tlo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-Nzwzea2gO7KtjTIjLxGEGg-1; Thu, 06 Jul 2023 07:31:58 -0400
X-MC-Unique: Nzwzea2gO7KtjTIjLxGEGg-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3113da8b778so274446f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jul 2023 04:31:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688643117; x=1691235117;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hx4ikHLkguuqxeZYFkKsn+v0PANTFIpKgvR5A11guvw=;
 b=k9BHksxcdzOUuBKIJDv/9tdaTVsqqqBQ52Ka0QWyQ3E9eqZ4cSoVNuf+oVyc7UVWk0
 ZnoX2zfd9ZG0j5dIx5npx7TOD/IsflVDm54WqDxT6vbDikSYQd6yawsVn4eCtUTKlGtK
 30MIIFCBMr7ceptW3pBEekpTDOwwGA9cpEtjkgkkwEgTWh4rbYfJgRxmsOLD5p7h4sRU
 USy2c6eSY7Pa8z1X3qi9a8t9dbE6SXtv9r2g4qJg/gFbq7NNNvAdAr6O1tPLQ1ilZ2SX
 AkxgXnloOA/FDWyfrz8zFP4zgO926Kih9J8QNmUi9OPSDXzj/9gYBiOIRqgqPOVlSakK
 +w2Q==
X-Gm-Message-State: ABy/qLbSBbxy3AM8PjEnmsnMrLU0U5g0VvSEtaJecqlgYlaVwrz0CXeR
 NDWa+VkzPPAlNtUc3Cs+xQ0Kd8KyNIORTTJpLuoxS2epPIKMY0TnyEAmwn7XkG1katPmfdeQxWD
 Lg6EK+Ad9XJH8mFGkDnE7YOqCAgsP
X-Received: by 2002:adf:f008:0:b0:314:13e7:b8b with SMTP id
 j8-20020adff008000000b0031413e70b8bmr1288687wro.18.1688643117538; 
 Thu, 06 Jul 2023 04:31:57 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHO//xQLXuThu1svCtvOXCLdXWx9y2r/ydpGWxU5jk8IZhmiBdVJvfvL0Mn21Ukt879rk+J4Q==
X-Received: by 2002:adf:f008:0:b0:314:13e7:b8b with SMTP id
 j8-20020adff008000000b0031413e70b8bmr1288677wro.18.1688643117268; 
 Thu, 06 Jul 2023 04:31:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:57d9:6996:9558:341b?
 ([2a01:e0a:d5:a000:57d9:6996:9558:341b])
 by smtp.gmail.com with ESMTPSA id
 bl1-20020adfe241000000b003143c9beeaesm1647517wrb.44.2023.07.06.04.31.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jul 2023 04:31:56 -0700 (PDT)
Message-ID: <f4b4ab09-5f03-af3c-0e7f-44a248678be8@redhat.com>
Date: Thu, 6 Jul 2023 13:31:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/ast: Fix default resolution when no monitor is
 connected on DP
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>, airlied@redhat.com,
 kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com
References: <20230623094639.434293-1-jfalempe@redhat.com>
 <878rbv20dp.fsf@intel.com> <13e35996-914d-37a6-1697-ac0c3c75cad1@redhat.com>
 <ed075f2f-861d-74d1-efc0-5baa2cd601fd@redhat.com>
 <43d12606-9c81-99f8-f13c-14338fcd7a28@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <43d12606-9c81-99f8-f13c-14338fcd7a28@suse.de>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/07/2023 12:26, Thomas Zimmermann wrote:
> Hi
> 
> Am 06.07.23 um 11:16 schrieb Jocelyn Falempe:
>> On 04/07/2023 18:45, Jocelyn Falempe wrote:
>>> On 04/07/2023 16:54, Jani Nikula wrote:
>>>> On Fri, 23 Jun 2023, Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>>>> Since commit fae7d186403e ("drm/probe-helper: Default to 640x480 if no
>>>>>   EDID on DP")
>>>>> The default resolution is now 640x480 when no monitor is connected.
>>>>> But Aspeed graphics is mostly used in servers, where no monitor
>>>>> is attached. This also affects the "remote" resolution to 640x480, 
>>>>> which is
>>>>> inconvenient, and breaks the anaconda installer.
>>>>> So when no EDID is present, set 1024x768 as preferred resolution.
>>>>
>>>> This conflates "monitor connected" and "EDID present", which are not
>>>> necessarily the same thing.
>>>>
>>>> The fallback in drm_helper_probe_single_connector_modes() is for no
>>>> modes, but connector status is connected or unknown.
>>>
>>> When debugging the issue, I found it surprising that the status is 
>>> "connected" when nothing is plugged in the DP port.
>>>>
>>>> You could add a connector ->detect callback that returns disconnected
>>>> when there's no display, and the problem should go away. If there's no
>>>> ->detect callback, it'll default to connected.
>>>
>>> ok, I'll try that. I don't know how the hardware detect something is 
>>> connected, but looking at the dp code, maybe checking 
>>> "AST_IO_CRTC_PORT,0xDC, ASTDP_LINK_SUCCESS" would be good enough.
>>
>> I've tested this approach, and it works. But on the server I'm 
>> testing, there are VGA and DP output. I think on a server that has 
>> only one DP output, if no monitor is connected, then no modes will be 
>> reported to userspace, and the remote BMC may not work ?
> 
> You could out-comment the VGA code in the ast driver for testing.

Oh, Thanks for the idea, I will try that.

-- 

Jocelyn
> 
> Best regards
> Thomas
> 
>>
>> Also I don't have physical access to the server, so I only tested when 
>> no monitor is plugged.
>>
>> I will send shortly a v2 with this change, so others can help me test 
>> this case.
>>
>> Best regards,
>>
> 

