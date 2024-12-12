Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DC59EE3E6
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 11:15:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEFB410ED40;
	Thu, 12 Dec 2024 10:15:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wphae+5E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F162C10ED3F;
 Thu, 12 Dec 2024 10:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733998531; x=1765534531;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=luJD/lz/ljCtehuZuGxxhghwDeTh+Bv9oirpza4NuSg=;
 b=Wphae+5EwGyn1kD15ZGd4q9jGyIh/pH5OpG/dCbh08g4lp6YayPPK7mU
 uA3S3risdQtp+r5/hQ4TbxuHZsxbmMgzKejou7VAwlRoNgCEAKUDpaPMl
 /xMTyor5zquC7pFU1PGZVEMakTnkqGpCC1zbpy3mhzzYXLubwijQwk/aA
 YVZEObakD72ASxMBx4Vf96vbTnRAyHMLaHfSCSB3h1n+2J5ubLP/DTC6m
 SFyvu2we4xV8ArzweY9WoszdQN9cd9EBGnRgVNef2mm6tGgY45J9msIyt
 G80J/Vv1DCTNufqYw6iRHpXMI+vgEeW5Ya6CF6CwlhB5gFtTxOOSnJbD/ A==;
X-CSE-ConnectionGUID: kC6NeeMWTImdNFsyGj3Kbg==
X-CSE-MsgGUID: YApFnkvlS+aT0uYYKP6Mag==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34454204"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; d="scan'208";a="34454204"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 02:15:30 -0800
X-CSE-ConnectionGUID: dAI9eNfRTpCsj2Znp0oZTg==
X-CSE-MsgGUID: 0og153bETPaHDotxEULQvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; d="scan'208";a="95942423"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.101])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 02:15:29 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 08/11] drm/connector: Warn if a connector is
 registered/added incorrectly
In-Reply-To: <20241211230328.4012496-9-imre.deak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241211230328.4012496-1-imre.deak@intel.com>
 <20241211230328.4012496-9-imre.deak@intel.com>
Date: Thu, 12 Dec 2024 12:15:26 +0200
Message-ID: <87zfl1w6kh.fsf@intel.com>
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

On Thu, 12 Dec 2024, Imre Deak <imre.deak@intel.com> wrote:
> All the drivers should be converted now to use
> drm_connector_dynamic_init() for MST connectors, hence
> drm_connector_dynamic_register()->drm_connector_add() can WARN now if
> this was not the case (for instance if a driver inited an MST connector
> with one of the drm_connector_init*() functions incorrectly).
>
> Signed-off-by: Imre Deak <imre.deak@intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/drm_connector.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index c322dbf6e3161..1bd7407223fbb 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -330,11 +330,7 @@ static void drm_connector_add(struct drm_connector *connector)
>  	struct drm_device *dev = connector->dev;
>  	struct drm_mode_config *config = &dev->mode_config;
>  
> -	/*
> -	 * TODO: Change this to a WARN, once all drivers are converted to
> -	 * call drm_connector_dynamic_init() for MST connectors.
> -	 */
> -	if (!list_empty(&connector->head))
> +	if (drm_WARN_ON(dev, !list_empty(&connector->head)))
>  		return;
>  
>  	spin_lock_irq(&config->connector_list_lock);

-- 
Jani Nikula, Intel
