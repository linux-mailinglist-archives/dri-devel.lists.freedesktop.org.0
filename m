Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6113CBAB3
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 18:46:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48A096E9C6;
	Fri, 16 Jul 2021 16:45:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA3C16E9C6;
 Fri, 16 Jul 2021 16:45:57 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 42-20020a9d012d0000b02904b98d90c82cso10470363otu.5; 
 Fri, 16 Jul 2021 09:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oh7B6qOHJQLQ6+INHEXYWjtOIQ2UOCfXFqFA/OXfYPI=;
 b=O8xIqSR6UI188/ckW83ntnyI7R9KkV4/TFufwwMR3Suenw+hd30OLyXgNfPL5oQb4D
 KZzkAwvoj24wHKIJwyzH7963LW19rFCUCilqpATpLpRIUQ6TJuOiJyFoK3KU7orzpqTg
 BGU+5/qmoKTSju2RWekmWyD7m09Uwu/8QWv6K5G1sam2Elmmtu+U0xrFlzdTiO0Uf+H+
 2XyIGiAoLPe0QSrwyHQze2o+JMcE0ArvWms03ALhnySnsJdSTWiuuK7hf1R4b5hur6GK
 KVbCRp6oVKqWqlB6JJmumA4PRplqd75zeHo4w0n8ubPt9wKZ6I7hZjsQXQ0X8qeJrWkT
 ZrvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oh7B6qOHJQLQ6+INHEXYWjtOIQ2UOCfXFqFA/OXfYPI=;
 b=Slyq91bMgnBqqcSrMQlQ0vnxfqpVpYdnpHzOsOHisYRMwHisw5r1kTxWlvDGg2FmmI
 ClJhLYkBPrDuBZpGPFrFsOAulTCD09jATcS6HrWqniC3f6sD7X8AlSFz5TwuOE1ge519
 aYreYJAWEkZih6z3dnqn9C326+/9vnIckr1hh6rX7uWo8VzaaP+wY/5M8OGyXGkmZOnl
 ZI6aThj3xrjMjJBxpHUXbtCquB41rQh+kDCNIttmePlrO+Gg7iomH8svuX0FtyZfWmjT
 7Ml2+VIQZHtuHk5vSrBImC3giV6GnTCYC1AwO7mgYFSz9OTZoGtYrQff0l0whKE33Adn
 FlCw==
X-Gm-Message-State: AOAM531R4Dgm8IPAaPHUtU7jwE4hLqJFXFZZVvhb2jCIV4YtHTw3+kqu
 TiTtCxkoxDrBxi1Ku9fQLY0P6AmF0NM0y2gwXcQ=
X-Google-Smtp-Source: ABdhPJwkjInGKsBf98xS5SmZAnNHiwknlhx7YlHVTlwVei5t5dsp84qdFDSAKumFhbG0bUNXmw+5oc1bRyEOkWKQToY=
X-Received: by 2002:a05:6830:2683:: with SMTP id
 l3mr3098702otu.23.1626453957274; 
 Fri, 16 Jul 2021 09:45:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210714080652.113381-1-liviu@dudau.co.uk>
 <CADnq5_OA-em2jM-vmwaM7xxycOS-18EPC0r_myb7REy9b4h_vA@mail.gmail.com>
 <CAEsyxyhurQ2vm=xwaRMqT8z+PJ2R60hYXt6kL8HnaB4zwbee3Q@mail.gmail.com>
 <ea5363b5-a54e-383d-f5bd-214bb8b50c96@amd.com>
In-Reply-To: <ea5363b5-a54e-383d-f5bd-214bb8b50c96@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 16 Jul 2021 12:45:46 -0400
Message-ID: <CADnq5_NTdS2x6PU3G3awFQg6z=52bsV0JVXxiB_OnWA4pabTMw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix 10bit 4K display on CIK GPUs
To: Harry Wentland <harry.wentland@amd.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Jul 15, 2021 at 3:40 PM Harry Wentland <harry.wentland@amd.com> wrote:
>
>
>
> On 2021-07-15 3:19 p.m., Mario Kleiner wrote:
> > On Thu, Jul 15, 2021 at 6:10 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> >>
> >> On Wed, Jul 14, 2021 at 4:15 AM Liviu Dudau <liviu@dudau.co.uk> wrote:
> >>>
> >>> Commit 72a7cf0aec0c ("drm/amd/display: Keep linebuffer pixel depth at
> >>> 30bpp for DCE-11.0.") doesn't seems to have fixed 10bit 4K rendering over
> >>> DisplayPort for CIK GPUs. On my machine with a HAWAII GPU I get a broken
> >>> image that looks like it has an effective resolution of 1920x1080 but
> >>> scaled up in an irregular way. Reverting the commit or applying this
> >>> patch fixes the problem on v5.14-rc1.
> >>>
> >>> Fixes: 72a7cf0aec0c ("drm/amd/display: Keep linebuffer pixel depth at 30bpp for DCE-11.0.")
> >>> Signed-off-by: Liviu Dudau <liviu@dudau.co.uk>
> >>
> >> Harry or Mario any ideas?  Maybe we need finer grained DCE version
> >> checking?  I don't remember all of the caveats of this stuff.  DCE11
> >> and older is getting to be pretty old at this point.  I can just apply
> >> this if you don't have any insights.
> >>
> >> Alex
> >>
> >
> > Hi Alex
> >
> > I'd be fine with applying this. As my original commit says, photometer
> > measurements showed that increasing the line buffer depth was only
> > needed for my DCN-1 RavenRidge, not for my DCE-11.2 Polaris11 or a
> > DCE-8.3 cik, so this should probably not cause harm to the increased
> > precision modes.
> >
> > Note that given the hardware and USB-C/DP-HDMI adapters i have, I only
> > tested this on a 2560x1440@144 Hz DP monitor with DCN-1, DCE-11.2, and
> > a 2560x1440@100 Hz HDMI monitor iirc with DCN-1, DCE-8.3, and i think
> > on a 2880x1800@60 Hz MBP Retina eDP panel with DCE-11.2. These are the
> > highest resolution/framerate monitors I have atm.I don't have access
> > to any 4k monitors, so maybe the problem is somehow specific to such
> > high resolutions? Maybe somewhere else in the code something would
> > need to be adapted? Lacking actual hw docs, my coding here is by
> > pattern matching against existing DC code, guessing and testing on my
> > limited hw samples.
> >
> > Acked-by: Mario Kleiner <mario.kleiner.de@gmail.com>
>
> Makes sense.
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>
> Harry
>
> >
> > -mario
> >
> >>> ---
> >>>  drivers/gpu/drm/amd/display/dc/core/dc_resource.c | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> >>> index a6a67244a322e..1596f6b7fed7c 100644
> >>> --- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> >>> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> >>> @@ -1062,7 +1062,7 @@ bool resource_build_scaling_params(struct pipe_ctx *pipe_ctx)
> >>>          * so use only 30 bpp on DCE_VERSION_11_0. Testing with DCE 11.2 and 8.3
> >>>          * did not show such problems, so this seems to be the exception.
> >>>          */
> >>> -       if (plane_state->ctx->dce_version != DCE_VERSION_11_0)
> >>> +       if (plane_state->ctx->dce_version > DCE_VERSION_11_0)
> >>>                 pipe_ctx->plane_res.scl_data.lb_params.depth = LB_PIXEL_DEPTH_36BPP;
> >>>         else
> >>>                 pipe_ctx->plane_res.scl_data.lb_params.depth = LB_PIXEL_DEPTH_30BPP;
> >>> --
> >>> 2.32.0
> >>>
> >>> _______________________________________________
> >>> amd-gfx mailing list
> >>> amd-gfx@lists.freedesktop.org
> >>> https://lists.freedesktop.org/mailman/listinfo/amd-gfx>
