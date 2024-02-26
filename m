Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF9C8670E0
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 11:27:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B45110E675;
	Mon, 26 Feb 2024 10:27:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SLM+liUb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 086D910E675
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 10:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708943250; x=1740479250;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=5L9QNoh0f+vRtiDXMwpI8NJgAp36BLuI/7gvCVOlhwg=;
 b=SLM+liUbOTfMOALNwe8Lba5XSWMgMzJPJIXsWWFwHNTC/2ZkT4MzmZKJ
 4hCzomsahoob/7WtRLTlbsk9nRh533Em6kH+OEDA/EBocCH5k41CKZLKP
 VgzwPPyaHui480IxgbKeVpe+T2F8+bGP/Qky5kMVRF07JXiI+SSWgnfl+
 uB4q2Z8QIwyZxQeNClV0h5jQ5JGsdTp6w1VaU6UbN9LbkMqIRQLfxtdKz
 VmCSYcz/rws2eioqUyNlORq1NPbO7bJtx1eMwCk2SDDwXjzjhgcbWvlIQ
 v+cILIeekRoR8D2aSV+j0DU1SB7HtvyNRpjw+Ja3LNI3KzNGKXBzqtBxC A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="3060931"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="3060931"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 02:27:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; d="scan'208";a="37629455"
Received: from hibeid-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.46.254])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 02:27:24 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: David Laight <David.Laight@ACULAB.COM>, "'linux-kernel@vger.kernel.org'"
 <linux-kernel@vger.kernel.org>, 'Linus
 Torvalds' <torvalds@linux-foundation.org>, 'Netdev'
 <netdev@vger.kernel.org>, "'dri-devel@lists.freedesktop.org'"
 <dri-devel@lists.freedesktop.org>
Cc: 'Jens Axboe' <axboe@kernel.dk>, "'Matthew Wilcox (Oracle)'"
 <willy@infradead.org>, 'Christoph Hellwig' <hch@infradead.org>,
 "'linux-btrfs@vger.kernel.org'" <linux-btrfs@vger.kernel.org>, 'Andrew
 Morton' <akpm@linux-foundation.org>, 'Andy Shevchenko'
 <andriy.shevchenko@linux.intel.com>, "'David S . Miller'"
 <davem@davemloft.net>, 'Dan Carpenter' <dan.carpenter@linaro.org>, Rasmus
 Villemoes <linux@rasmusvillemoes.dk>
Subject: RE: [PATCH next v2 02/11] minmax: Use _Static_assert() instead of
 static_assert()
In-Reply-To: <824b0f70413d4570bcc97b39aad81a93@AcuMS.aculab.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <0fff52305e584036a777f440b5f474da@AcuMS.aculab.com>
 <8059bc04da1a45bc810ac339a1129a4c@AcuMS.aculab.com>
 <87v86bo9qi.fsf@intel.com>
 <824b0f70413d4570bcc97b39aad81a93@AcuMS.aculab.com>
Date: Mon, 26 Feb 2024 12:27:22 +0200
Message-ID: <87sf1fo705.fsf@intel.com>
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

On Mon, 26 Feb 2024, David Laight <David.Laight@ACULAB.COM> wrote:
> From: Jani Nikula
>> Sent: 26 February 2024 09:28
>> 
>> On Sun, 25 Feb 2024, David Laight <David.Laight@ACULAB.COM> wrote:
>> > The wrapper just adds two more lines of error output when the test fails.
>> 
>> There are only a handful of places in kernel code that use
>> _Static_assert() directly. Nearly 900 instances of static_assert().
>
> How many of those supply an error message?

At a glance, not many.

>> Are we now saying it's fine to use _Static_assert() directly all over
>> the place? People will copy-paste and cargo cult.
>
> Is that actually a problem?

I don't know. I'm asking.

Usually when we have compiler wrappers, they're meant to be used instead
of the thing being wrapped.

This series deviates from that, so it would seem to fair to mention it
slightly more verbosely than just stating what's being done.

> The wrapper allows the error message to be omitted and substitutes
> the text of the conditional.
> But it isn't 'free'.
> As well as slightly slowing down the compilation, the error messages
> from the compiler get more difficult to interpret.
>
> Most of the static_assert() will probably never generate an error.
> But the ones in min()/max() will so it is best to make them as
> readable as possible.
> (Don't even look as the mess clang makes....)

I'm not arguing any of this. :)


BR,
Jani.


-- 
Jani Nikula, Intel
