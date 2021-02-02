Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC30830BE58
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 13:39:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12E0B89FA0;
	Tue,  2 Feb 2021 12:39:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA7389FA0
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 12:39:35 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id a1so20299585wrq.6
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Feb 2021 04:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b2nhv+ykzJ0WSOg0wQof15RhvfwhkTxbklNJJVPYYG8=;
 b=rJS3CROoIZgr0yogUKW/I9O8MQvPF3iOKnL+8kdQkLqkzZ637u/jJzCrU7pdBp1k3O
 jh5KsiiqjKbUNdZFpsmWy0MACLOt+jIRUMIb+Rf0X6w4Zi2FvKXitAg9LyOZ9ZMTFM+r
 bEQuFIMIbWNBaFiSh1bXTGKpNRKGPjD0O/K2KL5sA4545R4sfI//29zDFmfIAsxJMb6n
 x221uK4UtBzAc4LR6wxkLuIHNeY1EmnjC9KfHPedmvxYW2DOOQEFkEoZ7IDtaxnGoQzW
 KRcWQSd05R6G8uUR2OUY+iCOn3SbQyhsgMx1CnPC6pMuFFWoOequUpc7du2twe1j/PGP
 6TNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b2nhv+ykzJ0WSOg0wQof15RhvfwhkTxbklNJJVPYYG8=;
 b=pmCOcPS21UMMblPaBoQG/GKOIuVkJM8ZspA8gr8QN+256OsJaq8/y4VjqcdUDObVev
 gHhDvlBsiFWkeyDQWXROhdSqWwbRT/u3cIIJkFN85McRuekgRT0iOEas5w/ME3ng5Vex
 JsuffwnaohQkggUdliIxRUHfQYri9BU6U8gcrKPAZ8O31QsRUq9XSVIwu/63SPm3BK5Q
 gK+a8KkmtxjoOejZGz2/7aC+E+1/wfEo6TZMyKPt0tAVAZZek9y4sfX0XrZpx73VTyZG
 jFyJcjHAobdQ+F7v9WTMUo3Wz4BlRdL/APIIGap9C+bHAriedOaklmajo+XoWmWBviYg
 ji4A==
X-Gm-Message-State: AOAM532tgPrt85SUvX9juLpTqtI144w3At48EngpUH65xy93+8xdo6HO
 7CBZZWjodufLtEuw8deiDdUbIrxbAZQ2XtUrivAGpg==
X-Google-Smtp-Source: ABdhPJwSMORAty51iyIo5zLtaVNobs7t5ZzkXiz0gRNJPfzhv2mMlRL3fUkTF1yPieVULWP/9s7WVqPYQkLVFlwTktg=
X-Received: by 2002:adf:f68e:: with SMTP id v14mr16641681wrp.273.1612269574474; 
 Tue, 02 Feb 2021 04:39:34 -0800 (PST)
MIME-Version: 1.0
References: <20210129160647.128373-1-maxime@cerno.tech>
In-Reply-To: <20210129160647.128373-1-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 2 Feb 2021 12:39:17 +0000
Message-ID: <CAPY8ntDn14t_EfN1Qn7wQAtEprhyPJMta--NOH6gkf6+fUNb6w@mail.gmail.com>
Subject: Re: [PATCH] drm/vc4: hvs: Fix buffer overflow with the dlist handling
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Fri, 29 Jan 2021 at 16:07, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Commit 0a038c1c29a7 ("drm/vc4: Move LBM creation out of
> vc4_plane_mode_set()") changed the LBM allocation logic from first
> allocating the LBM memory for the plane to running mode_set,
> adding a gap in the LBM, and then running the dlist allocation filling
> that gap.
>
> The gap was introduced by incrementing the dlist array index, but was
> never checking whether or not we were over the array length, leading
> eventually to memory corruptions if we ever crossed this limit.
>
> vc4_dlist_write had that logic though, and was reallocating a larger
> dlist array when reaching the end of the buffer. Let's share the logic
> between both functions.
>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Eric Anholt <eric@anholt.net>
> Fixes: 0a038c1c29a7 ("drm/vc4: Move LBM creation out of vc4_plane_mode_set()")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Looks good.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_plane.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
> index b5586c92bfe5..3d33fe3dacea 100644
> --- a/drivers/gpu/drm/vc4/vc4_plane.c
> +++ b/drivers/gpu/drm/vc4/vc4_plane.c
> @@ -227,7 +227,7 @@ static void vc4_plane_reset(struct drm_plane *plane)
>         __drm_atomic_helper_plane_reset(plane, &vc4_state->base);
>  }
>
> -static void vc4_dlist_write(struct vc4_plane_state *vc4_state, u32 val)
> +static void vc4_dlist_counter_increment(struct vc4_plane_state *vc4_state)
>  {
>         if (vc4_state->dlist_count == vc4_state->dlist_size) {
>                 u32 new_size = max(4u, vc4_state->dlist_count * 2);
> @@ -242,7 +242,15 @@ static void vc4_dlist_write(struct vc4_plane_state *vc4_state, u32 val)
>                 vc4_state->dlist_size = new_size;
>         }
>
> -       vc4_state->dlist[vc4_state->dlist_count++] = val;
> +       vc4_state->dlist_count++;
> +}
> +
> +static void vc4_dlist_write(struct vc4_plane_state *vc4_state, u32 val)
> +{
> +       unsigned int idx = vc4_state->dlist_count;
> +
> +       vc4_dlist_counter_increment(vc4_state);
> +       vc4_state->dlist[idx] = val;
>  }
>
>  /* Returns the scl0/scl1 field based on whether the dimensions need to
> @@ -1057,8 +1065,10 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
>                  * be set when calling vc4_plane_allocate_lbm().
>                  */
>                 if (vc4_state->y_scaling[0] != VC4_SCALING_NONE ||
> -                   vc4_state->y_scaling[1] != VC4_SCALING_NONE)
> -                       vc4_state->lbm_offset = vc4_state->dlist_count++;
> +                   vc4_state->y_scaling[1] != VC4_SCALING_NONE) {
> +                       vc4_state->lbm_offset = vc4_state->dlist_count;
> +                       vc4_dlist_counter_increment(vc4_state);
> +               }
>
>                 if (num_planes > 1) {
>                         /* Emit Cb/Cr as channel 0 and Y as channel
> --
> 2.29.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
