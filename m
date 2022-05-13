Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC475261D3
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 14:28:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4045710E113;
	Fri, 13 May 2022 12:28:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 829B610E113
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 12:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652444907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NAK0Gk2w3i58gSPmmVvLPauf3+gDSOWurZVw4Vf2rDQ=;
 b=R7/5lG15vZs5wuZ7uyacVY3tVz+xl58Ix873Ps6Tx3GPAQ/UPW/n8POPgWdpCM98LFSFi6
 pm9EbBfineHdwYJJlDMgY75uJ0TtV2UzRP1pORJntnNpIGd3+x3UdULq2CxyB8ixnGd2K3
 eyc3HWvpQodeURxarlkzIPu7YwpTO6k=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-274-ZQOzvYulNfKpJSRJmZJf7g-1; Fri, 13 May 2022 08:28:26 -0400
X-MC-Unique: ZQOzvYulNfKpJSRJmZJf7g-1
Received: by mail-wr1-f70.google.com with SMTP id
 k29-20020adfb35d000000b0020adc94662dso2878082wrd.12
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 05:28:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NAK0Gk2w3i58gSPmmVvLPauf3+gDSOWurZVw4Vf2rDQ=;
 b=Pxt+f+FAQ52E/DGgs9323tKbsRtIqp5NbtUla96ncZTzvHSGP3Wz+ppgCxw1nD39jZ
 fjxREbzbL5nwSeAkkwOeZpyJS+zWSEJ6bsIxtZTMmibce/3LV9NgkdPmAiaD+uMVhqxj
 xm96G/X54PA8xfAlJwfRbs3OeIzCVhAjSkxGYaQMOsTZLRZ+ayndfPeN2B1P0VcWQC14
 JkEB791WLEAqPc5WQPlOtkIIXvXknu/lIt4Z60u8X9jVrsN0GpMgoQAV36v+VZdsZoDL
 IqsnBTGQ8guaG+PUO8BYNV/31ZPNyyxek6uPpM/W8oTD6bLqwzHhGlzNoNAnJIXGyPLq
 A36Q==
X-Gm-Message-State: AOAM532oRD7FUqZQto8nkkMtBeu+p5pIdbnWmiUEUwOk0Qv0vjyUGE+k
 vDmC+gz0XR8f06cAqlpUJm2OcTQM3QSY/6Q6nXzlGM2S8jigRLKCEYDmtnZ10Wb5o981jwpahQS
 UT3Rfat7eAL1SYyaVWOsoblzqveXr
X-Received: by 2002:a05:6000:156b:b0:20c:6ffb:9588 with SMTP id
 11-20020a056000156b00b0020c6ffb9588mr3865393wrz.49.1652444904966; 
 Fri, 13 May 2022 05:28:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwLT41J/yG1HkvUQOhV5KnK8fNGtzGb6CsJVszlDX5dbsHh8Cxbhd7a4okhWnFPei5mAdPOg==
X-Received: by 2002:a05:6000:156b:b0:20c:6ffb:9588 with SMTP id
 11-20020a056000156b00b0020c6ffb9588mr3865368wrz.49.1652444904693; 
 Fri, 13 May 2022 05:28:24 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 bd19-20020a05600c1f1300b00395f15d993fsm1637910wmb.5.2022.05.13.05.28.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 05:28:24 -0700 (PDT)
Message-ID: <41e91473-bd0b-c0e4-85db-d92dd38d28bd@redhat.com>
Date: Fri, 13 May 2022 14:28:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 3/7] fbdev: Restart conflicting fb removal loop when
 unregistering devices
To: linux-kernel@vger.kernel.org
References: <20220511112438.1251024-1-javierm@redhat.com>
 <20220511113039.1252432-1-javierm@redhat.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220511113039.1252432-1-javierm@redhat.com>
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/11/22 13:30, Javier Martinez Canillas wrote:
> Drivers that want to remove registered conflicting framebuffers prior to
> register their own framebuffer, calls remove_conflicting_framebuffers().
> 
> This function takes the registration_lock mutex, to prevent a races when
> drivers register framebuffer devices. But if a conflicting framebuffer
> device is found, the underlaying platform device is unregistered and this
> will lead to the platform driver .remove callback to be called, which in
> turn will call to the unregister_framebuffer() that takes the same lock.
> 
> To prevent this, a struct fb_info.forced_out field was used as indication
> to unregister_framebuffer() whether the mutex has to be grabbed or not.
> 
> A cleaner solution is to drop the lock before platform_device_unregister()
> so unregister_framebuffer() can take it when called from the fbdev driver,
> and just grab the lock again after the device has been registered and do
> a removal loop restart.
> 
> Since the framebuffer devices will already be removed, the loop would just
> finish when no more conflicting framebuffers are found.
> 
> Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
Pushed this to drm-misc (drm-misc-next). Thanks all!

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

