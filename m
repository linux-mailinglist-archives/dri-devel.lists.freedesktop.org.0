Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 528783420EF
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 16:27:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31A9F6EA3C;
	Fri, 19 Mar 2021 15:27:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ACCB6EA5D;
 Fri, 19 Mar 2021 15:27:03 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id 61so9495602wrm.12;
 Fri, 19 Mar 2021 08:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gvh5IzYHTObqHI3vd7r3li3yWFFbiFLNzISSaMCoxao=;
 b=qgeeSL4tmHxIIKsIXPSCoDU2YZv1gkDExJKE+OCC0cdBvQRcB5tZypCVIGfnDMF6+w
 t+gm2pQfScCzkJVlbNC3BLzNFMSjzKh0j2EJnL37uh6tCE0sj6r2kJa9chr9oe/mtjqt
 pn22G6leatJ1E+XkLkSGuE/r5AdiSHtG1toUUtaAd9MRHbTWDmGbhqfKSiNpvgs6v0/7
 RXoFG3qM63RF8oL6ImkbprgourT/0zt7HrCwPP9eKmctRVOP+68wtbVjvd9lUDWpdWS2
 p7O2iObAJ0aiE2KPtK9hu+huhTsFH9fFgfjo//ek2vV9azebyVsoWvgBAA8abSY6+u6M
 aJOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gvh5IzYHTObqHI3vd7r3li3yWFFbiFLNzISSaMCoxao=;
 b=DFetI2YerVSFcKXVrEaafAka6Fmwsd8fs4ZGCEDrX+rNJ/DIoNAdgYalm6Nias3jvy
 tI1EhMbyzndZgwdHvGQZ5lJdiWcpweQ8Z52O6RAyzG7Vd57jZZT9Iw9CdHdspk9sPhtZ
 kJ2xTAznZT50XK8Jb/Kfya6hvvCtON6KO2mprds9pEaJ/APvrKvhtlCio1ITQVwONT5p
 vVIe1Fza9bFXAjRlu5pGC617lJ5uE46sdDj1eAONHPBBdw0w/GqHhU5akFEPqYHSLsrl
 Pe7XQ/Qe/094Xk/onDTbllawG98syZPEzedQLzKb3pyivQjkMOY18Pc9KHGTdZaB2yXb
 k/Pg==
X-Gm-Message-State: AOAM530cp3zoEuHDF6WBWaHCq2JxfgkFHAP2WoRE4dfpBsAjpiGcbSPT
 wM/AeQvyAYS63T7Ee+GyrgvSCVQqJZoCCoJKbm0=
X-Google-Smtp-Source: ABdhPJzEhz8Z9xqP3e4t7/ZysEmGfcbBrY+UUjoLI5+CPNKPmNo7GHtQxga++FhVy5w6xi2tsM+UoN2ps7L+a49zduQ=
X-Received: by 2002:adf:fb42:: with SMTP id c2mr5121562wrs.83.1616167622087;
 Fri, 19 Mar 2021 08:27:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210301214152.1805737-1-dmitry.baryshkov@linaro.org>
 <CAOMZO5Br85sf+ndiOWzeG7DgpqVHpXtnNGZLsVMOpBC5eVE2Aw@mail.gmail.com>
 <CAF6AEGtYJegOPt4dju5wyzp+WEhXdKyeUbkoO-oDzSC2aR_9ZQ@mail.gmail.com>
 <CAOMZO5Bd68TtZ=-X_Gg7n9W4BsdAhbQAO2JhjMQvwtjdoWsn2A@mail.gmail.com>
In-Reply-To: <CAOMZO5Bd68TtZ=-X_Gg7n9W4BsdAhbQAO2JhjMQvwtjdoWsn2A@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 19 Mar 2021 08:30:13 -0700
Message-ID: <CAF6AEGtj22ut=YsL4So6NtoC06swtQcCh24rZs_aryq2SYdQbA@mail.gmail.com>
Subject: Re: [PATCH] gpu/drm/msm: fix shutdown hook in case GPU components
 failed to bind
To: Fabio Estevam <festevam@gmail.com>
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
 David Airlie <airlied@linux.ie>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 19, 2021 at 8:13 AM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Rob,
>
> On Fri, Mar 19, 2021 at 11:44 AM Rob Clark <robdclark@gmail.com> wrote:
>
> > I think that might not help if something fails to probe due to (for
> > example) a missing dependency, so !priv->kms is probably a better
> > check to cover both cases.  But the 2nd patch makes a good point, that
> > the suspend/resume path probably needs the same treatment
>
> Thanks for the feedback.
> I will follow the same approach for fixing the suspend/resume path then.
>
> Let me test it and then I will re-submit Dmitry's patch and the one
> for suspend/resume as part of a patch series.

Thanks,

BR,
-R
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
