Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4AA18BF868
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 10:23:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2175E10F037;
	Wed,  8 May 2024 08:23:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="BXIPVTD8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B44C10EB0E
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 08:23:13 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a59ad24baa2so135301566b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2024 01:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1715156591; x=1715761391; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xX8T7z7JX/d3uw4bZ2bZEEE/EwwDbdoePKTyocl8yug=;
 b=BXIPVTD8uvBLokpZehD/B1AYr031iy9AYApx4jsjRiD7yujtUmSWoVPDXp/2FfLSt5
 JTFHEjkNGKyw6QPBZeAh/NbtrMUx1GWrqRquKZtF28CEZn9HMTXbzUq+gdKAe0FldLoz
 cfH0v8ao6G1/KOwdJvpuINNdpSJO3waxroJ1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715156591; x=1715761391;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xX8T7z7JX/d3uw4bZ2bZEEE/EwwDbdoePKTyocl8yug=;
 b=gfLszQJtOWR7OOePQwitZmDIKTCTipTv0z7wrgsjABaO+87g0HCjm7OGa/urvAvrsX
 LNeT8oVbaJyiSmh68LjngQgZ4AaYMAuEh8SbQuJ/UT9DImGX6G9s9lsW/UoDN1mu98iU
 4xA//6X7q/MUvk/jGDOR0pxnV6yw3FV7EPpnmPsJfja6GZBF5fTf8vm+Bp/2H/d+V1VT
 +E9R+2pFZO3mCix2HnEnxJ+PD6eYzyquu/q+dI+62JIdgcCMHtc87R1tfOja4ZR+maw4
 AUe3nsUdCH6ZBziAre3sVxKKzjDg8Z+Lna/0cUwXS2fynPGlhl0Esre07t0jiBLgagXJ
 u26A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaJPVrxbHKrsYrrd2UDuI/YWHv8Hohc3hoTtOcucSTKTppd921lXaCGR3qoZUhTry+Oq75oT62ftYIT8oH4cJvPPCX7SrmhUBknbuYwbja
X-Gm-Message-State: AOJu0Yze1SGzgmJhdYWs1QL12+GYWjNMaUkXZJFurRTu3p1K4zK89doZ
 Lfxv7CdIkE0H0Ms9E+3yGcj4fXhy056qrxBx969DORpAUyGdYOMVX6NApsvGC7s=
X-Google-Smtp-Source: AGHT+IERZtXNeoCiRmo1mqas8Y/UQ6pzLyLJDXpgtWRZ1RzE0ZKKFqa1dMwitwttSdKyrV7CIRB1ew==
X-Received: by 2002:a17:906:f359:b0:a59:dbb0:ddcf with SMTP id
 a640c23a62f3a-a59fb6fba8fmr121830766b.0.1715156591554; 
 Wed, 08 May 2024 01:23:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 g8-20020a1709067c4800b00a59a9cfec7esm5128792ejp.133.2024.05.08.01.23.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 01:23:11 -0700 (PDT)
Date: Wed, 8 May 2024 10:23:09 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v1 2/2] vfio/pci: Allow MMIO regions to be exported
 through dma-buf
Message-ID: <Zjs2bVVxBHEGUhF_@phenom.ffwll.local>
References: <20240422063602.3690124-1-vivek.kasireddy@intel.com>
 <20240422063602.3690124-3-vivek.kasireddy@intel.com>
 <20240430162450.711f4616.alex.williamson@redhat.com>
 <20240501125309.GB941030@nvidia.com>
 <IA0PR11MB718509BB8B56455710DB2033F8182@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20240508003153.GC4650@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240508003153.GC4650@nvidia.com>
X-Operating-System: Linux phenom 6.6.15-amd64 
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

On Tue, May 07, 2024 at 09:31:53PM -0300, Jason Gunthorpe wrote:
> On Thu, May 02, 2024 at 07:50:36AM +0000, Kasireddy, Vivek wrote:
> > Hi Jason,
> > 
> > > 
> > > On Tue, Apr 30, 2024 at 04:24:50PM -0600, Alex Williamson wrote:
> > > > > +static vm_fault_t vfio_pci_dma_buf_fault(struct vm_fault *vmf)
> > > > > +{
> > > > > +	struct vm_area_struct *vma = vmf->vma;
> > > > > +	struct vfio_pci_dma_buf *priv = vma->vm_private_data;
> > > > > +	pgoff_t pgoff = vmf->pgoff;
> > > > > +
> > > > > +	if (pgoff >= priv->nr_pages)
> > > > > +		return VM_FAULT_SIGBUS;
> > > > > +
> > > > > +	return vmf_insert_pfn(vma, vmf->address,
> > > > > +			      page_to_pfn(priv->pages[pgoff]));
> > > > > +}
> > > >
> > > > How does this prevent the MMIO space from being mmap'd when disabled
> > > at
> > > > the device?  How is the mmap revoked when the MMIO becomes disabled?
> > > > Is it part of the move protocol?
> > In this case, I think the importers that mmap'd the dmabuf need to be tracked
> > separately and their VMA PTEs need to be zapped when MMIO access is revoked.
> 
> Which, as we know, is quite hard.
> 
> > > Yes, we should not have a mmap handler for dmabuf. vfio memory must be
> > > mmapped in the normal way.
> > Although optional, I think most dmabuf exporters (drm ones) provide a mmap
> > handler. Otherwise, there is no easy way to provide CPU access (backup slow path)
> > to the dmabuf for the importer.
> 
> Here we should not, there is no reason since VFIO already provides a
> mmap mechanism itself. Anything using this API should just call the
> native VFIO function instead of trying to mmap the DMABUF. Yes, it
> will be inconvient for the scatterlist case you have, but the kernel
> side implementation is much easier ..

Just wanted to confirm that it's entirely legit to not implement dma-buf
mmap. Same for the in-kernel vmap functions. Especially for really funny
buffers like these it's just not a good idea, and the dma-buf interfaces
are intentionally "everything is optional".

Similarly you can (and should) reject and dma_buf_attach to devices where
p2p connectevity isn't there, or well really for any other reason that
makes stuff complicated and is out of scope for your use-case. It's better
to reject strictly and than accidentally support something really horrible
(we've been there).

The only real rule with all the interfaces is that when attach() worked,
then map must too (except when you're in OOM). Because at least for some
drivers/subsystems, that's how userspace figures out whether a buffer can
be shared.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
