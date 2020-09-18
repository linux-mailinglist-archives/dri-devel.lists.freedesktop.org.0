Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C5E27013F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 17:43:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60EA46E029;
	Fri, 18 Sep 2020 15:43:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABEF46E029
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 15:43:37 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id y15so6035283wmi.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 08:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M37f+zoKYMPitAdz01Q3nknzIDpePyWcN2edw9RrI4I=;
 b=H5SZAoSDuki2tlVXAs39vO38mbEs8dtXoBHu5XS5OCP36onr2m4TV7d6RUFc67cmYX
 eecEPdda7H8Sy7MldMhyfJErk7oqLoZAqOUXtcGKShfqCGf9F3eSf/iTbisJPhsvOtV3
 /Brby/vFi8SytDO9lYKsnJbmtvqcs+rnSeNfk5Z3CRO447uwo6MBGuPTZ8eum51hxUL4
 /UzNvusd8ARJAktUR/vnAquR1FyNajVjsc/v4nUVzWA37lYJu9sGJRbPQUE8rJMiB2TI
 UWE7kfhjfNhCFsvvDqXqKwg8T+s9W7nMfcjp9ESSDiG+WyUCtiW6kcI8wx5driQKEfqz
 uNVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M37f+zoKYMPitAdz01Q3nknzIDpePyWcN2edw9RrI4I=;
 b=KPdGtc6MB/HqBgvb91g5gn0YAUdWlMpnBPq+Iabs4Eiwys0SXYNNMZSde8sRp8smxu
 PYdrqQ6F4t06c7tyacSDJ5ehq9NzNDdWyYjlRIII2djuun2em4E4eb4Qd+Z9zowsaKYI
 i7/gbQiqVAwlHNjpCeKTXE5402NfoJ5jfJFxl0YuJDGJngk32Mdc6jYFZVv3iYxq5Fef
 esZCCNIeG735I/MVMgl+hvatI5Njd4lnIBaq/Zu52fHSonuHoWpQn5sW+KtKWxo2GaFp
 uYedNyNqBESlYKZ1/iHk6rJBoWQXjF0bHDrG+cq59Ocl0Vo/MR1HWAjLR6ddaakgWtkD
 +USw==
X-Gm-Message-State: AOAM530eowljhG4Ttxl2fvr9JsN4scZviJyIZsclejA7z+txex4Wr3+N
 8YGzfFSFKYPL2OgF5mpjxksOTSM4QMu0F1ggUInjxg==
X-Google-Smtp-Source: ABdhPJxdg78tzwMzDcJoXDiNkQj52MRgcB8bC9FEFmA65wxeMT11rHYj0HCqD3s3Z8NwtpzjdOyu+wW0CTUngDAFQBQ=
X-Received: by 2002:a1c:2543:: with SMTP id l64mr15250644wml.96.1600443816311; 
 Fri, 18 Sep 2020 08:43:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200918145918.101068-1-maxime@cerno.tech>
In-Reply-To: <20200918145918.101068-1-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 18 Sep 2020 16:43:20 +0100
Message-ID: <CAPY8ntAHcPzZqS77-9=4Rz-vpu9=3LL8xM2Kwa28spb1vLHv-w@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/vc4: kms: Assign a FIFO to enabled CRTCs instead
 of active
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
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

Thanks for the patch.

On Fri, 18 Sep 2020 at 15:59, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The HVS has three FIFOs that can be assigned to a number of PixelValves
> through a mux.
>
> However, changing that FIFO requires that we disable and then enable the
> pixelvalve, so we want to assign FIFOs to all the enabled CRTCs, and not
> just the active ones.
>
> Fixes: 87ebcd42fb7b ("drm/vc4: crtc: Assign output to channel automatically")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_kms.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
> index af3ee3dcdab6..01fa60844695 100644
> --- a/drivers/gpu/drm/vc4/vc4_kms.c
> +++ b/drivers/gpu/drm/vc4/vc4_kms.c
> @@ -643,7 +643,7 @@ vc4_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
>                 struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
>                 unsigned int matching_channels;
>
> -               if (!crtc_state->active)
> +               if (!crtc_state->enable)
>                         continue;
>
>                 /*
> --
> 2.26.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
