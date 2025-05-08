Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C66AB0124
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 19:14:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFEE210E214;
	Thu,  8 May 2025 17:14:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OMSeOYg7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57B5A10E214
 for <dri-devel@lists.freedesktop.org>; Thu,  8 May 2025 17:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746724466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0SBZqDCOFraj0ypsCZ28FIMsR4ui84zL3+cU/Lkv6v8=;
 b=OMSeOYg7ODFtY//fjrU52RN7SolCHHu7fKPyVChl53Fwhne5/1bVSVWeBg8TdGSAhVIekk
 OcfEfkqiAbsX71av+f6v/7LOBbnJroaSjitTuex2ThIwU34NvQnBlAgoe3TwiXJlxfFyCk
 o1bzQncXmbnS6kFHTTwnD1EnJVZSV78=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-w9-Dth39P7SxW3dzZXH7Bw-1; Thu, 08 May 2025 13:14:24 -0400
X-MC-Unique: w9-Dth39P7SxW3dzZXH7Bw-1
X-Mimecast-MFC-AGG-ID: w9-Dth39P7SxW3dzZXH7Bw_1746724464
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-70a30aede59so10910157b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 May 2025 10:14:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746724464; x=1747329264;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0SBZqDCOFraj0ypsCZ28FIMsR4ui84zL3+cU/Lkv6v8=;
 b=ZN1MXhTSwr6Nijka/baQQpxwIVNnt4huk2F3j6LaCBsD74R6pXsg5CNxXdtXmr9Y8C
 OmW7LWML8vFKe5P8zu1Gq249ci53gwAYV0mIVjy7kcpStX3qIyGsSbA5fS+zbje5Wz9y
 sPp3ATSjqPp0Ro3VJddS0z6fTPxAOdvxE2jH6qKtOapOtCTQGc+3Ch6SrUfnJuBddGyC
 8I5tADjpwIN9vi8b7BCk8eaUaJVY5LTxDnUfN2nhhrflMB8XpwsK1RWWMTzz9QSolPn0
 j/Hc9qQ0RFAH1np9d4iTCHphH4jez4pIzihh7oBwMi8fQHJ/xhF/kDLRctu8ibW6v8eJ
 hOng==
X-Forwarded-Encrypted: i=1;
 AJvYcCVc+LaVsf4TLL3EP6mX21DV7sKyLIoV6clbAuBqt2oQw+lq7TRM+OPvqDQcwOW5T934+xEmlGw5lSI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxvDJRggTgeRXIlzqR00tNJlixq8tFwxFnWzr8LSLZLeFELENxv
 YbK6JTIVWhZAsNV8o2ArTTB7w5U1qJRBbH3djrwcReI+BcFK5WUmYj7TtplQJ+RlrgsCDA07c6X
 EyP9uBNgBPIGC6UvyeK9npN5vtVnIC3tEP1ZJLpPBGxk7LXV0XGHoNqKbBUMxW+LTYoglCvHvRp
 CDBpMG1u3AaQJBMmNEiolavEsoh5hN0qL0opdqsTT1
X-Gm-Gg: ASbGncvUc+PsXogYt5JOVy5G+kXlzT9FhiEi8ARtjOh5QQLE/tUfMsgIyv+hCMwCguE
 Owqn5ELjlQtw7InGqmduZVaFj3Fgb/T/gMYaAiKa8LhsLVYpXaRwDCITaALeCB2IjqWk=
X-Received: by 2002:a05:690c:6e01:b0:708:bb0e:5a06 with SMTP id
 00721157ae682-70a3f862f36mr3645667b3.0.1746724463631; 
 Thu, 08 May 2025 10:14:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUvZeq98OdqbDiHi5fCh4EIzV534tkU+ZBB2XtzlWXr7JlnrJmllnlAGxDwzh3Zy08sU0wDEe0/lBgHSYPfDk=
X-Received: by 2002:a05:690c:6e01:b0:708:bb0e:5a06 with SMTP id
 00721157ae682-70a3f862f36mr3645197b3.0.1746724463240; Thu, 08 May 2025
 10:14:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250403-b4-drm_panel_mass_convert_part2-v2-0-260c8a44c56b@redhat.com>
 <0f653e3a-0402-4a8a-9191-97de04ba2b7c@linaro.org>
In-Reply-To: <0f653e3a-0402-4a8a-9191-97de04ba2b7c@linaro.org>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 8 May 2025 12:13:37 -0400
X-Gm-Features: AX0GCFspaXv3oJxdS-Yom65qhO7I2CkMeL3KtfYHyzqjGtAVuVpZ3px0sRbwYPw
Message-ID: <CAN9Xe3Q14kdnRTw5mnOL+_CBCzbio1yi8rab4rBCeqdbb9bUgQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/30] drm/panel: Use refcounted allocation in place of
 devm_kzalloc() - Part2
To: neil.armstrong@linaro.org
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Icenowy Zheng <icenowy@aosc.io>, Jagan Teki <jagan@amarulasolutions.com>, 
 Ondrej Jirman <megi@xff.cz>, Javier Martinez Canillas <javierm@redhat.com>, 
 Michael Trimarchi <michael@amarulasolutions.com>,
 Michael Walle <mwalle@kernel.org>, 
 Jagan Teki <jagan@edgeble.ai>, =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, Linus Walleij <linus.walleij@linaro.org>, 
 Jianhua Lu <lujianhua000@gmail.com>, Stefan Mavrodiev <stefan@olimex.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: b7Bo-XOfrL54qQ9T9lcCQbxu2svOuJXUJHq5B5Y6RoI_1746724464
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000026fc6e0634a2fb60"
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

--00000000000026fc6e0634a2fb60
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 5:57=E2=80=AFAM Neil Armstrong <neil.armstrong@linar=
o.org>
wrote:

> On 03/04/2025 16:16, Anusha Srivatsa wrote:
> > Start converting drivers to use the API - devm_drm_panel_alloc().
> >
> > Sending next 30 drivers. Sending in batches for easier review.
> >
> > Part 1 of the series : https://patchwork.freedesktop.org/series/147082/
> >
> > Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> > ---
> > Changes in v2:
> > - Remove drm_panel_init() from probe function in ilitek-ili9341 driver.
> > - Link to v1:
> https://lore.kernel.org/r/20250402-b4-drm_panel_mass_convert_part2-v1-0-9=
03b70999ea6@redhat.com
> >
> > ---
> > Anusha Srivatsa (30):
> >        panel/panel-elida-kd35t133: Refcounted allocation
> >        panel/elida-kd35t133: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/fy07024di26a30d: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/himax-hx83112a: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/himax-hx8394: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/ilitek-ili9322: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/ilitek-ili9341: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/panel-ili9805: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/ilitek-ili9806e: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/ilitek-ili9881c: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/innolux-ej030na: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/innolux-p079zca: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/jadard-jd9365da-h3: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/jdi-fhd-r63452: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/ltk050h3146w: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/ltk500hd1829: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/lg-lg4573: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/lincolntech-lcd197: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/magnachip-d53e6ea8966: Use refcounted allocation in place
> of devm_kzalloc()
> >        panel/mantix-mlaf057we51: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/newvision-nv3051d: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/newvision-nv3052c: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/novatek-nt35510: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/novatek-nt35560: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/novatek-nt35950: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/novatek-nt36523: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/novatek-nt36672e: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/novatek-nt39016: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/lcd-olinuxino: Use refcounted allocation in place of
> devm_kzalloc()
> >        panel/orisetech-ota5601a: Use refcounted allocation in place of
> devm_kzalloc()
> >
> >   drivers/gpu/drm/panel/panel-elida-kd35t133.c          | 10 ++++------
> >   drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c     | 11 +++++-----=
-
> >   drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c | 10 ++++------
> >   drivers/gpu/drm/panel/panel-himax-hx83112a.c          | 10 +++++-----
> >   drivers/gpu/drm/panel/panel-himax-hx8394.c            | 11 +++++-----=
-
> >   drivers/gpu/drm/panel/panel-ilitek-ili9322.c          | 10 ++++------
> >   drivers/gpu/drm/panel/panel-ilitek-ili9341.c          | 10 +++++-----
> >   drivers/gpu/drm/panel/panel-ilitek-ili9805.c          | 12 ++++++----=
--
> >   drivers/gpu/drm/panel/panel-ilitek-ili9806e.c         | 10 ++++------
> >   drivers/gpu/drm/panel/panel-ilitek-ili9881c.c         | 11 +++++-----=
-
> >   drivers/gpu/drm/panel/panel-innolux-ej030na.c         | 11 +++++-----=
-
> >   drivers/gpu/drm/panel/panel-innolux-p079zca.c         | 11 +++++-----=
-
> >   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c      | 10 ++++------
> >   drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c          | 10 +++++-----
> >   drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c    | 11 +++++-----=
-
> >   drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c    | 11 +++++-----=
-
> >   drivers/gpu/drm/panel/panel-lg-lg4573.c               | 11 +++++-----=
-
> >   drivers/gpu/drm/panel/panel-lincolntech-lcd197.c      | 11 +++++-----=
-
> >   drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c   | 11 +++++-----=
-
> >   drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c      | 11 +++++-----=
-
> >   drivers/gpu/drm/panel/panel-newvision-nv3051d.c       | 11 +++++-----=
-
> >   drivers/gpu/drm/panel/panel-newvision-nv3052c.c       | 10 ++++------
> >   drivers/gpu/drm/panel/panel-novatek-nt35510.c         | 12 ++++++----=
--
> >   drivers/gpu/drm/panel/panel-novatek-nt35560.c         | 12 ++++++----=
--
> >   drivers/gpu/drm/panel/panel-novatek-nt35950.c         | 10 ++++------
> >   drivers/gpu/drm/panel/panel-novatek-nt36523.c         |  9 +++++----
> >   drivers/gpu/drm/panel/panel-novatek-nt36672e.c        | 10 +++++-----
> >   drivers/gpu/drm/panel/panel-novatek-nt39016.c         | 10 ++++------
> >   drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c    | 11 +++++-----=
-
> >   drivers/gpu/drm/panel/panel-orisetech-ota5601a.c      | 11 +++++-----=
-
> >   30 files changed, 145 insertions(+), 174 deletions(-)
> > ---
> > base-commit: de04bb0089a96cc00d13b12cbf66a088befe3057
> > change-id: 20250402-b4-drm_panel_mass_convert_part2-5f258b0ae5ea
> >
> > Best regards,
>
> With the 2 nits fixed:
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>

Hey Neil!
Much thanks for the quick review. I am resending the series with r-b tags
but b4 trailers -u is showing an error for your Reviewed-by tag:
panel/panel-elida-kd35t133: Refcounted allocation
    + Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org> (=E2=9C=97 DK=
IM/
linaro.org)

^^^^
and not for other tags:
 panel/ilitek-ili9806e: Use refcounted allocation in place of devm_kzalloc(=
)
    + Reviewed-by: Michael Walle <mwalle@kernel.org> (=E2=9C=93 DKIM/kernel=
.org)

^^^^
Once I have clarity on why I see this, I will resend this and the part 3 of
series which is showing similar errors on your trailers.

Thanks!
Anusha

--00000000000026fc6e0634a2fb60
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 7, =
2025 at 5:57=E2=80=AFAM Neil Armstrong &lt;<a href=3D"mailto:neil.armstrong=
@linaro.org">neil.armstrong@linaro.org</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">On 03/04/2025 16:16, Anusha Srivatsa =
wrote:<br>
&gt; Start converting drivers to use the API - devm_drm_panel_alloc().<br>
&gt; <br>
&gt; Sending next 30 drivers. Sending in batches for easier review.<br>
&gt; <br>
&gt; Part 1 of the series : <a href=3D"https://patchwork.freedesktop.org/se=
ries/147082/" rel=3D"noreferrer" target=3D"_blank">https://patchwork.freede=
sktop.org/series/147082/</a><br>
&gt; <br>
&gt; Signed-off-by: Anusha Srivatsa &lt;<a href=3D"mailto:asrivats@redhat.c=
om" target=3D"_blank">asrivats@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt; Changes in v2:<br>
&gt; - Remove drm_panel_init() from probe function in ilitek-ili9341 driver=
.<br>
&gt; - Link to v1: <a href=3D"https://lore.kernel.org/r/20250402-b4-drm_pan=
el_mass_convert_part2-v1-0-903b70999ea6@redhat.com" rel=3D"noreferrer" targ=
et=3D"_blank">https://lore.kernel.org/r/20250402-b4-drm_panel_mass_convert_=
part2-v1-0-903b70999ea6@redhat.com</a><br>
&gt; <br>
&gt; ---<br>
&gt; Anusha Srivatsa (30):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/panel-elida-kd35t133: Refcounted allo=
cation<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/elida-kd35t133: Use refcounted alloca=
tion in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/fy07024di26a30d: Use refcounted alloc=
ation in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/himax-hx83112a: Use refcounted alloca=
tion in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/himax-hx8394: Use refcounted allocati=
on in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/ilitek-ili9322: Use refcounted alloca=
tion in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/ilitek-ili9341: Use refcounted alloca=
tion in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/panel-ili9805: Use refcounted allocat=
ion in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/ilitek-ili9806e: Use refcounted alloc=
ation in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/ilitek-ili9881c: Use refcounted alloc=
ation in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/innolux-ej030na: Use refcounted alloc=
ation in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/innolux-p079zca: Use refcounted alloc=
ation in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/jadard-jd9365da-h3: Use refcounted al=
location in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/jdi-fhd-r63452: Use refcounted alloca=
tion in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/ltk050h3146w: Use refcounted allocati=
on in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/ltk500hd1829: Use refcounted allocati=
on in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/lg-lg4573: Use refcounted allocation =
in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/lincolntech-lcd197: Use refcounted al=
location in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/magnachip-d53e6ea8966: Use refcounted=
 allocation in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/mantix-mlaf057we51: Use refcounted al=
location in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/newvision-nv3051d: Use refcounted all=
ocation in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/newvision-nv3052c: Use refcounted all=
ocation in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/novatek-nt35510: Use refcounted alloc=
ation in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/novatek-nt35560: Use refcounted alloc=
ation in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/novatek-nt35950: Use refcounted alloc=
ation in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/novatek-nt36523: Use refcounted alloc=
ation in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/novatek-nt36672e: Use refcounted allo=
cation in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/novatek-nt39016: Use refcounted alloc=
ation in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/lcd-olinuxino: Use refcounted allocat=
ion in place of devm_kzalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel/orisetech-ota5601a: Use refcounted al=
location in place of devm_kzalloc()<br>
&gt; <br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-elida-kd35t133.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 10 ++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c=C2=A0 =
=C2=A0 =C2=A0| 11 +++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c | 10=
 ++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-himax-hx83112a.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 10 +++++-----<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-himax-hx8394.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 11 +++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-ilitek-ili9322.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 10 ++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-ilitek-ili9341.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 10 +++++-----<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-ilitek-ili9805.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 12 ++++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-ilitek-ili9806e.c=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| 10 ++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-ilitek-ili9881c.c=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| 11 +++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-innolux-ej030na.c=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| 11 +++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-innolux-p079zca.c=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| 11 +++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c=C2=A0 =C2=
=A0 =C2=A0 | 10 ++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 10 +++++-----<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c=C2=A0 =
=C2=A0 | 11 +++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c=C2=A0 =
=C2=A0 | 11 +++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-lg-lg4573.c=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 11 +++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-lincolntech-lcd197.c=C2=A0 =C2=
=A0 =C2=A0 | 11 +++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c=C2=A0 =
=C2=A0| 11 +++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c=C2=A0 =C2=
=A0 =C2=A0 | 11 +++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-newvision-nv3051d.c=C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 11 +++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-newvision-nv3052c.c=C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 10 ++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-novatek-nt35510.c=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| 12 ++++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-novatek-nt35560.c=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| 12 ++++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-novatek-nt35950.c=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| 10 ++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-novatek-nt36523.c=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 9 +++++----<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-novatek-nt36672e.c=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 10 +++++-----<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-novatek-nt39016.c=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| 10 ++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c=C2=A0 =
=C2=A0 | 11 +++++------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-orisetech-ota5601a.c=C2=A0 =C2=
=A0 =C2=A0 | 11 +++++------<br>
&gt;=C2=A0 =C2=A030 files changed, 145 insertions(+), 174 deletions(-)<br>
&gt; ---<br>
&gt; base-commit: de04bb0089a96cc00d13b12cbf66a088befe3057<br>
&gt; change-id: 20250402-b4-drm_panel_mass_convert_part2-5f258b0ae5ea<br>
&gt; <br>
&gt; Best regards,<br>
<br>
With the 2 nits fixed:<br>
Reviewed-by: Neil Armstrong &lt;<a href=3D"mailto:neil.armstrong@linaro.org=
" target=3D"_blank">neil.armstrong@linaro.org</a>&gt;<br></blockquote><div>=
<br></div><div>Hey Neil!</div><div>Much thanks for the quick review. I am r=
esending the series with r-b tags but b4 trailers -u is showing an error fo=
r your Reviewed-by tag: <br></div><div>panel/panel-elida-kd35t133: Refcount=
ed allocation<br>=C2=A0 =C2=A0 + Reviewed-by: Neil Armstrong &lt;<a href=3D=
"mailto:neil.armstrong@linaro.org">neil.armstrong@linaro.org</a>&gt; (=E2=
=9C=97 DKIM/<a href=3D"http://linaro.org">linaro.org</a>)<br>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^^^^</div><div>and not =
for other tags:</div><div>=C2=A0panel/ilitek-ili9806e: Use refcounted alloc=
ation in place of devm_kzalloc()<br>=C2=A0 =C2=A0 + Reviewed-by: Michael Wa=
lle &lt;<a href=3D"mailto:mwalle@kernel.org">mwalle@kernel.org</a>&gt; (=E2=
=9C=93 DKIM/<a href=3D"http://kernel.org">kernel.org</a>)</div><div>=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ^^^^</div><div>Once I have clarity on why I see this, I will resend thi=
s and the part 3 of series which is showing similar errors on your trailers=
.</div><div><br></div><div>Thanks!</div><div>Anusha=C2=A0 <br></div></div><=
/div>

--00000000000026fc6e0634a2fb60--

