Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7465205A4
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 22:03:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A598710E089;
	Mon,  9 May 2022 20:03:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F6A510E089
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 20:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652126630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qnTkUabpe7jRtYxC0JIcCJ58YEOMuCVoeEj+uJ3yZCs=;
 b=cQo5gusFlh/xsHPpTPYHs9BKzG02sYtAyWygAHUPqD4uWGIDYqo1/OQQ0ocS79ORVv3PMJ
 WvIRHd/aqK4II/mC8rpPcNRtVC8HHr3vZHe0VSowUqGbpdPa2r8bnaD9L5n0EEu/JlkLT7
 M78HxKFMNg6iuamqEUMQEZ6PGoR8fM8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-206-3GifW24IOIaP0QQEMmKwgA-1; Mon, 09 May 2022 16:03:49 -0400
X-MC-Unique: 3GifW24IOIaP0QQEMmKwgA-1
Received: by mail-wr1-f71.google.com with SMTP id
 t17-20020adfa2d1000000b0020ac519c222so6163528wra.4
 for <dri-devel@lists.freedesktop.org>; Mon, 09 May 2022 13:03:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qnTkUabpe7jRtYxC0JIcCJ58YEOMuCVoeEj+uJ3yZCs=;
 b=fZ9eu7eDV+qKiB+RTNtlrpM6dnZ2sWU8EjTaZUsVRSn+36SySx0nrhBfrff8ZqBKCy
 ObmdRFtnn16LJuJbYhfTzBQlR2CRCCzvKVHyTNzVrOJSVPGoIVZ/n3BK1cqh8nio7A6C
 0gO2dx5N9mt7TqWo69hy6tK4U5+aLT3F7jhNLNjstJVe8Hl+diZAmnUoRybYk7Nukj0Z
 Td3Ws30sQLsdBWoPpCg4VFNven4DVRt4FosNPUf+4stfOlEAvtKIPrEe4AXfPxo+SbeN
 xVx+PSXrk1ZlJ5ipHz8q4PKXDpWSI02VGJ7RdFdGnmTxWbOv4uY26WMxF483198aH3qC
 LvAA==
X-Gm-Message-State: AOAM533g4cv2QD0nRxxvYft1TeAvG4Gj0Fgt1UcYnz2VRjYcWLaZxQnv
 PFpufB3Ovf+k4aAe1GuxwARiewy07CZ2ACh50rdz5+ciYTVDyT37g4qx8NU6dl3dbHAHo71m5AA
 xFaiIfPhxDjyzweecefBpJvpUYmRL
X-Received: by 2002:a05:600c:ada:b0:394:30f0:5b24 with SMTP id
 c26-20020a05600c0ada00b0039430f05b24mr17757045wmr.57.1652126628242; 
 Mon, 09 May 2022 13:03:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXbnXq4q4M+gBT0G+FQfJ/08vE6H+CMK+PCG9aU5sZFTb8/Iev3kbWSsbfQd4TXLWBeAhjBA==
X-Received: by 2002:a05:600c:ada:b0:394:30f0:5b24 with SMTP id
 c26-20020a05600c0ada00b0039430f05b24mr17757018wmr.57.1652126627950; 
 Mon, 09 May 2022 13:03:47 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k8-20020adfd848000000b0020c5253d8dbsm11555562wrl.39.2022.05.09.13.03.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 13:03:47 -0700 (PDT)
Message-ID: <2bf27b09-0896-1849-254f-d5b19abdc892@redhat.com>
Date: Mon, 9 May 2022 22:03:46 +0200
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
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <b5ab1c49-04e7-36c3-677d-2989b79e50ca@suse.de>
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

On 5/9/22 20:12, Thomas Zimmermann wrote:

[snip]

>> I actually thought about the same but then remembered what Daniel said in [0]
>> (AFAIU at least) that these should be done in .remove() so the current code
>> looks like matches that and only framebuffer_release() should be moved.
>>
>> For vesafb a previous patch proposed to also move a release_region() call to
>> .fb_destroy() and Daniel also said that it was iffy and shouldn't be done [1].
>>
>> But I'm also not fb expert so happy to move fb_dealloc_cmap() as well if that
>> is the correct thing to do.
> 
> The cmap data structure is software state that can be accessed via icotl 
> as long as the devfile is open. Drivers update the hardware from it. See 
> [1].  Moving that cleanup into fb_destroy seems appropriate to me.
> 

I see, that makes sense. Then something like the following instead?

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index d265a73313c9..ce0d89c49e42 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -627,12 +627,6 @@ void drm_fb_helper_fini(struct drm_fb_helper *fb_helper)
        cancel_work_sync(&fb_helper->resume_work);
        cancel_work_sync(&fb_helper->damage_work);
 
-       info = fb_helper->fbdev;
-       if (info) {
-               if (info->cmap.len)
-                       fb_dealloc_cmap(&info->cmap);
-               framebuffer_release(info);
-       }
        fb_helper->fbdev = NULL;
 
        mutex_lock(&kernel_fb_helper_lock);
@@ -2111,7 +2105,11 @@ static void drm_fbdev_release(struct drm_fb_helper *fb_helper)
  */
 static void drm_fbdev_fb_destroy(struct fb_info *info)
 {
+       if (info->cmap.len)
+               fb_dealloc_cmap(&info->cmap);
+
        drm_fbdev_release(info->par);
+       framebuffer_release(info);
 }
 
 static int drm_fbdev_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

