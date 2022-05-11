Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C0E52323F
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 13:57:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7399010E256;
	Wed, 11 May 2022 11:57:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D596910E212
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 11:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652270272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ej854CR7sjtYFdE3sImjC64n7WhVCOgxuIOus5Vy29E=;
 b=aFH6DAPSySuLTC3WVWqokuCLKc1sHADZ0Nyv0qPZd+1BxrHHnlRYOPGJWCp2tFgoQkZP/9
 QLCYM7pVq1HPVVX1avTTACU4Az/EzK939zPwOED99xMzOWvudbzY91VbuH0rPeQR6TPheY
 agF/Nv9tz8Rkow6J4D94Q5vofRwx20I=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-31-Cp-ujR_HM5-3oH24Vo2jUg-1; Wed, 11 May 2022 07:57:51 -0400
X-MC-Unique: Cp-ujR_HM5-3oH24Vo2jUg-1
Received: by mail-wm1-f70.google.com with SMTP id
 i131-20020a1c3b89000000b00393fbb0718bso2752960wma.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 04:57:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ej854CR7sjtYFdE3sImjC64n7WhVCOgxuIOus5Vy29E=;
 b=SSkyO6YAbMmFKoIs1TnIBSc0p5yGh0U7OdFNn8NhNshgFHiqaPrDoiusBL5uK7mtC7
 QZHKSGMes3/EY6P3GJPkwKxW6x8CSzTk/9RJjaOVa6jolDe2iGaodJTS0NkDSJucRogt
 GnE4/sAJ/bYvok8mENGlScBnJIHzu2ZRbwd1YT0VnNYW6qT7JfhXd7p4BFGaVyVbl/on
 cFu3IdtU7ZF58qxWiOoenVJIoR341OxhKRrusAQNKaU5ib1Nk9QinCsEaWynWx0OkrT2
 Atkb3g5Nwb9um16IwNfCQlSiOXyBFs5dNOKUsXv6y4ypLaQPqtU+ndVr5jwnZhXE+eAj
 D4aQ==
X-Gm-Message-State: AOAM533OCqPaFUVxcZ4dN+SavXmX7cUBwmJ0XlUIisMoQ5G0/vt6Re/G
 BWU6u2hgNuMp60yNd4vDAcVmad7rWXHqXCvRT/BSEiFwvpXfOLh25TBjTFWJPex4W8sxI/v3ZZf
 pJ7mH5MIqVFel0QqmU4hr+XtpJnae
X-Received: by 2002:a05:6000:2cc:b0:20c:5c31:1120 with SMTP id
 o12-20020a05600002cc00b0020c5c311120mr22951566wry.105.1652270270702; 
 Wed, 11 May 2022 04:57:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwx9aLP2JJ/CLGyt+kNia9KejENyTsMYfDrJSFT3ZMYJR/pCAxu1qiLtl7C2ddCWenOmQ+cA==
X-Received: by 2002:a05:6000:2cc:b0:20c:5c31:1120 with SMTP id
 o12-20020a05600002cc00b0020c5c311120mr22951554wry.105.1652270270492; 
 Wed, 11 May 2022 04:57:50 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 t16-20020a5d49d0000000b0020c5253d8edsm1498471wrs.57.2022.05.11.04.57.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 04:57:50 -0700 (PDT)
Message-ID: <4727ce99-7107-d806-cbea-cd45c6ce6106@redhat.com>
Date: Wed, 11 May 2022 13:57:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 3/7] fbdev: Restart conflicting fb removal loop when
 unregistering devices
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20220511112438.1251024-1-javierm@redhat.com>
 <20220511113039.1252432-1-javierm@redhat.com>
 <2156c28c-9c9c-555e-ce19-933cdc8d5e74@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <2156c28c-9c9c-555e-ce19-933cdc8d5e74@suse.de>
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 5/11/22 13:47, Thomas Zimmermann wrote:
> Hi Javier
> 
> Am 11.05.22 um 13:30 schrieb Javier Martinez Canillas:
>> Drivers that want to remove registered conflicting framebuffers prior to
>> register their own framebuffer, calls remove_conflicting_framebuffers().
>>
>> This function takes the registration_lock mutex, to prevent a races when
>> drivers register framebuffer devices. But if a conflicting framebuffer
>> device is found, the underlaying platform device is unregistered and this
>> will lead to the platform driver .remove callback to be called, which in
>> turn will call to the unregister_framebuffer() that takes the same lock.
>>
>> To prevent this, a struct fb_info.forced_out field was used as indication
>> to unregister_framebuffer() whether the mutex has to be grabbed or not.
>>
>> A cleaner solution is to drop the lock before platform_device_unregister()
>> so unregister_framebuffer() can take it when called from the fbdev driver,
>> and just grab the lock again after the device has been registered and do
>> a removal loop restart.
>>
>> Since the framebuffer devices will already be removed, the loop would just
>> finish when no more conflicting framebuffers are found.
>>
>> Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> I'd like to shrink this patchset. This looks like it can be merged 

Same. At least this version dropped a few patches that we had in v4
(related to DRM_FIRMWARE capability flag).

> immediately?
>

Yes, this one is independent of the others and could be merged already.

> Best regards
> Thomas
> 

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

