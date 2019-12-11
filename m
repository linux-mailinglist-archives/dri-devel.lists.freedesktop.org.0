Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB82611A6DB
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 10:22:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BC196EACE;
	Wed, 11 Dec 2019 09:20:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C9136E267
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 02:34:02 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id t17so18009712ilm.13
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 18:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iEKzTuCqR7pNiiQwEPYEy8kcmr1QVizqhrNITFAc66g=;
 b=jhitx4aRBOOz+jmv2AdxMTyqInT1bcrJpJQrh2AujwgKjCk7x80bT0oiDqPkvTISqQ
 VrBBCyTpvQeSo7dTn6TGKeeBekh7krkbUT/+1rwJp9fjTg+daD1Tb3jNrZkOGzm1D4on
 Man28nmAuAeeDJtWUMKkJx51s8TauUwWxFLrICSSBE316NILVKWpSYlYOoVIO9PDmnFb
 ABJtdiBmhEFMvhz+N3VZGM5xiWp2fzeZWIjYuaiaX9IT3cO+Y4395HQCyHACRXdyKj6E
 4b880AaNKmyxDxQzOyorITa2vuUTbVvAkAbshJ0KRN2p6Ur37qO/k9+WLCF8EM3c/TWG
 n7fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iEKzTuCqR7pNiiQwEPYEy8kcmr1QVizqhrNITFAc66g=;
 b=m689MNoL1Bwd+nzIzWbrkqpMLiEtK+DjaEHHkAUwIUfMIYFMNImAEkJWM4qgD/qh3g
 buc4Kve5oWjOKuL+FGG1gK+st6Vzgiszrep8Q0QOyZ9dvv/Q66vZN3UNPBxbD026AhAx
 Tgu8BkcG2lbVCCXH+hFQbdR6Hr6h1AqkuIW/fo8Gd4Wi6CqyJV7/p+kxrOlaErhXxtj2
 iblqT6Oy9VWnFdlSMVpCH2LDFmkB+EO6r4akMyaVhmfqss/O2NhpN70haWQu1bE61Mds
 B16xq3pSWj5CXNmvx95Pw9VN+G1e+xKtBighXTg7wnFf2Gm1uOUgC+MJXY+LbWCovpCa
 sTZQ==
X-Gm-Message-State: APjAAAUEpOJ3odgM1wl5wlfHCWtow8Skjz8jtp+Um+JKboCa+RGbgwx9
 VEmUJOR70+j+bcKKKOivG2L0DQMnmpi24plCKoY=
X-Google-Smtp-Source: APXvYqyiQ0K2uymzvEliQKKGQlUjrB9uGQcWoNfdP49kozTiunn3j2aLL8/7xYJJ45Sdd8cPvRBMm2S64IigQd+05ls=
X-Received: by 2002:a92:8d4e:: with SMTP id s75mr885642ild.172.1576031641683; 
 Tue, 10 Dec 2019 18:34:01 -0800 (PST)
MIME-Version: 1.0
References: <20190925043800.726-1-navid.emamdoost@gmail.com>
 <CAEkB2ESR+GictT00W95pADAeakAuLrTECqUxEt=b7TG2x=FgVw@mail.gmail.com>
In-Reply-To: <CAEkB2ESR+GictT00W95pADAeakAuLrTECqUxEt=b7TG2x=FgVw@mail.gmail.com>
From: Navid Emamdoost <navid.emamdoost@gmail.com>
Date: Tue, 10 Dec 2019 20:33:50 -0600
Message-ID: <CAEkB2ETfnejEiOeOWU1LdSW+SoovdqXOeJX+C=HK9=jMZDP0Ag@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: prevent memory leak in vmw_cmdbuf_res_add
To: VMware Graphics <linux-graphics-maintainer@vmware.com>, 
 Thomas Hellstrom <thellstrom@vmware.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Wed, 11 Dec 2019 09:20:35 +0000
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
Cc: Navid Emamdoost <emamd001@umn.edu>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ping ...

On Thu, Nov 21, 2019 at 12:17 PM Navid Emamdoost
<navid.emamdoost@gmail.com> wrote:
>
> On Tue, Sep 24, 2019 at 11:38 PM Navid Emamdoost
> <navid.emamdoost@gmail.com> wrote:
> >
> > In vmw_cmdbuf_res_add if drm_ht_insert_item fails the allocated memory
> > for cres should be released.
> >
> > Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
>
> Would you please review this patch?
>
> Thanks,
>
> > ---
> >  drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf_res.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf_res.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf_res.c
> > index 4ac55fc2bf97..44d858ce4ce7 100644
> > --- a/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf_res.c
> > +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf_res.c
> > @@ -209,8 +209,10 @@ int vmw_cmdbuf_res_add(struct vmw_cmdbuf_res_manager *man,
> >
> >         cres->hash.key = user_key | (res_type << 24);
> >         ret = drm_ht_insert_item(&man->resources, &cres->hash);
> > -       if (unlikely(ret != 0))
> > +       if (unlikely(ret != 0)) {
> > +               kfree(cres);
> >                 goto out_invalid_key;
> > +       }
> >
> >         cres->state = VMW_CMDBUF_RES_ADD;
> >         cres->res = vmw_resource_reference(res);
> > --
> > 2.17.1
> >
>
>
> --
> Navid.



-- 
Navid.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
