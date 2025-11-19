Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EDEC6EEDB
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 14:35:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FC3610E609;
	Wed, 19 Nov 2025 13:35:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="Av4wNcCD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 559A410E609
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 13:35:32 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-8b1b8264c86so659641485a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 05:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1763559331; x=1764164131; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=72A2miNlT6HYTvn6gfrMP1LsN3+/rcjlJPwocEiTvrs=;
 b=Av4wNcCDSN4OC9Gh5bg41Jx03Lr7joBEds/nmcr/TI+nGuvWtut6C+kH9LrE7f4oiB
 adeoeRduX14uSuMMD+U2DwaczMZ4/n6oJm36yYaQos2njJh2WuiHu41MF/ofDnh7wuNX
 YkOxGKtBzJ4BN21IJP3U5hPf7J13zlbOsc4461k0Gw8eDbb3BzKMyy9wr/7SE7+b0xy6
 Vji/Oiain1evuKoWcg3X0LrjODx+hfnRaZx1z5VU2ZyxQR6l21zRnRDv/KLsu7gDo5SS
 DFLemljZ4VRIgs9qs9DqGBm+s3vSsItktFBYCvY1cyi424uYn6p1DaMywf5swyvX5zz9
 47HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763559331; x=1764164131;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=72A2miNlT6HYTvn6gfrMP1LsN3+/rcjlJPwocEiTvrs=;
 b=ffBH22OaSCLRfGuNskxovG914IR9VAQer2AnKpG+IZKz09XikBGkBMrYdR/yvaCLTG
 hmq6U7MzVgH0wxbldZMpbYSUuYAWCtn2yewW2SJeFCBexWU1tAFrfSVUqL6MI2l5gYwb
 6iGbeeXbtt5PsNMsudDF0Ob1+7dGR0CJHzidIwLcW80aMfHR9JizYjXfYPXSuxoUdU7R
 5FtaCIy8LpSxsx4Ba4HKAOsXF3Fo2X7n1Zc6/T0M7++DOYCSJkWCivbsj3oU+7Rp1hJ8
 1u6nj7QzWsj+LfU2lWvfONKUiScSLElu/IE0KOAjVSYlC4bTW/IpfwirjYUp7fs1acPG
 d7gg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0bgZXWkLoxQbPogQ9VCWElq9iFofiT5ZFeMFl15SNtyIAX9DSPQOH6Vg55eDbL+l0+SOsA8+pSWs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwAZUNrS9hXpdKOMZ5kFMICRqg177ZnV2ReLzMBueHo/3cBgQh
 vSEL0OjOABLsXoAYWGOCL4B5uwBGfjPialsCO5DDks4XUiiMJRSAt5VZTAA3Qtk2xmI=
X-Gm-Gg: ASbGncvr/ZKsRpNs9nYvZlsLtZTHNF9FFGb2BEzHZ4xj+Wv3rr6vqyH924P/IRsVkOe
 +gYCFv96HUcAwQsKibDo1wslHT3yZG71I1YwtJHl+ljqayxy7pZhH/DHkdVDGDS1YRKFFr4/iRt
 TOvOnSUjcM+kxrftRIPd3sTZnrhuIdZ8yyzFtM3sq+4VotYTEF98xT+tY8mpZk+b5qVEmCSsTx0
 lxPre/7qPzubYWVIw6llszNXNgE5K/lB4ImSzKkIxu+a7Xups1J9HG3Oj/qGLZTcg+JUVQjqLbu
 XDiYNDdx+JHaC9cGMKJlYjdoChnMDpbnrMWcajnlDLJ04kyvXMa1pldLawtewdafQvSIaL6SLuK
 vuniPv4G4PgAcC9+21IdvdYxYvdN/48SIT+setJ+FSjngeUsTpDOjNVxfNVDQxN3KJeLwxuPDla
 aM7iKgkKO5vY79sywiuAxdkx1yGgE9x2Z/R0zDUPfji8eblIDKRri/kl/i
X-Google-Smtp-Source: AGHT+IE7dgToIwQMvgHU78QddWp+ZiJRe5Ch8SPXRMVN2DOwf2T1NT7zeC+YapS6FYUcpx8f/T/2tw==
X-Received: by 2002:a05:622a:256:b0:4ee:16a8:dd0 with SMTP id
 d75a77b69052e-4ee16a8d595mr193299331cf.53.1763559331028; 
 Wed, 19 Nov 2025 05:35:31 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.120.4]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ede86b376dsm127986771cf.7.2025.11.19.05.35.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Nov 2025 05:35:30 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vLiLJ-00000000Z9b-1C3G;
 Wed, 19 Nov 2025 09:35:29 -0400
Date: Wed, 19 Nov 2025 09:35:29 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Logan Gunthorpe <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Sumit Semwal <sumit.semwal@linaro.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ankit Agrawal <ankita@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>,
 Krishnakant Jaju <kjaju@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, iommu@lists.linux.dev,
 linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH v8 05/11] PCI/P2PDMA: Document DMABUF model
Message-ID: <20251119133529.GL17968@ziepe.ca>
References: <20251111-dmabuf-vfio-v8-0-fd9aa5df478f@nvidia.com>
 <20251111-dmabuf-vfio-v8-5-fd9aa5df478f@nvidia.com>
 <9798b34c-618b-4e89-82b0-803bc655c82b@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9798b34c-618b-4e89-82b0-803bc655c82b@amd.com>
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

On Wed, Nov 19, 2025 at 10:18:08AM +0100, Christian König wrote:
> > +As this is not well-defined or well-supported in real HW the kernel defaults to
> > +blocking such routing. There is an allow list to allow detecting known-good HW,
> > +in which case P2P between any two PCIe devices will be permitted.
>
> That section sounds not correct to me. 

It is correct in that it describes what the kernel does right now.

See calc_map_type_and_dist(), host_bridge_whitelist(), cpu_supports_p2pdma().

> This is well supported in current HW, it's just not defined in some
> official specification.

Only AMD HW.

Intel HW is a bit hit and miss.

ARM SOCs are frequently not supporting even on server CPUs.

> > +At the lowest level the P2P subsystem offers a naked struct p2p_provider that
> > +delegates lifecycle management to the providing driver. It is expected that
> > +drivers using this option will wrap their MMIO memory in DMABUF and use DMABUF
> > +to provide an invalidation shutdown.
> 
> > These MMIO pages have no struct page, and
> 
> Well please drop "pages" here. Just say MMIO addresses.

"These MMIO addresses have no struct page, and"

> > +Building on this, the subsystem offers a layer to wrap the MMIO in a ZONE_DEVICE
> > +pgmap of MEMORY_DEVICE_PCI_P2PDMA to create struct pages. The lifecycle of
> > +pgmap ensures that when the pgmap is destroyed all other drivers have stopped
> > +using the MMIO. This option works with O_DIRECT flows, in some cases, if the
> > +underlying subsystem supports handling MEMORY_DEVICE_PCI_P2PDMA through
> > +FOLL_PCI_P2PDMA. The use of FOLL_LONGTERM is prevented. As this relies on pgmap
> > +it also relies on architecture support along with alignment and minimum size
> > +limitations.
> 
> Actually that is up to the exporter of the DMA-buf what approach is used.

The above is not talking about DMA-buf, it is describing the existing
interface that is all struct page based. The driver invoking the
P2PDMA APIs gets to pick if it uses the stuct page based interface
described above or the lower level p2p provider interface this series
introduces.

> For the P2PDMA API it should be irrelevant if struct pages are used or not.

Only for the lowest level p2p provider based P2PDMA API - there is a
higher level API family within P2PDMA's API that is all about creating
and managing ZONE_DEVICE struct pages and a pgmap, the above describes
that family.

Thanks,
Jason
