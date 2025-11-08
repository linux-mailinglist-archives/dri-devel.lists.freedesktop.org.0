Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C08C42395
	for <lists+dri-devel@lfdr.de>; Sat, 08 Nov 2025 02:11:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F41E10E1CF;
	Sat,  8 Nov 2025 01:11:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="dTYQqrkk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4679F10E1CF
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Nov 2025 01:11:45 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id
 af79cd13be357-8906eb94264so139917385a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 17:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1762564304; x=1763169104; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Cf4zf8TV/EOP/YsPQoWXgFR8ZzXqCqkCmbhECODLpcg=;
 b=dTYQqrkk6UNSBRFQO8OF3PYOcxwRYyg4FCKtI8lzq0mdJ+jcu4lOV7sW+/N8amp9rF
 1wvQaxh/+S+qZpC9DxA6U0KvhFzQSEA+l8XzbHZZLimP7P6bae2ddHjWF2HPdsA1E7aG
 g0CA/l1/Y4DZVa6jHTt6cRkLn1b3yez9RGIiWlt5UP5JrceDWs6SRG6hLKM6cqwovvzg
 WBK+Xvhy3hImn9S2PgChumv+IC16Xn2K8cA4pWUIsMyVBndFt8lOUk7GQ7hcw4Iup4nU
 BJi9EHKdmrzyIuI8x3b/PALwND5fbUPpSnn9qAhNozZ6m9PKixWCmObsu3zGKed0okCu
 WE3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762564304; x=1763169104;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Cf4zf8TV/EOP/YsPQoWXgFR8ZzXqCqkCmbhECODLpcg=;
 b=Eb69BCP7TW3drW5xkXxez+s/bpEwGoRgkixpSSCgsW1mFOtFvNGVHRONdWuCuB2fv0
 rTru9uyuvEkK+w1yPsAN3HgTSd2cXRDpIHy29CPGaa/peIUiiegdJwski5RvI2RLL++/
 GebE1vjqq3dPLMfNGa8tC6spmQ9egoDXnUjdLXLYZyBVBVesK3mtmbpaAbhypEec1Knq
 NqDNFtqdgoJgKdfC5Yx+KxtAGV4zSG7fovtYAZs37olMrzLF8uzVNy8Mub4bqTBSn3LC
 xM1I+uILxBSK+0pS8eqUA3i02jXuVQOMLTEtYN4Wyp9ZX/X4NXPYEWPeGusuCDSubPIo
 azPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJp9iKpVvp0Ix7j/f7dGnhqObgg60a4YbmdnTnOW+yjwz7wH5hcT2cA9lvB3C5EQDn2Ci3u1V6mCs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6wYhGzEVHElRTsfToSpb8M0CFpw5YhPuaecA+dP2ZDwW8Jl2R
 u8MsZiCPqSMMREqDoeNWlMq/3Vqh6k2JK2TLaig8OTW34Tx1ZdvRzpc3zbCLFqHrCjg=
X-Gm-Gg: ASbGnctDn7a2qrA3HPqptxWg5xku0mNUtMIur8bk4EA8Mypun5TVClbk+uM3RP3okp1
 joVOGoyXc+bnL6X6R4wugpXFBtgKvky0DJM6lGVfFvbUs0UfEGAe1bcLtRxanNg83Cop3C4qua2
 DuvY+bgkrFPsU7DdtL23OMjGKUKM1R/BnwJsyPjh8O7sH7ssKjIq4gPtxXgYKiKR9bV6PcVCHfQ
 bDMteT9sqifIusNzYO8hUmEFMb2Z0JiTn2AFDE85xzN6dgHq8sIBsF3+8HdFu3VdmMj6uAmd+t7
 jAAURsqrPODZqzO1Zn79MmlHs/8JnO/5ZpOjLEOwZivMZiWeJJuE+trAPj9YsnUQ9t78NCZFDXQ
 etRVD4fkfqX14wA5snqvHuAYdDdtFHo2GsUWEPO0O/WYKzR3c/Rd67zwYT3zvZ4GTXSlWu8A+g2
 CqrevGexwhLxYJ6AnwS7CUC1twZ/ROFnV4wsxZbTdVE9pNffPnm2b5Apec
X-Google-Smtp-Source: AGHT+IHgQm4crSoFbOP6aPyQmLcW59espnioyKWZw+sam6UcNVlWlMqDlHJNn7lZhEfcTWvrH5yFgA==
X-Received: by 2002:a05:620a:209b:b0:8b2:2719:ed33 with SMTP id
 af79cd13be357-8b257f3c71amr135197285a.46.1762564304210; 
 Fri, 07 Nov 2025 17:11:44 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.120.4]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8b2355e615bsm530534085a.19.2025.11.07.17.11.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Nov 2025 17:11:43 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vHXUV-00000008NdU-17Dq;
 Fri, 07 Nov 2025 21:11:43 -0400
Date: Fri, 7 Nov 2025 21:11:43 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: "Winiarski, Michal" <michal.winiarski@intel.com>,
 Alex Williamson <alex@shazbot.org>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Yishai Hadas <yishaih@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "Brost, Matthew" <matthew.brost@intel.com>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Laguna, Lukasz" <lukasz.laguna@intel.com>,
 Christoph Hellwig <hch@infradead.org>,
 "Cabiddu, Giovanni" <giovanni.cabiddu@intel.com>,
 Brett Creeley <brett.creeley@amd.com>
Subject: Re: [PATCH v4 28/28] vfio/xe: Add device specific vfio_pci driver
 variant for Intel graphics
Message-ID: <20251108011143.GE1859178@ziepe.ca>
References: <20251105151027.540712-1-michal.winiarski@intel.com>
 <20251105151027.540712-29-michal.winiarski@intel.com>
 <BN9PR11MB52766F70E2D8FD19C154CE958CC2A@BN9PR11MB5276.namprd11.prod.outlook.com>
 <7dtl5qum4mfgjosj2mkfqu5u5tu7p2roi2et3env4lhrccmiqi@asemffaeeflr>
 <BN9PR11MB52768763573DF22AB978C8228CC3A@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20251108004754.GD1859178@ziepe.ca>
 <BN9PR11MB52768BF0A4E6FA1B234E33108CC0A@BN9PR11MB5276.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB52768BF0A4E6FA1B234E33108CC0A@BN9PR11MB5276.namprd11.prod.outlook.com>
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

On Sat, Nov 08, 2025 at 01:05:55AM +0000, Tian, Kevin wrote:
> > From: Jason Gunthorpe <jgg@ziepe.ca>
> > Sent: Saturday, November 8, 2025 8:48 AM
> > 
> > On Fri, Nov 07, 2025 at 03:10:33AM +0000, Tian, Kevin wrote:
> > > > To me, it looks like something generic, that will have impact on any
> > > > device specific driver variant.
> > > > What am I missing?
> > > >
> > > > I wonder if drivers that don't implement the deferred reset trick were
> > > > ever executed with lockdep enabled.
> > > >
> > >
> > > @Jason, @Yishai, @Shameer, @Giovanni, @Brett:
> > >
> > > Sounds it's a right thing to pull back the deferred reset trick into
> > > every driver. anything overlooked?
> > 
> > It does seem like we should probably do something in the core code to
> > help this and remove the duplication.
> 
> from backport p.o.v. it might be easier to first fix each driver 
> independently then remove the duplication in upstream? 

If it hasn't bothered anyone yet I wouldn't stress about backporting..

Maybe those drivers do work for some unknown reason?

Plus it is *really* hard to actually hit this deadlock..

Jason
