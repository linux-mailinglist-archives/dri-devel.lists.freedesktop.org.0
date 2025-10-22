Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3C3BFE36B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 22:45:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A7B10E83D;
	Wed, 22 Oct 2025 20:45:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qAXIAzIL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2890D10E83D;
 Wed, 22 Oct 2025 20:45:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0E42460561;
 Wed, 22 Oct 2025 20:45:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23D26C4CEE7;
 Wed, 22 Oct 2025 20:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761165926;
 bh=xK4NEUt3kYKBA2dWUAGCWNFpiDtP4MNR5PWgIRLXylE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qAXIAzILld5yv4njMhKtWbsaITBkpJjFG4NTUVea8uYRrV8isZMM4j88p464+1Q0c
 1j1BBxCtFuTjwQa5ZjlWLATGbCkG4ZsJ3CK1DwAIpS0Jj/nfvSUNwzOIucz9e9bURB
 hvt26oCxKLDRznRIQl1tNqyEPa/Rv+yapkv52PaagylSVELEP+rOfGDlCabZS1r0qD
 jW+Hqq3a6DS1h2GhA7sf8FEyzZ8jgv8QjgLTbgA8nGWbOIEUDR636JUCV2YHmuL7rw
 wu47hpbWGtxlmqmpE/tYzVOKvkz+SmgbzwFTWmLJlDSCNbEYeN5Rw2taRiWyrhvnYw
 S0Orrh+jp8V3Q==
Date: Wed, 22 Oct 2025 22:45:22 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>, 
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: Re: [PATCH v2 2/3] drm/i915: Wait longer for threads in migrate
 selftest on CHV/BXT+VTD
Message-ID: <qnblfnrrf4myboqcajmsh5xlpgfuo6vrsijdimdyh2uoxr6to6@tgcgfdfgy2dq>
References: <20251014125504.14804-5-janusz.krzysztofik@linux.intel.com>
 <20251014125504.14804-7-janusz.krzysztofik@linux.intel.com>
 <fnrlush5qxoasswzyc7xqp35ewlyqjvvnk2ehfscfh4y5vyyga@j7pewlzaoms4>
 <3847115.MHq7AAxBmi@jkrzyszt-mobl2.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3847115.MHq7AAxBmi@jkrzyszt-mobl2.ger.corp.intel.com>
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

On Wed, Oct 22, 2025 at 12:22:41PM +0200, Janusz Krzysztofik wrote:
> On Friday, 17 October 2025 10:45:23 CEST Andi Shyti wrote:
> > Hi Janusz,
> > 
> > > diff --git a/drivers/gpu/drm/i915/gt/selftest_migrate.c b/drivers/gpu/drm/
> i915/gt/selftest_migrate.c
> > > index 54bc447efce0b..cde755751a0ba 100644
> > > --- a/drivers/gpu/drm/i915/gt/selftest_migrate.c
> > > +++ b/drivers/gpu/drm/i915/gt/selftest_migrate.c
> > > @@ -710,7 +710,8 @@ static int threaded_migrate(struct intel_migrate 
> *migrate,
> > >  		thread[i].tsk = tsk;
> > >  	}
> > >  
> > > -	msleep(10 * n_cpus); /* start all threads before we kthread_stop() 
> */
> > > +	/* start all threads before we kthread_stop() */
> > > +	msleep((intel_vm_no_concurrent_access_wa(migrate->context->vm->i915) 
> ? 100 : 10) * n_cpus);
> > 
> > First question, why 100? Second question why not 100 for
> > everyone?
> 
> 100ms because 10ms occurred too short on CHV / BXT+VTD with GGTT workarounds, 
> and I've empirically determined a sufficient delay of 100ms, as mentioned in 
> commit description.  Do you want me to add that information to the inline 
> comment as well?
> 
> Not for everyone because 10ms has proven to be sufficient for platforms with 
> no CHV / BXT+VTD specific workarounds.  Do you want me to use a single value?

Yes, makes sense, please add a comment explaining that the values
have been found empirically.

Thanks,
Andi
