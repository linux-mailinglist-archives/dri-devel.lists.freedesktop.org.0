Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E311BACC7E5
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 15:34:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E66CA10E6B3;
	Tue,  3 Jun 2025 13:34:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="BtrU7la/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8E3610E8C5
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 13:34:32 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id
 6a1803df08f44-6fad4e6d949so22723286d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jun 2025 06:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1748957672; x=1749562472; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=o9eD6fBv50JvJ7Gx4KUjwD3EkSFG+lO7duRzw9dtFZs=;
 b=BtrU7la/vKjOQ2MNljCc5toQcrSDdNATjSuxUoB5gZZ4gkD57m2IG5wdJGQxuyzt1W
 rshgOdhPnNFl03wEKjBio10YHsEGPnIEZxTcvdjQwjJpEeEhB4Z23sHq00L0inXwYXBI
 gCN4HWdJlWwm8vZvTeekx6n4T5iGs/MrH76IjyuGeO9SEng2BADZpwheqY/e5PZ7lszR
 Yh2sBAURo7OFgfzOT/54Zb26AsRN9tBhR1ZNB2AuYAxvetIbnu8UTSYOKCYNUtTAD3v3
 XCLxWKeOVx+CdwhR7nzUIm4yECOhX00EkmbMDLsBtD+eJHhP1SY86WDH8ia/NwgmoyT7
 P5Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748957672; x=1749562472;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o9eD6fBv50JvJ7Gx4KUjwD3EkSFG+lO7duRzw9dtFZs=;
 b=VhfLisTPAANLRAfvuMrMP3CS6nZf/N1oo0+9jE1blKxeWo8KgNDlXdjlc6GXZesCPi
 DsJjBJogVl7gLUbVuFCXHhSfpserzOCi9wZoWzrNdX4JxdCHWxA9Yb+g29e5l8+JH6ab
 o3kpQaC9H9wfqSoT6UEkpa2CACDPmMbaKKFQ5xwV+SujLr9gQTJe7vXd4eBGM8OG092Y
 cJHcGw+rsb3mz7K1NU2hqw8eyWi8Az9XQSu3hY2nChsb49HOzK57qdFZ1tkpjpyCcp27
 zvWa3kcncCo4IwiLZHNdDhH0g7oRovIb2LNem5lJsDSE/EWlJJ08nfCXDkgo8iDn/0kj
 ll+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVVcQqlKSNWHfF9IG8KnhGhFKOG35g4crSY7vv//jX6ARJAv3/EEjUXNGClF+HVlo7bF3twp7phro=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEBK4h7yUVFCgoH5E1HPf6BebKFZv3ES8vCeobyVBj6b9z4nCK
 Yz8zl5axPxDQrvLwnKWCoAGxqHlfbTtXDk0o9/ZhKah05rPDZrAcsY2iGcnwTlx6SnI=
X-Gm-Gg: ASbGncsLXU2EUmwSedbqJWE19K0KC6UaxdZbbysPLU/gwy5TVpouEpiT9dpx/+I4hVA
 FAB5dKz9sjn9HsysLBvYRcx+YdUlmOFMQw0tnZC2Sq1sEmPj9nsg7wrGKu0OUuBHjVUBTQaAWhf
 gcox0iR1sImSX0LfiPkMeTj3nV0gNxiXrnxn/v2b2uQWgn7q6TiLLbdTXY0cFLyELK5NzOKF4yD
 kfqbo5GhyPJqAbJvylE1SdVYMK1ls5pR7Z9duR+tX2F+TKldN3ETXgexVVcgGZ5IMRRH24eFmXS
 lROCHThRvWwFH+S0f8i9n3yylAXUlVCeAtHtFrYNM77jSFup17jUovoeY9j1vVDfqCMaWxy53dh
 p2AiulCaA4tDYa5NjWb3iZ7d9Yyk=
X-Google-Smtp-Source: AGHT+IH3/hKllTZ0eEK/dcuWTgO5QsHZ5LZ3JNRLIXTEioRhdRSPfL4GWfnU3eDieGqXq6aFnuzp+A==
X-Received: by 2002:a05:6214:5096:b0:6ed:1651:e8c1 with SMTP id
 6a1803df08f44-6fad90aa622mr189063246d6.13.1748957671754; 
 Tue, 03 Jun 2025 06:34:31 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.167.56.70]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6fac6e00b78sm80064216d6.75.2025.06.03.06.34.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 06:34:31 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1uMRmg-00000001h3q-2scY;
 Tue, 03 Jun 2025 10:34:30 -0300
Date: Tue, 3 Jun 2025 10:34:30 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alistair Popple <apopple@nvidia.com>
Cc: linux-mm@kvack.org, gerald.schaefer@linux.ibm.com,
 dan.j.williams@intel.com, willy@infradead.org, david@redhat.com,
 linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
 zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org,
 balbirs@nvidia.com, lorenzo.stoakes@oracle.com,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org, John@groves.net
Subject: Re: [PATCH 01/12] mm: Remove PFN_MAP, PFN_SG_CHAIN and PFN_SG_LAST
Message-ID: <20250603133430.GB386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <cb45fa705b2eefa1228e262778e784e9b3646827.1748500293.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb45fa705b2eefa1228e262778e784e9b3646827.1748500293.git-series.apopple@nvidia.com>
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

On Thu, May 29, 2025 at 04:32:02PM +1000, Alistair Popple wrote:
> The PFN_MAP flag is no longer used for anything, so remove it. The
> PFN_SG_CHAIN and PFN_SG_LAST flags never appear to have been used so
> also remove them.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> ---
>  include/linux/pfn_t.h             | 31 +++----------------------------
>  mm/memory.c                       |  2 --
>  tools/testing/nvdimm/test/iomap.c |  4 ----
>  3 files changed, 3 insertions(+), 34 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
