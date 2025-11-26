Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 320FDC8B5E1
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 19:01:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B229A10E69E;
	Wed, 26 Nov 2025 18:01:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="ir+Mw8Ve";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EED310E69E
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 18:01:12 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id
 6a1803df08f44-88054872394so170756d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 10:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1764180071; x=1764784871; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jjSf74md9hV6abcmJUmAPy1uC1ZA/qAadY295f9z6us=;
 b=ir+Mw8VeZDaXrU+B0CjkTGTN6OXCwPL7qYcQ7/VyFI+6inYZRxk1t+h/n29uGmud8e
 BQpIneJeSUowIsNKF3T3whFm+rJ1cwGort0sbcZdpYJtXWAwaUikIUHKVJlhQhXjsRLB
 FxCf++uUwUDTV4KTMotUL07RuqESOh7nwPBqIX4w9oEUh721Xf+xvDBraE1C/BWXAeOw
 21bcA0LNuo/ORBgDq7Am6JfWOTDrDtiRndm6EvrsxPkwTWuMN2rjZnXJ7ip5jvcMlxrR
 I71dZeQv2jGVX8P+b6JXpwBE+wv5b0RThZicE6cA1p/HbkJzIlHYKQ4Yw4KAvaQy98fZ
 L94g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764180071; x=1764784871;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jjSf74md9hV6abcmJUmAPy1uC1ZA/qAadY295f9z6us=;
 b=dC/1c3f6P2nlUKlyZ9Gs3N769goHqqnhZ1pSUP1RypiRzHNETr3qS5mNnYWSawsxVq
 l+ktQxvKsqt3fRatHu5jVcqOPZ9eglhcbWAZMk4St4dfkMY8VIXT0Ps66jKd5EmkDKQs
 M3IyA3Fr49/B6wXLTELIXXCw2dUzgYCHRNed36NHb+0ZiYW0GT/xHa74aYA9vby+ZGwl
 7sS6mZlPclmaz7Hdjs5A/X6n7NQ2/AeLpC9JOQnAWpg9gnB4Y+g0KIATwyCTpnU6/xFX
 383avEuidpvNz+V5GBLFUwjb+ggfb63tmUBa61iBzWCcz8+VziYiUGOq2JpWR402C2id
 +GXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/pF7tT0R52OrM948yCO+lTxxnnrq6qLuKL3c+pyai37Dc6YKECEsWEakdKL+vJh2PUbQnbG6jry4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUGOlRHfq5KzXFLd1BOSHxj5vQ3vSpP/ptJJMfDENKe+FRrdmm
 TIxRK334hqI8Ty5UFJh5GLaJ2SEXqMCGHmvtm0Keet46PlduGWp95DqVpOp/E0rq0II=
X-Gm-Gg: ASbGncsKNHznwhu5ExFJ4AXmY/TtrD4QxmDAkWRcjC/DQKFV2V9eqAwTOc1lNxSDeuX
 uHiz5gfeuayB/GRUqRnOA9jAVQrMDjRG01WoDjmwemC6sQ2uYJpVE3P5Ues7Yp+R7HWDLSAdpzP
 4C1dqkMvlv3V89neFp18+rC9NX57WIXjfK2KnLo8trgIhrK2ZdjSVlT8K583Hvj743QsXA8P/WR
 JqaFQQuufBihmhyVqSw0Kdtj/gcbZGK9tUTA7vFZa9EuCTMFuPfE/RqtBftsebgeOhKp38CbZwR
 Wlxh0QNum6mn/jrqWpOTEJWg6XGGIZdCDQBPrjesODjT/tKwA+2E9IPokMNd9CtZFnSBo11UYA9
 QNY2lR6/FYAOI1vbNGvdJ2lzcJwBILnyL4QpXkcKv1fLgvxd1xiP2oduhSTYsUOYIMcA/y+XUVm
 wUwbjJBpKtDtT/9vBJ/EiscBFocgh+bjTUBAPv/TKTCcGBL5cdNLroeO9R
X-Google-Smtp-Source: AGHT+IEAvNp+zRI8SnZtBMAoTCcW9PsOn0UFKbLCX0nJH/mWJ9Vruy3K7nib32RLaHWbWg9aiKoVNw==
X-Received: by 2002:a05:6214:3113:b0:882:36d3:2c60 with SMTP id
 6a1803df08f44-8847c4ccefamr223992386d6.19.1764180069440; 
 Wed, 26 Nov 2025 10:01:09 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.120.4]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8846e447272sm148376376d6.5.2025.11.26.10.01.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Nov 2025 10:01:08 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vOJpD-000000033ob-2pNk;
 Wed, 26 Nov 2025 14:01:07 -0400
Date: Wed, 26 Nov 2025 14:01:07 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alex Mastro <amastro@fb.com>, Alex Williamson <alex@shazbot.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Leon Romanovsky <leon@kernel.org>, Kevin Tian <kevin.tian@intel.com>,
 Nicolin Chen <nicolinc@nvidia.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 Ankit Agrawal <ankita@nvidia.com>
Subject: Re: [PATCH] dma-buf: fix integer overflow in fill_sg_entry() for
 buffers >= 8GiB
Message-ID: <20251126180107.GA542915@ziepe.ca>
References: <20251125-dma-buf-overflow-v1-1-b70ea1e6c4ba@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125-dma-buf-overflow-v1-1-b70ea1e6c4ba@fb.com>
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

On Tue, Nov 25, 2025 at 05:11:18PM -0800, Alex Mastro wrote:
> fill_sg_entry() splits large DMA buffers into multiple scatter-gather
> entries, each holding up to UINT_MAX bytes. When calculating the DMA
> address for entries beyond the second one, the expression (i * UINT_MAX)
> causes integer overflow due to 32-bit arithmetic.
> 
> This manifests when the input arg length >= 8 GiB results in looping for
> i >= 2.
> 
> Fix by casting i to dma_addr_t before multiplication.
> 
> Fixes: 3aa31a8bb11e ("dma-buf: provide phys_vec to scatter-gather mapping routine")
> Signed-off-by: Alex Mastro <amastro@fb.com>
> ---
> More color about how I discovered this in [1] for the commit at [2]:
> 
> [1] https://lore.kernel.org/all/aSZHO6otK0Heh+Qj@devgpu015.cco6.facebook.com
> [2] https://lore.kernel.org/all/20251120-dmabuf-vfio-v9-6-d7f71607f371@nvidia.com
> ---
>  drivers/dma-buf/dma-buf-mapping.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

AlexW, can you pick this up?

Thanks,
Jason
