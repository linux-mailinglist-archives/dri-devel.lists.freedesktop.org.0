Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 350435B581A
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 12:22:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1A9810E36C;
	Mon, 12 Sep 2022 10:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9879510E36B;
 Mon, 12 Sep 2022 10:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662978115; x=1694514115;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rbitQRJ6jDxMHRoRFNvyOiXLWpjVICziWAEq1TuoVCI=;
 b=DcfxBLIOuA7r/xVAyooqodHMY+NEg4Gay5hTL+I4euhA62hjw4U3iZa/
 mDckqgaQUMYxgzQy1LyjumHBYmUOKqvzmLg++rFRKofe+qcc8TaDhMhuV
 x4XWsC4yaOolVibTutwO3LaAzBk0Vq13W2YxF8iaRvyLZhjJTIMyicwBz
 SppWoApEIwUAiltmB7oJC5qg1wLFsbSuWh1E3Aju3Op4gRq8sMX5NCgGS
 MXAtQozUUM42z5l/myn2wN09JTUR0KoWdylDVhGtdC51p/ShqRG3g+LjX
 45PLo8YdO9ey4yKdgjqLs2XUXjBVSQJpnXtuBXA4SbM8KWnPfGZlcXfeW A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10467"; a="361783524"
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="361783524"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 03:21:54 -0700
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="684376357"
Received: from mtabaka-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.57.56])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 03:21:50 -0700
Date: Mon, 12 Sep 2022 12:21:42 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH v10 3/9] compiler_types.h: Add assert_type to catch type
 mis-match while compiling
Message-ID: <Yx8INguMNIU4RIGY@alfio.lan>
References: <20220909105913.752049-1-gwan-gyeong.mun@intel.com>
 <20220909105913.752049-4-gwan-gyeong.mun@intel.com>
 <Yx3A16ZElKOeJr0o@alfio.lan>
 <579b8532-7687-4620-d146-c8ffbbc14097@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <579b8532-7687-4620-d146-c8ffbbc14097@rasmusvillemoes.dk>
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
Cc: thomas.hellstrom@linux.intel.com, mauro.chehab@linux.intel.com,
 chris@chris-wilson.co.uk, keescook@chromium.org, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, ndesaulniers@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, andrzej.hajda@intel.com,
 dlatypov@google.com, matthew.auld@intel.com,
 Andi Shyti <andi.shyti@linux.intel.com>, airlied@redhat.com,
 mchehab@kernel.org, vitor@massaru.org, nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rasmus,

Thanks for dropping in,

[...]

> >> + * @t1: data type or variable
> >> + * @t2: data type or variable
> >> + *
> >> + * The first and second arguments can be data types or variables or mixed (the
> >> + * first argument is the data type and the second argument is variable or vice
> >> + * versa). It determines whether the first argument's data type and the second
> >> + * argument's data type are the same while compiling, and it breaks compile if
> >> + * the two types are not the same.
> >> + * See also assert_typable().
> >> + */
> >> +#define assert_type(t1, t2) _Static_assert(__same_type(t1, t2))
> > 
> > In C11 _Static_assert is defined as:
> > 
> >   _Static_assert ( constant-expression , string-literal ) ;
> > 
> > While
> > 
> >   _Static_assert ( constant-expression ) ;
> > 
> > is defined in C17 along with the previous. I think you should add
> > the error message as a 'string-literal'.
> 
> See how static_assert() is defined in linux/build_bug.h, and let's avoid
> using _Static_assert directly. So this should IMO just be

yes, our definition of static_assert() is against the C11
specification, which should define it as:

  #define static_assert _Static_assert

this doesn't make me a big fan of it. But, because it's widely
used, I think it should be used here as well, as you are
suggesting.

> #define assert_same_type(t1, t2) static_assert(__same_type(t1, t2))
> 
> (including the naming of the macro; I don't think "assert_type" is a
> good name). No need to add an explicit string literal, the name of the
> macro and the constant expression itself are plenty to explain what is
> being asserted (with the latter being the reason the string was made
> optional).

The string literal would be "__same_type(t1, t2)", right? I would
still use something more explicit... up to Gwan-gyeong.

Thanks,
Andi
