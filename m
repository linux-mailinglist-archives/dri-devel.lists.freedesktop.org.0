Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFCBBE73D9
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 10:44:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C78410EB74;
	Fri, 17 Oct 2025 08:44:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="awdScWgb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 062BE10EB72;
 Fri, 17 Oct 2025 08:44:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1A87B60276;
 Fri, 17 Oct 2025 08:44:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49101C4CEE7;
 Fri, 17 Oct 2025 08:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760690664;
 bh=/+mRHcVmER7KgaDXOfWqB20XxYUtJIuyq457dq9067c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=awdScWgbWqcnpfksmyY4Ekzgdgv2P+EVJUr/uEm8O9QBuy9vycsLoCmuxZofX6hJc
 +Mf++LveqNAYPQ/QN/+awMdBJhaX2LqkhCBxvIHCiQ35oc0Ko/GUrespAwzjIhMVyc
 toD7q7Gqs8l1n/4Dgw8MV7Cbwm+4+CDeXBLdcL+186HF6EjdgJaSpnS85YGT80T+Rd
 c1RyI3Y43ATnTLlAKGXx/TyvjOtRI6KHRVjOXSAfMf5sARhBOVgppK+kKNvCOga5su
 rQXQB5ZVUVwMXKFipwizCfVb/nVcGBInxVX0TSS++6/O3c19kzY+m4jX3OS5slPa9M
 RDyJS+IGTcFgA==
Date: Fri, 17 Oct 2025 10:44:20 +0200
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
Subject: Re: [PATCH v2 1/3] drm/i915: Avoid lock inversion when pinning to GGTT
Message-ID: <6xlqndlojukyqdscutu5yxpgh7atdfeec6xxko4nqiddmmx3ow@ga2vhlp6hnq4>
References: <20251014125504.14804-5-janusz.krzysztofik@linux.intel.com>
 <20251014125504.14804-6-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014125504.14804-6-janusz.krzysztofik@linux.intel.com>
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

>  err_fence:
> -	if (work)
> -		dma_fence_work_commit_imm(&work->base);
> +	if (work) {
> +		/* don't risk lockdep splat against stop_machine() */

BTW, if we are going to apply the patch, we need a clearer
comment here to explain why do we need to check for concurrent
access.

Andi

> +		if (i915_vma_is_ggtt(vma) &&
> +		    intel_vm_no_concurrent_access_wa(vma->vm->i915))
> +			dma_fence_work_commit(&work->base);
> +		else
> +			dma_fence_work_commit_imm(&work->base);
> +	}
