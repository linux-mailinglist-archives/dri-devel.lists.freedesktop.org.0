Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE44874C08
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 11:12:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F9410F36D;
	Thu,  7 Mar 2024 10:12:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OahBmm1s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B4510F36D
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 10:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709806372; x=1741342372;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=f6wBBysqfQOEtG+YY8fSdpRVawUGnNfgV70+vyePSr0=;
 b=OahBmm1s9ovmWIYwjdEQgcVbyV//yTc63m9hRePuNIGZapzpFNW5QejJ
 ZbZfeX3ZadFISX33fHUMbp5rCGeJIPERQ6eI/9BfhNOSSn9TGwEs3xcoR
 7eJSpKJdcnM1Ej5adnUMMGaHFcWzb0Jhr1tloYuGCpCNt3EoRDmMxnt95
 RMWtmdqg6fLGy8AsTI996kfWF86s2V74EGXNwWzeOt+5kbsiEjZUVC9t0
 YSKJSg5yuqFdyXxBPLDF/oFgONpRDPXbqvqltIWUjajvKcSsKpfhSqxJV
 KvL/R8MgRfo5eDsKLclYlMUUyDwg6UATuLNBlIWQelErv63W27dK42cu/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="8285945"
X-IronPort-AV: E=Sophos;i="6.06,211,1705392000"; 
   d="scan'208";a="8285945"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 02:12:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,211,1705392000"; d="scan'208";a="10134733"
Received: from tcavalax-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.33.241])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 02:12:48 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: pgtable: Add missing #include <asm/page.h>
In-Reply-To: <ba359be013f379ff10f3afcea13e2f78dd9717be.1709804021.git.geert@linux-m68k.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <ba359be013f379ff10f3afcea13e2f78dd9717be.1709804021.git.geert@linux-m68k.org>
Date: Thu, 07 Mar 2024 12:12:45 +0200
Message-ID: <8734t2xsde.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, 07 Mar 2024, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> When just including <linux/pgtable.h>:
>
>     include/asm-generic/pgtable-nop4d.h:9:18: error: unknown type name =
=E2=80=98pgd_t=E2=80=99
> 	9 | typedef struct { pgd_t pgd; } p4d_t;
> 	  |                  ^~~~~
>
> Make <asm/pgtable.h> self-contained by including <asm/page.h>.
>
> Reported-by: Jani Nikula <jani.nikula@intel.com>
> Closes: https://lore.kernel.org/r/878r2uxwha.fsf@intel.com
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> Jani: Feel free to pick this up as a dependency.
> Else I will queue this in the m68k tree for v6.10.

Thanks, I'd like to pick this up as a dependency, so I can proceed with
my series. It'll also be queued for v6.10 via the drm subsystem.

BR,
Jani.


>
>  arch/m68k/include/asm/pgtable.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/m68k/include/asm/pgtable.h b/arch/m68k/include/asm/pgta=
ble.h
> index 27525c6a12fd0c7f..49fcfd7348600594 100644
> --- a/arch/m68k/include/asm/pgtable.h
> +++ b/arch/m68k/include/asm/pgtable.h
> @@ -2,6 +2,8 @@
>  #ifndef __M68K_PGTABLE_H
>  #define __M68K_PGTABLE_H
>=20=20
> +#include <asm/page.h>
> +
>  #ifdef __uClinux__
>  #include <asm/pgtable_no.h>
>  #else

--=20
Jani Nikula, Intel
