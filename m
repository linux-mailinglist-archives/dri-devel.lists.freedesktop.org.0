Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B907F6281
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 16:16:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CD9C10E094;
	Thu, 23 Nov 2023 15:16:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FA3610E08B;
 Thu, 23 Nov 2023 15:16:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 9D58EB82D97;
 Thu, 23 Nov 2023 15:16:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F0C6C433C9;
 Thu, 23 Nov 2023 15:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700752567;
 bh=lzVZxJXSuVlg5TJP4dPDommHt63YQoouP8CMSO2x+6s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aHqy9roYY5/JVAeimPivoDsCudYKtwdFnGpoLH3m76OeL8P0BDyL5Sc/3miQr2PmL
 hRZDRRGAm1Uye0c+yqVpFAK/beZ5hDj70CfWngjrStrTzTvXtSc8NSYhr3ldpsQfaY
 r0YfI3xAzbQ5IZOXus3baO9WeGtvVe+D4X7QQ1qjU3B6uwub042jUFn6y80DWhT82k
 MTX1bTMLehElqjnjKV5oO01PHxy/Uz+zYAXPf8w7C1cEIoT3gWUSjO5jdkHK4u5/SP
 VhJvtTHQuu7E5vz/fTds/fpgnXUPXA1bUvRWNF23KUPZaqQcD2SqRGBwVcGpofXsbE
 B/Co9nS6vBIOA==
Date: Thu, 23 Nov 2023 15:15:56 +0000
From: Lee Jones <lee@kernel.org>
To: Sean Young <sean@mess.org>
Subject: Re: [PATCH v5 1/4] pwm: rename pwm_apply_state() to
 pwm_apply_cansleep()
Message-ID: <20231123151556.GC1354538@google.com>
References: <cover.1700323916.git.sean@mess.org>
 <2b973840d800ffb71c2683c37bc996e0cf90a140.1700323916.git.sean@mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2b973840d800ffb71c2683c37bc996e0cf90a140.1700323916.git.sean@mess.org>
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
Cc: linux-fbdev@vger.kernel.org, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 linux-leds@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-media@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-pwm@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, Jani Nikula <jani.nikula@intel.com>,
 intel-gfx@lists.freedesktop.org, linux-input@vger.kernel.org,
 Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Jingoo Han <jingoohan1@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 18 Nov 2023, Sean Young wrote:

> In order to introduce a pwm api which can be used from atomic context,
> we will need two functions for applying pwm changes:
> 
> 	int pwm_apply_cansleep(struct pwm *, struct pwm_state *);
> 	int pwm_apply_atomic(struct pwm *, struct pwm_state *);
> 
> This commit just deals with renaming pwm_apply_state(), a following
> commit will introduce the pwm_apply_atomic() function.
> 
> Acked-by: Hans de Goede <hdegoede@redhat.com>
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Sean Young <sean@mess.org>
> ---
>  Documentation/driver-api/pwm.rst              |  8 +++---
>  .../gpu/drm/i915/display/intel_backlight.c    |  6 ++--
>  drivers/gpu/drm/solomon/ssd130x.c             |  2 +-
>  drivers/hwmon/pwm-fan.c                       |  8 +++---
>  drivers/input/misc/da7280.c                   |  4 +--
>  drivers/input/misc/pwm-beeper.c               |  4 +--
>  drivers/input/misc/pwm-vibra.c                |  8 +++---

>  drivers/leds/leds-pwm.c                       |  2 +-
>  drivers/leds/rgb/leds-pwm-multicolor.c        |  4 +--

Acked-by: Lee Jones <lee@kernel.org>

>  drivers/media/rc/pwm-ir-tx.c                  |  4 +--
>  drivers/platform/x86/lenovo-yogabook.c        |  2 +-
>  drivers/pwm/core.c                            | 18 ++++++------
>  drivers/pwm/pwm-twl-led.c                     |  2 +-
>  drivers/pwm/pwm-vt8500.c                      |  2 +-
>  drivers/pwm/sysfs.c                           | 10 +++----
>  drivers/regulator/pwm-regulator.c             |  4 +--

>  drivers/video/backlight/lm3630a_bl.c          |  2 +-
>  drivers/video/backlight/lp855x_bl.c           |  2 +-
>  drivers/video/backlight/pwm_bl.c              | 12 ++++----

Acked-by: Lee Jones <lee@kernel.org>

>  drivers/video/fbdev/ssd1307fb.c               |  2 +-
>  include/linux/pwm.h                           | 28 +++++++++----------
>  21 files changed, 67 insertions(+), 67 deletions(-)

[...]

-- 
Lee Jones [李琼斯]
