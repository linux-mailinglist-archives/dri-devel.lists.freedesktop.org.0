Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 890DF1E9A76
	for <lists+dri-devel@lfdr.de>; Sun, 31 May 2020 23:11:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B72D89F2E;
	Sun, 31 May 2020 21:11:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C04D689F2E
 for <dri-devel@lists.freedesktop.org>; Sun, 31 May 2020 21:11:34 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id bg4so3426871plb.3
 for <dri-devel@lists.freedesktop.org>; Sun, 31 May 2020 14:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=6T1mcHD3CiuhBUcz1rc+yYa4VtQ3BqY3trLAgPwZnJM=;
 b=g7iI5zik/5exgRaT4Ng/bD7nG/T1S+pjJdnzaEghy0PCDk6T8YSVx1c6wlOYqg47Ro
 m3AtRWEhnD/7GI/TXX9RIyokYgGtZe5GpZoiGdalKcJa4zr5Bc5lXGxGsGAPb4Rtl80J
 Uou8Az6ZxU6eRjiMtiFLg1wY+S70UoiYU9dtfONVanp5a5067qmsY75iAJlt9I6ePZ65
 j3rmEzZ9AVhK0gL2kVwUMaVFj8I0h+WolE2rT7dZyE8uB/mwz4xZk2no4r3eawK9GNpQ
 CGwRn4wxH5Rp008wZP+JUiyDWzPSx3Y2AI/S9EJ6A0S6BpuNl1XSwi4wCGNRvXq2Cm2y
 zIkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=6T1mcHD3CiuhBUcz1rc+yYa4VtQ3BqY3trLAgPwZnJM=;
 b=b0eI+YJB3tJVfU4zYMfsXbuPKVXuzJZkm58Kp2IZLlFVq6j4OMUkgTq7xjKPlJInuL
 8ER1L+Ox4p6B/ifehIVh3XCXFSnzEyx+qHE9hP7z55nCeNCLPe8IEE/ZjUJ6aWLkVPLR
 sJpMwsdSX0gqYY1AlCHD58raVQ7bun+7XyPGQrtjX8aCETaw8Lm0Qj+fJ29Jf0Y2d5R6
 RkEhssGO1oM/v0Nd2HrHQ7mjQc3X9mGLXWM/BFyrGWF2hUQzV6hhQaIECqdl9JuwsNir
 1XkOllg+Et//m2sfI+hElQHVJnB4nGeZi/VB2H+fxtEgEAQfk0cG3tQMrqekiiJMj7lY
 OuDg==
X-Gm-Message-State: AOAM5324upTPAPXZbjrILcjOFfPqwo+eMyFxxk/9i3GKFo87Q0Zg+40Z
 ZY3aeXEM3qWKbafTHRyrKVIdZego6f76AbcRBuc=
X-Google-Smtp-Source: ABdhPJyt1xLgEMhYPNlDCpbhrbW6PChwaH7iOlpvrt4Kg9RGb0CLCagQos/t3t7ctjBWwVJ7mHuA/JMPEtcj0JlVXFs=
X-Received: by 2002:a17:902:bb95:: with SMTP id
 m21mr5579578pls.262.1590959494319; 
 Sun, 31 May 2020 14:11:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90b:716:0:0:0:0 with HTTP; Sun, 31 May 2020 14:11:33
 -0700 (PDT)
In-Reply-To: <854fae07-3cb4-dbcf-fa93-35b447f9d084@nvidia.com>
References: <20200522041506.39638-1-jhubbard@nvidia.com>
 <20200531205819.GC138722@ravnborg.org>
 <854fae07-3cb4-dbcf-fa93-35b447f9d084@nvidia.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 1 Jun 2020 00:11:33 +0300
Message-ID: <CAHp75Vf6=UuC2Sef3m3CpRmjAOWt8ZgBW+OPf0-_53P3F__CWw@mail.gmail.com>
Subject: Re: [PATCH 0/2] video: fbdev: fix error handling,
 convert to pin_user_pages*()
To: John Hubbard <jhubbard@nvidia.com>
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 "Gustavo A . R . Silva" <gustavo@embeddedor.com>,
 Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 LKML <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="===============1891438096=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1891438096==
Content-Type: multipart/alternative; boundary="00000000000082d09105a6f81f2e"

--00000000000082d09105a6f81f2e
Content-Type: text/plain; charset="UTF-8"

On Monday, June 1, 2020, John Hubbard <jhubbard@nvidia.com> wrote:

> On 2020-05-31 13:58, Sam Ravnborg wrote:
> ...
>
>> Thanks, patches are now applied to drm-misc-next.
>> They will hit -next soon, but you will have to wait
>> until next (not the upcoming) merge window before they hit
>> mainline linux.
>>
>>         Sam
>>
>>
> Great! That will work out just fine.



JFYI, we have history.git starting from v0.01.


>
>
> thanks,
> --
> John Hubbard
> NVIDIA
>


-- 
With Best Regards,
Andy Shevchenko

--00000000000082d09105a6f81f2e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Monday, June 1, 2020, John Hubbard &lt;<a href=3D"mailto:jhubbar=
d@nvidia.com">jhubbard@nvidia.com</a>&gt; wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">On 2020-05-31 13:58, Sam Ravnborg wrote:<br>
...<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Thanks, patches are now applied to drm-misc-next.<br>
They will hit -next soon, but you will have to wait<br>
until next (not the upcoming) merge window before they hit<br>
mainline linux.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Sam<br>
<br>
</blockquote>
<br>
Great! That will work out just fine.</blockquote><div><br></div><div><br></=
div><div>JFYI, we have history.git starting from v0.01.</div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">
<br>
<br>
thanks,<br>
-- <br>
John Hubbard<br>
NVIDIA<br>
</blockquote><br><br>-- <br>With Best Regards,<br>Andy Shevchenko<br><br><b=
r>

--00000000000082d09105a6f81f2e--

--===============1891438096==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1891438096==--
