Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E859F51EB
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 18:12:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC4710EA17;
	Tue, 17 Dec 2024 17:12:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XVlY94Gk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A0BE10EA17;
 Tue, 17 Dec 2024 17:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734455536; x=1765991536;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6Q9NbND0HhK6FqM3zwNa+MJnu1eG5ipv0BxD0Di50iM=;
 b=XVlY94GkQOd7dkYkSpMFBiHWajfhY4AkKHwUglATFIEmBhl1IRIO52n3
 lIODO9TWsdWoLatabOerV2TswlQ07n1jvoX89BQWMY2om47SAci6Vsi7f
 MN88hecqdTAe/bvWQP/34qBpCVuCHK+zyVUrWN2RbSQOZ3TZgextKLaer
 2SmIm5YcNE/rGiRUEfPzwFr+YSHipdVoXxfQzPKZgUIa6DJvbIbwiRVCo
 26ohQkAvm7rujNCoD/6Mkzlpdq3z50iAUmldgsJU/Q+cq374jBJ6J1THj
 reO0gIBb2hWf5VLcYzho+KjKSQYOlFThV0JxWihN2kEAIpgqEFICOKFS7 g==;
X-CSE-ConnectionGUID: BRumuOi9TOyxt8cg87L6CQ==
X-CSE-MsgGUID: XMUVFZf1T2a7wyBl/+l06Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="35114081"
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; d="scan'208";a="35114081"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 09:12:16 -0800
X-CSE-ConnectionGUID: /2iry6OQR7ywFheHxiMeRQ==
X-CSE-MsgGUID: Ln7NBVKESbO3tbHJIjBYTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; d="scan'208";a="97375736"
Received: from carterle-desk.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.58])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 09:12:12 -0800
Date: Tue, 17 Dec 2024 18:12:08 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Subject: Re: [PATCH] drm/i915/selftests: Use preemption timeout on cleanup
Message-ID: <Z2Gw6J1qteGPB3o4@ashyti-mobl2.lan>
References: <20241213190122.513709-2-janusz.krzysztofik@linux.intel.com>
 <Z2AqomipvnhZ0r1y@ashyti-mobl2.lan>
 <1986305.PYKUYFuaPT@jkrzyszt-mobl2.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1986305.PYKUYFuaPT@jkrzyszt-mobl2.ger.corp.intel.com>
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

Hi Janusz,

...

> > > +
> > >  		cond_resched();
> > >  
> > > -		if (intel_gt_wait_for_idle(gt, HZ * 3) == -ETIME) {
> > > +		if (intel_gt_wait_for_idle(gt, HZ * timeout_ms / 500) == -
> ETIME) {
> > 
> > where is this 500 coming from?
> 
> / 1000 would convert it to seconds as needed, and / 500 used instead was 
> supposed to to mean that we are willing to wait for preempt_timeout_ms * 2.  
> Sorry for that shortcut.  Would you like me to provide a clarifying comment, 
> or maybe better use explicit 2 * preempt_timeout / 1000 ?

It was clear that you were doubling it, but what's more
interesting to know (perhaps in a comment) is why you are
choosing to use the double of the timeout_ms instead of other
values.

Makes sense?

Thanks,
Andi
