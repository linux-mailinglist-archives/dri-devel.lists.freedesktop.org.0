Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 984F06343FF
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 19:50:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5C0A10E43C;
	Tue, 22 Nov 2022 18:50:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C3A10E439
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 18:50:12 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id j26so3788598qki.10
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 10:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NXG1nPyOVdexTTSSHoJBfbyEZKaED5k+nXTjV66jYlA=;
 b=BDKJqRwo4OpkzPMgGsGn6/oh4D+U/HeCaA2DllSJn3ReQ4t31BWyR7f0ms9f8fld6v
 jQqymz74ZvgQN80Rwjy5PO4IHmFTaJJX3Bdpef8ppGHjOE3mXaFMGJQVTAZrtnBO5avc
 5ayHc75mW5Ojm6qUvICrGg7delXXPpPXVc6cCfDq55gcjzIVRVXthDK7ZiGGkJF94ipS
 dLXQ370MaBHQOExNnLYl9NVVIBs8+m0WoZjWcuCzhhjbnd+/+MmCT8N6mLVyEfprAAcV
 M8wKyQSCpWPr/ymGAhNl0UKo8cso9A9KFKjwmcqvA/SplyGCnMObio6ikX/I+ODHb8XN
 f+aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NXG1nPyOVdexTTSSHoJBfbyEZKaED5k+nXTjV66jYlA=;
 b=Sf/FCOnYUvoF/QU0zj03nxwbpJ9IcgxJGbK3m61bWU94onUxLyAHEuV+tu13i9PwOz
 J6gnUvBK3X2TJvMcJKyxvNBNEgtfvrYMyfh8Wz13uL1if2UahiCoaFCirWmsmRLdy9hz
 FdkqL+qEEy2x2yYp+xVXaRc/AVvEz+gWA4gzXJw7xShItQ/0X1kEU62Je+s2jyghM2Bk
 7SciKVZ2mJgprElw2ZUhX9p8i9OqYPzELiFNdqQP6z2tCvQUFbxuOKmy+8V9H+DAic4p
 4wy5swHJeIYJGbixQN4XxknVJSxU7hRdEZeS1Ik+4VFtQFq58DCnVNwbfJ4SF44FfzJ+
 Oiyw==
X-Gm-Message-State: ANoB5pk5nL3imT+nxZDFNWB2fQL8VNk3AitNj/HUPUFtECN9N6KyHjsk
 N1EzkttpQxd7Mj1bvOOVHLf4rg==
X-Google-Smtp-Source: AA0mqf7SuJjtuH4cfDjAlmMlnLfTbMZ2UGyyEWh/kbYJFqmPhs6zwT1OxSYGDX0PX5rIcuKCiVFu0g==
X-Received: by 2002:a37:bd82:0:b0:6fb:a2e2:f504 with SMTP id
 n124-20020a37bd82000000b006fba2e2f504mr11517083qkf.632.1669143011113; 
 Tue, 22 Nov 2022 10:50:11 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-47-55-122-23.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.122.23]) by smtp.gmail.com with ESMTPSA id
 h18-20020a05620a401200b006fa2b1c3c1esm10724419qko.58.2022.11.22.10.50.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 10:50:10 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1oxYLR-009x2J-Oc;
 Tue, 22 Nov 2022 14:50:09 -0400
Date: Tue, 22 Nov 2022 14:50:09 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] dma-buf: Require VM_PFNMAP vma for mmap
Message-ID: <Y30Z4VxT7Wdoc1Lc@ziepe.ca>
References: <20221122170801.842766-1-daniel.vetter@ffwll.ch>
 <Y30PDdsvHIJo5YHR@ziepe.ca>
 <CAKMK7uEccwYTNwDYQazmZvTfBFQOikZt5A6BmegweyO-inKYbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uEccwYTNwDYQazmZvTfBFQOikZt5A6BmegweyO-inKYbQ@mail.gmail.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Wilcox <willy@infradead.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, John Stultz <john.stultz@linaro.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 22, 2022 at 07:08:25PM +0100, Daniel Vetter wrote:
> On Tue, 22 Nov 2022 at 19:04, Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >
> > On Tue, Nov 22, 2022 at 06:08:00PM +0100, Daniel Vetter wrote:
> > > tldr; DMA buffers aren't normal memory, expecting that you can use
> > > them like that (like calling get_user_pages works, or that they're
> > > accounting like any other normal memory) cannot be guaranteed.
> > >
> > > Since some userspace only runs on integrated devices, where all
> > > buffers are actually all resident system memory, there's a huge
> > > temptation to assume that a struct page is always present and useable
> > > like for any more pagecache backed mmap. This has the potential to
> > > result in a uapi nightmare.
> > >
> > > To stop this gap require that DMA buffer mmaps are VM_PFNMAP, which
> > > blocks get_user_pages and all the other struct page based
> > > infrastructure for everyone. In spirit this is the uapi counterpart to
> > > the kernel-internal CONFIG_DMABUF_DEBUG.
> > >
> > > Motivated by a recent patch which wanted to swich the system dma-buf
> > > heap to vm_insert_page instead of vm_insert_pfn.
> > >
> > > v2:
> > >
> > > Jason brought up that we also want to guarantee that all ptes have the
> > > pte_special flag set, to catch fast get_user_pages (on architectures
> > > that support this). Allowing VM_MIXEDMAP (like VM_SPECIAL does) would
> > > still allow vm_insert_page, but limiting to VM_PFNMAP will catch that.
> > >
> > > From auditing the various functions to insert pfn pte entires
> > > (vm_insert_pfn_prot, remap_pfn_range and all it's callers like
> > > dma_mmap_wc) it looks like VM_PFNMAP is already required anyway, so
> > > this should be the correct flag to check for.
> >
> > I didn't look at how this actually gets used, but it is a bit of a
> > pain to insert a lifetime controlled object like a struct page as a
> > special PTE/VM_PFNMAP
> >
> > How is the lifetime model implemented here? How do you know when
> > userspace has finally unmapped the page?
> 
> The vma has a filp which is the refcounted dma_buf. With dma_buf you
> never get an individual page it's always the entire object. And it's
> up to the allocator how exactly it wants to use or not use the page's
> refcount. So if gup goes in and elevates the refcount, you can break
> stuff, which is why I'm doing this.

But how does move work?

Jason
