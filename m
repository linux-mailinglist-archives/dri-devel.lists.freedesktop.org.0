Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C5D61E394
	for <lists+dri-devel@lfdr.de>; Sun,  6 Nov 2022 17:59:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1019110E0A2;
	Sun,  6 Nov 2022 16:59:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 804D310E076;
 Sun,  6 Nov 2022 16:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1fHQEWgWob7nqgYb7pRzlsH6vNCFNYXfK+/x9/nB01M=; b=Yje8YQHhRml05gW1dej/dWiQQZ
 AqKj2i0OjO2RM1Qumjo7FoNfWRUdBC4/h2uQHli8coC+LKe7l3tUuPyfG7KqA8BEsiA+NVUYZGdcd
 RinbElpcQ3zEo0Ef+uc++uePxxY9puXszvLwKUx+P73tntoXkxilGwxDL1B3Co5nkaf1qLNefEJdU
 TbFTqkc2KcniVpob8iHII19/YNuRBUOwfVsA0XatDekK5sUsjYZNxCxDW65aky/cX6L9UkiWis18f
 9uK/o/dLYZ0E8dKpnNEyK/urj4eNuLfnJnz0gFxc4QGDZbkz/3loUbjywm6lgaJZ1VZ7l87tNIpzo
 XoageSaA==;
Received: from [2a01:799:95a:cb00:fd97:29ff:d72a:349e] (port=51993)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1orizW-0005gi-Tq; Sun, 06 Nov 2022 17:59:26 +0100
Message-ID: <eb485588-2e7a-8455-7ec4-6a9649d2bef8@tronnes.org>
Date: Sun, 6 Nov 2022 17:59:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v6 16/23] drm/probe-helper: Provide a TV get_modes helper
To: Mateusz Kwiatkowski <kfyatek@gmail.com>, maxime@cerno.tech,
 Karol Herbst <kherbst@redhat.com>, Emma Anholt <emma@anholt.net>,
 Ben Skeggs <bskeggs@redhat.com>, Chen-Yu Tsai <wens@csie.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>,
 Maxime Ripard <mripard@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>
References: <20220728-rpi-analog-tv-properties-v6-0-e7792734108f@cerno.tech>
 <20220728-rpi-analog-tv-properties-v6-16-e7792734108f@cerno.tech>
 <8d0eee22-50f5-5b0a-c1e6-c5f61dd5bbcd@gmail.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <8d0eee22-50f5-5b0a-c1e6-c5f61dd5bbcd@gmail.com>
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 27.10.2022 00.02, skrev Mateusz Kwiatkowski:
> Hi Maxime,
> 
> First of all, nice idea with the helper function that can be reused by different
> drivers. This is neat!
> 
> But looking at this function, it feels a bit overcomplicated. You're creating
> the two modes, then checking which one is the default, then set the preferred
> one and possibly reorder them. Maybe it can be simplified somehow?
> 
> Although when I tried to refactor it myself, I ended up with something that's
> not better at all. Maybe it needs to be complicated, after all :(
> 

I also thought that the function was complicated/difficult to read, in
particular the index stuff at the end, but I also failed in finding a
"better" solution, just a different one ;)

Noralf.

My version:

int drm_connector_helper_tv_get_modes(struct drm_connector *connector)
{
	struct drm_device *dev = connector->dev;
	struct drm_property *tv_mode_property = dev->mode_config.tv_mode_property;
	struct drm_cmdline_mode *cmdline = &connector->cmdline_mode;
	unsigned int ntsc_modes = BIT(DRM_MODE_TV_MODE_NTSC) |
				  BIT(DRM_MODE_TV_MODE_NTSC_443) |
				  BIT(DRM_MODE_TV_MODE_NTSC_J) |
				  BIT(DRM_MODE_TV_MODE_PAL_M);
	unsigned int pal_modes = BIT(DRM_MODE_TV_MODE_PAL) |
				 BIT(DRM_MODE_TV_MODE_PAL_N) |
				 BIT(DRM_MODE_TV_MODE_SECAM);
	unsigned int tv_modes[2] = { UINT_MAX, UINT_MAX };
	unsigned int i, supported_tv_modes = 0;

	if (!tv_mode_property)
		return 0;

	for (i = 0; i < tv_mode_property->num_values; i++)
		supported_tv_modes |= BIT(tv_mode_property->values[i]);

	if ((supported_tv_modes & ntsc_modes) && (supported_tv_modes &
pal_modes)) {
		uint64_t default_mode;

		if (drm_object_property_get_default_value(&connector->base,
							  tv_mode_property,
							  &default_mode))
			return 0;

		if (cmdline->tv_mode_specified)
			default_mode = cmdline->tv_mode;

		if (BIT(default_mode) & ntsc_modes) {
			tv_modes[0] = DRM_MODE_TV_MODE_NTSC;
			tv_modes[1] = DRM_MODE_TV_MODE_PAL;
		} else {
			tv_modes[0] = DRM_MODE_TV_MODE_PAL;
			tv_modes[1] = DRM_MODE_TV_MODE_NTSC;
		}
	} else if (supported_tv_modes & ntsc_modes) {
		tv_modes[0] = DRM_MODE_TV_MODE_NTSC;
	} else if (supported_tv_modes & pal_modes) {
		tv_modes[0] = DRM_MODE_TV_MODE_PAL;
	} else {
		return 0;
	}
	
	for (i = 0; i < ARRAY_SIZE(tv_modes); i++) {
		struct drm_display_mode *mode;

		if (tv_modes[i] == DRM_MODE_TV_MODE_NTSC)
			mode = drm_mode_analog_ntsc_480i(dev);
		else if (tv_modes[i] == DRM_MODE_TV_MODE_PAL)
			mode = drm_mode_analog_pal_576i(dev);
		else
			break;
		if (!mode)
			return i;
		if (!i)
			mode->type |= DRM_MODE_TYPE_PREFERRED;
		drm_mode_probed_add(connector, mode);
	}

	return i;
}
