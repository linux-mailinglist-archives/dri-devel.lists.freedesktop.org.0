Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D74CD217467
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 18:49:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 775A96E075;
	Tue,  7 Jul 2020 16:48:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 118A46E075
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 16:48:58 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id p20so47247238ejd.13
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jul 2020 09:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zgVTJRvD9bwxe5h5OvimEh3WdUQa6jrydlK+z8ViyTs=;
 b=zVxRNPDq7ABzlflkDXevx/FhRX3DMHNv1OPOprmzo5mnbqWnTdiXr3GZ9aWg1o3S99
 kfIbw7eX93DpOe60uBJ1MCq69J4i2kwjsfBHFiQSBpFsRGqoP+Xw8vUEiubYxSvh9eKd
 rEEvMukKP+CiCbPiwrg0eVAIXy72RK2BZF7IzlOHb6akoBOrVrqBd5R97Iyn4yOI1Jzm
 qtGuOV8VdVYNsp3CYFNGqby+BbC4t7/DVn4OiKv3nXhRZBqmDU0D/c8gD/aWojzgoKMy
 Cp99EZZjV60Ui9aeL7L8GegBgX5P36pggwvzayFn3QiBf8do4mMHVD29Sxm2ZcwkmTI5
 GJ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zgVTJRvD9bwxe5h5OvimEh3WdUQa6jrydlK+z8ViyTs=;
 b=GFv8knYPc26+xc5Jf6p8uoiIK8e5bG7+oPekteOvn3ijtNtmPeHAMFqakQ6JVm2JN3
 wwuyLH+LhN2SDBiI1c8duv2OEDWrNXQvol71DSDWwHLAnxx1GicyNn9YHb3j2r9AyJMy
 7T1dL4V1gQrOOisexZygoiQFzb/MV0sLLKXivJbzPlhDTdZZZdwxERYWHC4DwBSitrSz
 SWa9bC853kf9lz96lcQrBM6nl+0dWXHWu8pnDfBXISUBPmr0jhdrZS8+CUl3y4VhN5so
 Q2DgJvEX1Lc0jZUiPfE9mo0TNLPda6n/VEyxgXX5lCb4rCdDafibxnaZiy2n3XVARN4W
 NfjA==
X-Gm-Message-State: AOAM5331vq7pRPZU+XWn5Bw2NJLKJ7eGE7uHqjn17fdI7a2Ir69vXnD+
 bmpqJGBW6F4PS/b3v5KJdn/amixsuTeQAweoX3npmQ==
X-Google-Smtp-Source: ABdhPJwN4AiRPoJPptQHSEO5cXd/B0knty7XexXAcHi41D+rEc2uWRwzjRdqzHuHAga/dgYkl+FQ3tSx4nDRlmqpLQA=
X-Received: by 2002:a17:906:1986:: with SMTP id
 g6mr37299161ejd.404.1594140536621; 
 Tue, 07 Jul 2020 09:48:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200707101912.571531-1-maxime@cerno.tech>
In-Reply-To: <20200707101912.571531-1-maxime@cerno.tech>
From: Eric Anholt <eric@anholt.net>
Date: Tue, 7 Jul 2020 09:48:45 -0700
Message-ID: <CADaigPVu1PEANANuS03fO=kSxFuhmqsz=Y5WmwiAeXmMOotrHA@mail.gmail.com>
Subject: Re: [PATCH] drm/vc4: dsi: Only register our component once a DSI
 device is attached
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 7, 2020 at 3:26 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> If the DSI driver is the last to probe, component_add will try to run all
> the bind callbacks straight away and return the error code.
>
> However, since we depend on a power domain, we're pretty much guaranteed to
> be in that case on the BCM2711, and are just lucky on the previous SoCs
> since the v3d also depends on that power domain and is further in the probe
> order.
>
> In that case, the DSI host will not stick around in the system: the DSI
> bind callback will be executed, will not find any DSI device attached and
> will return EPROBE_DEFER, and we will then remove the DSI host and ask to
> be probed later on.
>
> But since that host doesn't stick around, DSI devices like the RaspberryPi
> touchscreen whose probe is not linked to the DSI host (unlike the usual DSI
> devices that will be probed through the call to mipi_dsi_host_register)
> cannot attach to the DSI host, and we thus end up in a situation where the
> DSI host cannot probe because the panel hasn't probed yet, and the panel
> cannot probe because the DSI host hasn't yet.
>
> In order to break this cycle, let's wait until there's a DSI device that
> attaches to the DSI host to register the component and allow to progress
> further.
>
> Suggested-by: Andrzej Hajda <a.hajda@samsung.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

I feel like I've written this patch before, but I've thankfully
forgotten most of my battle with DSI probing.  As long as this still
lets vc4 probe in the absence of a DSI panel in the DT as well, then
this is enthusiastically acked.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
