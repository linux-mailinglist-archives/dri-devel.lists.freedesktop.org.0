Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6843A5F6D86
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 20:31:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 653E410E864;
	Thu,  6 Oct 2022 18:31:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 817FD10E864
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Oct 2022 18:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665081085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D/EnO+t9YxsYbYukQoQ5MDLGm5W9hFbMKzmQnM2kN40=;
 b=KMh9aNe8iCq05t8fHDKPHAgH97jT4WmYN2KzB1udF10MAHVMQbeGwmBfkSBAWdU8X62bzT
 NSG85IbptJzhzVCbX3ui0haqzx9t6ST/m/mh5/qB8GZ2gYxlHSvLdQZd4BfckffdBtliCx
 fTv0/eSVT2w8Al76S4QXTLvOfwOh1is=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-588-tB_afenGO-y6FwLecE_m2g-1; Thu, 06 Oct 2022 14:31:24 -0400
X-MC-Unique: tB_afenGO-y6FwLecE_m2g-1
Received: by mail-io1-f71.google.com with SMTP id
 y10-20020a5d914a000000b00688fa7b2252so1714155ioq.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Oct 2022 11:31:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=D/EnO+t9YxsYbYukQoQ5MDLGm5W9hFbMKzmQnM2kN40=;
 b=sFzbZKuioBX+1dAj5s9ZtPrYyEjYfgDa4EnK4PRH+zTMkLCzRnk8EJuMFP6IuJf+RA
 tWbC/FLuJaddSKmZ8P9EpopxPt9Nra7MlEjYp1SO4HuTOVCDVpk0IhQIHj1N3VU1BgM5
 TwOUCfZACjTI7EQccG1W7/RdmnHmZRVTZfK1JG+agQ6FNPc6/Ra0l7kTMpkx2SLkXL8d
 /9/38DzUTwSlPc1K65jAKalTtYZf0ViSZ2rIYjK7G9ddkpJ5LjoIuMspDi8GhYJ8E5ZA
 +68qsPHPvj6mW3e4c1w0AmaIZED4SEnNG/XK9OCr0ANgIIPYA+cKrT4YEUIfMi4fnIjE
 j97w==
X-Gm-Message-State: ACrzQf3UFPlY+GmrBQyz3uWK8/Ti2K/CEqTVWrYkwddCP7nvDT04wVoW
 KjLqeZaCKqlgMx3+hLxeFgq9n2F2gK78Rhm6gu5WfidK9s48fDHFJw2cfsQI2kIrgX2TUPvZpiE
 1OaNuxNc8ZqYlcJYqSDFLJ31poALj
X-Received: by 2002:a6b:c3c1:0:b0:6a8:3ca0:dabf with SMTP id
 t184-20020a6bc3c1000000b006a83ca0dabfmr539239iof.0.1665081083579; 
 Thu, 06 Oct 2022 11:31:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7pXlhLelqt1wt/DC14P6+x2KJSzkrMLAIfpeD1/B//Vj/lBsUWd5ZxsZxZUGk5To+kMEPI+w==
X-Received: by 2002:a6b:c3c1:0:b0:6a8:3ca0:dabf with SMTP id
 t184-20020a6bc3c1000000b006a83ca0dabfmr539223iof.0.1665081083396; 
 Thu, 06 Oct 2022 11:31:23 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 p2-20020a056638216200b003636e5c4612sm52644jak.33.2022.10.06.11.31.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 11:31:22 -0700 (PDT)
Date: Thu, 6 Oct 2022 12:31:22 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: Add missing vfio_unregister_group_dev() call
Message-ID: <20221006123122.524c75c9.alex.williamson@redhat.com>
In-Reply-To: <Yz695fy8hm0N9DvS@nvidia.com>
References: <0-v1-013609965fe8+9d-vfio_gvt_unregister_jgg@nvidia.com>
 <20221005141717.234c215e.alex.williamson@redhat.com>
 <20221005160356.52d6428c.alex.williamson@redhat.com>
 <Yz695fy8hm0N9DvS@nvidia.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, stable@vger.kernel.org,
 intel-gvt-dev@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 6 Oct 2022 08:37:09 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Wed, Oct 05, 2022 at 04:03:56PM -0600, Alex Williamson wrote:
> > We can't have a .remove callback that does nothing, this breaks
> > removing the device while it's in use.  Once we have the
> > vfio_unregister_group_dev() fix below, we'll block until the device is
> > unused, at which point vgpu->attached becomes false.  Unless I'm
> > missing something, I think we should also follow-up with a patch to
> > remove that bogus warn-on branch, right?  Thanks,  
> 
> Yes, looks right to me.
> 
> I question all the logical arround attached, where is the locking?

Zhenyu, Zhi, Kevin,

Could someone please take a look at use of vgpu->attached in the GVT-g
driver?  It's use in intel_vgpu_remove() is bogus, the .release
callback needs to use vfio_unregister_group_dev() to wait for the
device to be unused.  The WARN_ON/return here breaks all future use of
the device.  I assume @attached has something to do with the page table
interface with KVM, but it all looks racy anyway.

Also, whatever purpose vgpu->released served looks unnecessary now.
Thanks,

Alex

