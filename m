Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C568692838E
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 10:19:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A2FE10E11E;
	Fri,  5 Jul 2024 08:18:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="WiTlodrI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 566B710E11E
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 08:18:57 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2ed5af6b214so2324681fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2024 01:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1720167535; x=1720772335; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=aNil6PXxRN/q9tG9OiCnl1epy1x9tBFdhrDt3uKNo7w=;
 b=WiTlodrI/ovf6tenSYp+mmVLpxYn0GRjJRtepjLZlfFiHq83oQ5e880Yeb+XDR1BCj
 wPpHtgDGVIvjgcKuUfqz/bPU6DIaskv8M1sx1oa32dOBKM93KgbAsG48n9WqpOEZJX/m
 Q4/lP1Mg/Nw7Zpyj/IciNhxx0EhbtssfetYxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720167535; x=1720772335;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aNil6PXxRN/q9tG9OiCnl1epy1x9tBFdhrDt3uKNo7w=;
 b=MRO+vu+iHjzTszOA99EsDqP7pf/2UbaUq80dhVWp1a885Ksxc+96YWLxADUg0HYMUd
 XglMMPx70Uw4pQV3MobMC5/aVszLKGQbm2Ig6sp+LgQ1kWaoRcKh8EQmy1EuwlNjTIzN
 oCFt6j5eMNhOsyoNYgvkC9D+PLmb/tLiYzktG+kk5gUbTOTXi68CU7uC1s0U8XqkslAp
 RI4JCcN3MwrA9siP/1Er8jP7XGYzCPBnzMFXlGxphQ8SRLQ3AYl187wMiFR5vyvpWaAy
 Ea50T9w4qbXDwxIF0PWXcW6ryThVBLij7MRDvHRBjDkkbf0T/2dMjM6f3/u+/jV6xY1q
 YBGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUqdBpJydxyxz8LJ7TEX+zQbyRqHUV4e/BYNeNku9nuLYdbfvXzezHJyMp4jmdqlHUk5s9GXwzNw1GUhramypnxB9oYggFY4/HZbhIMP6U
X-Gm-Message-State: AOJu0YywB4naoRfZLuQuj9MH9x2urEksX1ZvH0O50RmM8sDn/hMnGlrO
 HxEI+/7TDk3iztK9UBaGr9kupCGFkrh0uZmiYxrcUqaWnDYt3vR6fq+GRjYtH2E=
X-Google-Smtp-Source: AGHT+IGYmyGg5iJv4YHVZwPtTbTF3Tt0oY+4/QNuJX6v1nOrlO70C3/6sSxEYhFkqtqXXMMEauAjuw==
X-Received: by 2002:a2e:8183:0:b0:2eb:e6fe:3092 with SMTP id
 38308e7fff4ca-2ee8eea1cadmr25647831fa.4.1720167535235; 
 Fri, 05 Jul 2024 01:18:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a1f2375sm52037235e9.27.2024.07.05.01.18.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 01:18:54 -0700 (PDT)
Date: Fri, 5 Jul 2024 10:18:52 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: Re: [PULL] drm-xe-next
Message-ID: <ZoesbMm-dFq4izzb@phenom.ffwll.local>
References: <ZoROvquFrTFhk3Pb@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZoROvquFrTFhk3Pb@intel.com>
X-Operating-System: Linux phenom 6.8.9-amd64 
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

On Tue, Jul 02, 2024 at 03:02:22PM -0400, Rodrigo Vivi wrote:
> Hi Dave and Sima,
> 
> Here goes our actual last PR towards 6.11.
> One extra to make the drm-xe-next-fixes smoother.
> 
> Mostly with fixes that would be anyway part of the
> drm-xe-next-fixes, plus some more SRIOV preparation
> and a BMG w/a.
> 
> Thanks,
> Rodrigo.
> 
> drm-xe-next-2024-07-02:
> Driver Changes:
> - Fix in migration code (Auld)
> - Simplification in HWMon related code (Karthik)
> - Fix in forcewake logic (Nirmoy)
> - Fix engine utilization information (umesh)
> - Clean up on MOCS related code (Roper)
> - Fix on multicast register (Roper)
> - Fix TLB invalidation timeout (Nirmoy)
> - More SRIOV preparation (Michal)
> - Fix out-of-bounds array access (Lucas)
> - Fixes around some mutex utilization (Ashutosh, Vinay)
> - Expand LNL workaround to BMG (Vinay)
> The following changes since commit 406d058dc323ae152d380ac90153eb56a75850c1:
> 
>   drm/xe/oa/uapi: Allow preemption to be disabled on the stream exec queue (2024-06-26 18:25:46 -0400)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-2024-07-02
> 
> for you to fetch changes up to aaa08078e7251131f045ba248a68671db7f7bdf7:
> 
>   drm/xe/bmg: Apply Wa_22019338487 (2024-07-02 12:14:00 -0400)

Pulled, thanks.
-Sima

> 
> ----------------------------------------------------------------
> Driver Changes:
> - Fix in migration code (Auld)
> - Simplification in HWMon related code (Karthik)
> - Fix in forcewake logic (Nirmoy)
> - Fix engine utilization information (umesh)
> - Clean up on MOCS related code (Roper)
> - Fix on multicast register (Roper)
> - Fix TLB invalidation timeout (Nirmoy)
> - More SRIOV preparation (Michal)
> - Fix out-of-bounds array access (Lucas)
> - Fixes around some mutex utilization (Ashutosh, Vinay)
> - Expand LNL workaround to BMG (Vinay)
> 
> ----------------------------------------------------------------
> Ashutosh Dixit (1):
>       drm/xe/oa: Destroy the stream_lock mutex
> 
> Karthik Poosa (1):
>       drm/xe/hwmon: Remove xe_hwmon_process_reg
> 
> Lucas De Marchi (1):
>       drm/xe/rtp: Fix out-of-bounds array access
> 
> Matt Roper (3):
>       drm/xe/mocs: Update MOCS assertions and remove redundant checks
>       drm/xe/mocs: Clarify difference between hw and sw sizes
>       drm/xe/mcr: Avoid clobbering DSS steering
> 
> Matthew Auld (1):
>       drm/xe: fix error handling in xe_migrate_update_pgtables
> 
> Michal Wajdeczko (3):
>       drm/xe/pf: Remove inlined #ifdef CONFIG_PCI_IOV
>       drm/xe/pf: Skip fair VFs provisioning if already provisioned
>       drm/xe/pf: Restart VFs provisioning after GT reset
> 
> Nirmoy Das (2):
>       drm/xe/client: Check return value of xe_force_wake_get
>       drm/xe/guc: Configure TLB timeout based on CT buffer size
> 
> Umesh Nerlige Ramappa (1):
>       drm/xe: Get hwe domain specific FW to read RING_TIMESTAMP
> 
> Vinay Belgaumkar (2):
>       drm/xe/guc: Prevent use of uninitialized mutex
>       drm/xe/bmg: Apply Wa_22019338487
> 
>  drivers/gpu/drm/xe/tests/xe_mocs.c          |  8 +--
>  drivers/gpu/drm/xe/xe_drm_client.c          | 11 +++-
>  drivers/gpu/drm/xe/xe_ggtt.c                | 11 +++-
>  drivers/gpu/drm/xe/xe_gt.c                  |  6 +-
>  drivers/gpu/drm/xe/xe_gt_mcr.c              |  6 +-
>  drivers/gpu/drm/xe/xe_gt_sriov_pf.c         | 12 ++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf.h         |  5 ++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c  | 78 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h  |  4 ++
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 30 +++++++---
>  drivers/gpu/drm/xe/xe_guc_ct.c              | 17 ++++++
>  drivers/gpu/drm/xe/xe_guc_ct.h              |  2 +
>  drivers/gpu/drm/xe/xe_guc_pc.c              | 15 ++++-
>  drivers/gpu/drm/xe/xe_hw_engine.c           |  5 ++
>  drivers/gpu/drm/xe/xe_hw_engine.h           |  1 +
>  drivers/gpu/drm/xe/xe_hwmon.c               | 89 +++++++++++++----------------
>  drivers/gpu/drm/xe/xe_migrate.c             |  8 +--
>  drivers/gpu/drm/xe/xe_mocs.c                | 74 ++++++++++++------------
>  drivers/gpu/drm/xe/xe_oa.c                  |  2 +
>  drivers/gpu/drm/xe/xe_pci.c                 |  4 --
>  drivers/gpu/drm/xe/xe_pci_sriov.c           | 13 +++++
>  drivers/gpu/drm/xe/xe_pci_sriov.h           |  7 +++
>  drivers/gpu/drm/xe/xe_rtp.c                 |  2 +-
>  drivers/gpu/drm/xe/xe_wa_oob.rules          |  1 +
>  24 files changed, 290 insertions(+), 121 deletions(-)

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
