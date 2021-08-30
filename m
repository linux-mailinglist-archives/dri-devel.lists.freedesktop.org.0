Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 929263FAF7A
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 03:17:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 629C18990D;
	Mon, 30 Aug 2021 01:17:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 735E98990D
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 01:17:44 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id s15so7088605qta.10
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Aug 2021 18:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WfXFIu2YP/cyEtXqUoY+pbv5W2e1wSkIPAhVHrp+0/4=;
 b=W1ici69Kt2rAChENIXMHZGGffeOYJlATguvIpNwgAHVB7g5juXF2AiTxCQ6wfYSrFA
 PDa+pXiZVHWIgyW/S7pjve7GPhyvwpUz5M1ZNMF1e9dW21JQy7ZLuO59I53+J8wT3gpB
 1SC+YO+ue2sAQKcWXpif7QJhykrUotm96p4T56hDFOYsi0KlRpuOPI1N/rJXugV1dSNU
 Z2itCS+9uIhP/9XHFxX4EzJmD3ObKjuwkF0rNFtLwStYcnPx8QFp5jYPmL8IZuLQMdyS
 3H5fMitmMhO8ddUQPHreyR4Z+yEoBB+NgWgKoecdEhbWYz2HSttqszHbANPbPAEeiyaB
 Rh5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WfXFIu2YP/cyEtXqUoY+pbv5W2e1wSkIPAhVHrp+0/4=;
 b=Te+cGs2SuGHm9wzjV1AUxG/aXMYBz0E17h+Hp4c6BXKV5osgxUkhJ/L9ddmP4tKQmN
 fj8tbi7fo95y0jExBCLIjTwWVDRwUN9gKHS+CN2XLWiOeR6Hm2jG2kq2lLqL/gm/ZmEY
 wRJqiKWneFcUxhB0nIB5psBuati8pwY7/f7zxw+fbkBFeMpehzTiOe10LkeB7GeXRQQv
 kiBwYZKjwE6bemFe5RVLQ8smWQt/T8yNEuIOit1gtQG22Gcj18FPqrP4M/3nMUQDchOA
 tEHO3bwTG8z1PYf+6OU8giV9p3fUlXNCFMaplieAIs+u88U8FAikWLr8ZxHGORCjpiaQ
 p/bA==
X-Gm-Message-State: AOAM532WI2HhET0jsOSpSu/8+QiErnKoKNB0sWhcqDd+X+XsjjSmpR9I
 /HwuYmW0Phk8dR5ysE+oXkvgpVIQH57XkKj1Xc7yyA==
X-Google-Smtp-Source: ABdhPJx8aZaQ2hRtqSFrECAuYeiv3KsLCobfsAE1chhz9/GxB0w+F/Ai49RdNUU/F53c3wne99H6s6bjr/joVRjQkpU=
X-Received: by 2002:ac8:66da:: with SMTP id m26mr18703305qtp.273.1630286263447; 
 Sun, 29 Aug 2021 18:17:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210829203027.276143-1-marijn.suijten@somainline.org>
 <20210829203027.276143-3-marijn.suijten@somainline.org>
 <CAA8EJppmBvohk3CC87N_P3m+CP=bRLWWknS7esDrYb-xArJFvg@mail.gmail.com>
 <a27b4e74-3856-8c5c-73af-05e976430ea2@somainline.org>
In-Reply-To: <a27b4e74-3856-8c5c-73af-05e976430ea2@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 30 Aug 2021 04:17:32 +0300
Message-ID: <CAA8EJpp38fRff+j-+iG2pATSQ9e_R4zRxepmbGqpKP=gcOZotA@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/msm/dsi: Use "ref" fw clock instead of global
 name for VCO parent
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Martin Botka <martin.botka@somainline.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>,
 Pavel Dubrova <pashadubrova@gmail.com>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Abhinav Kumar <abhinavk@codeaurora.org>, Jonathan Marek <jonathan@marek.ca>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
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

On Mon, 30 Aug 2021 at 00:53, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> Hi Dmitry,
>
> On 8/29/21 10:39 PM, Dmitry Baryshkov wrote:
> > Hi,
> >
> > On Sun, 29 Aug 2021 at 23:30, Marijn Suijten
> > <marijn.suijten@somainline.org> wrote:
> >>
> >> All DSI PHY/PLL drivers were referencing their VCO parent clock by a
> >> global name, most of which don't exist or have been renamed.  These
> >> clock drivers seem to function fine without that except the 14nm driver
> >> for the sdm6xx [1].
> >>
> >> At the same time all DTs provide a "ref" clock as per the requirements
> >> of dsi-phy-common.yaml, but the clock is never used.  This patchset puts
> >> that clock to use without relying on a global clock name, so that all
> >> dependencies are explicitly defined in DT (the firmware) in the end.
> >
> > msm8974 (28nm-hpm) does not define the "ref" clock. So you'd have to:
> > 1) add ref clock to the dtsi (should come in a separate patch).
>
>
> Thanks for double-checking and noticing this!  I've queued up this patch
> for v2.
>
> > 2) add .name = "xo" as a fallback to the 28nm driver (to be compatible
> > with older devices)
>
>
> Are there msm8974 devices out there that might upgrade kernels, but not
> firmware (DT)?  On other boards (sdm630) I'm removing these from various
> drivers as to not have any possibility of relying on global names, in
> favour of having the clock dependencies fully specified in the DT.

IIUC it is a general policy of trying to be (somewhat)
backwards-compatible. For example because your dts might come from a
different source/be a part of different build process/etc.

>
> > Other than that this looks good to me.
>
>
> Any r-b/a-b/t-b I can pick up for the next round?

Let's get those issues fixed and I'll respond with R-B tags


-- 
With best wishes
Dmitry
