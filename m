Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1651F183603
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 17:20:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C806EAFB;
	Thu, 12 Mar 2020 16:20:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23D2C6E241;
 Thu, 12 Mar 2020 16:20:11 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id g19so8151234eds.11;
 Thu, 12 Mar 2020 09:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4Ri6Zo06xUqVBLdkBsBEWcTBkjmCotOOr1BUmTAsg3I=;
 b=BnsaaGEZXZQ+MIghPu9pi3JdQ7NsQ/HWjMR2ykY98+99wV3F7uFg51Pe0wEK7yJpz/
 2R6hfPm3zcBUhSTeaiYda1p9Tth8EuR53Kzi9+jyWG/UXP7aviVhd2a7Q6jsXd+JzjCO
 AJR+nDOLTxf8X/q7fYHJePc6p60btksElmRuimChlmeYMKS0OckSwuqvU4N1PDBtj38k
 TP0FMELPixK4VwxSfbQ/ab91pCmOGKFn49lX7VIBWYkUG+ukHmrQnaQP2AvsmD4txPZ4
 et1GOipZRQVjfu+f7p9vuSIrYCkf0J8/eFofNs9vZIQ6Mme/IQ79C3Nl1TWDKiCWSKL2
 Vh8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4Ri6Zo06xUqVBLdkBsBEWcTBkjmCotOOr1BUmTAsg3I=;
 b=mjJuR9LidMjj0NlVJx4WbM8AkeK1MbsA2wie5NAyDSc3YVLESEkEOOQeqVA1E0+dWo
 XKjydDACLvIa3ovmei76phdAjJQsWNNA5TydnGkYpMKdjkgtIdQ4JrlxypKlknJdGzun
 1A2beQBtK+keG1GWa6GhjQi8AA9xP/s6PV1FmcjMFOiFKb+XTlmabxYFNBAESxL6pKCH
 ybTMVJP3ffCs3ybc5Kjrf30BQoGfjTmkFpFrsJfklbXjLdXB6/tJRvCwiq1q8tDhamAW
 gssyfxBt0EEx/NfR1ikcpVRPNMSYmzyZH//gKqR2Mt3bgwgEJZzkfH1KEBTbKLFV3MmX
 ugJw==
X-Gm-Message-State: ANhLgQ2xGEQnjmPBgQeLmXTfcb94xfKjFSgmu7qnZHWqRFwYUY7d4JCr
 3hBYw9Z6iE4JcrWi32S1jzcHWBF4G4zmKEBZesk=
X-Google-Smtp-Source: ADFU+vuqPsB7DZGHkjoMD0pTX3OqBychAWWvqgB5t0ZT5bpa1RnqPfQCbA+j1Rn0HkU6vrLllgNLtBCFlaO66DHsWj8=
X-Received: by 2002:a17:906:f1c4:: with SMTP id
 gx4mr5558031ejb.267.1584030009727; 
 Thu, 12 Mar 2020 09:20:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200312035154.1621-1-imirkin@alum.mit.edu>
In-Reply-To: <20200312035154.1621-1-imirkin@alum.mit.edu>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 12 Mar 2020 09:19:58 -0700
Message-ID: <CAF6AEGt4hnMJE=DSAx1754DTV4TJG5L8YocqMjAE1NpNJZaJMg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: avoid double-attaching hdmi/edp bridges
To: Ilia Mirkin <imirkin@alum.mit.edu>
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
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 11, 2020 at 8:52 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>
> Each of hdmi and edp are already attached in msm_*_bridge_init. A second
> attachment returns -EBUSY, failing the driver load.
>
> Tested with HDMI on IFC6410 (APQ8064 / MDP4), but eDP case should be
> analogous.
>
> Fixes: 3ef2f119bd3ed (drm/msm: Use drm_attach_bridge() to attach a bridge to an encoder)
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>

Thanks

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/msm/edp/edp.c   | 4 ----
>  drivers/gpu/drm/msm/hdmi/hdmi.c | 4 ----
>  2 files changed, 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/edp/edp.c b/drivers/gpu/drm/msm/edp/edp.c
> index ad4e963ccd9b..106a67473af5 100644
> --- a/drivers/gpu/drm/msm/edp/edp.c
> +++ b/drivers/gpu/drm/msm/edp/edp.c
> @@ -178,10 +178,6 @@ int msm_edp_modeset_init(struct msm_edp *edp, struct drm_device *dev,
>                 goto fail;
>         }
>
> -       ret = drm_bridge_attach(encoder, edp->bridge, NULL);
> -       if (ret)
> -               goto fail;
> -
>         priv->bridges[priv->num_bridges++]       = edp->bridge;
>         priv->connectors[priv->num_connectors++] = edp->connector;
>
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> index 1a9b6289637d..737453b6e596 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -327,10 +327,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
>                 goto fail;
>         }
>
> -       ret = drm_bridge_attach(encoder, hdmi->bridge, NULL);
> -       if (ret)
> -               goto fail;
> -
>         priv->bridges[priv->num_bridges++]       = hdmi->bridge;
>         priv->connectors[priv->num_connectors++] = hdmi->connector;
>
> --
> 2.24.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
