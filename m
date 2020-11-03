Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 857952A3EE7
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:29:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 485786E820;
	Tue,  3 Nov 2020 08:29:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F8F96E820
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 08:29:15 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id w1so17521003wrm.4
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Nov 2020 00:29:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2eOHuf68VNMyMOwJwshdQSb8O2na6YYJwnBl8zcaPVY=;
 b=eBmEnOfD1WgLcvbf7r+fw91k9PjCpv1m66Oj2DORACsviKHDl2r1YmwSSYDwfHPUIs
 0vvCJKEoLJj5GEeOLnyrrCpDgQiKr/8EffPMZRj+rV1S0qSWV1tOhsvIYcujXx5vRhvN
 OKC4NNGUbA/LNzEcwobyHO0pcz40fN/zSLJcDy4qKUv1SISYtzWgByh5F2g2OKgxtrZ/
 WDOyN4YlvEGs12hUo9WiuyZg0z8eMZbKUsN0NeV+Go3N5TQz04xiw4yS593eQPL6uZFA
 2/rI/7Zv0mQxXGohNHIaHRGBrsG1gwwmw446Nl9OeXNLsyJzHyT8Fa29rEAUAS3OxsRi
 SBrg==
X-Gm-Message-State: AOAM532M70Zc3ZVSw7dybn0ayMhsQzF+uX5xftzAMkxtw4UVZ0msNkCH
 1ZnS8BoVz/CLfqvwdaZFzP5dMe2ECwdkMLBnLnuqv9Rat6W0CQ==
X-Google-Smtp-Source: ABdhPJwItXp7/2USnMBn40Go8rBfWMHXEQ3+ta5Iic4i9fbylu9aUayi5+j++uASwNV8RQxrpmJ6pWwFega6E5CNXjE=
X-Received: by 2002:a05:6000:104c:: with SMTP id
 c12mr24083349wrx.133.1604392154166; 
 Tue, 03 Nov 2020 00:29:14 -0800 (PST)
MIME-Version: 1.0
References: <20201030145833.29006-1-steven.price@arm.com>
In-Reply-To: <20201030145833.29006-1-steven.price@arm.com>
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Date: Tue, 3 Nov 2020 09:29:02 +0100
Message-ID: <CAAObsKA5xnxqARgNCeqwSmu2cPGcpqa=cBRG6AuLVRYYb9AjxA@mail.gmail.com>
Subject: Re: [PATCH] drm/panfrost: Fix module unload
To: Steven Price <steven.price@arm.com>
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: multipart/mixed; boundary="===============1545877305=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1545877305==
Content-Type: multipart/alternative; boundary="0000000000006df9c705b32fa89d"

--0000000000006df9c705b32fa89d
Content-Type: text/plain; charset="UTF-8"

Looks good, thanks!

Reviewed-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>

On Fri, 30 Oct 2020 at 15:59, Steven Price <steven.price@arm.com> wrote:

> When unloading the call to pm_runtime_put_sync_suspend() will attempt to
> turn the GPU cores off, however panfrost_device_fini() will have turned
> the clocks off. This leads to the hardware locking up.
>
> Instead don't call pm_runtime_put_sync_suspend() and instead simply mark
> the device as suspended using pm_runtime_set_suspended(). And also
> include this on the error path in panfrost_probe().
>
> Fixes: aebe8c22a912 ("drm/panfrost: Fix possible suspend in
> panfrost_remove")
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c
> b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 23513869500c..0ac8ad18fdc6 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -627,6 +627,7 @@ static int panfrost_probe(struct platform_device *pdev)
>  err_out1:
>         pm_runtime_disable(pfdev->dev);
>         panfrost_device_fini(pfdev);
> +       pm_runtime_set_suspended(pfdev->dev);
>  err_out0:
>         drm_dev_put(ddev);
>         return err;
> @@ -641,9 +642,9 @@ static int panfrost_remove(struct platform_device
> *pdev)
>         panfrost_gem_shrinker_cleanup(ddev);
>
>         pm_runtime_get_sync(pfdev->dev);
> -       panfrost_device_fini(pfdev);
> -       pm_runtime_put_sync_suspend(pfdev->dev);
>         pm_runtime_disable(pfdev->dev);
> +       panfrost_device_fini(pfdev);
> +       pm_runtime_set_suspended(pfdev->dev);
>
>         drm_dev_put(ddev);
>         return 0;
> --
> 2.20.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>

--0000000000006df9c705b32fa89d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace">Looks good, thanks!</div><div class=3D"gmail_default" style=3D=
"font-family:monospace,monospace"><br></div><div class=3D"gmail_default" st=
yle=3D"font-family:monospace,monospace">Reviewed-by: Tomeu Vizoso &lt;<a hr=
ef=3D"mailto:tomeu.vizoso@collabora.com">tomeu.vizoso@collabora.com</a>&gt;=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Fri, 30 Oct 2020 at 15:59, Steven Price &lt;<a href=3D"mailto:stev=
en.price@arm.com">steven.price@arm.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">When unloading the call to pm_runtime=
_put_sync_suspend() will attempt to<br>
turn the GPU cores off, however panfrost_device_fini() will have turned<br>
the clocks off. This leads to the hardware locking up.<br>
<br>
Instead don&#39;t call pm_runtime_put_sync_suspend() and instead simply mar=
k<br>
the device as suspended using pm_runtime_set_suspended(). And also<br>
include this on the error path in panfrost_probe().<br>
<br>
Fixes: aebe8c22a912 (&quot;drm/panfrost: Fix possible suspend in panfrost_r=
emove&quot;)<br>
Signed-off-by: Steven Price &lt;<a href=3D"mailto:steven.price@arm.com" tar=
get=3D"_blank">steven.price@arm.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/panfrost/panfrost_drv.c | 5 +++--<br>
=C2=A01 file changed, 3 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panf=
rost/panfrost_drv.c<br>
index 23513869500c..0ac8ad18fdc6 100644<br>
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c<br>
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c<br>
@@ -627,6 +627,7 @@ static int panfrost_probe(struct platform_device *pdev)=
<br>
=C2=A0err_out1:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pm_runtime_disable(pfdev-&gt;dev);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 panfrost_device_fini(pfdev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pm_runtime_set_suspended(pfdev-&gt;dev);<br>
=C2=A0err_out0:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_dev_put(ddev);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return err;<br>
@@ -641,9 +642,9 @@ static int panfrost_remove(struct platform_device *pdev=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 panfrost_gem_shrinker_cleanup(ddev);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pm_runtime_get_sync(pfdev-&gt;dev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0panfrost_device_fini(pfdev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pm_runtime_put_sync_suspend(pfdev-&gt;dev);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pm_runtime_disable(pfdev-&gt;dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0panfrost_device_fini(pfdev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pm_runtime_set_suspended(pfdev-&gt;dev);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_dev_put(ddev);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
-- <br>
2.20.1<br>
<br>
_______________________________________________<br>
dri-devel mailing list<br>
<a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blank">dri-de=
vel@lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/dri-devel" rel=3D=
"noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/listin=
fo/dri-devel</a><br>
</blockquote></div>

--0000000000006df9c705b32fa89d--

--===============1545877305==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1545877305==--
