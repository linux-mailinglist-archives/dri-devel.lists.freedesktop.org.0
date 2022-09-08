Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A53EA5B180B
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 11:08:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08ADA10E9D9;
	Thu,  8 Sep 2022 09:08:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA6710E9D8
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 09:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662628110;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AAQa4isXcnz/CqAw9Or0VLGVMQujP+L3g/TlUU+ZO2I=;
 b=diCygZpyCdafwuD7e2PmbVE84zFzO+88akNjZeHQLvAzYyewPRiViBka9dsqGnitxPb45j
 hXUeDvM00U1tEUx7pyrUfZmYoA9/n77eIv3GKw5NCofbIOSCXuYy4zMji5BHPlgrQ/j3nd
 23x3YYHlTTIMNupYFdMwjRbTMT6rs7g=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-411-XMaVAI2uNNCBeJckeNyvvA-1; Thu, 08 Sep 2022 05:08:29 -0400
X-MC-Unique: XMaVAI2uNNCBeJckeNyvvA-1
Received: by mail-qk1-f197.google.com with SMTP id
 x22-20020a05620a259600b006b552a69231so14043485qko.18
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Sep 2022 02:08:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=AAQa4isXcnz/CqAw9Or0VLGVMQujP+L3g/TlUU+ZO2I=;
 b=ossm34186RbpIcXCTgEWiQ0Q9JqrpyG+eUvMAIsJKI0jtD72cJt1EbKIdMpMksPRdy
 ynaWDT++ysyKhYkMT3FEW+1LVBDtS1QNi8dRDK1a5HaSb49WYlZ+LCM6iT/SZI1Zz9j7
 TM85U+PfKdOTKmVRAqISRBmEpgNQSFlEyg7FcDX/mPrHLeGIA0QDwgeP++mHCB47PeyM
 ovnJIes1wQQSlekVKxtWSGt29bNzfweX+j3eUIJCB4N18FSP5viJ2c2OTkMHt6vUuyT9
 CrCYtHlYHnhHa5C9uEqX5aiCJ8Hcnbajo4AupjPkxVOhQwC7pysNRQ64TDIw1t1tI0Ih
 5+gA==
X-Gm-Message-State: ACgBeo2hCb17vKECB3BQWos6qqdmijmS9w7lIcmGc9QbRTfGbGqYjvfl
 tWGRNxqlvJP+K1lWVgTTXYMXO/hIAAkfu8Xlb4p2MFTwdd/FvjNzcGIz/SD0rDoZjUwm6CuYBla
 j+En3QR1ZDfM37YbWTmUxgEO43FZt
X-Received: by 2002:ac8:58d2:0:b0:344:5698:a2e8 with SMTP id
 u18-20020ac858d2000000b003445698a2e8mr7273794qta.392.1662628109357; 
 Thu, 08 Sep 2022 02:08:29 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7WJ3e3rc/rDtFXXj3tevRpC3CGaundZvbMDIERUF76jhlMbQUf5uKHf0h+nvyWes4AGw7qCA==
X-Received: by 2002:ac8:58d2:0:b0:344:5698:a2e8 with SMTP id
 u18-20020ac858d2000000b003445698a2e8mr7273747qta.392.1662628109111; 
 Thu, 08 Sep 2022 02:08:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 r3-20020ae9d603000000b006af0ce13499sm16489061qkk.115.2022.09.08.02.08.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 02:08:27 -0700 (PDT)
Message-ID: <527db896-b064-2f02-ae96-6525496176c4@redhat.com>
Date: Thu, 8 Sep 2022 11:08:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 01/15] vfio: Add helpers for unifying vfio_device life
 cycle
To: "Tian, Kevin" <kevin.tian@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Eric Farman <farman@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Longfang Liu <liulongfang@huawei.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 Abhishek Sahu <abhsahu@nvidia.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>
References: <20220901143747.32858-1-kevin.tian@intel.com>
 <20220901143747.32858-2-kevin.tian@intel.com>
 <90862543-9343-7389-a1ff-be9a011be64e@redhat.com>
 <BN9PR11MB527639DCC5706ADA8F0519D38C409@BN9PR11MB5276.namprd11.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <BN9PR11MB527639DCC5706ADA8F0519D38C409@BN9PR11MB5276.namprd11.prod.outlook.com>
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
Reply-To: eric.auger@redhat.com
Cc: "Liu, Yi L" <yi.l.liu@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kevin,

On 9/8/22 08:19, Tian, Kevin wrote:
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: Thursday, September 8, 2022 3:28 AM
>>> +/*
>>> + * Alloc and initialize vfio_device so it can be registered to vfio
>>> + * core.
>>> + *
>>> + * Drivers should use the wrapper vfio_alloc_device() for allocation.
>>> + * @size is the size of the structure to be allocated, including any
>>> + * private data used by the driver.
>>> + *
>>> + * Driver may provide an @init callback to cover device private data.
>> nit: this comment may rather relate to the vfio_init_device function
> Yes but vfio_init_device() is used only by ccw and presumably will be
> abandoned once ccw fixes its life cycle mess. Given that I prefer to leaving
> the comment here to be noted by broader users.

OK

Eric
>
>> Besides
>>
>> Reviewed-by: Eric Auger <eric.auger@redhat.com>
>>
> Thanks and other comments adopted. 

