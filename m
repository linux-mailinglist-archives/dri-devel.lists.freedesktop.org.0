Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B577520121
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 17:30:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B7710E286;
	Mon,  9 May 2022 15:30:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14FB610E286
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 15:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652110228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=32O50jez/PbrMF8EQrDMnibyIcUmfYiL4OMerJWfOrc=;
 b=euhwlSnNLp5WhjbMN9ZTyppuM8zK7xQZNVPVPcIw0V2OhdhvLCC01G4gMMBgXMtCgLkYiK
 us2596edZxn8eAq4BQYEqOG6xnNV7CIyE7FQGPOFaXoNMhdSK5NQ3tvyIpfRz6Kus+ulwo
 enBJNBfLnWmLQbyW42MDkOUZlq1dbKs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-84-g5d1Lo7tP96CJJaxftap7A-1; Mon, 09 May 2022 11:30:26 -0400
X-MC-Unique: g5d1Lo7tP96CJJaxftap7A-1
Received: by mail-wm1-f69.google.com with SMTP id
 p24-20020a1c5458000000b003945d2ffc6eso4395619wmi.5
 for <dri-devel@lists.freedesktop.org>; Mon, 09 May 2022 08:30:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=32O50jez/PbrMF8EQrDMnibyIcUmfYiL4OMerJWfOrc=;
 b=FNZFeRZU+YJ3IiPCqyhrbD95/2xkpuDGJ/fLlc4YsiMOGduEjGUAuxQ0ffgyG5F2ww
 tB2hyMzUV0s8wk41ozdJCMUS22OUjIjb4Jf5VxvBOBpLAaR5aG//fV72Q+XVC81MA8uY
 a3m5VYQ84eZvs7vA4jLQyWALI7jdVUXPZJvqB3FUABZTqCe/8GaQau/hGYmPzYRKRoTH
 /K1Clf1jv6ivQtzFsvxCCQ++0wgPSEHZ4U6nQAAC+nI6I8CFUz6WUNhQ7J/yAZz+QluR
 l2XrlHrA4kQAZxmaH1xUQJdJz0cTqQ68nSk0E9fe4TapvuySMfa1KW/vYZ6Im2Om36iy
 bNPg==
X-Gm-Message-State: AOAM531jgKoO5QxgVlmQOLRNDwFKktsCA/zpmp3Aj1O9VIJUieSP/l6W
 liuZQGd7vdi4u/8OTispur6EAJnW741nfcXQtn9OcfW7+jV7fk61jIJhCRtWqKeBDD4DkC+pWOR
 CxepVxwNUtzY6n4XozEFilvB8R2fX
X-Received: by 2002:a1c:e916:0:b0:38e:ac96:f477 with SMTP id
 q22-20020a1ce916000000b0038eac96f477mr23110371wmc.160.1652110225681; 
 Mon, 09 May 2022 08:30:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2OJQhUhbDP19T1Ygw1cNWeWjH+vy1pamLfQvh45VT2yujXYJ3AxWzNA16UgHpJIS114J32Q==
X-Received: by 2002:a1c:e916:0:b0:38e:ac96:f477 with SMTP id
 q22-20020a1ce916000000b0038eac96f477mr23110328wmc.160.1652110225343; 
 Mon, 09 May 2022 08:30:25 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 o9-20020a5d62c9000000b0020c5253d903sm11552799wrv.79.2022.05.09.08.30.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 08:30:25 -0700 (PDT)
Message-ID: <1f788b8f-0bea-1818-349e-b1bc907bf251@redhat.com>
Date: Mon, 9 May 2022 17:30:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 1/4] fbdev: Prevent possible use-after-free in
 fb_release()
To: Andrzej Hajda <andrzej.hajda@intel.com>, linux-kernel@vger.kernel.org
References: <20220505215947.364694-1-javierm@redhat.com>
 <20220505220413.365977-1-javierm@redhat.com>
 <753d0350-42dc-389b-b10b-4533ddcf32ac@intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <753d0350-42dc-389b-b10b-4533ddcf32ac@intel.com>
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

Hello Andrzej,

On 5/9/22 16:56, Andrzej Hajda wrote:
> On 06.05.2022 00:04, Javier Martinez Canillas wrote:
>> From: Daniel Vetter <daniel.vetter@ffwll.ch>
>>
>> Most fbdev drivers have issues with the fb_info lifetime, because call to
>> framebuffer_release() from their driver's .remove callback, rather than
>> doing from fbops.fb_destroy callback.
>>
>> Doing that will destroy the fb_info too early, while references to it may
>> still exist, leading to a use-after-free error.
>>
>> To prevent this, check the fb_info reference counter when attempting to
>> kfree the data structure in framebuffer_release(). That will leak it but
>> at least will prevent the mentioned error.
>>
>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>
>> (no changes since v1)
>>
>>   drivers/video/fbdev/core/fbsysfs.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/video/fbdev/core/fbsysfs.c b/drivers/video/fbdev/core/fbsysfs.c
>> index 8c1ee9ecec3d..c2a60b187467 100644
>> --- a/drivers/video/fbdev/core/fbsysfs.c
>> +++ b/drivers/video/fbdev/core/fbsysfs.c
>> @@ -80,6 +80,10 @@ void framebuffer_release(struct fb_info *info)
>>   {
>>   	if (!info)
>>   		return;
>> +
>> +	if (WARN_ON(refcount_read(&info->count)))
>> +		return;
>> +
> 
> Regarding drm:
> What about drm_fb_helper_fini? It calls also framebuffer_release and is 
> called often from _remove paths (checked intel/radeon/nouveau). I guess 
> it should be fixed as well. Do you plan to fix it?
>

I think you are correct. Maybe we need something like the following?

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index d265a73313c9..b09598f7af28 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -631,7 +631,6 @@ void drm_fb_helper_fini(struct drm_fb_helper *fb_helper)
        if (info) {
                if (info->cmap.len)
                        fb_dealloc_cmap(&info->cmap);
-               framebuffer_release(info);
        }
        fb_helper->fbdev = NULL;
 
@@ -2112,6 +2111,7 @@ static void drm_fbdev_release(struct drm_fb_helper *fb_helper)
 static void drm_fbdev_fb_destroy(struct fb_info *info)
 {
        drm_fbdev_release(info->par);
+       framebuffer_release(info);
 }
 
 static int drm_fbdev_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)

> 
> Regarding fb drivers, just for stats:
> git grep -p framebuffer_release | grep _remove | wc -l
> Suggests there is at least 70 incorrect users of this :)
>

Yes, Daniel already mentioned that most of them get this wrong but I was
mostly interested in {simple,efi,vesa}fb since are used with "nomodeset".

But given that I only touched those tree and still managed to introduce
a regression, I won't attempt to fix the others.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

