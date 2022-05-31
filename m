Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B855397B7
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 22:03:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C1210E0A7;
	Tue, 31 May 2022 20:03:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 508F910E692
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 20:03:35 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id x62so7165589ede.10
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 13:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VeXRYquwBdQ1dOZMflf5nsQE+opZ3d34q51TacEF7HA=;
 b=XuZGseWjCdQCUpLS7SWx2X04gT9YVCZqwuF0O3a7BrK7scNXHX2Pml9WwshUdl5VkY
 aIC0pGpDEEEg1XCkAz3YScYnYGWVcrZhAa01mvHgfLyWtgES/O8bj8YwxPaWHWiFG5RH
 JpfoXo7eKL8C7fYzSGLdyfQp7ZXU7EO+3Qd3+Z+mUzaTeCxZNVZ4STp0XazAq2aZ5ohY
 8u51PbmoCd8sbikiANJVhCKkhLhIxyNjPxg4H4aFnAekHmz0TwaXFs22aOt5vetk5pEb
 a7KzE6z0jh43w3F2gnNfMAdv4T/h5fE54520BL7miy3XFym4oBBaf/qG/H8NOhsThB9A
 e1Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VeXRYquwBdQ1dOZMflf5nsQE+opZ3d34q51TacEF7HA=;
 b=6mbzaSalpPNQDU72IjoR8GgqQ6+N1HyT3bvN/uUIdEA951QeoFceYTcudk+nFw75q3
 9vostoL62dmy7sIrlSQph9m37ZBKlOn+Jg1zFJhRNjHJe7tkdG+zE51oVrS0wuoqhZvJ
 yYpL7r1ryJBPEVxjwvdT1BeAwuqRbcxOGYSxtaB6YYu4n/bfLXT99GzTPPXtNlJr/mwn
 woGJaraM/XP1SoByvZDeKiarmYvAvr0kzqRcKDIR6FapDsR27uRy5fSCxB0ujyytxMXo
 VPRSK3urfU5P4aCyGAGvTe7uv1MZYikWY0R2nEZ/1k7Ou67Hdq2ll7/rdGfTrS8jqGO8
 atlA==
X-Gm-Message-State: AOAM533E+XN0ySLweqPrOn5msNiYaOb83zggRhB/lDAw31oCN4gMJTWF
 1uHOIjAnS3oxfwZcGasHceuKazpyl/HkIJ3UOas=
X-Google-Smtp-Source: ABdhPJwjVOUsvRdeo5FK73NryLg6a7micfi5ToPTE2Sq7rMy5xFF/f8eN3aQLibNcx6ds/c/F7VnYcaMymS5mq+P96A=
X-Received: by 2002:a05:6402:254a:b0:42b:6c9a:c06c with SMTP id
 l10-20020a056402254a00b0042b6c9ac06cmr47415245edb.199.1654027413836; Tue, 31
 May 2022 13:03:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220531144818.26943-1-linmq006@gmail.com>
 <20220531144818.26943-2-linmq006@gmail.com>
In-Reply-To: <20220531144818.26943-2-linmq006@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 31 May 2022 22:03:23 +0200
Message-ID: <CAFBinCANaU4Tk42j-GDBWwUDk39_XiCfeu4D9vGFjFc_G4PZGQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/meson: encoder_hdmi: Fix refcount leak in
 meson_encoder_hdmi_init
To: Miaoqian Lin <linmq006@gmail.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

first of all: thank you for spotting this and sending a patch!

On Tue, May 31, 2022 at 4:49 PM Miaoqian Lin <linmq006@gmail.com> wrote:
[...]
> diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> index 5e306de6f485..f3341458f8b7 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> @@ -363,6 +363,7 @@ int meson_encoder_hdmi_init(struct meson_drm *priv)
>         }
>
>         meson_encoder_hdmi->next_bridge = of_drm_find_bridge(remote);
> +       of_node_put(remote);
further down in the same function remote is used again:
  pdev = of_find_device_by_node(remote);

My understanding is that we should only use of_node_put() once we
don't need to access the node (in this case the variable is "remote")
anymore.


Best regards,
Martin
