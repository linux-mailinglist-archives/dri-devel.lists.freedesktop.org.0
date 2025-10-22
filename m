Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D816CBFBA62
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 13:34:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B839510E75E;
	Wed, 22 Oct 2025 11:33:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="VfuBTdU6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E275D10E75F
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 11:33:57 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-88f239686f2so852006885a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 04:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1761132837; x=1761737637; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YzMuyf16b+hUTaqBectyipp8bmob3UCKigy6YT4wr2s=;
 b=VfuBTdU6k4R5IT39g3jwXjx4co8d/kE4pSh/OUi3QthigDGGWzpibkru/QzhDu3jFX
 Dw2mX2cFz2ioV9Vui57+qOhaNRmrnvPF2075kaJB+vVSzYWTpQ9mQvvH43UengjRi+FG
 Ce3MR2SPF5zJPB6W8P54ILUxXH+9yyxNsxMmIVmzCdObwRcZ2o2jmxc5k/FdIbKXEe5N
 WbOzTXMI8zlJscqJXiPdkEGmjXsbsAO7KE0L7/gk03R95J+UaAxVH4UG1spPIJQ9WevN
 tWKUUrgXROYIzYbffRl3VanorfAVo+eqvj8d/bLPnr53GDepVZqc9Ij7B55Bwg7Zm20e
 WS8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761132837; x=1761737637;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YzMuyf16b+hUTaqBectyipp8bmob3UCKigy6YT4wr2s=;
 b=vJxp5uJRitR1zBUT6dtR5RQS1L4wHqrg3MifzFfWw4GRI0eRcZGtuTQd+/mQcQ/BMt
 bJsNCCdAVIdvcKNJlLflchmr/H/P5DzcFxUnY/XFT1dCX30XSgaFQPQiKjaIKu0BF7i5
 9WR+wzB+qHAoq35iIUu+Qh2py5b0ek7HyclLooZ+9/PgGM43bkPad9QPrWoceHlyVsPF
 QyDmsfzLfUcd0wKxFc51RhP3tRVIw8DEq/g+wvInmI1XBE86Z5zsM6NIY2bRDn7ITA5V
 7GZ45tSokzuBRkQ7fyMPHxbgwiz538zZSGelF/wDdYwXGhACzE4A5B43QleBhM2dpUfj
 dPIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhIB/dqWHEpYscbQR+01Ks//+mg0bXf7nP4Fhw5w8CxI84CyZR5TZMWqwUXoZn6qmkRDTlwu4aXlk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzu3UVFbmRZ6G6ASiei5qMvJ8750LeGYCvpKFxJnRnOEeHetLkU
 TRFPA7YlyZh4Wq2ecK2gRou+OUp3x47iEMaTbMtGF9ZQ7WjtvsnL5zBeHY0julnG8Mk=
X-Gm-Gg: ASbGncun+yq0rEdGoLoRoKKOJsdPIHrHirCFRx/F34r1LzXtulWBDHHaC2VYxIFMm2n
 g+zKc4rMNXMtzZ9hFc8eCEneoBtgQFUb2YWe7u1TmU1nkhqWQt/khIOx5WnJKFLAFsYOY0Zz7D7
 3Pfa+Nq57FCSk/qflJRg9gfn+nHhwRKXFk6Q9qekOgyYsOIUfT4hjqFf32BUk38efZWgfQGRPeE
 GhMF/iCiOJuBUXK8ZBtjhvHf0DXBhy0IAm0n2KpkzVrxighTIqtGoTeVTub46FNgig8s9U9eB25
 VrulEZulqADceLYXBq/JzyH0qPd54B+TIz1+mJf/q6lM2x9rhIB1q1g/88Onj07uJWDV00esYNy
 ddXopYEA9m29dcKz3/CzWKngESr0yGDCSr1S+1kBFvNX/I5EPSZwtb6fvsdZRB6GEBc7OJ+hUHF
 i/hhC3kvLASbfTCPlZlEQx4Q5N4x6oMHz09KodEK+7Sbq0yw==
X-Google-Smtp-Source: AGHT+IGcoJwXXqdtQtkm+G14JGdvXbaacdM5SDyQ7Xv4vGpp8puPf7A40E+xXVk1VpdF6uCqgx+zZQ==
X-Received: by 2002:a05:620a:4694:b0:891:ef6d:5231 with SMTP id
 af79cd13be357-891ef6d5476mr1901298585a.49.1761132836585; 
 Wed, 22 Oct 2025 04:33:56 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.120.4]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-891cf0af3afsm962961585a.36.2025.10.22.04.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 04:33:55 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vBX6J-000000011YP-0ehF;
 Wed, 22 Oct 2025 08:33:55 -0300
Date: Wed, 22 Oct 2025 08:33:55 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Cc: Christoph Hellwig <hch@infradead.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Yishai Hadas <yishaih@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>, intel-xe@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: Re: [PATCH v2 26/26] vfio/xe: Add vendor-specific vfio_pci driver
 for Intel graphics
Message-ID: <20251022113355.GC21554@ziepe.ca>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
 <20251021224133.577765-27-michal.winiarski@intel.com>
 <aPiDwUn-D2_oyx2T@infradead.org>
 <ilv4dmjtei7llmoamwdjb3eb32rowzg6lwpjhdtilouoi6hyop@xnpkhbezzbcv>
 <aPib0tHn1yK9qx2x@infradead.org>
 <4e6ctwhyax2v65mgj3pud5z3vz75yputis6oufju45iptzaypq@zaxo42l23o2r>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4e6ctwhyax2v65mgj3pud5z3vz75yputis6oufju45iptzaypq@zaxo42l23o2r>
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

On Wed, Oct 22, 2025 at 11:12:05AM +0200, Michał Winiarski wrote:
> On Wed, Oct 22, 2025 at 01:54:42AM -0700, Christoph Hellwig wrote:
> > On Wed, Oct 22, 2025 at 10:52:34AM +0200, Michał Winiarski wrote:
> > > On Wed, Oct 22, 2025 at 12:12:01AM -0700, Christoph Hellwig wrote:
> > > > There is absolutely nothing vendor-specific here, it is a device variant
> > > > driver.  In fact in Linux basically nothing is ever vendor specific,
> > > > because vendor is not a concept that does matter in any practical sense
> > > > except for tiny details like the vendor ID as one of the IDs to match
> > > > on in device probing.
> > > > 
> > > > I have no idea why people keep trying to inject this term again and
> > > > again.
> > > 
> > > Hi,
> > > 
> > > The reasoning was that in this case we're matching vendor ID + class
> > > combination to match all Intel GPUs, and not just selected device ID,
> > > but I get your point.
> > 
> > Which sounds like a really bad idea.  Is this going to work on i810
> > devices?  Or the odd parts povervr based parts?
> 
> It's using .override_only = PCI_ID_F_VFIO_DRIVER_OVERRIDE, so it only
> matters if the user was already planning to override the regular driver
> with VFIO one (using driver_override sysfs).
> So if it worked on i810 or other odd parts using regular vfio-pci, it
> would work with xe-vfio-pci, as both are using the same underlying
> functions provided by vfio-pci-core.

I also would rather see you list the actual working PCI IDs :|

Claiming all class devices for a vendor_id is something only DRM
does..

Jason
