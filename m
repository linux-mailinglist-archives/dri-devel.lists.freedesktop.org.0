Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8C5AA074B
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 11:31:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BC4310E404;
	Tue, 29 Apr 2025 09:31:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cWUqEJV2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6266410E404;
 Tue, 29 Apr 2025 09:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745919102; x=1777455102;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JSp33XGPTyatueK4o6jd84vVu0TKMpsc3F+Uq/MAUeo=;
 b=cWUqEJV2SZJGt59J/Mdi8jwzN/1M47mRWli2V9TxdNEE7guyEZAoEJax
 KE+bQ+iG6km6edOSH0OcDDXUAg/jLNPY1VlVJsWkdMfaZ1iD0/DKQ8pcw
 460rSn607H6fUlsJ2DSAa4E1Jx0wya715/ElSotVtJpVveH/i0vwGxDyU
 nrWAO1vB8Wg/AczzTs5tMoyWH4vIDYb8t5WlrOxVBfAS036Rk/ergOQv1
 18szxXe2jEEsOiRXDm7RqWLnEw5eQoiOB071BkwjgO041dWMPNQMPlqEF
 1uBU3NArZmrRd1zC8MyHD1LfC+jQdup/7hnNPgUD/9GOS5vbIpsBM1kWZ A==;
X-CSE-ConnectionGUID: Tl0yOMJqRCGT5pk1t/eoNw==
X-CSE-MsgGUID: Fr7Ht8R3TCKpfwpf43M8Og==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="64950259"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208";a="64950259"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 02:31:41 -0700
X-CSE-ConnectionGUID: vSTcVcNKRbqprzBtYgZZqQ==
X-CSE-MsgGUID: EItLiXMqRMC9ILIgbEryWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208";a="134086830"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 02:31:35 -0700
Date: Tue, 29 Apr 2025 12:31:32 +0300
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
 Tomas Winkler <tomasw@gmail.com>
Subject: Re: [PATCH v9 02/12] mtd: add driver for intel graphics non-volatile
 memory device
Message-ID: <aBCcdPbIxthARrMj@black.fi.intel.com>
References: <20250424132536.3043825-1-alexander.usyskin@intel.com>
 <20250424132536.3043825-3-alexander.usyskin@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424132536.3043825-3-alexander.usyskin@intel.com>
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

On Thu, Apr 24, 2025 at 04:25:26PM +0300, Alexander Usyskin wrote:
> Add auxiliary driver for intel discrete graphics
> non-volatile memory device.

...

> +static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
> +			      const struct auxiliary_device_id *aux_dev_id)
> +{
> +	struct intel_dg_nvm_dev *invm = auxiliary_dev_to_intel_dg_nvm_dev(aux_dev);
> +	struct device *device;
> +	struct intel_dg_nvm *nvm;
> +	unsigned int nregions;
> +	unsigned int i, n;
> +	char *name;

Perhaps move this to the loop it is being used in?

> +	int ret;
> +
> +	device = &aux_dev->dev;
> +
> +	/* count available regions */
> +	for (nregions = 0, i = 0; i < INTEL_DG_NVM_REGIONS; i++) {
> +		if (invm->regions[i].name)
> +			nregions++;
> +	}
> +
> +	if (!nregions) {
> +		dev_err(device, "no regions defined\n");
> +		return -ENODEV;
> +	}
> +
> +	nvm = kzalloc(struct_size(nvm, regions, nregions), GFP_KERNEL);
> +	if (!nvm)
> +		return -ENOMEM;
> +
> +	kref_init(&nvm->refcnt);
> +
> +	nvm->nregions = nregions;

Is this assignment useful?

> +	for (n = 0, i = 0; i < INTEL_DG_NVM_REGIONS; i++) {
> +		if (!invm->regions[i].name)
> +			continue;
> +
> +		name = kasprintf(GFP_KERNEL, "%s.%s",
> +				 dev_name(&aux_dev->dev), invm->regions[i].name);
> +		if (!name)
> +			continue;
> +		nvm->regions[n].name = name;
> +		nvm->regions[n].id = i;
> +		n++;
> +	}
> +	nvm->nregions = n; /* in case where kasprintf fail */

Considering kasprintf failure, should we move forward if n == 0?

> +	nvm->base = devm_ioremap_resource(device, &invm->bar);
> +	if (IS_ERR(nvm->base)) {
> +		dev_err(device, "mmio not mapped\n");

Is this useful? Perhaps the helper already does it for us.

> +		ret = PTR_ERR(nvm->base);
> +		goto err;
> +	}
> +
> +	dev_set_drvdata(&aux_dev->dev, nvm);
> +
> +	return 0;
> +
> +err:
> +	kref_put(&nvm->refcnt, intel_dg_nvm_release);
> +	return ret;
> +}
> +
> +static void intel_dg_mtd_remove(struct auxiliary_device *aux_dev)
> +{
> +	struct intel_dg_nvm *nvm = dev_get_drvdata(&aux_dev->dev);
> +
> +	if (!nvm)
> +		return;

Are we expecting this?

> +	dev_set_drvdata(&aux_dev->dev, NULL);

Do we need this?

> +	kref_put(&nvm->refcnt, intel_dg_nvm_release);
> +}
> +
> +static const struct auxiliary_device_id intel_dg_mtd_id_table[] = {
> +	{
> +		.name = "i915.nvm",
> +	},
> +	{
> +		.name = "xe.nvm",
> +	},
> +	{
> +		/* sentinel */
> +	}
> +};
> +MODULE_DEVICE_TABLE(auxiliary, intel_dg_mtd_id_table);
> +
> +static struct auxiliary_driver intel_dg_mtd_driver = {
> +	.probe  = intel_dg_mtd_probe,
> +	.remove = intel_dg_mtd_remove,
> +	.driver = {
> +		/* auxiliary_driver_register() sets .name to be the modname */
> +	},
> +	.id_table = intel_dg_mtd_id_table
> +};

> +

Nit: Redundant blank line.

> +module_auxiliary_driver(intel_dg_mtd_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Intel Corporation");
> +MODULE_DESCRIPTION("Intel DGFX MTD driver");
> diff --git a/include/linux/intel_dg_nvm_aux.h b/include/linux/intel_dg_nvm_aux.h
> new file mode 100644
> index 000000000000..68df634c994c
> --- /dev/null
> +++ b/include/linux/intel_dg_nvm_aux.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright(c) 2019-2025, Intel Corporation. All rights reserved.
> + */
> +
> +#ifndef __INTEL_DG_NVM_AUX_H__
> +#define __INTEL_DG_NVM_AUX_H__
> +
> +#include <linux/auxiliary_bus.h>

Missing types.h, container_of.h

> +#define INTEL_DG_NVM_REGIONS 13
> +
> +struct intel_dg_nvm_region {
> +	const char *name;
> +};
> +
> +struct intel_dg_nvm_dev {
> +	struct auxiliary_device aux_dev;
> +	bool writable_override;
> +	struct resource bar;
> +	const struct intel_dg_nvm_region *regions;
> +};
> +
> +#define auxiliary_dev_to_intel_dg_nvm_dev(auxiliary_dev) \
> +	container_of(auxiliary_dev, struct intel_dg_nvm_dev, aux_dev)
> +
> +#endif /* __INTEL_DG_NVM_AUX_H__ */
> -- 
> 2.43.0
> 
