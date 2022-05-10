Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B9E520FBE
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 10:30:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8983D10F0E4;
	Tue, 10 May 2022 08:30:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4062F10F5E6
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 08:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652171448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1m42YOS6adkVOttPvzzPcpB4bdLVq0RFj4rgcIuwmIE=;
 b=goZPeP17u9qT3qm+qQj//FDuxEpAl7t68g+stlH4Rv+K0oZCAAx+fifJVhtR162AWQz5Io
 cDu919LRUj8PiSGRL3tGycC6qSzp61WovzHvJHwMTjJDRW1GiL4YKxdYf7Uzm2b0IszzAt
 QxjLwOmrzlytsPJNCtVkGAg8mVlcYSE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-6TUbZe0JPKqJNXUlYxHOoA-1; Tue, 10 May 2022 04:30:47 -0400
X-MC-Unique: 6TUbZe0JPKqJNXUlYxHOoA-1
Received: by mail-wm1-f72.google.com with SMTP id
 e9-20020a05600c4e4900b00394779649b1so940194wmq.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 01:30:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1m42YOS6adkVOttPvzzPcpB4bdLVq0RFj4rgcIuwmIE=;
 b=x2GXYMG9OxHH9P9Of0Eu8Usde7OrQAYay2AvlRzgQ6ghOCsaqTESKnMfn+EtOpcOO7
 LrYTifTjrvVEUHCu3/4KPkFD7jLuqQ2D9ksVPNZ7IQcxnQlVq54a5QsfdGAm70y/DsOr
 DYCyIfwv35JcuGM9cSSBh3MJnAWYrVmH9wNj0taS+7+Q2Qa94ZWHZKLYxHsWn1dRBsem
 G8GjfSQusBZqAa8Ak3ggAyEmsfy7WzLLtPM8H3GkseaPUNNY0S8ZAm7/tJd2AkHwxLze
 b6F8l7kndIfcNfei9Wv4KNakbRS3qCjVyuFPXQk5Y6hRg9L+9j+nLeoEBmn9zga/9yfM
 wCcw==
X-Gm-Message-State: AOAM531SIP5H1dABSMhFAJKiiuRW2ghuvECx/bmjMj6j5U3ib1sgQ7hQ
 7f0YnR7/GiPtC2XVt1Xewn9uvRJQuEpzQYPOpMT2eIeBiA6fesAaPwRIyfxUPhak3d7ND/0S8JJ
 Gm0p7b1Qa3chJHcZv6xPxZ+sHwPXe
X-Received: by 2002:a5d:4703:0:b0:20a:ce3c:7528 with SMTP id
 y3-20020a5d4703000000b0020ace3c7528mr17564134wrq.688.1652171445792; 
 Tue, 10 May 2022 01:30:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoBMj8kXDsvsfO4i+XkAgVG6qM0AfXiyKEYB6N5jwKUXVSznUhS5NktRYArBUXsTfI3Cbm7g==
X-Received: by 2002:a5d:4703:0:b0:20a:ce3c:7528 with SMTP id
 y3-20020a5d4703000000b0020ace3c7528mr17564116wrq.688.1652171445454; 
 Tue, 10 May 2022 01:30:45 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l29-20020a05600c1d1d00b003942a244f53sm1816260wms.44.2022.05.10.01.30.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 May 2022 01:30:45 -0700 (PDT)
Message-ID: <2d8d8583-3a39-b826-dd83-ba5bc4c5b082@redhat.com>
Date: Tue, 10 May 2022 10:30:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 1/4] fbdev: Prevent possible use-after-free in
 fb_release()
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-kernel@vger.kernel.org
References: <20220505215947.364694-1-javierm@redhat.com>
 <20220505220413.365977-1-javierm@redhat.com>
 <753d0350-42dc-389b-b10b-4533ddcf32ac@intel.com>
 <1f788b8f-0bea-1818-349e-b1bc907bf251@redhat.com>
 <a339df59-9e00-c7cb-e33d-2ac626443639@intel.com>
 <3b7fe4fe-fdec-cef2-4e0e-309d9dc4a8af@redhat.com>
 <b5ab1c49-04e7-36c3-677d-2989b79e50ca@suse.de>
 <2bf27b09-0896-1849-254f-d5b19abdc892@redhat.com>
 <fc3e8a40-664f-07ae-7474-c0412a1ab1b5@intel.com>
 <1c36d431-d5c0-7278-c9e0-61867e9dc174@redhat.com>
 <79aaea41-5dab-f896-ab3d-d6bc9a5de615@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <79aaea41-5dab-f896-ab3d-d6bc9a5de615@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-fbdev@vger.kernel.org,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 5/10/22 10:04, Thomas Zimmermann wrote:
> Hi
> 
> Am 10.05.22 um 00:42 schrieb Javier Martinez Canillas:
>> On 5/10/22 00:22, Andrzej Hajda wrote:
>>
>> [snip]
>>
>>>>    static void drm_fbdev_fb_destroy(struct fb_info *info)
>>>>    {
>>>> +       if (info->cmap.len)
>>>> +               fb_dealloc_cmap(&info->cmap);
>>>> +
>>>>           drm_fbdev_release(info->par);
>>>> +       framebuffer_release(info);
>>>
>>> I would put drm_fbdev_release at the beginning - it cancels workers
>>> which could expect cmap to be still valid.
>>>
>>
>> Indeed, you are correct again. [0] is the final version of the patch I've
>> but don't have an i915 test machine to give it a try. I'll test tomorrow
>> on my test systems to verify that it doesn't cause any regressions since
>> with other DRM drivers.
> 
> You have to go through all DRM drivers that call drm_fb_helper_fini() 
> and make sure that they free fb_info. For example armada appears to be 
> leaking now. [1]
>

But shouldn't fb_info be freed when unregister_framebuffer() is called
through drm_dev_unregister() ? AFAICT the call chain is the following:

drm_put_dev()
  drm_dev_unregister()
    drm_client_dev_unregister()
      drm_fbdev_client_unregister()
        drm_fb_helper_unregister_fbi()
          unregister_framebuffer()
            do_unregister_framebuffer()
              put_fb_info()
                drm_fbdev_fb_destroy()
                  framebuffer_release()

which is the reason why I believe that drm_fb_helper_fini() should be
an internal static function and only called from drm_fbdev_fb_destroy().

Drivers shouldn't really explicitly call this helper in my opinion.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

