Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB58AEC76E
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jun 2025 15:32:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A91AE10E19A;
	Sat, 28 Jun 2025 13:32:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RV1RClEM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 372B010E137;
 Sat, 28 Jun 2025 13:32:07 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-6088d856c6eso5738880a12.0; 
 Sat, 28 Jun 2025 06:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751117525; x=1751722325; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=D7JNGwhqmkLHkCZJcO3wcG7mGEUYQ7GvAu9Lg/4W5vQ=;
 b=RV1RClEM6bTXIMqDcuLnLiwTVQGYGxVG9H2DnsTpN63mXIoPOFZkrVJxzRlmxOXtpS
 SAbi5mzNqe3JbKbQPAyrkQshExgbtYHjvEV7C90x5xreEzon4meslLgoOMN6ZkT72eRI
 VuRuLIAiXdMxK6jiHINX9A43NlINaaSKCwBCCfwwW1ZRcDBdcLqzEoCdbmRw/hMaxU19
 uLjiwDL/jlX4+YJ/sZ5yqU6+9rl7D4ha58HxDvKjme+MbiNgJ5Q4Q4x7ncz7NtWW4ki0
 QYXgwD0hdMCHNB47ne3KM/JYNrYOmraQPeEd/foEuCzNiqCMVVy6HQ8JSnjfM20clIFv
 DNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751117525; x=1751722325;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D7JNGwhqmkLHkCZJcO3wcG7mGEUYQ7GvAu9Lg/4W5vQ=;
 b=Px+PW7lqRWJXHPPyn5qHxp1iojC2HCe88XfOJaewNLTMUsbtLgU/MTXYBBYLy17kQD
 Yh4++BIqeAnBttaBYo2/KJHFPxpjHqxqGP0oIv8pjGLepoSvlgphTbnZ18BVftMbK2rc
 70t7a4Ot2NrxnbsinD7zebJnsJs/rNGgY3tHYNywGGNTUbG1r0d9uiQgTYFkvARL1SHx
 UU3SXj8dfBtJpOyFo5RFeFf8pA5Zhr9nvHS7SVt++NOMNN5aBimqKpi88XIIXILa6NoR
 AoTTPQwTJ9uQifhzfbWP3Bjtuf3uYzp6zis65q/m/z8vnldQRpBL1mKcgmd3TvTI8MbV
 yPrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV40WLvU6oKYMCEA2MBD+7+FdiK/8B7Vbp1ZspxDGrIgYLOmC7Re++937A3yehWrvo2Rd0QAJzo3ak=@lists.freedesktop.org,
 AJvYcCXcHIEWR8uc6Gb2TvIIi3C4iM758WTz7+fKfEVn23DpY9ynJTLNik/orp2xWTEGeErBBvApWtm8u91Z@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0NVhodaW05ugzGjGPb/YKkJA+GbwxvTIxTtmtqXSYuiIfRddo
 /7mLHzhIzakhBP0AyEsDUie3InPJUfj8Q2iYXyOa6CJ3YtrOwhv9WbdX
X-Gm-Gg: ASbGncvTCP2d175foedfuDef0srRGvb0S2cZoGzJN6rvaoUsAbtvkvGk4K7u6o4rZ2m
 IXEJvNrhWDAiZlpv3dBEGOwE07lFo4Jxl+d+I80cFOEGUaXTQ8LwzloEdTeaMunskz+5GtKKSs9
 Fs7tjeeBlkJE1+ygmuCJqGm6jZBF9kNqCfBoxRsn+RNMrlqvdQkq4xMqJKcbUFeLoZY8PuB24S+
 7ndxGDApetfjC81XPgcer+A+gq6fdS2Vl/q5qwOsDIcAL4tjDP5stQ6wIQ6xkOeJhLF4MyjODFx
 D3uVvjkhks7PzKiLakfLmfXT1MDIsXD2AiybqGx+6gW9VQhDZRFcDTGm9y6QndzoCUPHZeFN8d2
 pWS6OnwAKmZER2USrzJvtHziq+9RRGOXTIQ==
X-Google-Smtp-Source: AGHT+IGkr5LmRrohxl9zAROOcU5E/Kq1YD41LcYqKzh+gkq6NvJ2mXdabTSZBNm1MWhosMBzRjh4DA==
X-Received: by 2002:a17:907:7ea8:b0:ad5:3a97:8438 with SMTP id
 a640c23a62f3a-ae35013da97mr677648766b.41.1751117524324; 
 Sat, 28 Jun 2025 06:32:04 -0700 (PDT)
Received: from [192.168.1.17] (host-79-30-34-31.retail.telecomitalia.it.
 [79.30.34.31]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae35363aed9sm310552166b.24.2025.06.28.06.32.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Jun 2025 06:32:03 -0700 (PDT)
Message-ID: <6d2a4d30-47f6-432e-8f56-2dad0eb36a90@gmail.com>
Date: Sat, 28 Jun 2025 15:32:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/42] drm/msm: sparse / "VM_BIND" support
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Eugene Lepshy <fekz115@gmail.com>, Haoxiang Li <haoxiang_li2024@163.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Jun Nie <jun.nie@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linaro-mm-sig@lists.linaro.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linux-media@vger.kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maxime Ripard <mripard@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Antonino Maniscalco <antomani103@gmail.com>
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 6/25/25 8:46 PM, Rob Clark wrote:
> Conversion to DRM GPU VA Manager[1], and adding support for Vulkan Sparse
> Memory[2] in the form of:
> 
> 1. A new VM_BIND submitqueue type for executing VM MSM_SUBMIT_BO_OP_MAP/
>     MAP_NULL/UNMAP commands
> 
> 2. A new VM_BIND ioctl to allow submitting batches of one or more
>     MAP/MAP_NULL/UNMAP commands to a VM_BIND submitqueue
> 
> I did not implement support for synchronous VM_BIND commands.  Since
> userspace could just immediately wait for the `SUBMIT` to complete, I don't
> think we need this extra complexity in the kernel.  Synchronous/immediate
> VM_BIND operations could be implemented with a 2nd VM_BIND submitqueue.
> 
> The corresponding mesa MR: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/32533
> 
> Changes in v7:
> - Rebase on, and use, gpuvm locking helpers[4], included in this
>    series.
> - Various small fixes
> - Link to v6: https://lore.kernel.org/all/20250605183111.163594-1-robin.clark@oss.qualcomm.com/
> 
> Changes in v6:
> - Drop io-pgtable-arm patch as it has already been picked up in the
>    iommu tree.
> - Rework to drop gpuvm changes.  To mitigate the limitation of gpuvm
>    when it comes to lazy unmap (and to avoid ~5ms of unmap per pageflip!)
>    a vma_ref refcount is added.  This refcount is incremented when a BO
>    is pinned for scanout, and for userspace handles and dma-bufs.  The
>    VMA is torn down when this count drops to zero, breaking the reference
>    loop between the VM_BO and BO.  But as long as a pin or userspace
>    handle is keeping a reference to the BO live, we allow the harmless
>    reference loop to live.  (This is only for kernel managed VMs, which
>    includes the kms VM.)  If no userspace process has some sort of
>    handle to the BO, it is unlikely to be reused again.  (The exception
>    is GET_FB, but in that case the vma_ref >= 1 due to pin for scan-
>    out.)
> - Drop gpu sched changes for throttling and move this into the driver.
>    We can re-visit a more generic solution when some other driver
>    realizes they need the same thing.
> - Link to v5: https://lore.kernel.org/all/20250519175348.11924-1-robdclark@gmail.com/
> 
> Changes in v5:
> - Improved drm/sched enqueue_credit comments, and better define the
>    return from drm_sched_entity_push_job()
> - Improve DRM_GPUVM_VA_WEAK_REF comments, and additional WARN_ON()s to
>    make it clear that some of the gpuvm functionality is not available
>    in this mode.
> - Link to v4: https://lore.kernel.org/all/20250514175527.42488-1-robdclark@gmail.com/
> 
> Changes in v4:
> - Various locking/etc fixes
> - Optimize the pgtable preallocation.  If userspace sorts the VM_BIND ops
>    then the kernel detects ops that fall into the same 2MB last level PTD
>    to avoid duplicate page preallocation.
> - Add way to throttle pushing jobs to the scheduler, to cap the amount of
>    potentially temporary prealloc'd pgtable pages.
> - Add vm_log to devcoredump for debugging.  If the vm_log_shift module
>    param is set, keep a log of the last 1<<vm_log_shift VM updates for
>    easier debugging of faults/crashes.
> - Link to v3: https://lore.kernel.org/all/20250428205619.227835-1-robdclark@gmail.com/
> 
> Changes in v3:
> - Switched to seperate VM_BIND ioctl.  This makes the UABI a bit
>    cleaner, but OTOH the userspace code was cleaner when the end result
>    of either type of VkQueue lead to the same ioctl.  So I'm a bit on
>    the fence.
> - Switched to doing the gpuvm bookkeeping synchronously, and only
>    deferring the pgtable updates.  This avoids needing to hold any resv
>    locks in the fence signaling path, resolving the last shrinker related
>    lockdep complaints.  OTOH it means userspace can trigger invalid
>    pgtable updates with multiple VM_BIND queues.  In this case, we ensure
>    that unmaps happen completely (to prevent userspace from using this to
>    access free'd pages), mark the context as unusable, and move on with
>    life.
> - Link to v2: https://lore.kernel.org/all/20250319145425.51935-1-robdclark@gmail.com/
> 
> Changes in v2:
> - Dropped Bibek Kumar Patro's arm-smmu patches[3], which have since been
>    merged.
> - Pre-allocate all the things, and drop HACK patch which disabled shrinker.
>    This includes ensuring that vm_bo objects are allocated up front, pre-
>    allocating VMA objects, and pre-allocating pages used for pgtable updates.
>    The latter utilizes io_pgtable_cfg callbacks for pgtable alloc/free, that
>    were initially added for panthor.
> - Add back support for BO dumping for devcoredump.
> - Link to v1 (RFC): https://lore.kernel.org/dri-devel/20241207161651.410556-1-robdclark@gmail.com/T/#t
> 
> [1] https://www.kernel.org/doc/html/next/gpu/drm-mm.html#drm-gpuvm
> [2] https://docs.vulkan.org/spec/latest/chapters/sparsemem.html
> [3] https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=909700
> [4] https://lore.kernel.org/all/20250620154537.89514-1-robin.clark@oss.qualcomm.com/
> 
> Rob Clark (42):
>    drm/gpuvm: Fix doc comments
>    drm/gpuvm: Add locking helpers
>    drm/gem: Add ww_acquire_ctx support to drm_gem_lru_scan()
>    drm/msm: Rename msm_file_private -> msm_context
>    drm/msm: Improve msm_context comments
>    drm/msm: Rename msm_gem_address_space -> msm_gem_vm
>    drm/msm: Remove vram carveout support
>    drm/msm: Collapse vma allocation and initialization
>    drm/msm: Collapse vma close and delete
>    drm/msm: Don't close VMAs on purge
>    drm/msm: Stop passing vm to msm_framebuffer
>    drm/msm: Refcount framebuffer pins
>    drm/msm: drm_gpuvm conversion
>    drm/msm: Convert vm locking
>    drm/msm: Use drm_gpuvm types more
>    drm/msm: Split out helper to get iommu prot flags
>    drm/msm: Add mmu support for non-zero offset
>    drm/msm: Add PRR support
>    drm/msm: Rename msm_gem_vma_purge() -> _unmap()
>    drm/msm: Drop queued submits on lastclose()
>    drm/msm: Lazily create context VM
>    drm/msm: Add opt-in for VM_BIND
>    drm/msm: Mark VM as unusable on GPU hangs
>    drm/msm: Add _NO_SHARE flag
>    drm/msm: Crashdump prep for sparse mappings
>    drm/msm: rd dumping prep for sparse mappings
>    drm/msm: Crashdump support for sparse
>    drm/msm: rd dumping support for sparse
>    drm/msm: Extract out syncobj helpers
>    drm/msm: Use DMA_RESV_USAGE_BOOKKEEP/KERNEL
>    drm/msm: Add VM_BIND submitqueue
>    drm/msm: Support IO_PGTABLE_QUIRK_NO_WARN_ON
>    drm/msm: Support pgtable preallocation
>    drm/msm: Split out map/unmap ops
>    drm/msm: Add VM_BIND ioctl
>    drm/msm: Add VM logging for VM_BIND updates
>    drm/msm: Add VMA unmap reason
>    drm/msm: Add mmu prealloc tracepoint
>    drm/msm: use trylock for debugfs
>    drm/msm: Bump UAPI version
>    drm/msm: Defer VMA unmap for fb unpins
>    drm/msm: Add VM_BIND throttling
> 
>   drivers/gpu/drm/drm_gem.c                     |   14 +-
>   drivers/gpu/drm/drm_gpuvm.c                   |  132 +-
>   drivers/gpu/drm/msm/Kconfig                   |    1 +
>   drivers/gpu/drm/msm/Makefile                  |    1 +
>   drivers/gpu/drm/msm/adreno/a2xx_gpu.c         |   25 +-
>   drivers/gpu/drm/msm/adreno/a2xx_gpummu.c      |    5 +-
>   drivers/gpu/drm/msm/adreno/a3xx_gpu.c         |   17 +-
>   drivers/gpu/drm/msm/adreno/a4xx_gpu.c         |   17 +-
>   drivers/gpu/drm/msm/adreno/a5xx_debugfs.c     |    4 +-
>   drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |   22 +-
>   drivers/gpu/drm/msm/adreno/a5xx_power.c       |    2 +-
>   drivers/gpu/drm/msm/adreno/a5xx_preempt.c     |   10 +-
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c         |   32 +-
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.h         |    2 +-
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |   49 +-
>   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c   |    6 +-
>   drivers/gpu/drm/msm/adreno/a6xx_preempt.c     |   10 +-
>   drivers/gpu/drm/msm/adreno/adreno_device.c    |    4 -
>   drivers/gpu/drm/msm/adreno/adreno_gpu.c       |   99 +-
>   drivers/gpu/drm/msm/adreno/adreno_gpu.h       |   23 +-
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |   11 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   |   20 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h   |    3 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   18 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |   22 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h     |    2 -
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c     |    6 +-
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c      |   28 +-
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c    |   18 +-
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c     |    4 +-
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c      |   19 +-
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c    |   18 +-
>   drivers/gpu/drm/msm/dsi/dsi_host.c            |   14 +-
>   drivers/gpu/drm/msm/msm_drv.c                 |  185 +-
>   drivers/gpu/drm/msm/msm_drv.h                 |   30 +-
>   drivers/gpu/drm/msm/msm_fb.c                  |   33 +-
>   drivers/gpu/drm/msm/msm_fbdev.c               |    2 +-
>   drivers/gpu/drm/msm/msm_gem.c                 |  537 +++---
>   drivers/gpu/drm/msm/msm_gem.h                 |  276 ++-
>   drivers/gpu/drm/msm/msm_gem_prime.c           |   66 +
>   drivers/gpu/drm/msm/msm_gem_shrinker.c        |  104 +-
>   drivers/gpu/drm/msm/msm_gem_submit.c          |  300 ++--
>   drivers/gpu/drm/msm/msm_gem_vma.c             | 1508 ++++++++++++++++-
>   drivers/gpu/drm/msm/msm_gpu.c                 |  211 ++-
>   drivers/gpu/drm/msm/msm_gpu.h                 |  147 +-
>   drivers/gpu/drm/msm/msm_gpu_trace.h           |   14 +
>   drivers/gpu/drm/msm/msm_iommu.c               |  302 +++-
>   drivers/gpu/drm/msm/msm_kms.c                 |   18 +-
>   drivers/gpu/drm/msm/msm_kms.h                 |    2 +-
>   drivers/gpu/drm/msm/msm_mmu.h                 |   38 +-
>   drivers/gpu/drm/msm/msm_rd.c                  |   62 +-
>   drivers/gpu/drm/msm/msm_ringbuffer.c          |   10 +-
>   drivers/gpu/drm/msm/msm_submitqueue.c         |   96 +-
>   drivers/gpu/drm/msm/msm_syncobj.c             |  172 ++
>   drivers/gpu/drm/msm/msm_syncobj.h             |   37 +
>   include/drm/drm_gem.h                         |   10 +-
>   include/drm/drm_gpuvm.h                       |    8 +
>   include/uapi/drm/msm_drm.h                    |  149 +-
>   58 files changed, 3712 insertions(+), 1263 deletions(-)
>   create mode 100644 drivers/gpu/drm/msm/msm_syncobj.c
>   create mode 100644 drivers/gpu/drm/msm/msm_syncobj.h
> 

I've been testing and helping debug this series:

Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>
