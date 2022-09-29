Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 925565EFCFB
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 20:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D17410EBE5;
	Thu, 29 Sep 2022 18:24:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E22810E00C
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 18:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664475874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BoITIusWH1pgiQYYyYgg2aTCkDBnXRgVNx9UWZzrGmA=;
 b=OqcMvHd+HH89EI8UXhMCTpgc95JY4q2oPDPDMHN+rG+xKoIKL6KQo3Q1ABrYRtnFvu41+l
 JiJvhpYBHgd7ITHa6cpubjXPTQdb3dxfutlcJURTUvmseF9waOP0/Zdcov0RCPcG3FaM2e
 gjF7RIegpRW3AWLNPVEbMpYzSyCj2xY=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-539-CfjULWA7PaaBF1d2tSXAWA-1; Thu, 29 Sep 2022 14:24:33 -0400
X-MC-Unique: CfjULWA7PaaBF1d2tSXAWA-1
Received: by mail-il1-f198.google.com with SMTP id
 i3-20020a056e020d8300b002f90e6fedcfso1707019ilj.12
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 11:24:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date;
 bh=BoITIusWH1pgiQYYyYgg2aTCkDBnXRgVNx9UWZzrGmA=;
 b=5QlgLEGcaJk7E0o7r1oEaxpxsg/PB5GJkcZXAMPEMkJIh5tCqch0Tu6UiB7sqR3eHM
 pdvpT5y1ZGQWzR3OaGjuhwuHo8FmfMRb+FsNvF8B/aSSrRmS2slsgqAxgnIjPtb4eKh0
 0sozeHCfffQF1nBCVPBEVjPPjh+o8N2N5VekatE+FFNpPIXx9qza+eVao0gqqylRdl3C
 p+vRh9VrPa5QtDafHMQyn0ven/dYxuJKjGpA4eRNMd0tqJ/5ZC9jThMoCO/3RAOpEL5b
 7VJW436b9xL/bSJB+L5PgQxRcNiKYin5usYhsO3tkGtzhhUwuQm2PDI32BIlQoYDVFmo
 CnCg==
X-Gm-Message-State: ACrzQf20i1QCoYlSW7dLsSZYF5qkCFjiPYIyIUpgUGlH/QAHzQ485b1/
 Dzs60d/ck9+F/Up/KKkcNtbo8sLJLjZpKHKEo3lg9Hk7JJTVwggc7h0ttD6k+S2DeyuGsYZ+AWe
 F1HN+jngDrwt3sEbMzZIAY2ChZWtP
X-Received: by 2002:a05:6e02:19ce:b0:2f1:68a6:3bec with SMTP id
 r14-20020a056e0219ce00b002f168a63becmr2392110ill.78.1664475872964; 
 Thu, 29 Sep 2022 11:24:32 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7KUOQo8AbbarGobEgnbxdcS5bS2mn744LEcpjpU+rvkCIe35jyhAfEJ5Pm5FWlRH0iLBHEPg==
X-Received: by 2002:a05:6e02:19ce:b0:2f1:68a6:3bec with SMTP id
 r14-20020a056e0219ce00b002f168a63becmr2392060ill.78.1664475872712; 
 Thu, 29 Sep 2022 11:24:32 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 f13-20020a05660215cd00b006a1fed36549sm96051iow.10.2022.09.29.11.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 11:24:31 -0700 (PDT)
Date: Thu, 29 Sep 2022 12:24:27 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v4 15/15] vfio: Add struct device to vfio_device
Message-ID: <20220929122427.3a3bca9a.alex.williamson@redhat.com>
In-Reply-To: <YzXaxPpkc+90Xx+T@ziepe.ca>
References: <20220921104401.38898-1-kevin.tian@intel.com>
 <20220921104401.38898-16-kevin.tian@intel.com>
 <20220929105519.5c9ae1d8.alex.williamson@redhat.com>
 <YzXaxPpkc+90Xx+T@ziepe.ca>
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
 Eric Farman <farman@linux.ibm.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Kirti Wankhede <kwankhede@nvidia.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Longfang Liu <liulongfang@huawei.com>, Christoph Hellwig <hch@infradead.org>,
 Yi Liu <yi.l.liu@intel.com>, kvm@vger.kernel.org,
 Leon Romanovsky <leon@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Kevin Tian <kevin.tian@intel.com>,
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

On Thu, 29 Sep 2022 14:49:56 -0300
Jason Gunthorpe <jgg@ziepe.ca> wrote:

> On Thu, Sep 29, 2022 at 10:55:19AM -0600, Alex Williamson wrote:
> > Hi Kevin,
> > 
> > This introduced the regression discovered here:
> > 
> > https://lore.kernel.org/all/20220928125650.0a2ea297.alex.williamson@redhat.com/
> > 
> > Seems we're not releasing the resources when removing an mdev.  This is
> > a regression, so it needs to be fixed or reverted before the merge
> > window.  Thanks,  
> 
> My guess at the fix for this:
> 
> https://lore.kernel.org/r/0-v1-013609965fe8+9d-vfio_gvt_unregister_jgg@nvidia.com

Indeed this seems to work  I'll look for acks and further reviews from
Intel folks. Thanks!

Alex

