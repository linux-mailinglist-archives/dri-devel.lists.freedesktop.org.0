Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4428A4212E9
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 17:42:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE453899B5;
	Mon,  4 Oct 2021 15:42:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
 [209.85.222.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73348899B5
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Oct 2021 15:42:47 +0000 (UTC)
Received: by mail-ua1-f47.google.com with SMTP id 64so12648012uab.12
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Oct 2021 08:42:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MQdBFrT4gY5hArjSORJuBxhjfd5fLS9GXe/QptoG1WE=;
 b=6UnMS0lL/EIDk2YMMhCVIajb/AKle3ZqxXy2HpxqzH/PRQdl+o7erYwt8SVNbOnjLd
 IUkbVnFOWvo5rHu44SxB/cBCx+t7IvS5lowb8F3c5bb3+lpXcoLmp8lAAjtcgAbZzQ97
 G7atLWZyELyiXy1OvQje8Epb0rGsiuMp9pq019SV3aj3kxbsyS0iluhrfh8r6LV2iJQj
 hpdiOTtRmtWumn/x0H6J/lfdoD81x4x9RQAPShKHflQLC/ljLuYcoAtRqBainiwhbpp3
 qsh7uab82x6VhaR+HctDSc8LV4iCdgVvpWM6T4RnhSFX9LHsf+4i8FI0Vkzowhnt0Ovm
 mXGw==
X-Gm-Message-State: AOAM531jj+RRi90dwpYOAelp/Y20Xx1z4/RUgttQJp7Nrik+n7i5JZVK
 5YE+17f2MUxtP4sScLGa7rPSAyqanVvtrZFraVU=
X-Google-Smtp-Source: ABdhPJx0vB1rRxvDrREx/zG8/LgZeL2ryBFKT9obtzzKyTnHkzyoBuYlzdLJX5UVe9rEup1mwW9F5wpGlG4jGmIEVAY=
X-Received: by 2002:ab0:311a:: with SMTP id e26mr7219640ual.122.1633362166344; 
 Mon, 04 Oct 2021 08:42:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210914202202.1702601-1-dianders@chromium.org>
 <20210914132020.v5.2.I62e76a034ac78c994d40a23cd4ec5aeee56fa77c@changeid>
In-Reply-To: <20210914132020.v5.2.I62e76a034ac78c994d40a23cd4ec5aeee56fa77c@changeid>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 Oct 2021 17:42:35 +0200
Message-ID: <CAMuHMdWy+aASNevg8nc9LTvR9QNrGYZQnB3sYYLDRfEU1w_idg@mail.gmail.com>
Subject: Re: [PATCH v5 02/15] drm/edid: Break out reading block 0 of the EDID
To: Douglas Anderson <dianders@chromium.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Steev Klimaszewski <steev@kali.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Linus W <linus.walleij@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard <mripard@kernel.org>, 
 Jani Nikula <jani.nikula@intel.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

Hi Douglas,

On Tue, Sep 14, 2021 at 10:23 PM Douglas Anderson <dianders@chromium.org> wrote:
> A future change wants to be able to read just block 0 of the EDID, so
> break it out of drm_do_get_edid() into a sub-function.
>
> This is intended to be a no-op change--just code movement.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Thanks for your patch, which is now commit bac9c29482248b00 ("drm/edid:
Break out reading block 0 of the EDID") in drm-next.

> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -1905,6 +1905,44 @@ int drm_add_override_edid_modes(struct drm_connector *connector)
>  }
>  EXPORT_SYMBOL(drm_add_override_edid_modes);
>
> +static struct edid *drm_do_get_edid_base_block(
> +       int (*get_edid_block)(void *data, u8 *buf, unsigned int block,
> +                             size_t len),
> +       void *data, bool *edid_corrupt, int *null_edid_counter)
> +{
> +       int i;
> +       void *edid;
> +
> +       edid = kmalloc(EDID_LENGTH, GFP_KERNEL);
> +       if (edid == NULL)
> +               return NULL;
> +
> +       /* base block fetch */
> +       for (i = 0; i < 4; i++) {
> +               if (get_edid_block(data, edid, 0, EDID_LENGTH))
> +                       goto out;
> +               if (drm_edid_block_valid(edid, 0, false, edid_corrupt))
> +                       break;
> +               if (i == 0 && drm_edid_is_zero(edid, EDID_LENGTH)) {
> +                       if (null_edid_counter)
> +                               (*null_edid_counter)++;
> +                       goto carp;
> +               }
> +       }
> +       if (i == 4)
> +               goto carp;
> +
> +       return edid;
> +
> +carp:
> +       kfree(edid);
> +       return ERR_PTR(-EINVAL);
> +
> +out:
> +       kfree(edid);
> +       return NULL;
> +}
> +
>  /**
>   * drm_do_get_edid - get EDID data using a custom EDID block read function
>   * @connector: connector we're probing
> @@ -1938,25 +1976,16 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
>         if (override)
>                 return override;
>
> -       if ((edid = kmalloc(EDID_LENGTH, GFP_KERNEL)) == NULL)
> +       edid = (u8 *)drm_do_get_edid_base_block(get_edid_block, data,
> +                                               &connector->edid_corrupt,
> +                                               &connector->null_edid_counter);
> +       if (IS_ERR_OR_NULL(edid)) {
> +               if (IS_ERR(edid))

So edid is an error code, not a valid pointer...

> +                       connector_bad_edid(connector, edid, 1);

... while connector_bad_edid() expects edid to be a valid pointer,
causing a crash:

Unable to handle kernel NULL pointer dereference at virtual address
0000000000000068
Mem abort info:
  ESR = 0x96000004
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x04: level 0 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000004
  CM = 0, WnR = 0
[0000000000000068] user address but active_mm is swapper
Internal error: Oops: 96000004 [#1] PREEMPT SMP
CPU: 0 PID: 7 Comm: kworker/u4:0 Not tainted
5.15.0-rc3-arm64-renesas-00629-geb2d42841024-dirty #1313
Hardware name: Renesas Ebisu-4D board based on r8a77990 (DT)
Workqueue: events_unbound deferred_probe_work_func
pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : connector_bad_edid+0x28/0x1a8
lr : drm_do_get_edid+0x260/0x268
sp : ffff8000121336a0
x29: ffff8000121336a0 x28: ffff00000a373200 x27: 0000000000001ffe
PM: ==== always-on/ee160000.mmc: stop
x26: 0000000000000005 x25: 0000000000000041 x24: 0000000000000000
x23: ffff000008a25080 x22: ffff8000106bd990 x21: ffff0000081496c0
x20: 0000000000000001 x19: ffffffffffffffea x18: 0000000000000010
x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
x8 : 0000000000000000 x7 : 0000000000000080 x6 : ffff000009c71000
x5 : 0000000000000000 x4 : 0000000000000069 x3 : ffff00000a3c2900
x2 : 0000000000000001 x1 : ffffffffffffffea x0 : ffff000009c71000
Call trace:
 connector_bad_edid+0x28/0x1a8
 drm_do_get_edid+0x260/0x268
 adv7511_get_edid+0xb4/0xd0
 adv7511_bridge_get_edid+0x10/0x18

>                 return NULL;
> -
> -       /* base block fetch */
> -       for (i = 0; i < 4; i++) {
> -               if (get_edid_block(data, edid, 0, EDID_LENGTH))
> -                       goto out;
> -               if (drm_edid_block_valid(edid, 0, false,
> -                                        &connector->edid_corrupt))
> -                       break;
> -               if (i == 0 && drm_edid_is_zero(edid, EDID_LENGTH)) {
> -                       connector->null_edid_counter++;
> -                       goto carp;
> -               }
>         }
> -       if (i == 4)
> -               goto carp;
>
> -       /* if there's no extensions, we're done */
> +       /* if there's no extensions or no connector, we're done */
>         valid_extensions = edid[0x7e];
>         if (valid_extensions == 0)
>                 return (struct edid *)edid;
> @@ -2010,8 +2039,6 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
>
>         return (struct edid *)edid;
>
> -carp:
> -       connector_bad_edid(connector, edid, 1);
>  out:
>         kfree(edid);
>         return NULL;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
