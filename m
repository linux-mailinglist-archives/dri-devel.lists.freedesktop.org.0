Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D60161E4D31
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 20:41:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58EB7898E1;
	Wed, 27 May 2020 18:41:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49F12898E1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 18:41:37 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id w10so30260119ljo.0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 11:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=80e9RnD9Ss8eOafGm0SPCkZYoQv72dsa4vHL2CNUsTI=;
 b=QN1siCcUywmiFL5b2l7OO2oJrFZjy0oVoG39jF8U3zH1k9rEEmuBmleEe7rSCXVq9b
 QDK/ZQZSsIFtjtyqvUKUGZpDAKKGE4YXN8HrzpU0lJnDxfXUnAFWPaerCMwA/UkQaGq6
 NV6pwJVvRp8hgN5+JK1UdeoLeCp6e0a+/V5iE7yug/9UO4hqzlfLKMTtQBJjCHMPkpgM
 gSOMNRg8jwdPUo7jOdYjVE95+JviMtUNl2EJK784jiP4U2WAA6mUOgpjejHB3we1xTko
 lpHOf2J4ipaoutCd2b80OURfvWweVQlY47Ga3y1MboXT4o7ZqhvVwpWG0R0EOVn86EpA
 5Adw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=80e9RnD9Ss8eOafGm0SPCkZYoQv72dsa4vHL2CNUsTI=;
 b=aipzvy4TOjWSifbsGogaDiLIS0qKOIuHRvQtEH0pI5hBgPIwFnqsFeCOJV9Dtd57jW
 jrqFFU7uMO4NNalE/bHTfTuTgFfgu0eZnuPSiN35ziNXunX8wE3D83PtmcZXXjCN94Ej
 gnF6pzKr800lfZOPvh43EOtbPlgmMoxrZNe/ZZSGitLyX4w5apFqf7IIfVO8r4TNT/3T
 GBISFkvR1alZDZ8H0wIgbS35M4lTwcZgLGYQe0A0mEcQqgB98oX+XPWlpLtFkbbjwOtW
 wFCWSqClb4d8r/PgYqN9qjurVJ1IHOJledryyluYEj8aES9PzKJnF8Zb45ydCths6MVx
 PM4A==
X-Gm-Message-State: AOAM530+hPU5n285T8dsxFlE3CmVJ35VYA1Rn0ush6EcGnEa3nOPA7ba
 +rN87Ui0Rq6rD26pLMk8ZbaK4mRPZcgcNwcojd6adw==
X-Google-Smtp-Source: ABdhPJzW+yK0neVV5ZLXfHZuKdL2m3iIwiXaA8c97nSmT8Xer0u16SBA/+K8iU8H0iefWgDrIbwvO/Ns2eUMghYcqCI=
X-Received: by 2002:a2e:8186:: with SMTP id e6mr3868617ljg.252.1590604895724; 
 Wed, 27 May 2020 11:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
 <020de18840a1075b2671736c6cc2e451030fad74.1590594512.git-series.maxime@cerno.tech>
In-Reply-To: <020de18840a1075b2671736c6cc2e451030fad74.1590594512.git-series.maxime@cerno.tech>
From: Eric Anholt <eric@anholt.net>
Date: Wed, 27 May 2020 11:41:24 -0700
Message-ID: <CADaigPXJ0BnMUp=XN6G92Tx=H9j55pmsBAujO2mcpiiTs-RHnQ@mail.gmail.com>
Subject: Re: [PATCH v3 070/105] drm/vc4: hdmi: rework connectors and encoders
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 27, 2020 at 8:51 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> the vc4_hdmi driver has some custom structures to hold the data it needs to
> associate with the drm_encoder and drm_connector structures.
>
> However, it allocates them separately from the vc4_hdmi structure which
> makes it more complicated than it needs to be.
>
> Move those structures to be contained by vc4_hdmi and update the code
> accordingly.


> @@ -1220,7 +1219,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
>         struct drm_device *drm = dev_get_drvdata(master);
>         struct vc4_dev *vc4 = drm->dev_private;
>         struct vc4_hdmi *hdmi;
> -       struct vc4_hdmi_encoder *vc4_hdmi_encoder;
> +       struct drm_encoder *encoder;
>         struct device_node *ddc_node;
>         u32 value;
>         int ret;
> @@ -1229,14 +1228,10 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
>         if (!hdmi)
>                 return -ENOMEM;
>
> -       vc4_hdmi_encoder = devm_kzalloc(dev, sizeof(*vc4_hdmi_encoder),
> -                                       GFP_KERNEL);
> -       if (!vc4_hdmi_encoder)
> -               return -ENOMEM;
> -       vc4_hdmi_encoder->base.type = VC4_ENCODER_TYPE_HDMI0;
> -       hdmi->encoder = &vc4_hdmi_encoder->base.base;
> -
>         hdmi->pdev = pdev;
> +       encoder = &hdmi->encoder.base.base;
> +       encoder->base.type = VC4_ENCODER_TYPE_HDMI0;

Wait, does this patch build?  setting struct drm_encoder->base.type =
VC4_* seems very wrong, when previously we were setting struct
vc4_hdmi_encoder->base.type (struct vc4_encoder->type).

Other than this, patch 68-78 r-b.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
