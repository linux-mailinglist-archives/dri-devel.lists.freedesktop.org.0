Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8813C6EF0B
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 14:37:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52C0510E60D;
	Wed, 19 Nov 2025 13:37:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="MRG1MQZy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E781210E60D
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 13:37:10 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id
 6a1803df08f44-8804650ca32so61216826d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 05:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1763559430; x=1764164230; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bEA8ekCp1nrcWXcrdpDKlGp67cbKmmAmKoKYvVWnAsI=;
 b=MRG1MQZyzss3jpS5/evxdBeC7UuDEb3ntDXPP6Eeb9AHMXUZNqLMFlJ2hdBEMKga/9
 2BijNRCk8GL0aoRVP65kbvVwxls6zq+BMIUzb5MF9dFMQLH2byXxnj1izLNPEKT2tkrl
 p7IhPuJIg9/ac6PzGmMFVo7eoB2CsUhod4c5ey/HTtD1KX1MAQ1pxTHv/tU/QZw4RpIo
 +SHHaK8O1YrFRlaFnLlL1sJedb6pDpYnEC5HWQr1OfHSLYU/780DbZZtWR8bj3Z4dZ/A
 7vSTMfn7VMeGpIN7pVHzoArLIavCGxfY/G8d4jFC2nZMc9E6F21WHA+SbwsNdTUl4V/A
 diNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763559430; x=1764164230;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bEA8ekCp1nrcWXcrdpDKlGp67cbKmmAmKoKYvVWnAsI=;
 b=PVvB0S6S+kslmx/S86MvScrdKaMmxXfFFJKUMSbQv2OG+yFOtez3wqBgPJiF5h0GjS
 7YFUO3fBx7e9krhPS+4cFRT1Njpi67KfVNawjcc1d04hV+K5dZx+rLUH0lZOZ+REHKYG
 vzwCkPXOBRHSijDptvoqm+2lGVAK5f+uu+WgmX7pwk+iVBVIyyqmoNbcoFJALhwmw0js
 56cdmvjfjGyS7E9opHVuwHSTGLu3MOEiquHxe7t3Pn0+Gzrr/PFd1kp2EhHPZK0DJh0U
 KX4Nw4lydgSOQe0Xe27RlXbyHifsb7BVtIpt8Ck6nb7sAKRArPcweUSGqIVcp6FrXutv
 fOHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmWI90nMeiSHeAbDNNFdiX9IXlBMab6bB4DLwIAeV0hoULUabkdn4Q4UorFmkcy/qW4nmr4mjzsoU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+73U8K3dcTDwsMh/3QzDabZ93n9wBAFGwKietzmnTXiDyTfET
 nD8R8OeKQIsWbMgQeSRBDrrZKEzd+2m5kf/sgxdAmbQ5m3Au8Ptvd7QQgRchHqepmVg=
X-Gm-Gg: ASbGnct7Z6vR3tdq6NiAIIpMJWuP0yR1DCuGX4Oe/3gA7yPVEk4vv4Z5tRzZ5TRiMdI
 dQm+U0kwa2R3jXiQoSUoL5tB012tq1BeBxtNF8H+1cGBehiFeHgz5ckNOJCiZYRDGu1OQcDUGfi
 Iok4zgMppAw7YEbUZiCmHwOY/o77lbJlkHRJepkw3FfHGmBcJbY/U30B78zAnpu8alPKVd/j5rt
 enIrYxHRbuyHFVwiX/JNmjQqcH6RjNUhNvKk7VoijWl10UWqTz+W+kEuFjsu70R36fappLKWBx/
 KqhvgMRPDCZQapH0yLy5e8vflb76jiGbJACShJaDp35gPZ5+fsF5+Opj+mlGcg+efYoMbVBZBqc
 A4OVMwCwp7DhHGDxHnZa78Vo4P8MmAq3dBRNpPw+CC2Egnnxe9dIfJOomK6Qg6yfZJIqjXykfip
 k79CxxaHzVSNwDzIsvfsA/Y+IsSMZuIDRUmCMoL0msq2nXZYhlmYevvAVlWmTUCHLyipk=
X-Google-Smtp-Source: AGHT+IGopBrMkEkq4/9KDO3x1qdzFmkcFO+Cz6Is5DlvxN8PyWRrz38DMZOLki2k1pBf80D+Z8AYkg==
X-Received: by 2002:a05:6214:419f:b0:880:22f3:3376 with SMTP id
 6a1803df08f44-8845fc3e0f0mr26190076d6.10.1763559429603; 
 Wed, 19 Nov 2025 05:37:09 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.120.4]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8828613962esm135128356d6.0.2025.11.19.05.37.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Nov 2025 05:37:09 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vLiMu-00000000ZAY-2EdI;
 Wed, 19 Nov 2025 09:37:08 -0400
Date: Wed, 19 Nov 2025 09:37:08 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Logan Gunthorpe <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ankit Agrawal <ankita@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Alex Williamson <alex@shazbot.org>,
 Krishnakant Jaju <kjaju@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
 Alex Mastro <amastro@fb.com>, Nicolin Chen <nicolinc@nvidia.com>
Subject: Re: [PATCH v8 06/11] dma-buf: provide phys_vec to scatter-gather
 mapping routine
Message-ID: <20251119133708.GM17968@ziepe.ca>
References: <20251111-dmabuf-vfio-v8-0-fd9aa5df478f@nvidia.com>
 <20251111-dmabuf-vfio-v8-6-fd9aa5df478f@nvidia.com>
 <BN9PR11MB5276BC3C0BDA85F0259A35058CD7A@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20251119133000.GB18335@unreal>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119133000.GB18335@unreal>
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

On Wed, Nov 19, 2025 at 03:30:00PM +0200, Leon Romanovsky wrote:
> On Wed, Nov 19, 2025 at 05:54:55AM +0000, Tian, Kevin wrote:
> > > From: Leon Romanovsky <leon@kernel.org>
> > > Sent: Tuesday, November 11, 2025 5:58 PM
> > > +
> > > +	if (dma->state && dma_use_iova(dma->state)) {
> > > +		WARN_ON_ONCE(mapped_len != size);
> > 
> > then "goto err_unmap_dma".
> 
> It never should happen, there is no need to provide error unwind to
> something that you won't get.

It is expected that WARN_ON has recovery code, if it is possible and
not burdensome.

Jason
