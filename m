Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C02C63456A
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 21:12:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7752210E46A;
	Tue, 22 Nov 2022 20:12:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3572F10E46C;
 Tue, 22 Nov 2022 20:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669147921; x=1700683921;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=L90c8vTaSWqvMcHm8G3kg6qbkA0FPZar+FTiF/p/2Vw=;
 b=Mk+PjQThjy7L1B4sI7Z4ub79fHUtvIW8UH+DT7BWLzprWSBjZ8R2y6dg
 eWtqHn6FpG0f1y2fnfM1PuQWvoxq2bBd/QUEkL4qvAD1ZBOH8etwcU08a
 i1bafv4UhdTrQzf3QfxwGZ0v3TAHK0tmkWSy67tUjeai8m4z59li2GxNA
 8dHdezW9yy+yM5lMGTNY0OQMEZ2l2+MTKNUM5aq1ktWKEUkLkPmFRfY1y
 B9CKE+4ckHM7ppNxpncJiznrfaUmiTTkPlVU+Cbtmu0ry9QfUd/2mCit6
 RFRQYzccDBCuvzcXfGvpdqr9innUGVm6Od9L+ppuoPgvmPdXLdbIjIteu g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="301459916"
X-IronPort-AV: E=Sophos;i="5.96,185,1665471600"; d="scan'208";a="301459916"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 12:12:00 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="672609133"
X-IronPort-AV: E=Sophos;i="5.96,185,1665471600"; d="scan'208";a="672609133"
Received: from sfflynn-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.18.151])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 12:11:58 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 1/6] drm/i915/uc: Introduce GSC FW
In-Reply-To: <e27a9356-e09b-ed0d-8824-91b8dacfc945@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20221121231617.1110329-1-daniele.ceraolospurio@intel.com>
 <20221121231617.1110329-2-daniele.ceraolospurio@intel.com>
 <87fsebz7h9.fsf@intel.com>
 <e27a9356-e09b-ed0d-8824-91b8dacfc945@intel.com>
Date: Tue, 22 Nov 2022 22:11:56 +0200
Message-ID: <87v8n6wxyr.fsf@intel.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 22 Nov 2022, "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com> wrote:
> On 11/22/2022 1:03 AM, Jani Nikula wrote:
>> On Mon, 21 Nov 2022, Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> wrote:
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.h b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
>>> index a8f38c2c60e2..5d0f1bcc381e 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.h
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
>>> @@ -6,6 +6,7 @@
>>>   #ifndef _INTEL_UC_H_
>>>   #define _INTEL_UC_H_
>>>   
>>> +#include "intel_gsc_uc.h"
>> And thus intel_gsc_uc.h becomes another file that causes the entire
>> driver to be rebuilt when modified.
>>
>> *sad trombone*
>
> I just followed the same pattern as what is done for GuC and HuC files. 
> What's the recommendation here? Should I split out gsc_uc_types.h from 
> gsc_uc.h ?

Sorry for not being clear, I'm not insisting you do anything at this
time.

But it is something that needs to be refactored eventually.

As an anecdotal data point: I just scripted all the #include
dependencies across all the files in the driver into a digraph and had
graphviz turn it into svg, and on my 80 cm wide 4k screen zoomed out as
far as Firefox can, it's still 15 screenfuls side by side. ;D

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
