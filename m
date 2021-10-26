Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8027143BC64
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 23:29:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BE2789C1B;
	Tue, 26 Oct 2021 21:28:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3590189C1B
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 21:28:57 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id m63so1010404ybf.7
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 14:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MededdR+juQ13yGNOGeK0uexSJWnvAp1kcIewWh2eLQ=;
 b=VjzyyTWvDNaSRucg992Q9KO0s04B1dUPhTg8JsH7gGpG8/9JKgrpf5xFAv8yKZDXD4
 virhKTaJqSw35lj17a32xWK+LeU9It9zqAx9KVbjhTJ33chCrk0Dl1KN31VrJaqALMYy
 jz3ly0NwfGZOhtjvX05ax/BPl3OIfZPOYK1eY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MededdR+juQ13yGNOGeK0uexSJWnvAp1kcIewWh2eLQ=;
 b=luvb7DbYHKPgokjBPKwJUJUDVfxmcpqQQIFG0NEYT9QS1kQQzrcbhFJGvNRQekdKUg
 xMmOPMsdNdzNaAJxs+tqKFtQy/pdruoeoXlFmOFXIkB/x7znVNNSUdxX0muRZadRtzGp
 euOKz9GKfn7mIvqbBCQHeidaBaButQF+NYxY8t7bQg1IhFH+NS1ie6L7QbOf87hSCFaw
 d29b3V6BQk/dBVzu8HRDUv2DYY4YxoCPjFCEhTrw4yjr2w3LGID1bSX5d10ksBwN+dBe
 pjnKl3l33ZH3uUQen2N5xRJPtKZYKE5mb+kB3RLJE+ZsIrN4d1zaemKE1sLghYZBsvQw
 8U5g==
X-Gm-Message-State: AOAM533sWx3U62ZwA3gNo1wGeHjhcNgXpT5QTycbe9TFAhO5i2AnYjOB
 4imbphTrzUnyDrlwlyZdmQUgWSyLtn3d7KujwRt7n+nbAbA=
X-Google-Smtp-Source: ABdhPJxehfs8PicOsBKeHutdeu6REmvRTScjDEis7tasjXdIqMhcua6vEAQZIePHRRTGSHCurIAfxhHJOMs70XCW+Qg=
X-Received: by 2002:a25:ae1a:: with SMTP id a26mr4404931ybj.217.1635283736333; 
 Tue, 26 Oct 2021 14:28:56 -0700 (PDT)
MIME-Version: 1.0
References: <20211026121058.v3.1.I9d81c3b44f350707b5373d00524af77c4aae862b@changeid>
 <CAE-0n50C82He9KCyXRTQGwQxqS6CWhm3w6Vv-5ayKYEfZyt-jg@mail.gmail.com>
In-Reply-To: <CAE-0n50C82He9KCyXRTQGwQxqS6CWhm3w6Vv-5ayKYEfZyt-jg@mail.gmail.com>
From: Philip Chen <philipchen@chromium.org>
Date: Tue, 26 Oct 2021 14:28:44 -0700
Message-ID: <CA+cxXhm848QENcTkcKRDPhUQZMgA=O40a9BTfuuktPjBhYJdFA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/bridge: parade-ps8640: Enable runtime power
 management
To: Stephen Boyd <swboyd@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, dianders@chromium.org, 
 Andrzej Hajda <a.hajda@samsung.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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

Hi

On Tue, Oct 26, 2021 at 12:36 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Philip Chen (2021-10-26 12:11:09)
> > Fit ps8640 driver into runtime power management framework:
> >
> > First, break _poweron() to 3 parts: (1) turn on power and wait for
> > ps8640's internal MCU to finish init (2) check panel HPD (which is
> > proxied by GPIO9) (3) the other configs. As runtime_resume() can be
> > called before panel is powered, we only add (1) to _resume() and leave
> > (2)(3) to _pre_enable(). We also add (2) to _aux_transfer() as we want
> > to ensure panel HPD is asserted before we start AUX CH transactions.
> >
> > Second, the original driver has a mysterious delay of 50 ms between (2)
> > and (3). Since Parade's support can't explain what the delay is for,
> > and we don't see removing the delay break any boards at hand, remove
> > the delay to fit into this driver change.
> >
> > In addition, rename "powered" to "pre_enabled" and don't check for it
> > in the pm_runtime calls. The pm_runtime calls are already refcounted
> > so there's no reason to check there. The other user of "powered",
> > _get_edid(), only cares if pre_enable() has already been called.
> >
> > Lastly, change some existing DRM_...() logging to dev_...() along the
> > way, since DRM_...() seem to be deprecated in [1].
> >
> > [1] https://patchwork.freedesktop.org/patch/454760/
> >
> > Signed-off-by: Philip Chen <philipchen@chromium.org>
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> > Changes in v3:
> > - Fix typo/wording in the commit message.
> > - Add ps8640_aux_transfer_msg() for AUX operation. In
> >   ps8640_aux_transfer(), wrap around ps8640_aux_transfer_msg()
> >   with PM operations and HPD check.
> > - Document why autosuspend_delay is set to 500ms.
> >
> >  drivers/gpu/drm/bridge/parade-ps8640.c | 186 +++++++++++++++----------
> >  1 file changed, 115 insertions(+), 71 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
> > index 3aaa90913bf8..ac42a3473770 100644
> > --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> > +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> > @@ -9,6 +9,7 @@
> >  #include <linux/i2c.h>
> >  #include <linux/module.h>
> >  #include <linux/of_graph.h>
> > +#include <linux/pm_runtime.h>
> >  #include <linux/regmap.h>
> >  #include <linux/regulator/consumer.h>
> >
> > @@ -100,7 +101,7 @@ struct ps8640 {
> >         struct regulator_bulk_data supplies[2];
> >         struct gpio_desc *gpio_reset;
> >         struct gpio_desc *gpio_powerdown;
> > -       bool powered;
> > +       bool pre_enabled;
> >  };
> >
> >  static const struct regmap_config ps8640_regmap_config[] = {
> > @@ -148,8 +149,29 @@ static inline struct ps8640 *aux_to_ps8640(struct drm_dp_aux *aux)
> >         return container_of(aux, struct ps8640, aux);
> >  }
> >
> > -static ssize_t ps8640_aux_transfer(struct drm_dp_aux *aux,
> > -                                  struct drm_dp_aux_msg *msg)
> > +static void ps8640_ensure_hpd(struct ps8640 *ps_bridge)
>
> static int ps8640_ensure_hpd?
Oops, this change was mis-added to the patch on top of this one.
I'll fix it in v4...

>
> > +{
> > +       struct regmap *map = ps_bridge->regmap[PAGE2_TOP_CNTL];
> > +       struct device *dev = &ps_bridge->page[PAGE2_TOP_CNTL]->dev;
> > +       int status;
> > +       int ret;
> > +
> > +       /*
> > +        * Apparently something about the firmware in the chip signals that
> > +        * HPD goes high by reporting GPIO9 as high (even though HPD isn't
> > +        * actually connected to GPIO9).
> > +        */
> > +       ret = regmap_read_poll_timeout(map, PAGE2_GPIO_H, status,
> > +                               status & PS_GPIO9, 20 * 1000, 200 * 1000);
> > +
> > +       if (ret < 0)
> > +               dev_warn(dev, "HPD didn't go high: %d\n", ret);
> > +
> > +       return ret;
> > +}
> > +
> > +static ssize_t ps8640_aux_transfer_msg(struct drm_dp_aux *aux,
> > +                                      struct drm_dp_aux_msg *msg)
> >  {
> >         struct ps8640 *ps_bridge = aux_to_ps8640(aux);
> >         struct regmap *map = ps_bridge->regmap[PAGE0_DP_CNTL];
>
> Otherwise
>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
