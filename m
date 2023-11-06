Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1A07E2E3E
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 21:33:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4124C10E3FA;
	Mon,  6 Nov 2023 20:33:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C163910E3FA
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 20:33:12 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-54394328f65so8213436a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Nov 2023 12:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1699302790; x=1699907590;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yu558aCQ58tOsOXlyTwpsX2dRSxkRn2ndl7ZRwGGxrQ=;
 b=Vb2/02SdT2E8MHamfLzBBHBLXNcae43WQy7HqYFMz1TDmK05WtiRBxmwK5zbLmHEm2
 mqYVKk7+7oyFE7qGbLVl/k/T9kg+FbsTyG3ZgT5f1O7uPrghcXFIfWYk3jsEx3ERye2j
 vn+MBvAcPj0dgeEqzufLSd7TjTo+voqIH8u0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699302790; x=1699907590;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yu558aCQ58tOsOXlyTwpsX2dRSxkRn2ndl7ZRwGGxrQ=;
 b=osR1Qc/LwlwDMsL0SPoz5/2gPe6nH5dKhvy46G/irgCh8zogwMr5xbBmH5rCTbF+a6
 tLNQSljCZNiiQsiYPOn0UBT+C1MBNeVmF0vt8NzLdPcUajZSGXmZhijPa/nli1kWq5CD
 ZKA5Ho+MY0ltkXJFHxmi2ClyIjT45j00w1T+seQ8hEw1EhgNhcOeA6ixdBZv2VmgAuXK
 vZPAvIS8MuwtkkloVZOWkUPY7tvpIwcwpAevq0A22IYD59m+5aujSsQDW2U907Eg+CFS
 K46j0i2/JZoNJ5jV+srI51PyKMgrBQuIN5PPXM7OEO4rBtWM6YVPSX9uQPrY/w/jQU2w
 WGwg==
X-Gm-Message-State: AOJu0Yzf7pWny0qh0FojKtypQYS4+ajpKD+gtMU8CHb+xxqOVo2hlqV1
 B4zLHf30Qm8gbbtYcx8qN8V0T77ZgrTA8BwsWeuOs0yU
X-Google-Smtp-Source: AGHT+IG/5RzX3LKmN1xXEx7humfQrclSiX2bfBUZKl+LTLJh452pTguQKv69ZPr00wj/6BTLx4uNNw==
X-Received: by 2002:a50:aacf:0:b0:543:bf55:248b with SMTP id
 r15-20020a50aacf000000b00543bf55248bmr13349337edc.13.1699302790045; 
 Mon, 06 Nov 2023 12:33:10 -0800 (PST)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com.
 [209.85.128.45]) by smtp.gmail.com with ESMTPSA id
 y93-20020a50bb66000000b0053e6e40cc1asm4823577ede.86.2023.11.06.12.33.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Nov 2023 12:33:09 -0800 (PST)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-40837124e1cso21055e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Nov 2023 12:33:09 -0800 (PST)
X-Received: by 2002:a05:600c:5104:b0:409:222d:87d2 with SMTP id
 o4-20020a05600c510400b00409222d87d2mr39925wms.4.1699302789261; Mon, 06 Nov
 2023 12:33:09 -0800 (PST)
MIME-Version: 1.0
References: <20231106202718.2770821-1-hsinyi@chromium.org>
 <20231106202718.2770821-4-hsinyi@chromium.org>
In-Reply-To: <20231106202718.2770821-4-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 6 Nov 2023 12:32:52 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WZS0ADX+0MyK3W75BkJ6qcohbj0ZC5CvnT0gedx0z0gg@mail.gmail.com>
Message-ID: <CAD=FV=WZS0ADX+0MyK3W75BkJ6qcohbj0ZC5CvnT0gedx0z0gg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] drm/panel-edp: Avoid adding multiple preferred
 modes
To: Hsin-Yi Wang <hsinyi@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Nov 6, 2023 at 12:27=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org> =
wrote:
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 0fb439b5efb1..54dbbdf62ec0 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -594,8 +594,20 @@ static int panel_edp_get_modes(struct drm_panel *pan=
el,
>                                       p->detected_panel !=3D ERR_PTR(-EIN=
VAL) &&
>                                       p->detected_panel->override_edid_mo=
de;
>
> -       /* probe EDID if a DDC bus is available */
> -       if (p->ddc) {
> +       /*
> +        * If both edid and hard-coded modes exists, only add hard-coded =
modes
> +        * to avoid multiple preferred modes.
> +        */
> +       if (p->desc->num_timings || p->desc->num_modes) {
> +               /*
> +                * Add hard-coded panel modes. Don't call this if there a=
re no
> +                * timings and no modes (the generic edp-panel case) beca=
use it
> +                * will clobber the display_info that was already set by
> +                * drm_add_edid_modes().
> +                */
> +               num +=3D panel_edp_get_non_edid_modes(p, connector);
> +       } else if (p->ddc) {
> +               /* probe EDID if a DDC bus is available */

As per discussion in v2, I think if you have the "ddc" you still want
to fetch the EDID, you just don't want to add the modes from the EDID.
This will mean that the EDID is present in sysfs if userspace wants to
look at it for whatever reason.

-Doug
