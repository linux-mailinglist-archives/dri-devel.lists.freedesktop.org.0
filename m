Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1A9B59000
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 10:07:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9FDA10E6A8;
	Tue, 16 Sep 2025 08:07:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z3G7eih/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53C1C10E30B;
 Tue, 16 Sep 2025 08:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758010039; x=1789546039;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Y8J/F7oKrl3zjCh+oB+s8eg1WIz+389ZWBoMt2NLWbc=;
 b=Z3G7eih/d2i9H3QRfFhkzFd3y3Hh1iL5yCxtGo9nR96nMQt7ay+FIaTn
 NJ8iM+Vvdk8yRgA3CJNz3s7GIhApOG+0/DymK0cwKxNFu80PR4INtJX5R
 fdeq4DuSKxg1FXq9eSPPrEsfy49B9cY4EB2IjA0JiNY/k2Q4jNux7iaAy
 248mPwaSvYCN9vMmw9bOvFdZA2TJNb1uE3gPe4zmUxvUTU9WBzZbARhEG
 rcDkXL4pnqb39dgGrRTS8Kse6e98EFFCFC/XZkd4zyQXmG7y2g9o6Hwlq
 h8Nup+LbBKgdcWxN6hgea3DoUun37K0LyXsvFb0y9o+8GFhJo3HkUSlTK A==;
X-CSE-ConnectionGUID: Il/uEFUgThS2AFGFkd1Yzw==
X-CSE-MsgGUID: 8kdQHb0jSoaRSug94bOGtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="59326755"
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; d="scan'208";a="59326755"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 01:07:17 -0700
X-CSE-ConnectionGUID: JyflTA6ySzGmtCMp5c36wg==
X-CSE-MsgGUID: bcQf46JZTxGbHCsvp5kmDQ==
X-ExtLoop1: 1
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.81])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 01:07:10 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>, Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Cc: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Christian
 =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona
 Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tursulin@ursulin.net>,
 ?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Michael J . Ruhl" <mjruhl@habana.ai>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 05/11] PCI: Add pci_rebar_size_supported() helper
In-Reply-To: <cduh4ave3lbdgd2kutfhgf3obf3wuskgxf6rrhggsiksw7wrwa@lqly5npj5g3r>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250915091358.9203-1-ilpo.jarvinen@linux.intel.com>
 <20250915091358.9203-6-ilpo.jarvinen@linux.intel.com>
 <cduh4ave3lbdgd2kutfhgf3obf3wuskgxf6rrhggsiksw7wrwa@lqly5npj5g3r>
Date: Tue, 16 Sep 2025 11:07:07 +0300
Message-ID: <eb0bbfbcb963174bbb625268b0e5385deb8a2c62@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 15 Sep 2025, Andi Shyti <andi.shyti@kernel.org> wrote:
> Hi Ilpo,
>
>> +/**
>> + * pci_rebar_size_supported - check if size is supported for BAR
>> + * @pdev: PCI device
>> + * @bar: BAR to check
>> + * @size: size as defined in the PCIe spec (0=1MB, 31=128TB)
>> + *
>> + * Return: %true if @bar is resizable and @size is a supported, otherwise
>> + *	   %false.
>> + */
>> +bool pci_rebar_size_supported(struct pci_dev *pdev, int bar, int size)
>> +{
>> +	u64 sizes = pci_rebar_get_possible_sizes(pdev, bar);
>> +
>> +	return BIT(size) & sizes;
>
> I would return here "!!(BIT(size) & sizes)", but it doesn't
> really matter.

If the patch had that, I'd ask to drop the superfluous negations and
parens...

BR,
Jani.

>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>
> Andi

-- 
Jani Nikula, Intel
