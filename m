Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33ED8341BFA
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 13:09:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D7576E1B7;
	Fri, 19 Mar 2021 12:09:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 415926E1B7;
 Fri, 19 Mar 2021 12:09:34 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id f26so11647076ljp.8;
 Fri, 19 Mar 2021 05:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=18bTTO0LtwICbrkP34GrvIGuHznNwuNg3xqUSgF99tc=;
 b=krXIlNUaCpuROQ+GF9uP7tqYm/TKa59pFpDaW/tG31pw1/nGkFVZAc3/LYKvmDZ7Co
 tO8cxGx7i+5PlvhSjOEanYzOwdNjV8xGxat+4GByGCL1EtpbtVtyYTE+BrAcmeoSaOms
 SAp7cEEmP7VW6/oSZHeEjUScKXb4qoiZmfX2H18JilsWyku5VuNip+Di6vLeveciIoNV
 jnEGraLrnrJ5GZqlm6HXgXcitKt457x/qxUYPjupiUPUrghRn8UrHkhcMuc8qynYgfoB
 c/gqZDTzq/QkWdR+nl2BrUNbZ373+xl/em9glkMdb3N92Eh+Bo1C6x7/OQO4QzbnrSWd
 fBTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=18bTTO0LtwICbrkP34GrvIGuHznNwuNg3xqUSgF99tc=;
 b=qu63ouxJypHQWZ15Pn7dfHYbBT7bmQG8DpcTP7Jtb535dN3BhyPFaM6D+0DdR9M9S8
 sgkA6cBY/3E1YxuVxVCkHzCJsr10HvQSschBCwePARlSk3MnesgNFznpsl/Yc7keikpr
 Wmmj9liC1MqKFqcN51UgV+6IIQb2zI/19yap/YNJPRmtSs49oLCpD/A1l7zsKn1QfdRm
 02/1Ncgc4SGPt79D8blgSfBe5eUIX3OnR6XLICxdsMc0ihxXKicxAhU821BcSlG82Ir4
 TZ1HqNZWt0/hzZRecMaY5kopFVzxUy+cvSnn/fRt2kMu1Epk2xOCfXo6GDuMQk1HjZ69
 1kqw==
X-Gm-Message-State: AOAM531xK2ylANQzcnEPoWpLdkdOMWnJMlc/p8qWWH9gwhqWg6u0xIDX
 V82Rv2kbnn+8uRSZtOdrDQBr1uoHWncow9DsUQY=
X-Google-Smtp-Source: ABdhPJxAMl+1VGuVaz1i/a22x+BQXeUsFJPe7kkmKAow3hjInbsN2y19OX/Bcwo8apqd7Ifvp0zVlbHNol4cukHZnXw=
X-Received: by 2002:a2e:9a0c:: with SMTP id o12mr701936lji.121.1616155772644; 
 Fri, 19 Mar 2021 05:09:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210301214152.1805737-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210301214152.1805737-1-dmitry.baryshkov@linaro.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 19 Mar 2021 09:09:21 -0300
Message-ID: <CAOMZO5Br85sf+ndiOWzeG7DgpqVHpXtnNGZLsVMOpBC5eVE2Aw@mail.gmail.com>
Subject: Re: [PATCH] gpu/drm/msm: fix shutdown hook in case GPU components
 failed to bind
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

On Mon, Mar 1, 2021 at 6:41 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:

> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
> index 6a326761dc4a..2fd0cf6421ad 100644
> --- a/drivers/gpu/drm/msm/msm_atomic.c
> +++ b/drivers/gpu/drm/msm/msm_atomic.c
> @@ -207,7 +207,12 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
>         struct msm_kms *kms = priv->kms;
>         struct drm_crtc *async_crtc = NULL;
>         unsigned crtc_mask = get_crtc_mask(state);
> -       bool async = kms->funcs->vsync_time &&
> +       bool async;
> +
> +       if (!kms)
> +               return;
> +
> +       async = kms->funcs->vsync_time &&
>                         can_do_async(state, &async_crtc);

I also see the same issue on a i.MX53:
https://lists.freedesktop.org/archives/freedreno/2021-January/009369.html

Then I got a different suggestion from Rob. Please check:

https://www.spinics.net/lists/dri-devel/msg286648.html
and
https://www.spinics.net/lists/dri-devel/msg286649.html

Does this series fix the issue in your platform too?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
