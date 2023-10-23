Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFA57D2C68
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 10:14:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8784510E171;
	Mon, 23 Oct 2023 08:14:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1FCF10E177
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 08:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698048860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=es4QPngsXpmAIASK05cERYr43X740lPT3pKLdJZoVvI=;
 b=aci3tbciGp2j6p+8RyrUUX5oRJpWjTSdmHqB0THnZI4rtzLOoqcI8jFrgPvukJpVitRoz0
 D1xIp7WEp+OTmsnbWCNLW5bX6vXf72mmv6a9JULuWboz48DJhmjvKW2MOcdBaQJ+e6Ucas
 868pN5sTBuZpCv6V+KsUxFt4GonvfVc=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-JBW98-NpNYaQ3Cai5Lq-Lw-1; Mon, 23 Oct 2023 04:14:19 -0400
X-MC-Unique: JBW98-NpNYaQ3Cai5Lq-Lw-1
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-5a4d04a8a5cso1671837a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 01:14:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698048858; x=1698653658;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uoARVbaVzE8Klcf/2UJiBvPdsoBHjWiewZkEcG70H2w=;
 b=SESALkv7fxJa6/tpu7NjuFf5pr4mB7c2qkUd7D6iPlvf0Nt2mz/S6b9FAldeN4UaPB
 xA/nWKqgKCBPhfp1VL+RcyMcUyz5TBbn7Oa6EP0FYrZOSNCP2/t5d4rhMoZ1nABi+JoS
 XXJlSrlB/nMtZEQqmRrpQgsCm+HEnxinSMFRCiWyVA3Pq9YWZBuP3P8pUwE9ZEGxAuaf
 VbFyqw7F4uUSJvwl6WMeI0IK3XfgNQ3nfDZEqsoqgnOgIgFmmn0BiRLvZUGkpC4SJOJH
 sB5N+NPuTTbDxkVOO7YNTacrJ6YjV5srWc/ndyO6GSLwhGiDmPi5ewz2Zh1OIkpJ3i9Q
 m91A==
X-Gm-Message-State: AOJu0YywV8B/3bzCOTEioARTbgzVxqDrcRgbWizyx2Qle051IsNAnC06
 ZQbWwnpFcXn+hy+S+wNCUdVpOS+sGw1Qgome9p+tp4Z7mvyVyXfsf/9sSxh4jRlrNaulACJ29eG
 SIdOvu105OQoygv6S8EoZV93npk0sIZ9uYmeiVZIdbqX5
X-Received: by 2002:a05:6a20:54a0:b0:13d:17cc:5bca with SMTP id
 i32-20020a056a2054a000b0013d17cc5bcamr7164701pzk.18.1698048857513; 
 Mon, 23 Oct 2023 01:14:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzq70ts5bDupwKjfq3lxncqOWwvXbGNczquvLBuYAQ7b8ip74Jouf9GwofikaNrblGdeCbW4K+TH/mBEYJsmM=
X-Received: by 2002:a05:6a20:54a0:b0:13d:17cc:5bca with SMTP id
 i32-20020a056a2054a000b0013d17cc5bcamr7164645pzk.18.1698048856339; Mon, 23
 Oct 2023 01:14:16 -0700 (PDT)
MIME-Version: 1.0
References: <20231023074613.41327-1-aesteve@redhat.com>
 <-ngmaSLF2S5emYjTBWcLRNzvJRoe_eZ-Nv9HQhE6ZLuK8nIE2ZbfVh2G2O2Z41GoIFIRpts0ukEtFXUx8pNAptmrZBhlXxaQGykx_qCZ_9k=@emersion.fr>
In-Reply-To: <-ngmaSLF2S5emYjTBWcLRNzvJRoe_eZ-Nv9HQhE6ZLuK8nIE2ZbfVh2G2O2Z41GoIFIRpts0ukEtFXUx8pNAptmrZBhlXxaQGykx_qCZ_9k=@emersion.fr>
From: Albert Esteve <aesteve@redhat.com>
Date: Mon, 23 Oct 2023 10:14:05 +0200
Message-ID: <CADSE00KW4+hpbAbZAusBngq5FYSa067wYJCGeetqngWRJaD9Kg@mail.gmail.com>
Subject: Re: [PATCH v6 0/9] Fix cursor planes with virtualized drivers
To: Simon Ser <contact@emersion.fr>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000e4cdbd06085dce80"
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
Cc: linux-doc@vger.kernel.org, qemu-devel@nongnu.org, banackm@vmware.com,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 mombasawalam@vmware.com, iforbes@vmware.com, Jonathan Corbet <corbet@lwn.net>,
 javierm@redhat.com,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 David Airlie <airlied@redhat.com>, Maxime Ripard <mripard@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, ppaalanen@gmail.com,
 dri-devel@lists.freedesktop.org, spice-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Matt Roper <matthew.d.roper@intel.com>, linux-kernel@vger.kernel.org,
 krastevm@vmware.com, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000e4cdbd06085dce80
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 23, 2023 at 9:55=E2=80=AFAM Simon Ser <contact@emersion.fr> wro=
te:

> On Monday, October 23rd, 2023 at 09:46, Albert Esteve <aesteve@redhat.com=
>
> wrote:
>
> > Link to the IGT test covering this patch (already merged):
> > https://lists.freedesktop.org/archives/igt-dev/2023-July/058427.html
>
> Hmm. IGT should not be merged before the kernel, because as long as the
> kernel is not merged there might be some uAPI changes.
>

Right, but uAPI header was not updated on the IGT side. As per suggestion
of the
maintainers, I added a static variable that matches the definition on this
patch:
https://lists.freedesktop.org/archives/igt-dev/2023-August/058803.html

+/**
+ * Clients which do set cursor hotspot and treat the cursor plane
+ * like a mouse cursor should set this property.
+ */
+#define LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT=096


Once this patch gets upstreamed, the localized definition will be removed,
replaced by the real one.


> > Mutter patch:
> > https://lists.freedesktop.org/archives/igt-dev/2023-July/058427.html
>
> Seems like this link is same as IGT? Copy-pasta fail maybe?
>
>
Ah yes, my bad, this is the correct link:
https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3337

--000000000000e4cdbd06085dce80
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 23, 2023 at 9:55=E2=80=AF=
AM Simon Ser &lt;<a href=3D"mailto:contact@emersion.fr">contact@emersion.fr=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
On Monday, October 23rd, 2023 at 09:46, Albert Esteve &lt;<a href=3D"mailto=
:aesteve@redhat.com" target=3D"_blank">aesteve@redhat.com</a>&gt; wrote:<br=
>
<br>
&gt; Link to the IGT test covering this patch (already merged):<br>
&gt; <a href=3D"https://lists.freedesktop.org/archives/igt-dev/2023-July/05=
8427.html" rel=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.o=
rg/archives/igt-dev/2023-July/058427.html</a><br>
<br>
Hmm. IGT should not be merged before the kernel, because as long as the<br>
kernel is not merged there might be some uAPI changes.<br></blockquote><div=
><br></div><div>Right, but uAPI header was not updated on the IGT side. As =
per suggestion of the</div><div>maintainers, I added a static variable that=
 matches the definition=C2=A0on this patch:</div><div><a href=3D"https://li=
sts.freedesktop.org/archives/igt-dev/2023-August/058803.html">https://lists=
.freedesktop.org/archives/igt-dev/2023-August/058803.html</a></div><div><pr=
e style=3D"color:rgb(0,0,0)">+/**
+ * Clients which do set cursor hotspot and treat the cursor plane
+ * like a mouse cursor should set this property.
+ */
+#define LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT=096</pre></div><div>=C2=
=A0</div><div>Once this patch gets upstreamed, the localized definition wil=
l be removed,</div><div>replaced by the real one.</div><div><br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; Mutter patch:<br>
&gt; <a href=3D"https://lists.freedesktop.org/archives/igt-dev/2023-July/05=
8427.html" rel=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.o=
rg/archives/igt-dev/2023-July/058427.html</a><br>
<br>
Seems like this link is same as IGT? Copy-pasta fail maybe?<br>
<br></blockquote><div><br></div><div>Ah yes, my bad, this is the correct li=
nk:</div><div><a href=3D"https://gitlab.gnome.org/GNOME/mutter/-/merge_requ=
ests/3337">https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3337</a>=
=C2=A0</div></div></div>

--000000000000e4cdbd06085dce80--

