Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A94B17F20
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 11:21:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F274110E827;
	Fri,  1 Aug 2025 09:21:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LzdbmTXp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B0C210E816;
 Fri,  1 Aug 2025 09:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754040067; x=1785576067;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=cKEMaZ3xwUu+fSWQ2Hl9xASFWa0pTzYBZ3KKX3hjrm0=;
 b=LzdbmTXpfIemIXtDCMCQIGHhzuwvrxfT/vTgH8GZNbHX86BBswJ3J0wr
 O+tBHS3mL6gFd2GvHGJhMK9fKt+s2b/Ix+NtgM+nCuX/cNXLJIcx9Yl8i
 eV+yE13lLPDrbMBEPrfZ0Dyp9ckKuzyqeSL5IeqSUsWqbzABk2TdYMhkJ
 UyibhA1O/eaj+cv6M15PcP8YhS5h5rWHh+WhAnSBZsXxWWhEgz/M2i3TT
 ElBFtehOTZN0QVvSnJLmC6+s5OUaspgPHxiaQcrWRAaZS2vwPqqJdOaSM
 LkWXAzeSWljpYpn0468jBVNVd6eu8Akn8GqYX+veS6pJee1JSmqOqzpjv Q==;
X-CSE-ConnectionGUID: LQO/TY6PSKCZbdxQ3BelUw==
X-CSE-MsgGUID: M86odHeMQ2ejIqQ/YP8saw==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56252217"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="56252217"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 02:21:07 -0700
X-CSE-ConnectionGUID: 63UaVF4bTeCXP614Ugu8xQ==
X-CSE-MsgGUID: yBhDIk81QAqE2hjylSFGsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="163083171"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO [10.245.244.137])
 ([10.245.244.137])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 02:21:05 -0700
Message-ID: <460b95285cdf23dc6723972ba69ee726b3b3cfba.camel@linux.intel.com>
Subject: Re: [PATCH v2 1/1] Mark xe driver as BROKEN if kernel page size is
 not 4kB
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Simon Richter <Simon.Richter@hogyros.de>,
 intel-xe@lists.freedesktop.org, 	dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Date: Fri, 01 Aug 2025 11:20:40 +0200
In-Reply-To: <20250727070413.9743-2-Simon.Richter@hogyros.de>
References: <20250727070413.9743-1-Simon.Richter@hogyros.de>
 <20250727070413.9743-2-Simon.Richter@hogyros.de>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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

On Sun, 2025-07-27 at 16:04 +0900, Simon Richter wrote:
> This driver, for the time being, assumes that the kernel page size is
> 4kB,
> so it fails on loong64 and aarch64 with 16kB pages, and ppc64el with
> 64kB
> pages.
>=20
> Signed-off-by: Simon Richter <Simon.Richter@hogyros.de>
> Cc: stable@vger.kernel.org

This looks reasonable to me. During your testing, did you notice
whether there were compilation errors on !4K as well? If not, what do
you thing on allowing !4K also for COMPILE_TEST?

Thanks,
Thomas


> ---
> =C2=A0drivers/gpu/drm/xe/Kconfig | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 2bb2bc052120..7c9f1de7b35f 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -1,7 +1,7 @@
> =C2=A0# SPDX-License-Identifier: GPL-2.0-only
> =C2=A0config DRM_XE
> =C2=A0	tristate "Intel Xe2 Graphics"
> -	depends on DRM && PCI
> +	depends on DRM && PCI && (PAGE_SIZE_4KB || BROKEN)
> =C2=A0	depends on KUNIT || !KUNIT
> =C2=A0	depends on INTEL_VSEC || !INTEL_VSEC
> =C2=A0	depends on X86_PLATFORM_DEVICES || !(X86 && ACPI)

