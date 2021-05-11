Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8296637A7DF
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 15:39:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3F0E6E216;
	Tue, 11 May 2021 13:39:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43DA06E216
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 13:39:48 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id v22so14160375oic.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 06:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DiQlUoRS1KcIp4jb80Idacb5jWTO0UHM89k4RPNvhAM=;
 b=V0SPnP29kVRwVzyYu3yn381mPXr37L4GkNlTSpRf9Z1Lg+xnDbQdJV76vtPxr3dW8v
 G8wcNTNdk/tqvS8IWkyzfV/1AMa1opftnowZP2pvmspSIGvp1WMjZIONfBoapA12eCEl
 pif4tQNvizE6BFuH2BaDH4ht+YXXoHhWNA0fk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DiQlUoRS1KcIp4jb80Idacb5jWTO0UHM89k4RPNvhAM=;
 b=ZcvFrspBFQORnZ0NTKdeo2yEL1G+a8gwDmRawNXQlIeGfBLlkaktIcBgQlbwzKZkaC
 a1haxx6Aq1A+hTIFDFOKFrKNcZgCNz+0+gjnTKpicR7boov/nSDxt4jdcvO4od9KZlKi
 kBk68DXllodeW8Q/nLUwj/N0eKGFNg72RfeH19lslj3xRaaw4Re12J7dBMpYGpWl2occ
 NPYREXUuHsRErd/u0zXZV0o0xfIoHy6bNV/5mQW1CvKeJhZj1xLvqBeCwn4uxDNcWT1w
 kl4ZJqHYxPE4/vn7Auz+PbSjGQ90N7+yp5Ug1HJ1bdLphnWcWW9Y4NuKXxiQ6pf9ukM6
 5h2w==
X-Gm-Message-State: AOAM531XcnOrGmfdf8d42Y81Doh/+MULzm5HZvcAH8mMd7ByfmmKspfs
 xiWH4U8Gl8odJ2HbYC99wrd2mjSW9YI5BMrZb2Bf+Q==
X-Google-Smtp-Source: ABdhPJypOemzDTmFObHTWqXEMZiMoy0D4neOiUWh21fpySuirlm4zFsGDyTRcXNm9CEqwqwnkS3yp1efP8vxyCLQf5s=
X-Received: by 2002:aca:df87:: with SMTP id
 w129mr22385363oig.128.1620740387581; 
 Tue, 11 May 2021 06:39:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210508074118.1621729-1-swboyd@chromium.org>
 <YJlZwYS+oH7W5WjO@phenom.ffwll.local>
 <CAE-0n52S=LFRx93qVyWBpF5PmdCEbWH_+HnN0Do9W45kiJLCbQ@mail.gmail.com>
 <CAKMK7uE_yrXNdEYTf-snNU9dS+=6AKOmUxRuLSHLWBTOtVwpmg@mail.gmail.com>
 <CAE-0n50d8_OtZTpBGaz0uhj6AO823_kwHg9+SJK6ar=e+rGxFA@mail.gmail.com>
 <CAJZ5v0h42fTKueFxrB6fpc9YBVNyDsCBryAf_geS-=0+OQQqjg@mail.gmail.com>
In-Reply-To: <CAJZ5v0h42fTKueFxrB6fpc9YBVNyDsCBryAf_geS-=0+OQQqjg@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 11 May 2021 15:39:36 +0200
Message-ID: <CAKMK7uHXon=k0AxF5fagz1_PW1WONppAZP1cbM72ujYN=pXn+A@mail.gmail.com>
Subject: Re: [PATCH] component: Move host device to end of device lists on
 binding
To: "Rafael J. Wysocki" <rafael@kernel.org>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Russell King <rmk+kernel@arm.linux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 11, 2021 at 12:52 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Mon, May 10, 2021 at 9:08 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> [cut]
>
> >
> > >
> > > > I will try it, but then I wonder about things like system wide
> > > > suspend/resume too. The drm encoder chain would need to reimplement the
> > > > logic for system wide suspend/resume so that any PM ops attached to the
> > > > msm device run in the correct order. Right now the bridge PM ops will
> > > > run, the i2c bus PM ops will run, and then the msm PM ops will run.
> > > > After this change, the msm PM ops will run, the bridge PM ops will run,
> > > > and then the i2c bus PM ops will run. It feels like that could be a
> > > > problem if we're suspending the DSI encoder while the bridge is still
> > > > active.
> > >
> > > Yup suspend/resume has the exact same problem as shutdown.
> >
> > I think suspend/resume has the exact opposite problem. At least I think
> > the correct order is to suspend the bridge, then the encoder, i.e. DSI,
> > like is happening today. It looks like drm_atomic_helper_shutdown()
> > operates from the top down when we want bottom up? I admit I have no
> > idea what is supposed to happen here.
>
> Why would the system-wide suspend ordering be different from the
> shutdown ordering?

At least my point was that both shutdown and suspend/resume have the
same problem, and the righ fix is (I think at least) to add these
hooks to the component.c aggregate ops structure. Hence just adding
new callbacks for shutdown will be an incomplete solution.

I don't feel like changing the global device order is the right
approach, since essentially that's what component was meant to fix.
Except it's incomplete since it only provides a solution for
bind/unbind and not for shutdown or suspend/resume as other global
state changes. I think some drivers "fixed" this by putting stuff like
drm_atomic_helper_shutdown/suspend/resume into early/late hooks, to
make sure that everything is ready with that trick. But that doesn't
compose very well :-/
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
