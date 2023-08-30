Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D1678D434
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 10:49:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B120910E4E0;
	Wed, 30 Aug 2023 08:49:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AD0210E4D4
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 08:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693385348; x=1724921348;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5q31+ivsBVs9RBnsPfHDXqcccYBIW10gLH0q2T0WE1U=;
 b=WLMtMeSMyhb07OwMyw01580U+SbnJXxB58NfefR+ZmY1bXCYCCK4s6Ib
 MsMXHMy8R0+oeJJo57nYsHLpETfSFOZKXXEuXFTL9j/Ay2XFTE801F1F9
 EwxAhOH5eU8B9EXX7/30pNAoJDzlfS7lk2YoU3lMsqwruccrbO/FGRrTe
 U7YfEl6syu30PVP6M3SqQLrH7Zu5qOVktlG++4N46o7ooySWK6td8jetM
 CcdtxL//DEjjlkVCJjDanQjA6n7H2Jq083I9CQP3m/LBBKz8/orNYLU5Y
 lMfe9i3aDaXL5w9wgbmXQDvHa3abPZT7Hpf8ywpWFHLgoKM6Lx89c6ITR g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="375542092"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; d="scan'208";a="375542092"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 01:49:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="739027916"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; d="scan'208";a="739027916"
Received: from msterni-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.47.170])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 01:49:04 -0700
Date: Wed, 30 Aug 2023 10:48:56 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Christian =?iso-8859-15?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 2/5] drm/debugfs: disallow debugfs access when device
 isn't registered
Message-ID: <ZO8CeABq7S6IEjnF@ashyti-mobl2.lan>
References: <20230829110115.3442-1-christian.koenig@amd.com>
 <20230829110115.3442-3-christian.koenig@amd.com>
 <ZO3XGchG9fGjoW9K@ashyti-mobl2.lan>
 <5ce9f1b6-0a9e-7cf8-25f9-de9621b342dc@gmail.com>
 <ZO3YmCJKwcJydNGV@ashyti-mobl2.lan>
 <ef05cacc-8a3c-b3e2-b07b-f0d38cd5e7ad@gmail.com>
 <3679a4e7-918f-dde4-46a7-5613d734d13a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3679a4e7-918f-dde4-46a7-5613d734d13a@gmail.com>
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
Cc: ogabbay@kernel.org, dri-devel@lists.freedesktop.org, ttayar@habana.ai,
 Andi Shyti <andi.shyti@linux.intel.com>, "Vetter,
 Daniel" <daniel.vetter@intel.com>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

> > > > > > During device bringup it might be that we can't access
> > > > > > the debugfs files.
> > > > > > Return -ENODEV until the registration is completed on access.
> > > > > just wondering, if the device is not registered, how do we get
> > > > > there?
> > > > The workflow is:
> > > > 1. Creation (DRM)
> > > > 2. Initialization (Driver)
> > > > 3. Registration (DRM)
> > > > ...
> > > > 4. Unregistration (DRM)
> > > > 5. Deinitialization (Driver)
> > > > 6. Destruction (DRM)
> > > > 
> > > > It is possible that debugfs files are created during driver
> > > > initialization,
> > > > but Daniel insisted that they should not be accessible until the
> > > > registration is done (which makes the other UAPI accessible as well).
> > > makes sense, but then why not -EAGAIN, or -EBUSY?
> > 
> > Good question.
> > 
> > I think the main use case for this is between 4 and 6. E.g. a device
> > which is hot removed and now in the process of being torn down.
> > 
> > In this situation we might still have references from userspace (memory
> > mapping etc...), so the drm file and with it the debugfs directory is
> > still there but the physical device is gone. For the IOCTL UAPI we then
> > also return -ENODEV as well, so this makes sense.
> > 
> > The time between 1 and 3 is interesting as well, but here it's more like
> > we couldn't get the device initialized and are now stuck. This happens
> > sometimes during early hardware bringup and I still disagree with Daniel
> > that we should block that (well on the other hand it's trivial for a
> > developer to comment those checks out).
> 
> Could I get an rb for this series or at least this patch from you?

I took some time thinking of possible scenarios and use cases...

What I was thinking, indeed, was scenario 1-3 and I also think
that blocking is not the right thing. In any case the probability
that this might happen is too low, not just in early bring up but
also when modprobing where a little timer would do.

For both cases, 1-3 and 4-6, I believe that -EBUSY would be
better because the device is indeed busy in both cases.

Anyway it's a tiny detail we are talking about here :)

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
