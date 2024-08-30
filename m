Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E48965C83
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 11:17:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFEF210E8E6;
	Fri, 30 Aug 2024 09:16:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cEa7RYPg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1732310E8E6;
 Fri, 30 Aug 2024 09:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725009418; x=1756545418;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=4Br2wWK0klKoTVT0lphRiFc8egQS7eKv4nYmYIWdbAQ=;
 b=cEa7RYPgIQLRHRK10oAfhjnKN1oclvOG9WHgTwsoFXX3gb1DAKPIVkPu
 X4Hd+cli/xp6eQ4xpv3/UlpBKOIXSKkZ4KRfEkcXaM+/oevlq7bNEjhLm
 I/Oc7dVsIJPhNiJAxb+Ki1lgst1tdiCk7xEbWiYSBioAiLUpvMxp8Hh5K
 3q3F6tvSUz/r87CaA6Az8H1ivRHGhdgSUl5tWE/ttZAHKT8ya1fDN2eBR
 RuVzf7BMt3WM2GZkzJcfCBJR5nfX0LkRyGgA/0DgnPAZz7QyhtgZRD0NC
 jU92DSbjdqClcq8+HlY16DPc2Jhe1b811YE27Qhb+T/TOGT2bJ7Netce1 A==;
X-CSE-ConnectionGUID: aXbHtP8GT0Cp0XZn24zfYw==
X-CSE-MsgGUID: x4TCEltOS5ullVes3ybxEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="23828543"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="23828543"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 02:16:57 -0700
X-CSE-ConnectionGUID: tPek0hBYSQeV5DIx7hjJFQ==
X-CSE-MsgGUID: TL7ksamOTkmyaz4ijHWghA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="68239913"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 [10.245.245.123]) ([10.245.245.123])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 02:16:55 -0700
Message-ID: <b8f536b7f804da791869e6ff8c13b36ff93cd1eb.camel@linux.intel.com>
Subject: Re: [RFC PATCH 05/28] drm/gpusvm: Add support for GPU Shared
 Virtual Memory
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: airlied@gmail.com, christian.koenig@amd.com, matthew.auld@intel.com, 
 daniel@ffwll.ch
Date: Fri, 30 Aug 2024 11:16:53 +0200
In-Reply-To: <20240828024901.2582335-6-matthew.brost@intel.com>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
 <20240828024901.2582335-6-matthew.brost@intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
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

Hi, Matthew

On Tue, 2024-08-27 at 19:48 -0700, Matthew Brost wrote:
> +/**
> + * DOC: Overview
> + *
> + * GPU Shared Virtual Memory (GPU SVM) layer for the Direct
> Rendering Manager (DRM)
> + *
> + * The GPU SVM layer is a component of the DRM framework designed to
> manage shared
> + * virtual memory between the CPU and GPU. It enables efficient data
> exchange and
> + * processing for GPU-accelerated applications by allowing memory
> sharing and
> + * synchronization between the CPU's and GPU's virtual address
> spaces.
> + *
> + * Key GPU SVM Components:
> + * - Notifiers: Notifiers: Used for tracking memory intervals and
> notifying the
> + *		GPU of changes, notifiers are sized based on a GPU
> SVM
> + *		initialization parameter, with a recommendation of
> 512M or
> + *		larger. They maintain a Red-BlacK tree and a list of
> ranges that
> + *		fall within the notifier interval. Notifiers are
> tracked within
> + *		a GPU SVM Red-BlacK tree and list and are
> dynamically inserted
> + *		or removed as ranges within the interval are created
> or
> + *		destroyed.
> + * - Ranges: Represent memory ranges mapped in a DRM device and
> managed
> + *	=C2=A0=C2=A0=C2=A0=C2=A0 by GPU SVM. They are sized based on an array=
 of chunk
> sizes, which
> + *	=C2=A0=C2=A0=C2=A0=C2=A0 is a GPU SVM initialization parameter, and t=
he CPU
> address space.
> + *	=C2=A0=C2=A0=C2=A0=C2=A0 Upon GPU fault, the largest aligned chunk th=
at fits
> within the
> + *	=C2=A0=C2=A0=C2=A0=C2=A0 faulting CPU address space is chosen for the=
 range
> size. Ranges are
> + *	=C2=A0=C2=A0=C2=A0=C2=A0 expected to be dynamically allocated on GPU =
fault and
> removed on an
> + *	=C2=A0=C2=A0=C2=A0=C2=A0 MMU notifier UNMAP event. As mentioned above=
, ranges
> are tracked in
> + *	=C2=A0=C2=A0=C2=A0=C2=A0 a notifier's Red-Black tree.
> + * - Operations: Define the interface for driver-specific SVM
> operations such as
> + *		 allocation, page collection, migration,
> invalidations, and VRAM
> + *		 release.
> + *

Another question, since ranges, as I understand it, are per gpuvm and
per cpu mm, whereas migration is per device and per cpu_mm, (whe might
have multiple gpuvms mapping the same cpu_mm), I figure the gpu_svm is
per gpuvm, but that makes migration currently inconsistent, right?

/Thomas

