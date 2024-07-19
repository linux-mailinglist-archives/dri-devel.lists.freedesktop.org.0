Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 988379379F6
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2024 17:38:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F0010EBF2;
	Fri, 19 Jul 2024 15:38:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gR8KIGPW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 508BF10EBF2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 15:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721403481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FzGfh8TeCFAeh0q4T05gFMoDLPoAY3D4TOvFezVqd6U=;
 b=gR8KIGPWdI4kOZlR+wNJNA7HDfMaRsboO9qxUe1SlBb7ydnrCBQlcMUZmbKLyMX+SnXJK4
 CGhvkiVSB2TV7SRr4J1h7yqZfmQY07V9yL+savjW8XljNINhZq1Q73qzsuP5lUbYlPG9aN
 Sl5OhDfwDQippt1bdAjFtgSmOiRhTwE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-687-jRl9b6ZEO9uhSM0O67nxzA-1; Fri, 19 Jul 2024 11:37:59 -0400
X-MC-Unique: jRl9b6ZEO9uhSM0O67nxzA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-426703ac88dso12539055e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 08:37:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721403478; x=1722008278;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FzGfh8TeCFAeh0q4T05gFMoDLPoAY3D4TOvFezVqd6U=;
 b=PTQ1eHv9leCWkUeuuRA1DImNSSM7+1cBRd8ryTAFWpOLiecG8CIzIChbNn+53Q3HUc
 HTqtVc7tZEFdBQbOSxIP46ASv3UnePukfO+eSV/97f892oo2tmhCxnBx8L20erDgnHh0
 eoKKSOhVtcEuC4hJU2y1H1kKp7TBLy1e7RXAHOgnNyPTUZXtKhhnd4b9d2+V3k0MUAp/
 +5JEUKyuYVshUmM/2NfBAlEG+c6Jk0Zn77ULJ3cKJ4+97e5OJrviDlG6QWmXSd7cYpUe
 9YbC9tROzPF9ilOhpKVc/zMUw7EJviJ8qq2r8NuYsPE2QyyurLWpHMVkeYQ/6ZwH69K+
 5SeQ==
X-Gm-Message-State: AOJu0YyOZ0J2ZDACrwL7iEWunk/M5b7wG0hdjTRpLrwQRJnzEBQWgiqH
 BEXGx19NHYtk3B69XEHq9Tc0aujGqFsIO2OwFk2sSvZFZIeyMiciumKzlhTn7F/q7OLXgERPEID
 FziDnqwMb8iOdcfj97pSw2OXFpr7HFlLwOoaAJ746aHNIzQ5/axDJNnUBIMImTR/sGHL/xn0WQc
 69S80CF3siSBUABhsuRCPRaF5AyA+fG1LLGe5BMFSc+scJKn4tEA==
X-Received: by 2002:a05:600c:4f86:b0:426:62c6:4341 with SMTP id
 5b1f17b1804b1-427c2ce5ae0mr53922495e9.20.1721403477879; 
 Fri, 19 Jul 2024 08:37:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmaQP+6ZxlhB1MhvkBOuS5djIsAkdWeYCC5F3SMSwqcs5GWYdVI0FABp/1q9RnSypPxFxpCw==
X-Received: by 2002:a05:600c:4f86:b0:426:62c6:4341 with SMTP id
 5b1f17b1804b1-427c2ce5ae0mr53922375e9.20.1721403477414; 
 Fri, 19 Jul 2024 08:37:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d2a3b800sm57945035e9.5.2024.07.19.08.37.56
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jul 2024 08:37:56 -0700 (PDT)
Message-ID: <f9f2f13a-b66e-461f-88c9-92a42e36bcd5@redhat.com>
Date: Fri, 19 Jul 2024 17:37:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/panic: Add missing static inline to
 drm_panic_is_enabled()
To: dri-devel@lists.freedesktop.org
References: <20240719122051.1507927-1-jfalempe@redhat.com>
 <0bc6a8d1-d206-4d64-b170-bd70c7129f80@intel.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <0bc6a8d1-d206-4d64-b170-bd70c7129f80@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 19/07/2024 17:28, Michal Wajdeczko wrote:
> 
> 
> On 19.07.2024 14:20, Jocelyn Falempe wrote:
>> This breaks build if DRM_PANIC is not enabled.
>> Also add the missing include drm_crtc_internal.h in drm_panic.c
>>
>> Fixes: 9f774c42a908 ("drm/panic: Add drm_panic_is_enabled()")
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   drivers/gpu/drm/drm_crtc_internal.h | 2 +-
>>   drivers/gpu/drm/drm_panic.c         | 2 ++
>>   2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
>> index c10de39cbe83..bbac5350774e 100644
>> --- a/drivers/gpu/drm/drm_crtc_internal.h
>> +++ b/drivers/gpu/drm/drm_crtc_internal.h
>> @@ -321,7 +321,7 @@ drm_edid_load_firmware(struct drm_connector *connector)
>>   #ifdef CONFIG_DRM_PANIC
>>   bool drm_panic_is_enabled(struct drm_device *dev);
>>   #else
>> -bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
>> +static inline bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
>>   #endif
> 
> shouldn't this whole chunk be part of <drm/drm_panic.h> ?
> other exported drm_panic functions have forward declarations there
> 
drm/drm_panic.h is for GPU drivers implementing drm_panic.
And they don't need this function.

This function is only for drm internal (it's called from drm_fb_helper.c).

Sima suggested this change in my previous series:
https://lists.freedesktop.org/archives/dri-devel/2024-July/462375.html

I will move drm_panic_[un]register() prototypes there for the same 
reason in follow-up patch.

-- 

Jocelyn

>>   
>>   #endif /* __DRM_CRTC_INTERNAL_H__ */
>> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
>> index 9f1a3568e62d..072752b658f0 100644
>> --- a/drivers/gpu/drm/drm_panic.c
>> +++ b/drivers/gpu/drm/drm_panic.c
>> @@ -27,6 +27,8 @@
>>   #include <drm/drm_plane.h>
>>   #include <drm/drm_print.h>
>>   
>> +#include "drm_crtc_internal.h"
> 
> then you will not need this include here
> 
>> +
>>   MODULE_AUTHOR("Jocelyn Falempe");
>>   MODULE_DESCRIPTION("DRM panic handler");
>>   MODULE_LICENSE("GPL");
> 

