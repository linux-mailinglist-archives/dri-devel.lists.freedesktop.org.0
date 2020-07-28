Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBDE2307D5
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 12:40:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2788C6E25D;
	Tue, 28 Jul 2020 10:40:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C2316E25D
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 10:40:55 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id a5so7816559wrm.6
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 03:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lnyqa9+3UN7p5XZc/yQA8t0Ef1omNto0wwGE8iK64Ps=;
 b=e3aiC4Ga9fB5qgGr4vSAQOSNMC2YJanljK0xzwO/FP4PPvt4fKWeox5e9QSIaR9h96
 IbzHkgQBD67HcVVpAT47x4pZJXUzgKMfdJlOxVMfudCxZyMV0H898UN41v99WtdO3FXg
 5y2BC0wmfHDqg/T0lvaFMrwADmgBol2r9uPe+XHXoBpp5gdJqNKp7s8cDbQv82rk7iBn
 HO+sWneuhPvWCe9pdI2njLORejD4fY2xkXz8bODjpslSW65Cj22z/lxln2Lg+enHw4Gz
 fkihrFRGvRXdQDemmYZoELVUnUzb1ZKsGVAZYFfq3lGyEmGQzKxGxzaEfhuZBqlXRq6c
 8+dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lnyqa9+3UN7p5XZc/yQA8t0Ef1omNto0wwGE8iK64Ps=;
 b=WqCAo8Dg1QLRt1e0rFMRUWHZ12CmqE7lAfNhvMJAR1rtFRh53WbG2Kekf3t2sFaJ+7
 byJXerKTXN+g9j1ySRbGLDAkmkGrl3zeyAXufVIomPMo9m/tTH/C6WUHrHwzEk1qTu8I
 ZcX+kodp2otM/XRz6ybbQceqZj94Xk2aX2nnE0UxGX90A0xbj6dx/CEh0MSUG1+ZdFMc
 OW2mbapaxSVp2h/bQq/UqCYEW97E4ltQ2yfxzL3X6hzeNEHKPVp631ZHnhDFpQMVBqSl
 +3VquAubdCJkx0rjgyXYB+DofRNFtSCkS9SfcrkpLci61lHy6sYgVBPigviIew0Nf6zk
 N90A==
X-Gm-Message-State: AOAM533qXAYQcEBjEYugmmMPF6Owwm+v8zdEv/EPKAPMJKVZG8TFr/a5
 VtTwomrnIXsPq9QI7C8y2OWbn6dON1SD/Qwd0b+m0Q==
X-Google-Smtp-Source: ABdhPJwkPgquSiZ/upn1u2Q3I/tb+BHEawcLufuM8QtrW8LQqxXEhYjzDPG3DmSmELIhw4QHnc6qRbH4fzIAr0B2i1Q=
X-Received: by 2002:a5d:6681:: with SMTP id l1mr23292071wru.47.1595932854229; 
 Tue, 28 Jul 2020 03:40:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
 <03aa26eb5be1c558e3048a3b4ff3214856d5c490.1594230107.git-series.maxime@cerno.tech>
In-Reply-To: <03aa26eb5be1c558e3048a3b4ff3214856d5c490.1594230107.git-series.maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 28 Jul 2020 11:40:37 +0100
Message-ID: <CAPY8ntDeMAuDb1ZWj59+14ZQVqDjM7X+E312Lymm0P8LHFx0Yg@mail.gmail.com>
Subject: Re: [PATCH v4 27/78] drm/vc4: crtc: Move HVS channel init before the
 PV initialisation
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
Cc: Tim Gover <tim.gover@raspberrypi.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Wed, 8 Jul 2020 at 18:43, Maxime Ripard <maxime@cerno.tech> wrote:
>
> In order to avoid stale pixels getting stuck in an intermediate FIFO
> between the HVS and the pixelvalve on BCM2711, we need to configure the HVS
> channel before the pixelvalve is reset and configured.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_crtc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
> index 2c5ff45dc315..b7b0e19e2fe1 100644
> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> @@ -427,10 +427,6 @@ static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
>
>         require_hvs_enabled(dev);
>
> -       vc4_crtc_config_pv(crtc);
> -
> -       CRTC_WRITE(PV_CONTROL, CRTC_READ(PV_CONTROL) | PV_CONTROL_EN);
> -
>         /* Enable vblank irq handling before crtc is started otherwise
>          * drm_crtc_get_vblank() fails in vc4_crtc_update_dlist().
>          */
> @@ -438,6 +434,10 @@ static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
>
>         vc4_hvs_atomic_enable(crtc, old_state);
>
> +       vc4_crtc_config_pv(crtc);
> +
> +       CRTC_WRITE(PV_CONTROL, CRTC_READ(PV_CONTROL) | PV_CONTROL_EN);
> +
>         /* When feeding the transposer block the pixelvalve is unneeded and
>          * should not be enabled.
>          */
> --
> git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
