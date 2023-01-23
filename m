Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9916779C0
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 12:01:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC92B10E33C;
	Mon, 23 Jan 2023 11:00:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0773D10E33C;
 Mon, 23 Jan 2023 11:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674471658; x=1706007658;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=tUsSKhPtlE7CEUQIlrKm86czW1aiQu2knDxCEIIPXlQ=;
 b=ZpJKjWp3xiEMM3pDMQK7VcfjHb2JkkYzdxKipt2QucN2tBa2/E9Zvsi1
 WLhbqNp40wUrhCw7bqs4VqtgQLQ2KPo0QcIQhKfLpGQHibPVJZOVDN3kL
 OkcpABSLFURT9ctluCFOVKMC4e1YB662S4UqzIu8aCP6PjWKXjSMrIyG9
 JCqvOSyoNcxLrnTOekYDBCnOudE7Fxyta2DlmNIdTjA2NcvQfXb/4A8FK
 aSJAz+d79GRDL+B7wqbel5YgfVOigBE5aSKLBCHhsIM4PcGS1EdgwIA8P
 JtebMB7wqceYYbOK5I9htPda1LQ3bpCQDC0KDyxDlc5leraTOW+4uifhZ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="313910870"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; d="scan'208";a="313910870"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 03:00:57 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="750274032"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; d="scan'208";a="750274032"
Received: from possola-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.57.125])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 03:00:55 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, "Srivatsa, Anusha"
 <anusha.srivatsa@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 1/8] drm/i915: Add _PICK_EVEN_2RANGES()
In-Reply-To: <20230122012811.zd7ujwbsuwpt7wjw@ldmartin-desk2.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230120193457.3295977-1-lucas.demarchi@intel.com>
 <20230120193457.3295977-2-lucas.demarchi@intel.com>
 <SJ2PR11MB7715CD391A024B61AA4E2323F8CA9@SJ2PR11MB7715.namprd11.prod.outlook.com>
 <20230122012811.zd7ujwbsuwpt7wjw@ldmartin-desk2.lan>
Date: Mon, 23 Jan 2023 13:00:53 +0200
Message-ID: <87cz758qhm.fsf@intel.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 21 Jan 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Fri, Jan 20, 2023 at 10:14:19PM -0800, Anusha Srivatsa wrote:
>>
>>
>>> -----Original Message-----
>>> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Lucas
>>> De Marchi
>>> Sent: Friday, January 20, 2023 11:35 AM
>>> To: intel-gfx@lists.freedesktop.org
>>> Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; dri-
>>> devel@lists.freedesktop.org
>>> Subject: [Intel-gfx] [PATCH v2 1/8] drm/i915: Add _PICK_EVEN_2RANGES()
>>>
>>> It's a constant pattern in the driver to need to use 2 ranges of MMIOs based on
>>> port, phy, pll, etc. When that happens, instead of using _PICK_EVEN(), _PICK()
>>> needs to be used.  Using _PICK() is discouraged due to some reasons like:
>>>
>>> 1) It increases the code size since the array is declared
>>>    in each call site
>>> 2) Developers need to be careful not to incur an
>>>    out-of-bounds array access
>>> 3) Developers need to be careful that the indexes match the
>>>    table. For that it may be that the table needs to contain
>>>    holes, making (1) even worse.
>>>
>>> Add a variant of _PICK_EVEN() that works with 2 ranges and selects which one
>>> to use depending on the index value.
>>>
>>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>> ---
>>>  drivers/gpu/drm/i915/i915_reg_defs.h | 28 ++++++++++++++++++++++++++++
>>>  1 file changed, 28 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/i915/i915_reg_defs.h
>>> b/drivers/gpu/drm/i915/i915_reg_defs.h
>>> index be43580a6979..b7ec87464d69 100644
>>> --- a/drivers/gpu/drm/i915/i915_reg_defs.h
>>> +++ b/drivers/gpu/drm/i915/i915_reg_defs.h
>>> @@ -119,6 +119,34 @@
>>>   */
>>>  #define _PICK_EVEN(__index, __a, __b) ((__a) + (__index) * ((__b) - (__a)))
>>>
>>> +/*
>>> + * Like _PICK_EVEN(), but supports 2 ranges of evenly spaced address offsets.
>>> + * The first range is used for indexes below @__c_index, and the second
>>> + * range is used for anything above it. Example::
>>> + *
>>> + * #define _FOO_A			0xf000
>>> + * #define _FOO_B			0xf004
>>> + * #define _FOO_C			0xf008
>>> + * #define _SUPER_FOO_A			0xa000
>>> + * #define _SUPER_FOO_B			0xa100
>>> + * #define FOO(x)			_MMIO(_PICK_EVEN_RANGES(x, 3,
>>> 		\
>>> + *					      _FOO_A, _FOO_B,
>>> 	\
>>> + *					      _SUPER_FOO_A, _SUPER_FOO_B))
>>> + *
>>> + * This expands to:
>>> + *	0: 0xf000,
>>> + *	1: 0xf004,
>>> + *	2: 0xf008,
>>> + *	3: 0xa100,
>>You mean 3:0xa000
>
> doesn't really matter. This is an example of register addresses. They
> don't need to start from 0, it's whatever the hw gives us.

I think the point is that the example is inconsistent between
_SUPER_FOO_A and "3: 0xa100".

BR,
Jani.

>
> Lucas De Marchi
>
>>
>>> + *	4: 0xa200,
>>4:0xa100
>>
>>> + *	5: 0xa300,
>>5:0xa200
>>
>>Anusha
>>> + *	...
>>> + */
>>> +#define _PICK_EVEN_2RANGES(__index, __c_index, __a, __b, __c, __d)
>>> 	\
>>> +	(BUILD_BUG_ON_ZERO(!__is_constexpr(__c_index)) +
>>> 	\
>>> +	 ((__index) < (__c_index) ? _PICK_EVEN(__index, __a, __b) :
>>> 	\
>>> +				   _PICK_EVEN((__index) - (__c_index), __c,
>>> __d)))
>>> +
>>>  /*
>>>   * Given the arbitrary numbers in varargs, pick the 0-based __index'th number.
>>>   *
>>> --
>>> 2.39.0
>>

-- 
Jani Nikula, Intel Open Source Graphics Center
