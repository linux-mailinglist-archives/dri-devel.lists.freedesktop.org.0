Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B425365AECC
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 10:45:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 917A410E19E;
	Mon,  2 Jan 2023 09:45:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7CF5810E19E
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 09:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672652699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hrNAqV6ZY5ivQJapJxCgpk49bJb25LBax+4yjjic7Lg=;
 b=GZ8u3DRydnnBqlKW+wb7TEqYCxMC8WuDFiJBedEgUhw8YLMd3usZCG1L9hZr3OiOn0iOnn
 Pr8Abp+9ZO/uCiiTT5d66K3NSYrPY9f7r+ZN0+lOUJ7urmcCp+0RlGRNY9QodrpEf3BdMr
 NLad5x4UeTrooTfG853ywW94luZoHbg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-324-mTX6XHBePgalBbtJi0J00Q-1; Mon, 02 Jan 2023 04:44:56 -0500
X-MC-Unique: mTX6XHBePgalBbtJi0J00Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 a6-20020a05600c224600b003d1f3ed49adso6180641wmm.4
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Jan 2023 01:44:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hrNAqV6ZY5ivQJapJxCgpk49bJb25LBax+4yjjic7Lg=;
 b=knMJE7E5WGlZlGdNKLtAEljozpNEGV+YBgOQfnbbogEMn4JXCfaqviCpehP3vxysYi
 L5aBmU2aGaSWdMQG0RGzM+xHw1LFlgoPqQKphCW+AUEm6Km0wocJ4nV/Z3eFMww7RHyK
 jRpXfiB3mJD84XqHdr6zoWnyjEUsuWJRcDIc/yRUmkYJe3zuDRYj/EqJztbyFp9gAZbA
 fFH9QH5QaUKpg101st0roUyvixEriRoLHMbHcpUpGOFSNDAgjROrFl0hlUhBDbtux8R4
 s4WeWscGwl4avzAtRyLTCPFmXvuj8fxJK8i9n2mGjREBB3FjI49wZlH4xGxOaXrXAP7O
 sTrg==
X-Gm-Message-State: AFqh2komWFJBKgiED9LJpDupEq4+7RIjO71AdyuRReaq+UpMpWqoz60s
 W5Js+ELPuIHjybRMj3qvJtnJ7Hp/CIpOru9Ht2BAXCw4rzosO0BEsXoISZ1HJw2bR3oPJ2mQbfq
 KF6YWqx1Vk/m4kXD9JroJHKH27X1K
X-Received: by 2002:a05:600c:d2:b0:3d2:2b70:f2fd with SMTP id
 u18-20020a05600c00d200b003d22b70f2fdmr29035347wmm.21.1672652695631; 
 Mon, 02 Jan 2023 01:44:55 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvGGW0J+6nq6DUxW1h2xRC/i7kscSszFCvw0h/Drz9ysxqRksonNdlBfYAtcIGbHZBQsbKS3Q==
X-Received: by 2002:a05:600c:d2:b0:3d2:2b70:f2fd with SMTP id
 u18-20020a05600c00d200b003d22b70f2fdmr29035334wmm.21.1672652695377; 
 Mon, 02 Jan 2023 01:44:55 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m8-20020a05600c4f4800b003cfaae07f68sm44938241wmq.17.2023.01.02.01.44.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jan 2023 01:44:54 -0800 (PST)
Message-ID: <c0c5b5ac-821c-1277-a2f1-d896a6ed680b@redhat.com>
Date: Mon, 2 Jan 2023 10:44:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 0/4] Add PinePhone Pro display support
To: Pavel Machek <pavel@ucw.cz>
References: <20221230113155.3430142-1-javierm@redhat.com>
 <Y7H5UJOz/zYuZn7j@duo.ucw.cz>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <Y7H5UJOz/zYuZn7j@duo.ucw.cz>
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Robert Mader <robert.mader@posteo.de>, linux-rockchip@lists.infradead.org,
 Onuralp Sezer <thunderbirdtr@fedoraproject.org>,
 Neal Gompa <ngompa13@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tom Fitzhenry <tom@tom-fitzhenry.me.uk>,
 Martijn Braam <martijn@brixit.nl>, Caleb Connolly <kc@postmarketos.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Ondrej Jirman <megi@xff.cz>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 =?UTF-8?Q?Kamil_Trzci=c5=84ski?= <ayufan@ayufan.eu>,
 Maya Matuszczyk <maccraft123mc@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org, Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Pavel,

On 1/1/23 22:21, Pavel Machek wrote:
> Hi!
> 
>> This series add support for the display present in the PinePhone Pro.
>>
>> Patch #1 adds a driver for panels using the Himax HX8394 panel controller,
>> such as the HSD060BHW4 720x1440 TFT LCD panel present in the PinePhone Pro.
>>
>> Patch #2 adds a devicetree binding schema for this driver and patch #3 adds
>> an entry for the driver in the MAINTAINERS file.
>>
>> Finally patch #4 adds the needed devicetree nodes in the PinePhone Pro DTS,
>> to enable both the display and the touchscreen. This makes the upstream DTS
>> much more usable and will allow for example to enable support for the phone
>> in the Fedora distribution.
> 
> Thanks for the series. Please cc: phone-devel@vger.kernel.org with
> future patches.
>

Sure, I will.
 
> Best regards,
> 								Pavel

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

