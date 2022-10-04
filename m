Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E8D5F43D6
	for <lists+dri-devel@lfdr.de>; Tue,  4 Oct 2022 15:01:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDA1B10E641;
	Tue,  4 Oct 2022 13:01:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09BE010E641;
 Tue,  4 Oct 2022 13:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664888464; x=1696424464;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ac5jz+WTfaQgMU3oD67EvIWpMpLca/pxcqSzKyYHlbE=;
 b=Kl/ZHDBo4TB+xJ1vCyANdIAP6o9dmpj8I//jIXNAC31fCncNu7ZcXJpX
 wS4MChZQOlIrwhFW/l8nANA1b+LMLQ8/AE8bI4BMF/5EQD5RRaNvih1PC
 1ooMeVbiviAjOZU9tCW7fNyfhz7e8n5jMM3TzbCkZVXql3wH8plrBYJnW
 bQXktYmtg0Q3M9XCdLM4Nxl7HvHlEsB1SpM7zJNcSmByO+UYUfiXYejxJ
 RXB0CQH+Az3cvkwzg7gcXJrgeSI+huqdi31ICE9eU98QSCP8PnvsejbRj
 pgeo0e2aAAgMG5RNUiM4/BoLgRk2F95+SODNMYDywllrps3V/866Y/tWR A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="304445523"
X-IronPort-AV: E=Sophos;i="5.95,157,1661842800"; d="scan'208";a="304445523"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2022 06:01:02 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="619095005"
X-IronPort-AV: E=Sophos;i="5.95,157,1661842800"; d="scan'208";a="619095005"
Received: from pvarla-mobl4.gar.corp.intel.com (HELO localhost)
 ([10.252.39.104])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2022 06:01:00 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2 12/14] drm/i915: Define multicast registers as a new
 type
In-Reply-To: <87czb7u4qc.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20221001004550.3031431-1-matthew.d.roper@intel.com>
 <20221001004550.3031431-13-matthew.d.roper@intel.com>
 <87czb7u4qc.fsf@intel.com>
Date: Tue, 04 Oct 2022 16:00:57 +0300
Message-ID: <87a66bu4ja.fsf@intel.com>
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
Cc: ravi.kumar.vodapalli@intel.com, balasubramani.vivekanandan@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 04 Oct 2022, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Fri, 30 Sep 2022, Matt Roper <matthew.d.roper@intel.com> wrote:
>> diff --git a/drivers/gpu/drm/i915/i915_reg_defs.h b/drivers/gpu/drm/i915/i915_reg_defs.h
>> index 8f486f77609f..e823869b9afd 100644
>> --- a/drivers/gpu/drm/i915/i915_reg_defs.h
>> +++ b/drivers/gpu/drm/i915/i915_reg_defs.h
>> @@ -104,22 +104,16 @@ typedef struct {
>>  
>>  #define _MMIO(r) ((const i915_reg_t){ .reg = (r) })
>>  
>> -#define INVALID_MMIO_REG _MMIO(0)
>> -
>> -static __always_inline u32 i915_mmio_reg_offset(i915_reg_t reg)
>> -{
>> -	return reg.reg;
>> -}
>> +typedef struct {
>> +	u32 reg;
>> +} i915_mcr_reg_t;
>>  
>> -static inline bool i915_mmio_reg_equal(i915_reg_t a, i915_reg_t b)
>> -{
>> -	return i915_mmio_reg_offset(a) == i915_mmio_reg_offset(b);
>> -}
>> +#define INVALID_MMIO_REG _MMIO(0)
>>  
>> -static inline bool i915_mmio_reg_valid(i915_reg_t reg)
>> -{
>> -	return !i915_mmio_reg_equal(reg, INVALID_MMIO_REG);
>> -}
>> +/* These macros can be used on either i915_reg_t or i915_mcr_reg_t */
>> +#define i915_mmio_reg_offset(r) (r.reg)
>> +#define i915_mmio_reg_equal(a, b) (i915_mmio_reg_offset(a) == i915_mmio_reg_offset(b))
>> +#define i915_mmio_reg_valid(r) (!i915_mmio_reg_equal(r, INVALID_MMIO_REG))
>>  
>
> I don't really like losing the type safety here. The whole and only
> purpose of typedeffing i915_reg_t as a struct instead of just u32 was
> the strict type safety.

PS. Changes like this should really be highlighted better, in the commit
subject and title. Now it feels like it's hidden within a big commit
within a big series, without even mentioning it in the commit message.


BR,
Jani.


>
> BR,
> Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
