Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C81868711
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 03:28:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AF4310E649;
	Tue, 27 Feb 2024 02:28:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tfZG4LaD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBC3310E649
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 02:28:43 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-607bfa4c913so37699597b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 18:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709000922; x=1709605722; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XAVC2O8s1iUmh8KQv0O2JZAD88RsKV5A8vS2LeefpzI=;
 b=tfZG4LaDkss9QgpjbsNzdY/ASWThdG5T99J0e/jYcMqN4L2j+L2ONLYB1WmsnWq6LA
 gSGqAGlWYVnFvSYmIHTe18lB2XKgd4WpTMtD913MIwOwZrWPgwER+tSHdHGAcfI7K1rf
 FLonjBJAzcgfXznbgJ8N2f3ci5k7vD8zoPrSdapgWSEzSbeU5vKw4CuM0MWhgGmR0/tH
 2/SP7cdu8feavzV12IF4ivzXRsm2LWy3LeeR+r/5yg7UAVtWLSsTxGlzWQazN9UY0D/T
 KWHIcdk5VB8oSIaZflL6GnpZMUXoiUNg+DV4NK2OgI1HNPZEM8cKNZP8upG2sMVQNc8P
 gkPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709000922; x=1709605722;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XAVC2O8s1iUmh8KQv0O2JZAD88RsKV5A8vS2LeefpzI=;
 b=MRaLre3U/R18Igow711MZoBB9/kuTNvoCNp0MhImQ7C7qRJolJgCOoQXuIXRrQUB+g
 M16w6AlL0T35yob/8Wg00we79fEDQmjgXVVe9xIOQZO0LyVSMcGdJya9ziVen/pI7Wlk
 k7Yc9jnYfkegTdoz+d777aVvIyvAPBvuynZ85uluj55bh8XvNG2GZ3Qrw8sMhlkE60J8
 AAUH+koeT5+g0l6qFx3Tt2Y82qsX/d01Br0ToWlMJpGBbObFd19Jo2yTiY1DyXGxybbD
 Dz/eM2rVXQtUZpxwNEeNZhT6DmdX/ZuxHZqaWExfPCXya+Wk8M1jvdcjriUh4ByPXhnB
 gGrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtyGorQsNakjJSMLFiKRv5r46sBwKNrun3OBEeQWUAtkWOv3qQnTet2TRo8yUCXvt1OkEsko8YaBG9SCmtu8eyDX+l3xBilHdOhTq1BXrY
X-Gm-Message-State: AOJu0Yyji2C0sAznv8+BfDgcpykKHtNW6dqe5anxFCKmcm182uiFvPRl
 I0BhM+0JYx0Wq3BL7JUGM1CcInvNfUc/9DpI8jBWuYJCZZh5rD0kDyh/viue8dry/gaxLDuCGIM
 3CNXrjkuet0Q6s+nBYboZ/jPLVGzy5eI6ranWdQ==
X-Google-Smtp-Source: AGHT+IEJZmKxPHJfJTilEO3vsxmovuF2Xw6qItC6/DQpu6WaZopaBrkRcTD6MSJNKHUlioZSye0ybLoXHGMmHnHmphE=
X-Received: by 2002:a25:a383:0:b0:dcc:383b:e48d with SMTP id
 e3-20020a25a383000000b00dcc383be48dmr1002565ybi.26.1709000922566; Mon, 26 Feb
 2024 18:28:42 -0800 (PST)
MIME-Version: 1.0
References: <20240223223958.3887423-1-hsinyi@chromium.org>
 <20240223223958.3887423-3-hsinyi@chromium.org>
In-Reply-To: <20240223223958.3887423-3-hsinyi@chromium.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 27 Feb 2024 04:28:31 +0200
Message-ID: <CAA8EJpq2GkJnV52bS2WOQkvKQKw8mR4607nGz8pOon0FwysnWQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panel: panel-edp: Match with panel hash for
 overridden modes
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Sat, 24 Feb 2024 at 00:40, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> It's found that some panels have variants that they share the same panel id
> although their EDID and names are different. One of the variants requires
> using overridden modes to resolve glitching issue as described in commit
> 70e0d5550f5c ("drm/panel-edp: Add auo_b116xa3_mode"). Other variants should
> use the modes parsed from EDID.
>
> For example, AUO 0x405c B116XAK01.0, it has at least 2 different variants
> that EDID and panel name are different, but using the same panel id. One of
> the variants require using overridden mode. Same case for AUO 0x615c
> B116XAN06.1.
>
> Add such entries and use the hash of the EDID to match the panel needs the
> overridden modes.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 52 +++++++++++++++++++++++++++----
>  1 file changed, 46 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> index f6ddbaa103b5..42c430036846 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -21,6 +21,7 @@
>   * DEALINGS IN THE SOFTWARE.
>   */
>
> +#include <linux/crc32.h>
>  #include <linux/debugfs.h>
>  #include <linux/delay.h>
>  #include <linux/gpio/consumer.h>
> @@ -213,6 +214,9 @@ struct edp_panel_entry {
>         /** @panel_id: 32-bit ID for panel, encoded with drm_edid_encode_panel_id(). */
>         u32 panel_id;
>
> +       /** @panel_hash: the CRC32 hash of the EDID base block. */
> +       u32 panel_hash;
> +
>         /** @delay: The power sequencing delays needed for this panel. */
>         const struct panel_delay *delay;
>
> @@ -758,13 +762,13 @@ static void panel_edp_parse_panel_timing_node(struct device *dev,
>                 dev_err(dev, "Reject override mode: No display_timing found\n");
>  }
>
> -static const struct edp_panel_entry *find_edp_panel(u32 panel_id);
> +static const struct edp_panel_entry *find_edp_panel(u32 panel_id, u32 panel_hash);
>
>  static int generic_edp_panel_probe(struct device *dev, struct panel_edp *panel)
>  {
>         struct panel_desc *desc;
>         void *base_block;
> -       u32 panel_id;
> +       u32 panel_id, panel_hash;
>         char vend[4];
>         u16 product_id;
>         u32 reliable_ms = 0;
> @@ -796,15 +800,17 @@ static int generic_edp_panel_probe(struct device *dev, struct panel_edp *panel)
>         base_block = drm_edid_get_base_block(panel->ddc);
>         if (base_block) {
>                 panel_id = drm_edid_get_panel_id(base_block);
> +               panel_hash = crc32_le(~0, base_block, EDID_LENGTH) ^ 0xffffffff;
>                 kfree(base_block);
>         } else {
>                 dev_err(dev, "Couldn't identify panel via EDID\n");
>                 ret = -EIO;
>                 goto exit;
>         }
> +
>         drm_edid_decode_panel_id(panel_id, vend, &product_id);
>
> -       panel->detected_panel = find_edp_panel(panel_id);
> +       panel->detected_panel = find_edp_panel(panel_id, panel_hash);
>
>         /*
>          * We're using non-optimized timings and want it really obvious that
> @@ -1006,6 +1012,19 @@ static const struct panel_desc auo_b101ean01 = {
>         },
>  };
>
> +static const struct drm_display_mode auo_b116xa3_mode = {
> +       .clock = 70589,
> +       .hdisplay = 1366,
> +       .hsync_start = 1366 + 40,
> +       .hsync_end = 1366 + 40 + 40,
> +       .htotal = 1366 + 40 + 40 + 32,
> +       .vdisplay = 768,
> +       .vsync_start = 768 + 10,
> +       .vsync_end = 768 + 10 + 12,
> +       .vtotal = 768 + 10 + 12 + 6,
> +       .flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> +};
> +
>  static const struct drm_display_mode auo_b116xak01_mode = {
>         .clock = 69300,
>         .hdisplay = 1366,
> @@ -1926,11 +1945,13 @@ static const struct panel_delay delay_200_500_e50_po2e200 = {
>         .delay = _delay \
>  }
>
> -#define EDP_PANEL_ENTRY2(vend_chr_0, vend_chr_1, vend_chr_2, product_id, _delay, _name, _mode) \
> +#define EDP_PANEL_ENTRY2(vend_chr_0, vend_chr_1, vend_chr_2, product_id, \
> +                        _hash, _delay, _name, _mode) \
>  { \
>         .name = _name, \
>         .panel_id = drm_edid_encode_panel_id(vend_chr_0, vend_chr_1, vend_chr_2, \
>                                              product_id), \
> +       .panel_hash = _hash, \
>         .delay = _delay, \
>         .override_edid_mode = _mode \
>  }
> @@ -2077,13 +2098,32 @@ static const struct edp_panel_entry edp_panels[] = {
>         { /* sentinal */ }
>  };
>
> -static const struct edp_panel_entry *find_edp_panel(u32 panel_id)
> +/*
> + * Similar to edp_panels, this table lists panel variants that require using
> + * overridden modes but have the same panel id as one of the entries in edp_panels.
> + *
> + * Sort first by vendor, then by product ID.
> + */
> +static const struct edp_panel_entry edp_panels_variants[] = {

I'd suggest keeping these entries in the main table. Otherwise it
becomes harder to note, which setting gets used.

> +       EDP_PANEL_ENTRY2('A', 'U', 'O', 0x405c, 0xa9951478, &auo_b116xak01.delay,
> +                        "B116XAK01.0", &auo_b116xa3_mode),
> +       EDP_PANEL_ENTRY2('A', 'U', 'O', 0x615c, 0x109b75b3, &delay_200_500_e50,
> +                        "B116XAN06.1", &auo_b116xa3_mode),
> +
> +       { /* sentinal */ }
> +};
> +
> +static const struct edp_panel_entry *find_edp_panel(u32 panel_id, u32 panel_hash)
>  {
>         const struct edp_panel_entry *panel;
>
> -       if (!panel_id)
> +       if (!panel_id || !panel_hash)
>                 return NULL;
>
> +       for (panel = edp_panels_variants; panel->panel_id; panel++)
> +               if (panel->panel_id == panel_id && panel->panel_hash == panel_hash)
> +                       return panel;
> +
>         for (panel = edp_panels; panel->panel_id; panel++)
>                 if (panel->panel_id == panel_id)
>                         return panel;
> --
> 2.44.0.rc0.258.g7320e95886-goog
>


-- 
With best wishes
Dmitry
