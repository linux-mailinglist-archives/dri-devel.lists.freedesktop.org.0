Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3856D5A725C
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 02:22:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B80EA10E3F1;
	Wed, 31 Aug 2022 00:22:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1C3A10E3F4
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Aug 2022 00:22:34 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id l5so9890939qtv.4
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 17:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=Lh16XHf3++MO2LHtmJix5HtkGiD8BuHOsdyLRFTSe/A=;
 b=XOSFBC16BR5ImEycq6Wxwt1WfjQIyjlHjo1i7V7SOlXSW7tiL+kBgt85+T6v4LbJL0
 qpcT3EFRoQSSF59qi4Crv72crwblNLEVb88+boK4Qw0Gs/leowXS/n7K6EjwDf7a/HER
 q2sBk9M9X08hJphAz+SsXYOzkqISAcKFgWTVN449dwieuLckpF7BA14iO5l3RzFjXP4o
 gyl6FF0GxEX+/UPEyTric08qzhnPSPhsonOcIUIG7An6PY2X/GggY3Irn3C+2HX48htF
 JrguD1dDyhidTXj/hx3ft/CekMn3SB332Z09qXmb7OuMbunnSgJPt4pmcsFpQLNd4Qko
 FcRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=Lh16XHf3++MO2LHtmJix5HtkGiD8BuHOsdyLRFTSe/A=;
 b=LzHJy6x0Iyu1NKVy8zbIeJQm+HfANinwDXBRd1nAcq6Oex7hYE/5mVvtwD0W4P9USh
 XRSuxysDukmvITFgGN/72Vt2BciNfGbf28+O8ay/YsLd9uhpgr76Nf6ONCZbcN7s+w7k
 BUeo+zo97wVpwaPLnHVRa87BD7oW/kkNrkxfTrOtL6gzkvwtxtNXLceP83iQ99L2DYpj
 D7pRf95M9E/RuiIATENQ71gB5zKVTMujjvlG3ykKsdBNruhYGUifbzvu0NUjvEyyPRKQ
 4Wbz7aLjPbKvsc2iaY5AJWB2sJtkPXEsrqLyK+jCu6wgr0J9iFFd+/tgbpuzgm+1EWCO
 JYiw==
X-Gm-Message-State: ACgBeo0Z3eRZH+XpCaBN2PJDxcI6GWXVnG+LLhQwdLhs7AdVP22EsC6m
 RG7ab/Sjk2YRynir04zPsCTKVg==
X-Google-Smtp-Source: AA6agR7GGtySRj3a31twDnb1mH9EFCJRgojy3h78HnLRKB2gSIxypXh8P0l2OQoGAZF+RRxoexfLDw==
X-Received: by 2002:a05:622a:5c8a:b0:344:ba8f:8892 with SMTP id
 ge10-20020a05622a5c8a00b00344ba8f8892mr16671557qtb.297.1661905353877; 
 Tue, 30 Aug 2022 17:22:33 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129]) by smtp.gmail.com with ESMTPSA id
 bk42-20020a05620a1a2a00b006aedb35d8a1sm9280435qkb.74.2022.08.30.17.22.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Aug 2022 17:22:32 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1oTBV0-0040ym-RW;
 Tue, 30 Aug 2022 21:22:30 -0300
Date: Tue, 30 Aug 2022 21:22:30 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH 10/15] vfio/fsl-mc: Use the new device life cycle helpers
Message-ID: <Yw6pxrS1zb5JKt8q@ziepe.ca>
References: <20220827171037.30297-1-kevin.tian@intel.com>
 <20220827171037.30297-11-kevin.tian@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220827171037.30297-11-kevin.tian@intel.com>
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
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
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

On Sun, Aug 28, 2022 at 01:10:32AM +0800, Kevin Tian wrote:
> From: Yi Liu <yi.l.liu@intel.com>
> 
> Export symbol of vfio_release_device_set() so fsl-mc @init can handle
> the error path cleanly instead of assuming certain vfio core API can
> help release device_set afterwards.

I think you should leave it as is, the "device_set" cleanup is just
something handled completely internally to vfio

If ops->init fails then we expect the core code to clean the
device_set, and it does because it calls vfio_init_device() already.

Having a single weirdly placed release in the driver is pretty
confusing, IMHO.

Jason
