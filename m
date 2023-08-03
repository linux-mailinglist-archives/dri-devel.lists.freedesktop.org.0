Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B960D76F433
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 22:48:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ECDA10E222;
	Thu,  3 Aug 2023 20:48:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71A0310E221;
 Thu,  3 Aug 2023 20:48:02 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-52227884855so1790581a12.1; 
 Thu, 03 Aug 2023 13:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691095681; x=1691700481;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W28liRu/1psuyahcE/4ZyfIZaBTaHuqe1KJO4t7kUeI=;
 b=C22R7kh2bZcj3toYTyhaXd0zpD/59JJ91v1pdUsWlW93dUDAm4iSJ98Uv/8C++7nfZ
 ZbiSQRHVDpWths9AeeIKnHRkAJWtfpFUYFMIJfwJgKRxdl2W4pjLRQOmMwdwzVn4LgHi
 Fg9Oj7rdqUqx1+eyniR/d6CrqSZx+CtKHeixI5GVGhIb5TCDxAAMxab2kUH4AlBhF1Gr
 K7CQ7gFrGw8emM+mp/a06b8R4/Cj11HUTDZjxj00wfki8xKXEuha7Tz1Y42cz1zF/IQg
 JaJwDPBO7jO7OnvWIlkg856pSPp+z8OuUFjpQTpLEag2f+rirZDiytncgZwllH+Gtomi
 QcpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691095681; x=1691700481;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W28liRu/1psuyahcE/4ZyfIZaBTaHuqe1KJO4t7kUeI=;
 b=bDTHR2h59NNCcE26M0gNL1hnjP3+8+aJbuHh9lgDFyJxD/V9V+nWM9/WpQDvqzNiLo
 I+pcBuLw6ut3Ct3yos5p9PqgidKgjse4v76fORoewjGNWRDrBA9WSHj8+SYiS23yKfPr
 q+13pZYPfUVYeG+VX0o3x5I2IfrFVIMiUxzzD04dtG5+U9tmkIEsjc54/xE4X7jlG8yf
 EiFc5Yp/ESaQCQHpGPKrNwP7+gQ0k1VkkrNdLu5tJapIv7+aeag3Sn1KMRVFNnFBGrIZ
 0lCeUp7pbwRFAdx2TDiTOBIijyS1hxcBoJ+9zP65Z6KnGBWEfxrs0UpfZh3rG4q6yyRa
 SpjQ==
X-Gm-Message-State: ABy/qLY0HI+9hC1ZSS8yS+FxorOzmkYpvJpkdocpSYSUxoebHSu6n0OI
 6k2ZytWBoMEWkCCqC8JJ+oDtXl9AcGvqj66iGYw=
X-Google-Smtp-Source: APBJJlHRmNNvRuTFG3cokmYgfkojNEJ/k3RR6D8QwrWBrtcXM818y1NHGwObU2zfSiYmbNCbQo5TJZN83QnWNoaV3GQ=
X-Received: by 2002:aa7:c651:0:b0:522:7eaf:c0c0 with SMTP id
 z17-20020aa7c651000000b005227eafc0c0mr8789498edr.16.1691095680678; Thu, 03
 Aug 2023 13:48:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230803204521.928582-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20230803204521.928582-1-daniel.vetter@ffwll.ch>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 3 Aug 2023 13:47:48 -0700
Message-ID: <CAF6AEGtBB1u8YHj-TOwr8SVcCDqsMb=ZTcJ-yt180tBNfwcm5g@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/mdp5: Don't leak some plane state
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>, freedreno@lists.freedesktop.org,
 dorum@noisolation.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 3, 2023 at 1:45=E2=80=AFPM Daniel Vetter <daniel.vetter@ffwll.c=
h> wrote:
>
> Apparently no one noticed that mdp5 plane states leak like a sieve
> ever since we introduced plane_state->commit refcount a few years ago
> in 21a01abbe32a ("drm/atomic: Fix freeing connector/plane state too
> early by tracking commits, v3.")
>
> Fix it by using the right helpers.
>
> Fixes: 21a01abbe32a ("drm/atomic: Fix freeing connector/plane state too e=
arly by tracking commits, v3.")
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Reported-and-tested-by: dorum@noisolation.com
> Cc: dorum@noisolation.com
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm=
/msm/disp/mdp5/mdp5_plane.c
> index bd2c4ac45601..0d5ff03cb091 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> @@ -130,8 +130,7 @@ static void mdp5_plane_destroy_state(struct drm_plane=
 *plane,
>  {
>         struct mdp5_plane_state *pstate =3D to_mdp5_plane_state(state);
>
> -       if (state->fb)
> -               drm_framebuffer_put(state->fb);
> +       __drm_atomic_helper_plane_destroy_state(state);
>
>         kfree(pstate);
>  }
> --
> 2.40.1
>
