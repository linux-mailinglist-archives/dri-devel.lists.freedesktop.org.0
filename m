Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A8526E85E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 00:27:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07ED56E421;
	Thu, 17 Sep 2020 22:27:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62B0C6E421
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 22:27:38 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id k25so3383738ljg.9
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 15:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6ox/oz2JSZ//c69LHGTOfHo5afsC8E8GBRLlmiSUXyE=;
 b=OUNfyFtkPx0dN0dUw2JK8YgHmtLJTWFh9VYJsfioH1iJka9MnFhwT87U1g/ig4AoO0
 tyQxh1AHfBnCdBvJWP/1CNoDs02XpwQw+wWAMhN3l+SbvZkytXTtEJBSj9evg20EsRbL
 y5BeZIu1SPmt/prOtZtEwQ/i03qXXzgw9TJTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6ox/oz2JSZ//c69LHGTOfHo5afsC8E8GBRLlmiSUXyE=;
 b=NlCZXiJfy4sisNU+btOfgrSWsHslvMxONA4xYStovj7b4F4VzDtjom/4aoZvcl0wSp
 FnOTjKqLDbXtIV5e+0GygzPFyjNQpmMavdi3HD1eoBBaabWpwbyh0Vo8IKjob/wn1zOk
 mClnZ4JK3ElTKWLZIt8K10W9eHQbGD6Rz8f+SuUOjTyP1ZSaqXQZCZ7wiVTEdTGhFLjy
 X+Z62MLVqKAXcWXW9/yQWfGAGmbxyOcapPzCyHPAyhiqiExkMljCInr5WyIKbtr1JST8
 Y9ravEVqBYdQxOXny7Wpf0P5iMvinSW95fVudAXJle5G8CJAtqT3vCIUQ3jsUson1wwP
 nANg==
X-Gm-Message-State: AOAM531swXZsQkRUtWj7/F7v5dczkql1Z0fnZ33mIf9ipBSL/y0g+jZY
 UuQxVobDznG1S3jOOHSkVWuq3dLr53odDQ==
X-Google-Smtp-Source: ABdhPJzoVawigcX1zH0HUpF39I99cNrshzLJTwO2bxWqfYJIm0ctPQCK24kFl1T/77ys8SPYCC4IuQ==
X-Received: by 2002:a2e:a496:: with SMTP id h22mr10028087lji.24.1600381656654; 
 Thu, 17 Sep 2020 15:27:36 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com.
 [209.85.167.54])
 by smtp.gmail.com with ESMTPSA id a197sm175323lfd.137.2020.09.17.15.27.36
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Sep 2020 15:27:36 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id y11so3931930lfl.5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 15:27:36 -0700 (PDT)
X-Received: by 2002:ac2:434b:: with SMTP id o11mr8261132lfl.576.1600381655654; 
 Thu, 17 Sep 2020 15:27:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200917000838.735-1-gurchetansingh@chromium.org>
 <20200917000838.735-9-gurchetansingh@chromium.org>
 <20200917094024.3d5savf3pshlst7z@sirius.home.kraxel.org>
In-Reply-To: <20200917094024.3d5savf3pshlst7z@sirius.home.kraxel.org>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Thu, 17 Sep 2020 15:27:24 -0700
X-Gmail-Original-Message-ID: <CAAfnVBnXQcKFMFpT8VrbPyeMVMc_4nc-3bRjn81kZz9gjvmm9A@mail.gmail.com>
Message-ID: <CAAfnVBnXQcKFMFpT8VrbPyeMVMc_4nc-3bRjn81kZz9gjvmm9A@mail.gmail.com>
Subject: Re: [PATCH v3 09/19] drm/virtio: implement blob resources: probe for
 host visible region
To: Gerd Hoffmann <kraxel@redhat.com>
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1451229560=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1451229560==
Content-Type: multipart/alternative; boundary="000000000000179e2505af89e415"

--000000000000179e2505af89e415
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 17, 2020 at 2:40 AM Gerd Hoffmann <kraxel@redhat.com> wrote:

>   Hi,
>
> > +             if (!devm_request_mem_region(&vgdev->vdev->dev,
> > +
> vgdev->host_visible_region.addr,
> > +
> vgdev->host_visible_region.len,
> > +                                          dev_name(&vgdev->vdev->dev)))
> {
> > +                     DRM_ERROR("Could not reserve host visible
> region\n");
> > +                     goto err_vqs;
> > +             }
>
> > +     if (vgdev->has_host_visible) {
> > +             devm_release_mem_region(&vgdev->vdev->dev,
> > +                                     vgdev->host_visible_region.addr,
> > +                                     vgdev->host_visible_region.len);
> > +     }
>
> Hmm. isn't it the point of the managed apis that the release happens
> automatically?  I think you don't need the devm_release_mem_region
> call (it doesn't break things though).
>

Ack, good catch.  Fixed.


>
> take care,
>   Gerd
>
>

--000000000000179e2505af89e415
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 17, 2020 at 2:40 AM Gerd =
Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0 H=
i,<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!devm_request_mem=
_region(&amp;vgdev-&gt;vdev-&gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 vgdev-&gt;host_visible_region.addr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 vgdev-&gt;host_visible_region.len,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 dev_name(&amp;vgdev-&gt;vdev-&gt;dev))) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0DRM_ERROR(&quot;Could not reserve host visible region\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0goto err_vqs;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (vgdev-&gt;has_host_visible) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0devm_release_mem_regi=
on(&amp;vgdev-&gt;vdev-&gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vgdev-&gt;ho=
st_visible_region.addr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vgdev-&gt;ho=
st_visible_region.len);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
<br>
Hmm. isn&#39;t it the point of the managed apis that the release happens<br=
>
automatically?=C2=A0 I think you don&#39;t need the devm_release_mem_region=
<br>
call (it doesn&#39;t break things though).<br></blockquote><div><br></div><=
div>Ack, good catch.=C2=A0 Fixed.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
take care,<br>
=C2=A0 Gerd<br>
<br>
</blockquote></div></div>

--000000000000179e2505af89e415--

--===============1451229560==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1451229560==--
