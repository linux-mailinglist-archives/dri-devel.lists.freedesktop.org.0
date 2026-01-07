Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F142FCFEC1A
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 17:00:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD1010E624;
	Wed,  7 Jan 2026 16:00:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="Kmqk7mbw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A03110E624
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 16:00:54 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-88a37cb5afdso10998266d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 08:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1767801653; x=1768406453; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ftSoJlbCa6MOGNHtdz3xW3rHVknPRmwRfQPP71m23p0=;
 b=Kmqk7mbwoNakbg0ExNzp7YO5/zplwQv9F8nl289Nu8shUO1LSDGfRqCxYSOwa5IqTC
 rYh/lc0SJs9K9/J2Pl0ei5o33BdGlQJ8VcRg3XvKAaDxuUNXS/HHz4G2pEfzbmScIMZM
 C7XvlNLPBBkJDx1Cx3RIgda87OLWHAEgC49NUv2hNg4CyzQsKKHE/6RHyx6Ell6BEf57
 8+zkhwmHctvioevT32ZKPwUarRSEvspLjE+bUDA8hrW/Gr85+eJUEwFAWZjT9M+WFqYL
 eQF3qwcaSLLP7lfrYmIcJdCo0PH5ht2RMTnIsEL60rOzWeUhNkwM9HAhjdua5ssVqZdP
 0L1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767801653; x=1768406453;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ftSoJlbCa6MOGNHtdz3xW3rHVknPRmwRfQPP71m23p0=;
 b=F6GrcmQHa3JTrTWRihGon8gxaRUUoxEAGTxBD1Khrh/c8XyloO1EcTyd5ZzP5Y8Pyt
 s407fUyDfCospshFyvtFM7IjIYxUmiwOoloEhYppeBWjkB4wOA2PU7O1SVptRwcbA8S1
 wcrjWhYKqNYBjrSH0if2xjXZdqwXLSJwG7mLjTDBnXp/Qzjv5boQP/ChmwSL3uKoj69m
 StUKIuCYCFlO7wIzwsPsP5iG5jDt4wKyYd9l9n3NtUjAsbexfDcXJh9KF3+0/Ty3wlnc
 Ahc6y4Hebj8p+NOFIleW7RrISOZ7YPCGqNGa0qP6oMlv4WJUoKS5DGEWmwoEI2FjjL8p
 Xj2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtQVYYjRELKdTEONDMkWfB731mNGjeHRJdThk/siroR2i/7Mi1bdvSIkqiR4o1Obk2S9Rj4YvFEN0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEijN6Vs3VdEE+3SBY1vRpPpRHy9d3IPSuq2cKdmmSJALMjtTI
 rb+4gBQesJV9la6sEeiF1Itk53QdNNlxFOYv7nkdEkzZRmWufq2eA40orsWDQGbDJVk=
X-Gm-Gg: AY/fxX4+d4aJ0VO7idUGXcfmQ7zZPJuXyXfsBuHl+/N+QiSyBYVP9HDt/7dW9ctotxv
 WCqeLAiC4V7vsMXFKCJ87qTr48Wj4uPtp4U3PUXYF55HIbH1gGVjsVWyiPPUsEyJUTB6DVymmh0
 5q6mJ77r74TwVPkYT9TTCDCtX0P8xw9LcX3Lj3qdgmQvW23RDh1eFAtaL3CfD7RAhfZjy6nhJRq
 OUdvthJegmnXuwvMu44uk1jbIuVs3RYeZIykMw6n/rZ5bV2Wm0fZTswWUVXlvJAAGpGa9EZK1GZ
 cxWPjnBvyk8C8Ir0xaGAmwhQ36eFnkkRDjykl2JrLNUvAExD0+t8x+v0LU1XkNTDGbfljjTvMNG
 V7BkARZtXt6U0br9XnotvcFtBSbSi48K3dZ3mLlA5fmAlyFmHn2uTkDfbXQF6EVuG+aG5Fw6MTu
 qy5mrLcbBfcy8KOAIEQybE/iDy6TmMdUgCN6NAE7T8zAYpJn25hIaNXjuLqkjqNz1tptOgIDVF+
 o4FFA==
X-Google-Smtp-Source: AGHT+IEsFTBclBHNaJgPLh58sVSxPObjQlXbE6JZhrOur9VbgMkz2k1BHIEIa/RCFDyuscOAoE/vIQ==
X-Received: by 2002:a05:6214:411:b0:888:4930:7989 with SMTP id
 6a1803df08f44-89083d0d91bmr44153996d6.36.1767801649963; 
 Wed, 07 Jan 2026 08:00:49 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8907725ffc7sm34937966d6.44.2026.01.07.08.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 08:00:49 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vdVxn-00000002CVI-0vE2;
 Wed, 07 Jan 2026 12:00:47 -0400
Date: Wed, 7 Jan 2026 12:00:47 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Alex Williamson <alex@shazbot.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 kvm@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Yishai Hadas <yishaih@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Ankit Agrawal <ankita@nvidia.com>,
 Matthew Wilcox <willy@infradead.org>, Jens Axboe <axboe@kernel.dk>
Subject: Re: types: reuse common =?utf-8?Q?phys=5Fv?=
 =?utf-8?Q?ec_type_instead_of_DMABUF_open=E2=80=91coded?= variant
Message-ID: <20260107160047.GB340082@ziepe.ca>
References: <20260107-convert-to-pvec-v1-1-6e3ab8079708@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260107-convert-to-pvec-v1-1-6e3ab8079708@nvidia.com>
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

On Wed, Jan 07, 2026 at 11:14:14AM +0200, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> After commit fcf463b92a08 ("types: move phys_vec definition to common header"),
> we can use the shared phys_vec type instead of the DMABUF‑specific
> dma_buf_phys_vec, which duplicated the same structure and semantics.
> 
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
> Alex,
> 
> According to diffstat, VFIO is the subsystem with the largest set of changes,
> so it would be great if you could take it through your tree.
> 
> The series is based on the for-7.0/blk-pvec shared branch from Jens:
> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git/log/?h=for-7.0/blk-pvec

Great!

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
