Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AC3AC2EAB
	for <lists+dri-devel@lfdr.de>; Sat, 24 May 2025 12:01:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87DAC10E027;
	Sat, 24 May 2025 10:01:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="emV46PVg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B86C010E010;
 Sat, 24 May 2025 10:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748080914; x=1779616914;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8Z1S/hNWZ9pEp/mNhwra4+VgljiQYHC4PHrsvJbhuBA=;
 b=emV46PVgrR3hkzOENDnOVHm0p9GcjuvvL3+gcztVi9esJ76z/SUe/lFS
 EzGjiHyW673y0t5fmkf73o6qIYY51kF+8AHI9f2seE9NxG9RKMj1uBRLM
 ODDKmDPlje3TaAMxdhtJvnR/R2lAFT8R6vCZmN6o3cK31zLPJAcuqXyWr
 KL3eNfFJOdVZrrkCWFAEvfaVpVvvEg1pqUKsYNASxFoPabJtgbjsARG5b
 ucuGuFn874nl3eHR1+i6xa4aF9a87Oxm5L6/T/JnD4939HYfOJAPVhdEd
 Ey0Z3MwYw65Z7qPqNrRGe0N1mLjj7kb7QMijrEPUdzDE2wZfaqJZWag/q A==;
X-CSE-ConnectionGUID: smB2eY5aT2q2i/WJzwnW3Q==
X-CSE-MsgGUID: CflhWdiNSUa0pviPBlUL/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="60778846"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; d="scan'208";a="60778846"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2025 03:01:53 -0700
X-CSE-ConnectionGUID: Gsn2aVMxTheSeNn7uAZ8ig==
X-CSE-MsgGUID: x09pD8gQTg284T1blC2gRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; d="scan'208";a="142063527"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2025 03:01:47 -0700
Date: Sat, 24 May 2025 13:01:44 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Karthik Poosa <karthik.poosa@intel.com>,
 Reuven Abliyev <reuven.abliyev@intel.com>,
 Oren Weil <oren.jer.weil@intel.com>, linux-mtd@lists.infradead.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 05/10] mtd: intel-dg: align 64bit read and write
Message-ID: <aDGZCL_B3fEkvahj@black.fi.intel.com>
References: <20250515133345.2805031-1-alexander.usyskin@intel.com>
 <20250515133345.2805031-6-alexander.usyskin@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515133345.2805031-6-alexander.usyskin@intel.com>
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

On Thu, May 15, 2025 at 04:33:40PM +0300, Alexander Usyskin wrote:
> GSC NVM controller HW errors on quad access overlapping 1K border.
> Align 64bit read and write to avoid readq/writeq over 1K border.
> 
> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> ---
>  drivers/mtd/devices/mtd_intel_dg.c | 35 ++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/drivers/mtd/devices/mtd_intel_dg.c b/drivers/mtd/devices/mtd_intel_dg.c
> index eedc0974bb5b..2f32ed311ffd 100644
> --- a/drivers/mtd/devices/mtd_intel_dg.c
> +++ b/drivers/mtd/devices/mtd_intel_dg.c
> @@ -246,6 +246,24 @@ static ssize_t idg_write(struct intel_dg_nvm *nvm, u8 region,
>  		len_s -= to_shift;
>  	}
>  
> +	if (!IS_ALIGNED(to, sizeof(u64)) &&
> +	    ((to ^ (to + len_s)) & GENMASK(31, 10))) {
> +		/*
> +		 * Workaround reads/writes across 1k-aligned addresses
> +		 * (start u32 before 1k, end u32 after)
> +		 * as this fails on hardware.

If there's a spec definition, we usually mention workarounds with
Wa_ID:platform so that they're easy to track. intel_workarounds.c
is good reference for it.

> +		 */
> +		u32 data;
> +
> +		memcpy(&data, &buf[0], sizeof(u32));
> +		idg_nvm_write32(nvm, to, data);
> +		if (idg_nvm_error(nvm))
> +			return -EIO;
> +		buf += sizeof(u32);
> +		to += sizeof(u32);
> +		len_s -= sizeof(u32);
> +	}
> +
>  	len8 = ALIGN_DOWN(len_s, sizeof(u64));
>  	for (i = 0; i < len8; i += sizeof(u64)) {
>  		u64 data;
> @@ -303,6 +321,23 @@ static ssize_t idg_read(struct intel_dg_nvm *nvm, u8 region,
>  		from += from_shift;
>  	}
>  
> +	if (!IS_ALIGNED(from, sizeof(u64)) &&
> +	    ((from ^ (from + len_s)) & GENMASK(31, 10))) {
> +		/*
> +		 * Workaround reads/writes across 1k-aligned addresses
> +		 * (start u32 before 1k, end u32 after)
> +		 * as this fails on hardware.
> +		 */
> +		u32 data = idg_nvm_read32(nvm, from);
> +
> +		if (idg_nvm_error(nvm))
> +			return -EIO;
> +		memcpy(&buf[0], &data, sizeof(data));
> +		len_s -= sizeof(u32);
> +		buf += sizeof(u32);
> +		from += sizeof(u32);
> +	}
> +
>  	len8 = ALIGN_DOWN(len_s, sizeof(u64));
>  	for (i = 0; i < len8; i += sizeof(u64)) {
>  		u64 data = idg_nvm_read64(nvm, from + i);
> -- 
> 2.43.0
> 
