Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC47173B336
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 11:05:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F262010E0E0;
	Fri, 23 Jun 2023 09:05:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4678410E0E0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 09:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687511112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pguH3U8Bb3zv/4/0aDT3aEspkKoXYOCNJWdP7zh3GRw=;
 b=V8hBxl9ownnRUmT/f0vn0K662oJ9IXTa4JaIlStFwQCrlkzhc4CyXOlESvopcTRie3Drqq
 tmS1YrKnXlA3gChrByQQb9pj8/B/OLhctSAO5R6T+plksArvL4NDNuZj11uO8qmJMWOQu+
 Yd67WqSlzHuoYkt4/rG9TIqKE+F6tq0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-354-P1P_V6AgNXSGKMYNAiD-PA-1; Fri, 23 Jun 2023 05:05:10 -0400
X-MC-Unique: P1P_V6AgNXSGKMYNAiD-PA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f9b5bbd79aso2467585e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 02:05:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687511110; x=1690103110;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pguH3U8Bb3zv/4/0aDT3aEspkKoXYOCNJWdP7zh3GRw=;
 b=Ix8S/zkvO/s5q0Y9D/JIPjk8q8sFpqUqp2/+sHIPcYhnkNCiA/gLS7EkVdJRwr6zt4
 TmMMCODuKkyE6S6b9zkL+qEkVZIEvKrcbH995oMyaNW5Jfvmk9UBrmEtiGEgI/EiRl29
 lsxNhRpIKmSxPLlZxczSMwKO4adOomUHSYr2AXmIRqY3XWqY0CXGyMO1cYYxp4UKdWTc
 ZKEBcy4x944ODKP2jyH3m2tqNIitwa3mHYYQWa8nrzD7fPJlMkObeRed5KFf9fuZ9Ti1
 qPvHQCgW6WjvWfgSfLvBcjFPK6xJl10HNX3cr/jv3HfGt/eT25Zc7ZsVuxvXV9eiQa0M
 LVxw==
X-Gm-Message-State: AC+VfDyHUX4k8WB8FHnXEt/7eRIqrdvU+qGhA0Kjr8slbjZoUaMBEXDF
 3zPKGYOje/km0CPsHQXlz3H5C6O3sBEi7QKYg2w3oXM2an0iPdp2F3TfGD69hkbZa4AQ4oQGqMa
 s6pIy8ub3kYwIZ54R5cG5d0ltONjx
X-Received: by 2002:a05:600c:3653:b0:3f9:bb1d:ac1f with SMTP id
 y19-20020a05600c365300b003f9bb1dac1fmr6586480wmq.7.1687511109817; 
 Fri, 23 Jun 2023 02:05:09 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4E54SGRmgaxisSuvMutI6oIRT8Zg2mEv3LSP5ryH95Ya6fsQ8vROo7ATWgSIjmGocyJpWfcg==
X-Received: by 2002:a05:600c:3653:b0:3f9:bb1d:ac1f with SMTP id
 y19-20020a05600c365300b003f9bb1dac1fmr6586464wmq.7.1687511109552; 
 Fri, 23 Jun 2023 02:05:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a05600c00c800b003f70a7b4537sm1721769wmm.36.2023.06.23.02.05.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jun 2023 02:05:09 -0700 (PDT)
Message-ID: <963f8bfa-ab05-466e-88b1-e5a17804f10f@redhat.com>
Date: Fri, 23 Jun 2023 11:05:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] drm/mgag200: set variable mgag200_modeset
 storage-class-specifier to static
To: Thomas Zimmermann <tzimmermann@suse.de>, Tom Rix <trix@redhat.com>,
 airlied@redhat.com, airlied@gmail.com, daniel@ffwll.ch
References: <20230517134140.874179-1-trix@redhat.com>
 <f3d8cbe7-11a6-14a3-e161-906c73c5ade3@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <f3d8cbe7-11a6-14a3-e161-906c73c5ade3@suse.de>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/06/2023 10:28, Thomas Zimmermann wrote:
> 
> 
> Am 17.05.23 um 15:41 schrieb Tom Rix:
>> smatch reports
>> drivers/gpu/drm/mgag200/mgag200_drv.c:23:5: warning: symbol
>>    'mgag200_modeset' was not declared. Should it be static?
>>
>> This variable is only used in its defining file, so it should be static
>>
>> Signed-off-by: Tom Rix <trix@redhat.com>
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
>> ---
>>   drivers/gpu/drm/mgag200/mgag200_drv.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c 
>> b/drivers/gpu/drm/mgag200/mgag200_drv.c
>> index 976f0ab2006b..abddf37f0ea1 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_drv.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
>> @@ -20,7 +20,7 @@
>>   #include "mgag200_drv.h"
>> -int mgag200_modeset = -1;
>> +static int mgag200_modeset = -1;
>>   MODULE_PARM_DESC(modeset, "Disable/Enable modesetting");
>>   module_param_named(modeset, mgag200_modeset, int, 0400);
> 

applied to drm-misc-next

Thanks for your contribution.

-- 

Jocelyn

