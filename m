Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A21E6600C73
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 12:32:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D4B010ED30;
	Mon, 17 Oct 2022 10:31:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CDB310ED30;
 Mon, 17 Oct 2022 10:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4stdZmnnjzcJfTIv6rX9y4Ktpwm0v2vziI9Ogexmn4M=; b=JTuh8gNnaSkR+5LHWdYqs3GbB1
 ZHTKRsHYL2Hwd506N3u16pSrtZpDVzxuSO7U0YcYZMN/CHexTltSaNhqyFAtGAJCPUV4V0b8nZ3J0
 MGXR+vIMKn64zMJYCMljgm7u5lRp0nf7NBcZ7zr7aV2s+jSrsEZgQCKC0dPn+Yw66geVhRH6bVeZc
 Gzdem6BNhYGvtZbsJI4bfYo5I/grPpluNd1h9zuwTo/xoj/QGbegYU3yW4i4KSEBhxB/sXpqu4h6p
 9gJSysyAKSm1TQM1nSWpbf0JEhuGpMy0U86hC40/GYjpCPhyMJLKilWX9SIAKnUzU7Om4NhJmBb0J
 K0jnVmWA==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:60899
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1okNPD-0001a2-7h; Mon, 17 Oct 2022 12:31:35 +0200
Message-ID: <81936381-ae37-8c84-4681-9eff19f653b5@tronnes.org>
Date: Mon, 17 Oct 2022 12:31:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v5 20/22] drm/vc4: vec: Convert to the new TV mode property
To: kfyatek+publicgit@gmail.com, Maxime Ripard <maxime@cerno.tech>,
 Karol Herbst <kherbst@redhat.com>, Jani Nikula
 <jani.nikula@linux.intel.com>,
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
 <20220728-rpi-analog-tv-properties-v5-20-d841cc64fe4b@cerno.tech>
 <c1949248-fb40-682c-492e-bafbd915cee3@gmail.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <c1949248-fb40-682c-492e-bafbd915cee3@gmail.com>
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



Den 16.10.2022 20.52, skrev Mateusz Kwiatkowski:
> Hi Maxime,
> 
>>  static int vc4_vec_connector_get_modes(struct drm_connector *connector)
>>  {
>> -	struct drm_connector_state *state = connector->state;
>>  	struct drm_display_mode *mode;
>>  
>> -	mode = drm_mode_duplicate(connector->dev,
>> -				  vc4_vec_tv_modes[state->tv.legacy_mode].mode);
>> +	mode = drm_mode_analog_ntsc_480i(connector->dev);
>>  	if (!mode) {
>>  		DRM_ERROR("Failed to create a new display mode\n");
>>  		return -ENOMEM;
>>  	}
>>  
>> +	mode->type |= DRM_MODE_TYPE_PREFERRED;
>>  	drm_mode_probed_add(connector, mode);
>>  
>> -	return 1;
>> +	mode = drm_mode_analog_pal_576i(connector->dev);
>> +	if (!mode) {
>> +		DRM_ERROR("Failed to create a new display mode\n");
>> +		return -ENOMEM;
>> +	}
>> +
>> +	drm_mode_probed_add(connector, mode);
>> +
>> +	return 2;
>> +}
> 
> Referencing those previous discussions:
> - https://lore.kernel.org/dri-devel/0255f7c6-0484-6456-350d-cf24f3fee5d6@tronnes.org/
> - https://lore.kernel.org/dri-devel/c8f8015a-75da-afa8-ca7f-b2b134cacd16@gmail.com/
> 
> Unconditionally setting the 480i mode as DRM_MODE_TYPE_PREFERRED causes Xorg
> (at least on current Raspberry Pi OS) to display garbage when
> video=Composite1:PAL is specified on the command line, so I'm afraid this won't
> do.
> 
> As I see it, there are three viable solutions for this issue:
> 
> a) Somehow query the video= command line option from this function, and set
>    DRM_MODE_TYPE_PREFERRED appropriately. This would break the abstraction
>    provided by global DRM code, but should work fine.
> 
> b) Modify drm_helper_probe_add_cmdline_mode() so that it sets
>    DRM_MODE_TYPE_PREFERRED in addition to DRM_MODE_TYPE_USERDEF. This seems
>    pretty robust, but affects the entire DRM subsystem, which may break
>    userspace in different ways.
> 
>    - Maybe this could be mitigated by adding some additional conditions, e.g.
>      setting the PREFERRED flag only if no modes are already flagged as such
>      and/or only if the cmdline mode is a named one (~= analog TV mode)
> 
> c) Forcing userspace (Xorg / Raspberry Pi OS) to get fixed and honor the USERDEF
>    flag.
> 
> Either way, hardcoding 480i as PREFERRED does not seem right.
> 

My solution for this is to look at tv.mode to know which mode to mark as
preferred. Maxime didn't like this since it changes things behind
userspace's back. I don't see how that can cause any problems for userspace.

If userspace uses atomic and sets tv_mode, it has to know which mode to
use before hand, so it doesn't look at the preferreded flag.

If it uses legacy and sets tv_mode, it can end up with a stale preferred
flag, but no worse than not having the flag or that ntsc is always
preferred.

If it doesn't change tv_mode, there's no problem, the preferred flag
doesn't change.

Noralf.
