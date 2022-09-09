Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B09295B433D
	for <lists+dri-devel@lfdr.de>; Sat, 10 Sep 2022 01:53:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E59410E1C3;
	Fri,  9 Sep 2022 23:53:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2ACF10E1C2
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 23:53:14 +0000 (UTC)
Received: by mail-qv1-xf2c.google.com with SMTP id s13so2435905qvq.10
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Sep 2022 16:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=I7AGr5kxvD7L8BGImkaiYYIcWYTyuHALX3Uwn5SFGes=;
 b=dABIJEmzczJA9TeUEwB/vqlw1on+BNexewwg9hQHdtE1Pf+5Eir7ZuRo5Ra74CBI2Y
 mcA+UH3eeO9aAd0QqE0L7SFCTjpphtpc0ELtMYBKyyRw1a/HWDzHyUcOactrzkgR2sl3
 L0nOmencTRW6FHXiEoY9iZZ+c/WYo/U0AzzN4UAFPlTI1iRVRUWqtRTHaf8sCXXZzJnf
 NJL3l99mu6NE5Asx87J+/QD6IeeyB3qXivdFsvkAKE6TbTRWix12Dqc9T+JmjOGbnts9
 4TFjGIVIDOrRXIamT7vOV1TzgaehJPaax4ZVZ8nlHpjlkRagg2W3Kahrivj4XNmSdY7D
 YIBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=I7AGr5kxvD7L8BGImkaiYYIcWYTyuHALX3Uwn5SFGes=;
 b=mhVRiCU8xzE/QVfBbktatOuMCTMD6MzquOFpskBHU/1k+tPvDZzSBjjvQoA9OSGsvD
 yG5tubLJCyR1pO1/FG9PERI/qLgW4QmmpuwXFEd3eYxrKdADce1h5pRxSZ8EklFHOP1n
 aGFrjbK5BNvA+H3X1BTqyb8vzisvVAlTfeK/TycSFGF835ktXDCVZJIdPriJud1tMr3e
 qSDYq9+bjc5TtOz+muHhRrM+iUWAzs4qw2QZmxOv2OTTqsAxndWCXeDox96Qutc6eQ0C
 hE84hK3+P3kzRCgRLCLp5kiwXY6prdga1pbFfy6F0PL9dur76gICkc3RU8UbONGIdK9Z
 ca6w==
X-Gm-Message-State: ACgBeo3OsFmQCX0YF5MFoZH1QHj8fYy5gL32/ddbCOTtLcWtX/NWdByG
 NtEdHZAttCa+UhfJTegyTO9W5g==
X-Google-Smtp-Source: AA6agR5hWM2GJ5zXaAdZz8/5jyfYnTB6f4lRkH4YbMaWcByENpIrNcfVlyo+HaeUh7LK3d+xbRkfaQ==
X-Received: by 2002:a0c:f445:0:b0:4a6:9f4a:9a66 with SMTP id
 h5-20020a0cf445000000b004a69f4a9a66mr14581963qvm.65.1662767593396; 
 Fri, 09 Sep 2022 16:53:13 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129]) by smtp.gmail.com with ESMTPSA id
 fz16-20020a05622a5a9000b00342fc6a8e25sm1348798qtb.50.2022.09.09.16.53.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Sep 2022 16:53:12 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1oWno8-00A0GS-4S;
 Fri, 09 Sep 2022 20:53:12 -0300
Date: Fri, 9 Sep 2022 20:53:12 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v3 01/15] vfio: Add helpers for unifying vfio_device life
 cycle
Message-ID: <YxvR6PHywJCTgp3z@ziepe.ca>
References: <20220909102247.67324-1-kevin.tian@intel.com>
 <20220909102247.67324-2-kevin.tian@intel.com>
 <acbaf0f2-91d4-3eae-5716-244893ca34c7@linux.intel.com>
 <BN9PR11MB5276E41114EEE687975C698F8C439@BN9PR11MB5276.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB5276E41114EEE687975C698F8C439@BN9PR11MB5276.namprd11.prod.outlook.com>
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Kirti Wankhede <kwankhede@nvidia.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Longfang Liu <liulongfang@huawei.com>, Christoph Hellwig <hch@infradead.org>,
 "Liu, Yi L" <yi.l.liu@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Leon Romanovsky <leon@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Ethan Zhao <haifeng.zhao@linux.intel.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Jason Herne <jjherne@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Abhishek Sahu <abhsahu@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 09, 2022 at 08:42:25AM +0000, Tian, Kevin wrote:

> I think it's quite common to have an alloc() helper initialize refcount, e.g.
> vfio_group_alloc() both initialize its user refcount and also call
> device_initialize()  to gets kref initialized. Similar example in
> ib_alloc_device(), etc.

Right, it is quite a good/common pattern to have an allocation function
return a refcount to the caller.

I don't know of any naming standard for this however.

Jason
