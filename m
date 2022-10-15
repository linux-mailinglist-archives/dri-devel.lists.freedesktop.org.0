Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F29B5FFB53
	for <lists+dri-devel@lfdr.de>; Sat, 15 Oct 2022 18:58:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D485310E195;
	Sat, 15 Oct 2022 16:58:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5268E10E118;
 Sat, 15 Oct 2022 16:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gRy1MHYPV0WjU4nMQ/DZ5j9qWrakSMjHmkC1JCQLKKk=; b=G9nlUqcHHVoUyqjchI57Tgoe/d
 m0lGjU3ZwAjc3YFmnUb6DEBU1fUKAWLFOBaxCcQJhLYc02d8hfd7deQYYai/8RdQK8jEt9nxd6oSI
 d57mdNzMsoRDprp6M2gwI4UKaHZXKKU2b4ZGt2Q5p4kdC6V9xEiC0TKUy0MuPdTGI3nMaMR1fkDRj
 0YPw6ta/NXrolu/c5x9cb4ETDRdQY67UfzMdwdetJCo8ou3OqZX6EpjIHn1UioQaztW25/wG92ADt
 jP05MU+8u9yN1bmPdqx1lgpm0jS8dOMGJanP0dXqafqWGPQGWtQ0ABLTwpdQcaMusFHsoEqyf5A/B
 qJcVU25A==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:62527
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1ojkUb-0004Ts-Bm; Sat, 15 Oct 2022 18:58:33 +0200
Message-ID: <61813964-8f3e-87b0-4124-4566a7f9c86e@tronnes.org>
Date: Sat, 15 Oct 2022 18:58:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v5 07/22] drm/client: Add some tests for
 drm_connector_pick_cmdline_mode()
To: Maxime Ripard <maxime@cerno.tech>, Karol Herbst <kherbst@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, Maxime Ripard <mripard@kernel.org>,
 Emma Anholt <emma@anholt.net>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Ben Skeggs <bskeggs@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20220728-rpi-analog-tv-properties-v5-0-d841cc64fe4b@cerno.tech>
 <20220728-rpi-analog-tv-properties-v5-7-d841cc64fe4b@cerno.tech>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220728-rpi-analog-tv-properties-v5-7-d841cc64fe4b@cerno.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 13.10.2022 15.18, skrev Maxime Ripard:
> drm_connector_pick_cmdline_mode() is in charge of finding a proper
> drm_display_mode from the definition we got in the video= command line
> argument.
> 
> Let's add some unit tests to make sure we're not getting any regressions
> there.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> ---
> Changes in v5:
> - Removed useless (for now) count and modes intermediate variables in
>   get_modes
> - Switched to kunit assertions in test init, and to KUNIT_ASSERT_NOT_NULL
>   instead of KUNIT_ASSERT_PTR_NE(..., NULL)
> 
> Changes in v4:
> - Removed MODULE macros
> ---
>  drivers/gpu/drm/drm_client_modeset.c            |  4 +
>  drivers/gpu/drm/tests/drm_client_modeset_test.c | 99 +++++++++++++++++++++++++
>  2 files changed, 103 insertions(+)
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

I can't say I like including the file like this, but exporting the
static function for testing isn't attractive either and doing it like
this is shown in the kunit docs, so:

Acked-by: Noralf Trønnes <noralf@tronnes.org>
