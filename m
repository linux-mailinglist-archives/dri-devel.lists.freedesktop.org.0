Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B661CA5DFB4
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 16:06:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 399CC8949C;
	Wed, 12 Mar 2025 15:06:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HEo1wxqr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D3258949C
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 15:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741791961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VLuwiC2pRqhuTJ9Oq94ogo5kl1tkXphwQnMrVR3NtuU=;
 b=HEo1wxqr8s1iun+1wQIhYcrWEGneEVybQzYg1NOONk4xrU1H/Yo1Wh/oGeXba/KaMKpfj6
 /c0xm2h56ABB6+57c1/yzmEFZW8xOH/DdgEWQoqEjmqgpsiyfx8UkQIfL8WsDHb7svG0i0
 1SuKpqbgQHtSSJadZqoHhsYkVxEKkAw=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-339-ZQCqrn2xOfuvkUXeWFlu9Q-1; Wed, 12 Mar 2025 11:05:59 -0400
X-MC-Unique: ZQCqrn2xOfuvkUXeWFlu9Q-1
X-Mimecast-MFC-AGG-ID: ZQCqrn2xOfuvkUXeWFlu9Q_1741791958
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-6fd010df0f4so103595767b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 08:05:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741791958; x=1742396758;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VLuwiC2pRqhuTJ9Oq94ogo5kl1tkXphwQnMrVR3NtuU=;
 b=n5HvP7IlqQtpe8d8UHRHMcJw4g/Mt1nbUI7xO1b6a5Gcs6YY9ShCX2QW1qBDjdIuq6
 Xk2qxelPnq3wZTdrc/uLfPefQrCHqUeq5TwFLziRFqSv5bBTCdPTxmUblBF7V+0Z/IL0
 RtdVf+XzqlpNdQHUvxlvZWXVjQhYGOa0+API4Hexih5pFdBaupDRJ+pmS7TTTuatY5yC
 9Oo7jlvMoDS+dz+eRubvbqvXuYh4g9K7LeqiXxO5Zn01C/4OEzHd26PCwEvoM8TtJZoI
 uIKG+61il9riq2yBG4zSqDTTVxdON/2ZHkUDs8dT7xuSmjsGaryYtsL57BCvmmlLFuUM
 LSXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUmfohi2dAbCA5oTAFC5KmoCXwtzvR5hYwND2kAQMrm+qyCxUx+js+k4Zxr8dEKtnYl8nSy7MUMiA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxz63l+/vaa5afo5qimM+BQ5c16tNxbr/Tq5E8xLkEM0CKTKnBa
 nHMRuhea60VivmF+Ak539iWlp7Nv9T3UZcQvgQaCJVjPNAERHLYUueHLqCEUjgMhcPrzo8MO1Nw
 neQF9JA03Iv/phkJZIb2Cq+XOrGLJKUIbKS6bbak5A6n6uHQD7Y0J2nrLJeM6vIqm1iJCv0Lp0R
 bXLKLjxAfO6//auvdQoQ6R+lu+8Qevm084taAvDQdY
X-Gm-Gg: ASbGncuUM9wlKvsGNBHzAWE96V1z8FVfl9hfvkXq5u8Ph3FT5iULz3qfUAFlNq188E7
 vxQEuEI+Bh4PgDRzcTiXuA1WmYaAas1747QqJNpZZFeDvdJkesD/BG+Xn45+ngb8NwjUBu7A=
X-Received: by 2002:a05:690c:6209:b0:6f9:447d:d1a2 with SMTP id
 00721157ae682-6febf3aea30mr301391557b3.29.1741791958111; 
 Wed, 12 Mar 2025 08:05:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRrR+Eo+KZP7LPvShTg684uN1fsISawmw99lnSm1t37UzRhQea46JADRu/Jg/kfJzWWWwwF+jTjtb2yDlVWeQ=
X-Received: by 2002:a05:690c:6209:b0:6f9:447d:d1a2 with SMTP id
 00721157ae682-6febf3aea30mr301391077b3.29.1741791957793; Wed, 12 Mar 2025
 08:05:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250310-mipi-synaptic-1-v2-1-20ee4397c670@redhat.com>
 <20250311-warm-icy-rottweiler-cefcdd@houat>
In-Reply-To: <20250311-warm-icy-rottweiler-cefcdd@houat>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 12 Mar 2025 10:03:26 -0400
X-Gm-Features: AQ5f1JqGggsxPPqi5PUKMmjVgrLyz2z57NdnI73XUpwwhIIQTyXfEFl9yy8SG7I
Message-ID: <CAN9Xe3Qwu=E=VVZZ_8EHPF7Xsk6Zcbp=R_b=cRgF=9SWCkmsqA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel/synaptics-r63353: Use _multi variants
To: Maxime Ripard <mripard@kernel.org>
Cc: Michael Trimarchi <michael@amarulasolutions.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Tejas Vipin <tejasvipin76@gmail.com>, Doug Anderson <dianders@chromium.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yniOq9oX8BqYdoQXXkveVNhiCpWwOccTGPBoZKbK20k_1741791958
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000eada6b0630268aa8"
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

--000000000000eada6b0630268aa8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 3:31=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:

> On Mon, Mar 10, 2025 at 04:58:22PM -0400, Anusha Srivatsa wrote:
> > Move away from using deprecated API and use _multi
> > variants if available. Use mipi_dsi_msleep()
> > and mipi_dsi_usleep_range() instead of msleep()
> > and usleep_range() respectively.
> >
> > Used Coccinelle to find the multiple occurences.
> > SmPl patch:
> > @rule@
> > identifier dsi_var;
> > identifier r;
> > identifier func;
> > type t;
> > position p;
> > expression dsi_device;
> > expression list es;
> > @@
> > t func(...) {
> > ...
> > struct mipi_dsi_device *dsi_var =3D dsi_device;
> > +struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi_var };
> > <+...
> > (
> > -mipi_dsi_dcs_write_seq(dsi_var,es)@p;
> > +mipi_dsi_dcs_write_seq_multi(&dsi_ctx,es);
> > |
> > -mipi_dsi_generic_write_seq(dsi_var,es)@p;
> > +mipi_dsi_generic_write_seq_multi(&dsi_ctx,es);
> > |
> > -mipi_dsi_generic_write(dsi_var,es)@p;
> > +mipi_dsi_generic_write_multi(&dsi_ctx,es);
> > |
> > -r =3D mipi_dsi_dcs_nop(dsi_var)@p;
> > +mipi_dsi_dcs_nop_multi(&dsi_ctx);
> > |
> > ....rest of API
> > ..
> > )
> > -if(r < 0) {
> > -...
> > -}
> > ...+>
>
> Again, you need to provide the full coccinelle script here otherwise
> it's useless. And I have serious doubts that it's actually the script
> you used, because ...
>
>
I had another rule just for msleeps and usleep(). The commit msg is getting
too big with just the script. But yes, here you go:
@rule_4@
identifier dsi_var;
identifier r;
identifier func;
type t;
position p;
expression dsi_device;
expression list es;
@@
t func(...) {
...
struct mipi_dsi_device *dsi_var =3D dsi_device;
+struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi_var };
<+...
(
-r =3D msleep(es)@p;
+r =3D mipi_dsi_msleep(&dsi_ctx,es);
|
-msleep(es)@p;
+mipi_dsi_msleep(&dsi_ctx,es);
|
-r =3D usleep_range(es)@p;
+r =3D mipi_dsi_usleep_range(&dsi_ctx,es);
|
-usleep_range(es)@p;
+mipi_dsi_usleep_range(&dsi_ctx,es);
)
...+>
}


> > @@ -106,53 +107,46 @@ static int r63353_panel_power_off(struct
> r63353_panel *rpanel)
> >  static int r63353_panel_activate(struct r63353_panel *rpanel)
> >  {
> >       struct mipi_dsi_device *dsi =3D rpanel->dsi;
> > -     struct device *dev =3D &dsi->dev;
> > -     int i, ret;
> > +     struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi };
> > +     int i;
> >
> > -     ret =3D mipi_dsi_dcs_soft_reset(dsi);
> > -     if (ret < 0) {
> > -             dev_err(dev, "Failed to do Software Reset (%d)\n", ret);
> > +     mipi_dsi_dcs_soft_reset_multi(&dsi_ctx);
> > +     if (dsi_ctx.accum_err)
> >               goto fail;
> > -     }
>
> This changes was definitely not what the script is doing.
>

It isnt. Using coccinelle for the major part of pattern matching and
replacing the newer _multi variant API. Some handling (including a newline
that it introduces) and  the returns depend on a case by case basis, which
had to be done manually.

Anusha

>
> Maxime
>

--000000000000eada6b0630268aa8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 11,=
 2025 at 3:31=E2=80=AFAM Maxime Ripard &lt;<a href=3D"mailto:mripard@kernel=
.org">mripard@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On Mon, Mar 10, 2025 at 04:58:22PM -0400, Anusha Sr=
ivatsa wrote:<br>
&gt; Move away from using deprecated API and use _multi<br>
&gt; variants if available. Use mipi_dsi_msleep()<br>
&gt; and mipi_dsi_usleep_range() instead of msleep()<br>
&gt; and usleep_range() respectively.<br>
&gt; <br>
&gt; Used Coccinelle to find the multiple occurences.<br>
&gt; SmPl patch:<br>
&gt; @rule@<br>
&gt; identifier dsi_var;<br>
&gt; identifier r;<br>
&gt; identifier func;<br>
&gt; type t;<br>
&gt; position p;<br>
&gt; expression dsi_device;<br>
&gt; expression list es;<br>
&gt; @@<br>
&gt; t func(...) {<br>
&gt; ...<br>
&gt; struct mipi_dsi_device *dsi_var =3D dsi_device;<br>
&gt; +struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi_var };<br>
&gt; &lt;+...<br>
&gt; (<br>
&gt; -mipi_dsi_dcs_write_seq(dsi_var,es)@p;<br>
&gt; +mipi_dsi_dcs_write_seq_multi(&amp;dsi_ctx,es);<br>
&gt; |<br>
&gt; -mipi_dsi_generic_write_seq(dsi_var,es)@p;<br>
&gt; +mipi_dsi_generic_write_seq_multi(&amp;dsi_ctx,es);<br>
&gt; |<br>
&gt; -mipi_dsi_generic_write(dsi_var,es)@p;<br>
&gt; +mipi_dsi_generic_write_multi(&amp;dsi_ctx,es);<br>
&gt; |<br>
&gt; -r =3D mipi_dsi_dcs_nop(dsi_var)@p;<br>
&gt; +mipi_dsi_dcs_nop_multi(&amp;dsi_ctx);<br>
&gt; |<br>
&gt; ....rest of API<br>
&gt; ..<br>
&gt; )<br>
&gt; -if(r &lt; 0) {<br>
&gt; -...<br>
&gt; -}<br>
&gt; ...+&gt;<br>
<br>
Again, you need to provide the full coccinelle script here otherwise<br>
it&#39;s useless. And I have serious doubts that it&#39;s actually the scri=
pt<br>
you used, because ...<br>
<br></blockquote><div><br></div><div>I had another rule just for msleeps an=
d usleep(). The commit msg is getting too big with just the script. But yes=
, here you go:</div>@rule_4@<br>identifier dsi_var;<br>identifier r;<br>ide=
ntifier func;<br>type t;<br>position p;<br>expression dsi_device;<br>expres=
sion list es;<br>@@<br>t func(...) {<br>...<br>struct mipi_dsi_device *dsi_=
var =3D dsi_device;<br>+struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =
=3D dsi_var };<br>&lt;+...<br>(<br>-r =3D msleep(es)@p;<br>+r =3D mipi_dsi_=
msleep(&amp;dsi_ctx,es);<br>|<br>-msleep(es)@p;<br>+mipi_dsi_msleep(&amp;ds=
i_ctx,es);<br>|<br>-r =3D usleep_range(es)@p;<br>+r =3D mipi_dsi_usleep_ran=
ge(&amp;dsi_ctx,es);<br>|<br>-usleep_range(es)@p;<br>+mipi_dsi_usleep_range=
(&amp;dsi_ctx,es);<br>)<br>...+&gt;<br>}<br><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
&gt; @@ -106,53 +107,46 @@ static int r63353_panel_power_off(struct r63353_=
panel *rpanel)<br>
&gt;=C2=A0 static int r63353_panel_activate(struct r63353_panel *rpanel)<br=
>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct mipi_dsi_device *dsi =3D rpanel-&gt;d=
si;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct device *dev =3D &amp;dsi-&gt;dev;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0int i, ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =
=3D dsi };<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int i;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0ret =3D mipi_dsi_dcs_soft_reset(dsi);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;Fa=
iled to do Software Reset (%d)\n&quot;, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mipi_dsi_dcs_soft_reset_multi(&amp;dsi_ctx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (dsi_ctx.accum_err)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
<br>
This changes was definitely not what the script is doing.<br></blockquote><=
div><br></div><div>It isnt. Using coccinelle for the major part of pattern =
matching and replacing the newer _multi variant API. Some handling (includi=
ng a newline that it introduces) and=C2=A0 the returns depend on a case by =
case basis, which had to be done manually.</div><div><br></div><div>Anusha<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Maxime<br>
</blockquote></div></div>

--000000000000eada6b0630268aa8--

