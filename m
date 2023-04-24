Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE626ECA79
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 12:38:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FACB10E485;
	Mon, 24 Apr 2023 10:38:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6010A10E0D5;
 Mon, 24 Apr 2023 10:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682332719; x=1713868719;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=LBcHtvjbLuQc4sW5ymzxmOrunk1btb1j+VVEWjKXz/E=;
 b=dgIWWIqYrhcjfVsCfGu2Wa7PM88pTb59yPJSnPBo3OUpGFNKOzZMDKwQ
 aVKY+v3PVl4PysfgoE3FcY/xL6+ovqT3/v8wcb1OUcXD3cfVvcAhqXz8h
 Rdn8Wrrn23W+3FI4Y6AayqV4L1+1qmFz0qIHyZ56iMbhuVFXAaoO/SPbf
 Uh1twp5s4B1CdaiJMPBwNKRHqs/KwaucWjRySa2Gltqw4D/YcvPo1X3xw
 xmAmjg/aFzVpl8+MtEpWPyP5GMzlaoKstHvTGFsbL2hNBG4p0MLrism/A
 KN/fEvVsQpynzPpic4AXn8ES62oX67FstgXYn2vV8w99q3kBWWvGJquV7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="411692812"
X-IronPort-AV: E=Sophos;i="5.99,222,1677571200"; d="scan'208";a="411692812"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 03:38:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="1022660310"
X-IronPort-AV: E=Sophos;i="5.99,222,1677571200"; d="scan'208";a="1022660310"
Received: from skumarbi-mobl.gar.corp.intel.com (HELO localhost)
 ([10.252.59.198])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 03:38:34 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>, Andi Shyti
 <andi.shyti@linux.intel.com>
Subject: Re: [PATCH 0/2] Use i915 instead of dev_priv
In-Reply-To: <ZER/u/tSEX8mXC7R@ashyti-mobl2.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230421134654.273182-1-andi.shyti@linux.intel.com>
 <ZER/u/tSEX8mXC7R@ashyti-mobl2.lan>
Date: Mon, 24 Apr 2023 13:38:26 +0300
Message-ID: <87sfcp36ql.fsf@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 23 Apr 2023, Andi Shyti <andi.shyti@linux.intel.com> wrote:
> Hi,
>
> On Fri, Apr 21, 2023 at 03:46:52PM +0200, Andi Shyti wrote:
>> Hi,
>> 
>> just another "Friday patch". While reviewing some patches from
>> Tejas I found a bit confusing the use of dev_priv__ inside the
>> for_each_engine(), perhaps it should be moved inside the gt/?
>> 
>> As I was at it I made the /dev_priv/i915/ change which is still
>> harmless. Next in queue is to change the i915_irq.h, which is a
>> bit tricky (but not much) as the "dev_priv" is hardcoded inside
>> some defines.
>> 
>> Andi
>> 
>> Andi Shyti (2):
>>   drm/i915/i915_drv: Use proper parameter naming in for_each_gt()
>>   drm/i915/i915_drv: Use i915 instead of dev_priv insied the file_priv
>>     structure
>> 
>>  drivers/gpu/drm/i915/i915_drv.h | 462 ++++++++++++++++----------------
>>  1 file changed, 231 insertions(+), 231 deletions(-)
>
> Pushed to dmr-intel-gt-next.

That's going to create problems for us for weeks to come. I'm actually
tempted to ask Joonas or Tvrtko to just force push that out of there.

Only use drm-intel-gt-next for stuff that's specifically about gt or
gem, and touches files used by gt or gem only. For everything else, use
drm-intel-next. When in doubt, err on the side of drm-intel-next.

It's not enough that one of the patches changes parameters of
for_each_gt() macro.

We can cross-merge drm-intel-next to drm-intel-gt-next, but we can't
cross-merge drm-intel-gt-next to drm-intel-next. This means the only way
to sync those i915_drv.h changes to drm-intel-next is to have a
drm-intel-gt-next pull request merged to drm-next, and then backmerged
to drm-intel-next. That's not going to happen for several weeks.

Any change aimed at drm-intel-next that conflicts with the i915_drv.h
changes will now be pending on those merges.

BR,
Jani.



>
> Thanks Rodrigo and Andrzej for your review.
>
> Andi

-- 
Jani Nikula, Intel Open Source Graphics Center
