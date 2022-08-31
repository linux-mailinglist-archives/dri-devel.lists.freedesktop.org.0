Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C1B5A840C
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 19:15:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A5110E415;
	Wed, 31 Aug 2022 17:15:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C2E10E415
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Aug 2022 17:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661966116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3wNDRJb+y9GkEb33I7HiMe0aeP3rl6XFj5xgf5bJFgc=;
 b=UllZ4waRVbg8pZ5KlSxCroRM9HN1CVkOxwjBKDG9GptMIg5d2xUuYPFnkwOYiWxFhnJGQg
 pEC4WtF2VO8txYQg2azqhQKF55HcprdpHubqPG4qKt5EFFC3t2tFS0jlgkBIBHrY9uj8ou
 AedEBEKCreL98OEI6dGKzLQrrR274hg=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-29-shlIcDiVMxuVo4L9EfkTUQ-1; Wed, 31 Aug 2022 13:15:15 -0400
X-MC-Unique: shlIcDiVMxuVo4L9EfkTUQ-1
Received: by mail-il1-f198.google.com with SMTP id
 c7-20020a056e020bc700b002e59be6ce85so10926602ilu.12
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Aug 2022 10:15:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc;
 bh=3wNDRJb+y9GkEb33I7HiMe0aeP3rl6XFj5xgf5bJFgc=;
 b=nISToSTCVoQUpVmRTBK1ayeIngOi2OPdvsNpse5AK2/LJjB1VZw5tSZCVeZZWvwdjh
 uA9PbiW1Q86VGlJj4a+vdPY9pFvGgLrmlGoM08p4acEFx1TozqDm4IwvSJsrhbdJQLe5
 svfgfO20wiQTaGohWeWtKUcXlL8gSxjRu0yUqZrXE8MWCIFyDMyXGf6hWdimgCiqXuwE
 vPeO+HHcR4Fh1YgJ4DWJ+FDRut+p+NcrwaVDcYODVI+oLduKB2pim0SA/5UNGrm8ARMf
 iXMpbxbqv1c1AiwY9pZ+IWuZ1RvEPxrrYWmaF52uM0FNKBHeQWPK13/XPaKf4Lizsypw
 fjzQ==
X-Gm-Message-State: ACgBeo2vYyUL2KQOPLHhr2+j0KfW97YLkS1QYnzmQBN7A5LTXY1nVPgA
 vJzwxubU74/SSEcx+iA6L2YeL1HZBYrGfK9MgxWybDs40uFHHb7qWvYbpxjDYOcPLpsSMKw4rCv
 Md4zwnH3Vq6tpO/UzPQjB296Z5f7M
X-Received: by 2002:a05:6638:dd4:b0:349:ebfd:e705 with SMTP id
 m20-20020a0566380dd400b00349ebfde705mr15532691jaj.4.1661966114842; 
 Wed, 31 Aug 2022 10:15:14 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7UqftyvxL/mEDNedrHFErMBY8p1pSeatls/DmKqtUta1ABwUYFXwUlUJQ1689Lfg3tEQsWAQ==
X-Received: by 2002:a05:6638:dd4:b0:349:ebfd:e705 with SMTP id
 m20-20020a0566380dd400b00349ebfde705mr15532650jaj.4.1661966114600; 
 Wed, 31 Aug 2022 10:15:14 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 u190-20020a0223c7000000b00343617e8368sm7084182jau.99.2022.08.31.10.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 10:15:14 -0700 (PDT)
Date: Wed, 31 Aug 2022 11:15:12 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH 15/15] vfio: Add struct device to vfio_device
Message-ID: <20220831111512.4924e152.alex.williamson@redhat.com>
In-Reply-To: <BN9PR11MB5276BF3B8D65B66DB292CAE58C789@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220827171037.30297-1-kevin.tian@intel.com>
 <20220827171037.30297-16-kevin.tian@intel.com>
 <20220830161838.4aa47045.alex.williamson@redhat.com>
 <Yw6i7btDKcUDPADP@ziepe.ca>
 <BN9PR11MB5276BF3B8D65B66DB292CAE58C789@BN9PR11MB5276.namprd11.prod.outlook.com>
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Kirti Wankhede <kwankhede@nvidia.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Longfang Liu <liulongfang@huawei.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Liu,
 Yi L" <yi.l.liu@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Leon Romanovsky <leon@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Eric Auger <eric.auger@redhat.com>,
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

On Wed, 31 Aug 2022 06:10:51 +0000
"Tian, Kevin" <kevin.tian@intel.com> wrote:

> > From: Jason Gunthorpe <jgg@ziepe.ca>
> > Sent: Wednesday, August 31, 2022 7:53 AM
> > 
> > On Tue, Aug 30, 2022 at 04:18:38PM -0600, Alex Williamson wrote:  
> > > On Sun, 28 Aug 2022 01:10:37 +0800
> > > Kevin Tian <kevin.tian@intel.com> wrote:
> > >  
> > > > From: Yi Liu <yi.l.liu@intel.com>
> > > >
> > > > and replace kref. With it a 'vfio-dev/vfioX' node is created under the
> > > > sysfs path of the parent, indicating the device is bound to a vfio
> > > > driver, e.g.:
> > > >
> > > > /sys/devices/pci0000\:6f/0000\:6f\:01.0/vfio-dev/vfio0
> > > >
> > > > It is also a preparatory step toward adding cdev for supporting future
> > > > device-oriented uAPI.  
> > >
> > > Shall we start Documentation/ABI/testing/vfio-dev now?  Thanks.  
> > 
> > I always thought that was something to use when adding new custom
> > sysfs attributes?
> > 
> > Here we are just creating a standard struct device with its standard
> > sysfs?
> >   
> 
> There is nothing special for vfio-dev/vfioX. But from pci device p.o.v
> this does introduce a custom node in the directory, which is probably
> what Alex referred to?

Yup, but not just for pci, we're adding a node into the device
directory for any device bound to vfio.

> Anyway if required following can be introduced:
> 
> diff --git a/Documentation/ABI/testing/sysfs-devices-vfio-dev b/Documentation/ABI/testing/sysfs-devices-vfio-dev
> new file mode 100644
> index 000000000000..dfe8baaf1ccb
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-devices-vfio-dev
> @@ -0,0 +1,8 @@
> +What:		 /sys/.../<device>/vfio-dev/vfioX/
> +Date:		 September 2022
> +Contact:	 Yi Liu <yi.l.liu@intel.com>
> +Description:
> +		 This directory is created when the device is bound to a
> +		 vfio driver. The layout under this directory matches what
> +		 exists for a standard 'struct device'. 'X' is a random
> +		 number marking this device in vfio.

It's not really random, it's a unique index.  Seems like a good
starting point.

> 
> At the start I thought it might make more sense to add it into an
> existing vfio ABI file. But looks it doesn't exist.
> 
> Curious why nobody asked for ABI doc for /dev/vfio/vfio, /sys/class/vfio, etc...

Oversight, there should probably be a sysfs-class-vfio file.  Thanks,

Alex

