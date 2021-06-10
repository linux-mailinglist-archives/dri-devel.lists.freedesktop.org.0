Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9D33A2350
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 06:23:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0536D6E453;
	Thu, 10 Jun 2021 04:23:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C42F46E453;
 Thu, 10 Jun 2021 04:23:33 +0000 (UTC)
IronPort-SDR: tiK8twDNBDOjgZxN4ghQFsksqrvVUUC+wzx9KeVXZGTyz5NFG0kaouOyFL4rtaQLIhcZq1QZfb
 Jn1XJrcVPdsA==
X-IronPort-AV: E=McAfee;i="6200,9189,10010"; a="226608840"
X-IronPort-AV: E=Sophos;i="5.83,262,1616482800"; d="scan'208";a="226608840"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 21:23:33 -0700
IronPort-SDR: 42y5S6I8uqqBYStXN0pA/UpYf9oLunqiwNqMb5SGpEi42zh6OvPpnSA5fG2NyVYAfgIFj29FK8
 ZCjGkqUIWTQw==
X-IronPort-AV: E=Sophos;i="5.83,262,1616482800"; d="scan'208";a="402673898"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 21:23:33 -0700
Date: Wed, 9 Jun 2021 21:16:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 00/13]  Update firmware to v62.0.0
Message-ID: <20210610041639.GA10111@sdutt-i7>
References: <20210610043649.144416-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210610043649.144416-1-matthew.brost@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Wed, Jun 09, 2021 at 09:36:36PM -0700, Matthew Brost wrote:
> As part of enabling GuC submission [1] we need to update to the latest
> and greatest firmware. This series does that. This is a destructive
> change. e.g. Without all the patches in this series it will break the
> i915 driver. As such, after we review most of these patches they will
> squashed into a single patch for merging.
> 
> v2: Address comments, looking for remaning RBs so patches can be
> squashed and sent for CI
> 

Ugh, forgot to include some RBs in this rev. Just looking for RBs 1-2,
and 6-8 in this rev.

Matt

> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> [1] https://patchwork.freedesktop.org/series/89844/i
> 
> John Harrison (3):
>   drm/i915/guc: Support per context scheduling policies
>   drm/i915/guc: Unified GuC log
>   drm/i915/guc: Update firmware to v62.0.0
> 
> Michal Wajdeczko (10):
>   drm/i915/guc: Introduce unified HXG messages
>   drm/i915/guc: Update MMIO based communication
>   drm/i915/guc: Update CTB response status definition
>   drm/i915/guc: Add flag for mark broken CTB
>   drm/i915/guc: New definition of the CTB descriptor
>   drm/i915/guc: New definition of the CTB registration action
>   drm/i915/guc: New CTB based communication
>   drm/i915/doc: Include GuC ABI documentation
>   drm/i915/guc: Kill guc_clients.ct_pool
>   drm/i915/guc: Kill ads.client_info
> 
>  Documentation/gpu/i915.rst                    |   8 +
>  .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  | 107 ++++++
>  .../gt/uc/abi/guc_communication_ctb_abi.h     | 128 +++++--
>  .../gt/uc/abi/guc_communication_mmio_abi.h    |  65 ++--
>  .../gpu/drm/i915/gt/uc/abi/guc_messages_abi.h | 213 +++++++++++
>  drivers/gpu/drm/i915/gt/uc/intel_guc.c        | 107 ++++--
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  45 +--
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     | 356 +++++++++---------
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h     |   6 +-
>  drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  75 +---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    |  29 +-
>  drivers/gpu/drm/i915/gt/uc/intel_guc_log.h    |   6 +-
>  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |  26 +-
>  13 files changed, 750 insertions(+), 421 deletions(-)
> 
> -- 
> 2.28.0
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
