Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8762ABFF06
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 23:37:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BC1810E14D;
	Wed, 21 May 2025 21:37:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HBXdpeZn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A92210E038;
 Wed, 21 May 2025 21:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747863448; x=1779399448;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/TRHgk4WgbfqINcXZ2LzA/XzOmn7LII0S0I9TtZCzhk=;
 b=HBXdpeZnmV8AX36Fus7BpeiAPG4dxeUaY9gtB6drS5Id/VN/imsIHW7b
 bkArKArKwfrz3wEpzjcOOkvV4XnGHZgUJfLeYBnghmmx4x2aOFfB/62G7
 ty8Qpahlovi3qSF1yvXxqvkdmJaij3jWFQCmPY/aUvywlddivDnKDNe4x
 8cqY7YhY95LbNx2y3CUiPwp9+4/YaFSgSDbZ1atTynNPDGyW8AxJw4ebC
 +FDZT9LfGInIk4odUANYjPrk9498EKi3HoBbvB9zz9gYJUAxjf6FhKrfL
 byQiDmTILeS+IQm+DZPU+y27YGMZ79iPO+MXTPFMtpcrV/Dk9Ay2JpGs6 A==;
X-CSE-ConnectionGUID: Xv0Z+Sf0TLSWRk82g1GePQ==
X-CSE-MsgGUID: 5tmRbj6SQXGaEAh/J9jHPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49851096"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; d="scan'208";a="49851096"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 14:37:26 -0700
X-CSE-ConnectionGUID: yOQi57DvSxaVw+HjU/f7UA==
X-CSE-MsgGUID: hTBnemMxSU2khYiz+9BJWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; d="scan'208";a="144987316"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 14:37:21 -0700
Date: Thu, 22 May 2025 00:37:17 +0300
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
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tomas Winkler <tomasw@gmail.com>, Vitaly Lubart <lubvital@gmail.com>
Subject: Re: [PATCH v10 04/10] mtd: intel-dg: register with mtd
Message-ID: <aC5HjQKRf_4Ewous@black.fi.intel.com>
References: <20250515133345.2805031-1-alexander.usyskin@intel.com>
 <20250515133345.2805031-5-alexander.usyskin@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515133345.2805031-5-alexander.usyskin@intel.com>
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

On Thu, May 15, 2025 at 04:33:39PM +0300, Alexander Usyskin wrote:
> Register the on-die nvm device with the mtd subsystem.
> Refcount nvm object on _get and _put mtd callbacks.
> For erase operation address and size should be 4K aligned.
> For write operation address and size has to be 4bytes aligned.

...

> +static int intel_dg_nvm_init_mtd(struct intel_dg_nvm *nvm, struct device *device,
> +				 unsigned int nparts, bool writable_override)
> +{
> +	unsigned int i;
> +	unsigned int n;
> +	struct mtd_partition *parts = NULL;
> +	int ret;

Reverse xmas order (along with all other places).

> +	dev_dbg(device, "registering with mtd\n");
> +
> +	nvm->mtd.owner = THIS_MODULE;
> +	nvm->mtd.dev.parent = device;
> +	nvm->mtd.flags = MTD_CAP_NORFLASH | MTD_WRITEABLE;

Isn't MTD_CAP_NORFLASH already writable?

> +	nvm->mtd.type = MTD_DATAFLASH;
> +	nvm->mtd.priv = nvm;
> +	nvm->mtd._write = intel_dg_mtd_write;
> +	nvm->mtd._read = intel_dg_mtd_read;
> +	nvm->mtd._erase = intel_dg_mtd_erase;
> +	nvm->mtd._get_device = intel_dg_mtd_get_device;
> +	nvm->mtd._put_device = intel_dg_mtd_put_device;
> +	nvm->mtd.writesize = SZ_1; /* 1 byte granularity */
> +	nvm->mtd.erasesize = SZ_4K; /* 4K bytes granularity */
> +	nvm->mtd.size = nvm->size;
> +
> +	parts = kcalloc(nvm->nregions, sizeof(*parts), GFP_KERNEL);
> +	if (!parts)
> +		return -ENOMEM;
> +
> +	for (i = 0, n = 0; i < nvm->nregions && n < nparts; i++) {
> +		if (!nvm->regions[i].is_readable)
> +			continue;
> +		parts[n].name = nvm->regions[i].name;
> +		parts[n].offset  = nvm->regions[i].offset;
> +		parts[n].size = nvm->regions[i].size;
> +		if (!nvm->regions[i].is_writable && !writable_override)
> +			parts[n].mask_flags = MTD_WRITEABLE;
> +		n++;
> +	}
> +
> +	ret = mtd_device_register(&nvm->mtd, parts, n);
> +
> +	kfree(parts);

I didn't find anything questionable about this, but hope this is tested
and there are no side-effects of this.

> +

Nit: Redundant blank line.

> +	return ret;
> +}

Raag
