Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B441943291F
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 23:35:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBCE16E101;
	Mon, 18 Oct 2021 21:35:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD5546E0F0;
 Mon, 18 Oct 2021 21:35:09 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 a140-20020a1c7f92000000b0030d8315b593so505927wmd.5; 
 Mon, 18 Oct 2021 14:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4XnmvNvPxfEVQWVq8EDgUudNaRlsqBTECY97KmH3+qU=;
 b=O0zLSgwbv/mkY4bc4Kww3dE+SdAgue0GUdt7Qe7jFGrv9/CqH/cNqfg6OqtVT/iq8W
 06tWL8aeII2Qtp82LRpcTg+VWuaJ9vTe9169Q65ifvVFpRGyJ5j9T9i+85aQ608x2eSa
 kTH+WXzreNwNVkxswqH/U43e5XlaySzrug5pAbn1uXPUkcCSowgjvIPZmcqLk7+AbnMh
 OOHr9INXUktXDJMe233LClz/YafxvJtpDz51b7bOYuG2TyMdSBDp1gjqnMky0jNEXnNz
 61vwJswFQPPdTiEkxvMIYQzKt8BusLS26DQRkeGiIJwIx8l3/iPpUQ8E+J8lr3U3cqCF
 fe9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4XnmvNvPxfEVQWVq8EDgUudNaRlsqBTECY97KmH3+qU=;
 b=Cg+GV1uOqEd82b9qzQhT+UKxERCojh/CH/aouTjHjepXP8hTvxkcXDm4IQTRLvPCFe
 aYkZI+YE9bFZJaVQLCXZtdEGuQw9TjGh7Wxctc0+vx3ThXYiAwJmiMQOrCaG0Tet8vbB
 H2iOHI6ve9Glx/STVZifx9KFq8iKp4HjFs0b425aQyIJ7lvil2T1J/8XM0tThq9iyqY/
 SlRBFQnY31QZRcsSMe3gLG/QX/Cb2xvTtMGsW3gPswHmMl1p75cBZTxPFu6fUSKzmqXy
 DQZ2dvQqNxZqP0lr1v/YtXAEktHB1H8wC2X7RPiLQINMYC3nbFdgyewkLgtI76Po1obS
 aj7w==
X-Gm-Message-State: AOAM532hNEhekftdkFeL5vF1nYA9ZJpK3aIjJycHhR8349bRrKTxQ4JF
 NaNJQQMoRPmp1AMj5XK898sGD/lwhIR7yp2H1gs=
X-Google-Smtp-Source: ABdhPJzhkbwDthvcSIEV0Hy1PC5sK3geesT4m3ojkKN7yJzHPDU3Yix216y4pCnSidZYgZUwO7yn99zm1abKlrnJpco=
X-Received: by 2002:a05:600c:4f43:: with SMTP id
 m3mr1484775wmq.151.1634592908342; 
 Mon, 18 Oct 2021 14:35:08 -0700 (PDT)
MIME-Version: 1.0
References: <20211018153627.2787882-1-robdclark@gmail.com>
 <CALAqxLU=O2yaJ=ZOtg0S-zX4KyirbXNx+0iF3EJ9d4=rVL6Z=Q@mail.gmail.com>
 <5c460ee3-9079-02a7-e674-a4dde5815f0d@linaro.org>
In-Reply-To: <5c460ee3-9079-02a7-e674-a4dde5815f0d@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 18 Oct 2021 14:39:46 -0700
Message-ID: <CAF6AEGusfFofWh6eE1fPd_6PQ2KQpZ2sU9GSxnvbqaTi5_nwtw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/devfreq: Restrict idle clamping to a618 for now
To: Caleb Connolly <caleb.connolly@linaro.org>
Cc: John Stultz <john.stultz@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Rob Clark <robdclark@chromium.org>, 
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jordan Crouse <jordan@cosmicpenguin.net>,
 Akhil P Oommen <akhilpo@codeaurora.org>, 
 Jonathan Marek <jonathan@marek.ca>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Sharat Masetty <smasetty@codeaurora.org>, 
 Douglas Anderson <dianders@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, 
 Amit Pundir <amit.pundir@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 18, 2021 at 10:33 AM Caleb Connolly
<caleb.connolly@linaro.org> wrote:
>
> Hi all,
>
> On 18/10/2021 17:42, John Stultz wrote:
> > On Mon, Oct 18, 2021 at 8:31 AM Rob Clark <robdclark@gmail.com> wrote:
> >>
> >> From: Rob Clark <robdclark@chromium.org>
> >>
> >> Until we better understand the stability issues caused by frequent
> >> frequency changes, lets limit them to a618.
> >>
> >> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >> ---
> >> Caleb/John, I think this should help as a workaround for the power
> >> instability issues on a630.. could you give it a try?
> >
> > While I hit it fairly often, I can't reliably reproduce the crash, but
> > in limited testing this seems ok to me.
> > I've not hit the crash so far, nor seen any other negative side
> > effects over 5.14.
> >
> > So for what that's worth:
> > Tested-by: John Stultz <john.stultz@linaro.org>
> >
> > Caleb has better luck tripping this issue right away, so they can
> > hopefully provide a more assured response.
> This prevents the crash on the OnePlus 6 as the frequency can no longer go to zero.
>
> I would like to find a better solution that still allows proper idling on a630, but that can wait for 5.16.
>
> Tested-by: Caleb Connolly <caleb.connolly@linaro.org>

Thanks for testing, I've sent one last -fixes pull request with this patch

BR,
-R

> >
> > thanks
> > -john
> >
>
> --
> Kind Regards,
> Caleb (they/them)
