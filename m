Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8D2BE73F1
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 10:45:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E2610EB75;
	Fri, 17 Oct 2025 08:45:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Npl7xAd4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1EC010EB75;
 Fri, 17 Oct 2025 08:45:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EC9AD603BC;
 Fri, 17 Oct 2025 08:45:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24ACAC4CEE7;
 Fri, 17 Oct 2025 08:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760690727;
 bh=aUL5zrQ06klSSq2sj043Us3v3szAnnEDN/p9OhWFTuI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Npl7xAd4JtSKagybgCMUop5ec7koNKMjVG92CEGpZlMoDExkIALeHJeE7dP+6TVdv
 Xxl6Lykt5zBd3rBEoFjuTA0sn1PcuiAWYj+6QfZHobIjGbZKuMHoo56e0+0/ZDhgZa
 PNViz+Ldu60JzDTRMisWALaaYXQHjqYMJX3NFOUGkzy6EO2ml1nw822UrJ8BFAiy6h
 BrxHxt0SqjqHHuoSR7pxBJNYCEa00+rpXbHtBfl+8g3XCI+owqgGtifW+c9X7E6DPR
 dj8P3kJs4Qj2Slvhf+HDvH6Ajk80Jc0W9I92feba+CnEJd6SEBpY+pYBUAC9kguUAp
 klgdIcEoRSbgQ==
Date: Fri, 17 Oct 2025 10:45:23 +0200
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
Message-ID: <fnrlush5qxoasswzyc7xqp35ewlyqjvvnk2ehfscfh4y5vyyga@j7pewlzaoms4>
References: <20251014125504.14804-5-janusz.krzysztofik@linux.intel.com>
 <20251014125504.14804-7-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014125504.14804-7-janusz.krzysztofik@linux.intel.com>
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

> diff --git a/drivers/gpu/drm/i915/gt/selftest_migrate.c b/drivers/gpu/drm/i915/gt/selftest_migrate.c
> index 54bc447efce0b..cde755751a0ba 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_migrate.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_migrate.c
> @@ -710,7 +710,8 @@ static int threaded_migrate(struct intel_migrate *migrate,
>  		thread[i].tsk = tsk;
>  	}
>  
> -	msleep(10 * n_cpus); /* start all threads before we kthread_stop() */
> +	/* start all threads before we kthread_stop() */
> +	msleep((intel_vm_no_concurrent_access_wa(migrate->context->vm->i915) ? 100 : 10) * n_cpus);

First question, why 100? Second question why not 100 for
everyone?

Andi

>  	for (i = 0; i < n_cpus; ++i) {
>  		struct task_struct *tsk = thread[i].tsk;
> -- 
> 2.51.0
> 
