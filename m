Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2947006B6
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 13:25:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D39610E686;
	Fri, 12 May 2023 11:25:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC35B10E686;
 Fri, 12 May 2023 11:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683890726; x=1715426726;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=DLcxuGg90W0qpFb37T2Z/r5Za1skwRRI/1oJiKzq3+Y=;
 b=iuOCP06S3ZDrVCk0w2Oe8o+EIJ85iryjnf1BbFj/VouM8FdMjWJbH/vR
 AUZC1IcIdRWkai4QdMIgDj0Hn9yrup1+IOZMdBStvCmofcoHv+JvjCH2z
 aZIJ0Ge/+vv32+o1mYrZ0RwC14PFoDJVqFy38Rx8RQj0lA79x3+lK66oJ
 GgsxGf28B4bNJ4k1vMgcomrXY7XNKld1NBjvKka85Rodpv5nRTu77oJDH
 1hLl74TnRPHQ2eb8+JhLwYK2r406iV+ySiEa+NL6fJYXGN/diFa5iduW9
 Oh3ufhr2nuNNs3YDPaxcbLVyz2FHxyn5KAA9oFrJLwoQRa7U7ABOWZGqL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="335287280"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="335287280"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 04:25:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="824331254"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="824331254"
Received: from tsavina-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.63.51])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 04:25:21 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH 2/3] linux/bits.h: Add fixed-width GENMASK and BIT macros
In-Reply-To: <ZF4fi5B7PPlgZBOI@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230509051403.2748545-1-lucas.demarchi@intel.com>
 <20230509051403.2748545-3-lucas.demarchi@intel.com>
 <ZF4fi5B7PPlgZBOI@smile.fi.intel.com>
Date: Fri, 12 May 2023 14:25:18 +0300
Message-ID: <87pm75kd0h.fsf@intel.com>
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
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>,
 intel-gfx@lists.freedesktop.org, Kevin Brodsky <kevin.brodsky@arm.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Thomas Gleixner <tglx@linutronix.de>, Masahiro Yamada <masahiroy@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 12 May 2023, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> On Mon, May 08, 2023 at 10:14:02PM -0700, Lucas De Marchi wrote:
>> Add GENMASK_U32(), GENMASK_U16() and GENMASK_U8()  macros to create
>> masks for fixed-width types and also the corresponding BIT_U32(),
>> BIT_U16() and BIT_U8().
>
> Why?

The main reason is that GENMASK() and BIT() size varies for 32/64 bit
builds.


BR,
Jani.

>
>> All of those depend on a new "U" suffix added to the integer constant.
>> Due to naming clashes it's better to call the macro U32. Since C doesn't
>> have a proper suffix for short and char types, the U16 and U18 variants
>> just use U32 with one additional check in the BIT_* macros to make
>> sure the compiler gives an error when the those types overflow.
>> The BIT_U16() and BIT_U8() need the help of GENMASK_INPUT_CHECK(),
>> as otherwise they would allow an invalid bit to be passed. Hence
>> implement them in include/linux/bits.h rather than together with
>> the other BIT* variants.
>
> So, we have _Generic() in case you still wish to implement this.

-- 
Jani Nikula, Intel Open Source Graphics Center
