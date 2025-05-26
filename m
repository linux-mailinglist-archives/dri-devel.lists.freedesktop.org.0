Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C195AC3C1B
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 10:53:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 609B710E118;
	Mon, 26 May 2025 08:53:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QvIGt55V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC8CE10E118
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 08:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748249628; x=1779785628;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=fRAM41WUGULe/bhMFo31si6hcqEgtPFulyvHS6076vw=;
 b=QvIGt55VtPy7ZtUnu3/H85n6dy9Cz+yMTJQKKCI5PyxAu4nWWT1j+vXz
 smOt7RV7EvZ+PB2S306OUth8PFXpHN0NqzXMw2XxF84WvqVj5cjs2gSXb
 M4mpK2QqgoU6ezArEF7/J+w7D3REWAKvQivYkCnXYJpmw/A3GTcrw5C7c
 9R7pckN8YXKNJUaLiaca1LAMuS26GmV3tKNLprTOYRj3RBmev/q9lusz5
 ScOKZnzmdf3sGwmjDHtO5QqpohadSuqrvalfZKQ/DbBtfUldyRnxeruw8
 68AN7sl9QuTzsNtYiEkX/B4vxTnRhnYsqxwth76YOk1rSXWCxBr3ntGrv A==;
X-CSE-ConnectionGUID: GhVhupkAQ+GBk3oGs8jL5Q==
X-CSE-MsgGUID: Z60vnxywRRiVAvxCoLxFbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="49466341"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="49466341"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 01:53:46 -0700
X-CSE-ConnectionGUID: rfhfdvCwRlq3s+FlBv77EA==
X-CSE-MsgGUID: VgBGYmEJQACvrrstUmAMZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="143234471"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.168])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 01:53:43 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Pengyu Luo <mitltlatltl@gmail.com>, Lee Jones <lee@kernel.org>, Daniel
 Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, Helge
 Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Pengyu Luo <mitltlatltl@gmail.com>
Subject: Re: [RFC PATCH 1/2] backlight: Rename duplicated devices to support
 dual-backlight setups
In-Reply-To: <20250525104022.1326997-1-mitltlatltl@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250525104022.1326997-1-mitltlatltl@gmail.com>
Date: Mon, 26 May 2025 11:53:40 +0300
Message-ID: <7dc6a9e5171bc70be23188ffd8c45168fa79aacb@intel.com>
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

On Sun, 25 May 2025, Pengyu Luo <mitltlatltl@gmail.com> wrote:
> When registering a backlight device, if a device with the same name
> already exists, append "-secondary" to the new device's name. This is
> useful for platforms with dual backlight drivers (e.g. some panels use
> dual ktz8866), where both instances need to coexist.
>
> For now, only one secondary instance is supported. If more instances
> are needed, this logic can be extended with auto-increment or a more
> flexible naming scheme.

I think for both patches you should consider adding a new interface for
creating dual backlight scenarios.

For example, this patch turns a driver error (registering two or more
backlights with the same name) into a special use case, patch 2
magically connecting the two, and hiding the problem.

With i915, you could have multiple devices, each with multiple
independent panels with independent backlights. I think accidentally
trying to register more than one backlight with the same name should
remain an error, *unless* you want the special case of combined
backlights.

Similarly, what if you encounter a device with two panels, and two
*independent* ktz8866?

Please be explicit rather than implicit.


BR,
Jani.


>
> Suggested-by: Daniel Thompson <danielt@kernel.org>
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  drivers/video/backlight/backlight.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
> index 9dc93c5e4..991702f5d 100644
> --- a/drivers/video/backlight/backlight.c
> +++ b/drivers/video/backlight/backlight.c
> @@ -365,7 +365,8 @@ struct backlight_device *backlight_device_register(const char *name,
>  	struct device *parent, void *devdata, const struct backlight_ops *ops,
>  	const struct backlight_properties *props)
>  {
> -	struct backlight_device *new_bd;
> +	struct backlight_device *new_bd, *prev_bd;
> +	const char *new_name = NULL;
>  	int rc;
>  
>  	pr_debug("backlight_device_register: name=%s\n", name);
> @@ -377,10 +378,23 @@ struct backlight_device *backlight_device_register(const char *name,
>  	mutex_init(&new_bd->update_lock);
>  	mutex_init(&new_bd->ops_lock);
>  
> +	/*
> +	 * If there is an instance with the same name already, then rename it.
> +	 * We also can use an auto-increment field, but it seems that there is
> +	 * no triple or quad case.
> +	 */
> +	prev_bd = backlight_device_get_by_name(name);
> +	if (!IS_ERR_OR_NULL(prev_bd)) {
> +		new_name = kasprintf(GFP_KERNEL, "%s-secondary", name);
> +		if (!new_name)
> +			return ERR_PTR(-ENOMEM);
> +		put_device(&prev_bd->dev);
> +	}
> +
>  	new_bd->dev.class = &backlight_class;
>  	new_bd->dev.parent = parent;
>  	new_bd->dev.release = bl_device_release;
> -	dev_set_name(&new_bd->dev, "%s", name);
> +	dev_set_name(&new_bd->dev, "%s", new_name ? new_name : name);
>  	dev_set_drvdata(&new_bd->dev, devdata);
>  
>  	/* Set default properties */
> @@ -414,6 +428,8 @@ struct backlight_device *backlight_device_register(const char *name,
>  	list_add(&new_bd->entry, &backlight_dev_list);
>  	mutex_unlock(&backlight_dev_list_mutex);
>  
> +	kfree(new_name);
> +
>  	return new_bd;
>  }
>  EXPORT_SYMBOL(backlight_device_register);

-- 
Jani Nikula, Intel
