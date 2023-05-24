Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A8870FC67
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 19:13:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89D8110E4C8;
	Wed, 24 May 2023 17:13:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 412C910E4C8
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 17:13:50 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-774892d78d2so1836639f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 10:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684948427; x=1687540427;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EdS+q/K7TdrybGLIQtx2Ez7oq5UvktWCfD/foZoBFes=;
 b=U7BIgnrXPTfSBZPqP2ftRmyQUkaADhylgdggEtlKNZj/NkdDpyIu1i84qN7WxOE8kx
 RJaMka57NYeTMxg9lUsiVUd78BF+qshvEoBKUL01tg5MJplsp1zPvh9F8XXA6rjuNswv
 ztpqedBDo5cUIaOMd1JECBIkU8k1uFR4QMkNU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684948427; x=1687540427;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EdS+q/K7TdrybGLIQtx2Ez7oq5UvktWCfD/foZoBFes=;
 b=IeOom6l/92VHCcw2SiwGNZt+p68LgeJNOAFjTByVrjdI8mmL5/p4z/SW/cP0OJxBev
 L1+X/+ZpS0zhhtQ1ZrvmTx8RC2k6o91XGsPsaC6pwoZJQzD0lfzomjxAixXtzf2sFfg2
 oGP5f2WH3DYA9w4udfi4l8UnUDtiElT+vCzc0v/DscDldw8l/P3CiTT9UYTGaisuBIw5
 ZMC9wlQBMzA+jEIm3ECvdeEkt2O4HggCjxEoKUvzZTYBwkuQyMzluIL2NFmWrn1XIiw1
 8c2a+gxHpGDygSKNBMXiCQ3dr5uQtQ0gErftLKGQ/zG2D2xKoIEMRL3l+d3t8W9PRAPq
 rGWw==
X-Gm-Message-State: AC+VfDy+AJVa+oBV6zLDHJIsq7SEK+iThHZLbxCjkc5aFdsniorQIKDk
 T9MmcvDub/jj9Fnfzdm7hizjCJo5RIYrRWQPfRw=
X-Google-Smtp-Source: ACHHUZ5dclxhLOgQDJLxaM61z8RtBvKWsqDQfQtwdbAwJPgs3LEKDks8gPH9nKhyZ9f82udw7O/XVA==
X-Received: by 2002:a5e:da47:0:b0:760:ed78:a252 with SMTP id
 o7-20020a5eda47000000b00760ed78a252mr44404iop.9.1684948426963; 
 Wed, 24 May 2023 10:13:46 -0700 (PDT)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com.
 [209.85.166.169]) by smtp.gmail.com with ESMTPSA id
 a25-20020a5d9ed9000000b00752f62cd3bdsm3469995ioe.12.2023.05.24.10.13.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 May 2023 10:13:46 -0700 (PDT)
Received: by mail-il1-f169.google.com with SMTP id
 e9e14a558f8ab-33a8f766b64so5895ab.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 10:13:45 -0700 (PDT)
X-Received: by 2002:a05:6e02:20c7:b0:32a:f2a9:d1b7 with SMTP id
 7-20020a056e0220c700b0032af2a9d1b7mr411499ilq.10.1684948425265; Wed, 24 May
 2023 10:13:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230427232848.5200-1-quic_abhinavk@quicinc.com>
 <053819bd-b3c4-a72c-9316-85d974082ad6@linaro.org>
 <ZGzalLjTvUfzEADU@hovoldconsulting.com>
 <f530691b-989d-b059-6b06-e66abb740bdb@quicinc.com>
 <ZG216qoxK9hQ-kQs@hovoldconsulting.com>
 <4f2556e2-52ab-eb1d-b388-52546044f460@linaro.org>
In-Reply-To: <4f2556e2-52ab-eb1d-b388-52546044f460@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 24 May 2023 10:13:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VYczHFHv_h1tt-O+AagE1-KzgYd2B=Cx6fK_s4jR8iTw@mail.gmail.com>
Message-ID: <CAD=FV=VYczHFHv_h1tt-O+AagE1-KzgYd2B=Cx6fK_s4jR8iTw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: add module parameter for PSR
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>,
 Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-arm-msm@vger.kernel.org,
 quic_jesszhan@quicinc.com, swboyd@chromium.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, May 24, 2023 at 1:06=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 24/05/2023 09:59, Johan Hovold wrote:
> > On Tue, May 23, 2023 at 12:23:04PM -0700, Abhinav Kumar wrote:
> >> On 5/23/2023 8:24 AM, Johan Hovold wrote:
> >>> On Fri, May 12, 2023 at 09:13:04PM +0300, Dmitry Baryshkov wrote:
> >>>> On 28/04/2023 02:28, Abhinav Kumar wrote:
> >>>>> On sc7280 where eDP is the primary display, PSR is causing
> >>>>> IGT breakage even for basic test cases like kms_atomic and
> >>>>> kms_atomic_transition. Most often the issue starts with below
> >>>>> stack so providing that as reference
> >>>>>
> >>>>> Call trace:
> >
> >>>>> ---[ end trace 0000000000000000 ]---
> >>>>> [drm-dp] dp_ctrl_push_idle: PUSH_IDLE pattern timedout
> >>>>>
> >>>>> Other basic use-cases still seem to work fine hence add a
> >>>>> a module parameter to allow toggling psr enable/disable till
> >>>>> PSR related issues are hashed out with IGT.
> >>>>
> >>>> For the reference: Bjorn reported that he has issues with VT on a
> >>>> PSR-enabled laptops. This patch fixes the issue for him
> >>>
> >>> Module parameters are almost never warranted, and it is definitely no=
t
> >>> the right way to handle a broken implementation.
> >>>
> >>> I've just sent a revert that unconditionally disables PSR support unt=
il
> >>> the implementation has been fixed:
> >>>
> >>>     https://lore.kernel.org/lkml/20230523151646.28366-1-johan+linaro@=
kernel.org/
> >>
> >> I dont completely agree with this. Even the virtual terminal case was
> >> reported to be fixed by one user but not the other. So it was probably
> >> something missed out either in validation or reproduction steps of the
> >> user who reported it to be fixed OR the user who reported it not fixed=
.
> >> That needs to be investigated now.
> >
> > Yes, there may still be some time left to fix it, but it's pretty damn
> > annoying to find that an issue reported two months ago still is not
> > fixed at 6.4-rc3. (I even waited to make the switch to 6.4 so that I
> > would not have to spend time on this.)
> >
> > I didn't see any mail from Bjorn saying that the series that claimed to
> > fix the VT issue actually did fix the VT issue. There's only the commen=
t
> > above from Dmitry suggesting that disabling this feature is the only wa=
y
> > to get a working terminal back.
>
> Originally this issue was reported by Doug, and at [1] he reported that
> an issue is fixed for him. So, for me it looks like we have hardware
> where VT works and hardware where it doesn't.

As I understand it, the problem was originally reported by Bjorn over
IRC. When he reported the problem on VT2, Stephen Boyd confirmed that
he could see the same problem on our hardware when using VT2. I
confirmed I could reproduce and also tested the fix. I don't remember
if Bjorn ever tested the fix. I think many of us assumed that it was
the same issue so a fix for one person would also fix the other.


> Doug, can you please confirm whether you can reproduce the PSR+VT issue
> on 6.4-rc (without extra patches) or if the issue is fixed for you?
>
> [1]
> https://lore.kernel.org/dri-devel/CAD=3DFV=3DVSHmQPtsQfWjviEZeErms-VEOTmf=
ozejASUC9zsMjAbA@mail.gmail.com/

Ugh. Unfortunately, it's not easy for me to test this particular
feature directly on upstream Linux. :( I typically run with a ChromeOS
root filesystem, which works pretty well with mainline. One place
where it doesn't work with mainline is VT2. The VT2 feature for
Chromebooks is implemented with "frecon" and takes advantage of a
downstream patch that we've carried in the ChromeOS kernel trees for
years allowing handoff of who the DRM "master" is.

For testing the fix previously, I confirmed that I could reproduce the
problem on our downstream kernel (which had the PSR patches picked)
and that the fixes worked for me in that context.

Ah, but it shouldn't be too hard to pick that one patch. Let's see if
that works. I'll pick ("CHROMIUM: drm: Add drm_master_relax debugfs
file (non-root set/drop master ioctls)"). Indeed, it works!

OK, so with the top of Linus's tree (v6.4-rc3-17-g9d646009f65d) plus
the CHROMIUM patch to enable my VT2, I can confirm that I don't see
the issue. I can switch to VT2 and typing works fine. I will say that
on herobrine the backlight is all messed up, but I assume that's an
unrelated issue.

-Doug



> > Regressions happen and sometimes there are corner cases that are harder
> > to find, but this is a breakage of a fundamental feature that was
> > reported before the code was even merged into mainline.
> >
> >> We should have ideally gone with the modparam with the feature patches
> >> itself knowing that it gets enabled for all sinks if PSR is supported.
> >
> > Modparams are things of the past should not be used to enable broken
> > features so that some vendor can tick of their internal lists of
> > features that have been "mainlined".
>
> We have had a history of using modparam with i915 and IIRC amdgpu /
> radeon drivers to allow users to easily check whether new feature works
> for their hardware. My current understanding is that PSR+VT works for on
> some laptops and doesn't on some other laptops, which makes it a valid ca=
se.
>
> >
> > You can carry that single patch out-of-tree to enable this if you need
> > it for some particular use case where you don't care about VTs.
> >
> > But hopefully you can just get this sorted quickly. If not, the revert =
I
> > posted is the way to go rather than adding random module parameters.
> >
> > Johan
>
> --
> With best wishes
> Dmitry
>
