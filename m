Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A914865B2B1
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 14:34:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D1DA10E336;
	Mon,  2 Jan 2023 13:34:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C12010E336
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 13:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672666455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tCriltrcTbc5YIVSa0BHW32yRPYzJxluA5nPgL3tKiE=;
 b=gkS5naWWrvo8M6QvXJxznRBAlmb45wqpa0X3Muu8oC3meO5PjzOiALYQKIchL3Jz05bmdb
 8D/nI59g0MmxOEbyqydpZYX68y85ZwT+A7zawYzV8Qgn2W5d8jcBsGuRykpjtiP+l7WC6D
 gcqxVUvjCgWSgDR01qIgx7HWbk3QMxs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-1-3N2ojFBdNK-BIKXQBpfF3w-1; Mon, 02 Jan 2023 08:34:14 -0500
X-MC-Unique: 3N2ojFBdNK-BIKXQBpfF3w-1
Received: by mail-wm1-f71.google.com with SMTP id
 p34-20020a05600c1da200b003d990064285so9358837wms.8
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Jan 2023 05:34:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tCriltrcTbc5YIVSa0BHW32yRPYzJxluA5nPgL3tKiE=;
 b=y97ae+PKFfowNdgX8SIlRh8Z7YuUirN7eB/WwOi+gIQYTFc5ouNECJN6g7F7eB2Nex
 /RYxNYpV8QQmHmtjdwLbLCJ1PULEhJvEDo2hpST+59I6itowht9x7OJLFfvoW9dJ/T0N
 KbUKVRlNXH7lpOXKhjbW/hzufFQhu+JFjk/6jX9f7dB0rAYBnDF5r2BuHcCFzPF/KdQL
 BJjdprioQ5DuFXzatvhR+enFs2fXFSGcCEzXW/dWddu85hrFRzxbb0F2y3sWu31Q7VFD
 2neJbT/eS5LKFFpt/XkVRMvWNe7P2ik/EVow+LZjZRVjuxRpYYfImGMgvyfaXHzEYIjX
 NeWQ==
X-Gm-Message-State: AFqh2kqJI/hqGh7tSgBJAf+RVC3JDmI4//jteMyuwBObRDYcM/zJx2Gb
 aazq7e/WldDNIu+ODlwhBzRniTtuNX5gbvCGV1P4mrOCzd0GBxPfeC+PhXQvbpHpua205l6bV4B
 1XTnrVEaQ4filei9SUGl2Pkh/JkTL
X-Received: by 2002:a05:600c:3b93:b0:3d3:43ae:4d10 with SMTP id
 n19-20020a05600c3b9300b003d343ae4d10mr31041967wms.11.1672666453421; 
 Mon, 02 Jan 2023 05:34:13 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtJsQ0zRfWCnBj9Diguj19m7NsXFU8c60IxEYqu+ZWPJlj1r+wIED4OsIh+G7deGWpzLHHV5Q==
X-Received: by 2002:a05:600c:3b93:b0:3d3:43ae:4d10 with SMTP id
 n19-20020a05600c3b9300b003d343ae4d10mr31041948wms.11.1672666453156; 
 Mon, 02 Jan 2023 05:34:13 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n1-20020a05600c4f8100b003d96b8e9bcasm41802230wmq.32.2023.01.02.05.34.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jan 2023 05:34:12 -0800 (PST)
Message-ID: <6319a8b4-1152-40d8-29f1-015a8c5247f4@redhat.com>
Date: Mon, 2 Jan 2023 14:34:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 4/4] arm64: dts: rk3399-pinephone-pro: Add internal
 display support
To: =?UTF-8?Q?Ond=c5=99ej_Jirman?= <megi@xff.cz>,
 linux-kernel@vger.kernel.org, =?UTF-8?Q?Kamil_Trzci=c5=84ski?=
 <ayufan@ayufan.eu>, Martijn Braam <martijn@brixit.nl>,
 Sam Ravnborg <sam@ravnborg.org>, Robert Mader <robert.mader@posteo.de>,
 Tom Fitzhenry <tom@tom-fitzhenry.me.uk>,
 Peter Robinson <pbrobinson@gmail.com>,
 Onuralp Sezer <thunderbirdtr@fedoraproject.org>,
 dri-devel@lists.freedesktop.org, Maya Matuszczyk <maccraft123mc@gmail.com>,
 Neal Gompa <ngompa13@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>, Caleb Connolly
 <kc@postmarketos.org>, Heiko Stuebner <heiko@sntech.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <20221230113155.3430142-1-javierm@redhat.com>
 <20221230113155.3430142-5-javierm@redhat.com>
 <20221230153745.tfs6n4zy4xfwugbw@core>
 <e21b5c12-0cc0-5ec0-b2c6-9dde633d5e10@redhat.com>
 <20230102105746.5abnjzwf365c6hy2@core>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20230102105746.5abnjzwf365c6hy2@core>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Ondřej,

On 1/2/23 11:57, Ondřej Jirman wrote:

[...]

>>
>> You tell me, it is your patch :) I just cherry-picked this from your tree:
> 
> I have other patches to goodix driver that do power off the touch sensor chip
> during sleep, so that it doesn't consume excessinve amounts of power when
> the phone is suspended. Mainline doesn't. You have to adapt this to mainline,
> because you're not upstreaming the required Goodix patches, for regulator-off-in-suspend
> to not break things.
> 
>> https://github.com/megous/linux/commit/11f8da60d6a5
>>
>> But if that is not correct, then I can drop the regulator-off-in-suspend.
>>

Ah, I see. Missed that. Then I guess that's better to drop the regulator-off-in-suspend
until the goodix driver patches are upstreamed.

>> [...]
>>
>>>> +
>>>> +	touchscreen@14 {
>>>> +		compatible = "goodix,gt917s";
>>>
>>> This is not the correct compatible. Pinephone Pro uses Goodix GT1158:
>>>
>>> Goodix-TS 3-0014: ID 1158, version: 0100
>>> Goodix-TS 3-0014: Direct firmware load for goodix_1158_cfg.bin failed with error -2
>>>
>>>
>>
>> Same thing. I wasn't aware of this since your patch was using this compatible
>> string. If "goodix,gt1158" is the correct compatible string, then I agree we
>> should have that instead even when the firmware is missing. Because the DT is
>> supposed to describe the hardware. The FW issue can be tackled as a follow-up.
>>
>> [...] 
> 
> Yes, compatible string is sort of irrelevant, because the driver does runtime
> auto-detection based on chip ID. I didn't bother with superficial issues in the
> original code from Martijn/Kamil. Now that you're mainlining the code, this
> should be sorted out, though.
> 
> There's no FW issue, I was just using the log to show you the actual chip ID the
> driver detects.
>

Gotcha.
 
> (You should probably put my SoB after Kamil/Martijn, since I took the
> maintenance/development of the driver after they wrote the base support
> initially in secret. I'm not the original author of the code.)
>

I wasn't aware of that. I just kept the author field as it's in your tree.
 
[...]

>> https://github.com/megous/linux/commit/f19ce7bb7d72
> 
> Yes, and test the driver more thoroughly:
> 
> - look at clk_summary to verify clock rate the kernel thinks it's using
> - test refresh rate, somehow, to again verify the actual clock rate (kernel can
>   lie in debugfs)
> - test power cycling the panel (eg. via system suspend/resume or other means)
> 

Agreed that the more testing the better.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

