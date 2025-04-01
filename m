Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65335A780BC
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 18:43:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F99210E623;
	Tue,  1 Apr 2025 16:43:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="FMY9xEMB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3200E10E623
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 16:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1743525831;
 bh=0oP73cOrV2TV+Orzub21hKaqsoLbpjOTbhBBjKwOiyg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FMY9xEMB59Y+KC4geCnZUKtKwRk0vCFUyPG7S283Hy8vlmOYOplSvYh7EqMi11g9i
 y1JkTvMlZ+VBOd56YOI1Ri7mGYzqcsrRA9x9M42kn2nMq31BtHeoVMRWSoP3d4u5LL
 w5ITUf03l2XHWLH7q4bgCyqIFP6I5fFBNaqX4pa6ddPzcKykUzaw1eo69S6wC6+5VP
 2PmSXsMm2sE1ktljDz8yvbWSVNsD/BjKXY+0DCcrjWpESPg0qoE4MNng6yF/a86wI7
 FNXSPLEuGzbFmwhqKC1rnl3fXryPoq8o/VU9+N3VxTffokUkkVA4gga/uElU1Y+Ffy
 RSNIxWnewyb6Q==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id F264F17E0899;
 Tue,  1 Apr 2025 18:43:50 +0200 (CEST)
Date: Tue, 1 Apr 2025 18:43:46 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Steven Price <steven.price@arm.com>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com
Subject: Re: [PATCH 1/3] drm/panthor: Call panthor_gpu_coherency_init()
 after PM resume()
Message-ID: <20250401184346.22ea16c3@collabora.com>
In-Reply-To: <Z-wRpKpzlK4Xg7ed@e110455-lin.cambridge.arm.com>
References: <20250401075710.2638950-1-boris.brezillon@collabora.com>
 <20250401075710.2638950-2-boris.brezillon@collabora.com>
 <Z-wRpKpzlK4Xg7ed@e110455-lin.cambridge.arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 1 Apr 2025 17:17:40 +0100
Liviu Dudau <liviu.dudau@arm.com> wrote:

> On Tue, Apr 01, 2025 at 09:57:08AM +0200, Boris Brezillon wrote:
> > When the device is coherent, panthor_gpu_coherency_init() will read
> > GPU_COHERENCY_FEATURES to make sure the GPU supports the ACE-Lite
> > coherency protocol, which will fail if the clocks/power-domains are
> > not enabled when the read is done. Move the
> > panthor_gpu_coherency_init() call after the device has been resumed
> > to prevent that.  
> 
> While doing this, do you mind fixing the definitions for GPU_COHERENCY_ACE
> and GPU_COHERENCY_ACE_LITE? They are swapped, according to my arch spec.

Oh, nice catch! I'll add a patch fixing that in v2.

> 
> Otherwise, patch looks good to me.
> 
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> 
> Best regards,
> Liviu
> 
> > 
> > Fixes: dd7db8d911a1 ("drm/panthor: Explicitly set the coherency mode")
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> >  drivers/gpu/drm/panthor/panthor_device.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> > index a9da1d1eeb70..c73c1608d6e6 100644
> > --- a/drivers/gpu/drm/panthor/panthor_device.c
> > +++ b/drivers/gpu/drm/panthor/panthor_device.c
> > @@ -171,10 +171,6 @@ int panthor_device_init(struct panthor_device *ptdev)
> >  	struct page *p;
> >  	int ret;
> >  
> > -	ret = panthor_gpu_coherency_init(ptdev);
> > -	if (ret)
> > -		return ret;
> > -
> >  	init_completion(&ptdev->unplug.done);
> >  	ret = drmm_mutex_init(&ptdev->base, &ptdev->unplug.lock);
> >  	if (ret)
> > @@ -247,6 +243,10 @@ int panthor_device_init(struct panthor_device *ptdev)
> >  	if (ret)
> >  		goto err_rpm_put;
> >  
> > +	ret = panthor_gpu_coherency_init(ptdev);
> > +	if (ret)
> > +		return ret;
> > +
> >  	ret = panthor_mmu_init(ptdev);
> >  	if (ret)
> >  		goto err_unplug_gpu;
> > -- 
> > 2.48.1
> >   
> 

