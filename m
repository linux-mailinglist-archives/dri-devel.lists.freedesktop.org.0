Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 203E71CFF9
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 21:34:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADC0E89307;
	Tue, 14 May 2019 19:34:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-it1-x144.google.com (mail-it1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D0E89307;
 Tue, 14 May 2019 19:34:02 +0000 (UTC)
Received: by mail-it1-x144.google.com with SMTP id i10so809349ite.0;
 Tue, 14 May 2019 12:34:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3WLgm2Em04I4luWIrAv6bovSRqJAq2VSMtxrYKLrOrs=;
 b=TkVZ6NXZqdNbJlAqjcopQpsarqMewWqrAPl0P+zefMfC+oaPqpjCEKOBAFOhwqoEA4
 V8LF4lA9y8ovZPXXc3/nN6UfDsJEBj33qHx5aZcQvpVFs+rUrbfaRsesFMQpMwGnylNq
 RS8HpdSakhG1V9kbIelebUICYbi3ApETeDzRdbFcJlTOOu+uXtDIXxKYZLuZqFyneqDi
 TdfjtfQC6UFW9Uyx9NYNA8UDPnpTijlSyqq4hA7BOxSNsP1EKgDh5TyiIWKKPgRLeRxh
 +RrahlTK8Gtm4ACJtQKa0FJUmL+aBJbYHZzUuYWPMe0Tu4YyLCexyRZoo4kgMGxsoh2c
 XwRg==
X-Gm-Message-State: APjAAAU/cYGLGwuHfc/ObzoaLBjwRQ7/pIfoLu4pFUyMmO5Q0iB0ia1v
 62wRDr4aUjaB8ewmnCPpt18tmoyi7kxPyymk6pM=
X-Google-Smtp-Source: APXvYqxHZG+OGVoEb+qXkp4B7jg2P1cQ4hIwyDcKNchxp8r2zn2GhEjDjftxAQwSdR02o7W4lEZYBD7pHLntcLtLyTY=
X-Received: by 2002:a24:19cd:: with SMTP id b196mr4787709itb.74.1557862441417; 
 Tue, 14 May 2019 12:34:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190514123127.1650-1-christian.koenig@amd.com>
 <20190514123127.1650-11-christian.koenig@amd.com>
In-Reply-To: <20190514123127.1650-11-christian.koenig@amd.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Tue, 14 May 2019 15:33:25 -0400
Message-ID: <CAAxE2A6Z45NCy7v5fPqmo5o5ZEnmvv_f=qax0uoDS9amMFEB7w@mail.gmail.com>
Subject: Re: [PATCH 11/11] drm/amdgpu: stop removing BOs from the LRU during CS
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=3WLgm2Em04I4luWIrAv6bovSRqJAq2VSMtxrYKLrOrs=;
 b=tjQr2IhPk9soQC4J4k4A7Gz09bOic+1/7c3+NZ0mX67pj9W6oUMStL00Zohgj3dTmD
 s+CWZSGvYIvM4SCpajC55FyFX7EXKKQPaJ9ccHjD1Vo9YCGWf9FH9+MkxPTFCL7rBN7a
 3mmeBJWJtQ6efAidG3hloXqWD176H0yXjNqWwj/wthk1KEp/hpcY+ytGTpKe22JTo9A0
 zRYfOghGK3+yecHpfQWjepY+69PC7Q2HpUYobJ8QXgO5LvRAiAGgl6JSBlxrGGr/yVwl
 7Yd1dvn6ROj5791d8Keb6HTsA1TITn7iZYIdrqq/gWSpRVSu0HCf/fNWCrjIU1RqqyP4
 oBEA==
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
Cc: Prike.Liang@amd.com, amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0541364042=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0541364042==
Content-Type: multipart/alternative; boundary="0000000000006e01d50588de1d61"

--0000000000006e01d50588de1d61
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This series fixes the OOM errors. However, if I torture the kernel driver
more, I can get it to deadlock and end up with unkillable processes. I can
also get an OOM error. I just ran the test 5 times:

AMD_DEBUG=3Dtestgdsmm glxgears & AMD_DEBUG=3Dtestgdsmm glxgears &
AMD_DEBUG=3Dtestgdsmm glxgears & AMD_DEBUG=3Dtestgdsmm glxgears &
AMD_DEBUG=3Dtestgdsmm glxgears

Marek

On Tue, May 14, 2019 at 8:31 AM Christian K=C3=B6nig <
ckoenig.leichtzumerken@gmail.com> wrote:

> This avoids OOM situations when we have lots of threads
> submitting at the same time.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index fff558cf385b..f9240a94217b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -648,7 +648,7 @@ static int amdgpu_cs_parser_bos(struct
> amdgpu_cs_parser *p,
>         }
>
>         r =3D ttm_eu_reserve_buffers(&p->ticket, &p->validated, true,
> -                                  &duplicates, true);
> +                                  &duplicates, false);
>         if (unlikely(r !=3D 0)) {
>                 if (r !=3D -ERESTARTSYS)
>                         DRM_ERROR("ttm_eu_reserve_buffers failed.\n");
> --
> 2.17.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--0000000000006e01d50588de1d61
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>This series fixes the OOM errors. Ho=
wever, if I torture the kernel driver more, I can get it to deadlock and en=
d up with unkillable processes. I can also get an OOM error. I just ran the=
 test 5 times:</div><div><br></div><div>AMD_DEBUG=3Dtestgdsmm glxgears &amp=
; AMD_DEBUG=3Dtestgdsmm glxgears &amp; AMD_DEBUG=3Dtestgdsmm glxgears &amp;=
 AMD_DEBUG=3Dtestgdsmm glxgears &amp; AMD_DEBUG=3Dtestgdsmm glxgears</div><=
div></div><br><div>Marek<br></div></div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 14, 2019 at 8:31 AM Chr=
istian K=C3=B6nig &lt;<a href=3D"mailto:ckoenig.leichtzumerken@gmail.com">c=
koenig.leichtzumerken@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">This avoids OOM situations when we have lo=
ts of threads<br>
submitting at the same time.<br>
<br>
Signed-off-by: Christian K=C3=B6nig &lt;<a href=3D"mailto:christian.koenig@=
amd.com" target=3D"_blank">christian.koenig@amd.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/a=
mdgpu/amdgpu_cs.c<br>
index fff558cf385b..f9240a94217b 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c<br>
@@ -648,7 +648,7 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser=
 *p,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D ttm_eu_reserve_buffers(&amp;p-&gt;ticket,=
 &amp;p-&gt;validated, true,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;duplicates, true);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;duplicates, false);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (unlikely(r !=3D 0)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r !=3D -ERESTAR=
TSYS)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 DRM_ERROR(&quot;ttm_eu_reserve_buffers failed.\n&quot;);<br>
-- <br>
2.17.1<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
<a href=3D"mailto:amd-gfx@lists.freedesktop.org" target=3D"_blank">amd-gfx@=
lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/listinfo=
/amd-gfx</a></blockquote></div>

--0000000000006e01d50588de1d61--

--===============0541364042==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0541364042==--
