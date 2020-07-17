Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 320EC224523
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 22:24:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BC816E14E;
	Fri, 17 Jul 2020 20:24:23 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0FE46E0E4
 for <dri-devel@freedesktop.org>; Fri, 17 Jul 2020 20:24:21 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id dg28so8624798edb.3
 for <dri-devel@freedesktop.org>; Fri, 17 Jul 2020 13:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UcOeSmTNajKlxkTZ54NN5i0ysWJoAdlrcGAA/78GxpQ=;
 b=KoA4hgce859kSnJSyvomMlV1xsBmgCAAlDU9Bzb/q5p2Ab9+67q5QF3XuAAMpK0ukN
 3P2nx4tfXRCbr1jwYqG9FTPiPx49t31qUyBaAXrPGDWUjqDHZlOjmZlmWK/SU3g/LyKs
 75yzJKISm/gW62f6cL9DQClA8XxbA5poy5ckUBSjgaOdy1ribHskSi+EftXem/L9OU0t
 3ix0QFag8/VPDPDLbEPisFwtku+qj0NKM+8JUxZEYU5nGPkoL9D0HDb/H8E4lByewQoI
 RMP5ro39O7sIsZzGjgbOo3WryMGMo3sZpOvoz8rFgerkcrayFR60UvyHmfcSVEWAfVWZ
 Zqag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UcOeSmTNajKlxkTZ54NN5i0ysWJoAdlrcGAA/78GxpQ=;
 b=OeKKfcGpKym9RK9Mp+y4d54aNq/2A+R93N76XXY6i4cb3xKXKids747dDWKkXPu3kJ
 RGKOUvvjS49m7jAaoI3C6t/c1vDLlp34RIMvbdd/PxGGcNhd5NLf8jqntepFMDq/AHYB
 kj7C+ZdPMVifEV9b1ghRaxoADnKnOV5yj2So3Ed8p2oLepvEzvMpMHNsylIHDeq7wNcS
 PJvd1YnOFe+aYGOyOG6eVjID8bvCXxKu/rfd/LN+FGbCffG4OwuX9YZMTNnM+/KWeKX1
 H5Xh1A842Qu+iOZqdAtiTVOPZBm3EfmF/5YfsqtboC1cyQbXFTNOvl8POWknC7YTY0dF
 GQ5Q==
X-Gm-Message-State: AOAM530Cmw4x0GOHaRc7mfgbxMPn0WnrqnJHHFt0TaO0ry8MOKYrqzxj
 RTx6+c4ICsDhVuBQ1u4BJmq0glqfW6hr4/0avPc=
X-Google-Smtp-Source: ABdhPJx5mFL4De+x85MnBmDv2P7aJhpwZLDm06tgPH4oAUStkwZmhvug/BQ9YZby3s4dP4Ve+SX98GMCH1Sx3YdZCzk=
X-Received: by 2002:a05:6402:a50:: with SMTP id
 bt16mr10575485edb.281.1595017460203; 
 Fri, 17 Jul 2020 13:24:20 -0700 (PDT)
MIME-Version: 1.0
References: <1594996458-15529-1-git-send-email-akhilpo@codeaurora.org>
 <20200717144607.GA16703@jcrouse1-lnx.qualcomm.com>
 <CAD=FV=Vdg36wBJiYM9bxGy-8hjxEf85aYAGuqR=Xh_oM0pLt0g@mail.gmail.com>
In-Reply-To: <CAD=FV=Vdg36wBJiYM9bxGy-8hjxEf85aYAGuqR=Xh_oM0pLt0g@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 17 Jul 2020 13:24:54 -0700
Message-ID: <CAF6AEGvY9qxpi8rqL4Lef+Qs1yc20K3jEewK+9mWuTdhkLDKkA@mail.gmail.com>
Subject: Re: [PATCH v2] drm: msm: a6xx: fix gpu failure after system resume
To: Doug Anderson <dianders@chromium.org>
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
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, LKML <linux-kernel@vger.kernel.org>,
 Matthias Kaehlcke <mka@chromium.org>, dri-devel@freedesktop.org,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 17, 2020 at 10:39 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Fri, Jul 17, 2020 at 7:46 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
> >
> > On Fri, Jul 17, 2020 at 08:04:18PM +0530, Akhil P Oommen wrote:
> > > On targets where GMU is available, GMU takes over the ownership of GX GDSC
> > > during its initialization. So, move the refcount-get on GX PD before we
> > > initialize the GMU. This ensures that nobody can collapse the GX GDSC
> > > once GMU owns the GX GDSC. This patch fixes some GMU OOB errors seen
> > > during GPU wake up during a system resume.
> >
> > > Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> > > Reported-by: Matthias Kaehlcke <mka@chromium.org>
> > > Tested-by: Matthias Kaehlcke <mka@chromium.org>
> >
> > The Signed-off-by needs to be at the end but I think Rob can do that for you.
>
> It does?  I've always been told that this is supposed to be roughly a
> log of what happens.  In that sense you added your SoB before the
> review/test happened so it should come before.  I know some
> maintainers seem to do things differently but that seems to be the
> most common.  In that sense, I think the order that Akhil has is
> correct.  ...but, obviously, it's up to the maintainer.  ;-)

yeah, I chronological order was my understanding too.. but presumably
the Reported-by happened before the Signed-of-by (which is how I
reordered things when applying the patch)

BR,
-R
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
