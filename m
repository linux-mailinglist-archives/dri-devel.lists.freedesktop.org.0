Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41289364E7D
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 01:16:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE2DD6E479;
	Mon, 19 Apr 2021 23:16:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 221216E466;
 Mon, 19 Apr 2021 23:16:29 +0000 (UTC)
IronPort-SDR: L99NkPty0CcDgh0mIHNeQx8WK8/100QaonWYrEILTfSVNAEHocFv2zs+CLOHq7x+/egMaqTRwu
 ZIXqdrAg7QtA==
X-IronPort-AV: E=McAfee;i="6200,9189,9959"; a="182906982"
X-IronPort-AV: E=Sophos;i="5.82,235,1613462400"; d="scan'208";a="182906982"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2021 16:16:27 -0700
IronPort-SDR: iIIH7NlXhkxVafhWosExRMhnrx+Hu6+CYp2cRfQaVv6rb1BmvP4PniIkDXtldicdcUQKnnVY5j
 x/lpHd1JEztQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,235,1613462400"; d="scan'208";a="426687226"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga008.jf.intel.com with SMTP; 19 Apr 2021 16:16:13 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 20 Apr 2021 02:16:13 +0300
Date: Tue, 20 Apr 2021 02:16:13 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v3 03/20] drm/dp: Move i2c init to drm_dp_aux_init, add
 __must_check and fini
Message-ID: <YH4PPbY1qqF2NtrN@intel.com>
References: <20210419225523.184856-1-lyude@redhat.com>
 <20210419225523.184856-4-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210419225523.184856-4-lyude@redhat.com>
X-Patchwork-Hint: comment
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
	David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
	Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
	Oleg Vasilev <oleg.vasilev@intel.com>,
	dri-devel@lists.freedesktop.org,
	Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
	Andrzej Hajda <a.hajda@samsung.com>,
	Aurabindo Pillai <aurabindo.pillai@amd.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Sam Ravnborg <sam@ravnborg.org>, Matt@freedesktop.org,
	Tomi Valkeinen <tomi.valkeinen@ti.com>,
	Parshuram Thombare <pthombar@cadence.com>,
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
	Michal Simek <michal.simek@xilinx.com>,
	amd-gfx@lists.freedesktop.org,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Luben Tuikov <luben.tuikov@amd.com>, Ben Skeggs <bskeggs@redhat.com>,
	Swapnil Jakhade <sjakhade@cadence.com>,
	Thierry Reding <treding@nvidia.com>, Jonas Karlman <jonas@kwiboo.se>,
	Leo Li <sunpeng.li@amd.com>, intel-gfx@lists.freedesktop.org,
	Joe Perches <joe@perches.com>, Yuti Amonkar <yamonkar@cadence.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Mikita Lipski <mikita.lipski@amd.com>, Sean Paul <sean@poorly.run>,
	Navid Emamdoost <navid.emamdoost@gmail.com>,
	Jernej Skrabec <jernej.skrabec@siol.net>,
	Chris Park <Chris.Park@amd.com>, Eryk Brol <eryk.brol@amd.com>,
	Hyun Kwon <hyun.kwon@xilinx.com>,
	Robert Foss <robert.foss@linaro.org>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 19, 2021 at 06:55:05PM -0400, Lyude Paul wrote:
> When moving around drm_dp_aux_register() calls, it turned out we
> accidentally managed to cause issues with the Tegra driver due to the fact
> the Tegra driver would attempt to retrieve a reference to the AUX channel=
's
> i2c adapter - which wouldn't be initialized until drm_dp_aux_register() is
> called.
> =

> This doesn't actually make a whole ton of sense, as it's not unexpected f=
or
> a driver to need to be able to use an AUX adapter before it's been
> registered. Likewise-it's not unexpected for a driver to try using the i2c
> adapter for said AUX channel before it's been registered as well. In fact,
> the current documentation for drm_dp_aux_init() even seems to imply that
> drm_dp_aux_init() is supposed to be handling i2c adapter creation for this
> precise reason - not drm_dp_aux_register().
> =

> Since the i2c adapter doesn't need to be linked to the DRM device in any
> way, we can just fix this problem by moving i2c adapter creation out of
> drm_dp_aux_register() and into drm_dp_aux_init(). Additionally, since this
> means that drm_dp_aux_init() can fail we go ahead and add a __must_check
> attribute to it so that drivers don't ignore its return status on failure=
s.
> And finally, we add a drm_dp_aux_fini() and hook it up in all DRM drivers
> across the kernel to take care of cleaning up the i2c adapter once it's no
> longer needed.
> =

> This should also fix the regressions noted in the Tegra driver.

The init vs. register split is intentional. Registering the thing
and allowing userspace access to it before the rest of the driver
is ready isn't particularly great. For a while now we've tried to
move towards an architecture where the driver is fully initialzied
before anything gets exposed to userspace.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
