Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D59EEA74D7A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 16:13:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB28610E085;
	Fri, 28 Mar 2025 15:13:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UWmx+2O8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EEF310E085
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 15:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743174776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eTbIWqY3vWSvuvRlygHGEGaD5K73yE86K9bpocr0u9A=;
 b=UWmx+2O8KrCw3/FhaIoA+eiDwy2yYk45pYkyWYkNgFv7M545XPteJTh98rgR5RfKK7oa8W
 GtiT+1N00zcddu304zUJ+TRann1Ug77WxAu5IN65SY5j8tuQSBuFU6lQR3iHzTz0R34BQK
 1nAgIgsSNN6RqyA4LXGgveiD0Gao2T4=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-Vo2f5mNwOv-lVCdgQv_3dg-1; Fri, 28 Mar 2025 11:12:54 -0400
X-MC-Unique: Vo2f5mNwOv-lVCdgQv_3dg-1
X-Mimecast-MFC-AGG-ID: Vo2f5mNwOv-lVCdgQv_3dg_1743174774
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-6f2c7008c05so30698727b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 08:12:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743174774; x=1743779574;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eTbIWqY3vWSvuvRlygHGEGaD5K73yE86K9bpocr0u9A=;
 b=o079lOrPtlmmjUZK3NzPxDjqMzEFJs8uasAFCzo7hbqAYZEJ7HsqVBfsDdERH7dhpc
 rNHorf8PJ8M9txFjIZ9Wr1XhN97Y1/gQW+w1eMDMBYnlYDSiDimNlGCexLt0PyZo55hW
 swD5+ZgOeQ7G1kWsTHEmd0+SRwb4wqeIC0ZGTMSr6/94E/BgTDxJOFPp+uETqFqjG00k
 OC8U3oSmLBc21ZRhGUWd5ZFVSffgpSQ/09vuGFgqNZopthx1ddZswbU5dCEy2UcEUcZy
 JbrpIUL4k/7x0Mzxd6blftq2vw1LENTwnZHqjyHjCUcvSwHSRIby4T6WCvii2PJqs3hH
 O88A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6ZCNvHtMn0lwJM9wg4aM7qhJ3o3s+Bdr1cHMsNMXlBcQOlHJxdMqvErpF+DwWHaIrKJ6TsyrUC0s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNVbnG8o5bhIHHdp6x49wtsDJ+aFkDGncefaHYmFipqCeKIzdO
 0f5lk4RQk0tqcnXMD/BAOp35XlQu12lJIVK0IXbiq/8w33claIWDHkhzmO6C137Cmk3hI7QmAMm
 /LwulIZr5a2CusBaUEsY624PP4+/7lkXU28wzNbviZY8gZALJ+gQe1iyep/EcoVhci0OEpbwP06
 lRM+S/AlAXP4YXyI+N6An6Q1vOxP3po16swTWGXeQb
X-Gm-Gg: ASbGnctKv6Rtt+WHPZTQU96hA6SuKfbjRCH9WUhD4Hx2LB3ZMzGd2P8h0VCjMEM8CtC
 m+TG7mU+dB/lcpyckkr8N0HbGm+y+7dJsKJIfYUKK+JSJ6GkN0L6ok/hzSX2XbgjAcR2eYGk=
X-Received: by 2002:a05:690c:6f81:b0:700:a913:854 with SMTP id
 00721157ae682-70224f05ecamr106437587b3.5.1743174774211; 
 Fri, 28 Mar 2025 08:12:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQP6JY2k1hKpuHitxK7KuTpugBWxmlEmZT2TxOG3ubyiAcZTtOKFedCfSnVWH4uXtnuspackz+SxQoGlnLFlk=
X-Received: by 2002:a05:690c:6f81:b0:700:a913:854 with SMTP id
 00721157ae682-70224f05ecamr106437167b3.5.1743174773766; Fri, 28 Mar 2025
 08:12:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250327-b4-panel-refcounting-v2-0-b5f5ca551f95@redhat.com>
 <20250327-b4-panel-refcounting-v2-1-b5f5ca551f95@redhat.com>
 <20250328093446.48368b57@booty>
In-Reply-To: <20250328093446.48368b57@booty>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Fri, 28 Mar 2025 10:11:20 -0400
X-Gm-Features: AQ5f1JrGq6lWic17rhjLcjrYslqlj61Bwd6o3_6K5mbxsn3rCP3IRM720aZdnD4
Message-ID: <CAN9Xe3R8Wsx_T+_SqNOH68rxk0A=Tfs5ty7PKaxJybAA4ATWQw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] drm/panel: Add new helpers for refcounted panel
 allocatons
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8qR4MJp4G9gQ5FZe1jaxGJXQt6Mts9SyesuhJiPXjCo_1743174774
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000002c16b106316881a2"
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

--0000000000002c16b106316881a2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 28, 2025 at 4:34=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootli=
n.com>
wrote:

> Hello Anusha,
>
> Thanks for your continued effort.
>
> I have a few minor comments. Nothing big, but since Maxime requested a
> change you'll have to send a new iteration, so find my comments below.
>
> On Thu, 27 Mar 2025 10:55:39 -0400
> Anusha Srivatsa <asrivats@redhat.com> wrote:
>
> [...]
>
> > diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> > index
> a9c042c8dea1a82ef979c7a68204e0b55483fc28..53251c6b11d78149ede3dad41ffa6a8=
8f3c3c58b
> 100644
> > --- a/include/drm/drm_panel.h
> > +++ b/include/drm/drm_panel.h
> > @@ -28,6 +28,7 @@
> >  #include <linux/errno.h>
> >  #include <linux/list.h>
> >  #include <linux/mutex.h>
> > +#include <linux/kref.h>
>
> Minor nit: you don't need this include in patch 1. You should move it
> to patch 2 where it is actually used.
>
> > @@ -268,6 +269,28 @@ struct drm_panel {
> >       bool enabled;
> >  };
> >
> > +void *__devm_drm_panel_alloc(struct device *dev, size_t size, size_t
> offset,
> > +                          const struct drm_panel_funcs *funcs,
> > +                          int connector_type);
> > +
> > +/**
> > + * devm_drm_panel_alloc - Allocate and initialize an refcounted panel
>                                                      ^^
> A typo here is certainly not a huge problem, but I think I had already
> reported this should be "a refcounted panel".
>
> Yeah you had and I thought I had taken care of it. WIll change this.

> + * @dev: struct device of the panel device
> > + * @type: the type of the struct which contains struct &drm_panel
> > + * @member: the name of the &drm_panel within @type
> > + * @funcs: callbacks for this panel
> > + * @connector_type: the connector type (DRM_MODE_CONNECTOR_*)
> corresponding to
> > + * the panel interface
> > + * Returns:
> > + * Pointer to container structure embedding the panel, ERR_PTR on
> failure.
> > + * The reference count is initialised to 1 and is automatically  given
> back
> > + * by devm action.
> > + */
>
> In addition to Maxime's comment: I think it's a common practice to have
> an empty line after the last @argument and also before the "Returns:"
> line, to improve readability
>
> On it!
Thanks,
Anusha

> Luca
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--0000000000002c16b106316881a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 28,=
 2025 at 4:34=E2=80=AFAM Luca Ceresoli &lt;<a href=3D"mailto:luca.ceresoli@=
bootlin.com">luca.ceresoli@bootlin.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">Hello Anusha,<br>
<br>
Thanks for your continued effort.<br>
<br>
I have a few minor comments. Nothing big, but since Maxime requested a<br>
change you&#39;ll have to send a new iteration, so find my comments below.<=
br>
<br>
On Thu, 27 Mar 2025 10:55:39 -0400<br>
Anusha Srivatsa &lt;<a href=3D"mailto:asrivats@redhat.com" target=3D"_blank=
">asrivats@redhat.com</a>&gt; wrote:<br>
<br>
[...]<br>
<br>
&gt; diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h<br>
&gt; index a9c042c8dea1a82ef979c7a68204e0b55483fc28..53251c6b11d78149ede3da=
d41ffa6a88f3c3c58b 100644<br>
&gt; --- a/include/drm/drm_panel.h<br>
&gt; +++ b/include/drm/drm_panel.h<br>
&gt; @@ -28,6 +28,7 @@<br>
&gt;=C2=A0 #include &lt;linux/errno.h&gt;<br>
&gt;=C2=A0 #include &lt;linux/list.h&gt;<br>
&gt;=C2=A0 #include &lt;linux/mutex.h&gt;<br>
&gt; +#include &lt;linux/kref.h&gt;<br>
<br>
Minor nit: you don&#39;t need this include in patch 1. You should move it<b=
r>
to patch 2 where it is actually used.<br>
<br>
&gt; @@ -268,6 +269,28 @@ struct drm_panel {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool enabled;<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; +void *__devm_drm_panel_alloc(struct device *dev, size_t size, size_t =
offset,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 const struct drm_panel_funcs *funcs,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 int connector_type);<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * devm_drm_panel_alloc - Allocate and initialize an refcounted panel=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^^<br>
A typo here is certainly not a huge problem, but I think I had already<br>
reported this should be &quot;a refcounted panel&quot;.<br>
<br></blockquote><div>Yeah you had and I thought I had taken care of it. WI=
ll change this.</div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
&gt; + * @dev: struct device of the panel device<br>
&gt; + * @type: the type of the struct which contains struct &amp;drm_panel=
<br>
&gt; + * @member: the name of the &amp;drm_panel within @type<br>
&gt; + * @funcs: callbacks for this panel<br>
&gt; + * @connector_type: the connector type (DRM_MODE_CONNECTOR_*) corresp=
onding to<br>
&gt; + * the panel interface<br>
&gt; + * Returns:<br>
&gt; + * Pointer to container structure embedding the panel, ERR_PTR on fai=
lure.<br>
&gt; + * The reference count is initialised to 1 and is automatically=C2=A0=
 given back<br>
&gt; + * by devm action.<br>
&gt; + */<br>
<br>
In addition to Maxime&#39;s comment: I think it&#39;s a common practice to =
have<br>
an empty line after the last @argument and also before the &quot;Returns:&q=
uot;<br>
line, to improve readability<br>
<br></blockquote><div>On it!</div><div>Thanks,</div><div>Anusha <br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
Luca<br>
<br>
-- <br>
Luca Ceresoli, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div></div>

--0000000000002c16b106316881a2--

