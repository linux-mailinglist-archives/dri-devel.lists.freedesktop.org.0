Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BC3BFC011
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 15:02:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D47A10E77A;
	Wed, 22 Oct 2025 13:02:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="ExFSYp5K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2957D10E77A
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 13:02:17 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-890deb84f95so736674585a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 06:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1761138136; x=1761742936; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=q4+nptwg+b4cKjk/7eopK4TdMQlKGxJAx/ff9A8jy1A=;
 b=ExFSYp5KUnnPXzr1ReH81du9WvsJpeynxrVU1kh7Q/w11DRaXYsvJxG5BW//yfc0B1
 zBe4N9bZlUZ45FJQ7OvTKwGjrEIpwYmqPRKjqEmGze3QeQf11Dhxae7FbQYFbzuamc/e
 sB+1Q5u9mQiXe01BL8BFToAJhK/Iq8inUq5TmDCfRJ4wF9zE1IXUVEz946jnKp4bmktW
 2f0zALPqce1h4hf8a12KVR4qekTtaDgvtj+kclKU7yBuzLjMcFLtO69VNTJlCYAalkpw
 FKtyNKddrfD0d9nN5eY4QLYZefgu0L++ycmLTyZHjMcV/DliHqYqt5gl8r2+p/ONgSzD
 8Utw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761138136; x=1761742936;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q4+nptwg+b4cKjk/7eopK4TdMQlKGxJAx/ff9A8jy1A=;
 b=YKBUAyCAENS9BVeuRD6PUaAOibJYiGHeaBZXAbT5rFcIa35HJKm8ZZDuUdXGxV4RoI
 TZK41b20GtYqoNH8clGaOYuD5Hx8KlNNBcV/OOUZ71ckew0XJI3LTG1Bept/EsGjioV6
 r6xSZcSLOymCblfN4m1iLy+rZtxV8sDhcfAKkF2A5ZWrsnu+GcaTDv4Hi7gysYIpe1W+
 kSXnS1SBhlHZUaEEE9cpxZH78CaMnNKBtd5eYy8FkZiyrEC8c1duANvwwmYP6zvixLF5
 kDd1+b+Gds8h/4hUFIzxQGclF2kb9BqGp00wKbVTuGROvsCctEwqou6CibkKUlj8u0Cp
 cSUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWDxBuDhG6eF6UpnuGp4ZltkIY+tEVcYmAh5vmlyyZ/4XU34Mb/mRyT0lX+rCc2Aqp8AfHTqGwIEs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyhErmYlhKJ/gVRhnVzn3FMi0eIP6v3RBxwQRgxDifH+JcS2yvW
 YIWLK1zoWXJnWzanlo70mLNd89J/IzZo0luKbzvAGNl25Ai49EsZ8cyuIixz6WRc+Gg=
X-Gm-Gg: ASbGncvWKSyiWTY79ZLGBGvcxzmavLDB0JWXamu3haYwnhb5XT0ZBHGHinibPbNqlmA
 WujxTyTc2/fP3JoTJ/2jwgKqmORgQD2uz6HZO0zi3A9qRBfsL/7P10mf7YqYxrqjbvDSl9rZP1o
 SRNCzDHyCTJsiUIfVd9IhcgvtNMgkxKL5v4ARnxN6xW4Oxn6djRDDIqZeJG35B5Cy+V/gPze/Kx
 uE3/RZ4he3zPXaT/3+bbLDQ4zsqOrsoEXmH9dO0s+kWGpgsvBMx0FRcTLVoQW1VZUpNZC4MlIeF
 RxsLXYyox+7KmSRj9U+yKajKNoN4+zTniA3IGTanyN1JeiwQJy0KzyUpW4yZrYtk5ny+uVuUb6W
 znz7MY9jHCtj1/74nmm6inB9x/SANLKm6RCqSCgW5mgXaphU73UBfDU824FQdLKVwBbsjSO20W1
 7fE9DYbBsMrROps5L9jkNoucTZSECw0hUNFH1CXDDnXvyhxQ==
X-Google-Smtp-Source: AGHT+IE1fp7nysFYiIihX3mwCtCavGTxjXwNOEmPOD6TCnzoLGlT2YOfHP4QDFq10IqJKetGapnVeA==
X-Received: by 2002:a05:620a:171e:b0:891:bde8:8120 with SMTP id
 af79cd13be357-891bde882e8mr2006535485a.85.1761138126706; 
 Wed, 22 Oct 2025 06:02:06 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.120.4]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-87d028a9a48sm87209396d6.43.2025.10.22.06.02.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 06:02:05 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vBYTc-00000001288-0pdQ;
 Wed, 22 Oct 2025 10:02:04 -0300
Date: Wed, 22 Oct 2025 10:02:04 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Matthew Brost <matthew.brost@intel.com>
Cc: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Yishai Hadas <yishaih@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: Re: [PATCH 26/26] vfio/xe: Add vendor-specific vfio_pci driver for
 Intel graphics
Message-ID: <20251022130204.GD21554@ziepe.ca>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
 <20251011193847.1836454-27-michal.winiarski@intel.com>
 <20251021230328.GA21554@ziepe.ca>
 <aPgT1u1YO3C3YozC@lstrano-desk.jf.intel.com>
 <20251021233811.GB21554@ziepe.ca>
 <aPgwJ8DHhqCfAdpk@lstrano-desk.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPgwJ8DHhqCfAdpk@lstrano-desk.jf.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 21, 2025 at 06:15:19PM -0700, Matthew Brost wrote:

> Ok, I think I see what you're getting at. The idea is to call
> dev_set_drvdata on the Xe side, then use pci_iov_get_pf_drvdata on the
> VFIO side to retrieve that data. This allows passing whatever Xe sets
> via dev_set_drvdata between the module interfaces, while only
> forward-declaring the interface struct in the shared header.

Yes. The other email looks good:

  struct xe_device *xe_sriov_vfio_get_xe_device(struct pci_dev *pdev);

Should call pci_iov_get_pf_drvdata() internally.

And 'struct xe_device' can be a forward declared type that cannot be
dereferenced by VFIO to enforce some code modularity.

Using strong types is obviously better than passing around pci_dev and
hoping for the best :)

Jason
