Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9C65A707C
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 00:18:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0576A10E2A7;
	Tue, 30 Aug 2022 22:18:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3229010E2A7
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 22:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661897923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TSSAWMfY5IhOGMsl4sCR/Sqq+wVCREXXNdNLZqAgz7E=;
 b=SlbKa74lYPJssd8c/BRasmJh/BCMoFRnl+LKFu990Im56H2r9rlfnBx/pOVX2WeyD+cO3o
 FYv9Aq3OVjO0cCeb16LKkwvyDQSzcG9QtFHmy/Qqt2/f0jWBkgt7YcdOlSmwj0HlMHgXb+
 EhLsUhL3sgVDc+T6UkwIx9stxfQlMAg=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-111-5a85TM4KOYaFEh4ovsYvTg-1; Tue, 30 Aug 2022 18:18:42 -0400
X-MC-Unique: 5a85TM4KOYaFEh4ovsYvTg-1
Received: by mail-il1-f200.google.com with SMTP id
 a14-20020a921a0e000000b002eb0baeeb1dso5406629ila.16
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 15:18:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc;
 bh=TSSAWMfY5IhOGMsl4sCR/Sqq+wVCREXXNdNLZqAgz7E=;
 b=ay38bgvIDLYRD3nDkf8aaBNrzlMs6BMuwgJySWsZbNKQosZu1nxTKw7RnIy5RN3Ov2
 mv1po9cdk1qUCudbVYd/wohicMXC9vsjCNbxY0J3PHUMBnulonQ9z0HKtTMgyOWcThjC
 BIHU8U6PDmBFTnmLAfssb6TCrF/PL4o5KCfaySpITdMqLsK5SQYjKd8MgyQnrrDy+wI9
 Aze0siYRhO8dq0B32uQuMPu8miObkPyz25P6PS3sUUnz2EvlbNx5jZJdziwZT5iK3lS0
 v5G8vluwBzNVIymQrbev0zQeLnEfudTIIYQ0jOIr2+aPVmGFOw9eKCQfW5BH6UUBQdlU
 dftg==
X-Gm-Message-State: ACgBeo3rNi68Ku3bi61718x3dvbvYFv20HmSafrBmCiZYDgwfz1fbAWH
 WJ0kfw2+TAw8xHGBvPabsAN6AgBZ/VbrYv/ejUQ7X1MBw2az4fOtagNhMYEeKpjbVTwdoktjzx6
 IQPcNtQLXS+D8aSyO7KCyZ/xePi9x
X-Received: by 2002:a05:6602:1c4:b0:689:2db5:ea0f with SMTP id
 w4-20020a05660201c400b006892db5ea0fmr11509843iot.197.1661897921390; 
 Tue, 30 Aug 2022 15:18:41 -0700 (PDT)
X-Google-Smtp-Source: AA6agR73OWrrAXNYUM7X5f/RFjdmLhOTn+HRSKcgl5cCW81jvTLPZGl1q1ozpKM9lFAFywZRpg27UQ==
X-Received: by 2002:a05:6602:1c4:b0:689:2db5:ea0f with SMTP id
 w4-20020a05660201c400b006892db5ea0fmr11509822iot.197.1661897921151; 
 Tue, 30 Aug 2022 15:18:41 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 z30-20020a056602081e00b0068b1858c81asm6110858iow.13.2022.08.30.15.18.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Aug 2022 15:18:40 -0700 (PDT)
Date: Tue, 30 Aug 2022 16:18:38 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH 15/15] vfio: Add struct device to vfio_device
Message-ID: <20220830161838.4aa47045.alex.williamson@redhat.com>
In-Reply-To: <20220827171037.30297-16-kevin.tian@intel.com>
References: <20220827171037.30297-1-kevin.tian@intel.com>
 <20220827171037.30297-16-kevin.tian@intel.com>
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
 Longfang Liu <liulongfang@huawei.com>, linux-s390@vger.kernel.org,
 Yi Liu <yi.l.liu@intel.com>, kvm@vger.kernel.org,
 Leon Romanovsky <leon@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Eric Auger <eric.auger@redhat.com>,
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

On Sun, 28 Aug 2022 01:10:37 +0800
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

Shall we start Documentation/ABI/testing/vfio-dev now?  Thanks.

Alex

