Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4C531E00C
	for <lists+dri-devel@lfdr.de>; Wed, 17 Feb 2021 21:15:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F31B76E9DA;
	Wed, 17 Feb 2021 20:15:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A65D66E9D9;
 Wed, 17 Feb 2021 20:15:15 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id v14so18710449wro.7;
 Wed, 17 Feb 2021 12:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=/SfDLUSdiw9Q0zmXjgq53DuIhtEZQNoVI4O6RzhHV5s=;
 b=RL1PZzFJ8Zfu/C4DugYCVVvJS/urwTb+nyGS57REvMlnC8ygsGGEPLIz/CuZmxVs9h
 1rkXlPTFYfa1sVHKWXhM2IMyvXzX0rdAzR3HaB1jXAW88P04jqjJq1nJtk8L1O+fIuMU
 01AdzJGMnJTaCW78pDhbWXDVAg14icUpLEukHf8m1FZ94SEYKyN2skCTSwAHWcwWWbRl
 gy2zAEk0VqEj8hjp20jS3NK0fD3/zv35CS/oJpjLg+8mWUfMNKQCg8PRtBX+zp5mvUyG
 ImPNQnUXJLRwjlz9Hhhrcj7H0PpBHjm4IK/dwdCM2X7Q/4+4X95hmNWsWvVrxK8c0niF
 sumQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=/SfDLUSdiw9Q0zmXjgq53DuIhtEZQNoVI4O6RzhHV5s=;
 b=noLfZzTydMI6mol3ClYE4rqFNKbb1+ID9OTFPBQwCXHZ6u6venMMVrFyAQ7WK7zi2X
 uGc065ZIRBa5H3lwKKaFp7GCslfXxZzLz5ZkjupS3+QUxT5w6N9dp95XgWSWyGhdB09i
 XlYwPm1sxXebeR4xunEB5CEXPKFwhxs5MUhPWiWN82SnQL4+5ol0niNWTGhdsn1V0+SE
 0fOdQQbbNYv0SWvFUzmfY3nx3EwUJFlo3tbxPR4iKttlMXl0xEf4SdOnxbd88tYaQ0V9
 kOqNHGhB/ZWd+kqxTG+e3aAhzQs2ZDM3M8pyaLqUorBD8KszIkk2yQFxqT/TnMxwaCzM
 qn0g==
X-Gm-Message-State: AOAM531XV5A1Unx2J0khoeptZnL8re37pZphy90D0YmZsDd1IBQF2Dua
 YqEoqEs+AypombPwCvwZLw8czw8Ud2PKQTiwWJo=
X-Google-Smtp-Source: ABdhPJyALfdccz8HAiEV1G+Ol8dEXGYdIHVG4KvOrIla3e55eOzDS0TiG77fLq668VEf7TMpr8wtJRnqa8N4/O68KWU=
X-Received: by 2002:a5d:4ecf:: with SMTP id s15mr902647wrv.132.1613592914278; 
 Wed, 17 Feb 2021 12:15:14 -0800 (PST)
MIME-Version: 1.0
References: <20210216200909.19039-1-jonathan@marek.ca>
 <CAF6AEGv53nnzqMgTfSA6t2YpHx1dDW8UqnH9Gw0w3p8bf0mTLw@mail.gmail.com>
 <775436ba-c94a-ab22-d65b-b2391047ec65@codeaurora.org>
 <20210217190820.GA2229@jcrouse1-lnx.qualcomm.com>
In-Reply-To: <20210217190820.GA2229@jcrouse1-lnx.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 17 Feb 2021 12:18:07 -0800
Message-ID: <CAF6AEGsHws23ozeJ8G23LFQ8J=CVVrx5xvkSgBuE_uSwT4YurQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: fix for kernels without CONFIG_NVMEM
To: Akhil P Oommen <akhilpo@codeaurora.org>, Rob Clark <robdclark@gmail.com>, 
 Jonathan Marek <jonathan@marek.ca>,
 freedreno <freedreno@lists.freedesktop.org>, 
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Eric Anholt <eric@anholt.net>, Sharat Masetty <smasetty@codeaurora.org>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 17, 2021 at 11:08 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> On Wed, Feb 17, 2021 at 07:14:16PM +0530, Akhil P Oommen wrote:
> > On 2/17/2021 8:36 AM, Rob Clark wrote:
> > >On Tue, Feb 16, 2021 at 12:10 PM Jonathan Marek <jonathan@marek.ca> wrote:
> > >>
> > >>Ignore nvmem_cell_get() EOPNOTSUPP error in the same way as a ENOENT error,
> > >>to fix the case where the kernel was compiled without CONFIG_NVMEM.
> > >>
> > >>Fixes: fe7952c629da ("drm/msm: Add speed-bin support to a618 gpu")
> > >>Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> > >>---
> > >>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++---
> > >>  1 file changed, 3 insertions(+), 3 deletions(-)
> > >>
> > >>diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > >>index ba8e9d3cf0fe..7fe5d97606aa 100644
> > >>--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > >>+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > >>@@ -1356,10 +1356,10 @@ static int a6xx_set_supported_hw(struct device *dev, struct a6xx_gpu *a6xx_gpu,
> > >>
> > >>         cell = nvmem_cell_get(dev, "speed_bin");
> > >>         /*
> > >>-        * -ENOENT means that the platform doesn't support speedbin which is
> > >>-        * fine
> > >>+        * -ENOENT means no speed bin in device tree,
> > >>+        * -EOPNOTSUPP means kernel was built without CONFIG_NVMEM
> > >
> > >very minor nit, it would be nice to at least preserve the gist of the
> > >"which is fine" (ie. some variation of "this is an optional thing and
> > >things won't catch fire without it" ;-))
> > >
> > >(which is, I believe, is true, hopefully Akhil could confirm.. if not
> > >we should have a harder dependency on CONFIG_NVMEM..)
> > IIRC, if the gpu opp table in the DT uses the 'opp-supported-hw' property,
> > we will see some error during boot up if we don't call
> > dev_pm_opp_set_supported_hw(). So calling "nvmem_cell_get(dev, "speed_bin")"
> > is a way to test this.
> >
> > If there is no other harm, we can put a hard dependency on CONFIG_NVMEM.
>
> I'm not sure if we want to go this far given the squishiness about module
> dependencies. As far as I know we are the only driver that uses this seriously
> on QCOM SoCs and this is only needed for certain targets. I don't know if we
> want to force every target to build NVMEM and QFPROM on our behalf. But maybe
> I'm just saying that because Kconfig dependencies tend to break my brain (and
> then Arnd has to send a patch to fix it).
>

Hmm, good point.. looks like CONFIG_NVMEM itself doesn't have any
other dependencies, so I suppose it wouldn't be the end of the world
to select that.. but I guess we don't want to require QFPROM

I guess at the end of the day, what is the failure mode if you have a
speed-bin device, but your kernel config misses QFPROM (and possibly
NVMEM)?  If the result is just not having the highest clk rate(s)
available, that isn't the end of the world.  But if it makes things
not-work, that is sub-optimal.  Generally, especially on ARM, kconfig
seems to be way harder than it should be to build a kernel that works,
if we could somehow not add to that problem (for both people with a6xx
and older gens) that would be nice ;-)

BR,
-R
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
