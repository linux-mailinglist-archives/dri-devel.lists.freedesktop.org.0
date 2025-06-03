Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A31C5ACC80B
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 15:38:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C3C910E5D3;
	Tue,  3 Jun 2025 13:38:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="UaHMzgf3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AC7410E5D3
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 13:38:39 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id
 6a1803df08f44-6face367320so41861236d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jun 2025 06:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1748957919; x=1749562719; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2YoBzO9/Vr83m9kWgElnZwYJY0cXKTy7GFrgVmwfY4k=;
 b=UaHMzgf3Gaebs7XfuHIgK94O0dWRP+zG1nQNGLg2W0ZCA7ZV9IDZeAj69f1sNYdIVL
 sd0Z+PZoR+NAGmFei9FY7XKG5ftrpotbm8qVBcWS6cZSniygy+JPbYZKjQc/EZneIEGp
 oauyLdcmu17/7ig41AiC70a/KLIktu85U0nHNYjOjFWUOVjDr9iVp3q48BBxZeBOmXD6
 5sUpKl0GmTp4B+rcHZiR3LB/lhrVhLuR+4ngWsrjJ+8Gin9pPDuPQfXbv1u8b+iU8WKz
 MNPRgRvY02QiM/C8UyjNEAp7K49rDCtNrnXhjYWOUILn65Pq3832z5RJkB4hJ9arIBXg
 YfnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748957919; x=1749562719;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2YoBzO9/Vr83m9kWgElnZwYJY0cXKTy7GFrgVmwfY4k=;
 b=vnZiHRxKeNSd3vTXD/yYiIDTliiuI6U4r0WplIg+hMTvbdEWUbth6KKdqoObteNkNR
 IApycEzCmojSZS8k8pAbLd5eY4zn6Hadi/vzM+U+qlcFt2vSNZQv0EIqNdAadfWSDR4y
 uIeTdtMRhFnwR9In4kibwWLLx8Yv7eA6yhQssCFLTANUYPvCJ3ccKVp44M2jnZPFw4gp
 ePT4h8zeYBVwTxQnhTDuJCOEqfR5uROcMoQ7TudDK7l4mZPU57cbxYisYg4Yp+ZqQnz3
 4woV6KA0U+oX96pbunfbkiTU8W3OoA3IL0Mx2fomgIdZr9Gv4URh20VSlniBfukwUiGe
 jAFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEp/hryebBUu2Y8Ikvxqh0MnamDQ+du943PUsJYg+7ZjITqwjagH+JDwJof02QluxPWzVe4BI7RF8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2ZEdqaubRg7rRZSPS+NAZsRu9WnQs0trp1Kvx4SD28iWKzxcl
 05wVJ/X4cIzBR5DzPUebky1oxsG4UOR9h+CmK6Md+g918REeO8ntMs79/LqBajb5Z2M=
X-Gm-Gg: ASbGnctxZxI2dpU+OwvFVy6HBmQPOtR9vz1Wt0PEvxvWGfGkEDHCpzzKGd6ThZlfyLh
 /nqS/HzVwrqYFjKNwpAGwKq0DWBYsxWAlZgSC3v6Op6wJOcl8aw2R21y06WiMxrjXKKq4bC1+fY
 Py0sjMeF1u/EVyzlugDxMSXvBJ+taZmk30lZOVDqbbJ724CJ99x6X5RF8p+VisiM6iCeLiJoHnG
 pkJcJOLR0MWmlwMbKiFQsmq1cGyUysjgZEQikB0gfcEosOXYuSsWiYwuOzZzVTuRGTOrMckciGX
 UBH4T163knNFtY/EuLO+Xd1BgUrJahTRt3hRBH+sLEBwKGSzvYe1YvxyVzv0lkqgttHv7MLRUZb
 5cPpFi3vbdPdPN7ELHSbITicq27g=
X-Google-Smtp-Source: AGHT+IFNNgr1gOgNIDIKGgPc3bhuHOtoZeZOnCuhf1c+LALW25Lvqo21bVxhfooiSUL50e5IoEYUCA==
X-Received: by 2002:a05:6214:194d:b0:6f5:3a79:a4b2 with SMTP id
 6a1803df08f44-6fad191b357mr264142056d6.14.1748957918424; 
 Tue, 03 Jun 2025 06:38:38 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.167.56.70]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6fac6e1a681sm80140746d6.98.2025.06.03.06.38.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 06:38:37 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1uMRqf-00000001h6M-29EG;
 Tue, 03 Jun 2025 10:38:37 -0300
Date: Tue, 3 Jun 2025 10:38:37 -0300
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
Subject: Re: [PATCH 05/12] mm: Remove remaining uses of PFN_DEV
Message-ID: <20250603133837.GF386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <ee89c9f307c6a508fe8495038d6c3aa7ce65553b.1748500293.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee89c9f307c6a508fe8495038d6c3aa7ce65553b.1748500293.git-series.apopple@nvidia.com>
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

On Thu, May 29, 2025 at 04:32:06PM +1000, Alistair Popple wrote:
> PFN_DEV was used by callers of dax_direct_access() to figure out if the
> returned PFN is associated with a page using pfn_t_has_page() or
> not. However all DAX PFNs now require an assoicated ZONE_DEVICE page so can
> assume a page exists.
> 
> Other users of PFN_DEV were setting it before calling
> vmf_insert_mixed(). This is unnecessary as it is no longer checked, instead
> relying on pfn_valid() to determine if there is an associated page or not.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/gma500/fbdev.c     |  2 +-
>  drivers/gpu/drm/omapdrm/omap_gem.c |  5 ++---
>  drivers/s390/block/dcssblk.c       |  3 +--
>  drivers/vfio/pci/vfio_pci_core.c   |  6 ++----
>  fs/cramfs/inode.c                  |  2 +-
>  include/linux/pfn_t.h              | 25 ++-----------------------
>  mm/memory.c                        |  4 ++--
>  7 files changed, 11 insertions(+), 36 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
