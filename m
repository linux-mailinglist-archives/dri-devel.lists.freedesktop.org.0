Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F26DC8B4484
	for <lists+dri-devel@lfdr.de>; Sat, 27 Apr 2024 08:23:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AB1510E15F;
	Sat, 27 Apr 2024 06:23:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.b="Y9mcYoAG";
	dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="+oB1trl1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod3-cph3.one.com
 (mailrelay4-1.pub.mailoutpod3-cph3.one.com [46.30.211.243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16EF710E15F
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Apr 2024 06:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=o3ztep49Ehxc1xACAdWujM2rDNv4v9W5wVN14aJWpYI=;
 b=Y9mcYoAGUZoEpJWZ6llUKEQdpvh2klBCROuKOzWUgxSccEdlIzGO4qrToBJGeKlqU5o1MBJ0T1IZj
 a44jqfUcSgMqUCzF17sPULSqVYklnyb60Fm40K1coT5Vfr4kvPv8xc6RYOUsCBAkRvVYH8tW7rVqb0
 4yQxOCz+IMT5j9grCYwGX/F/kYl79FI4lBhk6RjB5mz/PES8Y0xWVZj3qF3M9C+wAhR+OLih6Qqubn
 vPS8M0MJH+Aa7Iuic+Am9NxhZSi3DUsTM7JL8GTcXzqmNr5gE8ekPSRwiWTdxru9+yM04KEP0CyAMO
 3kxVV/pc/CgoaiK3yMmCEA1tmCnwn5Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=o3ztep49Ehxc1xACAdWujM2rDNv4v9W5wVN14aJWpYI=;
 b=+oB1trl1r5wfA2halqR7rs3G6kyYMFkHyGPhOfrJoRa1G04kKkBVgVWBkbVvzkVyIR4DiREUdAjsl
 O17LwuPAw==
X-HalOne-ID: 75b798e8-045e-11ef-ae42-591fce59e039
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay4.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
 id 75b798e8-045e-11ef-ae42-591fce59e039;
 Sat, 27 Apr 2024 06:22:05 +0000 (UTC)
Date: Sat, 27 Apr 2024 08:22:02 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Douglas Anderson <dianders@chromium.org>
Cc: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Linus Walleij <linus.walleij@linaro.org>,
 lvzhaoxiong@huaqin.corp-partner.google.com,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Hsin-Yi Wang <hsinyi@google.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Joel Selvaraj <jo@jsfamily.in>,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/8] drm/mipi-dsi: Fix theoretical int overflow in
 mipi_dsi_dcs_write_seq()
Message-ID: <20240427062202.GA1137299@ravnborg.org>
References: <20240426235857.3870424-1-dianders@chromium.org>
 <20240426165839.v2.1.I30fa4c8348ea316c886ef8a522a52fed617f930d@changeid>
 <CAA8EJpog5yn5kiabJOZRipTx--onH9cepPe0dD4nA=Hm0aZS+g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpog5yn5kiabJOZRipTx--onH9cepPe0dD4nA=Hm0aZS+g@mail.gmail.com>
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

On Sat, Apr 27, 2024 at 04:44:33AM +0300, Dmitry Baryshkov wrote:
> On Sat, 27 Apr 2024 at 02:59, Douglas Anderson <dianders@chromium.org> wrote:
> >
> > The mipi_dsi_dcs_write_seq() macro makes a call to
> > mipi_dsi_dcs_write_buffer() which returns a type ssize_t. The macro
> > then stores it in an int and checks to see if it's negative. This
> > could theoretically be a problem if "ssize_t" is larger than "int".
> >
> > To see the issue, imagine that "ssize_t" is 32-bits and "int" is
> > 16-bits, you could see a problem if there was some code out there that
> > looked like:
> >
> >   mipi_dsi_dcs_write_seq(dsi, cmd, <32767 bytes as arguments>);
> >
> > ...since we'd get back that 32768 bytes were transferred and 32768
> > stored in a 16-bit int would look negative.
> >
> > Though there are no callsites where we'd actually hit this (even if
> > "int" was only 16-bit), it's cleaner to make the types match so let's
> > fix it.
> >
> > Fixes: 2a9e9daf7523 ("drm/mipi-dsi: Introduce mipi_dsi_dcs_write_seq macro")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> > Changes in v2:
> > - New
> >
> >  include/drm/drm_mipi_dsi.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> > index 82b1cc434ea3..b3576be22bfa 100644
> > --- a/include/drm/drm_mipi_dsi.h
> > +++ b/include/drm/drm_mipi_dsi.h
> > @@ -337,12 +337,12 @@ int mipi_dsi_dcs_get_display_brightness_large(struct mipi_dsi_device *dsi,
> >         do {                                                               \
> >                 static const u8 d[] = { cmd, seq };                        \
> >                 struct device *dev = &dsi->dev;                            \
> > -               int ret;                                                   \
> > +               ssize_t ret;                                               \
> >                 ret = mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));    \
> >                 if (ret < 0) {                                             \
> >                         dev_err_ratelimited(                               \
> >                                 dev, "sending command %#02x failed: %d\n", \
> > -                               cmd, ret);                                 \
> > +                               cmd, (int)ret);                            \
> 
> Please consider using %zd instead

Hi Douglas,
please consider the above for all the pathces, there are more places
where a cast can be dropped.

	Sam
