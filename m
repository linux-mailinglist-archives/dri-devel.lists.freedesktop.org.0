Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0099B3B9B08
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 05:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 113876EC84;
	Fri,  2 Jul 2021 03:29:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 965366EC84
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 03:29:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0DAF9613D6;
 Fri,  2 Jul 2021 03:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625196579;
 bh=6nJgAHxobBNh+qHTCsGxe4N62dWVAzhzZ6xFRFsU7C4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UcS2bHAPu2oXaGHqNrmz7bR3MKPTI7WRx9pTG1LyfMigE2mouH+GpNXjLxWvL8j9J
 S5RAyBnvGlEauVCanobOO4pol4RPI3FDfhfPF3SP13AlEWpxox2HyBxLyE+ayZB7xf
 GV8GYW5EaZv/m5psNE7owGXz1+We5BobpE9BlnWlUwaOifYIR29AAYVu3acy0IU/i4
 +hBqBSxcIzJZVXNabKAfg5jbSDg99fV0Bnv4KH+YSVbNF+B5f1RKvwsWS/hYdDWfG2
 1wmM+HGjx2dKhilaw4D5F8OrwAIXPPb/oD2hQR++/0vcQmdbXQSPXCUElL/qfg9xz5
 0ov4hymTBycqg==
Date: Thu, 1 Jul 2021 20:29:34 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 2/2] drm/vc4: hdmi: Convert to gpiod
Message-ID: <YN6IHun9G3Kfzf8G@Ryzen-9-3900X.localdomain>
References: <20210524131852.263883-1-maxime@cerno.tech>
 <20210524131852.263883-2-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210524131852.263883-2-maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Eric Anholt <eric@anholt.net>,
 Hans Verkuil <hans.verkuil@cisco.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 24, 2021 at 03:18:52PM +0200, Maxime Ripard wrote:
> The new gpiod interface takes care of parsing the GPIO flags and to
> return the logical value when accessing an active-low GPIO, so switching
> to it simplifies a lot the driver.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 24 +++++++-----------------
>  drivers/gpu/drm/vc4/vc4_hdmi.h |  3 +--
>  2 files changed, 8 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index ccc6c8079dc6..34622c59f6a7 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -159,10 +159,9 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
>  	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
>  	bool connected = false;
>  
> -	if (vc4_hdmi->hpd_gpio) {
> -		if (gpio_get_value_cansleep(vc4_hdmi->hpd_gpio) ^
> -		    vc4_hdmi->hpd_active_low)
> -			connected = true;
> +	if (vc4_hdmi->hpd_gpio &&
> +	    gpiod_get_value_cansleep(vc4_hdmi->hpd_gpio)) {
> +		connected = true;
>  	} else if (drm_probe_ddc(vc4_hdmi->ddc)) {
>  		connected = true;
>  	} else if (HDMI_READ(HDMI_HOTPLUG) & VC4_HDMI_HOTPLUG_CONNECTED) {
> @@ -1993,7 +1992,6 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
>  	struct vc4_hdmi *vc4_hdmi;
>  	struct drm_encoder *encoder;
>  	struct device_node *ddc_node;
> -	u32 value;
>  	int ret;
>  
>  	vc4_hdmi = devm_kzalloc(dev, sizeof(*vc4_hdmi), GFP_KERNEL);
> @@ -2031,18 +2029,10 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
>  	/* Only use the GPIO HPD pin if present in the DT, otherwise
>  	 * we'll use the HDMI core's register.
>  	 */
> -	if (of_find_property(dev->of_node, "hpd-gpios", &value)) {
> -		enum of_gpio_flags hpd_gpio_flags;
> -
> -		vc4_hdmi->hpd_gpio = of_get_named_gpio_flags(dev->of_node,
> -							     "hpd-gpios", 0,
> -							     &hpd_gpio_flags);
> -		if (vc4_hdmi->hpd_gpio < 0) {
> -			ret = vc4_hdmi->hpd_gpio;
> -			goto err_put_ddc;
> -		}
> -
> -		vc4_hdmi->hpd_active_low = hpd_gpio_flags & OF_GPIO_ACTIVE_LOW;
> +	vc4_hdmi->hpd_gpio = devm_gpiod_get_optional(dev, "hpd", GPIOD_IN);
> +	if (IS_ERR(vc4_hdmi->hpd_gpio)) {
> +		ret = PTR_ERR(vc4_hdmi->hpd_gpio);
> +		goto err_put_ddc;
>  	}
>  
>  	vc4_hdmi->disable_wifi_frequencies =
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
> index 060bcaefbeb5..2688a55461d6 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> @@ -146,8 +146,7 @@ struct vc4_hdmi {
>  	/* VC5 Only */
>  	void __iomem *rm_regs;
>  
> -	int hpd_gpio;
> -	bool hpd_active_low;
> +	struct gpio_desc *hpd_gpio;
>  
>  	/*
>  	 * On some systems (like the RPi4), some modes are in the same
> -- 
> 2.31.1

Hi Maxime,

This patch as commit 6800234ceee0 ("drm/vc4: hdmi: Convert to gpiod")
causes my Raspberry Pi 3 to lock up shortly after boot in combination
with commit 411efa18e4b0 ("drm/vc4: hdmi: Move the HSM clock enable to
runtime_pm"). The serial console and ssh are completely unresponsive and
I do not see any messages in dmesg with "debug ignore_loglevel". The
device is running with a 32-bit kernel (multi_v7_defconfig) with 32-bit
userspace. If there is any further information that I can provide,
please let me know.

Cheers,
Nathan
