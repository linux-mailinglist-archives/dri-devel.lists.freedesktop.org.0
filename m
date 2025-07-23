Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6735B0E95E
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 05:55:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0D8310E033;
	Wed, 23 Jul 2025 03:55:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="KqFw1uvj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8B7910E0D6
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 03:55:25 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-23636167b30so58011815ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 20:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1753242925; x=1753847725; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3YRcngTOmImRVZlU/kPn2yZwK6WlVIM67jiQ/OO/PWc=;
 b=KqFw1uvjPC2PeDqWxPnhrE7gb1RIjSs4LU1cnzDgZVUdO+E3jhowRo+KFiedNKs6TF
 tRL91zQUVfJHyp6pI2+lzAj/W4cpz5g1VyVwmxFB81it2VN5SxKu6+KFSf3ZZpRYNx5d
 wxSrqlRyps3R9OGGrG0DGdTLRxS7VBgUCMsDvjJPXTxc6JBhx8UG6uIsWz+Ocm6eSDEO
 UO2FA12hNCLPiKYTWa76sga3Np+2rTpdiLpxDcgffilvdYF6YwWEOHADp480wCnr6HSm
 PVUwoO2nAK/ReuDxWJ8pnw0PXhEZnRuwg8Eio2mSKyqMOFurtgQKDENoMEgc3XWEUqCN
 QM6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753242925; x=1753847725;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3YRcngTOmImRVZlU/kPn2yZwK6WlVIM67jiQ/OO/PWc=;
 b=kBexmR35/hTjIl3vB6qojsDA4UUZ7iBrVTSBGt1lUZikwl8pfiSPC347PqHwYdEg7N
 L76Z6jmrqMb6rnq+xQ3o4vu5qzp/huRejcTYaViHPufWw/VBoXTrLBODaOEtUWd427+X
 F8/9Y+DYemWgYwtGra29e/JFXSy93oSknwlsoqdaHGY/aq+q2N2t25BR1yTCD6W9Sxnk
 NrUzss9BCFwTXA8Ak4tl1ZAIrN0AMcaojM5VjycBv4ltWLYIpVyenecZS0NHjBXTlTlS
 OkM5e4BDn9FF9vs0EunqYiRFe3XPASw60CNagx4LtYKTDx8rPd1tTNlZ7dXdfxR/YRwQ
 o8JQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUD6e5Tg7Zka1vuG4l9UsfPIMyypKztCh/0+/35fq2eOcgBKsK7SuOZEa69W2Fd7zDc6/W4x3JgWaA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8ZgZkSV757L3DO5IkDTiNBkfmrcjFFIiDrS8fgMSOcdm7AxMA
 2QITnGd18BzZN+mT6a90uvxHLcLETtcBTVvZJXg7gjs9kHB9TL5jGHlVD58lfBGDCrA=
X-Gm-Gg: ASbGncsUFsM7Yu6p0YOl9o2qUt85+SohNJDzbpy1MqibpZKG/JJvm9Z6/wmRZc6RvFt
 W/ua/Bc9EWbqq3k7BIbKKFLJiGHJ90ueBblWHMnDCMAftr1CpMhAdzbFZEhrSxltT+IXiEhUwY0
 vT3xvSt/+jYG9hW674iTdFQpesziz1l8kVqWiDGdUqE2W9cuUtXg4A6TmRI4M+PTC0eJ9+V4wNL
 Z3Q8aQQM31FeU01RON9c1+dWB40umGwY68oHBe3QCS2s3O0Zl4jjrfBv3XAmQVVyn7aU2VsrysU
 SPKJXCfLTe12dV/V9mbQtbZ4EGtnnzYsYf8opWu9/XrJ9TQoR2Aj3rLa7l2Ydl4oyAmnVngl+6X
 kk7VTWhFewMVjT0W1KU5wRT04uL+F7zERGFO4gVDZ6+Rapw==
X-Google-Smtp-Source: AGHT+IFPdkG2Deg66tYuBh/VvcuRb6SoC/z/9RlnC+W1ttjW1jVLRuT1P2yag8dd/CsKREgJkG37KA==
X-Received: by 2002:a17:902:e747:b0:234:c2e7:a0e4 with SMTP id
 d9443c01a7336-23f98164db9mr18866095ad.3.1753242924942; 
 Tue, 22 Jul 2025 20:55:24 -0700 (PDT)
Received: from ziepe.ca (S010670037e345dea.cg.shawcable.net. [68.146.128.183])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6efb69sm85898495ad.195.2025.07.22.20.55.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 20:55:23 -0700 (PDT)
Received: from jgg by jggl with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1ueQZe-0003Gp-Gf;
 Wed, 23 Jul 2025 00:55:22 -0300
Date: Wed, 23 Jul 2025 00:55:22 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@infradead.org>
Cc: Yonatan Maman <ymaman@nvidia.com>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Leon Romanovsky <leon@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alistair Popple <apopple@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Michael Guralnik <michaelgur@nvidia.com>,
 Or Har-Toov <ohartoov@nvidia.com>,
 Daisuke Matsuda <dskmtsd@gmail.com>, Shay Drory <shayd@nvidia.com>,
 linux-mm@kvack.org, linux-rdma@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Gal Shalom <GalShalom@nvidia.com>
Subject: Re: [PATCH v2 4/5] RDMA/mlx5: Enable P2P DMA with fallback mechanism
Message-ID: <aIBdKhzft4umCGZO@ziepe.ca>
References: <20250718115112.3881129-1-ymaman@nvidia.com>
 <20250718115112.3881129-5-ymaman@nvidia.com>
 <aH3mTZP7w8KnMLx1@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aH3mTZP7w8KnMLx1@infradead.org>
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

On Mon, Jul 21, 2025 at 12:03:41AM -0700, Christoph Hellwig wrote:
> On Fri, Jul 18, 2025 at 02:51:11PM +0300, Yonatan Maman wrote:
> > From: Yonatan Maman <Ymaman@Nvidia.com>
> > 
> > Add support for P2P for MLX5 NIC devices with automatic fallback to
> > standard DMA when P2P mapping fails.
> 
> That's now how the P2P API works.  You need to check the P2P availability
> higher up.

How do you mean?

This looks OKish to me, for ODP and HMM it has to check the P2P
availability on a page by page basis because every single page can be
a different origin device.

There isn't really a higher up here...

Jason
