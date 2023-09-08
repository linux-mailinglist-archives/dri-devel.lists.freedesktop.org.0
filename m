Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B01CA798453
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 10:44:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A438710E889;
	Fri,  8 Sep 2023 08:44:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFCF010E886;
 Fri,  8 Sep 2023 08:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694162661; x=1725698661;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:cc:to:from:subject:message-id:date;
 bh=DFy2CJyWTkwxSLc57OFF4ERDD5ID24EAX+KNJtKtgPo=;
 b=KcqqA8/K1Rwehuzcd2U9ulEG2/y/c+2oKCYAQzYjGv9gWOXX4A4Nlmuf
 2S0jBvlvO8ah48t3I9+n/buAjQcdn2lY4eGY2qgKA66xX2BklkGgwLsdQ
 OW4CsFupIz3n5m7pSwlzt7Uxv2KOF39Z757vDQkF54KA3Ft0XRlEEdeLp
 bP9oDLRJYaN/gl5J/laID6cwFFvqvhSq8DMxcuiAt+jQY5IP0rVvppu3L
 jCvq4irGRKXtTaGeERrqU6Me2aRepJ9Izq2Chux20ImkE8/Fxd4AD2BeW
 TgcG3+lnqKlO8FEbBVKuV3GGBtdWW6sIU65atQs6Xya701S1Yk14XmopM A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="381409740"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; d="scan'208";a="381409740"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 01:44:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="692186514"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; d="scan'208";a="692186514"
Received: from endaclin-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.24.175])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 01:44:19 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230822162136.25895-1-thomas.hellstrom@linux.intel.com>
References: <20230822162136.25895-1-thomas.hellstrom@linux.intel.com>
To: Thomas Hellström <thomas.hellstrom@linux.intel.com>, intel-xe@lists.freedesktop.org
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH v2 0/4] drm/xe: Support optional pinning of userptr pages
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <169416265636.18944.11104812487971466589@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Fri, 08 Sep 2023 11:44:16 +0300
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
Cc: Matthew Brost <matthew.brost@intel.com>, Thomas Hellström <thomas.hellstrom@linux.intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Thomas Hellstr=C3=B6m (2023-08-22 19:21:32)
> This series adds a flag at VM_BIND time to pin the memory backing a VMA.
> Initially this is needed for long-running workloads on hardware that
> neither support mid-thread preemption nor pagefaults, since without it
> the userptr MMU notifier will wait for preemption until preemption times
> out.

From terminology perspective we have a lot of folks in the userspace and
kernel developers who have come to understand pinned memory as something
that is locked in place while a dependent context is active on the
hardware. And that has been related to lack of page-fault support.

As here the plan is to go a step forward and never move that memory, would
it be worthy to call such memory LOCKED (would also align with CPU side).
And per my understanding the aspiration is to keep supporting locking
memory in place (within sysadmin configured limits) even if page-faults
will become de-facto usage.

So, in short, should we do s/pinned/locked/, to avoid terminology
confusion between new and old drivers which userspace may have to deal
from same codebase?

Regards, Joonas

>=20
> Moving forward this could be supported also for bo-backed VMAs given
> a proper accounting takes place. A sysadmin could then optionally configu=
re
> a system to be optimized for dealing with a single GPU application
> at a time.
>=20
> The series will be followed up with an igt series to exercise the uAPI.
>=20
> v2:
> - Address review comments by Matthew Brost.
>=20
> Thomas Hellstr=C3=B6m (4):
>   drm/xe/vm: Use onion unwind for xe_vma_userptr_pin_pages()
>   drm/xe/vm: Implement userptr page pinning
>   drm/xe/vm: Perform accounting of userptr pinned pages
>   drm/xe/uapi: Support pinning of userptr vmas
>=20
>  drivers/gpu/drm/xe/xe_vm.c       | 194 ++++++++++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_vm.h       |   9 ++
>  drivers/gpu/drm/xe/xe_vm_types.h |  14 +++
>  include/uapi/drm/xe_drm.h        |  18 +++
>  4 files changed, 190 insertions(+), 45 deletions(-)
>=20
> --=20
> 2.41.0
>=20
