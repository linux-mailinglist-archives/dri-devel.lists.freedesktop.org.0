Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94822AB861F
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 14:19:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8301410E258;
	Thu, 15 May 2025 12:19:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cclYx5Y5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1B3F10E258;
 Thu, 15 May 2025 12:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747311581; x=1778847581;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wFAQ3NK4nPQd0IHrWUbmpnTo8qjx6xZhrLCMhXW/F14=;
 b=cclYx5Y5KL3wU4ZJ4t9xOurmgD8kEO9mw+rCCQHFWcKbh3zrAosfpwnR
 pnY1nv7QNoh3PReuFehIuPD5jbNhQvXke3NaMCKw2twQ8fLRq3EXuDbAY
 7bGuG6384dGAAoj3j/txAquT9AcMqP/Xwe92HZj5+40JIACjTxjYoya9x
 vf55AUwjBY5V3mLOZsahzglsLPpHjEflZfq7wwkOx+85/ymSrc/7qvDCE
 A2qEfIZCu4D/mowM93TRnlX9yePVb0oB5HPeSOlUUSCYZBNH2vxx9D5HA
 QcwTjZHFQrNQul782BFylZHGfIGeUUYG6Xs/ADoe0uZ3YQmsqOl9INpJX g==;
X-CSE-ConnectionGUID: +hojC1aaQ3ydCsYTvVQUvQ==
X-CSE-MsgGUID: CKpBDoabS1+hbMTuwwjpWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49402649"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; d="scan'208";a="49402649"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 05:19:40 -0700
X-CSE-ConnectionGUID: yuRuvhS8TrOvZRAiYDej+Q==
X-CSE-MsgGUID: TYMuvsbVQ/aKlzbvndqzBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; d="scan'208";a="143553856"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 05:19:36 -0700
Date: Thu, 15 May 2025 15:19:32 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 "Poosa, Karthik" <karthik.poosa@intel.com>,
 "Abliyev, Reuven" <reuven.abliyev@intel.com>,
 "Weil, Oren jer" <oren.jer.weil@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tomas Winkler <tomasw@gmail.com>
Subject: Re: [PATCH v9 03/12] mtd: intel-dg: implement region enumeration
Message-ID: <aCXb1NjwGquN6vGN@black.fi.intel.com>
References: <20250424132536.3043825-1-alexander.usyskin@intel.com>
 <20250424132536.3043825-4-alexander.usyskin@intel.com>
 <aBCfbaYs9CnXL2h1@black.fi.intel.com>
 <CY5PR11MB6366AACB5EA494893CA8D16DED90A@CY5PR11MB6366.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CY5PR11MB6366AACB5EA494893CA8D16DED90A@CY5PR11MB6366.namprd11.prod.outlook.com>
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

On Thu, May 15, 2025 at 04:53:38PM +0530, Usyskin, Alexander wrote:
> > On Thu, Apr 24, 2025 at 04:25:27PM +0300, Alexander Usyskin wrote:
> > > In intel-dg, there is no access to the spi controller,
> > > the information is extracted from the descriptor region.
> > 
> > ...
> > 
> > > @@ -22,9 +24,199 @@ struct intel_dg_nvm {
> > >  		u8 id;
> > >  		u64 offset;
> > >  		u64 size;
> > > +		unsigned int is_readable:1;
> > > +		unsigned int is_writable:1;
> > >  	} regions[] __counted_by(nregions);
> > >  };
> > >
> > > +#define NVM_TRIGGER_REG       0x00000000
> > > +#define NVM_VALSIG_REG        0x00000010
> > > +#define NVM_ADDRESS_REG       0x00000040
> > > +#define NVM_REGION_ID_REG     0x00000044
> > > +/*
> > > + * [15:0]-Erase size = 0x0010 4K 0x0080 32K 0x0100 64K
> > > + * [23:16]-Reserved
> > > + * [31:24]-Erase MEM RegionID
> > > + */
> > > +#define NVM_ERASE_REG         0x00000048
> > > +#define NVM_ACCESS_ERROR_REG  0x00000070
> > > +#define NVM_ADDRESS_ERROR_REG 0x00000074
> > > +
> > > +/* Flash Valid Signature */
> > > +#define NVM_FLVALSIG          0x0FF0A55A
> > > +
> > > +#define NVM_MAP_ADDR_MASK     GENMASK(7, 0)
> > > +#define NVM_MAP_ADDR_SHIFT    0x00000004
> > > +
> > > +#define NVM_REGION_ID_DESCRIPTOR  0
> > > +/* Flash Region Base Address */
> > > +#define NVM_FRBA      0x40
> > > +/* Flash Region __n - Flash Descriptor Record */
> > > +#define NVM_FLREG(__n) (NVM_FRBA + ((__n) * 4))
> > > +/*  Flash Map 1 Register */
> > > +#define NVM_FLMAP1_REG  0x18
> > > +#define NVM_FLMSTR4_OFFSET 0x00C
> > > +
> > > +#define NVM_ACCESS_ERROR_PCIE_MASK 0x7
> > > +
> > > +#define NVM_FREG_BASE_MASK GENMASK(15, 0)
> > > +#define NVM_FREG_ADDR_MASK GENMASK(31, 16)
> > > +#define NVM_FREG_ADDR_SHIFT 12
> > > +#define NVM_FREG_MIN_REGION_SIZE 0xFFF
> > 
> > Should we move these to a header?
> They are used only in this file, not shared to anyone, why to put in header?

If we know we won't be further expanding/splitting, sure.

...

> > > +static bool idg_nvm_region_readable(u32 access_map, u8 region)
> > > +{
> > > +	if (region < 12)
> > 
> > Anything special about 12? Should it have a macro def somewhere?
> > 
> 
> The access bits are separated for first 12 regions and last 4.
> My feeling that making below numbers #define will make
> code less readable.

Then perhaps a small comment would be useful.

> > > +		return access_map & BIT(region + 8); /* [19:8] */
> > > +	else
> > > +		return access_map & BIT(region - 12); /* [3:0] */
> > > +}
> > > +
> > > +static bool idg_nvm_region_writable(u32 access_map, u8 region)
> > > +{
> > > +	if (region < 12)

Ditto.

> > > +		return access_map & BIT(region + 20); /* [31:20] */
> > > +	else
> > > +		return access_map & BIT(region - 8); /* [7:4] */
> > > +}

Raag
