Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 320EF828AA1
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 18:01:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABDD110E49C;
	Tue,  9 Jan 2024 17:01:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E33010E49A
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 17:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704819680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iPJD5Y/JUAijIAEh4AaeHvftl8qt3fo8LRS92q+SjAo=;
 b=GtWEN1jcKnu29b0RM5510anE6d7HldcBo3QviwoepFLUNif4yKaSa/HcyW7t7YYA8SVLwu
 sBow0fGObM05zis0li7+RODdQoRQNEILXUuRxbTZ2jGEbZdq30Y7FKdy7iB59KYs1Jbw87
 d+TFup8zDNOXswZTCEMPOOdiYEJ3Lw4=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-fsYPyDaLPIqdZOBZXnqj2Q-1; Tue, 09 Jan 2024 12:01:16 -0500
X-MC-Unique: fsYPyDaLPIqdZOBZXnqj2Q-1
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6805f615543so66069556d6.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jan 2024 09:01:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704819676; x=1705424476;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iPJD5Y/JUAijIAEh4AaeHvftl8qt3fo8LRS92q+SjAo=;
 b=MhgIA1RXfcKeIQ5slh1+/VVgE5lUznn4HKBLe19vNiEkzmszrz1Bm7WBwey3E/zd87
 ySYiCB9bb/Bs4rY5UD5m0XQQZwPAb6R3eWoZ7THnfXK/et7VNqoZeuQRaqdwgQ04Cxc/
 2moTV8W2sBN1SarF8IfSAiBzGS6pwU9ZgXeL9wWYgdD6dNkck/+gUkCj/5YN/yAKy7lB
 KUerxOSIVUdZuo/d1s0DpZsMPfHYP+6plDc4eJtbwy1eL9Qvp5TY2Q22jsZ3JFqJ8KTf
 0G+fwBLlvsWsNlGU3szKkQQlkNQb8vJcB2XgHH61/TBoLs1pbk2eWKY6KpzzI49UoWKF
 82LQ==
X-Gm-Message-State: AOJu0Ywg74i5WyoXlUywWjZPLfCJZ+lDsTEw4UzEh5JaXb/Ia4/18Nee
 yyhQ4BHDUlsvPEt2iKKxPjH6bBEHxLb1Fz1UT66B9mwWd4S8A5RWFlZwzBKmTHVeRy9JlwaXQLR
 4JAq9gHYaxKIQ5LXau5cCFch8MOgyJsBRKoWO
X-Received: by 2002:ad4:5d61:0:b0:67f:7109:786e with SMTP id
 fn1-20020ad45d61000000b0067f7109786emr8107860qvb.123.1704819676337; 
 Tue, 09 Jan 2024 09:01:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHnUqM22+GhVZwe7FhzzDIvyc0qfTBRQqUSGBfzFwlIRvdJVaCiNeoegRcDWdEXvKLK5p4oRA==
X-Received: by 2002:ad4:5d61:0:b0:67f:7109:786e with SMTP id
 fn1-20020ad45d61000000b0067f7109786emr8107837qvb.123.1704819675939; 
 Tue, 09 Jan 2024 09:01:15 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 bo4-20020a05621414a400b00680ce23bc29sm1032598qvb.71.2024.01.09.09.01.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jan 2024 09:01:15 -0800 (PST)
Message-ID: <6f343c87-fbb4-4779-aced-2e0df7b18e63@redhat.com>
Date: Tue, 9 Jan 2024 18:01:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/nouveau: include drm/drm_edid.h only where needed
To: Jani Nikula <jani.nikula@intel.com>
References: <20240104201632.1100753-1-jani.nikula@intel.com>
 <95f6815c-1ff5-4c89-b8c6-0445834a0083@redhat.com> <87ttnmx1wn.fsf@intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <87ttnmx1wn.fsf@intel.com>
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Karol Herbst <kherbst@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/9/24 10:59, Jani Nikula wrote:
> On Mon, 08 Jan 2024, Danilo Krummrich <dakr@redhat.com> wrote:
>> On 1/4/24 21:16, Jani Nikula wrote:
>>> Including drm_edid.h from nouveau_connector.h causes the rebuild of 15
>>> files when drm_edid.h is modified, while there are only a few files that
>>> actually need to include drm_edid.h.
>>>
>>> Cc: Karol Herbst <kherbst@redhat.com>
>>> Cc: Lyude Paul <lyude@redhat.com>
>>> Cc: Danilo Krummrich <dakr@redhat.com>
>>> Cc: nouveau@lists.freedesktop.org
>>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>
>> Reviewed-by: Danilo Krummrich <dakr@redhat.com>
> 
> Are you going to pick this up via the nouveau tree, or shall I apply it
> to drm-misc-next?

We don't maintain a separate tree, hence feel free to apply it to drm-misc-next.

- Danilo

> 
> BR,
> Jani.
> 
>>
>>> ---
>>>    drivers/gpu/drm/nouveau/dispnv50/head.c     | 1 +
>>>    drivers/gpu/drm/nouveau/nouveau_connector.h | 2 +-
>>>    2 files changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.c b/drivers/gpu/drm/nouveau/dispnv50/head.c
>>> index 5f490fbf1877..83355dbc15ee 100644
>>> --- a/drivers/gpu/drm/nouveau/dispnv50/head.c
>>> +++ b/drivers/gpu/drm/nouveau/dispnv50/head.c
>>> @@ -32,6 +32,7 @@
>>>    
>>>    #include <drm/drm_atomic.h>
>>>    #include <drm/drm_atomic_helper.h>
>>> +#include <drm/drm_edid.h>
>>>    #include <drm/drm_vblank.h>
>>>    #include "nouveau_connector.h"
>>>    
>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.h b/drivers/gpu/drm/nouveau/nouveau_connector.h
>>> index a2df4918340c..0608cabed058 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_connector.h
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.h
>>> @@ -35,7 +35,6 @@
>>>    
>>>    #include <drm/display/drm_dp_helper.h>
>>>    #include <drm/drm_crtc.h>
>>> -#include <drm/drm_edid.h>
>>>    #include <drm/drm_encoder.h>
>>>    #include <drm/drm_util.h>
>>>    
>>> @@ -44,6 +43,7 @@
>>>    
>>>    struct nvkm_i2c_port;
>>>    struct dcb_output;
>>> +struct edid;
>>>    
>>>    #ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
>>>    struct nouveau_backlight {
>>
> 

