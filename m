Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD52C37F28
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 22:19:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9C0610E7AE;
	Wed,  5 Nov 2025 21:19:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="atiR2569";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0244F10E309
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 21:19:24 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-27d67abd215so39325ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Nov 2025 13:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1762377564; x=1762982364;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wsPKARLgoDbiEbqdjmx1yQIPjPrrWc4YFZC2utX6iXU=;
 b=atiR256947Sb086mrDYnNJM3N90LmU/hS/GE+4zbaEfFqx0FDhvLH5nvBD0jU1mjLO
 pYzGuhr0a0eAzehnRXkm9WCNZC5HaKJBYIDqr201Hat9Fh4rNODi3WQWjkIDxJsNmSX8
 Y7L8C1MOuWVBnpMfDJrQmDa0phwrLKLgx7u4Omc2sYGCXbZ2fWNofdM6RYyFvtf9mfJf
 RKtrLaMAW7X/IDOwe3uT9yvFrnsPP/J2EUAyT8SGEUSwlN6ygH5pyXn1dBg4wKXU/Zlb
 7OAt09IVPGcvd8IAL9f7pxnNSxD4Jy0yENa0j+IhLSJdVd9yKITThP++0eUmnVAtGQXu
 Zr4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762377564; x=1762982364;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wsPKARLgoDbiEbqdjmx1yQIPjPrrWc4YFZC2utX6iXU=;
 b=W1qbgZZOj5i9LOmrACeyytOFNzd4b9zEkAP40+d1Ck+pS18JnjzyZ0HuZhLAMzm++i
 OqNp7UV5pplyS7vHyqWM14aVNN923CdGf7W52HTofGvtC5P62zhQUTZb3OYudj+heE9K
 j6rO/VVa7E8eYf1+mJgO1Wdc7VgPVuq/2vxIEGZXhyLoH9ccUqFcqndjrWXu98DbzML8
 wIgiUIlOrFBsdb9MupKedLeuY43otp6WO940qsKW+MsWCT3O/KZcFeeKdvMmUIOomDvL
 ivMvaJ5tsLw/ijLQP2JBqsTZ6+BoIK7u1jgLaPOOdRfHp/GbIivTsgGIK+uH051ULTvb
 GEWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU889EgdbMygOwu98QvXojJxXjiOrg4ss0ZjibW2zk11SIqlR+ZSaEGp+z00gXqoIyhHBwpSXVeL/4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwqhlkDk/EpAZ4Xa5Xbt4eSe01QMfgiaImZd7LJ/yKVKhot2LHA
 QFhcNxgvzuYK7fm/oyw6GU53SKFJMkYx1/JH8jAsJt0lseVDYQLSnn/2gmnsnnl73A==
X-Gm-Gg: ASbGnctyqnCz6EjRcaLH6132tmSm6UjvTHBmN4x1ehrqy60VKqt5046Zr0KTuYQ8ro5
 E+egoEBW0Ll80LmH+5EzyWvYh4CK7MHyF9bZ+3HdZ7LVhVU0nEYHz2mo6Jb68u4tL4zjB8gik0W
 wXI7i2939R9clwtL9ZV9WnOziIAi3Inr7Sn/UYGkQqdG3JJhQWB8+sm5nM2wx7eCCZXOxVYxLtO
 9LBuh8hXAEVYcCCDEABD00u7hOLYJKZyehtcoXtyEUMGeYfKncyKXFghNo6Ku+sO2U3LdBpOmR+
 b5ShYvbNPtqCilwnShYzTqTjp5Gshp9+l+0ZPE6u/YFIYQlcvUk8Na0UKUWC2Up65wd4Ry1SQq/
 wQytBSaDJ29WdCK010PpJYE8ec0/vFsxuL24Xg4f7M56BilEOBfEHg0vBwzML9uC4JMRReZWolN
 g4eaubnjq8HpxJaVqaCYWsRikGinUTIm5u/ofYow==
X-Google-Smtp-Source: AGHT+IEIIO35cH2PrBkhqYMd/E+xZSf3lgI2yKX1DyfVtbO2pYBYeKyrnA3lBD1BQHg2AJrJT8JqeQ==
X-Received: by 2002:a17:902:d505:b0:266:b8a2:f5d8 with SMTP id
 d9443c01a7336-29655c7a119mr1205695ad.14.1762377564053; 
 Wed, 05 Nov 2025 13:19:24 -0800 (PST)
Received: from google.com (164.210.142.34.bc.googleusercontent.com.
 [34.142.210.164]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7af82bf14d6sm365224b3a.66.2025.11.05.13.19.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Nov 2025 13:19:23 -0800 (PST)
Date: Wed, 5 Nov 2025 21:19:13 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Ankit Agrawal <ankita@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Brett Creeley <brett.creeley@amd.com>,
 dri-devel@lists.freedesktop.org, Eric Auger <eric.auger@redhat.com>,
 Eric Farman <farman@linux.ibm.com>,
 Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Kevin Tian <kevin.tian@intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-s390@vger.kernel.org,
 Longfang Liu <liulongfang@huawei.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Nikhil Agarwal <nikhil.agarwal@amd.com>, Nipun Gupta <nipun.gupta@amd.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, qat-linux@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Mostafa Saleh <smostafa@google.com>, Sven Schnelle <svens@linux.ibm.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, virtualization@lists.linux.dev,
 Vineeth Vijayan <vneethv@linux.ibm.com>, Yishai Hadas <yishaih@nvidia.com>,
 Zhenyu Wang <zhenyuw.linux@gmail.com>,
 Zhi Wang <zhi.wang.linux@gmail.com>, patches@lists.linux.dev
Subject: Re: [PATCH 14/22] vfio: Require drivers to implement get_region_info
Message-ID: <aQu_Uc_ZmBJUgw0_@google.com>
References: <0-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
 <14-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
 <aQhcOYVbY-LqOjW5@google.com>
 <20251105134829.333243dd.alex@shazbot.org>
 <20251105205600.GX1537560@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105205600.GX1537560@nvidia.com>
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

On Wed, Nov 05, 2025 at 04:56:00PM -0400, Jason Gunthorpe wrote:
> On Wed, Nov 05, 2025 at 01:48:29PM -0700, Alex Williamson wrote:
> > On Mon, 3 Nov 2025 07:39:37 +0000
> > Pranjal Shrivastava <praan@google.com> wrote:
> > 
> > > On Thu, Oct 23, 2025 at 08:09:28PM -0300, Jason Gunthorpe wrote:
> > > > Remove the fallback through the ioctl callback, no drivers use this now.
> > > > 
> > > > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> > > > ---
> > > >  drivers/vfio/vfio_main.c | 8 ++++----
> > > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> > > > index a390163ce706c4..f056e82ba35075 100644
> > > > --- a/drivers/vfio/vfio_main.c
> > > > +++ b/drivers/vfio/vfio_main.c
> > > > @@ -1297,13 +1297,13 @@ static long vfio_device_fops_unl_ioctl(struct file *filep,
> > > >  		break;
> > > >  
> > > >  	case VFIO_DEVICE_GET_REGION_INFO:
> > > > -		if (!device->ops->get_region_info)
> > > > -			goto ioctl_fallback;
> > > > -		ret = device->ops->get_region_info(device, uptr);
> > > > +		if (unlikely(!device->ops->get_region_info))
> > > > +			ret = -EINVAL;  
> > 
> > Nit, typically I would have expected a success oriented flow, ie.
> > 
> > 		if (likely(device->ops->get_region_info))
> > 			ret = device->ops->get_region_info(device, uptr);
> > 		else
> > 			ret = -EINVAL;
> > 
> > But it goes away in the next patch, so *shrug*.
> 
> Yeah, still I can edit it..
> 
> > > Nit: Let's also add a warn/err log here highliting that the device
> > > doesn't populate the get_region_info op?
> > 
> > Are devices required to implement regions?  If so, it'd be more
> > appropriate to fail the device registration in __vfio_register_dev()
> > for the missing op than wait for an ioctl.  However, here in the device
> > agnostic layer of vfio, I think the answer leans more towards no, we
> > could theoretically have a device with no regions.  We also want to be
> > careful not to introduce a WARN_ON that's user trigger'able.  Thanks,
> 
> Yeah, I had the same thought, so lets leave this. If we do want a warn
> it should be in registration.
> 
> A device without regions does not seem useful, but also it doesn't
> malfunction if someone does want to do that.
> 

I agree with the both of you.. I just thought if we should remind the
user with a log that the dev doesn't expose a region. But I guess we
don't need to worry about that.

> Thanks,
> Jason

Thanks,
Praan
