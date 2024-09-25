Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3BD9857BC
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 13:14:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7366C10E06C;
	Wed, 25 Sep 2024 11:13:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EBGXai/l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F2510E008;
 Wed, 25 Sep 2024 11:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727262838; x=1758798838;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=qXXwU+nn92HIhU1bX7zw2cPQ2WxUTXkw21Qdm+C43EA=;
 b=EBGXai/lgPKXyJvzo/bIGTHH+gwld4GQO5VS96NbaWmMNcM0lY/Ue17j
 HlLdPUz80GAZdkG3AKTRFlCS4Z8oDjFPFQ7a+nL9GJjfzEJdWEnd2Odrt
 KHxgrkVGbwBviXJA34n1A8X8hnEA78fzHe+c9bx0rtgOkGV5DfnngN05D
 zVXJAgkkfTU6tURtNNBFjZqHCmT+BbHNYk5/IJRSMbWU4YBxFSUEYcV4Q
 iwSZkp5ewXmp6Ryr4D/ldAAgUWB9vmJhPONvjaoiGokkXoZawgltZfpug
 D0q8fw11qhEmFfnGupMlT22FMylgUQSVxTHamNawhVUBC7h9ri1I3R7Qq g==;
X-CSE-ConnectionGUID: 6IY7OXjLRb+VfTMlk+2RPw==
X-CSE-MsgGUID: kXVLPeRlQqizN6Qu9ZbDFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="30095979"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="30095979"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 04:13:57 -0700
X-CSE-ConnectionGUID: XxKyhcodRrCEv0lOxg3uaw==
X-CSE-MsgGUID: bu2W4ha4RMiv427l/Y/bgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="76667890"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.16])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 04:13:56 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCHv3 6/6] drm/i915/histogram: Histogram changes for Display
 20+
In-Reply-To: <IA0PR11MB7307181EA5C6C135E28BD6A9BA692@IA0PR11MB7307.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240919133140.1372663-1-arun.r.murthy@intel.com>
 <20240919133140.1372663-7-arun.r.murthy@intel.com>
 <87y13g2jkq.fsf@intel.com>
 <IA0PR11MB7307181EA5C6C135E28BD6A9BA692@IA0PR11MB7307.namprd11.prod.outlook.com>
Date: Wed, 25 Sep 2024 14:13:52 +0300
Message-ID: <87a5fw2dfz.fsf@intel.com>
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
>> >  .../gpu/drm/i915/display/intel_histogram.c    | 111 +++++++++++++-----
>> >  .../drm/i915/display/intel_histogram_reg.h    |  25 ++++
>> >  2 files changed, 105 insertions(+), 31 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/i915/display/intel_histogram.c
>> > b/drivers/gpu/drm/i915/display/intel_histogram.c
>> > index 6529a59ca6b6..02d5270b0232 100644
>> > --- a/drivers/gpu/drm/i915/display/intel_histogram.c
>> > +++ b/drivers/gpu/drm/i915/display/intel_histogram.c
>> > @@ -29,6 +29,51 @@ struct intel_histogram {
>> >  	u32 bindata[HISTOGRAM_BIN_COUNT];
>> >  };
>> >
>> > +static __inline__ void set_bin_index_0(struct intel_display *display,
>> > +enum pipe pipe)
>>           ^^^^^^^^^^
>> 
>> Why?
>> 
> Sorry, didn't get your question. Is it why "enum pipe pipe"

No, why __inline__? What's the point?

(I tried to underline it with ^^^^^^^^^^ [1].)

You should basically never use inline in .c files, just let the compiler
do its job. And if you do need to use inline in headers, it should be
"inline", not "__inline__". See include/linux/compiler_types.h.

BR,
Jani.


[1] https://lore.kernel.org/all/87y13g2jkq.fsf@intel.com


-- 
Jani Nikula, Intel
