Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 893F35E7A13
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 14:00:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE4510E8EB;
	Fri, 23 Sep 2022 11:59:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD08510E8E2;
 Fri, 23 Sep 2022 11:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663934389; x=1695470389;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=YaUg750lJnggz6KWmfaPEF4rvlW5TvJZSCMSaU800rA=;
 b=bGKLUAv3RM4CScRs6oCBRHN7KODcnxOd2jUtFFqUv279OEUGdxLcDqM/
 KZfDymiO9tWURARsrTmmx3vS/6JVko00U8VHF9WigBuryKp06FYuWJREg
 kMlQFj9q2uoxMXvafgAubSRNZGbIzp/RBzK4BohtYHlRccI6XpcRCVPJZ
 8lSvbuD+UEVxCGvyQpxfKDit3N9mrUWl5mLib17gnm4PDGLEmSHtzqRUT
 MMAPZGzVNNrmG1khXPFNu2VM+HgBRUsmZt1LD/931VQ2f7bRcXY7S92W/
 pt/D4s3W1W9APQPbUq+jrSegZUucWtmEku9AckZDbeR9NdGHMGTTdSzTm Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="386865705"
X-IronPort-AV: E=Sophos;i="5.93,339,1654585200"; d="scan'208";a="386865705"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 04:59:49 -0700
X-IronPort-AV: E=Sophos;i="5.93,339,1654585200"; d="scan'208";a="865270599"
Received: from armannov-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.61.93])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 04:59:42 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <maxime@cerno.tech>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Ben
 Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Maxime
 Ripard <mripard@kernel.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Emma Anholt <emma@anholt.net>, Karol
 Herbst <kherbst@redhat.com>, Samuel Holland <samuel@sholland.org>, Thomas
 Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>, Lyude
 Paul <lyude@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v2 13/33] drm/client: Add some tests for
 drm_connector_pick_cmdline_mode()
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-13-f733a0ed9f90@cerno.tech>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-13-f733a0ed9f90@cerno.tech>
Date: Fri, 23 Sep 2022 14:59:23 +0300
Message-ID: <875yhe47z8.fsf@intel.com>
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 Hans de Goede <hdegoede@redhat.com>,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 22 Sep 2022, Maxime Ripard <maxime@cerno.tech> wrote:
> drm_connector_pick_cmdline_mode() is in charge of finding a proper
> drm_display_mode from the definition we got in the video= command line
> argument.
>
> Let's add some unit tests to make sure we're not getting any regressions
> there.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>
> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
> index bbc535cc50dd..d553e793e673 100644
> --- a/drivers/gpu/drm/drm_client_modeset.c
> +++ b/drivers/gpu/drm/drm_client_modeset.c
> @@ -1237,3 +1237,7 @@ int drm_client_modeset_dpms(struct drm_client_dev *client, int mode)
>  	return ret;
>  }
>  EXPORT_SYMBOL(drm_client_modeset_dpms);
> +
> +#ifdef CONFIG_DRM_KUNIT_TEST
> +#include "tests/drm_client_modeset_test.c"
> +#endif
> diff --git a/drivers/gpu/drm/tests/drm_client_modeset_test.c b/drivers/gpu/drm/tests/drm_client_modeset_test.c
> new file mode 100644
> index 000000000000..46335de7bc6b
> --- /dev/null
> +++ b/drivers/gpu/drm/tests/drm_client_modeset_test.c

[snip]

> +MODULE_AUTHOR("Maxime Ripard <mripard@kernel.org>");
> +MODULE_LICENSE("GPL");

I think these annotations are incompatible with including the unit test,
and, in this case, affect drm.ko.

And we'll have two kinds of tests, those that get built via
tests/Makefile, and those that get included, like this one, which should
not be mentioned in tests/Makefile.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
