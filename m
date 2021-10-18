Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DC1432402
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 18:42:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 456D86E098;
	Mon, 18 Oct 2021 16:42:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D93406E098
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 16:42:49 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id g8so878159ljn.4
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 09:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dgwWr3BXdTwUC0OrGuOgT8cS3CjgXPDui5v0oZBimWw=;
 b=j5j2m4OsgxsL2ElnGTkxunX1vf480gdCZWPnVSX5PsnMbjz3K+UnrJ3ky4IQhFOM62
 3ugYm7QBA1+1fKxqjagvX3O9gMkElc6Lz1V4k0D9kxvlhh//EJKzEYAKK2qDosxxGaIA
 Cdb9iFiBi8nXl6UJTewq99KHqloPeOC5Bd9O9XWXI/DmB45nCCAJigeazo3RzU6oxNbI
 JPPqJmjZ3WTMJC8CLDk+eldymAz6IL6UGhj4VvM3mcdfRD+PFBeggPMjSl5ZRxq57/vf
 nAaBK1y5gv/EHacIIHZmuwLROHizMmABHqumEsCRq0dM/WgVU9NNXQ8QQV7xry1ZEJTb
 Jt5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dgwWr3BXdTwUC0OrGuOgT8cS3CjgXPDui5v0oZBimWw=;
 b=SSLrUZIqkwzyNVY07wzgYYaaeiRmVU18IVWsrahSI3k/1rAINH7BhoFs5AbRWH9QBY
 cGu3BG/lckYCOu4Uc91E4Z7zeOTR3BPJIbvTAiokvxkOAjC6Jxmylaw8JSg2j5gJ37NN
 ZEaHKjV/f97BQ6glc4w4Xu9UNwaOCl6AzvlN/KJAcDwJQn4T4WsLmOKYA5kRsxE1TeAZ
 o/qnnQIdIcObZ+rpYky9B7PMrwgLAbQ0obHc4zD605zqTjtZCNh4ka1Rs+dMXNcHnFDs
 3zrHOozpe8s9P48PoA8CxnkvcY//Og1hiMmBdC/j5R8DMQGre6VzM6DoAqYcWS84vUD3
 uHdA==
X-Gm-Message-State: AOAM532YP73+rQV+yJJ0tlRQlU9nErttvWCINj3i3YdTZW57JhPS/5Ag
 kxVhA2wBbv3uJozBhyQ+xShDRg+KO1KBTUXbEarY9Q==
X-Google-Smtp-Source: ABdhPJwnHe4vWrE0K3Wm0c2Rfoo9x9QZhO1oxkDeBbktqaK53ENKMBgbVLMJfggxzoMrl5SYEGZkxiz2RQIRstjni2Q=
X-Received: by 2002:a2e:a911:: with SMTP id j17mr865105ljq.61.1634575368092;
 Mon, 18 Oct 2021 09:42:48 -0700 (PDT)
MIME-Version: 1.0
References: <20211018153627.2787882-1-robdclark@gmail.com>
In-Reply-To: <20211018153627.2787882-1-robdclark@gmail.com>
From: John Stultz <john.stultz@linaro.org>
Date: Mon, 18 Oct 2021 09:42:36 -0700
Message-ID: <CALAqxLU=O2yaJ=ZOtg0S-zX4KyirbXNx+0iF3EJ9d4=rVL6Z=Q@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/devfreq: Restrict idle clamping to a618 for now
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Jordan Crouse <jordan@cosmicpenguin.net>,
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

On Mon, Oct 18, 2021 at 8:31 AM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Until we better understand the stability issues caused by frequent
> frequency changes, lets limit them to a618.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
> Caleb/John, I think this should help as a workaround for the power
> instability issues on a630.. could you give it a try?

While I hit it fairly often, I can't reliably reproduce the crash, but
in limited testing this seems ok to me.
I've not hit the crash so far, nor seen any other negative side
effects over 5.14.

So for what that's worth:
Tested-by: John Stultz <john.stultz@linaro.org>

Caleb has better luck tripping this issue right away, so they can
hopefully provide a more assured response.

thanks
-john
