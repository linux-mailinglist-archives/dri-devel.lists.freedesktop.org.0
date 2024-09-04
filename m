Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3B096B78D
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 11:58:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31DB310E731;
	Wed,  4 Sep 2024 09:58:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ek1/+Prc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87ABE10E72F;
 Wed,  4 Sep 2024 09:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725443893; x=1756979893;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=R3f8XqqhzUhpawC1aXctJCl08zl8Q7PA+O00jmQMEOQ=;
 b=Ek1/+Prcx1wIcIuMRTRUE7bbfX9+dbKIqJcsJicVJG1Hk+6nxlPb3tua
 HTZx6fLFhfIy2kMgmMBgO+FInHvKkBW0crIFUhp3e6qDro26YRhVn6ZfY
 cW/I6rU45FsHjPPgnaeYl1wlYQblWvCAagicHeZ9EIoj1HlnONdXdx2yF
 /+jE5jxG1+Gb+R/EFo5IpgKxQnCPx1xa3uVd0DuL976nzRhrJVg53Es41
 YK3dqf9yuCuabmk7mY/fYRG6RCLsbw1JUFUofeuuJtWlWBDKBxVdstnDo
 pku7/PYgfc4LyWqnnTzax154hNkfyRdHdebQlqBkDrnXgAmlONSSsEShB A==;
X-CSE-ConnectionGUID: tOTEZ8D1RyG9KL6j8tW+2w==
X-CSE-MsgGUID: X34engaPR/GM7kAANTqPow==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="24248095"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="24248095"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 02:58:13 -0700
X-CSE-ConnectionGUID: oiYwld9UQAiVnRI/DkEpYg==
X-CSE-MsgGUID: zHWxKB9sT2+xBNmaZkZy4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="102626489"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.18])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 02:58:10 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Vetter
 <daniel.vetter@ffwll.ch>
Cc: Marc Gonzalez <mgonzalez@freebox.fr>, Robert Foss <rfoss@kernel.org>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
In-Reply-To: <20240904125206.6708daff@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240904125206.6708daff@canb.auug.org.au>
Date: Wed, 04 Sep 2024 12:57:52 +0300
Message-ID: <87ikvbspun.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 04 Sep 2024, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/gpu/drm/bridge/ti-tdp158.c: In function 'tdp158_enable':
> drivers/gpu/drm/bridge/ti-tdp158.c:31:9: error: implicit declaration of function 'gpiod_set_value_cansleep' [-Wimplicit-function-declaration]
>    31 |         gpiod_set_value_cansleep(tdp158->enable, 1);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/bridge/ti-tdp158.c: In function 'tdp158_probe':
> drivers/gpu/drm/bridge/ti-tdp158.c:80:26: error: implicit declaration of function 'devm_gpiod_get_optional'; did you mean 'devm_regulator_get_optional'? [-Wimplicit-function-declaration]
>    80 |         tdp158->enable = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_LOW);
>       |                          ^~~~~~~~~~~~~~~~~~~~~~~
>       |                          devm_regulator_get_optional
> drivers/gpu/drm/bridge/ti-tdp158.c:80:65: error: 'GPIOD_OUT_LOW' undeclared (first use in this function)
>    80 |         tdp158->enable = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_LOW);
>       |                                                                 ^~~~~~~~~~~~~
> drivers/gpu/drm/bridge/ti-tdp158.c:80:65: note: each undeclared identifier is reported only once for each function it appears in
>
> Caused by commit
>
>   a15710027afb ("drm/bridge: add support for TI TDP158")
>
> I have used the drm-misc tree from next-20240903 for today.

Fixed by commit 532f0d109658 ("drm/bridge/tdp158: fix build failure") in
drm-misc-next.

BR,
Jani.

-- 
Jani Nikula, Intel
