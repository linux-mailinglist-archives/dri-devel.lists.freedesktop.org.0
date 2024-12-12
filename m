Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1F09EE3E0
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 11:14:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 322A010ED3D;
	Thu, 12 Dec 2024 10:14:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uug/8L6E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAD0410ED3D;
 Thu, 12 Dec 2024 10:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733998467; x=1765534467;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=90bTRGiKqkb8rR7VDpDG6gx+tlObFN2dY+doYMnUlTE=;
 b=Uug/8L6EpeyrcfzhH/Gw3j3+DwMTjnnfq/uYfLPnAjFqC8rXtR2UmCJ7
 wahO56lXGy5cDScYMPXOt72ECgzegLEaVGImwXVpJlgbryB5jsBWKd2Wp
 M87rLCiwFzokwM7P4adoFyDGYNdV+uDjUfWUrogGGvPKalFmiS5yUnRNy
 wDkMmDORktqzlWk+7vBmcy7q+sVGdsZu3/DSnyGrsynR5C6TcFNonRlOR
 aWTjiTMBE8FUeJPyTG63rU7q1RGRHKBpBMATBOcK/tgGjJ7x19qkD3a6C
 zUls7GjRxReyT7le6jtMOwNj8h3Vpy3nBQN3A4fg8CC4XT3JPdGGFL/d/ Q==;
X-CSE-ConnectionGUID: CbFLb8TtSpeGvxKnLn/7Ew==
X-CSE-MsgGUID: xcGUoMwxR1e2mWc55XmFjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="44878632"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="44878632"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 02:14:27 -0800
X-CSE-ConnectionGUID: jZY/FG/5QZqzPXFBuGSjDA==
X-CSE-MsgGUID: I+KSGTn/QsC7TXlhwU7GMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="101137289"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.101])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 02:14:24 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v3 07/11] drm/nouveau/dp_mst: Expose a connector to
 kernel users after it's properly initialized
In-Reply-To: <20241211230328.4012496-8-imre.deak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241211230328.4012496-1-imre.deak@intel.com>
 <20241211230328.4012496-8-imre.deak@intel.com>
Date: Thu, 12 Dec 2024 12:14:20 +0200
Message-ID: <8734itxl6r.fsf@intel.com>
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
> After a connector is added to the drm_mode_config::connector_list, it's
> visible to any in-kernel users looking up connectors via the above list.
> Make sure that the connector is properly initialized before such
> look-ups, by initializing the connector with
> drm_connector_dynamic_register() - which doesn't add the connector to
> the list - and registering it with drm_connector_dynamic_register() -
> which adds the connector to the list - after the initialization is
> complete.
>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Imre Deak <imre.deak@intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/nouveau/dispnv50/disp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index eed579a6c858b..8097249612bc7 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -1265,8 +1265,8 @@ nv50_mstc_new(struct nv50_mstm *mstm, struct drm_dp_mst_port *port,
>  	mstc->mstm = mstm;
>  	mstc->port = port;
>  
> -	ret = drm_connector_init(dev, &mstc->connector, &nv50_mstc,
> -				 DRM_MODE_CONNECTOR_DisplayPort);
> +	ret = drm_connector_dynamic_init(dev, &mstc->connector, &nv50_mstc,
> +					 DRM_MODE_CONNECTOR_DisplayPort, NULL);
>  	if (ret) {
>  		kfree(*pmstc);
>  		*pmstc = NULL;

-- 
Jani Nikula, Intel
