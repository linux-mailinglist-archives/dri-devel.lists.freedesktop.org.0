Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E9C497E7E
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 13:08:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42A5C10E71D;
	Mon, 24 Jan 2022 12:08:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 498EF10E71D;
 Mon, 24 Jan 2022 12:08:30 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 o30-20020a05600c511e00b0034f4c3186f4so2961397wms.3; 
 Mon, 24 Jan 2022 04:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=XArnnH4OvrxRcoFfpFy+puuAOs1zK8Kgo1S3kPJSJSw=;
 b=Jc276FuGvUAjhsukljJ+yBmJsnTKcW5NrocuudRyuV338c+REYomAqV50vs3b9w4gw
 jQUdowlUT4PRsPPsTAx3vb+xhwoOyrYKpR9Yc+Tii6O6Pa7p/nbIXGl23Dc7cyglQCdj
 /h5svWv15McmcBB+SVksjK92+h0n0fJw40OLE2eieebA957FhvtKGR0hjGKQV4L8E1jT
 ULJQlldeeOX3wdAa0621QBFB1gY3WE2BqPzwM3CJ5bFnJLxjaQPzu5VlFPBnYQIxnLda
 Vhqv8J9RWPMvMK4I0olcJ33FVxRcdbNGVrSgt20UGyTLJIwHtLqMfwvzw6f3J+0KLU90
 m9Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=XArnnH4OvrxRcoFfpFy+puuAOs1zK8Kgo1S3kPJSJSw=;
 b=Opz/v7ZvEE0lBdRSVns4oxR8dqMsqJP+eCSbZHxDCNQNQXyQjK/MIJ2Nhn7P+6zhG+
 Oo3hOrl8rKaI51blpOVxIN8X0TWAT8q9sHSnXhzhlxJ2M+49a5qfcTdeWtIilZItDo4y
 UNKgr+0T+8G4BLUpWbkI846JqWTDpcovMp63Nl5oMqoNB+Asn5k4n3to3qhr0I2shTRJ
 ZoPjeOgPC0mHAHBYFWcTvrGZbh9L1FwO9bSNlZO0ZhtsIjvuW8tX/poe1vhtNzLTxtyx
 VruVscqFNJAUPSZxaPpaq0ZRu8V6hsTWZV3GBU3nQ6WXQh9UEsAgqJjWsoONId4pzb6t
 /DnQ==
X-Gm-Message-State: AOAM530bwdsr7Ym0RuLoIL+9av85VLSTBAzoGjN8Ujzr49nMOL+QE+zo
 szb0kRh3a5PLzVSHj1ir9Wo83zveDDY=
X-Google-Smtp-Source: ABdhPJxx9aW2LXSFk8wJPNYSMOgRQT/XrKepKIzP/Y7B/Y5B2yDT0IK8LOJk1hzSqfc71Sgws6OTQA==
X-Received: by 2002:a7b:c5c4:: with SMTP id n4mr1572870wmk.134.1643026108567; 
 Mon, 24 Jan 2022 04:08:28 -0800 (PST)
Received: from [192.168.178.21] (p57b0bff8.dip0.t-ipconnect.de.
 [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id c14sm17849799wri.32.2022.01.24.04.08.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 04:08:28 -0800 (PST)
Subject: Re: [PATCH V2 0/7] DRM kmap() fixes and kmap_local_page() conversions
To: ira.weiny@intel.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20220124015409.807587-1-ira.weiny@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <a56344b6-b1bd-6749-5ed2-5f38bf79dcee@gmail.com>
Date: Mon, 24 Jan 2022 13:08:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220124015409.807587-1-ira.weiny@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 24.01.22 um 02:54 schrieb ira.weiny@intel.com:
> From: Ira Weiny <ira.weiny@intel.com>
>
> Changes from V1:
> 	Use memcpy_to_page() where appropriate
> 	Rebased to latest
>
> The kmap() call may cause issues with work being done with persistent memory.
> For this and other reasons it is being deprecated.

I'm really wondering how we should be able to implement the kernel 
mapping without kmap in TTM.

> This series starts by converting the last easy kmap() uses in the drm tree to
> kmap_local_page().
>
> The final 2 patches fix bugs found while working on the ttm_bo_kmap_ttm()
> conversion.  They are valid fixes but were found via code inspection not
> because of any actual bug so don't require a stable tag.[1]
>
> There is one more call to kmap() used in ttm_bo_kmap_ttm().  Unfortunately,
> fixing this is not straight forward so it is left to future work.[2]

Patches #2, #4, #6 and #7 are Reviewed-by: Christian König 
<christian.koenig@amd.com>

How to you now want to push those upstream? I can pick them up for the 
AMD tree like Daniel suggested or you can push them through something else.

Regards,
Christian.

>
> [1] https://lore.kernel.org/lkml/fb71af05-a889-8f6e-031b-426b58a64f00@amd.com/
> [2] https://lore.kernel.org/lkml/20211215210949.GW3538886@iweiny-DESK2.sc.intel.com/
>
>
> Ira Weiny (7):
> drm/i915: Replace kmap() with kmap_local_page()
> drm/amd: Replace kmap() with kmap_local_page()
> drm/gma: Remove calls to kmap()
> drm/radeon: Replace kmap() with kmap_local_page()
> drm/msm: Alter comment to use kmap_local_page()
> drm/amdgpu: Ensure kunmap is called on error
> drm/radeon: Ensure kunmap is called on error
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 8 ++++----
> drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c | 1 +
> drivers/gpu/drm/gma500/gma_display.c | 6 ++----
> drivers/gpu/drm/gma500/mmu.c | 8 ++++----
> drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 6 ++----
> drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c | 8 ++++----
> drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c | 4 ++--
> drivers/gpu/drm/i915/gt/shmem_utils.c | 7 ++-----
> drivers/gpu/drm/i915/i915_gem.c | 8 ++++----
> drivers/gpu/drm/i915/i915_gpu_error.c | 4 ++--
> drivers/gpu/drm/msm/msm_gem_submit.c | 4 ++--
> drivers/gpu/drm/radeon/radeon_ttm.c | 4 ++--
> drivers/gpu/drm/radeon/radeon_uvd.c | 1 +
> 13 files changed, 32 insertions(+), 37 deletions(-)
>
> --
> 2.31.1
>

