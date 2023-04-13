Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E37D46E1234
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 18:25:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12AED10E48F;
	Thu, 13 Apr 2023 16:25:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 354D110E48F;
 Thu, 13 Apr 2023 16:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681403115; x=1712939115;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=32/cU/ltuS/3Eg16qu/tBXAYEwxwyeiwcyXsc/UYiFI=;
 b=ZxiOzYSbpnpZ0A6YQ7u/I+L/pKcfDGIzBD9H3rTwjG1eAwu0BOuFyI++
 iAh6/2z1vGkcJNUeRBuRwuRXhrfogZQKcWHFQSmiMlu3sM6pK6hFvfjS/
 yOp6mHV1RD+T5ydpE5Zd7xde0f0yxPT0OfEv7wPNGdGPNQuJQKTQhU394
 GPMRT3Qpwm+15+UJa0o4/IYGGFZ80hIm+mHdxLOfX9nYfPCA7oKGcAruo
 toC69VLmoKkzjSQ2J59swpuGCIdWjtI7zM1jPKVeJyPiGI8ARhSlnbEND
 QyT7vluhkghtp9/E7GQK++9sMnHW7qaD/jA1bL4YlT3K74pQVF6znJz8F A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="332972502"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; d="scan'208";a="332972502"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 09:25:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="1019251556"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; d="scan'208";a="1019251556"
Received: from fwillger-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.213.61])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 09:25:11 -0700
Date: Thu, 13 Apr 2023 18:24:44 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>
Subject: Re: [PATCH v2] drm/i915: Make IRQ reset and postinstall multi-gt aware
Message-ID: <ZDgszOxJGCiM8ZuN@ashyti-mobl2.lan>
References: <20230413092006.931861-1-andi.shyti@linux.intel.com>
 <e4044e9e057eb6a9cb886278caeb4c36b1729359.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e4044e9e057eb6a9cb886278caeb4c36b1729359.camel@intel.com>
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
Cc: "andi.shyti@kernel.org" <andi.shyti@kernel.org>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>, "Das, Nirmoy" <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paulo,

> https://en.wikipedia.org/wiki/Ship_of_Theseus
> 
> My original patch was written in 2018. Since then, the implementation
> has been rebased and changed multiple times, the commit message has
> been changed, the subject line has been changed, yet none of that is
> documented in the patch's revision history: it was all removed and it
> now looks like I'm the author of the version that was submitted this
> month. I never liked this "erase the internal patch's changelog before
> submitting it upstream for the first time" process, I think it erases
> crucial information and misleads people.
> 
> I know I said something different earlier in private, but after further
> reflection, I concluded I do not feel comfortable having my name as the
> Author or as the Signed-off-by in this patch. Please remove it. You can
> add a "Based-on-patch-by: Paulo Zanoni <paulo.r.zanoni@intel.com>" if
> you want, but that's not necessary.
> 
> This should also help in case some bug is bisected to this patch, then
> I won't need to spend time researching who I should forward the emails
> to.

Sure! When porting and back porting patches I try to preserve as
much as possible the original authorship.

But, if you feel more comfortable, I can take it on me.

Andi

> Thanks,
> Paulo
> 
> > 
> > In multitile systems IRQ need to be reset and enabled per GT.
> > 
> > Although in MTL the GUnit misc interrupts register set are
> > available only in GT-0, we need to loop through all the GT's
> > in order to initialize the media engine which lies on a different
> > GT.
> > 
> > Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
