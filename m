Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B3A3E3B1A
	for <lists+dri-devel@lfdr.de>; Sun,  8 Aug 2021 17:29:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2282489B01;
	Sun,  8 Aug 2021 15:29:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E10EB89B01
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Aug 2021 15:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1628436578;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=Xo5z8Fn+SltMLL04pMqFkZRQFAXy/ruqbXV6MhAwFYw=;
 b=K2+h427U0zlskFL0emrv4Z20XmtmhcSUd7aHFYCC3+sOAPun2gRr5Ni5N7/WuZ6ShE
 z3LXHYPrR3Ojjn8cCLmt/S1s5x5fGo2XXistkwvQ9JfpmNvEv+H+hTqz5BXHlzc0C2GP
 +qMqE4TouttdO3Yvdej+7FR0mFNvS9Z9Evhd2TrMNaTFK/eceMKP/kkujWDyfiElQ1C+
 nUWC+WHY2M8Y+JkfMT9bZiB313klNTTME4EM+3pZ2zykyHISMvDUf3xxaFQU/1R9B2g8
 qMsvBQqmCx94TvJORVfurBTUJzfC6yKCJpJgYC7KOyvPt1bwXhH+4MfGTWN9JmPZ+k+x
 sEQw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u261EJF5OxJD4peA8p6E1A=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 47.31.0 DYNA|AUTH)
 with ESMTPSA id L01e9cx78FTbLv5
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sun, 8 Aug 2021 17:29:37 +0200 (CEST)
Date: Sun, 8 Aug 2021 17:29:30 +0200
From: Stephan Gerhold <stephan@gerhold.net>
To: Shawn Guo <shawn.guo@linaro.org>
Cc: Konrad Dybcio <konradybcio@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/panel: Add Truly NT35521 panel driver
Message-ID: <YQ/4WkA9ajpQx06A@gerhold.net>
References: <20210804081352.30595-1-shawn.guo@linaro.org>
 <20210804081352.30595-3-shawn.guo@linaro.org>
 <YQqDb5eFqIx8tvAL@gerhold.net> <20210808134456.GB6795@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210808134456.GB6795@dragon>
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

On Sun, Aug 08, 2021 at 09:44:57PM +0800, Shawn Guo wrote:
> On Wed, Aug 04, 2021 at 02:09:19PM +0200, Stephan Gerhold wrote:
> > On Wed, Aug 04, 2021 at 04:13:52PM +0800, Shawn Guo wrote:
> > > + ...
> > > +	nt_dcs_write(0xb1, 0x6c, 0x21);
> > > +	nt_dcs_write(0xf0, 0x55, 0xaa, 0x52, 0x00, 0x00);
> > > +	nt_dcs_write(0x35, 0x00);
> > > +	nt_gen_write(0x11, 0x00);
> > > +	msleep(120);
> > > +	nt_gen_write(0x29, 0x00);
> > > +	usleep_range(1000, 1500);
> > > +	nt_dcs_write(0x53, 0x24);
> > 
> > Did you mix up "nt_dcs_write" and "nt_gen_write" here?
> > The nt_gen_write(0x11, 0x00); looks like MIPI_DCS_EXIT_SLEEP_MODE
> > and the nt_gen_write(0x29, 0x00); looks like MIPI_DCS_SET_DISPLAY_ON.
> > 
> > For reference you can pull your original reference DTB from Sony through
> > my panel driver generator: https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator
> 
> Wow, very nice!  It really deserves wider spread!
> 
> > 
> > It produces the following (I compiled "msm8939-kanuti_tulip.dtb"
> > from https://github.com/sonyxperiadev/kernel/tree/aosp/LA.BR.1.3.3_rb2.14,
> > not sure if that is right):
> > 
> > 	// ...
> > 	dsi_generic_write_seq(dsi, 0x35, 0x00);
> > 
> > 	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
> > 	if (ret < 0) {
> > 		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
> > 		return ret;
> > 	}
> > 	msleep(120);
> > 
> > 	ret = mipi_dsi_dcs_set_display_on(dsi);
> > 	if (ret < 0) {
> > 		dev_err(dev, "Failed to set display on: %d\n", ret);
> > 		return ret;
> > 	}
> > 	usleep_range(1000, 2000);
> > 
> > 	dsi_generic_write_seq(dsi, 0x53, 0x24);
> > 
> > Which also suggests that generic and DCS writes are mixed up here.
> > 
> > Note however that you could not use the generated driver as-is,
> > because Sony seems to use their own display driver instead of Qualcomm's
> > and some things seem to be different.
> 
> I re-created the driver using your generator.  With modeling the 5v
> control GPIOs with regulators and adding backlight-gpios support, the
> driver works quite nicely, except the following two problems:
> 
> 1) I have to drop the MIPI_DSI_MODE_LPM configuration from .update_status
>    hook. Otherwise brightness did not get updated to panel.
> 
> ---8<------
> diff --git a/drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c b/drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c
> index 31e5f942a039..eba926c6f722 100644
> --- a/drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c
> +++ b/drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c
> @@ -420,33 +420,23 @@ static int truly_nt35521_bl_update_status(struct backlight_device *bl)
>         u16 brightness = backlight_get_brightness(bl);
>         int ret;
>  
> -       dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> -
>         ret = mipi_dsi_dcs_set_display_brightness(dsi, brightness);
>         if (ret < 0)
>                 return ret;
>  
> -       dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> -
>         return 0;
>  }
> ------>8---
> 

I have to admit I don't know much about Low Power Mode vs High Speed
Mode. As long it works it is good I guess :-)

> 2) The driver works good, if the kernel is launched via "fastboot boot".
>    But if the kernel is flashed to eMMC and launched by bootloader with
>    splash screen, kernel will fail to bring up the panel.  After kernel
>    boots up, a blank & unblank cycle can get panel work though.
> 
> The problem 2) is not driver generator related.  @Konrad, did you see
> it on asus-z00t-tm5p5-n35596 driver?
> 

Do you have CONFIG_DRM_MSM=y (built-in) instead of =m (module) maybe?
I think a similar issue exists on MSM8916 but it does not happen
for some reason if CONFIG_DRM_MSM=m instead of =y. Somehow having it
load later during the boot process fixes some things there.

Thanks,
Stephan
