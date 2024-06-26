Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CF3917CCA
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 11:44:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A4610E811;
	Wed, 26 Jun 2024 09:44:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AW9RFeWE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB3AD10E80F;
 Wed, 26 Jun 2024 09:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719395072; x=1750931072;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=8oj6vqU/PrvAFjUQi14sL3u4RL2wfEfrUPz8HaO20Cg=;
 b=AW9RFeWEIgAiZccyE/weKfsQ/jVlI7nC2ruJtJr76rJ+bw4A+ZGqzyA2
 enxn3P0oRNueun68It0ubDPC7wT9LJhV3CSQ1NjynZCIGrhO3zZyWiLek
 1wrrqmaAzzb+anh49VKECax8Eu7h35+HkvxOrnm97RcuEi8QoaFwecgyO
 iOw4jQU0fYrJZr82a0l7VZ6gO6fko7TqCGJeJSonQaGptQUjVSldhcq+5
 IW91dCgt78/rSVwRYSPaGn0iGyDuOufQIeYr40jErEo8eCSAJF6irSOb1
 40qHGzikZJbBe8/StV97Zclrj43m/3cO17WbOSriNZaazxs1gSQITkXrK g==;
X-CSE-ConnectionGUID: yimAyYmCSMKX3DYiDSrNyw==
X-CSE-MsgGUID: ve5GCm8JS9S7ogqmjre84w==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16598042"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208";a="16598042"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 02:44:31 -0700
X-CSE-ConnectionGUID: 7FTY5V5eSnyjRNefLzoS/A==
X-CSE-MsgGUID: oZKct96xRY2xVb/2TmCQIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208";a="75154744"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.95])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 02:44:28 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ma Ke <make24@iscas.ac.cn>, kherbst@redhat.com, lyude@redhat.com,
 dakr@redhat.com, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Ma Ke <make24@iscas.ac.cn>
Subject: Re: [PATCH] drm/nouveau: fix null pointer dereference in
 nouveau_connector_get_modes
In-Reply-To: <20240626013013.2765395-1-make24@iscas.ac.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240626013013.2765395-1-make24@iscas.ac.cn>
Date: Wed, 26 Jun 2024 12:44:21 +0300
Message-ID: <875xtwdone.fsf@intel.com>
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

On Wed, 26 Jun 2024, Ma Ke <make24@iscas.ac.cn> wrote:
> In nouveau_connector_get_modes(), the return value of drm_mode_duplicate()
> is assigned to mode, which will lead to a possible NULL pointer
> dereference on failure of drm_mode_duplicate(). Add a check to avoid npd.
>
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
>  drivers/gpu/drm/nouveau/nouveau_connector.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
> index 856b3ef5edb8..010eed56b14d 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> @@ -1001,6 +1001,8 @@ nouveau_connector_get_modes(struct drm_connector *connector)
>  		struct drm_display_mode *mode;
>  
>  		mode = drm_mode_duplicate(dev, nv_connector->native_mode);
> +		if (!mode)
> +			return -ENOMEM;

Do not return negative values from .get_modes().

BR,
Jani.

>  		drm_mode_probed_add(connector, mode);
>  		ret = 1;
>  	}

-- 
Jani Nikula, Intel
