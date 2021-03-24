Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 740883477E7
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 13:10:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B84F6E96A;
	Wed, 24 Mar 2021 12:10:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 548EB6E96A
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 12:10:42 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id z2so24218640wrl.5
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 05:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E1r72OauA/gIlBZG4tpWGGoc73ZgVn8gVGRpZUotXuw=;
 b=rCK5pLhwzKoFjQw8S59dsGIMkFF95NbFNom0to3arSujGa6IUXzB493PEmjkS1aLDI
 J3U38UqhsOX4pjHxdVE8T8OjLZde3Mgplmt2zX+g7DXeKd23qcaXyBkYEDYVIhIamMAS
 nmcEjhWGrtqB8Gy7SRkhqpN/EKBPWtQbsjMZ+GxxGV3qUAipcMoz5C/0PVltHhx4pa3d
 TJQmWb0AN9xigzsrReG5aXCNWxvm7ncreuZYQXtCsb4C2M1xAlE9vJ0qI3VIA2HYSmwn
 3hE+dyCvIQY49+aaBJylMbeSSEYlmgR34FEicMrzSLWxTz2khsO3/9E4AHQf0cftYQc6
 fKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E1r72OauA/gIlBZG4tpWGGoc73ZgVn8gVGRpZUotXuw=;
 b=pjOXGreTz920IjMLHpBMIVFtfEkUXQDenkqn1Q2wY13QCFmPtx2n/EJ8g4ac+YPklR
 +QfMcOz0RtVA4ocAVGv1LwuB7c3cyKPEtUE+jvcfbJlw++VmcwQY/Kt1Ie+48lUVx9js
 FkFZEckMKCj2E2oewVY8UyXjEUBdk6Y5EwSQz5K+K1WQpi1AqCWrRE5ZmaqaXJK9A4Is
 DSsXehdOt1Dgx11YRePW8shLdDEdG/AZML+hiBknc32vHmh0Qa+nAqGhMHjGUIjzYXOK
 r1qv4An+HA2yrUiiq/ems7X2App3Nj4FnIFZ5NxG76lacWoU8RjDAYobwgS99Wius1Hx
 EjbA==
X-Gm-Message-State: AOAM531Cf4GHK6VNzSPQS0UsGNFTafE20Kf0YyXvQSCaoB/gqLXkIQHR
 s9H1GtYioflAUBW5OfG63aeFXYvCKt38jErVGujNfA==
X-Google-Smtp-Source: ABdhPJzBQsDAv6Xrhm0OaPaUIM0Wxc4Y6jBcCrV3NcGzD2Y5CwNPU7cPSK8lPuAC3mBM5g1xg5XezhvVhnxc64DiIIg=
X-Received: by 2002:a5d:6c67:: with SMTP id r7mr3129138wrz.373.1616587840870; 
 Wed, 24 Mar 2021 05:10:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210310161444.1015500-1-markyacoub@chromium.org>
 <CADnq5_P9aYcedOP2qduSz7VN1fCSnmQEtPa+FdjYu9Co7TwPog@mail.gmail.com>
 <CAC0gqY7Y2WxtAZ3GnWmASPYq7ahYTfmPhOHAAX5UjMNS9k098w@mail.gmail.com>
 <b4070483-5aa5-c712-6435-dcb4a206ca76@daenzer.net>
 <CAP+8YyExtmmZbFfAO_YR=XWHE+HbH6m7JqyJV4LB_hbGwsihBA@mail.gmail.com>
In-Reply-To: <CAP+8YyExtmmZbFfAO_YR=XWHE+HbH6m7JqyJV4LB_hbGwsihBA@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 24 Mar 2021 12:10:15 +0000
Message-ID: <CAPj87rP+WkUPbS3yyGGfy0SRm_hsnCCUav99Dg2Q+tXCiJ5D+A@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Ensure that the modifier requested is
 supported by plane.
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
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
Cc: Mark Yacoub <markyacoub@chromium.org>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Mark Yacoub <markyacoub@google.com>
Content-Type: multipart/mixed; boundary="===============2009224534=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2009224534==
Content-Type: multipart/alternative; boundary="00000000000000f5aa05be473062"

--00000000000000f5aa05be473062
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 24 Mar 2021 at 10:53, Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
wrote:

> On Wed, Mar 24, 2021 at 11:13 AM Michel D=C3=A4nzer <michel@daenzer.net> =
wrote:
>
>> No modifier support does not imply linear. It's generally signalled via
>> DRM_FORMAT_MOD_INVALID, which roughly means "tiling is determined by dri=
ver
>> specific mechanisms".
>>
>
> Doesn't quite work that way in the kernel sadly. If you don't set
> DRM_MODE_FB_MODIFIERS then the modifier fields have to be 0 (which happen=
s
> to alias DRM_FORMAT_MOD_LINEAR and then now deprecated
> DRM_FORMAT_MOD_NONE). This is verified in shared drm code.
>
> (and all userspace code I've seen simply doesn't set DRM_MODE_FB_MODIFIER=
S
> if the incoming modifier is DRM_FORMAT_MOD_INVALID)
>

Yes, but even though the field is zero, the lack of the flag means it must
be treated as INVALID. If the kernel is not doing this, the kernel is
objectively wrong. (And I know it doesn't do this in most cases, because
otherwise I wouldn't be able to use this GNOME session on an Intel laptop,
where modifiers are blacklisted.)

Cheers,
Daniel

--00000000000000f5aa05be473062
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><span style=3D"">On Wed, 24 Mar 2021 at 1=
0:53, Bas Nieuwenhuizen &lt;<a href=3D"mailto:bas@basnieuwenhuizen.nl">bas@=
basnieuwenhuizen.nl</a>&gt; wrote:</span><br></div><div class=3D"gmail_quot=
e"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div =
dir=3D"ltr"><span style=3D"">On Wed, Mar 24, 2021 at 11:13 AM Michel D=C3=
=A4nzer &lt;</span><a href=3D"mailto:michel@daenzer.net" target=3D"_blank" =
style=3D"">michel@daenzer.net</a><span style=3D"">&gt; wrote:</span><br></d=
iv><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">No modifier support does not imply linear. It&#39;s generally signalle=
d via DRM_FORMAT_MOD_INVALID, which roughly means &quot;tiling is determine=
d by driver specific mechanisms&quot;.<br></blockquote><div><br></div><div>=
Doesn&#39;t quite work that way in the kernel sadly. If you don&#39;t set D=
RM_MODE_FB_MODIFIERS then the modifier fields have to be 0 (which happens t=
o alias DRM_FORMAT_MOD_LINEAR and then now deprecated DRM_FORMAT_MOD_NONE).=
 This is verified in shared drm code.</div><div><br></div><div>(and all use=
rspace code I&#39;ve seen simply doesn&#39;t set DRM_MODE_FB_MODIFIERS if t=
he incoming modifier is DRM_FORMAT_MOD_INVALID)</div></div></div></blockquo=
te><div><br></div><div>Yes, but even though the field is zero, the lack of =
the flag means it must be treated as INVALID. If the kernel is not doing th=
is, the kernel is objectively wrong. (And I know it doesn&#39;t do this in =
most cases, because otherwise I wouldn&#39;t be able to use this GNOME sess=
ion on an Intel laptop, where modifiers are blacklisted.)</div><div><br></d=
iv><div>Cheers,</div><div>Daniel=C2=A0</div></div></div>

--00000000000000f5aa05be473062--

--===============2009224534==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2009224534==--
