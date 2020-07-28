Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B372307C7
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 12:37:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B75C6E24D;
	Tue, 28 Jul 2020 10:37:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D24CE6E24D
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 10:37:48 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id a15so17771162wrh.10
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 03:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OZjzAoiWn1HSh0Y0nkJfSNiw0UIfvD0fsceTUq2RuYk=;
 b=a51eZGbm6AIsMwVK6quzrGdo4namqdd/119nT+FhzgTCI1cP2ZXE9xyzrK/Dibox96
 YDt4CzGvuA8BFkl6016hNTW65d2MdXct9rnADduF3Tm7F1000TWXFtnBDgvhHzvpINcC
 x/2/TT7wO4hqryvt80wM3Bz/a0BF49Te3UREiFw+98qdgckjXAUNXeR7LAyM563LdL8H
 t0fRLSOS82X2PRwXm7F3OXswaZIJyyg6VWwUX43rrEsTpA/0A0ZAoAFxwU9Wify7tz9R
 rGgFpoLWs5DorYH8Q4HiE3O/45ZMgSWEIEr6RgJq78b9FKZQ6Z1QbbH6ZEhxt6tbGNLF
 56vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OZjzAoiWn1HSh0Y0nkJfSNiw0UIfvD0fsceTUq2RuYk=;
 b=qz/WkO1pVTvJclCtc9eBNp/QHk7IZx4GKJTxq9Txigj87iLL0jz8u4rk1uD8HBYMKb
 P+FxMgW1DH+Og+fYIjdqvH4K36x69yKo5yqFK6YVrL0dX3rdfPPN07LXTNGuIrh/Xga5
 ZzPQR4V9e50uYbBp0T5IiZzCJeNhLJwgEp/wD0e/s7b6m6gdNtUUCkxuW/SzTGesZ+gg
 /tnV3G2phccHTMATljMnhmNzKKARW13wdP+FBKX5YPSm3tticL3eCED0xgC+mor+ipjG
 Um+E6oDrh9EVcmfcHDeIq1qNjP1DKvjA1lxXjrDSC+H1UbEPja/4fCHKKM2hbMZbcfBG
 dnwg==
X-Gm-Message-State: AOAM531VzVMbYsxCA4zKsBWHFvFvokdKAgL0T5lBc2Vys7RnS2OvKoUm
 pdWMJ1f5ASGid879iEgk0doJqkq2wPVqNha3sRqaEw==
X-Google-Smtp-Source: ABdhPJxWibovrmlX+nW4KlLfNQN5y+/n0cpGK4fLmq/5GvkNGv0NvEq0f6EQqnQZa3H/YJqJNCOOQ0IuE/d+gBI6tto=
X-Received: by 2002:adf:fdce:: with SMTP id i14mr19075246wrs.273.1595932667516; 
 Tue, 28 Jul 2020 03:37:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
 <1fa32b771828098365162a24654c7bbab805500e.1594230107.git-series.maxime@cerno.tech>
In-Reply-To: <1fa32b771828098365162a24654c7bbab805500e.1594230107.git-series.maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 28 Jul 2020 11:37:31 +0100
Message-ID: <CAPY8ntCtj+yMNmnqT+q0AH6sYSLXWa7E=vZoSPGt1Bda1iHEpw@mail.gmail.com>
Subject: Re: [PATCH v4 24/78] drm/vc4: hvs: Make sure our channel is reset
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
> In order to clear our intermediate FIFOs that might end up with a stale
> pixel, let's make sure our FIFO channel is reset everytime our channel is
> setup.

Minor nit pick: s/everytime/every time

> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hvs.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
> index c7de77afbf0a..64b9d72471ef 100644
> --- a/drivers/gpu/drm/vc4/vc4_hvs.c
> +++ b/drivers/gpu/drm/vc4/vc4_hvs.c
> @@ -205,6 +205,10 @@ static int vc4_hvs_init_channel(struct vc4_dev *vc4, struct drm_crtc *crtc,
>         u32 dispbkgndx;
>         u32 dispctrl;
>
> +       HVS_WRITE(SCALER_DISPCTRLX(chan), 0);
> +       HVS_WRITE(SCALER_DISPCTRLX(chan), SCALER_DISPCTRLX_RESET);
> +       HVS_WRITE(SCALER_DISPCTRLX(chan), 0);
> +
>         /* Turn on the scaler, which will wait for vstart to start
>          * compositing.
>          * When feeding the transposer, we should operate in oneshot
> --
> git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
