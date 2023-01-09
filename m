Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE60466233D
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 11:32:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A029D10E3CD;
	Mon,  9 Jan 2023 10:32:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com
 [IPv6:2607:f8b0:4864:20::e2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28F310E3CD
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 10:32:53 +0000 (UTC)
Received: by mail-vs1-xe2c.google.com with SMTP id 3so8090081vsq.7
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 02:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HG1EBP5y9ccRxvLO1fx1xbReFeFjuMxeUoDDtyCUWMA=;
 b=efGLwc3OAfzNE2E1Nz97beiexHdD/S486shc0iAWBhaaQ84dyyLYAJQxX8x94mhJ5m
 EUE7fLQ8Pce0SYXuGrfMDkei9O7PV+O3q0BwQDy7xxo7yYvMUakcrhd/Hui9VolcfJbA
 UNjqw6Q86j+Nl6A6ZPxln3MA6ejGdBR6TSg6wPZ+q44u+Q5WaSMej+bsDcCyrn/tslId
 MKFEgQLi0mBfCh0CPAyU1Gt3iUr0bDdfP0jyh3t/VG1RdkPigGoRPCwr5yKC7QmQZB+P
 d20lJ66lS0potRePakGv+HP55XFZaSyarSD7XI1sKPoUUDKkG8PiUZAv7GZ+HUPBPoDG
 qB7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HG1EBP5y9ccRxvLO1fx1xbReFeFjuMxeUoDDtyCUWMA=;
 b=dRkKHm1b9q01qcXpxEUFB+IJ2TnSgynzAHtilWNZ+zWqeVx49o9M8qjcOrlEcXuXvw
 lKTcQ6v1/P+adQNbOJB+0ElZ1DcypE1Ispum01QKVAht+KFAseTsoGKqItFHxjuhHddL
 pvK9s0BUnocXG5Id+1Fuew5xogCT6WfbnnEB6vcYvWi0XphGgy3z+CWAlMCgArAt08rx
 GrYXiB/gbDzhUFfMfY3FkABmDeQtqwbMGSWRORkLT50q1AsdYxl/+AA2MndyfKc/aJG+
 k2fnGUevx2s3y8DaxbVQtO2PG0y+ET7adszGhwvhVvZU+q2sf/wH6oyKz7puuiWU/tPV
 FbDA==
X-Gm-Message-State: AFqh2krcf0STI4QmE4q8B6OtyKCOXqF/YPHbFaADUkgnKLmIcEPsXz1v
 diw3/t3sg+k8trSIkoi3gkmg04xDMvewAKhL7i95SDpD2qndFQ==
X-Google-Smtp-Source: AMrXdXsJOVB10ql2VCnWdFa4hlkIU+1tI0ArpGkJtnno2x2SvStjRUyMtY8zRp/9COAk1Bnnxnb6YDHvZPoTSdbYJyg=
X-Received: by 2002:a05:6102:3108:b0:3c8:e71a:61ff with SMTP id
 e8-20020a056102310800b003c8e71a61ffmr7691861vsh.23.1673260373013; Mon, 09 Jan
 2023 02:32:53 -0800 (PST)
MIME-Version: 1.0
References: <20221207-rpi-hvs-crtc-misc-v1-0-1f8e0770798b@cerno.tech>
 <20221207-rpi-hvs-crtc-misc-v1-8-1f8e0770798b@cerno.tech>
In-Reply-To: <20221207-rpi-hvs-crtc-misc-v1-8-1f8e0770798b@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 9 Jan 2023 10:32:37 +0000
Message-ID: <CAPY8ntDmSKB-u2FNALeGgh2bZwxDfPXGnP1kV4LnGT_NrZ-4Wg@mail.gmail.com>
Subject: Re: [PATCH 08/15] drm/vc4: hvs: Ignore atomic_flush if we're disabled
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
Cc: Emma Anholt <emma@anholt.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Eric Anholt <eric@anholt.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Wed, 7 Dec 2022 at 11:55, Maxime Ripard <maxime@cerno.tech> wrote:
>
> atomic_flush will be called for each CRTC even if they aren't enabled.
>
> The whole code we have there will thus run without a properly affected
> channel, which can then result in all sorts of weird behaviour.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hvs.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
> index 3582ede1a0aa..5fadbf219542 100644
> --- a/drivers/gpu/drm/vc4/vc4_hvs.c
> +++ b/drivers/gpu/drm/vc4/vc4_hvs.c
> @@ -579,6 +579,9 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
>                 return;
>         }
>
> +       if (vc4_state->assigned_channel == VC4_HVS_CHANNEL_DISABLED)
> +               return;
> +
>         if (debug_dump_regs) {
>                 DRM_INFO("CRTC %d HVS before:\n", drm_crtc_index(crtc));
>                 vc4_hvs_dump_state(hvs);
>
> --
> 2.38.1
