Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C0A1958C3
	for <lists+dri-devel@lfdr.de>; Fri, 27 Mar 2020 15:16:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E206B6EA3C;
	Fri, 27 Mar 2020 14:16:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B09286EA3C
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Mar 2020 14:16:13 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id m11so5699059wrx.10
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Mar 2020 07:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9wNt2gai8dRVSKQAlV2TOplqX3mifpAWTobUqLn101c=;
 b=inBI3zIMOQoWlxqDdeGv06GRSPaAjKkg26RelATkUJiHTcP9LZQnSO/ULU1nW/atKk
 GKf6/AVfYIuDEf5LyNTh33Tp39tDTnVLptNWdPYKqdZR9wn6MHdCwLJaIGX4oKWqUIUQ
 /J0Sq4xc09A5xL4LU1ZpBdePsC1fztREX3HVdk7Y6dBuDQ34vFmYc8s8v4v09jI6Cb1k
 c735gWJCGxyrXyhVtCL0BVi9Q/t9Q2jcXKwDZZrU6N6oS0DhJS8EOvpFdzvjJ3OvqvMe
 xv8OKLs9MFOkQLrsj7FElzDPCHR4BuBZiWvpsmhGIro1hJKXXmCLsDfS/GPcN9NMsQlJ
 H/9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9wNt2gai8dRVSKQAlV2TOplqX3mifpAWTobUqLn101c=;
 b=kASOKQL32RS3VXL0au6LWBG4VQfwoblo8wXPVxX/uthTtMfqiJEcIwVne8HBJjLXw5
 Z4tKR1bN8Y6TlQtryjtCsJizodpflc1VjlXYvzaIhbEDBWF2YYMuDL4JiQU2NpmQ+XNQ
 IN3dhD9zFeWg0ty5Wnh0XOAYwCql5Go+eL0uDzGoqQotAAIorM7zH49jWuuRPJ+47KC3
 Wmc2gigXryXMJBU+K6q+zFPAsP15Tctwzva6QTX8u6Tq3Hwh9Z0XtB7peN+/n1+YStkZ
 J3Fi58Dm6UmKINBeBiyEdQ4LjeR/xIKOxzIEJqDLpo+LXrwMQbAjOAZTHBs30e99hqAJ
 IcNA==
X-Gm-Message-State: ANhLgQ38m0FdyvnAivrD7m5Z/lcctSUMmcIpnPqJE+iUWO9kXvOVuQdH
 aRdPrLIQ3F0Gkxu2G30ZE5kEnOESuCgml4eC6xQ=
X-Google-Smtp-Source: ADFU+vv/Vh/Usi3RX7zJFDIxkoX6XlRPz6qGaxO2o50FKhqyLTNRGqCUFnkaHDBaoZdAfcbG/1I2SUpXx72SUWSdNGo=
X-Received: by 2002:a5d:6187:: with SMTP id j7mr15924936wru.419.1585318572316; 
 Fri, 27 Mar 2020 07:16:12 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200327082453eucas1p15b2371b61f653031408f319cc6d13893@eucas1p1.samsung.com>
 <20200327082446.18480-1-m.szyprowski@samsung.com>
 <CABnpCuDySf89HL2AksMB2fOcVCci+1zgB9r8zjRdpCAH3GWhPA@mail.gmail.com>
 <64025801-10f0-9f28-17b2-2c04d4308ac5@samsung.com>
 <CABnpCuBUEO6V=hwzHkUEKK5KDXC=ovPrTHyb9zFYrj0KaHHdww@mail.gmail.com>
In-Reply-To: <CABnpCuBUEO6V=hwzHkUEKK5KDXC=ovPrTHyb9zFYrj0KaHHdww@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 27 Mar 2020 10:16:01 -0400
Message-ID: <CADnq5_N65tF-b772uJ2E72=Er8JeeX9UZ34PVGqssprHCMGF1g@mail.gmail.com>
Subject: Re: [PATCH] drm/prime: fix extracting of the DMA addresses from a
 scatterlist
To: Shane Francis <bigbeeshane@gmail.com>
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
Cc: linux-samsung-soc@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 "for 3.8" <stable@vger.kernel.org>,
 "Michael J . Ruhl" <michael.j.ruhl@intel.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 27, 2020 at 6:25 AM Shane Francis <bigbeeshane@gmail.com> wrote:
>
> Hello Marek,
>
> On Fri, Mar 27, 2020 at 9:00 AM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
> > > I have tested the above patch against my original issues with amdgpu
> > > and radeon drivers and everything is still working as expected.
> > >
> > > Sorry I missed this in my original patches.
> >
> > No problem. Thanks for testing!
> >
> > Best regards
> > --
> > Marek Szyprowski, PhD
> > Samsung R&D Institute Poland
> >
> Just a thought.
>
> Would it be worth adding some comments to the code to explain why this
> is needed, reading
> the thread around my original patches and the DMA-API documentation it
> is not instantly
> clear why you would be mapping the pages in this way.
>
> Would probably prevent someone in the future making the same mistake I
> did while updating
> this code.

With a comment similar to the commit messaged added to this function,
this patch is:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

Thanks!

Alex
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
