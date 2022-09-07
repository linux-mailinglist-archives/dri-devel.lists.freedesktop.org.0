Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B09C85B03AF
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 14:11:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411C010E749;
	Wed,  7 Sep 2022 12:11:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02A4E10E748
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 12:11:36 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id b9so10278816qka.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Sep 2022 05:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=WIB8a4RMKIbsQgzbAFRigZUlzKpMzaK/mPjLu18jivg=;
 b=HP3rDaJjD8dZmYIHrjdNkoDnmUw7g9uCc4vHBTmXsOrDzTaDzvVkGROQU4JiMIG6SF
 qudhCqJZhmdnGxt9Qchu2u/Kb1AzirulrNQKlif2VVN775xzycYMvQlIejXeuRl9FUCV
 B3sY2DzX6HPglZ4Tt6xcS2UP6H2y+QTtsv8hPxcu7qACinqcAbBEosQlGwToao3GbIXm
 9n3zqjh8c5lL3+Pt3dwF6hwztXdonsbyY8QaXeKX/rwCr1nuqyp6n1gg8cgYPm+00Q2X
 HA4OSsdsbupGMsvkpLpJhuXakDbiiPMBOk6rzxqSUV5A1n0+hK7OQ2N2NVdOzCqW+cgi
 GP2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=WIB8a4RMKIbsQgzbAFRigZUlzKpMzaK/mPjLu18jivg=;
 b=UwgeMBCx02/lFJ1sOkFbfTrY79yx274UtlDDscYqLCrS52CLBvEdEmjXDbCgc06v6f
 9SmpUZFP6TXJlKIHN7Nr5F82qtDnoL2SSTeKwL6Jmf2S47rdr/7puPG1HdSRliolqCZF
 1xDfGNNyx3FMfqhi9vRSpt0ipN6OY54KaUvEdLS2jedpKNnQpLME4cbu41EG/L+kX6jm
 hjRHW0pPsndY1uOF3sgojgvL2XF1KnG4x+msIUz6euLpoRnF9LVkuPCoG39F3uL7L8GY
 WUmONP2tBjQ3aPqx1UFz5DwOBb7N3qm1eMhyypOmGVA8UTS4hWjJff/CpJViN6ftq9vD
 4gxw==
X-Gm-Message-State: ACgBeo091B5Sz7UtOzJAzuxzSzJszvhD2pZiRbpwm4I+rUzfpH1d8SoI
 4tXDEi+Qa3vOcBzIOUbyM5XdmA==
X-Google-Smtp-Source: AA6agR6Aqb9OjhZTxuJwTHCrpwMtc8lM+if3ZhE4tHVst9Nj0UDP4AirE5WpW+co8I96BvAuRRT3Qw==
X-Received: by 2002:a05:620a:1402:b0:6bc:2055:6da0 with SMTP id
 d2-20020a05620a140200b006bc20556da0mr2302837qkj.534.1662552695680; 
 Wed, 07 Sep 2022 05:11:35 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129]) by smtp.gmail.com with ESMTPSA id
 n3-20020a05620a294300b006b953a7929csm14765165qkp.73.2022.09.07.05.11.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 05:11:34 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1oVtu2-008YHj-0u;
 Wed, 07 Sep 2022 09:11:34 -0300
Date: Wed, 7 Sep 2022 09:11:34 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v2 01/15] vfio: Add helpers for unifying vfio_device life
 cycle
Message-ID: <YxiKdh6EDBZnTAGH@ziepe.ca>
References: <20220901143747.32858-1-kevin.tian@intel.com>
 <20220901143747.32858-2-kevin.tian@intel.com>
 <YxcV05AVN4kqdPX6@infradead.org>
 <BN9PR11MB5276EE6209C1E3D4662368DC8C419@BN9PR11MB5276.namprd11.prod.outlook.com>
 <YxiGpryRNrxvEoiY@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YxiGpryRNrxvEoiY@infradead.org>
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Eric Farman <farman@linux.ibm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Longfang Liu <liulongfang@huawei.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Liu,
 Yi L" <yi.l.liu@intel.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Leon Romanovsky <leon@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, "Tian, Kevin" <kevin.tian@intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Abhishek Sahu <abhsahu@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 07, 2022 at 04:55:18AM -0700, Christoph Hellwig wrote:
> On Wed, Sep 07, 2022 at 12:43:30AM +0000, Tian, Kevin wrote:
> > > From: Christoph Hellwig
> > > Sent: Tuesday, September 6, 2022 5:42 PM
> > > 
> > > What is the point?  This adds indirect calls, and actually creates
> > > more boilerplate code in the drivers.  i.g. when using this code there
> > > is more, and harder to read code.
> > 
> > The point is to align with struct device life cycle when it's introduced
> > to vfio_device. The object is released via put_device() then what would
> > be the alternative if the driver doesn't provide a @release callback?
> > 
> > and with @release then naturally @init is also expected.
> 
> No, with a release no @init is expected.  The init method is one
> of the major obsfucations here, only topped by the weird
> vfio_alloc_device macro.  Yes, that saves about 4 lines of code
> in every driver, but places a burden on the struct layout and
> very much obsfucated things.  Without vfio_alloc_device and
> the init method I think much of this would make a lot more sense.
> 
> See the patch below that goes on top of this series to show how
> undoing these two would look on mbochs.  It it a slight reduction
> lines of code, but more readable and much less churn compared
> to the status before this series.

I've seen alot of error handling bugs caused by open-coding patterns
like this. People get confused about what the lifecycle is and botch
the error unwinds, almost 100% of the time :\ They call kfree when
they should call put_device, they call put_device before initing
enough stuff that the release callback doesn't crash, double free
stuff by calling put_device at the wrong point, and so on.

The advantage of init/release is the strict pairing and the core code
helping get the error unwind right, by not calling release until init
succeeds.

The advantage of the vfio_alloc_device() is not saving 4 lines, it is
giving the drivers a simple/sane error handling strategy. Goto unwind
inside init, release undoes everything init does and the probe path
only calls put_device(). It is simple and logical to implement and
hard to make subtle bugs.

Specifically it eliminates the open coded transition of kfree to
put_device that seems so difficult for people to get right.

netdev has done a version of this, so has rdma, and it works well.

Jason
