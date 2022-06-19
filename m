Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B60C1550BFE
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jun 2022 17:59:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8BBD10E21C;
	Sun, 19 Jun 2022 15:59:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D39C10E21C
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jun 2022 15:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655654369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SQ4C7bvrcai4wOcpyWK/twNUPMvOE02koNViKd9P4bU=;
 b=NdpmDE8kyg2fLQhuxwZdo/Pw+Xs0838Ip7bTzyJ7AMc2z7ufgqnCMl7Ed3CaLZtjibn4+P
 ke7NL/nw62CKeL/GomPpRr9cIarC7KDKmuY4X3krqO1Kk/NF6W6VmJtxnpJGDij6Ry8lf2
 pvtlLA2DiKFtEt/wY56KVmSon7oneK0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-70-Rwd6VtJUPz2ePCNxJpIM5Q-1; Sun, 19 Jun 2022 11:59:24 -0400
X-MC-Unique: Rwd6VtJUPz2ePCNxJpIM5Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 j31-20020a05600c1c1f00b0039c481c4664so2589848wms.7
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jun 2022 08:59:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SQ4C7bvrcai4wOcpyWK/twNUPMvOE02koNViKd9P4bU=;
 b=dEdRszEPDjf2z7KCP7xmMbdMCUqwfZtjA6tLhdvSFGqk7OW7C19JB/6Ud5fyKSRHgc
 MqPjo9Dn21wlQ6pKHdaYZnfim8sLLmR5ran6ED8CYFtrxX0ktjEk+YUfQ1ogBlerRsp8
 VzJF2dAr1Ayjnh7bZ73X3WVma531bP3gXdhquM12uc73LzXsL3GZHnaf/DrEd6NGw6hY
 J8eolOQaiXk7+y8zgxycgnXNhB7TFAOqIt8w9V9q8LoPdcRIAu1nT+EawOvGVQJarAnW
 zUPd4mxqs3xmRD/yEz0vcwrJQj1dzQAogP3xJ9crXBQa1MvbeKchcmNVb5PCTmZbbcNw
 BCPQ==
X-Gm-Message-State: AJIora9MQB9DxHALVo1uXZu4GQoY7EJYEaJJQBaytw+RJ6Sxr0MYabLF
 tbLSUF8ti0OeDhiTs/1Sc8js9YbXVGJs5T9BxefdIv3Qbh4ZzSFsrZGdQkuKsXzPb75aeh7X3+a
 jdHVekmzAzhdlG2I18N5JR+0UjOeZ
X-Received: by 2002:a05:600c:190d:b0:39c:8216:f53d with SMTP id
 j13-20020a05600c190d00b0039c8216f53dmr20682666wmq.108.1655654362759; 
 Sun, 19 Jun 2022 08:59:22 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t7KYu8EAAMHOVKHSApDdBOi/nHxErh1PxbJBNA814HIL5oy8rQzRb8d6zW6pNuhY6QznisjQ==
X-Received: by 2002:a05:600c:190d:b0:39c:8216:f53d with SMTP id
 j13-20020a05600c190d00b0039c8216f53dmr20682652wmq.108.1655654362554; 
 Sun, 19 Jun 2022 08:59:22 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 y14-20020a5d614e000000b0020d09f0b766sm10556568wrt.71.2022.06.19.08.59.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Jun 2022 08:59:22 -0700 (PDT)
Message-ID: <11f8d1b7-f193-170e-08ac-9edcd556cf0b@redhat.com>
Date: Sun, 19 Jun 2022 17:59:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] drm: panel-orientation-quirks: Add quirk for Aya Neo
 Next
To: Hans de Goede <hdegoede@redhat.com>, Maccraft123 <maccraft123mc@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20220619111952.8487-1-maccraft123mc@gmail.com>
 <cea478bf-ac29-dbdc-e156-5291da4f0318@redhat.com>
 <9c6cbae0-b890-96a9-1652-529d3b3be91c@redhat.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <9c6cbae0-b890-96a9-1652-529d3b3be91c@redhat.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Hans,

On 6/19/22 16:57, Hans de Goede wrote:
> Hi,
> 
> On 6/19/22 13:46, Javier Martinez Canillas wrote:
>> Hello Maya,
>>
>> On 6/19/22 13:19, Maccraft123 wrote:
>>> From: Maya Matuszczyk <maccraft123mc@gmail.com>
>>>
>>> The device is identified by "NEXT" in board name, however there are
>>> different versions of it, "Next Advance" and "Next Pro", that have
>>> different DMI board names.
>>> Due to a production error a batch or two have their board names prefixed
>>> by "AYANEO", this makes it 6 different DMI board names. To save some
>>> space in final kernel image DMI_MATCH is used instead of
>>> DMI_EXACT_MATCH.
>>>
>>> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>>>
>>
>> Patch looks good to me.
>>
>> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> 
> New version looks good to me too:
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> 
> I've some upcoming travel, so it would be good if someone
> else can push this to drm-misc-fixes.
> 

Sure, I've pushed to drm-misc-fixes now. Thanks!

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

