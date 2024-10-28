Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E18B9B2F53
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 12:53:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F01BC10E483;
	Mon, 28 Oct 2024 11:53:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="15sGmTsn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E8010E483
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 11:53:39 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4315ee633dcso143685e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 04:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1730116417; x=1730721217;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=s8ohfpnIEvg7feisWnyEQsAMOz4YBMRZ4DT963EvlJY=;
 b=15sGmTsncheQoPqYf8kMsuPF65ZC5ZJ/UoF5SnAOxdbkkra+3di1yMfvnXC2GspHku
 lPSDniaJ/4rGeiVG1xbaGTjx939WGeNhKKn5rEpC7h1Tg9jIcJTbhC+GM2F7WZV3WDIP
 +iFIQ8EtgHRP/gP9pLlFGTpdDJ5rhVlEUtgg4Sgevw6pa7SlQQKVVjAxRqiiAFS0kbge
 M46gPK86+O1mv1n68vyU6dbAuXGDriaDpC3rzW1j/GJBSS2k16UNNXDwHV2YpbHkAyiy
 Kke+dXOItcHZadJoBMv8qVllrPJScUdGCELW2O03ZVj1WLH12Dy8OYClieNR/GjZBcs9
 zVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730116417; x=1730721217;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s8ohfpnIEvg7feisWnyEQsAMOz4YBMRZ4DT963EvlJY=;
 b=b2pUWx/gOtX5BbqUWzOBNFce+4Vgmitoa6GtRMoH7I28Bb5P787KuJWuVr+xtaB5BO
 OuCwhyeE6l2VER3CtMz/kUud/fDSRkG6ZBOXlV9Oxx11OYGRW5MRQI5vlaIio62JFd15
 dutX+JJU68iwKgrmUVy6beASg+jtfyk1B/E0aU72xZnLwqrTlTVDr97DY7Zfi7PsNG1n
 NKkAZXJfrUBPdsZxLrKUiv9XGA43kcncbXnfz4Xpnaj3sygnbDlf/GoMWHHuvmpJMJ5R
 78hKBfmT6CJ+f2WkSKZaVKuLVxK/e6FEsXU5CjhK1WUrdyjvRUgZMGutOykJvgtDHMzl
 TRRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjUyaxcRBr6eBC4FqJEssNJq+BNKLfDOiFETVtnvjE7ETrnPdvKuAPC1ctnn9mDWrCoFohMfiHg9g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3ikEXkHblRjjgI7w049CL6axfpbPQUPKQkmTA6hbOKGE3s0GI
 J048jlyX+J0dbPNqtpZgAhrh8Y53hWI0bFQm9zjQtyqwE7+ALyrH8b9qlritYA==
X-Google-Smtp-Source: AGHT+IFAG1wQgZSHD4GZ1FDVInCNhg5i9ZX5wl+jOWzRo1tsON7IOnOTabrNuttxFekm1NvUnzUp2w==
X-Received: by 2002:a05:600c:1e8f:b0:426:66a0:6df6 with SMTP id
 5b1f17b1804b1-4319ab034e8mr4472705e9.0.1730116417455; 
 Mon, 28 Oct 2024 04:53:37 -0700 (PDT)
Received: from google.com (88.140.78.34.bc.googleusercontent.com.
 [34.78.140.88]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4319359527asm106666165e9.16.2024.10.28.04.53.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 04:53:36 -0700 (PDT)
Date: Mon, 28 Oct 2024 11:53:33 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Rob Clark <robdclark@gmail.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Clark <robdclark@chromium.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <dri-devel@lists.freedesktop.org>, 
 "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <freedreno@lists.freedesktop.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Joao Martins <joao.m.martins@oracle.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <linux-arm-msm@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:SUSPEND TO RAM" <linux-pm@vger.kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Sean Paul <sean@poorly.run>, Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v9 0/4] io-pgtable-arm + drm/msm: Extend iova fault
 debugging
Message-ID: <Zx97PU7cUEVCnpPl@google.com>
References: <20240827181717.187245-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240827181717.187245-1-robdclark@gmail.com>
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

Hi Rob,

On Tue, Aug 27, 2024 at 11:17:08AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> This series extends io-pgtable-arm with a method to retrieve the page
> table entries traversed in the process of address translation, and then
> beefs up drm/msm gpu devcore dump to include this (and additional info)
> in the devcore dump.
> 
> This is a respin of https://patchwork.freedesktop.org/series/94968/
> (minus a patch that was already merged)
> 
> v2: Fix an armv7/32b build error in the last patch
> v3: Incorperate Will Deacon's suggestion to make the interface
>     callback based.
> v4: Actually wire up the callback
> v5: Drop the callback approach
> v6: Make walk-data struct pgtable specific and rename
>     io_pgtable_walk_data to arm_lpae_io_pgtable_walk_data
> v7: Re-use the pgtable walker added for arm_lpae_read_and_clear_dirty()
> v8: Pass pte pointer to callback so it can modify the actual pte
> v9: Fix selftests_running case
> 
> Rob Clark (4):
>   iommu/io-pgtable-arm: Make pgtable walker more generic
>   iommu/io-pgtable-arm: Re-use the pgtable walk for iova_to_phys
>   iommu/io-pgtable-arm: Add way to debug pgtable walk
>   drm/msm: Extend gpu devcore dumps with pgtbl info

Do you have plans to post another version of this series, as I am
working on some patches, that would use some of the common page walk
logic, so it would be more convenient to have them upstream.
Otherwise, I can have your series as a dependency.

Thanks,
Mostafa


> 
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  10 ++
>  drivers/gpu/drm/msm/msm_gpu.c           |   9 ++
>  drivers/gpu/drm/msm/msm_gpu.h           |   8 ++
>  drivers/gpu/drm/msm/msm_iommu.c         |  22 ++++
>  drivers/gpu/drm/msm/msm_mmu.h           |   3 +-
>  drivers/iommu/io-pgtable-arm.c          | 149 +++++++++++++++---------
>  include/linux/io-pgtable.h              |  15 +++
>  7 files changed, 160 insertions(+), 56 deletions(-)
> 
> -- 
> 2.46.0
> 
