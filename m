Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8165AD1BD
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 13:45:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D332A10E317;
	Mon,  5 Sep 2022 11:45:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D487010E317
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 11:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662378305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sXaA3E4TeoLSiXCrVTczKxpCpoc9IkMCBxtbTOE4obg=;
 b=XZQupgu+oOK3xkhxF2nXCSb8hJooCun9qCxNg0jHeI5TwFh6qz081zwAzGmz4R4IOYE/nj
 8zBrnEQVXLHahO1BU4zRsgIwGezT2R/Tx+9C/izET9dZ1v1XXV4sit8tCW8bPLl9ZHgbRv
 ydObuUomXDgon9X+/BdBa7SXj72YJps=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-328-VTwBMj8JPO6-YD4VEi3KUQ-1; Mon, 05 Sep 2022 07:45:04 -0400
X-MC-Unique: VTwBMj8JPO6-YD4VEi3KUQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 r83-20020a1c4456000000b003a7b679981cso7348539wma.6
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 04:45:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=sXaA3E4TeoLSiXCrVTczKxpCpoc9IkMCBxtbTOE4obg=;
 b=k1IzC1c90n9EqYUar38rlUJfuDcDz3ckQVnpBaWOg+sbt/AYBpJXrnjA0ak1/+Mpln
 skSEjApOZgYzyOMoadOXqiX6uk1/votFQi4vz5YH++SBd3wIWda6YUnNERFnF9EsNC7Q
 xXhG1axW2BxmIAoUvbrU1Byy3frAGyEikbs40tlcp4HVIqX74XTAoRyLIG6nTVdwl05r
 pB2YV9KDY3uv8YZTVNuRuNZRiVTJrDe//VCONwi6qz2c1kgtB9MfcEhNaCjWvBCBIpCu
 luCnpD+Se4Xf49HxhwnK+K4MtH9RrYVtu4oZmF6gRLMjIyPirRFYgZdP7uoljJoTtI4V
 5L1Q==
X-Gm-Message-State: ACgBeo1O7McYD+xiCoIgu/oTkLXoWTsa6zRxYv5TL9/AzBOLlTBVOB4p
 T0fIPdzQqPhNhy8Qw9JqJ4ZsT4cjOf5Z5Q1asbjGKU1ctUtPROpl7Df3F2FxASl6q8CbjQB8tMr
 4XSV+73GiFXhxTIeUAdmqvFt4kb+d
X-Received: by 2002:a05:600c:2317:b0:3a5:a3b7:31f with SMTP id
 23-20020a05600c231700b003a5a3b7031fmr10532304wmo.6.1662378303639; 
 Mon, 05 Sep 2022 04:45:03 -0700 (PDT)
X-Google-Smtp-Source: AA6agR507ThDRQf0F4Vj6vouQTbPwKSRrGz2VTnuaPbtNhYgLbivGZ0rljiQm/TFfybJ3sTvLwDXqw==
X-Received: by 2002:a05:600c:2317:b0:3a5:a3b7:31f with SMTP id
 23-20020a05600c231700b003a5a3b7031fmr10532289wmo.6.1662378303425; 
 Mon, 05 Sep 2022 04:45:03 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 i14-20020a05600c354e00b003a5dde32e4bsm17603531wmq.37.2022.09.05.04.45.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 04:45:03 -0700 (PDT)
Message-ID: <7376fe7b-3644-6081-2d7c-9d4f490da9c8@redhat.com>
Date: Mon, 5 Sep 2022 13:45:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] drm/simpledrm: Drop superfluous primary plane
 .atomic_check return logic
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20220831111243.1530620-1-javierm@redhat.com>
 <43e3dead-6089-c342-5050-34d7325bcb24@suse.de>
 <3cb956d7-aac0-6a1a-6be1-098057e2fd03@redhat.com>
 <7e77aa04-8a0d-8d48-d156-2ed551d10e7c@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <7e77aa04-8a0d-8d48-d156-2ed551d10e7c@suse.de>
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

On 9/5/22 13:37, Thomas Zimmermann wrote:
> Hi
> 

[...]

>>>> -	return 0;
>>>> +	return drm_atomic_helper_check_plane_state(new_plane_state, new_crtc_state,
>>>> +						   DRM_PLANE_NO_SCALING,
>>>> +						   DRM_PLANE_NO_SCALING,
>>>> +						   false, false);
>>>
>>> I'm undecided on this change. I know it's correct and more to the point.
>>> But the call's logic is non-intuitive: the call either returns an error
>>> or we have to test ->visible afterwards. So I wrote it explicitly.
>>>
>>
>> Yes, but the check has no effect so I found it even less intuitive. Maybe
>> add a comment then if you wan to keep the current code?
>>   
>>> I saw that your change to ssd130x also uses the pattern. If we find more
>>> such drivers, we could implement the atomic check as a helper. I suggest
>>> drm_plane_helper_atomic_check_fixed() in drm_plane_helper.c
>>>
>>
>> Sure. I can add a preparatory change in v2 that adds that helper and then
>> use it in the follow-up patch.
>>
> 
> Maybe wait for your ssd130x changes to land and then you can convert 
> both drivers to the new helper.
> 

Makes sense. I'll do that.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

