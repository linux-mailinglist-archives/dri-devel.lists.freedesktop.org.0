Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85317B7436
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 09:36:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 072FC6F8DB;
	Thu, 19 Sep 2019 07:35:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B3FD6F434;
 Wed, 18 Sep 2019 19:05:06 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id q10so1834087iop.2;
 Wed, 18 Sep 2019 12:05:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YxdYS1JLBCWQ/wgdV/eSCWJBQ5psEESLzConWod1fsY=;
 b=tGtfuT8HoFLorrEuHzxA3rl4v7olFj48n6aH8XjdoWkRkI2AUjSSajSAVsYz9frHb7
 dt5qYcfuI7+Uz3oP3YKnpQoEeDxqUKhBKwUJDh4L7SnTM158h0pGsJO36PeXLsEDDuCo
 9rUFSPBVIzh4nbvOeN2pF9oXJhjYGZL5r/yW4SvB7P4+JVmHWStjsG5roL0rrkomGdU9
 nPT4EfDkNwn6kooXgsfhP61MyuDSFY2ssWj/Kq8K1aXCArkWjQ9tKMb9uY91KbyvtXzj
 fIO38YyBiWyf2gOifIjmxNLD1nLqeuMQ2RXrByRQxn6u3JUurzx4lPbG7QIGd9ZQDYEX
 3igw==
X-Gm-Message-State: APjAAAVnMdf9s/U7YOXeSPmTJkE8UJrQGfgf8sNoKqVcL1A1tLI0hIge
 onNKqCVv+YTrdYFoVvzvtUTi/yazcKI6AOjAsnM=
X-Google-Smtp-Source: APXvYqw28HmTogLgA33xanl+pjzTOGhtCLg4U6YzfI9W8hTTqTPZjbraV8rowFxmljuf8oJjv8SiLsDzk0TmW115s4w=
X-Received: by 2002:a6b:c9d7:: with SMTP id z206mr6837446iof.172.1568833503715; 
 Wed, 18 Sep 2019 12:05:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190918160943.14105-1-navid.emamdoost@gmail.com>
 <7bab24ff-ded7-9f76-ba25-efd07cdd30dd@amd.com>
In-Reply-To: <7bab24ff-ded7-9f76-ba25-efd07cdd30dd@amd.com>
From: Navid Emamdoost <navid.emamdoost@gmail.com>
Date: Wed, 18 Sep 2019 14:04:52 -0500
Message-ID: <CAEkB2ERC-mUq+SHkaZiiZnJTTcOvjUebRSnKACVUUckCC59a7Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix multiple memory leaks
To: "Koenig, Christian" <Christian.Koenig@amd.com>
X-Mailman-Approved-At: Thu, 19 Sep 2019 07:35:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=YxdYS1JLBCWQ/wgdV/eSCWJBQ5psEESLzConWod1fsY=;
 b=S+99aZrsEa4C/qnJNgJb68AFkEcpOkmnASNLEZU0HgCZCkuO12wP7/MkBhmbiExiZj
 C4bDvQYmPpZHTFhy37raiIOkc8mecBcp+YH0htPPuy6VY9rdVcsua2Zr8LlWpxilK5VQ
 iZwNuco88+rqal/+CRXyjJOzhnBoHdJGvN6WEnADh/0kMnSUVhrQvZs+tdh7U6iVnZgA
 urBiGcmVRJt9BCokTIZJghI134GjMV+6orkRAuHnmpIAiu4GUwPEGwuZbZxxQfUJcnuv
 7R+bDEFMcy7CiWfdfvybclamARtI6rssx+W6nPM2V3CqgizveP+fPpAiEGGO7JFp+CnT
 SB2w==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 "kjlu@umn.edu" <kjlu@umn.edu>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "emamd001@umn.edu" <emamd001@umn.edu>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "smccaman@umn.edu" <smccaman@umn.edu>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Rex Zhu <Rex.Zhu@amd.com>
Content-Type: multipart/mixed; boundary="===============1212390889=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1212390889==
Content-Type: multipart/alternative; boundary="000000000000b366e40592d8839f"

--000000000000b366e40592d8839f
Content-Type: text/plain; charset="UTF-8"

Thanks Christian for the feedback, I'll send a v2.



On Wed, Sep 18, 2019 at 12:31 PM Koenig, Christian <Christian.Koenig@amd.com>
wrote:

> Am 18.09.19 um 18:09 schrieb Navid Emamdoost:
> > In acp_hw_init there are some allocations that needs to be released in
> > case of failure:
> >
> > 1- adev->acp.acp_genpd should be released if any allocation attemp for
> > adev->acp.acp_cell, adev->acp.acp_res or i2s_pdata fails.
> > 2- all of those allocations should be released if pm_genpd_add_device
> > fails.
>
> Good catch, but please use goto error handling instead of adding more
> and more kfree calls.
>
> Regards,
> Christian.
>
> >
> > Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c | 10 +++++++++-
> >   1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
> > index eba42c752bca..dd3fa85b11c5 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
> > @@ -231,17 +231,21 @@ static int acp_hw_init(void *handle)
> >       adev->acp.acp_cell = kcalloc(ACP_DEVS, sizeof(struct mfd_cell),
> >                                                       GFP_KERNEL);
> >
> > -     if (adev->acp.acp_cell == NULL)
> > +     if (adev->acp.acp_cell == NULL) {
> > +             kfree(adev->acp.acp_genpd);
> >               return -ENOMEM;
> > +     }
> >
> >       adev->acp.acp_res = kcalloc(5, sizeof(struct resource),
> GFP_KERNEL);
> >       if (adev->acp.acp_res == NULL) {
> > +             kfree(adev->acp.acp_genpd);
> >               kfree(adev->acp.acp_cell);
> >               return -ENOMEM;
> >       }
> >
> >       i2s_pdata = kcalloc(3, sizeof(struct i2s_platform_data),
> GFP_KERNEL);
> >       if (i2s_pdata == NULL) {
> > +             kfree(adev->acp.acp_genpd);
> >               kfree(adev->acp.acp_res);
> >               kfree(adev->acp.acp_cell);
> >               return -ENOMEM;
> > @@ -348,6 +352,10 @@ static int acp_hw_init(void *handle)
> >               r = pm_genpd_add_device(&adev->acp.acp_genpd->gpd, dev);
> >               if (r) {
> >                       dev_err(dev, "Failed to add dev to genpd\n");
> > +                     kfree(adev->acp.acp_genpd);
> > +                     kfree(adev->acp.acp_res);
> > +                     kfree(adev->acp.acp_cell);
> > +                     kfree(i2s_pdata);
> >                       return r;
> >               }
> >       }
>
>

-- 
Navid.

--000000000000b366e40592d8839f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks=C2=A0Christian for the feedback, I&#39;ll send a v2=
.<div><br></div><div><br></div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Wed, Sep 18, 2019 at 12:31 PM Koenig, Chr=
istian &lt;<a href=3D"mailto:Christian.Koenig@amd.com">Christian.Koenig@amd=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">Am 18.09.19 um 18:09 schrieb Navid Emamdoost:<br>
&gt; In acp_hw_init there are some allocations that needs to be released in=
<br>
&gt; case of failure:<br>
&gt;<br>
&gt; 1- adev-&gt;acp.acp_genpd should be released if any allocation attemp =
for<br>
&gt; adev-&gt;acp.acp_cell, adev-&gt;acp.acp_res or i2s_pdata fails.<br>
&gt; 2- all of those allocations should be released if pm_genpd_add_device<=
br>
&gt; fails.<br>
<br>
Good catch, but please use goto error handling instead of adding more <br>
and more kfree calls.<br>
<br>
Regards,<br>
Christian.<br>
<br>
&gt;<br>
&gt; Signed-off-by: Navid Emamdoost &lt;<a href=3D"mailto:navid.emamdoost@g=
mail.com" target=3D"_blank">navid.emamdoost@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c | 10 +++++++++-<br=
>
&gt;=C2=A0 =C2=A01 file changed, 9 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_acp.c<br>
&gt; index eba42c752bca..dd3fa85b11c5 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c<br>
&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c<br>
&gt; @@ -231,17 +231,21 @@ static int acp_hw_init(void *handle)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0adev-&gt;acp.acp_cell =3D kcalloc(ACP_DEVS, =
sizeof(struct mfd_cell),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GFP_KERNEL);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (adev-&gt;acp.acp_cell =3D=3D NULL)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (adev-&gt;acp.acp_cell =3D=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(adev-&gt;acp.ac=
p_genpd);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0adev-&gt;acp.acp_res =3D kcalloc(5, sizeof(s=
truct resource), GFP_KERNEL);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (adev-&gt;acp.acp_res =3D=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(adev-&gt;acp.ac=
p_genpd);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(adev-&gt;a=
cp.acp_cell);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0i2s_pdata =3D kcalloc(3, sizeof(struct i2s_p=
latform_data), GFP_KERNEL);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (i2s_pdata =3D=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(adev-&gt;acp.ac=
p_genpd);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(adev-&gt;a=
cp.acp_res);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(adev-&gt;a=
cp.acp_cell);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<=
br>
&gt; @@ -348,6 +352,10 @@ static int acp_hw_init(void *handle)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D pm_genpd_a=
dd_device(&amp;adev-&gt;acp.acp_genpd-&gt;gpd, dev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0dev_err(dev, &quot;Failed to add dev to genpd\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0kfree(adev-&gt;acp.acp_genpd);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0kfree(adev-&gt;acp.acp_res);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0kfree(adev-&gt;acp.acp_cell);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0kfree(i2s_pdata);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return r;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><font col=
or=3D"#666666">Navid.</font></div></div></div></div>

--000000000000b366e40592d8839f--

--===============1212390889==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1212390889==--
