Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06790CF75CF
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 09:53:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D3DE10E1CD;
	Tue,  6 Jan 2026 08:53:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kaO5BUkt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9611010E1CD
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 08:53:53 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-b76b5afdf04so138919166b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jan 2026 00:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767689632; x=1768294432; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8zj03KMt0f+v/u5GUo/vSld4cloIhAocdnrGClwkxRI=;
 b=kaO5BUkt5coDsUJW27z4yXb1PpMpW3PoNvGS8bFfqsbI4+t64ay88t1EE2XSE+AthW
 2990rqz0dZ1Y/9fn81U5ujmIYYPJlI2aLfyWwZBUzipI7CTW+hHfDHmUJ1b6Kd9eHkdx
 YiOPWFq24TyNcqfhnryWklWy9oYTazjL+/XYkL234DTHpuXIoJqd43VeIQiev4OeTxRq
 W+An6qStioi/D9NWnUukkf4ZaLadZgXW+28rDVv16/k3DGZuL5YUPIJPREb8uDpUBALX
 UNkDCJOjxgAY7peMBhv4JB0p06GirapnuY7ILHFwVXjBAC1LPmpcJkU+pnAFJe0x0yu+
 btwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767689632; x=1768294432;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8zj03KMt0f+v/u5GUo/vSld4cloIhAocdnrGClwkxRI=;
 b=ZNuyqWP4MT+pofj+LhZFcMJqIfJoLgDAb0aM36AxX9PYnJvL+v8Lczs02DWWj+hbp1
 qRuv+GtT6O//Hb6qqgXkR4eG5Bsp+WxXSc/3U+5ne1XIL7rGCKAK4e1Ib2542GJV3903
 aLNi4Ju8ZL0O7aidDsLPFcLNwzdnpoP7xSO28SxJXWBEdIkyOlhEImIMqEJy57pdw1Wm
 HySlOPZvfQnvvunHHmf4+1pbKI7Dg5TAuF0GqNOWYppEUs2sbH0UBY3IO9+u8E51oQo9
 UAsOQAp73wdgaBheAUBw8EAo+OqrdC9qjeU6dg6FrRwkGtm0biMAmJ9E230TupcUp38K
 bwRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUf19wZkPy3vgvxqgIZUTlQvHng4wSMfIx9bRR5+e3KJAYPDqhHN3NkakImoypfLNh4/pxwuAEqdsM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzYzfuMDusBk6v0bpBUPUUx8XJ3ajxFGECC86mEGbtpgxXQ6V+
 UugO2JtD7Bt1JHC7nwFpdgOY9LJgbvYo2V2cJKNGdfZXnBOHdktSBHkQDHB2mQGn4lCh007rpG4
 FIVqOBJOADK/SHNd33H2p4QK/TQlgH6Q=
X-Gm-Gg: AY/fxX5k1f0DokKWFU4htiaIwOM+NXU44UBsUzvk/C7nFeOWaB5wvLZqG0h3IAtDucj
 +tivrxoBuInlcoclcG0vB60l/DXBvoiT+2PNoqdFaHPzoigYV6AMu5yb8LRhflCdA35R2cAEQxp
 lnYBBKRPVCILkZzRRKohZpiGeHbMB/UHZRxHGTCmC8HD2Cq6BlYsTIBnq36ilDjRA6BJe//zsBB
 fFw5A27MTHVT9FcEru5jly52wjulpsND9I4A3YlSYrtA+Jglulid4d1EUythDldYyN0H+XMt1fU
 7ruLh6Mf2xxWPkN+nZKyhHN4Clkx
X-Google-Smtp-Source: AGHT+IFeGSi0Gu83/Slz77CIaqE04HdIsq1euie92j/WWWsvFczf8Qune5zij+g/7d5sUVF0t6D+zhRpgPjDgxph3ao=
X-Received: by 2002:a17:907:96a5:b0:b76:7e90:713f with SMTP id
 a640c23a62f3a-b8426a42536mr251065866b.10.1767689631733; Tue, 06 Jan 2026
 00:53:51 -0800 (PST)
MIME-Version: 1.0
References: <20251127161337.396531-1-avinal.xlvii@gmail.com>
 <2a9f7c54-3669-4f8b-b46b-b7e01712a1b8@linaro.org>
In-Reply-To: <2a9f7c54-3669-4f8b-b46b-b7e01712a1b8@linaro.org>
From: Avinal Kumar <avinal.xlvii@gmail.com>
Date: Tue, 6 Jan 2026 14:23:39 +0530
X-Gm-Features: AQt7F2pD84OWfiybSYDwSACAcNC8vr1eDJxepzyPWq8ysZ0RAzhRQxyk-2xbFqo
Message-ID: <CAJ9xu4wb1W08ds7f4y+5tzcpAxsNLvKDMAxpjjigsG9ipWREGQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: panasonic-vvx10f034n00: transition to mipi_dsi
 wrapped functions
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: jessica.zhang@oss.qualcomm.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: multipart/alternative; boundary="000000000000929c3a0647b45079"
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

--000000000000929c3a0647b45079
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Neil,

Unlike mipi_dsi_turn_on_peripheral, mipi_dsi_shutdown_peripheral isn't
marked deprecated, and no multi function available yet. And I wanted to
keep it simple for the first patch.

If it is okay, I can:
- Create another patch or update this patch, to add a
mipi_dsi_shutdown_peripheral_multi() function and deprecate the normal
function.
- Update the remaining function in this patch.

Please let me know. Thank you


On Tue, Jan 6, 2026 at 1:51=E2=80=AFPM <neil.armstrong@linaro.org> wrote:

> Hi,
>
> On 11/27/25 17:08, Avinal Kumar wrote:
> > Changes the panasonic-vvx10f034n00 panel to multi
> > style functions for improved error handling.
> >
> > Signed-off-by: Avinal Kumar <avinal.xlvii@gmail.com>
> > ---
> > Here is the todo list for reference:
> https://www.kernel.org/doc/html/latest/gpu/todo.html#transition-away-from=
-using-deprecated-mipi-dsi-functions
> >
> > This is my first patch in Linux Kernel :)
> >
> >   drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c | 7 ++++++-
> >   1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
> b/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
> > index 3c3308fc55df..03c87c02fb57 100644
> > --- a/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
> > +++ b/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
> > @@ -44,7 +44,12 @@ static inline struct wuxga_nt_panel
> *to_wuxga_nt_panel(struct drm_panel *panel)
> >
> >   static int wuxga_nt_panel_on(struct wuxga_nt_panel *wuxga_nt)
> >   {
> > -     return mipi_dsi_turn_on_peripheral(wuxga_nt->dsi);
> > +     struct mipi_dsi_multi_context dsi_ctx =3D {
> > +             .dsi =3D wuxga_nt->dsi
> > +     };
> > +
> > +     mipi_dsi_turn_on_peripheral_multi(&dsi_ctx);
> > +     return dsi_ctx.accum_err;
> >   }
> >
> >   static int wuxga_nt_panel_disable(struct drm_panel *panel)
>
> Why didn't you also update wuxga_nt_panel_disable() ?
>
> Thanks,
> Neil
>

--000000000000929c3a0647b45079
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div>Hello Neil,<br><br></div>Unlike m=
ipi_dsi_turn_on_peripheral, mipi_dsi_shutdown_peripheral isn&#39;t marked d=
eprecated, and no multi function available yet. And I wanted to keep it sim=
ple for the first patch.=C2=A0<br><br></div>If it is okay, I can:<br></div>=
- Create another patch or update this patch, to add a mipi_dsi_shutdown_per=
ipheral_multi() function and deprecate the normal function.<br></div>- Upda=
te the remaining function in this patch.<br><br></div>Please let me know. T=
hank you<br><br></div><br><div class=3D"gmail_quote gmail_quote_container">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 6, 2026 at 1:51=E2=80=AFP=
M &lt;<a href=3D"mailto:neil.armstrong@linaro.org">neil.armstrong@linaro.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Hi,<br>
<br>
On 11/27/25 17:08, Avinal Kumar wrote:<br>
&gt; Changes the panasonic-vvx10f034n00 panel to multi<br>
&gt; style functions for improved error handling.<br>
&gt; <br>
&gt; Signed-off-by: Avinal Kumar &lt;<a href=3D"mailto:avinal.xlvii@gmail.c=
om" target=3D"_blank">avinal.xlvii@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; Here is the todo list for reference: <a href=3D"https://www.kernel.org=
/doc/html/latest/gpu/todo.html#transition-away-from-using-deprecated-mipi-d=
si-functions" rel=3D"noreferrer" target=3D"_blank">https://www.kernel.org/d=
oc/html/latest/gpu/todo.html#transition-away-from-using-deprecated-mipi-dsi=
-functions</a><br>
&gt; <br>
&gt; This is my first patch in Linux Kernel :)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c | 7 +=
+++++-<br>
&gt;=C2=A0 =C2=A01 file changed, 6 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c b/dr=
ivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c<br>
&gt; index 3c3308fc55df..03c87c02fb57 100644<br>
&gt; --- a/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c<br>
&gt; +++ b/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c<br>
&gt; @@ -44,7 +44,12 @@ static inline struct wuxga_nt_panel *to_wuxga_nt_pa=
nel(struct drm_panel *panel)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0static int wuxga_nt_panel_on(struct wuxga_nt_panel *wuxga_=
nt)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0return mipi_dsi_turn_on_peripheral(wuxga_nt-&gt;d=
si);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct mipi_dsi_multi_context dsi_ctx =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.dsi =3D wuxga_nt-&gt=
;dsi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mipi_dsi_turn_on_peripheral_multi(&amp;dsi_ctx);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0return dsi_ctx.accum_err;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0static int wuxga_nt_panel_disable(struct drm_panel *panel)=
<br>
<br>
Why didn&#39;t you also update wuxga_nt_panel_disable() ?<br>
<br>
Thanks,<br>
Neil<br>
</blockquote></div>

--000000000000929c3a0647b45079--
