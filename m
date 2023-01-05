Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DABAA65ED13
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 14:28:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99DC210E72D;
	Thu,  5 Jan 2023 13:28:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E584610E72A;
 Thu,  5 Jan 2023 13:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672925293; x=1704461293;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=NqDsGrNdPAmshIqIoolwpW2s1mJyJWpHdNYgy5IUVFI=;
 b=IUnKF7bK7A3+PSVxJqhDZVu2JPADYpIkag2c/5dn5555NCTKDqlFFylR
 D/2qQHx+ANdH//mhkvLmoKKW+kQWWuNCfPg7SWuRSPO5IBnQgTma+2wzi
 ooaXTcro7PlUjkca+QWVwBQc+8uL4aSjP5v9L0i1JU8uF+Y0IG9+bpDpC
 jojHGhz8bAhXVVL3oqK9LqbxMGgfNH3oxiSiwW/KafanYNowG/EtS0KSl
 3pdNgLum5dnwpOF7N3BbysdaE7jA1Jah1preEGPnlzEBKqEzMDmj60W+z
 GsLkEabTQ5bvwZO6e7syMgfyf/OaDLOxIs+ba4GnF/qDQxy5e8O1/OKNl A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="322271816"
X-IronPort-AV: E=Sophos;i="5.96,303,1665471600"; d="scan'208";a="322271816"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2023 05:28:13 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="686107107"
X-IronPort-AV: E=Sophos;i="5.96,303,1665471600"; d="scan'208";a="686107107"
Received: from swathish-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.10.152])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2023 05:28:10 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Laight <David.Laight@aculab.com>
Subject: Re: [Intel-gfx] [PATCH 1/5] linux/minmax.h: add non-atomic version
 of xchg
In-Reply-To: <Y7bK8drngH/NIlOa@phenom.ffwll.local>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20221209154843.4162814-1-andrzej.hajda@intel.com>
 <f58ab17e5c6c4a4e8b0d687b44618c51@AcuMS.aculab.com>
 <Y7bK8drngH/NIlOa@phenom.ffwll.local>
Date: Thu, 05 Jan 2023 15:28:07 +0200
Message-ID: <875ydlw1p4.fsf@intel.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 'Andrzej Hajda' <andrzej.hajda@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 05 Jan 2023, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Mon, Dec 12, 2022 at 09:38:12AM +0000, David Laight wrote:
>> From: Andrzej Hajda <andrzej.hajda@intel.com>
>> > Sent: 09 December 2022 15:49
>> > 
>> > The pattern of setting variable with new value and returning old
>> > one is very common in kernel. Usually atomicity of the operation
>> > is not required, so xchg seems to be suboptimal and confusing in
>> > such cases. Since name xchg is already in use and __xchg is used
>> > in architecture code, proposition is to name the macro exchange.
>> 
>> Dunno, if it is non-atomic then two separate assignment statements
>> is decidedly more obvious and needs less brain cells to process.
>> Otherwise someone will assume 'something clever' is going on
>> and the operation is atomic.
>
> Yes, this also my take. The i915 code that uses this to excess is decidely
> unreadable imo, and the macro should simply be replaced by open-coded
> versions.
>
> Not moved into shared headers where even more people can play funny games
> with it.

My stand in i915 has been that the local fetch_and_zero() needs to
go. Either replaced by a common helper in core kernel headers, or open
coded, I personally don't care, but the local version can't stay.

My rationale has been that fetch_and_zero() looks atomic and looks like
it comes from shared headers, but it's neither. It's deceptive. It
started small and harmless, but things like this just proliferate and
get copy-pasted all over the place.

So here we are, with Andrzej looking to add the common helper. And the
same concerns crop up. What should it be called to make it clear that
it's not atomic? Is that possible?


BR,
Jani.



>
> I think swap() is a standard idiom in C, this one here just isn't.
> -Daniel

-- 
Jani Nikula, Intel Open Source Graphics Center
