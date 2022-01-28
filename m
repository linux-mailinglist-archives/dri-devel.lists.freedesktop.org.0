Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8CC4A0129
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 20:54:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE7AD10E19D;
	Fri, 28 Jan 2022 19:54:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B718210E116;
 Fri, 28 Jan 2022 19:54:09 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id v67so14318530oie.9;
 Fri, 28 Jan 2022 11:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dbB5bpgJl4M4esLVJEwWsrY33Y3h4Z6V9PbajaNn+YE=;
 b=CNlKJGYp51QoEQWW6xUac3uZY66AwrSyb601s/jQf3nN8SgClfYtlyGcWts8dW9TUf
 xgLOBfoZ3F6KTZePRAxbQWL/W66nd94CqJux/0P/uy8Hez4SiQe7XtvhKGRMa1523WvD
 LkgGhQ+NWSF+B++E6gJ6pHLk8vgfLmpF4gIxCapbvD3LuaWcQmmBybMw+6LkqvfLv8LX
 vBMUEPV4tq99jxeYKwIZGRlvfIFwEjQGrcQWFnPTMXXf9utUoE+zAATwqEs8F8zmJxAe
 dRgXixWo8LvTI8BKdVblRpqbQstZdWC3He3B6AAZzUwiKSnDniWTOrvYy1Z0k74xiaPm
 QOQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dbB5bpgJl4M4esLVJEwWsrY33Y3h4Z6V9PbajaNn+YE=;
 b=IIwtv70m4MeMsk7Pv3JQ6Xu84Ss94NSSYVOaM4lJjGH8LxpT/WqFb1z0s7/LmB4Vfe
 6sRA8/nqIfRa5tVbtqhbBrg50jp9ouclJEPgVbsvR7zcMh0f/SfxH13LFHPQ1F/fVYmb
 w20zDKLuLsbfsxzHU2eCiTa7EdF1wRQ9mxccuZeFC+8iQawmu0y/HQoEsFnygcEkoJV5
 nlKWTSNG3/dloGmFRvlWjcBbzGS7V5/yEBLR97iExY+SDqWkP+iQUn6C+B72+jZFKh7u
 K+dWcYUaStw0JmPyk8va1od4EEImb5aWG1L9SLUP+bDyXiBTn0SMhBxi0q1aaXUkTvIT
 U8hA==
X-Gm-Message-State: AOAM531Xo7D+oNd0WNvmAemsAlb1ZFC+uaQf1PfbKM1PWc1VvAXHE/3b
 MnxRLTP3GiFhEUkiZ0Nqsvg4jlwSYcdrvdpSYQA=
X-Google-Smtp-Source: ABdhPJyVkQJ8OvNjX1NkgBqXVFhUBaE59zpfuiYJJfsJUmqFXHuLHsR0mFw+lVA41cQxJq6mJX37kqVsagd10wLE6j4=
X-Received: by 2002:a05:6808:2189:: with SMTP id
 be9mr11235001oib.93.1643399648949; 
 Fri, 28 Jan 2022 11:54:08 -0800 (PST)
MIME-Version: 1.0
References: <20220124165856.57022-1-zhou1615@umn.edu>
 <YfPC3N+H9Fu/gqpz@kroah.com>
 <536c833413ccbe0b8ad653a50c5ea867bf975290.camel@redhat.com>
In-Reply-To: <536c833413ccbe0b8ad653a50c5ea867bf975290.camel@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 28 Jan 2022 14:53:57 -0500
Message-ID: <CADnq5_MtMPNHbs92OMHEzvPYSHGt=nPJMdrny6Siuvj3SYTAXQ@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/acr: Fix undefined behavior in
 nvkm_acr_hsfw_load_bl()
To: Lyude Paul <lyude@redhat.com>
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 Greg KH <gregkh@linuxfoundation.org>, Kangjie Lu <kjlu@umn.edu>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>, nouveau <nouveau@lists.freedesktop.org>,
 Zhou Qingyang <zhou1615@umn.edu>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 28, 2022 at 2:20 PM Lyude Paul <lyude@redhat.com> wrote:
>
> Sigh-thank you for catching this - I had totally forgot about the umn.edu ban.
> I pushed this already but I will go ahead and send a revert for this patch.
> Will cc you on it as well.

This seems short-sighted.  If the patch is valid I see no reason to
not accept it.  I'm not trying to downplay the mess umn got into, but
as long as the patch is well scrutinized and fixes a valid issue, it
should be applied rather than leaving potential bugs in place.

Alex


>
> On Fri, 2022-01-28 at 11:18 +0100, Greg KH wrote:
> > On Tue, Jan 25, 2022 at 12:58:55AM +0800, Zhou Qingyang wrote:
> > > In nvkm_acr_hsfw_load_bl(), the return value of kmalloc() is directly
> > > passed to memcpy(), which could lead to undefined behavior on failure
> > > of kmalloc().
> > >
> > > Fix this bug by using kmemdup() instead of kmalloc()+memcpy().
> > >
> > > This bug was found by a static analyzer.
> > >
> > > Builds with 'make allyesconfig' show no new warnings,
> > > and our static analyzer no longer warns about this code.
> > >
> > > Fixes: 22dcda45a3d1 ("drm/nouveau/acr: implement new subdev to replace
> > > "secure boot"")
> > > Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
> > > ---
> > > The analysis employs differential checking to identify inconsistent
> > > security operations (e.g., checks or kfrees) between two code paths
> > > and confirms that the inconsistent operations are not recovered in the
> > > current function or the callers, so they constitute bugs.
> > >
> > > Note that, as a bug found by static analysis, it can be a false
> > > positive or hard to trigger. Multiple researchers have cross-reviewed
> > > the bug.
> > >
> > >  drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c | 9 +++++----
> > >  1 file changed, 5 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> > > b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> > > index 667fa016496e..a6ea89a5d51a 100644
> > > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> > > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> > > @@ -142,11 +142,12 @@ nvkm_acr_hsfw_load_bl(struct nvkm_acr *acr, const
> > > char *name, int ver,
> > >
> > >         hsfw->imem_size = desc->code_size;
> > >         hsfw->imem_tag = desc->start_tag;
> > > -       hsfw->imem = kmalloc(desc->code_size, GFP_KERNEL);
> > > -       memcpy(hsfw->imem, data + desc->code_off, desc->code_size);
> > > -
> > > +       hsfw->imem = kmemdup(data + desc->code_off, desc->code_size,
> > > GFP_KERNEL);
> > >         nvkm_firmware_put(fw);
> > > -       return 0;
> > > +       if (!hsfw->imem)
> > > +               return -ENOMEM;
> > > +       else
> > > +               return 0;
> > >  }
> > >
> > >  int
> > > --
> > > 2.25.1
> > >
> >
> > As stated before, umn.edu is still not allowed to contribute to the
> > Linux kernel.  Please work with your administration to resolve this
> > issue.
> >
>
> --
> Cheers,
>  Lyude Paul (she/her)
>  Software Engineer at Red Hat
>
