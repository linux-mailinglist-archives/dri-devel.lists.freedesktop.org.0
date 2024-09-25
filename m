Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8EC985D05
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 14:59:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ACC210E828;
	Wed, 25 Sep 2024 12:59:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BkqXI+D+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE02A10E81C;
 Wed, 25 Sep 2024 12:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727269174; x=1758805174;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=ukY7CUDJcQm2ji+jcXJvMRkB7j7WRneMWjW2U0U90ew=;
 b=BkqXI+D+iLroN/eZ8ZIMk58oH/jmu/6D8DEOnc9o7r/wzUPmlTk/8ae8
 zB/EfrDhfVMN+Dx89Guyi+IZvj9V5RExJ5G/5kLfP6g04DCuyObM4qXzS
 mY7ek/IXH24ryqvErN8ANI0F/0QOljWhJYZE0sMxXtwOnW/+gh+1pM3Tz
 yORYYZpmcDCVxUmFJeXn8Qr8CoH+5+lT+RpYXXcSMvDEO8bKvYvbjubsV
 tTMwSERROSQIgFC8rUyTG5dTWyrg6L8iY0jClYBKcgfE8tsQTkUFmf1yw
 v7zwHCTA9/N5SVP1aixE9rbDSAld/Yn1hn7d5gBsBcpcSZ7sfOi6l+HmB g==;
X-CSE-ConnectionGUID: g2up+xplQMeH4vP5xppw+w==
X-CSE-MsgGUID: bChGwpfgTDOvrmATyKLQ5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="51728764"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="51728764"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 05:59:33 -0700
X-CSE-ConnectionGUID: wsGkcKH0Q/a1HGzD1qBFiw==
X-CSE-MsgGUID: d55hwdYbRxC2M/m+LWCTfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="72073857"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.16])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 05:59:31 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCHv3 6/6] drm/i915/histogram: Histogram changes for Display
 20+
In-Reply-To: <IA0PR11MB730798D926F4304971D16283BA692@IA0PR11MB7307.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240919133140.1372663-1-arun.r.murthy@intel.com>
 <20240919133140.1372663-7-arun.r.murthy@intel.com>
 <87y13g2jkq.fsf@intel.com>
 <IA0PR11MB7307181EA5C6C135E28BD6A9BA692@IA0PR11MB7307.namprd11.prod.outlook.com>
 <87a5fw2dfz.fsf@intel.com>
 <IA0PR11MB730798D926F4304971D16283BA692@IA0PR11MB7307.namprd11.prod.outlook.com>
Date: Wed, 25 Sep 2024 15:59:28 +0300
Message-ID: <877caz3n4f.fsf@intel.com>
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

On Wed, 25 Sep 2024, "Murthy, Arun R" <arun.r.murthy@intel.com> wrote:
>> >> > +static __inline__ void set_bin_index_0(struct intel_display
>> >> > +*display, enum pipe pipe)
>> >>           ^^^^^^^^^^
>> >>
>> >> Why?
>> >>
>> > Sorry, didn't get your question. Is it why "enum pipe pipe"
>> 
>> No, why __inline__? What's the point?
>> 
>> (I tried to underline it with ^^^^^^^^^^ [1].)
>> 
>> You should basically never use inline in .c files, just let the compiler do its job.
>> And if you do need to use inline in headers, it should be "inline", not
>> "__inline__". See include/linux/compiler_types.h.
>> 
> The code within the inline functions is very much small and in order to execute
> that small code with functions involve register usage, hence thought of using
> inline.

It's just that the compiler usually knows better than us what to do, and
will automatically inline them, and much more, with a more clever
granularity.

And on the downside, e.g. gcc does not warn about unused static inlines
in .c files.

> Will remove inline!

Thanks,
Jani.


-- 
Jani Nikula, Intel
