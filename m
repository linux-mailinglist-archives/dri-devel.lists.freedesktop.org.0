Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DCC224202
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 19:39:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2779C6EE17;
	Fri, 17 Jul 2020 17:39:22 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com
 [IPv6:2607:f8b0:4864:20::a41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FF6D6EE17
 for <dri-devel@freedesktop.org>; Fri, 17 Jul 2020 17:39:21 +0000 (UTC)
Received: by mail-vk1-xa41.google.com with SMTP id b205so2298714vkb.8
 for <dri-devel@freedesktop.org>; Fri, 17 Jul 2020 10:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=oOIi1T3qSHBH51MzlGC0XDR/RneCxeHWL3lEOGZbKJY=;
 b=h50OyDj1X58pC7yEJMwCHYam/5JpjacNj4lnzko/r7vN8UfLwGNHM+oCutt8YGlrWX
 sPZ3WG4CgGPiEsti7uJRLIjgLGclvu+gWYfbmNJlNQmexUpO+essviBd/mlHsE8bWYcQ
 XyzSByoFKpUZu/3vuZVc8VRbmooB91m5COMos=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=oOIi1T3qSHBH51MzlGC0XDR/RneCxeHWL3lEOGZbKJY=;
 b=D+OsYSpNWIccKs5uhGAYOWRdCh5iqIIXpjrZKG982+KFFLfQR9MOWUkwiR/DG8GKmU
 6jtlRMkvMIz/pCR2W4pnfthwC9qLg3CbRVeiz995avSVPzPVgB/tjLfCjQ9SVA4v2caf
 hZrJSa5kRC1PIzzM1QHHXy9kU9hs6o+yRnMTu+R4rhcXkghfm4FkDCAiX1GFgCLeBtUk
 JcA4VYEVF6xM2jGK7Z4U7SQlow74DWlc9niEdz3aNi3mLj/nmdwLuFiLvufEEBRR3ztK
 wMuUJeAYhHMkilLKaKnsQUMhxMiA9GZJAtDJGK/riA/U3Vx4Qe3NWorbFnDUarmdGVnk
 3Q/g==
X-Gm-Message-State: AOAM532IXslTsgZcZfT/oxYu/cvww0uRSMVARmKn2YAjr7r2D2qwGt1T
 s7w3Hf6AVbHk+v1zZ4DMnucse+R2+pI=
X-Google-Smtp-Source: ABdhPJzs3FdlYkBTt0atNgY0I4FjIN92KheKnj9IuQdtGjA+Fq1gAUp3firBNexjQxf49Pd5jnobSg==
X-Received: by 2002:a1f:a18f:: with SMTP id k137mr8313859vke.69.1595007560138; 
 Fri, 17 Jul 2020 10:39:20 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com.
 [209.85.217.54])
 by smtp.gmail.com with ESMTPSA id c11sm1304398vke.50.2020.07.17.10.39.19
 for <dri-devel@freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jul 2020 10:39:19 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id k7so5268613vso.2
 for <dri-devel@freedesktop.org>; Fri, 17 Jul 2020 10:39:19 -0700 (PDT)
X-Received: by 2002:a67:69c1:: with SMTP id e184mr8687935vsc.119.1595007558792; 
 Fri, 17 Jul 2020 10:39:18 -0700 (PDT)
MIME-Version: 1.0
References: <1594996458-15529-1-git-send-email-akhilpo@codeaurora.org>
 <20200717144607.GA16703@jcrouse1-lnx.qualcomm.com>
In-Reply-To: <20200717144607.GA16703@jcrouse1-lnx.qualcomm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 17 Jul 2020 10:39:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vdg36wBJiYM9bxGy-8hjxEf85aYAGuqR=Xh_oM0pLt0g@mail.gmail.com>
Message-ID: <CAD=FV=Vdg36wBJiYM9bxGy-8hjxEf85aYAGuqR=Xh_oM0pLt0g@mail.gmail.com>
Subject: Re: [PATCH v2] drm: msm: a6xx: fix gpu failure after system resume
To: Akhil P Oommen <akhilpo@codeaurora.org>,
 freedreno <freedreno@lists.freedesktop.org>, 
 dri-devel@freedesktop.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
 LKML <linux-kernel@vger.kernel.org>, Matthias Kaehlcke <mka@chromium.org>, 
 Rob Clark <robdclark@gmail.com>, Doug Anderson <dianders@chromium.org>
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

Hi,

On Fri, Jul 17, 2020 at 7:46 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> On Fri, Jul 17, 2020 at 08:04:18PM +0530, Akhil P Oommen wrote:
> > On targets where GMU is available, GMU takes over the ownership of GX GDSC
> > during its initialization. So, move the refcount-get on GX PD before we
> > initialize the GMU. This ensures that nobody can collapse the GX GDSC
> > once GMU owns the GX GDSC. This patch fixes some GMU OOB errors seen
> > during GPU wake up during a system resume.
>
> > Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> > Reported-by: Matthias Kaehlcke <mka@chromium.org>
> > Tested-by: Matthias Kaehlcke <mka@chromium.org>
>
> The Signed-off-by needs to be at the end but I think Rob can do that for you.

It does?  I've always been told that this is supposed to be roughly a
log of what happens.  In that sense you added your SoB before the
review/test happened so it should come before.  I know some
maintainers seem to do things differently but that seems to be the
most common.  In that sense, I think the order that Akhil has is
correct.  ...but, obviously, it's up to the maintainer.  ;-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
