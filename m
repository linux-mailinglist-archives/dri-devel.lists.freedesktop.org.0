Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5B21DB074
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 12:44:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2895389D8D;
	Wed, 20 May 2020 10:44:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F192589D8D
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 10:44:42 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id u79so1542383vsu.4
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 03:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z8Ed4esVyLwxGK/ed6iQzqE+rcqzfGB1NnWxeSSQtK0=;
 b=LMo7BXsekhXmrXHuaiP1G2MkQ1j914Wla5i0ywG6W9XT0iquGvIPV3BliE8K0E5xc7
 NObMTM0aP22cwtd5HNWPz44lIo1j0IKbRsKmQqMAAiBhyugOEVfLTeZriyknUuhst1Ib
 fx9nFEbo1NA1tz0ATqqVuLzPfI2ztMG3B0zGQgLtsW1xw+goXzOjiE4TPiP88S/wPoi9
 gRb+vlVisdLUGuRyE3URXw+fgu0YrgTPd0KSBTSmjBbpy1M8ii1Shg86dpUc2T3qAL4F
 upyAOzqhccKkVDERI8W7zS4G9haYdfwLAPfz0WvsIT2UJbhwrfv4Zl3Y5PB6Iobxa2OM
 B/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z8Ed4esVyLwxGK/ed6iQzqE+rcqzfGB1NnWxeSSQtK0=;
 b=IusIR8xQ9b1tEGmYRiNWC49sZWO3uyR2WJW3f6NAqSMGr9GTa8PsFA1Et4F7Sbpitf
 18NJBYaPVdTbAY+WA7GgYJx8ibbkKAGxGSTFWUR5iQHk3YT1UO+i75rwJInky08TFRle
 HSaua7tTsHMkcFgeMyfi1vpzXs8DZ+pZ+smuAVKaPsr9M/lrrhSfgxuPx8DVHF8ZdCMM
 rpBVUq4Yi27lOBDeZRre3p8tYVPUmJ0JgvViTcxzcu0HQNFhdSEWlHkfKXLAcLJ82Lv/
 NMWqUqQwV9pHvOlBUp09sQjIlCApGkKcEddMEEUPHk91DM2L1o1DZm8cl8V+5c/3SOWo
 Ne6w==
X-Gm-Message-State: AOAM531hfJnWg9HSyXW9ctLG4CRW0XRQR41z9b9MgBGzVAUFOh6iHJo2
 K84/yjE/5tYYqzyA8I1J4PKDPCf4x+T3WBhbJ9Y=
X-Google-Smtp-Source: ABdhPJyuWRsi6C3bfq5M4MOyQ9byWY9bxWsctP/KplOAKui4DADof0x9My3MNA1jStEseX1SLxjQp7LPJ3e6/IGtfGI=
X-Received: by 2002:a67:ff14:: with SMTP id v20mr2696940vsp.118.1589971481760; 
 Wed, 20 May 2020 03:44:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200517190139.740249-1-sam@ravnborg.org>
 <20200517190139.740249-3-sam@ravnborg.org>
In-Reply-To: <20200517190139.740249-3-sam@ravnborg.org>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 20 May 2020 11:41:46 +0100
Message-ID: <CACvgo50p6M59C-cdwCUFYNE7pWBA-oTwa9EN90yrkOkW2S-BKA@mail.gmail.com>
Subject: Re: [PATCH v2 02/16] backlight: refactor fb_notifier_callback()
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Russell King <linux@armlinux.org.uk>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Andy Gross <agross@kernel.org>,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>, linux-pwm@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Support Opensource <support.opensource@diasemi.com>,
 Jingoo Han <jingoohan1@gmail.com>, Douglas Anderson <dianders@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, patches@opensource.cirrus.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On Sun, 17 May 2020 at 20:02, Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Increase readability of fb_notifier_callback() by removing
> a few indent levels.
> No functional change.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> ---
>  drivers/video/backlight/backlight.c | 43 +++++++++++++++--------------
>  1 file changed, 22 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
> index cac3e35d7630..17f04cff50ab 100644
> --- a/drivers/video/backlight/backlight.c
> +++ b/drivers/video/backlight/backlight.c
> @@ -58,28 +58,29 @@ static int fb_notifier_callback(struct notifier_block *self,
>
>         bd = container_of(self, struct backlight_device, fb_notif);
>         mutex_lock(&bd->ops_lock);
> -       if (bd->ops)
> -               if (!bd->ops->check_fb ||
> -                   bd->ops->check_fb(bd, evdata->info)) {
> -                       fb_blank = *(int *)evdata->data;
> -                       if (fb_blank == FB_BLANK_UNBLANK &&
> -                           !bd->fb_bl_on[node]) {
> -                               bd->fb_bl_on[node] = true;
> -                               if (!bd->use_count++) {
> -                                       bd->props.state &= ~BL_CORE_FBBLANK;
> -                                       bd->props.fb_blank = FB_BLANK_UNBLANK;
> -                                       backlight_update_status(bd);
> -                               }
> -                       } else if (fb_blank != FB_BLANK_UNBLANK &&
> -                                  bd->fb_bl_on[node]) {
> -                               bd->fb_bl_on[node] = false;
> -                               if (!(--bd->use_count)) {
> -                                       bd->props.state |= BL_CORE_FBBLANK;
> -                                       bd->props.fb_blank = fb_blank;
> -                                       backlight_update_status(bd);
> -                               }
> -                       }
> +
> +       if (!bd->ops)
> +               goto out;
> +       if (bd->ops->check_fb && !bd->ops->check_fb(bd, evdata->info))
Mildly related: Would be a nice to define which ops are mandatory and
which aren't.
That plus enforcement in backlight_device_register.

But that's for another patchset.

> +               goto out;
> +
> +       fb_blank = *(int *)evdata->data;
> +       if (fb_blank == FB_BLANK_UNBLANK && !bd->fb_bl_on[node]) {
> +               bd->fb_bl_on[node] = true;
> +               if (!bd->use_count++) {
> +                       bd->props.state &= ~BL_CORE_FBBLANK;
> +                       bd->props.fb_blank = FB_BLANK_UNBLANK;
> +                       backlight_update_status(bd);
> +               }
> +       } else if (fb_blank != FB_BLANK_UNBLANK && bd->fb_bl_on[node]) {
> +               bd->fb_bl_on[node] = false;
> +               if (!(--bd->use_count)) {
> +                       bd->props.state |= BL_CORE_FBBLANK;
> +                       bd->props.fb_blank = fb_blank;
> +                       backlight_update_status(bd);
>                 }
Something like the following reads better, plus one could simplify it
with follow-on patch.

if (fb_blank == FB_BLANK_UNBLANK)
    if (!bd->fb_bl_on[node] && !bd->use_count++) {
        bd->props.state &= ~BL_CORE_FBBLANK;
        bd->props.fb_blank = FB_BLANK_UNBLANK;
        backlight_update_status(bd);
        // above is backlight_enable()
    }
    bd->fb_bl_on[node] = true;
} else {
    if (bd->fb_bl_on[node] && !(--bd->use_count)) {
        bd->props.state |= BL_CORE_FBBLANK;
        bd->props.fb_blank = fb_blank;
        backlight_update_status(bd);
        // above is backlight_disable()
   }
    bd->fb_bl_on[node] = false;
}

As-is, one cannot use the backlight helpers indicated, since it
touches .power. First one should ensure the drivers honour .power - by
using the helper introduced later.

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
