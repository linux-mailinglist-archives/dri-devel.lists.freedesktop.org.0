Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2161AABFDDD
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 22:26:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26CBB10E71C;
	Wed, 21 May 2025 20:26:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B8ll0sz1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30CC710E71C;
 Wed, 21 May 2025 20:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747859195; x=1779395195;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=aLtQzNGu5/O0fU0Cv03GWH9zFR3LL3UOULcLPG921iI=;
 b=B8ll0sz15ZI3mvmH1qqLzz3/IhozoSgdr1c0bg2GpamWRNsoIXcaCVTK
 Gk0K+2ajlzJz7xv5abYkFjOrvw+K2rdT0nSXzPaS7v42JBjl2k5waI7T0
 btri9NJ92lAVE7DWy/2h5RK1ByqVZzJ0AYaW4l45plnsFJZ/tdEhZ2JGC
 nn45i69uCwgcSOMOxEh5aV62jKpkoApt2cy8XadbxXnqH0Ho4622x+iw9
 9KMkMFQhoHXjDPxSU0h2knYBrHW3I6BWqHcXn4fS0AQnPBRp1IuTzqxQj
 uHf9TNyfehz/NnuhjOXh064OUuZ5qa/q2SXAGzH+NPuoqf5k1t3CZWqtz A==;
X-CSE-ConnectionGUID: drXq0x/RSFK6PH+PxopASw==
X-CSE-MsgGUID: hbDkEoDXQqiiZgjvKcxi/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49762884"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; d="scan'208";a="49762884"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 13:26:35 -0700
X-CSE-ConnectionGUID: qZCX3NfvRmW5MjpehmDrkQ==
X-CSE-MsgGUID: D1ORkfQ1S9OCFvbKBj7yjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; d="scan'208";a="140088834"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 13:26:29 -0700
Date: Wed, 21 May 2025 23:26:24 +0300
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
Message-ID: <aC428Ak5j_x6Cr2o@black.fi.intel.com>
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
> +static ssize_t idg_write(struct intel_dg_nvm *nvm, u8 region,
> +			 loff_t to, size_t len, const unsigned char *buf)
> +{
> +	size_t i;
> +	size_t len8;
> +	size_t len4;
> +	size_t to4;
> +	size_t to_shift;
> +	size_t len_s = len;
> +	ssize_t ret;
> +
> +	idg_nvm_set_region_id(nvm, region);
> +
> +	to4 = ALIGN_DOWN(to, sizeof(u32));
> +	to_shift = min(sizeof(u32) - ((size_t)to - to4), len);
> +	if (to - to4) {
> +		ret = idg_nvm_rewrite_partial(nvm, to4, to - to4, to_shift, (uint32_t *)&buf[0]);

Forgot to add, you're using both uint32_t and u32.
Perhaps make it consistent?

> +		if (ret < 0)
> +			return ret;
> +
> +		buf += to_shift;
> +		to += to_shift;
> +		len_s -= to_shift;
> +	}
> +
> +	len8 = ALIGN_DOWN(len_s, sizeof(u64));
> +	for (i = 0; i < len8; i += sizeof(u64)) {
> +		u64 data;
> +
> +		memcpy(&data, &buf[i], sizeof(u64));
> +		idg_nvm_write64(nvm, to + i, data);
> +		if (idg_nvm_error(nvm))
> +			return -EIO;
> +	}
> +
> +	len4 = len_s - len8;
> +	if (len4 >= sizeof(u32)) {
> +		u32 data;
> +
> +		memcpy(&data, &buf[i], sizeof(u32));
> +		idg_nvm_write32(nvm, to + i, data);
> +		if (idg_nvm_error(nvm))
> +			return -EIO;
> +		i += sizeof(u32);
> +		len4 -= sizeof(u32);
> +	}
> +
> +	if (len4 > 0) {
> +		ret = idg_nvm_rewrite_partial(nvm, to + i, 0, len4, (uint32_t *)&buf[i]);

Ditto (and also in all other places if any).

> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return len;
> +}

Raag
