Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AA95BEE88
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 22:27:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B83CC10E21A;
	Tue, 20 Sep 2022 20:26:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 170D010E21A
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 20:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663705606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kTuYdzoZrrSVtqbKAPsta2mJ6sY3BJrx+736wsbe0TI=;
 b=RaYhDeXaB7xE4co1Va5IFJp5h8SjKelE4OC1jccug6UF5kqQey25UqXL7qPIIirS7KQ7st
 U9PrPi5tVZOfEEAmMZeuq1zof+2lTICqk5uratdU/yRDob3yGJ2DE2Z78fVlhIo3/kHhhf
 xGWAAZKxgvTjN/Z6YhQmXptaHuo2YNc=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-457-7DWk3kkGNEyNTGRtEs-e-w-1; Tue, 20 Sep 2022 16:26:43 -0400
X-MC-Unique: 7DWk3kkGNEyNTGRtEs-e-w-1
Received: by mail-il1-f199.google.com with SMTP id
 o5-20020a056e02102500b002ddcc65029cso2298953ilj.8
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 13:26:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date;
 bh=kTuYdzoZrrSVtqbKAPsta2mJ6sY3BJrx+736wsbe0TI=;
 b=5okM32oVTYhVdYPPnxy+GKrgzsRzUYtMzf5JNtj6apHYNrs2xJ6jqRuOlpPO0mYsAG
 l41VjnR6OeijpSO4hWx9lWpmRXsAuyBzTEqAsf82du16CeHB1cFfG5PlTGWLYq8KmATt
 oWT4WNvhZ5CZyFtGWyt4MeEH7Xu0Y8NrcYmBTgxK7MjECpnQiYoSYzsUP5h7UjkhqoTp
 mpC69D6r3jE8xa9l91KhroVwTl4TJOl+5uoKlDNAJvbRATfUvVjajrfHsA885hFlLfWD
 pCBznVSFzcf4svGstZDSOdMkqxittCIhvWM41n2PbB9NQBnXpRQpntWQDUCGWa0L9cCf
 PxCA==
X-Gm-Message-State: ACrzQf2MG0RghrID23MryuRm9voaB/7kELN8AEvrlhBncQPquLpcwCf1
 V2PoUVm+JZojLYiW4awQ0FN3cDbcE4FSYrU/9JHdYvQoW2JQyrzKGCTNIVNtNrM4ELQERVzHdfM
 kS0VqzoKa8CJyRS+N7GlLmKxFJwVF
X-Received: by 2002:a05:6638:379e:b0:35a:6503:453c with SMTP id
 w30-20020a056638379e00b0035a6503453cmr11604725jal.118.1663705602749; 
 Tue, 20 Sep 2022 13:26:42 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7Wn3n/ipGU1Lsd59DpS6zB424nUgnSwe6A3PA6dfJBFxnu4Ya4+9pvipnOK8j87C89TfNNcQ==
X-Received: by 2002:a05:6638:379e:b0:35a:6503:453c with SMTP id
 w30-20020a056638379e00b0035a6503453cmr11604691jal.118.1663705602488; 
 Tue, 20 Sep 2022 13:26:42 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 z18-20020a05663822b200b00359fbe10489sm269899jas.103.2022.09.20.13.26.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 13:26:42 -0700 (PDT)
Date: Tue, 20 Sep 2022 14:26:39 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v3 15/15] vfio: Add struct device to vfio_device
Message-ID: <20220920142639.29b1bdc2.alex.williamson@redhat.com>
In-Reply-To: <20220909102247.67324-16-kevin.tian@intel.com>
References: <20220909102247.67324-1-kevin.tian@intel.com>
 <20220909102247.67324-16-kevin.tian@intel.com>
Organization: Red Hat
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Longfang Liu <liulongfang@huawei.com>, Christoph Hellwig <hch@infradead.org>,
 Yi Liu <yi.l.liu@intel.com>, kvm@vger.kernel.org,
 Leon Romanovsky <leon@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
 Heiko Carstens <hca@linux.ibm.com>, Eric Auger <eric.auger@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Jason Herne <jjherne@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Abhishek Sahu <abhsahu@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri,  9 Sep 2022 18:22:47 +0800
Kevin Tian <kevin.tian@intel.com> wrote:

> From: Yi Liu <yi.l.liu@intel.com>
> 
> and replace kref. With it a 'vfio-dev/vfioX' node is created under the
> sysfs path of the parent, indicating the device is bound to a vfio
> driver, e.g.:
> 
> /sys/devices/pci0000\:6f/0000\:6f\:01.0/vfio-dev/vfio0
> 
> It is also a preparatory step toward adding cdev for supporting future
> device-oriented uAPI.
> 
> Add Documentation/ABI/testing/sysfs-devices-vfio-dev.
> 
> Also take this chance to rename chardev 'vfio' to 'vfio-group' in
> /proc/devices.

What's the risk/reward here, is this just more aesthetically pleasing
symmetry vs 'vfio-dev'?  The char major number to name association in
/proc/devices seems pretty obscure, but what due diligence have we done
to make sure this doesn't break anyone?  Thanks,

Alex

