Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE60C89D482
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 10:35:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45EC7112BA8;
	Tue,  9 Apr 2024 08:35:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AC3B112BA8
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 08:35:52 +0000 (UTC)
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 by riemann.telenet-ops.be (Postfix) with ESMTPS id 4VDK6Z4gSGz4wwcw
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 10:35:50 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
 by andre.telenet-ops.be with bizsmtp
 id 8wbp2C00C0SSLxL01wbppr; Tue, 09 Apr 2024 10:35:50 +0200
Received: from geert (helo=localhost)
 by ramsan.of.borg with local-esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1ru6xJ-00CuUk-Ae;
 Tue, 09 Apr 2024 10:35:49 +0200
Date: Tue, 9 Apr 2024 10:35:49 +0200 (CEST)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Maxime Ripard <mripard@kernel.org>
cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>, 
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 09/13] drm: Switch DRM_DISPLAY_DP_AUX_BUS to depends on
In-Reply-To: <20240327-kms-kconfig-helpers-v3-9-eafee11b84b3@kernel.org>
Message-ID: <b601bc8-b016-e5af-b6ce-eb26d01413c1@linux-m68k.org>
References: <20240327-kms-kconfig-helpers-v3-0-eafee11b84b3@kernel.org>
 <20240327-kms-kconfig-helpers-v3-9-eafee11b84b3@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
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

 	Hi Maxime,

Thanks for your patch, which is now commit 4d15125d7fe637f4
("drm: Switch DRM_DISPLAY_DP_AUX_BUS to depends on") in
drm/drm-next (next-20240402 and later).

On Wed, 27 Mar 2024, Maxime Ripard wrote:
> Most of our helpers have relied on being selected so far through
> Kconfig, but that creates issues when we have multiple layers of helpers
> with some depending on others.
>
> Indeed, select doesn't select a dependency's dependencies, and thus
> isn't super intuitive. Depends on however doesn't have that limitation,

(Almost?) Everywhere else we fixed that by also selecting the
dependencies, which is more user-friendly.

> so we can just switch all the drivers that were selecting
> DRM_DISPLAY_DP_AUX_BUS to depend on it.
>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

> --- a/drivers/gpu/drm/display/Kconfig
> +++ b/drivers/gpu/drm/display/Kconfig
> @@ -9,10 +9,11 @@ config DRM_DISPLAY_HELPER
>
> config DRM_DISPLAY_DP_AUX_BUS
> 	tristate "DRM DisplayPort AUX bus support"
> 	depends on DRM
> 	depends on OF || COMPILE_TEST
> +	default y

(quoting Linus) "What is so special about your driver, that it needs to
default to enabled?".

Especially as there is no help available for this option, so the casual
user has no idea if this is needed or not.

And a general comment for this series: many defconfigs need to be
updated, as drivers are no longer enabled because they need
functionality that now needs to be enabled explicitly.

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
