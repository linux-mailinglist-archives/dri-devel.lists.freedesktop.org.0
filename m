Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A1727003F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 16:53:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F80D6ED09;
	Fri, 18 Sep 2020 14:53:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B57CD6ED09
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 14:53:12 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id b79so5865290wmb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 07:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=viYwu6NmRmZuwa+gjxKJL8QDXOAJFFADgJFOa40fY+8=;
 b=G7l0jUmZniUm5H0CjftWlhJk43VzwSHJxjbppFtrka9WfhtrIPAnPUgX4aE/6zAu/H
 2Fu/UklnxuLJeRrEOt8cmyjbPVqrRnQtRAsrHjB0tducIEqpXGATLna/RPGg5P2MgjxK
 FccYwwyLs6RExmQ3nKn8w8I+MmCDP4AECImgWt3H4wWY2pQgtRUYDK9mMH1JgbBJ9bpe
 OdZ2+eaJploX6E172wTZq7RmKFSreD0DH5lZ2CgDgVzrLG/S3kr2wDcwVGcarEju9aMm
 v5+J69O3okOXbAoC74A0D47CUY7td02tVqjTCzoc+CticsVend0qO5MQzQhvwN2Tcw3s
 5U1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=viYwu6NmRmZuwa+gjxKJL8QDXOAJFFADgJFOa40fY+8=;
 b=TsajRcBWPn3kDuFDUv81mr3nx80cUzhRW3d9bSbbu6jjWp0s901HQIw0s3dJfysX/x
 NjPwBkYcEy59rgZwZDSdAA8Ns53bM3HO9icaVTbkXsS0RIjN8yS+gdxxgN0Rks0N9MCh
 2TdlcAmMuOMLCAbXp+diKCWMLZg8pmhpPV1afkLZxExmbMPtW2Ahsdu3mhfvNYx0c3t8
 4a5WYhqQXHTwdUmT+JLigbCmL9b9VPF/9y5N+m5UDkZXguqEVPZNt8ppFYOoojxL7moM
 NEJ6dfB1DSynGCkf/jhWgtyAzpfLOR3J4y9PgHLmH9IXcb97sqO8AZOcCFMNRPV4ozhC
 uQ2Q==
X-Gm-Message-State: AOAM5324EPN9QuriYcYNp5ivGNvqmu1XV589Qzg7tvGTTNkP+72sZHZT
 zYwTiT+z6Mu7lplkVB3TqBIYiVngGtkcNI2SQDinwA==
X-Google-Smtp-Source: ABdhPJyq+K9CHWyMq3dGtAdjHXE2PaONrSwB2Uv839HJju2l2JR8ffUVcE+kkCgl9WT+xtqCKPTk/oqo/yC73G+jglo=
X-Received: by 2002:a7b:cd05:: with SMTP id f5mr15690273wmj.116.1600440791321; 
 Fri, 18 Sep 2020 07:53:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200917121623.42023-1-maxime@cerno.tech>
In-Reply-To: <20200917121623.42023-1-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 18 Sep 2020 15:52:55 +0100
Message-ID: <CAPY8ntDG9fDZ6WwreTCMk_2GedqtDAvQuRD6iiM_YUeEbtS9+Q@mail.gmail.com>
Subject: Re: [PATCH] drm/vc4: hvs: Pull the state of all the CRTCs prior to PV
 muxing
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
 DRI Development <dri-devel@lists.freedesktop.org>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Thu, 17 Sep 2020 at 13:16, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The vc4 display engine has a first controller called the HVS that will
> perform the composition of the planes. That HVS has 3 FIFOs and can
> therefore compose planes for up to three outputs. The timings part is
> generated through a component called the Pixel Valve, and the BCM2711 has 6
> of them.
>
> Thus, the HVS has some bits to control which FIFO gets output to which
> Pixel Valve. The current code supports that muxing by looking at all the
> CRTCs in a new DRM atomic state in atomic_check, and given the set of
> contraints that we have, assigns FIFOs to CRTCs or reject the mode

s/contraints/constraints

> entirely. The actual muxing will occur during atomic_commit.
>
> However, that doesn't work if only a fraction of the CRTCs' state is
> updated in that state, since it will ignore the CRTCs that are kept running
> unmodified, and will thus unassign its associated FIFO, and later disable
> it.

Yup, that would surely mess things up :)

> In order to make the code work as expected, let's pull the CRTC state of
> all the enabled CRTC in our atomic_check so that we can operate on all the
> running CRTCs, no matter whether they are affected by the new state or not.
>
> Cc: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> Fixes: 87ebcd42fb7b ("drm/vc4: crtc: Assign output to channel automatically")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Thanks
  Dave

> ---
>  drivers/gpu/drm/vc4/vc4_kms.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
> index 16e233e1406e..af3ee3dcdab6 100644
> --- a/drivers/gpu/drm/vc4/vc4_kms.c
> +++ b/drivers/gpu/drm/vc4/vc4_kms.c
> @@ -620,6 +620,23 @@ vc4_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
>         struct drm_crtc *crtc;
>         int i, ret;
>
> +       /*
> +        * Since the HVS FIFOs are shared across all the pixelvalves and
> +        * the TXP (and thus all the CRTCs), we need to pull the current
> +        * state of all the enabled CRTCs so that an update to a single
> +        * CRTC still keeps the previous FIFOs enabled and assigned to
> +        * the same CRTCs, instead of evaluating only the CRTC being
> +        * modified.
> +        */
> +       list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
> +               if (!crtc->state->enable)
> +                       continue;
> +
> +               crtc_state = drm_atomic_get_crtc_state(state, crtc);
> +               if (IS_ERR(crtc_state))
> +                       return PTR_ERR(crtc_state);
> +       }
> +
>         for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
>                 struct vc4_crtc_state *vc4_crtc_state =
>                         to_vc4_crtc_state(crtc_state);
> --
> 2.26.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
