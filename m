Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AACC38CCC2
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 19:54:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4A3F6F8AD;
	Fri, 21 May 2021 17:54:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40BB76E7D2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 17:54:38 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id c14so20095206wrx.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 10:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5rHHcqz/pSg+dF4fMTZIEIgL/w6hIgzmKYZhWvb9og4=;
 b=hwvO0oS5iHlghvvUEitNVzEcBlqhR9fDodL1/KXliEqTsFBs/3cS4bgxqPGnihBG/t
 RnD6hDIwXc4DgEeDOpLniRWuBJxG353sRMGI5PthKcbrB+uvYpAx64DhvoQc/CwsO0tW
 ZZwvevQG5H8LCGBPqFKKPhXRc3QmbDjkWKwJosrejTbT+CAJdewVJD1HjfnlZuk4ReXq
 lbL6BOUehocvJF8lG7pI9tAlIPmcthPrPzaLc+uQ0LLmcQrAWS1VcT841vV1I+sWGq56
 cy0Km2a8Twno1adwjOVTEDFDLCBfKxKpmv0KvPpa6IMd3DIjYD1KqyZwqRp3vHSDH2ye
 kbbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5rHHcqz/pSg+dF4fMTZIEIgL/w6hIgzmKYZhWvb9og4=;
 b=SIzHebPkmC9Jri281D4vRLfHPjzTR7U0z5+oYY7cpW8BN1N8ZRadMrqp3CcZvM8bkZ
 tahjld6T34VbEKyw+db88fbxI+WMwp2QPJRzg3ThPL2Rpe7EST8mwSlXjfE0p8m3rcsx
 yy5s4NGNRD6sY6q2X9U+EkJ2yZ1GncPvVro5OMJpx3HClZM7LNozzQrm5pvuOR31lVXI
 ziqE58NZO2WMjZ/Nsoda6ddL7Fv3kyNIHdyZ5PgFWa7why9vVQb6qGvYCVMYimfwGO5b
 wNvHc/NeTDSiK/QOacvwbANQZMEU1hN1bMyop4JqwaiY8vQt8fK3Oml+1hfBlY2Vr4mi
 Lb1w==
X-Gm-Message-State: AOAM532xMA3m0bJg8Zv+MsN60pdZDN6EbgOuAoh2gQgR5tQML/TIBTbV
 CgDOOYUe/5wo2lHje/1SKH9+S+oFgZW2o/S3kpv/Kg==
X-Google-Smtp-Source: ABdhPJz6Whci0uUbleXzP3RlbdqRHSYAEycNljrlvUB6tTvssvEuldYxUtRTtrpcyO8m+7RP1E/fHZX4AlWjSLaYD7Y=
X-Received: by 2002:adf:f751:: with SMTP id z17mr10786261wrp.150.1621619676980; 
 Fri, 21 May 2021 10:54:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210507150515.257424-1-maxime@cerno.tech>
 <20210507150515.257424-5-maxime@cerno.tech>
In-Reply-To: <20210507150515.257424-5-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 21 May 2021 18:54:20 +0100
Message-ID: <CAPY8ntDZeqHGLX1-ypC83v+-tEwOC1Z6N4eNg3d_WwzJ39NbXw@mail.gmail.com>
Subject: Re: [PATCH v4 04/12] drm/vc4: crtc: Fix vc4_get_crtc_encoder logic
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Fri, 7 May 2021 at 16:05, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The vc4_get_crtc_encoder function currently only works when the
> connector->state->crtc pointer is set, which is only true when the
> connector is currently enabled.
>
> However, we use it as part of the disable path as well, and our lookup
> will fail in that case, resulting in it returning a null pointer we
> can't act on.
>
> We can access the connector that used to be connected to that crtc
> though using the old connector state in the disable path.
>
> Since we want to support both the enable and disable path, we can
> support it by passing the state accessor variant as a function pointer,
> together with the atomic state.
>
> Fixes: 792c3132bc1b ("drm/vc4: encoder: Add finer-grained encoder callbacks")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_crtc.c | 21 ++++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
> index 8a19d6c76605..36ea684a349b 100644
> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> @@ -262,14 +262,22 @@ static u32 vc4_crtc_get_fifo_full_level_bits(struct vc4_crtc *vc4_crtc,
>   * allows drivers to push pixels to more than one encoder from the
>   * same CRTC.
>   */
> -static struct drm_encoder *vc4_get_crtc_encoder(struct drm_crtc *crtc)
> +static struct drm_encoder *vc4_get_crtc_encoder(struct drm_crtc *crtc,
> +                                               struct drm_atomic_state *state,
> +                                               struct drm_connector_state *(*get_state)(struct drm_atomic_state *state,
> +                                                                                        struct drm_connector *connector))
>  {
>         struct drm_connector *connector;
>         struct drm_connector_list_iter conn_iter;
>
>         drm_connector_list_iter_begin(crtc->dev, &conn_iter);
>         drm_for_each_connector_iter(connector, &conn_iter) {
> -               if (connector->state->crtc == crtc) {
> +               struct drm_connector_state *conn_state = get_state(state, connector);
> +
> +               if (!conn_state)
> +                       continue;
> +
> +               if (conn_state->crtc == crtc) {
>                         drm_connector_list_iter_end(&conn_iter);
>                         return connector->encoder;
>                 }
> @@ -292,7 +300,8 @@ static void vc4_crtc_config_pv(struct drm_crtc *crtc, struct drm_atomic_state *s
>  {
>         struct drm_device *dev = crtc->dev;
>         struct vc4_dev *vc4 = to_vc4_dev(dev);
> -       struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc);
> +       struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc, state,
> +                                                          drm_atomic_get_new_connector_state);
>         struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
>         struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
>         const struct vc4_pv_data *pv_data = vc4_crtc_to_vc4_pv_data(vc4_crtc);
> @@ -407,7 +416,8 @@ static int vc4_crtc_disable(struct drm_crtc *crtc,
>                             struct drm_atomic_state *state,
>                             unsigned int channel)
>  {
> -       struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc);
> +       struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc, state,
> +                                                          drm_atomic_get_old_connector_state);
>         struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
>         struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
>         struct drm_device *dev = crtc->dev;
> @@ -507,7 +517,8 @@ static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
>  {
>         struct drm_device *dev = crtc->dev;
>         struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
> -       struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc);
> +       struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc, state,
> +                                                          drm_atomic_get_new_connector_state);
>         struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
>
>         require_hvs_enabled(dev);
> --
> 2.31.1
>
