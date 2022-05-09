Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2B552027D
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 18:33:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 463EA10EA25;
	Mon,  9 May 2022 16:33:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82DD510EA25
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 16:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652114029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zaU6wCec1EMQuT5ULCUqY7NTQ3dkhl3bP6/9uWSpRY0=;
 b=EcszdFOgCtPifIj0uJvksiNc90Opl108einLapHC+vLiDO4Kzq23FCe95BCmOhSU9F/+le
 fwv/dlQ53IUWb4lC7+OQ6In+tWJCMnR+dWGpUxooWjVxd0ynPNokiVLDh6hhjb++mITNG7
 lN2gXPjSh9NsW0zE6m7pjtdTd2xB2/s=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-BXFwjOB0M56hZoqtAZbf9g-1; Mon, 09 May 2022 12:33:48 -0400
X-MC-Unique: BXFwjOB0M56hZoqtAZbf9g-1
Received: by mail-wm1-f70.google.com with SMTP id
 v124-20020a1cac82000000b003948b870a8dso2255828wme.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 May 2022 09:33:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zaU6wCec1EMQuT5ULCUqY7NTQ3dkhl3bP6/9uWSpRY0=;
 b=yllwEMp9j2RYPDNXNJHW5VFVObRxIn+XP97bSTRPeGcgW1DjN1m7TbbHjc6THwzdKk
 qrrX5lHaq8fVAhz2+Rrg03r/yjAcAimAH6zny1KXBiWn+Li86Tln+50vpX/hR2kob5MU
 j13BIb85rIOxUhpj8FOOjONtz68eXhpmZdOEa9ObpcLCyoKjHj18JW8K6D3k+I16VBwq
 GprBVbbCnE4Eb0ZmJIrf41EwyDeEOA2D0S2SI9mzAu9+U1oHcSD/tpAKZj23UwjwP3Wx
 3cAGo6nFg4j8sk/7McMNBU1BcrswIhI5B8xpW4NavbTqs0lHkTiTTqKenNcxSiG7ejDL
 nvcw==
X-Gm-Message-State: AOAM533yZSf3IAEZHV60yBXw7muz41HKQ9M9ESrxmtlRioO0zRHIemfM
 a7N4aqeN1fbUbMIfkKh5WitJ5vD7STr/DwLJjqa0QC24skV8ek1yWCtA2EjZLCmLBGMhR0MvM6H
 AWl4FJEZCukGVjJXKZ2TK/bFLAJuX
X-Received: by 2002:a7b:c3c2:0:b0:394:9229:3b40 with SMTP id
 t2-20020a7bc3c2000000b0039492293b40mr5126309wmj.195.1652114027776; 
 Mon, 09 May 2022 09:33:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7bKnj6TnYeYMJ8WQEUK1qVaIvYRO7Ss8XM5JhYhOquufFe51hhnCGnSjqUxw1TY5t+U+8cQ==
X-Received: by 2002:a7b:c3c2:0:b0:394:9229:3b40 with SMTP id
 t2-20020a7bc3c2000000b0039492293b40mr5126294wmj.195.1652114027554; 
 Mon, 09 May 2022 09:33:47 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 h3-20020a5d6883000000b0020c5253d91asm11484506wru.102.2022.05.09.09.33.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 09:33:47 -0700 (PDT)
Message-ID: <3b7fe4fe-fdec-cef2-4e0e-309d9dc4a8af@redhat.com>
Date: Mon, 9 May 2022 18:33:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 1/4] fbdev: Prevent possible use-after-free in
 fb_release()
To: Andrzej Hajda <andrzej.hajda@intel.com>, linux-kernel@vger.kernel.org
References: <20220505215947.364694-1-javierm@redhat.com>
 <20220505220413.365977-1-javierm@redhat.com>
 <753d0350-42dc-389b-b10b-4533ddcf32ac@intel.com>
 <1f788b8f-0bea-1818-349e-b1bc907bf251@redhat.com>
 <a339df59-9e00-c7cb-e33d-2ac626443639@intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <a339df59-9e00-c7cb-e33d-2ac626443639@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/9/22 17:51, Andrzej Hajda wrote:

[snip]

>>>> +
>>> Regarding drm:
>>> What about drm_fb_helper_fini? It calls also framebuffer_release and is
>>> called often from _remove paths (checked intel/radeon/nouveau). I guess
>>> it should be fixed as well. Do you plan to fix it?
>>>
>> I think you are correct. Maybe we need something like the following?
>>
>> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
>> index d265a73313c9..b09598f7af28 100644
>> --- a/drivers/gpu/drm/drm_fb_helper.c
>> +++ b/drivers/gpu/drm/drm_fb_helper.c
>> @@ -631,7 +631,6 @@ void drm_fb_helper_fini(struct drm_fb_helper *fb_helper)
>>          if (info) {
>>                  if (info->cmap.len)
>>                          fb_dealloc_cmap(&info->cmap);
>> -               framebuffer_release(info);
> 
> What about cmap? I am not an fb expert, but IMO cmap can be accessed 
> from userspace as well.
> 

I actually thought about the same but then remembered what Daniel said in [0]
(AFAIU at least) that these should be done in .remove() so the current code
looks like matches that and only framebuffer_release() should be moved.

For vesafb a previous patch proposed to also move a release_region() call to
.fb_destroy() and Daniel also said that it was iffy and shouldn't be done [1].

But I'm also not fb expert so happy to move fb_dealloc_cmap() as well if that
is the correct thing to do.

[0]: https://www.spinics.net/lists/dri-devel/msg346257.html
[1]: https://www.spinics.net/lists/dri-devel/msg346261.html

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

