Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0086A0B4CC
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 11:50:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C37410E632;
	Mon, 13 Jan 2025 10:50:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VRtoCldS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EC3610E3BE
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 10:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736765433; x=1768301433;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Lw9VTdF6OlZ3T8szho0hH38fKL7EklaualeEY/EebAQ=;
 b=VRtoCldSZksHuwk8evtUweEGrf4PmXeKH6BrHHdQV8wq+2P767EroDVN
 /1MCcD8xzZvu/Lcw7NtOiZm3L9PbYlh1ronxvhTPYWpNCAPFXsVsQ+BXg
 X7z42xRaw+5jhdiy6XegqSgaibL0MEJE3vbcXsTCL4xTSv6mZXzGoTW4L
 2trTiuVrsqHWlfoRyxSE63nA4k8AvgmfDVnblYqGcWbY9CUU5PEVXLC6G
 1TAohUbGjIkFUn8vtL85iYOkN43G0lzKcWaUx7nEUd34KzngIbSjAtnn9
 GjjkjPWTb7XFs79u0f5cOmsNg2+7PeiDDW8U76tyjCG2wb31U5/L+FqJV g==;
X-CSE-ConnectionGUID: 3vpVmgLkSZeui8+cKcoQBg==
X-CSE-MsgGUID: Ag6grJITQjCW0U7Aw2ru+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="47595504"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="47595504"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 02:50:33 -0800
X-CSE-ConnectionGUID: 1SMMCcn+RCODBJOGdpSZVg==
X-CSE-MsgGUID: ck9Y0J4XRAapY495YbfkvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="105312813"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.145])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 02:50:29 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Maxime Ripard <mripard@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/doc: Document KUnit expectations
In-Reply-To: <20250113101100.1373856-1-mripard@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250113101100.1373856-1-mripard@kernel.org>
Date: Mon, 13 Jan 2025 12:50:26 +0200
Message-ID: <87v7ujhtsd.fsf@intel.com>
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

On Mon, 13 Jan 2025, Maxime Ripard <mripard@kernel.org> wrote:
> The DRM and KMS frameworks and helpers gain more and more kunit
> coverage, so let's document what our expectations are.
>
> Suggested-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Seems fair.

Acked-by: Jani Nikula <jani.nikula@intel.com>

---

On a related note, I was recently pinged again about the framebuffer
kunit tests causing warning backtraces on successful runs. I don't know
what to tell people, we kind of ended at an impasse [1]. Most tests
don't emit warnings, some do, and I'm still as reluctant as ever to
recommend folks to ignore warnings when running tests. We can agree to
disagree, but it doesn't really move things forward.

BR,
Jani.


[1] https://lore.kernel.org/r/cover.1726594684.git.jani.nikula@intel.com



>
> ---
>
> I'm not too sure where those guidelines should be placed. Is it the best
> place?
> ---
>  Documentation/gpu/drm-internals.rst | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/Documentation/gpu/drm-internals.rst b/Documentation/gpu/drm-internals.rst
> index cb9ae282771c..94f93fd3b8a0 100644
> --- a/Documentation/gpu/drm-internals.rst
> +++ b/Documentation/gpu/drm-internals.rst
> @@ -206,10 +206,17 @@ follows:
>  	The configuration included in ``.kunitconfig`` should be as generic as
>  	possible.
>  	``CONFIG_VIRTIO_UML`` and ``CONFIG_UML_PCI_OVER_VIRTIO`` are not
>  	included in it because they are only required for User Mode Linux.
>  
> +KUnit Coverage Rules
> +~~~~~~~~~~~~~~~~~~~~
> +
> +KUnit support is gradually added to the DRM framework and helpers. There's no
> +general requirement for the framework and helpers to have KUnit tests at the
> +moment. However, patches that are affecting a function or helper already
> +covered by KUnit tests must provide tests if the change calls for one.
>  
>  Legacy Support Code
>  ===================
>  
>  The section very briefly covers some of the old legacy support code

-- 
Jani Nikula, Intel
