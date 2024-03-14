Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8CD87BB39
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 11:28:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7600610FA2A;
	Thu, 14 Mar 2024 10:28:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mnIvgLPJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F43C10FA2A
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 10:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710412086; x=1741948086;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=3AdoF7PXMMauR/QLjhj/rHqOnywAffnOLLq68/SM3B0=;
 b=mnIvgLPJV+zhEmWst8jDhrxDDJX2meNtxfEVqsOhl3pGEtQqE3nOSgM9
 iTeovITun/DZHEt0osEEIpVGJfO+U/Psw+KZ6X+3FdtSIuq7pSDaFglwn
 VHH5yz6fyU8Y0uyPFx4sCP+XHOnscIrhTKMxFQcpWg+Jk5MooLoSMMYHA
 MVXKn7WiVMKnO7D2D4ebSmfFoaDFW5pXjYxIfjkXsJ1xWANcEHxpoYCDh
 /Z6RgfaFsI/QSNI2AWMFxAehsR5Eah6XpSp+iKg1Zp5HH/P32zFBBi5yU
 Y+iapoJf7xsTBBvKD3XjdX6ALkMCyLhSIXg/FQCvwUDE0LVxanAr7Kui1 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5079857"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="5079857"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 03:28:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="12177178"
Received: from rboza-mobl.ger.corp.intel.com (HELO localhost) ([10.252.53.139])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 03:28:03 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: pgtable: Add missing #include <asm/page.h>
In-Reply-To: <8734t2xsde.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <ba359be013f379ff10f3afcea13e2f78dd9717be.1709804021.git.geert@linux-m68k.org>
 <8734t2xsde.fsf@intel.com>
Date: Thu, 14 Mar 2024 12:28:00 +0200
Message-ID: <87ttl9qf9r.fsf@intel.com>
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

On Thu, 07 Mar 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> On Thu, 07 Mar 2024, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> When just including <linux/pgtable.h>:
>>
>>     include/asm-generic/pgtable-nop4d.h:9:18: error: unknown type name =
=E2=80=98pgd_t=E2=80=99
>> 	9 | typedef struct { pgd_t pgd; } p4d_t;
>> 	  |                  ^~~~~
>>
>> Make <asm/pgtable.h> self-contained by including <asm/page.h>.
>>
>> Reported-by: Jani Nikula <jani.nikula@intel.com>
>> Closes: https://lore.kernel.org/r/878r2uxwha.fsf@intel.com
>> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> ---
>> Jani: Feel free to pick this up as a dependency.
>> Else I will queue this in the m68k tree for v6.10.
>
> Thanks, I'd like to pick this up as a dependency, so I can proceed with
> my series. It'll also be queued for v6.10 via the drm subsystem.

Replying here too, I've merged this via drm-misc-next as d1815393cac0
("m68k: pgtable: Add missing #include <asm/page.h>").

Thanks for the patch!

BR,
Jani.


--=20
Jani Nikula, Intel
