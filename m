Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C294857F444
	for <lists+dri-devel@lfdr.de>; Sun, 24 Jul 2022 11:06:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 904E518B25F;
	Sun, 24 Jul 2022 09:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A359511B7B7
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Jul 2022 09:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658653588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0rgI7ZvLoF/2I7hj7OPDobDAAixr8lx8606jK11C1Ug=;
 b=Ty8r9H0wSTRQY/a/CUDDWc09MNC/yrRwlNOd7uDctrBUSm88KAW2alax3lJfNu0902O0RQ
 zPBZt9gQyJChg3VnVUlFliP4n1czuAIo7urpXXiVCdRlaicK2204/iOeIizmRUYcQYy3EA
 GHUcSCXwPupb9vp6DuepADdMvXQPkdA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-299-is2yB5oIN7Ghyed8Iu1ycw-1; Sun, 24 Jul 2022 05:06:27 -0400
X-MC-Unique: is2yB5oIN7Ghyed8Iu1ycw-1
Received: by mail-wm1-f71.google.com with SMTP id
 189-20020a1c02c6000000b003a2d01897e4so4651570wmc.9
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Jul 2022 02:06:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0rgI7ZvLoF/2I7hj7OPDobDAAixr8lx8606jK11C1Ug=;
 b=alFiyh/JCpYfwHUXZeyYn/UOzKQxOxpvw3SIhkSUGJdx0OFPaxSiQneChAV3ENdRht
 zBuEivrLNYFVTy5QzH85t0f7G9c3JyWQOpAZOfsB1Rg4lJc3NZQ6ubkFw0lKaC5F1Gu7
 VfeQhe8h7P91V2DJOVz1sEgZzeeklosJvkcy94h8qXLEsNZ8xMqaOCPH5vAcULtuj4XV
 URXJoBxmNfHXqEAgbNvabq0P73HFY29vAMsYgjqsa16om4t86NFnJzt4wD9wAZqsFlQA
 LH4whY1seJFYhJgII1SgkrwhUw1InokibinQ2W/VfFdBtRTDaBb7peuj6cegGa+SrUeG
 8Dvg==
X-Gm-Message-State: AJIora/WzNOnJbwD6YPnZHVm+Pm3Xs8Injh2lEy+0JxwVp7dbVBV1kGP
 C/zF9TsafxFMqf1EjcrrpWf9LrxfKv5KnhdNLICTBaQzPTde2N+H3dN0XlxeI+4ZjgLzArmIfU4
 G2umakzjQyYTQuqfzx63VsV575BXY
X-Received: by 2002:a05:600c:4f89:b0:3a3:31a5:87f9 with SMTP id
 n9-20020a05600c4f8900b003a331a587f9mr11283152wmq.149.1658653586115; 
 Sun, 24 Jul 2022 02:06:26 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1upbEJz+hVLYetsHfwF/nFR/6sqHMBakgcujGYHz0NqH/7bHxc1i+KjazGfs5KOD1FhQMoNKA==
X-Received: by 2002:a05:600c:4f89:b0:3a3:31a5:87f9 with SMTP id
 n9-20020a05600c4f8900b003a331a587f9mr11283134wmq.149.1658653585774; 
 Sun, 24 Jul 2022 02:06:25 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q184-20020a1c43c1000000b003a302fb9df7sm13972584wma.21.2022.07.24.02.06.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 02:06:25 -0700 (PDT)
Message-ID: <7dc80ce9-83d5-2dc2-f660-fb8f6162c893@redhat.com>
Date: Sun, 24 Jul 2022 11:06:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/msm: Make .remove and .shutdown HW shutdown consistent
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20220723210825.564922-1-javierm@redhat.com>
 <CAA8EJpqr3GmQ3=p5_02dAnrK8HrUsf1yYxVKZL6g27eZXZ_U8w@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAA8EJpqr3GmQ3=p5_02dAnrK8HrUsf1yYxVKZL6g27eZXZ_U8w@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/24/22 10:53, Dmitry Baryshkov wrote:
> On Sun, 24 Jul 2022 at 00:09, Javier Martinez Canillas

[...]

>> -
>>         /*
>>          * Shutdown the hw if we're far enough along where things might be on.
>>          * If we run this too early, we'll end up panicking in any variety of
>> @@ -205,10 +199,21 @@ static int msm_drm_uninit(struct device *dev)
>>          * msm_drm_init, drm_dev->registered is used as an indicator that the
>>          * shutdown will be successful.
>>          */
>> -       if (ddev->registered) {
>> +       if (dev->registered)
>> +               drm_atomic_helper_shutdown(dev);
>> +}
>> +
>> +static int msm_drm_uninit(struct device *dev)
>> +{
>> +       struct platform_device *pdev = to_platform_device(dev);
>> +       struct msm_drm_private *priv = platform_get_drvdata(pdev);
>> +       struct drm_device *ddev = priv->dev;
>> +       struct msm_kms *kms = priv->kms;
>> +       int i;
>> +
>> +       if (ddev->registered)
>>                 drm_dev_unregister(ddev);
> 
> No. The drm_dev_unregister() should come before drm_atomic_helper_shutdown().
>

I'm not sure to understand what you meant here, since drm_dev_unregister() is
called before drm_atomic_helper_shutdown() that's called in msm_shutdown_hw().
 
> Also drm_dev_unregister() should not be a part of .shutdown callback.
> See the documentation in the drm_drv.c
>

It is not right now, msm_shutdown_hw() only calls drm_atomic_helper_shutdown()
but drm_dev_unregister() is still called from the msm_drm_uninit() function.
 
Now, your comment made me realize that there's a bug in this patch since after
the drm_dev_unregister(), dev->registered will be set to false and so in the
.remove -> .unbind path drm_atomic_helper_shutdown() will never be executed.

I guess one option is to do the if (dev->registered) check in the callers but
then it won't really be worth it to have a helper and we could just add that
check in msm_drv_shutdown() to conditionally call drm_atomic_helper_shutdown().

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

