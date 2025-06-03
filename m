Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1205FACC85B
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 15:50:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72F4010E638;
	Tue,  3 Jun 2025 13:50:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="AfQa7hOR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F7C10E638
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 13:50:20 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-4a43e277198so40308321cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jun 2025 06:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1748958619; x=1749563419; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YkymsPnXdQBda6JrJEhL1GWpprQuWSyxObGqKIJXWus=;
 b=AfQa7hORICYQeZewhX5EIGR0VPZGilAr8Xs6i+LS+khSsMfnGiPt4B1OWc2fd4Ysx3
 6gwJOan46VRmMFmXjkGXo8f+C49Lh/acQnuj0hcpkFveBA1Q7p5GwdBVcY07i1SysUCk
 pmSadvqeLUqzVDxwdIYyEUtAnceQnb4VH1IFV+pQU5A285LGzDGerVs4pRiRiNrJLIZV
 kSxdHISBSC7ZAOya+0lPy9GL2Ci33tGcae9/szxCQXA7rpeynapfjmwNqhoPfzgrIXqQ
 1MAfGdVKDW7cVhZqeBOSaF837dunKbvYEfFwsoQTatLHGBHt8zS8K74i495K/MAvl1ZU
 TUjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748958619; x=1749563419;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YkymsPnXdQBda6JrJEhL1GWpprQuWSyxObGqKIJXWus=;
 b=UdIRhxgLA67YbO5eIoNRgZrjhcMMOCjYDNvMkrWK5zszFrk4y0DGGFnAUQ9J+ypAT6
 KDPUmCMhTi9iceXNg1sQH+pMippy6ZQM9oUCQyZJ2nRWQgmpWEEcw/VAiRd9u0v/kbzv
 KAJOb365kr4YLogkoTaQzan7mM4BmtXYrPApzSbE20q51GimE6CRxjqhcpx5G8+svpy5
 xQ2bKvYrsYQ4vV51QKfIZ/GSoSld28Klu+plDYjcVhRj0p4CFGQgi5JUt/YRjr6/XB/o
 dAVhd6lodAzYyyWkzmqddHR9e50LZkPgwNNzjPWTzj/0/nRV+BEenRYHTM1G48PUntrI
 mSsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVc5yYO26bE3wHmw/ITOJycxCUS02xTivHNJH0bB0pHBA5vpDVuBnE254gI6pCumOM0xDswtV9A3Mk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTvmxyiSbP8TShN2q/5bP0TKTIjRYF3R2tSiIVEKhNWeFAMwvZ
 mHjVwJX7W/WR7AFGpmHJUKCl/B81Cx4bRwrl+sexVYSOIb+8C0Q86T2LxZAKE+tbHKc=
X-Gm-Gg: ASbGncsHFRlN2JJ5o5fxenTqjQIWOJAW9Lb74BTzIK/T185Z9qwIUfqi7xs3xNEn8U+
 HVa16/iDdU+s4D7lfbaC/Bw9YeL/OtJwWHRY0c5x2gLjDEofjhKYIarczot0feTuZUHzkzmYXZq
 kjuHrw8aKH9S+Zlpyo5idPBxbdj8SZzZASG752DDzm5fwu3DsKiGQDTipSsqa7WDSy/YEvGuGKj
 7H7bwg4M6TuXadRg19Oy9vp6EFEG+nz6e9BRvGLM0QIUBuMn1tJ4PBWtSunOBZb+TESmfMxq6Vv
 3zskVDM3oWusPiu5DXKRrogXifPnB33PlKcMoJrYWgGw8itm7y08nkzlFXoSc0IVoiIgBtS3idT
 hVp+6B1nZEA0BnZuh1S8yrIe0O4E=
X-Google-Smtp-Source: AGHT+IFrQ3mNOrW6/ZBr5BKf2weoO3iOKbQMChhnKb6iKzSLwy4jyxYkXr8u6rUugOKC/0R4gbcrnw==
X-Received: by 2002:a05:622a:4d96:b0:4a4:3171:b942 with SMTP id
 d75a77b69052e-4a4aed86ba3mr229299171cf.39.1748958619327; 
 Tue, 03 Jun 2025 06:50:19 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.167.56.70]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a4358eef6csm75933171cf.48.2025.06.03.06.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 06:50:18 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1uMS1y-00000001hCj-1MTz;
 Tue, 03 Jun 2025 10:50:18 -0300
Date: Tue, 3 Jun 2025 10:50:18 -0300
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
 linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org,
 John@groves.net, Will Deacon <will@kernel.org>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
Subject: Re: [PATCH 10/12] mm: Remove devmap related functions and page table
 bits
Message-ID: <20250603135018.GK386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <32209333cfdddffc76f18981f41a989b14780956.1748500293.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <32209333cfdddffc76f18981f41a989b14780956.1748500293.git-series.apopple@nvidia.com>
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

On Thu, May 29, 2025 at 04:32:11PM +1000, Alistair Popple wrote:
> Now that DAX and all other reference counts to ZONE_DEVICE pages are
> managed normally there is no need for the special devmap PTE/PMD/PUD
> page table bits. So drop all references to these, freeing up a
> software defined page table bit on architectures supporting it.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Acked-by: Will Deacon <will@kernel.org> # arm64
> Suggested-by: Chunyan Zhang <zhang.lyra@gmail.com>
> Reviewed-by: Björn Töpel <bjorn@rivosinc.com>
> ---
>  Documentation/mm/arch_pgtable_helpers.rst     |  6 +--
>  arch/arm64/Kconfig                            |  1 +-
>  arch/arm64/include/asm/pgtable-prot.h         |  1 +-
>  arch/arm64/include/asm/pgtable.h              | 24 +--------
>  arch/loongarch/Kconfig                        |  1 +-
>  arch/loongarch/include/asm/pgtable-bits.h     |  6 +--
>  arch/loongarch/include/asm/pgtable.h          | 19 +------
>  arch/powerpc/Kconfig                          |  1 +-
>  arch/powerpc/include/asm/book3s/64/hash-4k.h  |  6 +--
>  arch/powerpc/include/asm/book3s/64/hash-64k.h |  7 +--
>  arch/powerpc/include/asm/book3s/64/pgtable.h  | 53 +------------------
>  arch/powerpc/include/asm/book3s/64/radix.h    | 14 +-----
>  arch/riscv/Kconfig                            |  1 +-
>  arch/riscv/include/asm/pgtable-64.h           | 20 +-------
>  arch/riscv/include/asm/pgtable-bits.h         |  1 +-
>  arch/riscv/include/asm/pgtable.h              | 17 +------
>  arch/x86/Kconfig                              |  1 +-
>  arch/x86/include/asm/pgtable.h                | 51 +-----------------
>  arch/x86/include/asm/pgtable_types.h          |  5 +--
>  include/linux/mm.h                            |  7 +--
>  include/linux/pgtable.h                       | 19 +------
>  mm/Kconfig                                    |  4 +-
>  mm/debug_vm_pgtable.c                         | 59 +--------------------
>  mm/hmm.c                                      |  3 +-
>  mm/madvise.c                                  |  8 +--
>  25 files changed, 17 insertions(+), 318 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
