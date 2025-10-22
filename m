Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7A4BFB61F
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 12:22:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E5AC10E069;
	Wed, 22 Oct 2025 10:22:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ICD6RTGR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 465B010E069;
 Wed, 22 Oct 2025 10:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761128568; x=1792664568;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M8fzZvn2TkbI77VsUuRslIDx11TNR7FYqz3t+eN01ig=;
 b=ICD6RTGRaguZ4FT8TbIPjJ5qYQvaLKZk/56sbEFUS2SYECvmUO7wS0ee
 +YO6jKE8atQOTFQCAIrFAV2qSSsaZsxqgMNqAAbn8rz3WrA4OwRarnXl3
 oVmLUeYnrTkn3SORGuMW/cENBvBjNANe+AaD3NkYs34dEfgHmoCUjIy7+
 1BBHbvNwdF1as8L4Q4NJ8Zjkjyno4+vnF2x52Ho4Ky9KLJULxnv3fVRuH
 afiTx37OBuwYiuPR4JW2Ye7+tQYENqlxClCbKId+F/cMd/uecJJqhm3CV
 rmkFN6rDcuOJCJjFOlxrWh/SNOZTrnwQM9qlCBjoM+7Hk6rHIhQVAxliz g==;
X-CSE-ConnectionGUID: Ml16TsnxQ2CxK+ZW9EZoVw==
X-CSE-MsgGUID: TsI1l9qeRnG5tW4pISMCIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73876596"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="73876596"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 03:22:48 -0700
X-CSE-ConnectionGUID: 4v2J5rq6S9C4tANmGtZ4Zg==
X-CSE-MsgGUID: 5CJE7kegQeeL7Txy+11fnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="221029013"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.244.51])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 03:22:44 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: Re: [PATCH v2 2/3] drm/i915: Wait longer for threads in migrate
 selftest on CHV/BXT+VTD
Date: Wed, 22 Oct 2025 12:22:41 +0200
Message-ID: <3847115.MHq7AAxBmi@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <fnrlush5qxoasswzyc7xqp35ewlyqjvvnk2ehfscfh4y5vyyga@j7pewlzaoms4>
References: <20251014125504.14804-5-janusz.krzysztofik@linux.intel.com>
 <20251014125504.14804-7-janusz.krzysztofik@linux.intel.com>
 <fnrlush5qxoasswzyc7xqp35ewlyqjvvnk2ehfscfh4y5vyyga@j7pewlzaoms4>
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

On Friday, 17 October 2025 10:45:23 CEST Andi Shyti wrote:
> Hi Janusz,
> 
> > diff --git a/drivers/gpu/drm/i915/gt/selftest_migrate.c b/drivers/gpu/drm/
i915/gt/selftest_migrate.c
> > index 54bc447efce0b..cde755751a0ba 100644
> > --- a/drivers/gpu/drm/i915/gt/selftest_migrate.c
> > +++ b/drivers/gpu/drm/i915/gt/selftest_migrate.c
> > @@ -710,7 +710,8 @@ static int threaded_migrate(struct intel_migrate 
*migrate,
> >  		thread[i].tsk = tsk;
> >  	}
> >  
> > -	msleep(10 * n_cpus); /* start all threads before we kthread_stop() 
*/
> > +	/* start all threads before we kthread_stop() */
> > +	msleep((intel_vm_no_concurrent_access_wa(migrate->context->vm->i915) 
? 100 : 10) * n_cpus);
> 
> First question, why 100? Second question why not 100 for
> everyone?

100ms because 10ms occurred too short on CHV / BXT+VTD with GGTT workarounds, 
and I've empirically determined a sufficient delay of 100ms, as mentioned in 
commit description.  Do you want me to add that information to the inline 
comment as well?

Not for everyone because 10ms has proven to be sufficient for platforms with 
no CHV / BXT+VTD specific workarounds.  Do you want me to use a single value?

Thanks,
Janusz

> 
> Andi
> 
> >  	for (i = 0; i < n_cpus; ++i) {
> >  		struct task_struct *tsk = thread[i].tsk;
> 




