Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AEEABA5DE
	for <lists+dri-devel@lfdr.de>; Sat, 17 May 2025 00:22:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEA5310EBA5;
	Fri, 16 May 2025 22:22:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cJfQPA77";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF6B10EBA5;
 Fri, 16 May 2025 22:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747434128; x=1778970128;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kONYMJEJ044G8TH598Cjlf7EWAn1NPZyS4WQgCgWhfw=;
 b=cJfQPA77LFuBpRVI7eph1iOdow+P8Yj5EcbTbSJD9Hp0AZtSgFkC+T79
 iHIXlQBFrEv1FfGOrc/46VivX/9EY4w1uL6qJcYX+iDualNUHBqCys07y
 z1Zc2BUmEwpEo6uuJGIdUWCTvmllNIKUUiLPLF3278TR59iV1WBGQJGMI
 ptrG4eYGv1Q8KYQc3i5F4ohqLY8VsZs9ILnNws2cAF+i8LSY48DPRBQKm
 s1/8j6XqW3tEXxZHTW6zgeG4goLSdrRKOkR8ilq5y3nIjROzZpC8ILOEG
 67KIzlB6fZizivZoYQNUa9W84bB/OpE/Lq0DAxVkLjS3678QizsDF0ZiT A==;
X-CSE-ConnectionGUID: f30jnNxVRCKFY//6gZDp9Q==
X-CSE-MsgGUID: l2hG1kXZTEmbgbvuVv9ZTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="53219831"
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; d="scan'208";a="53219831"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 15:22:07 -0700
X-CSE-ConnectionGUID: 4PfXNEVeSPSO2G7++83Vng==
X-CSE-MsgGUID: 1joxnqDJQsmgxWHlsSO7fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; d="scan'208";a="143934991"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 15:22:01 -0700
Date: Sat, 17 May 2025 01:21:58 +0300
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
Subject: Re: [PATCH v10 02/10] mtd: intel-dg: implement region enumeration
Message-ID: <aCe6hlGFG3v0cav9@black.fi.intel.com>
References: <20250515133345.2805031-1-alexander.usyskin@intel.com>
 <20250515133345.2805031-3-alexander.usyskin@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515133345.2805031-3-alexander.usyskin@intel.com>
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

On Thu, May 15, 2025 at 04:33:37PM +0300, Alexander Usyskin wrote:
> In intel-dg, there is no access to the spi controller,
> the information is extracted from the descriptor region.

...

> +static int intel_dg_nvm_init(struct intel_dg_nvm *nvm, struct device *device)
> +{
> +	int ret;
> +	unsigned int i, n;
> +	u32 access_map = 0;

Reverse xmas order (along with all other places) and

Reviewed-by: Raag Jadav <raag.jadav@intel.com>

> +	/* clean error register, previous errors are ignored */
> +	idg_nvm_error(nvm);
> +
> +	ret = idg_nvm_is_valid(nvm);
> +	if (ret) {
> +		dev_err(device, "The MEM is not valid %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (idg_nvm_get_access_map(nvm, &access_map))
> +		return -EIO;
> +
> +	for (i = 0, n = 0; i < nvm->nregions; i++) {
> +		u32 address, base, limit, region;
> +		u8 id = nvm->regions[i].id;
> +
> +		address = NVM_FLREG(id);
> +		region = idg_nvm_read32(nvm, address);
> +
> +		base = FIELD_GET(NVM_FREG_BASE_MASK, region) << NVM_FREG_ADDR_SHIFT;
> +		limit = (FIELD_GET(NVM_FREG_ADDR_MASK, region) << NVM_FREG_ADDR_SHIFT) |
> +			NVM_FREG_MIN_REGION_SIZE;
> +
> +		dev_dbg(device, "[%d] %s: region: 0x%08X base: 0x%08x limit: 0x%08x\n",
> +			id, nvm->regions[i].name, region, base, limit);
> +
> +		if (base >= limit || (i > 0 && limit == 0)) {
> +			dev_dbg(device, "[%d] %s: disabled\n",
> +				id, nvm->regions[i].name);
> +			nvm->regions[i].is_readable = 0;
> +			continue;
> +		}
> +
> +		if (nvm->size < limit)
> +			nvm->size = limit;
> +
> +		nvm->regions[i].offset = base;
> +		nvm->regions[i].size = limit - base + 1;
> +		/* No write access to descriptor; mask it out*/
> +		nvm->regions[i].is_writable = idg_nvm_region_writable(access_map, id);
> +
> +		nvm->regions[i].is_readable = idg_nvm_region_readable(access_map, id);
> +		dev_dbg(device, "Registered, %s id=%d offset=%lld size=%lld rd=%d wr=%d\n",
> +			nvm->regions[i].name,
> +			nvm->regions[i].id,
> +			nvm->regions[i].offset,
> +			nvm->regions[i].size,
> +			nvm->regions[i].is_readable,
> +			nvm->regions[i].is_writable);
> +
> +		if (nvm->regions[i].is_readable)
> +			n++;
> +	}
> +
> +	dev_dbg(device, "Registered %d regions\n", n);
> +
> +	/* Need to add 1 to the amount of memory
> +	 * so it is reported as an even block
> +	 */
> +	nvm->size += 1;
> +
> +	return n;
> +}
> +
>  static void intel_dg_nvm_release(struct kref *kref)
>  {
>  	struct intel_dg_nvm *nvm = container_of(kref, struct intel_dg_nvm, refcnt);
> @@ -85,6 +285,12 @@ static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
>  		goto err;
>  	}
>  
> +	ret = intel_dg_nvm_init(nvm, device);
> +	if (ret < 0) {
> +		dev_err(device, "cannot initialize nvm %d\n", ret);
> +		goto err;
> +	}
> +
>  	dev_set_drvdata(&aux_dev->dev, nvm);
>  
>  	return 0;
> -- 
> 2.43.0
> 
