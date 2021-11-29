Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E8B4613E5
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 12:31:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1220A6F977;
	Mon, 29 Nov 2021 11:31:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50BE66F977
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 11:31:42 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id l16so36021084wrp.11
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 03:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5xKUu1VIteo1ONNxRBZqqAZENRrPgI7RvOOWoSUS//Y=;
 b=eM9Lm4bBXgu/+w1J8Gkkl7XGU2d9JgG1XYxvFsOi37D161TlyrOXW73wwv/sQmZulw
 pNSTm3FsQrUdDbPDIjz0jRZCKBr2VIqzdo4BjLCFoY3U9chqPs3cEi7vieFnIX13tgrT
 0vFnpgyFAKz+BZT0YX7rowK5K9vLFICD8kc3zcYtbf3Gq4QAfvRKOaZn3PKrxj+CdyTv
 O0/boIE2P1RM7vZqeR7nB19jl2tQpWGV83axBUSJ6yGdbJBnuAeBwjwURp5fFANbI6RS
 miaoTtUn1ArkoqF2ToaSEUFFa1zporrmNVcvkURz/nLJAnA7t89bDR+hm9pIS231AZfq
 XcGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5xKUu1VIteo1ONNxRBZqqAZENRrPgI7RvOOWoSUS//Y=;
 b=J9Cn4GpI81Ui4sD1lUyikFKCRqmOQQadlK9Zw5NaUugmRiolcY47Oi7o04szK8emP5
 B4ttsiU/qz1R0wXQmsi9Ak9STsAtY47lf9JKrsoedjdCqemSBLKMKJS8RliuavGpQgPN
 7mXBTAFTd100H1500L456DoE9ExscMnGskCI1jnv32kxRFx18gr2qzHenwM82+ZLD5rJ
 Ci5EXsjWEVImpAig0Qvz1qiWAmYhjZ02YZ0l2dAllhA7bGsx6znn9gIzGRAhbOCN4TxE
 WkwZ3mf54E8XOkzzo1QIejJwLsnGBNuwz+vLYLOOi/pTkc8bilufzp/EN2L/dH3s6GWA
 89aw==
X-Gm-Message-State: AOAM533skapaubuZlgm7Apz6Bn58mfgprqyrpXUQeWmWtp4ffdSHJFsY
 IdKt5P5zJ61cSmvE3jSxBo86aM0c5zvBBUnG6N3+zA==
X-Google-Smtp-Source: ABdhPJxlsGteW51lN0pXe2erOsatetmC5x5A5bVP9DDFDKfrZG9EaSOiXiAWW6qWqMSoJPj+uAMO5naT6Ag/d8q91T8=
X-Received: by 2002:adf:c186:: with SMTP id x6mr32233753wre.580.1638185500830; 
 Mon, 29 Nov 2021 03:31:40 -0800 (PST)
MIME-Version: 1.0
References: <20211117094527.146275-1-maxime@cerno.tech>
 <20211117094527.146275-7-maxime@cerno.tech>
In-Reply-To: <20211117094527.146275-7-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 29 Nov 2021 11:31:24 +0000
Message-ID: <CAPY8ntBJk+Mzy5GV2_Kc8itBFPwGDXAOFj0sBZL+p2DLrjdVPw@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] drm/vc4: kms: Fix previous HVS commit wait
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Jian-Hong Pan <jhp@endlessos.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Wed, 17 Nov 2021 at 09:45, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Our current code is supposed to serialise the commits by waiting for all
> the drm_crtc_commits associated to the previous HVS state.
>
> However, assuming we have two CRTCs running and being configured and we
> configure each one alternatively, we end up in a situation where we're

s/alternatively/alternately

Otherwise the series looks fine to the extent that I understand the issues.
So the series is

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> not waiting at all.
>
> Indeed, starting with a state (state 0) where both CRTCs are running,
> and doing a commit (state 1) on the first CRTC (CRTC 0), we'll associate
> its commit to its assigned FIFO in vc4_hvs_state.
>
> If we get a new commit (state 2), this time affecting the second CRTC
> (CRTC 1), the DRM core will allow both commits to execute in parallel
> (assuming they don't have any share resources).
>
> Our code in vc4_atomic_commit_tail is supposed to make sure we only get
> one commit at a time and serialised by order of submission. It does so
> by using for_each_old_crtc_in_state, making sure that the CRTC has a
> FIFO assigned, is used, and has a commit pending. If it does, then we'll
> wait for the commit before going forward.
>
> During the transition from state 0 to state 1, as our old CRTC state we
> get the CRTC 0 state 0, its commit, we wait for it, everything works fine.
>
> During the transition from state 1 to state 2 though, the use of
> for_each_old_crtc_in_state is wrong. Indeed, while the code assumes it's
> returning the state of the CRTC in the old state (so CRTC 0 state 1), it
> actually returns the old state of the CRTC affected by the current
> commit, so CRTC 0 state 0 since it wasn't part of state 1.
>
> Due to this, if we alternate between the configuration of CRTC 0 and
> CRTC 1, we never actually wait for anything since we should be waiting
> on the other every time, but it never is affected by the previous
> commit.
>
> Change the logic to, at every commit, look at every FIFO in the previous
> HVS state, and if it's in use and has a commit associated to it, wait
> for that commit.
>
> Fixes: 9ec03d7f1ed3 ("drm/vc4: kms: Wait on previous FIFO users before a commit")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/vc4/vc4_kms.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
> index d9b3e3ad71ea..b61792d2aa65 100644
> --- a/drivers/gpu/drm/vc4/vc4_kms.c
> +++ b/drivers/gpu/drm/vc4/vc4_kms.c
> @@ -337,10 +337,10 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
>         struct drm_device *dev = state->dev;
>         struct vc4_dev *vc4 = to_vc4_dev(dev);
>         struct vc4_hvs *hvs = vc4->hvs;
> -       struct drm_crtc_state *old_crtc_state;
>         struct drm_crtc_state *new_crtc_state;
>         struct drm_crtc *crtc;
>         struct vc4_hvs_state *old_hvs_state;
> +       unsigned int channel;
>         int i;
>
>         for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
> @@ -357,16 +357,10 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
>         if (IS_ERR(old_hvs_state))
>                 return;
>
> -       for_each_old_crtc_in_state(state, crtc, old_crtc_state, i) {
> -               struct vc4_crtc_state *vc4_crtc_state =
> -                       to_vc4_crtc_state(old_crtc_state);
> -               unsigned int channel = vc4_crtc_state->assigned_channel;
> +       for (channel = 0; channel < HVS_NUM_CHANNELS; channel++) {
>                 struct drm_crtc_commit *commit;
>                 int ret;
>
> -               if (channel == VC4_HVS_CHANNEL_DISABLED)
> -                       continue;
> -
>                 if (!old_hvs_state->fifo_state[channel].in_use)
>                         continue;
>
> --
> 2.33.1
>
