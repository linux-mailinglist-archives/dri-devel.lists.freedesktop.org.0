Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE877BD8312
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 10:33:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9BD710E152;
	Tue, 14 Oct 2025 08:33:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LQWDHNGW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D68610E152;
 Tue, 14 Oct 2025 08:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760430806; x=1791966806;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Oigry3JoQFBKZRMXiz2+W9qCgXbi3V4sOSXG0kWLxj8=;
 b=LQWDHNGWEDHAdMdUSLqfXpuey4jXO2ThwLS2cOkqzaPiPpKueNOY0ow4
 mEJqE0H4VFHFwXUoJdmDSJoQtOAOArZFxY0+B2zvy/Oya2cWFMTZB+mie
 2AZ5pwD02UozHhtInJlM7ePK2iy3VkZms1fi66h4cA/DrkliGzq/zYt2P
 CxUpbVZbxUXdw7QZW9VlVjKlbtbKrbaZ1e0rAhV4bazK+34dk4FLILhZ6
 56SfnYV9akDjO5A4zOiIgtJNATQPsVhXQy831ZONGRys0HTSw2dH57fv3
 fdesCPgrQ+Zw9xNCv59gR5leyJvFO0Q+h/NkgQBWMr4cG/nL/oIMGmpSx Q==;
X-CSE-ConnectionGUID: 3qBetQwJQjWJgJFfqKphnA==
X-CSE-MsgGUID: BUXGVGRuRIyqed8eKnfcNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="61795378"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="61795378"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 01:33:25 -0700
X-CSE-ConnectionGUID: rXy+KZliQL+ZEeVwbnFysw==
X-CSE-MsgGUID: NJN8rHOeRAOpI1ycsmqZuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="181627920"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.244.196])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 01:33:21 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Subject: Re: [PATCH 2/3] drm/i915: Wait longer for threads in migrate selftest
 on CHV/BXT+VTD
Date: Tue, 14 Oct 2025 10:33:19 +0200
Message-ID: <5929253.DvuYhMxLoT@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <uoshfjo7uu4ezvd4ehregiktmf2mabme7qr2wrldxdygy3mmrg@swgp5q4wlus7>
References: <20251008161258.3568573-5-janusz.krzysztofik@linux.intel.com>
 <20251008161258.3568573-7-janusz.krzysztofik@linux.intel.com>
 <uoshfjo7uu4ezvd4ehregiktmf2mabme7qr2wrldxdygy3mmrg@swgp5q4wlus7>
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

Hi Krzysztof,

Thanks for reviewing the series.

On Tuesday, 14 October 2025 09:12:15 CEST Krzysztof Karas wrote:
> Hi Janusz,
> 
> > When running on a Cherryview, or on a Broxton with VTD enabled, pinning of
> > a VMA to GGTT is now committed asynchronously.
> You could also mention previously discovered lockdep issues on
> those platforms. I think that would make it easier to link this
> commit to the previous one in this series, since there is no
> mention of Cherryview nor Broxton in the code.

OK, and I think I'll do the same with patch 3/3.

Thanks,
Janusz

> 
> > That may defer further
> > processing of resources that depend on that VMA.  As a consequence, a 10ms
> > delay in a multithreaded migrate test case may occur too short and still
> > incomplete threads may be interrupted, and the test case may fail with
> > -ERESTARTSYS or -EINTR error code returned by any of those threads.
> 
> > 
> > Extend the delay to empiricaly determined 100ms on affected platforms.
> empiricaly -> empirically
> 
> > 
> > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > ---
> >  drivers/gpu/drm/i915/gt/selftest_migrate.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/selftest_migrate.c b/drivers/gpu/drm/i915/gt/selftest_migrate.c
> > index 54bc447efce0b..cde755751a0ba 100644
> > --- a/drivers/gpu/drm/i915/gt/selftest_migrate.c
> > +++ b/drivers/gpu/drm/i915/gt/selftest_migrate.c
> > @@ -710,7 +710,8 @@ static int threaded_migrate(struct intel_migrate *migrate,
> >  		thread[i].tsk = tsk;
> >  	}
> >  
> > -	msleep(10 * n_cpus); /* start all threads before we kthread_stop() */
> > +	/* start all threads before we kthread_stop() */
> > +	msleep((intel_vm_no_concurrent_access_wa(migrate->context->vm->i915) ? 100 : 10) * n_cpus);
> Hmm, I wonder if having 100 ms delay for all platofms would
> noticeably affect our testing (to have more uniformity here),
> but on the other hand 10 ms was established here for a reason
> in the past, so it should be fine.
> >  
> >  	for (i = 0; i < n_cpus; ++i) {
> >  		struct task_struct *tsk = thread[i].tsk;
> 
> 




