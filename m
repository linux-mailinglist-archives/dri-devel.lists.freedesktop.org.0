Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C4E9F91A7
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 12:49:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFCE210E04C;
	Fri, 20 Dec 2024 11:49:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IK48ZNWy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3E6610E380;
 Fri, 20 Dec 2024 11:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734695380; x=1766231380;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yLBVb/78Kd5fM6GxhZBH65cCV8BKPSE/ZIhZG3UsqhU=;
 b=IK48ZNWyK72t8a8RHX5Fw4X/XSA18UiQmgv4uq3qGCdIomRp81U2dfL7
 ffo5QA4xmnkh5AQZi1D7kwK8/DIkKyveVDCQuNjVj2oryVdx+Aw0sxkCe
 1QYp5C4X8wxB7Y2fClPBwbnSdtryW08L0QWaviAJP7uK/vabT+hBLdhED
 /p8pRv/LQfC97L0Kf9ckc8U/32mZbtndKuP2SsE7TcoNuhh22vO6kYia8
 uUuys24SzVCihIzIFgN7Sorg3zq3v73ZPvoyCPtVoLbO22PTfGJN7AE/L
 Bzd7MSCYNZmy8Z8MhlYSZiPCu3kAGqYiAHMA2X/UER2qihLkS5F9RFOuj A==;
X-CSE-ConnectionGUID: p4uzwzR4TRW807Vn9VErJg==
X-CSE-MsgGUID: W8M06qGSS+Kb9gdYSbVC+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="52766533"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; d="scan'208";a="52766533"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 03:49:39 -0800
X-CSE-ConnectionGUID: YXmYa3IiRO2dLuUnJ9y0OA==
X-CSE-MsgGUID: rj0F+yRxTmmftQC1ecSlng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; d="scan'208";a="99009602"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.251])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 03:49:37 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx@lists.freedesktop.org
Cc: Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH] drm/i915/selftests: Use preemption timeout on cleanup
Date: Fri, 20 Dec 2024 12:49:34 +0100
Message-ID: <6751685.4vTCxPXJkl@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <2414218.NG923GbCHz@jkrzyszt-mobl2.ger.corp.intel.com>
References: <20241213190122.513709-2-janusz.krzysztofik@linux.intel.com>
 <Z2Gw6J1qteGPB3o4@ashyti-mobl2.lan>
 <2414218.NG923GbCHz@jkrzyszt-mobl2.ger.corp.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

Hi Andi,

On Tuesday, 17 December 2024 19:00:40 CET Janusz Krzysztofik wrote:
> Hi Andi,
> 
> On Tuesday, 17 December 2024 18:12:08 CET Andi Shyti wrote:
> > Hi Janusz,
> > 
> > ...
> > 
> > > > > +
> > > > >  		cond_resched();
> > > > >  
> > > > > -		if (intel_gt_wait_for_idle(gt, HZ * 3) == -ETIME) {
> > > > > +		if (intel_gt_wait_for_idle(gt, HZ * timeout_ms / 500) == -ETIME) {
> > > > 
> > > > where is this 500 coming from?
> > > 
> > > / 1000 would convert it to seconds as needed, and / 500 used instead was 
> > > supposed to to mean that we are willing to wait for preempt_timeout_ms * 
> 2.  
> > > Sorry for that shortcut.  Would you like me to provide a clarifying comment, 
> > > or maybe better use explicit 2 * preempt_timeout / 1000 ?
> > 
> > It was clear that you were doubling it, but what's more
> > interesting to know (perhaps in a comment) is why you are
> > choosing to use the double of the timeout_ms instead of other
> > values.
> > 
> > Makes sense?
> 
> Yes, good question.
> 
> Is it possible for more than one bb to hang?  If yes then should we wait 
> longer than the longest preemption timeout?  Before I assumed that maybe we 
> should, just in case, but now, having that revisited and reconsidered, I tend 
> to agree that the longest preempt timeout, perhaps with a small margin (let's 
> say +100ms) should be enough to recover from a single failing test case.  Let 
> me verify if that works for the linked case.

I've done some testing and got a confirmation that the issue I'm trying to 
address in the first place requires a timeout almost twice as long as the 
longest preemption timeout.

I propose the following correction:

-	if (intel_gt_wait_for_idle(gt, HZ * 3) == -ETIME) {
+	/* 2 x longest preempt timeout, experimentally determined */
+	if (intel_gt_wait_for_idle(gt, 2 * timeout_ms * HZ / 1000) == -ETIME) {

Thanks,
Janusz

> 
> Thanks,
> Janusz
> 
> > 
> > Thanks,
> > Andi
> > 
> 
> 
> 
> 
> 




