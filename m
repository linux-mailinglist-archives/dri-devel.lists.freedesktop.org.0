Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E4DCBE4BA
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 15:33:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6527310E510;
	Mon, 15 Dec 2025 14:33:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I1797WpY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1198A10E510;
 Mon, 15 Dec 2025 14:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765809212; x=1797345212;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Gk981fOsNYh4j+GZdg4gwbIs4ohC0dEZ5ROMr1q2JrI=;
 b=I1797WpYC3YMSDd59Q80r6VG/rfZhk95Juq+iXwj5nVo8cCLJC66xpuq
 YjrbkBBThY606mtR3p+roLvMMtdBCJpcDYKTB3hPEIRweHl9jmgmwwOHu
 Riqkz4OHeGFSZ/r4tj7J2pB8d36bK8ivuRo6hbqKu7u0bnU2So4yB3BzF
 SMoIP6FGY6nGt1WEky5GK+HENWpvs4uizv6AfUOaSjbcdfSLVY9i7wyqT
 qokLY7u9uIGNH6lXi68t2cdWZCTxA/f1kHdBH8sM2G+HifA2dZsOGPSLM
 f/zsZ222mhP/Itw4KE9NoXZvfNsQJ2f8LhDokzpeIYFdEF5vr2dR2vN8R A==;
X-CSE-ConnectionGUID: y3MgcwPiTZOUbhoJQiK0FQ==
X-CSE-MsgGUID: pttwY/I6SAOz1Rzpx6mR/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="55273995"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="55273995"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 06:33:31 -0800
X-CSE-ConnectionGUID: EygTmeXZQByM+mkeyjwg5Q==
X-CSE-MsgGUID: pDduKXY+RF6oo2OzX6+Jig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="228389697"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.135])
 ([10.245.244.135])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 06:33:30 -0800
Message-ID: <994e8936-a1ed-4254-880c-056d36942ce0@linux.intel.com>
Date: Mon, 15 Dec 2025 15:33:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] drm: unwind drm device registration upon error
To: Krzysztof Karas <krzysztof.karas@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
 intel-gfx@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>, 
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
References: <oi563j5djez5facxbrmkkyy7hvtb6lijurrebxffqqjfxhjjnu@7f7mrbufdcbv>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <oi563j5djez5facxbrmkkyy7hvtb6lijurrebxffqqjfxhjjnu@7f7mrbufdcbv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hey,

Den 2025-12-08 kl. 13:09, skrev Krzysztof Karas:
> The drm device registration is done via drm_dev_register().
> This function attempts to undo some of the initiatlization steps
> under err_unload and err_minors labels, but this process is
> incomplete - debugfs entries remain and the dev->registered flag
> is still set to true.
> 
> On the other hand, drm_dev_unregister() tries to tear down
> everything that was initialized during registration step.
> This is confusing when considering a failure in
> drm_dev_register(), because not all steps will be undone
> before returning, so it is unclear whether a call to
> drm_dev_unregister() is a requirement or not.
> 
> What is more, during the drm device registration client sysrqs
> are added only when drm_dev_register() is sure to complete
> without failures, but drm_client_sysrq_unregister() gets called
> every time during drm_dev_unregister() and prints warning 
> messages whenever the caller attempts to clean up unsuccessful
> registration with immediate unregistration.
> 
> Amend the problem by removing debugfs entries and setting
> "registered" flag to false upon error in drm_dev_register().
> 
> Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>
> ---
> I noticed that some drivers use drm_dev_unregister() whenever
> a call to drm_dev_register() and many do not. It is also a bit
> confusing to me why drm_dev_register() does not completely
> unwind all the initialization steps it performs, which leaves
> me wondering if drm_dev_unregister() is required on the error
> path or not.
> 
> The WARN_ON introduced in 6915190a50e8f7cf13dcbe534b02845be533b60a
> exposed this problem, because previously there were no
> notifications from these functions, so I noticed this mismatch
> only thanks to the warnings.
> 
> I think the other way to solve this would be to require an
> unregister call for each register call, but that would mean a
> series of changes for the callers that currently do the cleanup
> in their own way.
> ---
>  drivers/gpu/drm/drm_drv.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 2915118436ce..a502110696a3 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -1119,6 +1119,8 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
>  	drm_minor_unregister(dev, DRM_MINOR_ACCEL);
>  	drm_minor_unregister(dev, DRM_MINOR_PRIMARY);
>  	drm_minor_unregister(dev, DRM_MINOR_RENDER);
> +	drm_debugfs_dev_fini(dev);
> +	dev->registered = false;
>  out_unlock:
>  	if (drm_dev_needs_global_mutex(dev))
>  		mutex_unlock(&drm_global_mutex);

I'm not convinced anything should depend on dev->registered being set to false, as we should only free the struct afterwards, but clearing out drm_debugfs would be a a good step.

All in all looks sane.

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Kind regards,
~Maarten Lankhorst
