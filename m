Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BA4C32C71
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 20:27:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48A4E10E31F;
	Tue,  4 Nov 2025 19:27:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="Xgq6KJRI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A455610E328
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 19:27:16 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id
 6a1803df08f44-880570bdef8so25885016d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 11:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1762284435; x=1762889235; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mUs2AdnuvvFczrN0XtEi+7TYEAruGEb9Cu+wb9VP03U=;
 b=Xgq6KJRIfMGAmk1cGMW+0V6mCv3dsISz6mZxfOkCYyuWofvwUph/wsi9XN7hEv1DPi
 JgQOdd8UmaWkMKqCLuPZWKRmpe7ltpxR0mMeVTHdGeFRnTnyVR+SjDR/l0g5TEo6vFyi
 7XB8sBExRALR/1GPRFcXY/CksJ6yANzUcCGsv7boG8Ik5Jy59fXZacDgjKkQu7DqpxJx
 Dg04Z5F3jiOvmsrYtebHxW1yzp8d8ZIa+BKoe4KLpZpySFKSSaG7XeQrJv1EeALYQVOv
 LwrqihtrIuV1sbwXAhW9gyGZ7lB4swWR8l3KbkAWMDIqtk0vGOLRux8XVVGBRharp+Bz
 Fh7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762284435; x=1762889235;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mUs2AdnuvvFczrN0XtEi+7TYEAruGEb9Cu+wb9VP03U=;
 b=rvqBhVRFujY352bk5tmzBTBnJS2FmsdQTCEh4yP5HmmyhSjY1u2X9ododTOtUbWDTg
 zkrIzUGWcUzx+ZKjicy5KjwZgBRurHXKaFKKbM8QIvbdMqUvcJC84utucUzWlBmSXMyA
 jdnpHnxpkFlOT/GDLQAHKjpOBzqjtGA4UCZci79eUfqD7UsL4Q4F/9fy67eVtBIJNFCY
 X7WadbygBSWpwGNCG7WfmCHlgx++ZigCKhgzLX4jWxw9KzPVBzPo2PQMlmNHor6xnm2j
 hC8l3D/4nMcDImhJgcocgFrjbzTGYPnxXmxGdGgPqSbsjcjrng3dKcg967gITWOEf50X
 GzIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEACUpDyM9LtdIVdd7Il/5iPgMLMha2/O0tuw4iIm5G4iFZzwGR/cfsp/j4xTQa5NlBGJ9pEinA0U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAKx6+VzFZJzxL2NpVR4J4HgvslMjFEgAcSMlk01qXuPQTDiB4
 HHL9RBTuSBR0BV+WnkRPiNxsfXjuNL3V7r5lJqr2n6ov+MWNGAg74Fr4mmRJylWZZN4=
X-Gm-Gg: ASbGnctDB4ya6vp0NpKjhZWzu7hHwo4Nzx+op71JJ2e0wbALvvgtakj7vCvEa3RwWjJ
 FEGubbEkX1P9yeIMOpWI3yOfhasXIlz7xy97HFRmTdRPm4p9dRyCsmUmf9195fhDMy9m0aX7Bj3
 RMfg46Ox9W0k2nVkSOH+pGCW4e2ZBHVKD4PmhZ6O37d5i/UDpQZcSIRVygLEDZRW8uz5d7lA/Hy
 nHDS/z5O/6zAucEhglc9XAxUqiFHouJz8aIfwAmBtoxTIN2BcsdGnCv2yHVjpv0zRT0kvKeD0Cq
 OD/iTXcCAkdvUnbuyPIWcb7ZSJF1GqfZ9Tgk2liaQ7Mghdtp8Vix1VaxlXL9uDk02hCQlusrMSF
 7ZWPeh7XK1WNIFJhjKAAgWevNd8f7Chd+YexfuaTXqvn6ikpvhgJKc0J4T2dvwBdMDcw2FPCObp
 GrEFN0YDmFPIg4voQNvRCvzW3aIxVxthxC38peC9rR9+TBkySo6GWE0GyX
X-Google-Smtp-Source: AGHT+IG0dhBeAR5RX27f2wfJWdOR7juDgLSbyDVJXq4BJqtIZIC/EimxFvt08yglge630ermzohXtg==
X-Received: by 2002:a05:622a:2d3:b0:4ed:18d5:2140 with SMTP id
 d75a77b69052e-4ed7262c198mr10018791cf.66.1762284435447; 
 Tue, 04 Nov 2025 11:27:15 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.120.4]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ed5faf6038sm22412071cf.11.2025.11.04.11.27.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 11:27:14 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vGMgU-000000073Cx-1Hyp;
 Tue, 04 Nov 2025 15:27:14 -0400
Date: Tue, 4 Nov 2025 15:27:14 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 Alex Williamson <alex@shazbot.org>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Yishai Hadas <yishaih@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v3 27/28] drm/intel/pciids: Add match with VFIO override
Message-ID: <20251104192714.GK1204670@ziepe.ca>
References: <20251030203135.337696-1-michal.winiarski@intel.com>
 <20251030203135.337696-28-michal.winiarski@intel.com>
 <cj3ohepcobrqmam5upr5nc6jbvb6wuhkv4akw2lm5g3rms7foo@4snkr5sui32w>
 <xewec63623hktutmcnmrvuuq4wsmd5nvih5ptm7ovdlcjcgii2@lruzhh5raltm>
 <3y2rsj2r27htdisspmulaoufy74w3rs7eramz4fezwcs6j5xuh@jzjrjasasryz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3y2rsj2r27htdisspmulaoufy74w3rs7eramz4fezwcs6j5xuh@jzjrjasasryz>
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

On Tue, Nov 04, 2025 at 11:41:53AM -0600, Lucas De Marchi wrote:

> > > > +#define INTEL_VGA_VFIO_DEVICE(_id, _info) { \
> > > > +	PCI_DEVICE(PCI_VENDOR_ID_INTEL, (_id)), \
> > > > +	.class = PCI_BASE_CLASS_DISPLAY << 16, .class_mask = 0xff << 16, \
> > > > +	.driver_data = (kernel_ulong_t)(_info), \
> > > > +	.override_only = PCI_ID_F_VFIO_DRIVER_OVERRIDE, \
> > > 
> > > why do we need this and can't use PCI_DRIVER_OVERRIDE_DEVICE_VFIO()
> > > directly? Note that there are GPUs that wouldn't match the display class
> > > above.
> > > 
> > > 	edb660ad79ff ("drm/intel/pciids: Add match on vendor/id only")
> > > 	5e0de2dfbc1b ("drm/xe/cri: Add CRI platform definition")
> > > 
> > > Lucas De Marchi
> > > 
> > 
> > I'll define it on xe-vfio-pci side and use
> 
> but no matter where it's defined, why do you need it to match on the
> class? The vid/devid should be sufficient.

+1

Jason
