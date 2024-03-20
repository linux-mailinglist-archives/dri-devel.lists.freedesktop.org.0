Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A16C881420
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 16:07:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BC6010FD3F;
	Wed, 20 Mar 2024 15:07:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CyTk4tDG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF0010FD3F;
 Wed, 20 Mar 2024 15:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710947219; x=1742483219;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tsgHU6iped9BYNKZeocwdMQSHcTaR/5D0OxCdFe1eIw=;
 b=CyTk4tDGQ/meMTEtE8DrVQBNj7/L0HDjzOSpgEgAD0B/UmcxqW0PROij
 BbG0JFWKXv1HyyVcJ4PlzJPfaMABTCnyAOw0rOgyqmM8+9QVJgsGeTDTD
 Os6jgE3mRYM15cgPI94uzsWVLICVwUYnsgjLF5OjDrsLXe5mpX2do2wna
 hjVMIz0qUOzgjuZLa0CDXzpeWsLEDKdt3tNQSqf274JkAzqmK2t1LxKpd
 TgJaAVR099czpe+MxUxGox3OuScib3FgHSPLkYBcQYmGLiC1KJ0YaI39i
 pnW2cAkhGQmtY4LtFV8NCX0GL1NCcMb4I6l6FvHHfTvwJ6E/Fak+KjyJ3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="6053227"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="6053227"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 08:06:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; d="scan'208";a="14193862"
Received: from unknown (HELO intel.com) ([10.247.118.184])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 08:06:50 -0700
Date: Wed, 20 Mar 2024 16:06:44 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 John Harrison <John.C.Harrison@intel.com>, stable@vger.kernel.org,
 Andi Shyti <andi.shyti@kernel.org>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH v6 0/3] Disable automatic load CCS load balancing
Message-ID: <Zfr7hPs_VAUkTNTX@ashyti-mobl2.lan>
References: <20240313201955.95716-1-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240313201955.95716-1-andi.shyti@linux.intel.com>
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

Ping! Any thoughts here?

Andi

On Wed, Mar 13, 2024 at 09:19:48PM +0100, Andi Shyti wrote:
> Hi,
> 
> this series does basically two things:
> 
> 1. Disables automatic load balancing as adviced by the hardware
>    workaround.
> 
> 2. Assigns all the CCS slices to one single user engine. The user
>    will then be able to query only one CCS engine
> 
> >From v5 I have created a new file, gt/intel_gt_ccs_mode.c where
> I added the intel_gt_apply_ccs_mode(). In the upcoming patches,
> this file will contain the implementation for dynamic CCS mode
> setting.
> 
> Thanks Tvrtko, Matt, John and Joonas for your reviews!
> 
> Andi
> 
> Changelog
> =========
> v5 -> v6 (thanks Matt for the suggestions in v6)
>  - Remove the refactoring and the for_each_available_engine()
>    macro and instead do not create the intel_engine_cs structure
>    at all.
>  - In patch 1 just a trivial reordering of the bit definitions.
> 
> v4 -> v5
>  - Use the workaround framework to do all the CCS balancing
>    settings in order to always apply the modes also when the
>    engine resets. Put everything in its own specific function to
>    be executed for the first CCS engine encountered. (Thanks
>    Matt)
>  - Calculate the CCS ID for the CCS mode as the first available
>    CCS among all the engines (Thanks Matt)
>  - create the intel_gt_ccs_mode.c function to host the CCS
>    configuration. We will have it ready for the next series.
>  - Fix a selftest that was failing because could not set CCS2.
>  - Add the for_each_available_engine() macro to exclude CCS1+ and
>    start using it in the hangcheck selftest.
> 
> v3 -> v4
>  - Reword correctly the comment in the workaround
>  - Fix a buffer overflow (Thanks Joonas)
>  - Handle properly the fused engines when setting the CCS mode.
> 
> v2 -> v3
>  - Simplified the algorithm for creating the list of the exported
>    uabi engines. (Patch 1) (Thanks, Tvrtko)
>  - Consider the fused engines when creating the uabi engine list
>    (Patch 2) (Thanks, Matt)
>  - Patch 4 now uses a the refactoring from patch 1, in a cleaner
>    outcome.
> 
> v1 -> v2
>  - In Patch 1 use the correct workaround number (thanks Matt).
>  - In Patch 2 do not add the extra CCS engines to the exposed
>    UABI engine list and adapt the engine counting accordingly
>    (thanks Tvrtko).
>  - Reword the commit of Patch 2 (thanks John).
> 
> Andi Shyti (3):
>   drm/i915/gt: Disable HW load balancing for CCS
>   drm/i915/gt: Do not generate the command streamer for all the CCS
>   drm/i915/gt: Enable only one CCS for compute workload
> 
>  drivers/gpu/drm/i915/Makefile               |  1 +
>  drivers/gpu/drm/i915/gt/intel_engine_cs.c   | 20 ++++++++---
>  drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c | 39 +++++++++++++++++++++
>  drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h | 13 +++++++
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  6 ++++
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 30 ++++++++++++++--
>  6 files changed, 103 insertions(+), 6 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
>  create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h
> 
> -- 
> 2.43.0
