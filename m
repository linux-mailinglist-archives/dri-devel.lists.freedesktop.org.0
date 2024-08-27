Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3299607DA
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 12:51:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 508DE10E2F0;
	Tue, 27 Aug 2024 10:51:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="AN3y2WSH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C992910E2F1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 10:51:46 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-428101fa30aso46246595e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 03:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1724755905; x=1725360705; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MQcYEkWd4AMQGEHcBCDy3Lmlo27SWVbuStzhtGu6A3Q=;
 b=AN3y2WSHy02OJnJjIS7P6nkmZvbGr8+Q8Mv+HKvawAYC5tnDP0sESzqPVG6YuBzYRk
 tQVUA/7V6Ch+u+poOjX54rdA1OTLNZMLlqBvIMm3fBTC7qPTCpYHQ1vT9lLQBHvI9844
 BYjQ1oXPNkkdkTx56BfHbl3alsI44qpe+zt9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724755905; x=1725360705;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MQcYEkWd4AMQGEHcBCDy3Lmlo27SWVbuStzhtGu6A3Q=;
 b=VcAsZhtZHGAvLUcNa6wioQSpXy65zJG3kwQeS+3S+G4RKTw2GRtFLqMLnDJv+z2Tee
 Dd7CKB/hmhbNUvhMwmIv8m2ILUBF2r0cxA6lUFRcrYl/GSmu7aeZKlKZzAYURX0kxoHG
 UszkEmIhux7e7CXjWjqd5Q9E7Y7fCY1HlTg6o+k1kTI61rMCi184SGHExOsA1/wijm0t
 WdUAKkEvZyj6UEcD/NMrHAPx0J5qZS3HNI8nm4ofivelsdaGC1GOwkBac4emXsM8DNjE
 +JCGLTi+6YUew0Z57CtOZ5gFSpFPPYC+rE3Kbo8LuWiVwkNJZvwHDtIDp6IJ3KEVBJn3
 xQrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzmkHUI0HNiAL4H11iugPN/mknSddd30/pNwS4xGGkQRT8CDSipPxHvRDDv+H2nkfhMlKgVxt3xRk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRBYuO8I8xCnV2AyQjwEJ3arZxecXP+MN31rUi3aAQKtdRgN3H
 3YxMpobW2d0a0NLED8rBnno/fXmHUksCK174WB2fKZ70AZb/MPFDSaS3kiFbC+c=
X-Google-Smtp-Source: AGHT+IG9jrKusHz977m7KjfruSbOy0979Crz2w/s8XngzzWuhgmmQY6kLRYsdvG8HTlnUUJevaoz2g==
X-Received: by 2002:a05:600c:1c0d:b0:426:8884:2c58 with SMTP id
 5b1f17b1804b1-42b9adaa432mr18310625e9.4.1724755904796; 
 Tue, 27 Aug 2024 03:51:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-373081ffb66sm12824889f8f.84.2024.08.27.03.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2024 03:51:44 -0700 (PDT)
Date: Tue, 27 Aug 2024 12:51:41 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dim-tools@lists.freedesktop.org
Subject: Re: [PULL] drm-xe-next
Message-ID: <Zs2vvdLV_NwMLOYW@phenom.ffwll.local>
References: <hecdxenxufrcps4ktypq64p3r6h5hp77c2sag2mkkvcmjploge@iyixts55vxus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hecdxenxufrcps4ktypq64p3r6h5hp77c2sag2mkkvcmjploge@iyixts55vxus>
X-Operating-System: Linux phenom 6.9.12-amd64 
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

On Thu, Aug 22, 2024 at 03:55:23PM -0500, Lucas De Marchi wrote:
> Hi Dave and Sima,
> 
> Second drm-xe-next pull request for the 6.12 cycle.
> 
> Several fixes here that are also going through drm-xe-fixes. Most of the
> other changes are the missing bits for Xe2 (LNL and BMG) and general
> refactors.
> 
> The only UAPI change is actually a fix for building with gcc 5.
> 
> I left some commits out since they were too fresh and I didn't have core
> CI results for them. Plan is to send the final pull request for 6.12
> next week with those commits.
> 
> thanks
> Lucas De Marchi
> 
> drm-xe-next-2024-08-22:
> UAPI Changes:
> - Fix OA format masks which were breaking build with gcc-5
> 
> Cross-subsystem Changes:
> - drm/ttm: Add a flag to allow drivers to skip clear-on-free

There's a revert floating around for that, and I don't like pull that
temporary state into drm-next since a bunch of people explicitly asked for
drm-next to catch up so they can do backmerges. Can you pls do a new pull
where that revert is included? Incremental changelog is fine, I can apply
them both back-to-back.

Thanks, Sima
> 
> Driver Changes:
> - Use dma_fence_chain_free in chain fence unused as a sync (Matthew Brost)
> - Refactor hw engine lookup and mmio access to be used in more places
>   (Dominik, Matt Auld, Mika Kuoppala)
> - Enable priority mem read for Xe2 and later (Pallavi Mishra)
> - Fix PL1 disable flow in xe_hwmon_power_max_write (Karthik)
> - Fix refcount and speedup devcoredump (Matthew Brost)
> - Add performance tuning changes to Xe2 (Akshata, Shekhar)
> - Fix OA sysfs entry (Ashutosh)
> - Add first GuC firmware support for BMG (Julia)
> - Bump minimum GuC firmware for platforms under force_probe to match LNL
>   and BMG (Julia)
> - Fix access check on user fence creation (Nirmoy)
> - Add/document workarounds for Xe2 (Julia, Daniele, John, Tejas)
> - Document workaround and use proper WA infra (Matt Roper)
> - Fix VF configuration on media GT (Michal Wajdeczko)
> - Fix VM dma-resv lock (Matthew Brost)
> - Allow suspend/resume exec queue backend op to be called multiple times
>   (Matthew Brost)
> - Add GT stats to debugfs (Nirmoy)
> - Add hwconfig to debugfs (Matt Roper)
> - Compile out all debugfs code with ONFIG_DEUBG_FS=n (Lucas)
> - Offload system clear page to GPU (Nirmoy)
> - Remove dead kunit code (Jani Nikula)
> - Refactor drvdata storing to help display (Jani Nikula)
> - Cleanup unsused xe parameter in pte handling (Himal)
> - Rename s/enable_display/probe_display/ for clarity (Lucas)
> - Fix missing MCR annotation in couple of registers (Tejas)
> - Fix DGFX display suspend/resume (Maarten)
> - Prepare exec_queue_kill for PXP handling (Daniele)
> - Fix devm/drmm issues (Daniele, Matthew Brost)
> - Fix tile fini sequence (Brost)
> - Fix crashes when probing without firmware in place (Daniele)
> - Use xe_managed for kernel BOs (Daniele, Matthew Brost)
> - Future-proof dss_per_group calculation by using hwconfig (Matt Roper)
> - Use reserved copy engine for user binds on faulting devices
>   (Matthew Brost)
> - Allow mixing dma-fence jobs and long-running faulting jobs (Francois)
> - Cleanup redundant arg when creating use BO (Nirmoy)
> - Prevent UAF around preempt fence (Auld)
> - Fix display suspend/resume (Maarten)
> - Use vma_pages() helper (Thorsten)
> The following changes since commit a809b92ee0f84c3f655b16a8b4d04bc3665d954a:
> 
>   Merge tag 'drm-intel-next-2024-08-13' of https://gitlab.freedesktop.org/drm/i915/kernel into drm-next (2024-08-16 12:56:42 +1000)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-2024-08-22
> 
> for you to fetch changes up to 23683061805be368c8d1c7e7ff52abc470cac275:
> 
>   drm/xe/lnl: Offload system clear page activity to GPU (2024-08-19 17:49:00 +0200)
> 
> ----------------------------------------------------------------
> UAPI Changes:
> - Fix OA format masks which were breaking build with gcc-5
> 
> Cross-subsystem Changes:
> - drm/ttm: Add a flag to allow drivers to skip clear-on-free
> 
> Driver Changes:
> - Use dma_fence_chain_free in chain fence unused as a sync (Matthew Brost)
> - Refactor hw engine lookup and mmio access to be used in more places
>   (Dominik, Matt Auld, Mika Kuoppala)
> - Enable priority mem read for Xe2 and later (Pallavi Mishra)
> - Fix PL1 disable flow in xe_hwmon_power_max_write (Karthik)
> - Fix refcount and speedup devcoredump (Matthew Brost)
> - Add performance tuning changes to Xe2 (Akshata, Shekhar)
> - Fix OA sysfs entry (Ashutosh)
> - Add first GuC firmware support for BMG (Julia)
> - Bump minimum GuC firmware for platforms under force_probe to match LNL
>   and BMG (Julia)
> - Fix access check on user fence creation (Nirmoy)
> - Add/document workarounds for Xe2 (Julia, Daniele, John, Tejas)
> - Document workaround and use proper WA infra (Matt Roper)
> - Fix VF configuration on media GT (Michal Wajdeczko)
> - Fix VM dma-resv lock (Matthew Brost)
> - Allow suspend/resume exec queue backend op to be called multiple times
>   (Matthew Brost)
> - Add GT stats to debugfs (Nirmoy)
> - Add hwconfig to debugfs (Matt Roper)
> - Compile out all debugfs code with ONFIG_DEUBG_FS=n (Lucas)
> - Offload system clear page to GPU (Nirmoy)
> - Remove dead kunit code (Jani Nikula)
> - Refactor drvdata storing to help display (Jani Nikula)
> - Cleanup unsused xe parameter in pte handling (Himal)
> - Rename s/enable_display/probe_display/ for clarity (Lucas)
> - Fix missing MCR annotation in couple of registers (Tejas)
> - Fix DGFX display suspend/resume (Maarten)
> - Prepare exec_queue_kill for PXP handling (Daniele)
> - Fix devm/drmm issues (Daniele, Matthew Brost)
> - Fix tile fini sequence (Brost)
> - Fix crashes when probing without firmware in place (Daniele)
> - Use xe_managed for kernel BOs (Daniele, Matthew Brost)
> - Future-proof dss_per_group calculation by using hwconfig (Matt Roper)
> - Use reserved copy engine for user binds on faulting devices
>   (Matthew Brost)
> - Allow mixing dma-fence jobs and long-running faulting jobs (Francois)
> - Cleanup redundant arg when creating use BO (Nirmoy)
> - Prevent UAF around preempt fence (Auld)
> - Fix display suspend/resume (Maarten)
> - Use vma_pages() helper (Thorsten)
> 
> ----------------------------------------------------------------
> Akshata Jahagirdar (1):
>       drm/xe/xe2: Introduce performance changes
> 
> Ashutosh Dixit (1):
>       drm/xe/observation: Drop empty sysctl table entry
> 
> Daniele Ceraolo Spurio (5):
>       drm/xe: fix WA 14018094691
>       drm/xe: Make exec_queue_kill safe to call twice
>       drm/xe: use devm instead of drmm for managed bo
>       drm/xe/uc: Use managed bo for HuC and GSC objects
>       drm/xe/uc: Use devm to register cleanup that includes exec_queues
> 
> Dominik Grzegorzek (2):
>       drm/xe: Move and export xe_hw_engine lookup.
>       drm/xe: Export xe_hw_engine's mmio accessors
> 
> Francois Dugast (11):
>       drm/xe/hw_engine_group: Introduce xe_hw_engine_group
>       drm/xe/guc_submit: Make suspend_wait interruptible
>       'drm/xe/hw_engine_group: Register hw engine group's exec queues
>       drm/xe/hw_engine_group: Add helper to suspend faulting LR jobs
>       drm/xe/exec_queue: Remove duplicated code
>       drm/xe/exec_queue: Prepare last fence for hw engine group resume context
>       drm/xe/hw_engine_group: Add helper to wait for dma fence jobs
>       drm/xe/hw_engine_group: Ensure safe transition between execution modes
>       drm/xe/exec: Switch hw engine group execution mode upon job submission
>       drm/xe/vm: Remove restriction that all VMs must be faulting if one is
>       drm/xe/device: Remove unused xe_device::usm::num_vm_in_*
> 
> Himal Prasad Ghimiray (1):
>       drm/xe: Remove unused xe parameter
> 
> Jani Nikula (3):
>       drm/xe/tests: remove unused leftover xe_call_for_each_device()
>       drm/xe: use pdev_to_xe_device() instead of pci_get_drvdata() directly
>       drm/xe: add kdev_to_xe_device() helper and use it
> 
> Julia Filipchuk (3):
>       drm/xe/guc: Bump minimum required GuC version to v70.29.2
>       drm/xe/guc: Define GuC version v70.29.2 for BMG
>       drm/xe/guc: Enable w/a 14022293748 and 22019794406
> 
> Karthik Poosa (1):
>       drm/xe/hwmon: Fix PL1 disable flow in xe_hwmon_power_max_write
> 
> Lucas De Marchi (3):
>       drm/xe: Allow to compile out debugfs
>       drm/xe: Rename enable_display module param
>       Merge drm/drm-next into drm-xe-next
> 
> Maarten Lankhorst (2):
>       drm/xe/display: Match i915 driver suspend/resume sequences better
>       drm/xe/display: Make display suspend/resume work on discrete
> 
> Matt Roper (3):
>       drm/xe: Name and document Wa_14019789679
>       drm/xe: Add debugfs to dump GuC's hwconfig
>       drm/xe/mcr: Try to derive dss_per_grp from hwconfig attributes
> 
> Matthew Auld (2):
>       drm/xe: fix engine_class bounds check again
>       drm/xe: prevent UAF around preempt fence
> 
> Matthew Brost (14):
>       drm/xe: Use dma_fence_chain_free in chain fence unused as a sync
>       drm/xe: Take ref to VM in delayed snapshot
>       drm/printer: Allow NULL data in devcoredump printer
>       drm/xe: Faster devcoredump
>       drm/xe: Only check last fence on user binds
>       drm/xe: Move VM dma-resv lock from xe_exec_queue_create to __xe_exec_queue_init
>       drm/xe: Add xe_sched_msg_lock/unlock helper
>       drm/xe: Reinit msg link when processing a message
>       drm/xe: Add xe_sched_add_msg_locked helper
>       drm/xe: Only enable scheduling upon resume if needed
>       drm/xe: Allow suspend / resume to be safely called multiple times
>       drm/xe: Fix tile fini sequence
>       drm/xe: Use for_each_remote_tile rather than manual check
>       drm/xe: Use reserved copy engine for user binds on faulting devices
> 
> Michal Wajdeczko (1):
>       drm/xe/pf: Fix VF config validation on multi-GT platforms
> 
> Mika Kuoppala (1):
>       drm/xe: Add kernel doc for xe_hw_engine_lookup
> 
> Nirmoy Das (7):
>       drm/xe: Fix access_ok check in user_fence_create
>       drm/xe/gt: Add APIs for printing stats over debugfs
>       drm/xe: Add stats for tlb invalidation count
>       drm/xe/migrate: Parameterize ccs and bo data clear in xe_migrate_clear()
>       drm/xe: Remove redundant param from xe_bo_create_user
>       drm/ttm: Add a flag to allow drivers to skip clear-on-free
>       drm/xe/lnl: Offload system clear page activity to GPU
> 
> Pallavi Mishra (1):
>       drm/xe/xe2: Enable Priority Mem Read
> 
> Shekhar Chauhan (1):
>       drm/xe/xe2: Add performance turning changes
> 
> Tejas Upadhyay (4):
>       drm/xe/xe2hpg: Add Wa_14021821874
>       drm/xe: Move enable host l2 VRAM post MCR init
>       drm/xe: Write all slices if its mcr register
>       drm/xe: Define STATELESS_COMPRESSION_CTRL as mcr register
> 
> Thorsten Blum (1):
>       drm/xe/oa: Use vma_pages() helper function in xe_oa_mmap()
> 
>  drivers/gpu/drm/drm_print.c                   |  13 +-
>  drivers/gpu/drm/ttm/ttm_pool.c                |  18 +-
>  drivers/gpu/drm/xe/Makefile                   |  18 +-
>  drivers/gpu/drm/xe/abi/guc_klvs_abi.h         |   1 +
>  drivers/gpu/drm/xe/display/xe_display.c       |  88 ++++--
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h      |   1 +
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h          |  10 +-
>  drivers/gpu/drm/xe/tests/xe_bo.c              |   8 +-
>  drivers/gpu/drm/xe/tests/xe_dma_buf.c         |   2 +-
>  drivers/gpu/drm/xe/tests/xe_migrate.c         |  24 +-
>  drivers/gpu/drm/xe/tests/xe_pci.c             |  52 ----
>  drivers/gpu/drm/xe/tests/xe_pci_test.h        |   1 -
>  drivers/gpu/drm/xe/xe_bo.c                    |  48 +++-
>  drivers/gpu/drm/xe/xe_bo.h                    |   1 -
>  drivers/gpu/drm/xe/xe_debugfs.h               |   4 +
>  drivers/gpu/drm/xe/xe_devcoredump.c           | 111 +++++---
>  drivers/gpu/drm/xe/xe_devcoredump_types.h     |   8 +
>  drivers/gpu/drm/xe/xe_device.c                |   5 +-
>  drivers/gpu/drm/xe/xe_device.h                |  15 +-
>  drivers/gpu/drm/xe/xe_device_types.h          |  17 +-
>  drivers/gpu/drm/xe/xe_exec.c                  |  20 +-
>  drivers/gpu/drm/xe/xe_exec_queue.c            | 237 ++++++++--------
>  drivers/gpu/drm/xe/xe_exec_queue.h            |   8 +-
>  drivers/gpu/drm/xe/xe_exec_queue_types.h      |   4 +-
>  drivers/gpu/drm/xe/xe_gpu_scheduler.c         |  23 +-
>  drivers/gpu/drm/xe/xe_gpu_scheduler.h         |  12 +
>  drivers/gpu/drm/xe/xe_gsc.c                   |  20 +-
>  drivers/gpu/drm/xe/xe_gsc_proxy.c             |  45 +---
>  drivers/gpu/drm/xe/xe_gt.c                    |  10 +-
>  drivers/gpu/drm/xe/xe_gt_debugfs.c            |  13 +
>  drivers/gpu/drm/xe/xe_gt_mcr.c                |  40 ++-
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  11 +-
>  drivers/gpu/drm/xe/xe_gt_stats.c              |  49 ++++
>  drivers/gpu/drm/xe/xe_gt_stats.h              |  29 ++
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c   |   2 +
>  drivers/gpu/drm/xe/xe_gt_types.h              |  15 ++
>  drivers/gpu/drm/xe/xe_guc.h                   |  10 +
>  drivers/gpu/drm/xe/xe_guc_ads.c               |   6 +
>  drivers/gpu/drm/xe/xe_guc_hwconfig.c          |  97 +++++++
>  drivers/gpu/drm/xe/xe_guc_hwconfig.h          |   3 +
>  drivers/gpu/drm/xe/xe_guc_submit.c            |  62 +++--
>  drivers/gpu/drm/xe/xe_huc.c                   |  19 +-
>  drivers/gpu/drm/xe/xe_hw_engine.c             | 145 +++++++---
>  drivers/gpu/drm/xe/xe_hw_engine.h             |  10 +
>  drivers/gpu/drm/xe/xe_hw_engine_group.c       | 372 ++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_hw_engine_group.h       |  29 ++
>  drivers/gpu/drm/xe/xe_hw_engine_group_types.h |  51 ++++
>  drivers/gpu/drm/xe/xe_hw_engine_types.h       |   2 +
>  drivers/gpu/drm/xe/xe_hwmon.c                 |   3 +-
>  drivers/gpu/drm/xe/xe_lrc.c                   |  50 +++-
>  drivers/gpu/drm/xe/xe_migrate.c               |  29 +-
>  drivers/gpu/drm/xe/xe_migrate.h               |   7 +-
>  drivers/gpu/drm/xe/xe_mmio.c                  |   4 +-
>  drivers/gpu/drm/xe/xe_module.c                |   6 +-
>  drivers/gpu/drm/xe/xe_module.h                |   2 +-
>  drivers/gpu/drm/xe/xe_oa.c                    |   3 +-
>  drivers/gpu/drm/xe/xe_observation.c           |   1 -
>  drivers/gpu/drm/xe/xe_pci.c                   |  10 +-
>  drivers/gpu/drm/xe/xe_pm.c                    |  11 +-
>  drivers/gpu/drm/xe/xe_preempt_fence.c         |   3 +-
>  drivers/gpu/drm/xe/xe_preempt_fence_types.h   |   2 +
>  drivers/gpu/drm/xe/xe_pt.c                    |  10 +-
>  drivers/gpu/drm/xe/xe_sync.c                  |   4 +-
>  drivers/gpu/drm/xe/xe_ttm_sys_mgr.c           |  12 +
>  drivers/gpu/drm/xe/xe_tuning.c                |  13 +-
>  drivers/gpu/drm/xe/xe_uc_fw.c                 |  28 +-
>  drivers/gpu/drm/xe/xe_vm.c                    |  53 +---
>  drivers/gpu/drm/xe/xe_wa.c                    |   4 +
>  drivers/gpu/drm/xe/xe_wa_oob.rules            |   6 +
>  include/drm/drm_print.h                       |  54 +++-
>  include/drm/ttm/ttm_tt.h                      |   6 +-
>  71 files changed, 1585 insertions(+), 525 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_stats.c
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_stats.h
>  create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_group.c
>  create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_group.h
>  create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_group_types.h

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
