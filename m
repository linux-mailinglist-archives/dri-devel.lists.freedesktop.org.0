Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37908971BAD
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 15:51:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A1B10E591;
	Mon,  9 Sep 2024 13:51:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="QWz93Pkk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6072A10E595
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 13:51:55 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-7a9ac2d50ffso154498685a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Sep 2024 06:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1725889914; x=1726494714; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yj7+HNUhZ42zQ7e1zqARXsVl9jwOBImumTxZ0tEXKC0=;
 b=QWz93Pkk9oNFTPFHLreckKvACx3AVrU/xbfjpDOQXdsA3K+L9eGQlkzrDX8avqrDgM
 VV/FJC6qrxB0mlYnW68VacjWRhjDJAOXa9/Bvdo9t5MvK2O01Y9JVpBnfPgpYHisrEBk
 CNb2MAlHlwxTmcs1BZY9aBfkRETV57rFkvAJJ9IovKwxOznTJrApIzAx5w1UZXyRgiK6
 1PTEw66yPVH1hCrepJBKE1+cxregoDDkW2FbbLioESKhxtTYIUuyey2TrdrlrkyavTsa
 fkv15icCOc6xz25V4LMahnIO3VOF9SJmrPPV42wClEx8lPElFwC82ZN+rF2MPWjZpu46
 libQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725889914; x=1726494714;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yj7+HNUhZ42zQ7e1zqARXsVl9jwOBImumTxZ0tEXKC0=;
 b=Buz1xHsKlInuQZKGE1LlxymcgXS6WZQSnkzZk8c+L/x3hQnN1evQ+5CAeGiYGDLmbw
 8/erZix/Kc5DGtrRlCw1BLJstJJyFGCz0tsBno+lz3wo6hw6L9fTph/HjPXE8aFRugqr
 g4twwWRjRgPDXDfaLx/zVRX5XI6OtEiZyvAxQRkBMro0+e9hIkb00330ceM2WGBoCXHn
 sQ89uY9UPvrDleEZDcxjh56UGcsT4odk0oEUksiIZsmIpiW/DLIcZ437CXsjeZ0upkYx
 uOif/0StVBQpZmLP/T0LStmpNPO5XI3jWKKlln5bMq4YeibaMaFi2/qg7XHA4bq2qwD5
 CPwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXXDpbwVGHaXqeGqPy/IbC6nGCItfuP1+j++dbYTclORaU2wlPjSsGDMIXxAwXmL9iugmLpHEWMAw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUJlirdEYYUxaj0RsbvdeCWZbF93MObdWd4W+IkmHhCNy3btz3
 1+Mcz6l+qSJGc6Kt2iWDkRP4AAb9sENsJ+viDgDs+7OHbimXI53ZDhTkE2jFbBc=
X-Google-Smtp-Source: AGHT+IE32skbFpKLVZQvvKRGIbOT+Lk4glz9hLQYid2tc58+roSuuIWcYGTezpJn4PsYDlHvh90irg==
X-Received: by 2002:a05:620a:24d3:b0:7a9:b80b:81e with SMTP id
 af79cd13be357-7a9b80b0f7dmr521832985a.10.1725889914151; 
 Mon, 09 Sep 2024 06:51:54 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.80.239]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6c5343295f7sm20958506d6.21.2024.09.09.06.51.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 06:51:53 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1sneo4-000es1-U3;
 Mon, 09 Sep 2024 10:51:52 -0300
Date: Mon, 9 Sep 2024 10:51:52 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Lyude Paul <lyude@redhat.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Lu Baolu <baolu.lu@linux.intel.com>, Karol Herbst <kherbst@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Sandy Huang <hjc@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Kevin Tian <kevin.tian@intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] drm/nouveau/tegra: Use iommu_paging_domain_alloc()
Message-ID: <20240909135152.GA105117@ziepe.ca>
References: <20240902014700.66095-1-baolu.lu@linux.intel.com>
 <20240902014700.66095-2-baolu.lu@linux.intel.com>
 <a43c31da6a6989874eb0998dc937d7a611ec542c.camel@redhat.com>
 <20240905132459.GG1909087@ziepe.ca>
 <243808ad949823a0d64cd785ed05a375ccdba096.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <243808ad949823a0d64cd785ed05a375ccdba096.camel@redhat.com>
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

On Thu, Sep 05, 2024 at 12:26:31PM -0400, Lyude Paul wrote:
> I did take the one patch - but I'm happy to push the others to drm-misc
> (provided they all get reviewed. 2/3 seems to be reviewed already but not 3/3)

The whole series is acked now, can you pick it up please?

Thanks,
Jason
