Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C3C34625C
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 16:08:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 112826E958;
	Tue, 23 Mar 2021 15:08:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCE456E95E
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 15:08:15 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id k25so5901116iob.6
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 08:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KRMd/vrkIv7JyZsE8ZS29//iSCHhobxDNXZxOJjfwC0=;
 b=diTDqLKv1yPaimqYUfLADUoEr6EW8kBFdufEalbHclP4YGts1E+NN/mqsEgK1p7V9J
 FSf/kumQQrt95plHlCQzHAfijg0FH/PJnJoZc+ynsMPwbdHysUkwyYErnix0vRD4GdyW
 m+K1LsnSyAZUhCD45Bb+KYoCMylYirT46WdCVHeqTXfp6MIcAsDScu/gF0yLJj2sigpf
 jV2uxZV6T/j0v3tPsmS1SQwpyiLNj/2Gm26AvpMvkql1rJE6uiGk4SXzYXibQSNtrlul
 78/htXK0GzZWWnf88yWbpLHbjrUVH2iMDY01kIO4JYwRfHUrx5rLkYfAzX+Ufv0oYueH
 zKdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KRMd/vrkIv7JyZsE8ZS29//iSCHhobxDNXZxOJjfwC0=;
 b=baMhkyMDBlR+HgZ2jgUdTdEkAZonCqHrlIQ20Y/LnuxzHtVxoMN5gld35jzDgYtBF9
 cKpegmTjGVKRj4tJyhJDnAEKlrBp3dJ9pnlX5fr8c6NkqbfboIrKfe3sTvwxg7CHeq40
 B5qwa1/F3UCAf3FTZeCFGAXNGmZnfgxuNxSb6Z4yR63xDfp/KvhCE7YMvkjrOxj6RuG8
 3oS4eLdW8mvWnTI7rAf5ggRBgTOtp21l9gDhpJmzOerc+dUHAW3yiLSzpf8FLFbM5MzA
 PlzjnKfxQb7BkM6BPXa2Jg5MbG2DoFr4hMv6BhwiuPhOjipk2DAvyu25OYJC1m1gULpw
 boUg==
X-Gm-Message-State: AOAM531tRN5sB4RKEbYG72TpuDhNvoORDNc4mNtOybSu64ZLjjJbVYPk
 ZUKFqwhXojSnQiBqU7AUVuQYJookniodAWuWgVx98w==
X-Google-Smtp-Source: ABdhPJx4q73azqwH4QFy5mDRB6v6hDFz5ew9YlL4zYPp/UqsAN74WY2/4hlHMutT1HnmR86tO2M6tWL9ossJni/k+ko=
X-Received: by 2002:a05:6638:238c:: with SMTP id
 q12mr5057719jat.114.1616512095092; 
 Tue, 23 Mar 2021 08:08:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210310161444.1015500-1-markyacoub@chromium.org>
In-Reply-To: <20210310161444.1015500-1-markyacoub@chromium.org>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Tue, 23 Mar 2021 16:08:07 +0100
Message-ID: <CAP+8YyFb4ax0Z6Ev2=KpqF481kFyG_Br+WT=72dGK-tATXVrGg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Ensure that the modifier requested is
 supported by plane.
To: Mark Yacoub <markyacoub@chromium.org>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Mark Yacoub <markyacoub@google.com>
Content-Type: multipart/mixed; boundary="===============0678104175=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0678104175==
Content-Type: multipart/alternative; boundary="0000000000003419cc05be358d24"

--0000000000003419cc05be358d24
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 10, 2021 at 5:14 PM Mark Yacoub <markyacoub@chromium.org> wrote:

> From: Mark Yacoub <markyacoub@google.com>
>
> On initializing the framebuffer, call drm_any_plane_has_format to do a
> check if the modifier is supported. drm_any_plane_has_format calls
> dm_plane_format_mod_supported which is extended to validate that the
> modifier is on the list of the plane's supported modifiers.
>
> The bug was caught using igt-gpu-tools test:
> kms_addfb_basic.addfb25-bad-modifier
>
> Tested on ChromeOS Zork by turning on the display, running an overlay
> test, and running a YT video.
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> Signed-off-by: default avatarMark Yacoub <markyacoub@chromium.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c       | 13 +++++++++++++
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  9 +++++++++
>  2 files changed, 22 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> index afa5f8ad0f563..a947b5aa420d2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> @@ -908,6 +908,19 @@ int amdgpu_display_gem_fb_verify_and_init(
>                                          &amdgpu_fb_funcs);
>         if (ret)
>                 goto err;
> +       /* Verify that the modifier is supported. */
> +       if (!drm_any_plane_has_format(dev, mode_cmd->pixel_format,
> +                                     mode_cmd->modifier[0])) {
> +               struct drm_format_name_buf format_name;
> +               drm_dbg_kms(dev,
> +                           "unsupported pixel format %s / modifier
> 0x%llx\n",
> +                           drm_get_format_name(mode_cmd->pixel_format,
> +                                               &format_name),
> +                           mode_cmd->modifier[0]);
> +
> +               ret = -EINVAL;
> +               goto err;
> +       }
>

Why is this needed?


>         ret = amdgpu_display_framebuffer_init(dev, rfb, mode_cmd, obj);
>         if (ret)
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 961abf1cf040c..21314024a83ce 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -3939,6 +3939,7 @@ static bool dm_plane_format_mod_supported(struct
> drm_plane *plane,
>  {
>         struct amdgpu_device *adev = drm_to_adev(plane->dev);
>         const struct drm_format_info *info = drm_format_info(format);
> +       int i;
>
>         enum dm_micro_swizzle microtile =
> modifier_gfx9_swizzle_mode(modifier) & 3;
>
> @@ -3952,6 +3953,14 @@ static bool dm_plane_format_mod_supported(struct
> drm_plane *plane,
>         if (modifier == DRM_FORMAT_MOD_LINEAR)
>                 return true;
>
> +       /* Check that the modifier is on the list of the plane's supported
> modifiers. */
> +       for (i = 0; i < plane->modifier_count; i++) {
> +               if (modifier == plane->modifiers[i])
> +                       break;
> +       }
> +       if (i == plane->modifier_count)
> +               return false;
> +
>

This part seems fine by me.

>         /*
>          * The arbitrary tiling support for multiplane formats has not
> been hooked
>          * up.
> --
> 2.30.1.766.gb4fecdf3b7-goog
>
>

--0000000000003419cc05be358d24
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 10, 2021 at 5:14 PM Mark =
Yacoub &lt;<a href=3D"mailto:markyacoub@chromium.org">markyacoub@chromium.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">From: Mark Yacoub &lt;<a href=3D"mailto:markyacoub@google.com" target=3D"=
_blank">markyacoub@google.com</a>&gt;<br>
<br>
On initializing the framebuffer, call drm_any_plane_has_format to do a<br>
check if the modifier is supported. drm_any_plane_has_format calls<br>
dm_plane_format_mod_supported which is extended to validate that the<br>
modifier is on the list of the plane&#39;s supported modifiers.<br>
<br>
The bug was caught using igt-gpu-tools test: kms_addfb_basic.addfb25-bad-mo=
difier<br>
<br>
Tested on ChromeOS Zork by turning on the display, running an overlay<br>
test, and running a YT video.<br>
<br>
Cc: Alex Deucher &lt;<a href=3D"mailto:alexander.deucher@amd.com" target=3D=
"_blank">alexander.deucher@amd.com</a>&gt;<br>
Cc: Bas Nieuwenhuizen &lt;<a href=3D"mailto:bas@basnieuwenhuizen.nl" target=
=3D"_blank">bas@basnieuwenhuizen.nl</a>&gt;<br>
Signed-off-by: default avatarMark Yacoub &lt;<a href=3D"mailto:markyacoub@c=
hromium.org" target=3D"_blank">markyacoub@chromium.org</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_display.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 13 +++++++++++++<br>
=C2=A0drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |=C2=A0 9 +++++++++=
<br>
=C2=A02 files changed, 22 insertions(+)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_display.c<br>
index afa5f8ad0f563..a947b5aa420d2 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c<br>
@@ -908,6 +908,19 @@ int amdgpu_display_gem_fb_verify_and_init(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&a=
mp;amdgpu_fb_funcs);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Verify that the modifier is supported. */<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!drm_any_plane_has_format(dev, mode_cmd-&gt=
;pixel_format,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mode_cmd-&gt;mod=
ifier[0])) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_format_n=
ame_buf format_name;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_dbg_kms(dev,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&quot;unsupported pixel format %s / modifier 0x%llx=
\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0drm_get_format_name(mode_cmd-&gt;pixel_format,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&amp;format_name),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0mode_cmd-&gt;modifier[0]);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -EINVAL;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br></blockquote><div><br></div><div>Why is th=
is needed?</div><div> <br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D amdgpu_display_framebuffer_init(dev, rf=
b, mode_cmd, obj);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gp=
u/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
index 961abf1cf040c..21314024a83ce 100644<br>
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
@@ -3939,6 +3939,7 @@ static bool dm_plane_format_mod_supported(struct drm_=
plane *plane,<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct amdgpu_device *adev =3D drm_to_adev(plan=
e-&gt;dev);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct drm_format_info *info =3D drm_form=
at_info(format);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 enum dm_micro_swizzle microtile =3D modifier_gf=
x9_swizzle_mode(modifier) &amp; 3;<br>
<br>
@@ -3952,6 +3953,14 @@ static bool dm_plane_format_mod_supported(struct drm=
_plane *plane,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (modifier =3D=3D DRM_FORMAT_MOD_LINEAR)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Check that the modifier is on the list of th=
e plane&#39;s supported modifiers. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; plane-&gt;modifier_count; =
i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (modifier =3D=3D=
 plane-&gt;modifiers[i])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (i =3D=3D plane-&gt;modifier_count)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
+<br></blockquote><div><br></div><div>This part seems fine by me. <br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* The arbitrary tiling support for multip=
lane formats has not been hooked<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* up.<br>
-- <br>
2.30.1.766.gb4fecdf3b7-goog<br>
<br>
</blockquote></div></div>

--0000000000003419cc05be358d24--

--===============0678104175==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0678104175==--
