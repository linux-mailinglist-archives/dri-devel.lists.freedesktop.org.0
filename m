Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B775519E24
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 13:35:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDC2A10E675;
	Wed,  4 May 2022 11:35:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6B3810E675
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 11:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651664141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=34VZxVT7BZbb571VsASnxn7VWsmyBHWuoREbYnuFRqA=;
 b=bAF+GusD+zUbuKQHwGyPQ18r5QpYfiwMs9cjrazuUueGWamLU01FLpC6b5pI1YfPES1/Bc
 m7F/V9uHp2I2AhykAqyH0EMisQQ++g21Qgeko0US7aBlbanHFOH9uRg00QaoxnO1fWpcS0
 v89ed/lszdCuXXmN78mgpRTHYqUzdY8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-552-jJM5MLP5PEmPvjTeH86hVw-1; Wed, 04 May 2022 07:35:40 -0400
X-MC-Unique: jJM5MLP5PEmPvjTeH86hVw-1
Received: by mail-wr1-f70.google.com with SMTP id
 g7-20020adfbc87000000b0020ac76d254bso279824wrh.6
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 04:35:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=34VZxVT7BZbb571VsASnxn7VWsmyBHWuoREbYnuFRqA=;
 b=bSKKr8QPdUIBYWPg18iHUsO/5PSlzPh36lw/Nz7ZlWWGfjefmY6rTrWHarB/LCi5oj
 zFMA1C1F1WCaJ18cS5jDtKLWR0TAtYu9LPDS1sHcfEJjFK8TA9wOiSwh7567nFT/mWmD
 bCrBti9EKJ91SNmSWZpdbs4MGXUaq44vMCItbsvtSDnc/mxX3u+17+KvnUUignerX8VB
 zvJxrt/IAZdMq0WK9XFrutwGZdjpo/g2DwjMrf1NCL6ab9MhJXJZjohkTIJeNULMPWv+
 BvJJYHshj0mYQO4rqyn+bJJXGbRGK3L8dy5C/UdaqbEaJDap8n66aTYaH81evnCjWFIX
 fqVw==
X-Gm-Message-State: AOAM531f5aCflVyyo1eJ2cWWeH2MzNbpU6a1eKxW1q+J2i07GK6OTpzH
 v/lctYJNLnvrwz3woIbu5TL1S2pt0FJ35SpBUoKAH3qxPEuoUyLK1xqDqbqo0jnH907e3Ee832l
 zjS+icwgdrt7jInv2xw/ocIOXwdN+
X-Received: by 2002:a7b:ce0a:0:b0:394:41e:2517 with SMTP id
 m10-20020a7bce0a000000b00394041e2517mr7303642wmc.135.1651664139534; 
 Wed, 04 May 2022 04:35:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkqdX7HCGB2EekG/+HnmQTPbLcK1+rCPyta5s7F5sneyoQz8GhIv8xGVqmVaPz6xc7p4OmlA==
X-Received: by 2002:a7b:ce0a:0:b0:394:41e:2517 with SMTP id
 m10-20020a7bce0a000000b00394041e2517mr7303627wmc.135.1651664139274; 
 Wed, 04 May 2022 04:35:39 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 e11-20020a05600c4e4b00b003942a244f36sm3780628wmq.15.2022.05.04.04.35.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 04:35:38 -0700 (PDT)
Message-ID: <da8874d4-66f1-d14e-c0ef-c3557e189cf4@redhat.com>
Date: Wed, 4 May 2022 13:35:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] fbdev: Use helper to get fb_info in all file operations
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, Junxiao Chang <junxiao.chang@intel.com>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Sam Ravnborg <sam@ravnborg.org>
References: <20220503201934.681276-1-javierm@redhat.com>
 <YnJBGpvlViLV+0/a@phenom.ffwll.local>
 <038f8365-b23b-9d81-f7b2-8f8c6eb3a065@redhat.com>
 <YnJbvb5TlHs4ckPM@phenom.ffwll.local>
 <d47a3cab-4f21-3b8b-2834-030663677070@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <d47a3cab-4f21-3b8b-2834-030663677070@suse.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 5/4/22 13:08, Thomas Zimmermann wrote:

[snip]

>>> So something similar to fb_file_fb_info() is needed to check if
>>> the vm_private_data is still valid. I guess that could be done
>>> by using the vmf->vma->vm_file and attempting the same trick that
>>> fb_file_fb_info() does ?
>>
>> Yeah should work, except if the ptes are set up already there's kinda not
>> much that this will prevent. We'd need to tear down mappings and SIGBUS or
>> alternatively have something else in place there so userspace doesn't blow
>> up in funny ways (which is what we're doing on the drm side, or at least
>> trying to).
>>
>> I'm also not sure how much we should care, since ideally for drm drivers
>> this is all taken care of by drm_dev_enter in the right places. It does
>> mean though that fbdev mmap either needs to have it's own memory or be
>> fully redirected to the drm gem mmap.
>>
>> And then we can afford to just not care to fix fbdev itself.
> 
> While the problem has been there ever since, the bug didn't happen until 
> we fixed hot-unplugging for fbdev. Not doing anything is probably not 
> the right thing.
>

Actually, this issue shouldn't happen if the fbdev drivers are not buggy
and do the proper cleanup at .fb_release() time rather than at .remove().

I'll post patches for simplefb and efifb which are the drivers that we
mostly care at this point. So we should be good and not need more fixes.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

