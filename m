Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE6D4AC02B
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 14:53:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D782B10E2D5;
	Mon,  7 Feb 2022 13:53:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF5E710E2D5;
 Mon,  7 Feb 2022 13:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644242009; x=1675778009;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=axdpAxiB0MPB9JK5SGu3wGNoRHNfs4gX91RRg3cTtD8=;
 b=MNA/G3pTk5rO4NGjrAnURpEMXpN6EPPDMNHW4Xx4DmXwrqNbSwM/DGyo
 HSGMs+MAtqqi9/uWFilxo8Mha9FYZiEFX/+3Vq2+MDv7q2VEWAq2VXFTA
 UxnRzPN3r9NstngY9LAS3sZsMlrWgyh25s/BAJWPmhoQcjtULsqBqYS8j
 /nHSFjuptv3UYywngjMPsuI+f6/TaAyeVh+d+U17qAfBjhV9WtRsJ4xyP
 0turHULR5L0Qfv+wRiLVZuyPRJMiHjWpy4C2LGVdi4Wh4rDuRIWDV0TQU
 b1BAo8Ix4Cxm63QBq7lWIZPlIcX+YNQSJySqL6QmmR5W/ezuSvGvkLjyf w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="335120536"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="335120536"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 05:53:29 -0800
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="540105578"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.203.144.108])
 by orsmga008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2022 05:53:27 -0800
Date: Mon, 7 Feb 2022 19:23:35 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [RFC 0/2] drm/i915/ttm: Evict and store of compressed object
Message-ID: <20220207135335.GA15175@intel.com>
References: <20220207093743.14467-1-ramalingam.c@intel.com>
 <1a195c03-d2a9-d35e-7b62-a8b70a5c21b3@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1a195c03-d2a9-d35e-7b62-a8b70a5c21b3@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-02-07 at 12:41:59 +0100, Christian König wrote:
> Am 07.02.22 um 10:37 schrieb Ramalingam C:
> > On flat-ccs capable platform we need to evict and resore the ccs data
> > along with the corresponding main memory.
> > 
> > This ccs data can only be access through BLT engine through a special
> > cmd ( )
> > 
> > To support above requirement of flat-ccs enabled i915 platforms this
> > series adds new param called ccs_pages_needed to the ttm_tt_init(),
> > to increase the ttm_tt->num_pages of system memory when the obj has the
> > lmem placement possibility.
> 
> Well question is why isn't the buffer object allocated with the extra space
> in the first place?
Hi Christian,

On Xe-HP and later devices, we use dedicated compression control state (CCS)
stored in local memory for each surface, to support the 3D and media
compression formats.

The memory required for the CCS of the entire local memory is 1/256 of the
local memory size. So before the kernel boot, the required memory is reserved
for the CCS data and a secure register will be programmed with the CCS base
address

So when we allocate a object in local memory we dont need to explicitly
allocate the space for ccs data. But when we evict the obj into the smem
 to hold the compression related data along with the obj we need smem
 space of obj_size + (obj_size/256).

 Hence when we create smem for an obj with lmem placement possibility we
 create with the extra space.

 Ram.
> 
> Regards,
> Christian.
> 
> > 
> > This will be on top of the flat-ccs enabling series
> > https://patchwork.freedesktop.org/series/95686/
> > 
> > For more about flat-ccs feature please have a look at
> > https://patchwork.freedesktop.org/patch/471777/?series=95686&rev=5
> > 
> > Testing of the series is WIP and looking forward for the early review on
> > the amendment to ttm_tt_init and the approach.
> > 
> > Ramalingam C (2):
> >    drm/i915/ttm: Add extra pages for handling ccs data
> >    drm/i915/migrate: Evict and restore the ccs data
> > 
> >   drivers/gpu/drm/drm_gem_vram_helper.c      |   2 +-
> >   drivers/gpu/drm/i915/gem/i915_gem_ttm.c    |  23 +-
> >   drivers/gpu/drm/i915/gt/intel_migrate.c    | 283 +++++++++++----------
> >   drivers/gpu/drm/qxl/qxl_ttm.c              |   2 +-
> >   drivers/gpu/drm/ttm/ttm_agp_backend.c      |   2 +-
> >   drivers/gpu/drm/ttm/ttm_tt.c               |  12 +-
> >   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c |   2 +-
> >   include/drm/ttm/ttm_tt.h                   |   4 +-
> >   8 files changed, 191 insertions(+), 139 deletions(-)
> > 
> 
