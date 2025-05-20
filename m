Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4225ABE1D6
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 19:31:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEFB010E5A9;
	Tue, 20 May 2025 17:31:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nR15hpZc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D137810E593;
 Tue, 20 May 2025 17:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747762285; x=1779298285;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=aKyld7h5OwA2Tp0yE8iRRpriwlPf1t10b9g3LHZckzk=;
 b=nR15hpZcSLQGv/WxwjL8KnYDrbEoUZo4nBp3D6VCOgofrb9l6dn0oUOM
 4FFu5Ql9WFLXxnelNaty1TbeY76R/2lMEg6WrjXJXhD5U+PiGUKsNXSgx
 WThdIiZEYQYb2TeB8rxOjjuS4sM6nL++YWBXXMbT2EugSLDaaev8E1moW
 DWBYOeP4DlfGORuSJsaKWVqtbgXRygx4b92Bs27aqa4QS4Y5d4Hf1HYUa
 mAV3W2Ahla/ScPq2BmKVn0q7XGw0w2CohdgXmXtdH0N5W/J8g6My8fdeb
 TP0sEIBZKFatIie3yObNLS0h5LSN+egSPyqjAOukfLK7DRaECIr/m0tik w==;
X-CSE-ConnectionGUID: +fNoh/JWTg28JOBmyp5gjw==
X-CSE-MsgGUID: YORJR6jxTh6v0nGHb+tPUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49583721"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="49583721"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 10:31:25 -0700
X-CSE-ConnectionGUID: N2HUp1NUTKeNrYa5H8G9PA==
X-CSE-MsgGUID: cUQ/AInPT/yQWzIWv/8eew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="143754323"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 10:31:19 -0700
Date: Tue, 20 May 2025 20:31:16 +0300
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
Subject: Re: [PATCH v10 03/10] mtd: intel-dg: implement access functions
Message-ID: <aCy8ZJq4eDMDQukx@black.fi.intel.com>
References: <20250515133345.2805031-1-alexander.usyskin@intel.com>
 <20250515133345.2805031-4-alexander.usyskin@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515133345.2805031-4-alexander.usyskin@intel.com>
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

On Thu, May 15, 2025 at 04:33:38PM +0300, Alexander Usyskin wrote:
> Implement read(), erase() and write() functions.

...

> +__maybe_unused
> +static unsigned int idg_nvm_get_region(const struct intel_dg_nvm *nvm, loff_t from)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < nvm->nregions; i++) {
> +		if ((nvm->regions[i].offset + nvm->regions[i].size - 1) > from &&

Since it's already off by one, I'm wondering if this should be >= ?

> +		    nvm->regions[i].offset <= from &&
> +		    nvm->regions[i].size != 0)
> +			break;
> +	}
> +
> +	return i;
> +}

...

> +__maybe_unused
> +static ssize_t
> +idg_erase(struct intel_dg_nvm *nvm, u8 region, loff_t from, u64 len, u64 *fail_addr)
> +{
> +	u64 i;
> +	const u32 block = 0x10;
> +	void __iomem *base = nvm->base;

Reverse xmas order (along with all other places).

> +	for (i = 0; i < len; i += SZ_4K) {
> +		iowrite32(from + i, base + NVM_ADDRESS_REG);
> +		iowrite32(region << 24 | block, base + NVM_ERASE_REG);
> +		/* Since the writes are via sguint

sguint?

> +		 * we cannot do back to back erases.
> +		 */
> +		msleep(50);
> +	}
> +	return len;
> +}

Raag
