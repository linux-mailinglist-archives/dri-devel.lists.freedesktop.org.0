Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEpZOWQai2nSPwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 12:45:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4945011A5BA
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 12:45:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBEC210E55B;
	Tue, 10 Feb 2026 11:45:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LNcHGnqZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF37610E559;
 Tue, 10 Feb 2026 11:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770723934; x=1802259934;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Q/Zxmc6fEqGwUJ7tZP+TOeuVaonZG+7hO4gpr3z1jAc=;
 b=LNcHGnqZUIyiW+nl458oewU/BKhC/A96/tNKndiwlLf1BVNvm+Zy5UOu
 tv0XrLHTI8SqITfWoDB4O3ix7PeyHHe4KlC4e+5+pBzKrDqV8EAXIWzlX
 kl1Qw+ufcFBGNvMhAMmVazf3xai5SpfdMCsHKJw5s9lVGbrG3d/lITFSH
 HNyc3jIQINJdAoWKzOYCSF1IgLJVKGBAoFkuKFgJANlGCo7RoTIgbWBJJ
 VyDFjZsivT02j+v0RwWOpNqGX1MzpZKdbkDBhMKBjjFvLqp7OAnmZoQp/
 IyyAeg4BNQM7BrBY7/7YtT2QrBPKa8whfSJReug1zrdYhpKyH0w6ltUK5 Q==;
X-CSE-ConnectionGUID: sG3vuiJdRrWHuQtrZ21E5g==
X-CSE-MsgGUID: E9UbUYcqS+qK6vTZdf9pdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71836157"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="71836157"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 03:45:34 -0800
X-CSE-ConnectionGUID: pnRa/TdgSjipBHrPhxBOYQ==
X-CSE-MsgGUID: MTem0qG7TaicjjI5FjogHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="234866500"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 03:45:31 -0800
Date: Tue, 10 Feb 2026 12:45:28 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 simona.vetter@ffwll.ch, airlied@gmail.com, pratik.bari@intel.com,
 joshua.santosh.ranjan@intel.com, ashwin.kumar.kulkarni@intel.com,
 shubham.kumar@intel.com, ravi.kishore.koppuravuri@intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v5 4/5] drm/xe/xe_hw_error: Add support for Core-Compute
 errors
Message-ID: <aYsaWAUauWg0XIJl@black.igk.intel.com>
References: <20260202064356.286243-7-riana.tauro@intel.com>
 <20260202064356.286243-11-riana.tauro@intel.com>
 <aYS3sm6QO0d947hM@black.igk.intel.com>
 <90eaf920-2bc3-4d33-9a64-f6373d704dc0@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <90eaf920-2bc3-4d33-9a64-f6373d704dc0@intel.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,linux.intel.com,intel.com,ffwll.ch,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raag.jadav@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,intel.com:dkim,black.igk.intel.com:mid]
X-Rspamd-Queue-Id: 4945011A5BA
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 11:28:39AM +0530, Riana Tauro wrote:
> On 2/5/2026 9:00 PM, Raag Jadav wrote:
> > On Mon, Feb 02, 2026 at 12:14:00PM +0530, Riana Tauro wrote:
> > > PVC supports GT error reporting via vector registers along with
> > > error status register. Add support to report these errors and
> > > update respective counters. Incase of Subslice error reported
> > > by vector register, process the error status register
> > > for applicable bits.
> > > 
> > > The counter is embedded in the xe drm ras structure and is
> > > exposed to the userspace using the drm_ras generic netlink
> > > interface.
> > > 
> > > $ sudo ynl --family drm_ras --do query-error-counter  --json
> > 
> > We usually add '\' at the end for wrapping commands so that they're easy
> > to apply directly (and same for all other patches where applicable).
> > 
> > >    '{"node-id":0, "error-id":1}'
> > 
> > Ditto.
> 
> Will fix this

Thank you.

> > > {'error-id': 1, 'error-name': 'core-compute', 'error-value': 0}
> > > 
> > > Co-developed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > > ---
> > > v2: Add ID's and names as uAPI (Rodrigo)
> > >      Add documentation
> > >      Modify commit message
> > > 
> > > v3: remove 'error' from counters
> > >      use drmm_kcalloc
> > >      add a for_each for severity
> > >      differentitate error classes and severity in UAPI(Raag)
> > >      Use correctable and uncorrectable in uapi (Pratik / Aravind)
> > > 
> > > v4: modify enums in UAPI
> > >      improve comments
> > >      add bounds check in handler
> > >      add error mask macro (Raag)
> > >      use atomic_t
> > >      add null pointer checks
> > > ---
> > >   drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  62 ++++++-
> > >   drivers/gpu/drm/xe/xe_hw_error.c           | 199 +++++++++++++++++++--
> > >   2 files changed, 241 insertions(+), 20 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
> > > index c146b9ef44eb..17982a335941 100644
> > > --- a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
> > > +++ b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
> > > @@ -6,15 +6,59 @@
> > >   #ifndef _XE_HW_ERROR_REGS_H_
> > >   #define _XE_HW_ERROR_REGS_H_
> > > -#define HEC_UNCORR_ERR_STATUS(base)                    XE_REG((base) + 0x118)
> > > -#define    UNCORR_FW_REPORTED_ERR                      BIT(6)
> > > +#define HEC_UNCORR_ERR_STATUS(base)			XE_REG((base) + 0x118)
> > > +#define   UNCORR_FW_REPORTED_ERR			REG_BIT(6)
> > > -#define HEC_UNCORR_FW_ERR_DW0(base)                    XE_REG((base) + 0x124)
> > > +#define HEC_UNCORR_FW_ERR_DW0(base)			XE_REG((base) + 0x124)
> > > +
> > > +#define ERR_STAT_GT_COR					0x100160
> > > +#define   EU_GRF_COR_ERR				REG_BIT(15)
> > > +#define   EU_IC_COR_ERR					REG_BIT(14)
> > > +#define   SLM_COR_ERR					REG_BIT(13)
> > > +#define   GUC_COR_ERR					REG_BIT(1)
> > > +
> > > +#define ERR_STAT_GT_NONFATAL				0x100164
> > > +#define ERR_STAT_GT_FATAL				0x100168
> > > +#define   EU_GRF_FAT_ERR				REG_BIT(15)
> > > +#define   SLM_FAT_ERR					REG_BIT(13)
> > > +#define   GUC_FAT_ERR					REG_BIT(6)
> > > +#define   FPU_FAT_ERR					REG_BIT(3)
> > > +
> > > +#define ERR_STAT_GT_REG(x)				XE_REG(_PICK_EVEN((x), \
> > > +									  ERR_STAT_GT_COR, \
> > > +									  ERR_STAT_GT_NONFATAL))
> > > +
> > > +#define PVC_COR_ERR_MASK				(GUC_COR_ERR | SLM_COR_ERR | \
> > > +							 EU_IC_COR_ERR | EU_GRF_COR_ERR)
> > > +
> > > +#define PVC_FAT_ERR_MASK				(FPU_FAT_ERR | GUC_FAT_ERR | \
> > > +							EU_GRF_FAT_ERR | SLM_FAT_ERR)
> > 
> > Nit: Whitespace please!
> 
> alignment?

Yes please!

> > > +#define DEV_ERR_STAT_NONFATAL				0x100178
> > > +#define DEV_ERR_STAT_CORRECTABLE			0x10017c
> > > +#define DEV_ERR_STAT_REG(x)				XE_REG(_PICK_EVEN((x), \
> > > +									  DEV_ERR_STAT_CORRECTABLE, \
> > > +									  DEV_ERR_STAT_NONFATAL))
> > 
> > I know it was already like this but how does this evaluate for FATAL?
> 
> #define _PICK_EVEN(__index, __a, __b) ((__a) + (__index) * ((__b) - (__a)))
> (index, 0x10017c, 0x100178)  = (0x10017c + index * (0x100178 - 0x10017c));
> 0 =  0x10017c
> 1 =  0x100178
> 2 =  0x100174

The addresses are usually unsigned, so I got lost there a bit.

> > > +#define   XE_CSC_ERROR					17
> > > +#define   XE_GT_ERROR					0
> > > +
> > > +#define ERR_STAT_GT_FATAL_VECTOR_0			0x100260
> > > +#define ERR_STAT_GT_FATAL_VECTOR_1			0x100264
> > > +
> > > +#define ERR_STAT_GT_FATAL_VECTOR_REG(x)			XE_REG(_PICK_EVEN((x), \
> > > +								  ERR_STAT_GT_FATAL_VECTOR_0, \
> > > +								  ERR_STAT_GT_FATAL_VECTOR_1))
> > > +
> > > +#define ERR_STAT_GT_COR_VECTOR_0			0x1002a0
> > > +#define ERR_STAT_GT_COR_VECTOR_1			0x1002a4
> > > +
> > > +#define ERR_STAT_GT_COR_VECTOR_REG(x)			XE_REG(_PICK_EVEN((x), \
> > > +									  ERR_STAT_GT_COR_VECTOR_0, \
> > > +									  ERR_STAT_GT_COR_VECTOR_1))
> > > +
> > > +#define ERR_STAT_GT_VECTOR_REG(hw_err, x)		(hw_err == HARDWARE_ERROR_CORRECTABLE ? \
> > > +							ERR_STAT_GT_COR_VECTOR_REG(x) : \
> > > +							ERR_STAT_GT_FATAL_VECTOR_REG(x))
> > 
> > Ditto for whitespace.
> > 
> > > -#define DEV_ERR_STAT_NONFATAL			0x100178
> > > -#define DEV_ERR_STAT_CORRECTABLE		0x10017c
> > > -#define DEV_ERR_STAT_REG(x)			XE_REG(_PICK_EVEN((x), \
> > > -								  DEV_ERR_STAT_CORRECTABLE, \
> > > -								  DEV_ERR_STAT_NONFATAL))
> > > -#define   XE_CSC_ERROR				BIT(17)
> > >   #endif
> > > diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> > > index 2019aaaa1ebe..ff31fb322c8a 100644
> > > --- a/drivers/gpu/drm/xe/xe_hw_error.c
> > > +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> > > @@ -3,6 +3,7 @@
> > >    * Copyright © 2025 Intel Corporation
> > >    */
> > > +#include <linux/bitmap.h>
> > >   #include <linux/fault-inject.h>
> > >   #include "regs/xe_gsc_regs.h"
> > > @@ -15,7 +16,13 @@
> > >   #include "xe_mmio.h"
> > >   #include "xe_survivability_mode.h"
> > > -#define  HEC_UNCORR_FW_ERR_BITS 4
> > > +#define  GT_HW_ERROR_MAX_ERR_BITS	16
> > > +#define  HEC_UNCORR_FW_ERR_BITS		4
> > > +#define  XE_RAS_REG_SIZE		32
> > > +
> > > +#define  PVC_ERROR_MASK_SET(hw_err, err_bit) \
> > > +	((hw_err == HARDWARE_ERROR_CORRECTABLE) ? (BIT(err_bit) & PVC_COR_ERR_MASK) : \
> > > +	(BIT(err_bit) & PVC_FAT_ERR_MASK))
> > 
> > I'd write this as below and move it to xe_hw_error_regs.h
> 
> This is not specific to register selection or defining bits. It's related to
> mask. So .c should be the right place

Don't the mask bits come from register def?

> > #define PVC_COR_ERR_MASK_SET(err_bit)			(PVC_COR_ERR_MASK & REG_BIT(err_bit))
> > #define PVC_FAT_ERR_MASK_SET(err_bit)			(PVC_FAT_ERR_MASK & REG_BIT(err_bit))
> > 
> > #define PVC_ERR_MASK_SET(hw_err, err_bit)		((hw_err == HARDWARE_ERROR_CORRECTABLE) ? \
> > 								PVC_COR_ERR_MASK_SET(err_bit) : \
> > 								PVC_FAT_ERR_MASK_SET(err_bit)
> > 
> > ...
> > 
> > > +static void gt_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err,
> > > +				u32 error_id)
> > > +{
> > > +	const enum drm_xe_ras_error_severity severity = hw_err_to_severity(hw_err);
> > > +	struct xe_device *xe = tile_to_xe(tile);
> > > +	struct xe_drm_ras *ras = &xe->ras;
> > > +	struct xe_drm_ras_counter *info = ras->info[severity];
> > > +	struct xe_mmio *mmio = &tile->mmio;
> > > +	unsigned long err_stat = 0;
> > > +	int i, len;
> > > +
> > > +	if (xe->info.platform != XE_PVC)
> > > +		return;
> > > +
> > > +	if (!info)
> > > +		return;
> > 
> > Since info allocation is not related to hardware, we shouldn't even be
> > at this point without it. So let's not hide bugs and fail probe instead.
> 
> yes currently it is supported only on PVC. I can remove this here as there
> is a PVC check but cannot remove the one suggested below.

Fair, but please also return the allocation failure. With that perhaps
xe_hw_error_init() will be int now.

Raag

> > > +	if (hw_err == HARDWARE_ERROR_NONFATAL) {
> > > +		atomic_inc(&info[error_id].counter);
> > > +		log_hw_error(tile, info[error_id].name, severity);
> > > +		return;
> > > +	}
> > 
> > ...
> > 
> > >   static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
> > >   {
> > >   	const enum drm_xe_ras_error_severity severity = hw_err_to_severity(hw_err);
> > >   	const char *severity_str = error_severity[severity];
> > >   	struct xe_device *xe = tile_to_xe(tile);
> > > -	unsigned long flags;
> > > -	u32 err_src;
> > > +	struct xe_drm_ras *ras = &xe->ras;
> > > +	struct xe_drm_ras_counter *info = ras->info[severity];
> > > +	unsigned long flags, err_src;
> > > +	u32 err_bit;
> > > -	if (xe->info.platform != XE_BATTLEMAGE)
> > > +	if (!IS_DGFX(xe))
> > >   		return;
> > >   	spin_lock_irqsave(&xe->irq.lock, flags);
> > > @@ -108,11 +242,53 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
> > >   		goto unlock;
> > >   	}
> > > -	if (err_src & XE_CSC_ERROR)
> > > +	/*
> > > +	 * On encountering CSC firmware errors, the graphics device becomes unrecoverable
> > > +	 * so return immediately on error. The only way to recover from these errors is
> > > +	 * firmware flash. The device will enter Runtime Survivability mode when such
> > > +	 * errors are detected.
> > > +	 */
> > > +	if (err_src & XE_CSC_ERROR) {
> > >   		csc_hw_error_handler(tile, hw_err);
> > > +		goto clear_reg;
> > > +	}
> > > -	xe_mmio_write32(&tile->mmio, DEV_ERR_STAT_REG(hw_err), err_src);
> > > +	if (!info)
> > > +		goto clear_reg;
> > 
> > Same as above.
> > 
> > Raag
