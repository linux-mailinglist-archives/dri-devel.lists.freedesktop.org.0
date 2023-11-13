Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 182E77EA1A7
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 18:04:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3700010E3CE;
	Mon, 13 Nov 2023 17:04:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0807210E3CE
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 17:04:27 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-99bdeae1d0aso689197666b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 09:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1699895065; x=1700499865;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zJsbUoh16G9SmdzYCkBZG3ak7oJNsZTLFRqgDM/pl7c=;
 b=U/6k+A4eX9gOniQaY2iRajvnDzPK+oAzsnuxtwSIGdiXE06UVvsx/fUnRnVxhYRIEl
 /FpLPcxarOlusniZMD9eCQDj5vZkup6LzahlapQYYpfKJmWpFy15iCjKDs0UY6sTmN0s
 vNkrEI4uxDVWxlfzdYUvUpaMlytesZ6JRu/uE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699895065; x=1700499865;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zJsbUoh16G9SmdzYCkBZG3ak7oJNsZTLFRqgDM/pl7c=;
 b=aqRRetSvkA7pOYh2AkCsREpIcmrPGlpA+ykLfEmtyVEbt/9jeTEEwZ2raBYCY/uL+D
 PrZAx57K7Zpg0rAg+/BArrQ36yhrBvaLCVha+i83pzVbCaYkAIOr4G49ylS5MgcDTS7c
 RDKz+0csrP8Vj3gOwRzycTMtWuDY29nMOmPpwro+FZpii8YuHvqFB+sIk9Z6t0KygKYv
 fQZAySmc6vxY3ZRnHHv18CNcp4N7fplg4Yx9A5lmuGbBjaiqMItmSxuLGbVpXNmfcYGr
 yrVR2xWRjnjy9E5m2B2C6G3vGRV7FqWT4luNqIQU+W0n2IRpFmEArl3Kw+KdVUhRtxBz
 nwJg==
X-Gm-Message-State: AOJu0Yz40/oPkwWEF8J/PFr5zqOrzdMxKnHmNKGgIVFNgXXu/Z75oRUx
 OhpLKegRN+gf0Q8l+hyV4NVa7nt6ClkaVStIQI1qAw==
X-Google-Smtp-Source: AGHT+IEQ82d/2CUhBNsNx/zNVphgzDfzDDY4PZbed7RkZ63KAxF9WkSgHgcBBrmqwM/Gd/Ofl5rvmA==
X-Received: by 2002:a17:906:cb95:b0:9bf:30e8:5bf9 with SMTP id
 mf21-20020a170906cb9500b009bf30e85bf9mr5730635ejb.4.1699895064876; 
 Mon, 13 Nov 2023 09:04:24 -0800 (PST)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com.
 [209.85.208.45]) by smtp.gmail.com with ESMTPSA id
 y26-20020a170906471a00b009dd8debf9d8sm4287024ejq.157.2023.11.13.09.04.24
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Nov 2023 09:04:24 -0800 (PST)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-54744e66d27so11273a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 09:04:24 -0800 (PST)
X-Received: by 2002:aa7:d503:0:b0:544:e37e:d597 with SMTP id
 y3-20020aa7d503000000b00544e37ed597mr162244edq.7.1699895064416; Mon, 13 Nov
 2023 09:04:24 -0800 (PST)
MIME-Version: 1.0
References: <20231018181727.772-1-gurchetansingh@chromium.org>
 <20231018181727.772-2-gurchetansingh@chromium.org>
 <9b2f45e1-ea49-97ae-e359-3f9c0996394f@collabora.com>
In-Reply-To: <9b2f45e1-ea49-97ae-e359-3f9c0996394f@collabora.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Mon, 13 Nov 2023 09:04:12 -0800
X-Gmail-Original-Message-ID: <CAAfnVBn7S+ca3RvYeR_NVb2KOhqYf5hGwxrEHW53UVcjrxRMaw@mail.gmail.com>
Message-ID: <CAAfnVBn7S+ca3RvYeR_NVb2KOhqYf5hGwxrEHW53UVcjrxRMaw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/uapi: add explicit virtgpu context debug name
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Type: multipart/alternative; boundary="00000000000078fb0a060a0ba9a8"
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
Cc: josh.simonot@gmail.com, kraxel@redhat.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000078fb0a060a0ba9a8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 11, 2023 at 2:37=E2=80=AFPM Dmitry Osipenko <
dmitry.osipenko@collabora.com> wrote:

> On 10/18/23 21:17, Gurchetan Singh wrote:
> > +             case VIRTGPU_CONTEXT_PARAM_DEBUG_NAME:
> > +                     if (vfpriv->explicit_debug_name) {
> > +                             ret =3D -EINVAL;
> > +                             goto out_unlock;
> > +                     }
> > +
> > +                     ret =3D strncpy_from_user(vfpriv->debug_name,
> > +                                             u64_to_user_ptr(value),
> > +                                             DEBUG_NAME_MAX_LEN - 1);
> > +
> > +                     if (ret < 0) {
> > +                             ret =3D -EFAULT;
> > +                             goto out_unlock;
> > +                     }
> > +
> > +                     vfpriv->explicit_debug_name =3D true;
> > +                     break;
>
> Spotted a problem here. The ret needs to be set to zero on success. I'll
> send the fix shortly. Gurchetan you should've been getting the
> DRM_IOCTL_VIRTGPU_CONTEXT_INIT failure from gfxstream when you tested
> this patch, haven't you?
>

To accommodate older kernels/QEMU, gfxstream doesn't fail if CONTEXT_INIT
fails.  So the guest thought it failed and didn't react, but the value was
propagated to the host.


>
> Also noticed that the patch title says "drm/uapi" instead of
> "drm/virtio". My bad for not noticing it earlier. Please be more careful
> next time too :)
>
> --
> Best regards,
> Dmitry
>
>

--00000000000078fb0a060a0ba9a8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Nov 11, 2023 at 2:37=E2=80=AF=
PM Dmitry Osipenko &lt;<a href=3D"mailto:dmitry.osipenko@collabora.com">dmi=
try.osipenko@collabora.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">On 10/18/23 21:17, Gurchetan Singh wrote:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case VIRTGPU_CONTEXT_=
PARAM_DEBUG_NAME:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (vfpriv-&gt;explicit_debug_name) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_unlock;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ret =3D strncpy_from_user(vfpriv-&gt;debug_name,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0u64_to_user_ptr(value),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0DEBUG_NAME_MAX_LEN - 1);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (ret &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -EFAULT;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_unlock;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0vfpriv-&gt;explicit_debug_name =3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0break;<br>
<br>
Spotted a problem here. The ret needs to be set to zero on success. I&#39;l=
l<br>
send the fix shortly. Gurchetan you should&#39;ve been getting the<br>
DRM_IOCTL_VIRTGPU_CONTEXT_INIT failure from gfxstream when you tested<br>
this patch, haven&#39;t you?<br></blockquote><div><br></div><div>To accommo=
date older kernels/QEMU, gfxstream doesn&#39;t fail if CONTEXT_INIT fails.=
=C2=A0 So the guest thought it failed and didn&#39;t react, but the value w=
as propagated to the host.</div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
<br>
Also noticed that the patch title says &quot;drm/uapi&quot; instead of<br>
&quot;drm/virtio&quot;. My bad for not noticing it earlier. Please be more =
careful<br>
next time too :)<br>
<br>
-- <br>
Best regards,<br>
Dmitry<br>
<br>
</blockquote></div></div>

--00000000000078fb0a060a0ba9a8--
