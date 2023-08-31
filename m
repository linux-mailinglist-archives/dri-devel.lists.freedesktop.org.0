Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB2A78F278
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 20:22:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 928D910E1A7;
	Thu, 31 Aug 2023 18:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1AFD10E1A7
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 18:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693506115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kDd6agFPPBZ563tT5sO0tAnh1fA6v2usb5U/Ua+TJqU=;
 b=MLzT2lKF9dlG5mDqUs+P+QmurC7IL94GzPxuU1JJUuHN1JL9831HSOBEGitXfNSDy7MbBE
 nHxVCFdOEbyPXp7WgOOpwwlheP1YyHogWU5Rchvmr3PoR1Ahu4qgCfAM5NsMX7juhuCPJb
 zrVKJeYc6rVhhcgIwyG71s8Zf8xG71w=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-600-qga3fzUmOLCCIwPkdOQOUQ-1; Thu, 31 Aug 2023 14:21:53 -0400
X-MC-Unique: qga3fzUmOLCCIwPkdOQOUQ-1
Received: by mail-il1-f198.google.com with SMTP id
 e9e14a558f8ab-34ce664572cso7430085ab.1
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 11:21:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693506113; x=1694110913;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kDd6agFPPBZ563tT5sO0tAnh1fA6v2usb5U/Ua+TJqU=;
 b=Oqng+zt9utpW8NKTm1IyffNW39mpXRwqz23fx+odkVvnBC98jZ86/achp90kbP8eXF
 hDGJ6/ZAV1W5aAH/xN8nDNmjVmv0GVXJ0DRP6U/8am7L/5HoqMRVMYD2+eMENAFrB8pa
 kPZ69Coz0W5SXSijCroNlf8BTTJ3Rh5JSihdFXjeisrwK71h+fvxorGrCYl7yYCvv0RD
 SU0/TJWKQAHO/CnonTfe7fOfnk2kLL60tiophQ/Joltn4bDXteUe//DQXQSLDaYL33UN
 JL0yKWBsBL3vtvEi2Qgtc57V/cRNQ37B5QZ+vicaMNEinMcw3Goe0S7EVgOUhzaDZjUI
 YZmg==
X-Gm-Message-State: AOJu0YzVvBNsLaaf0S342c4+IdY07B5tiQmLtLa6NTMMIIqbxHmVoS7o
 QbR+84krFGSkWMbBxkLRHjnUi9aJ2XZQMp8JNrQ5jt9LhSkxa/OCSh/7TLl8nREBJ0oPc8JhGNb
 uxuTERRcl0ELBzqvPzEpzjnjgq4nF
X-Received: by 2002:a05:6e02:eec:b0:34c:e16d:6796 with SMTP id
 j12-20020a056e020eec00b0034ce16d6796mr329552ilk.16.1693506112917; 
 Thu, 31 Aug 2023 11:21:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8vns95higbpw7EtaVkzMpHzdrkGJ9Y2vvSqykV851tdz6ITxD49qYcHcmB/e7+Q3TZCiTtw==
X-Received: by 2002:a05:6e02:eec:b0:34c:e16d:6796 with SMTP id
 j12-20020a056e020eec00b0034ce16d6796mr329518ilk.16.1693506112687; 
 Thu, 31 Aug 2023 11:21:52 -0700 (PDT)
Received: from redhat.com ([38.15.60.12]) by smtp.gmail.com with ESMTPSA id
 w18-20020a92c892000000b00345da2c4776sm557598ilo.81.2023.08.31.11.21.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 11:21:51 -0700 (PDT)
Date: Thu, 31 Aug 2023 12:21:50 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v7 1/1] vfio/nvgpu: Add vfio pci variant module for
 grace hopper
Message-ID: <20230831122150.2b97511b.alex.williamson@redhat.com>
In-Reply-To: <ZPCd2sHXrAZHjsHg@infradead.org>
References: <20230822202303.19661-1-ankita@nvidia.com>
 <ZO9JKKurjv4PsmXh@infradead.org> <ZO9imcoN5l28GE9+@nvidia.com>
 <ZPCG9/P0fm88E2Zi@infradead.org>
 <BY5PR12MB37631B2F41DB62CBDD7B1F69B0E5A@BY5PR12MB3763.namprd12.prod.outlook.com>
 <ZPCd2sHXrAZHjsHg@infradead.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
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
Cc: Andy Currid <acurrid@nvidia.com>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Neo Jia <cjia@nvidia.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 John Hubbard <jhubbard@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alistair Popple <apopple@nvidia.com>, Ankit Agrawal <ankita@nvidia.com>,
 "shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Vikram Sethi <vsethi@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 "Tarun Gupta
 \(SW-GPU\)" <targupta@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Aniket Agashe <aniketa@nvidia.com>, David Airlie <airlied@redhat.com>,
 Dan Williams <danw@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 31 Aug 2023 07:04:10 -0700
Christoph Hellwig <hch@infradead.org> wrote:

> On Thu, Aug 31, 2023 at 01:51:11PM +0000, Ankit Agrawal wrote:
> > Hi Christoph,
> >   
> > >Whats the actual consumer running in a qemu VM here?  
> > The primary use case in the VM is to run the open source Nvidia
> > driver (https://github.com/NVIDIA/open-gpu-kernel-modules)
> > and workloads.  
> 
> So this infrastructure to run things in a VM that we don't even support
> in mainline?  I think we need nouveau support for this hardware in the
> drm driver first, before adding magic vfio support.

There's really never a guarantee that the thing we're exposing via the
vfio uAPI has mainline drivers, for example we don't consult the
nouveau device table before we expose an NVIDIA GPU to a Windows guest
running proprietary device drivers.

We've also never previously made a requirement that any new code in
vfio must directly contribute to supporting a mainline driver, in fact
I think you'll find examples where we do have such code.

This driver is proposing to expose a coherent memory region associated
with the device, composed as a PCI BAR, largely to bring it into the
vfio device model.  Access to that memory region is still pass-through.
This is essentially behavior that we also enable though mdev drivers
like kvmgt (modulo the coherent aspect).

I assume the above driver understands how to access and make use of
this coherent memory whether running bare-metal or virtualized, so
potentially we have some understanding of how it's used by the driver,
which can't be said for all devices used with vfio.  I'm therefore not
sure how we can suddenly decide to impose a mainline driver requirement
for exposing a device to userspace.  Thanks,

Alex

