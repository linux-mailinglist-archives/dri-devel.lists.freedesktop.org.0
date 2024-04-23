Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1D28ADB84
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 03:28:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E1A110E565;
	Tue, 23 Apr 2024 01:28:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="pQywNpwZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0566810E268
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 01:28:47 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id
 6a1803df08f44-69b6d36b71cso24577636d6.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 18:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1713835726; x=1714440526;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+2o9KxjS3yhVC3VeLL1pJdP/3G1++raqIQf26OSKG5o=;
 b=pQywNpwZred1hnHLwM9yCYjiiH7FEglwYI4+0hKgFvxTjnx9aaosK7Qp7mB6HHidmi
 ZIfjG4ckhNxUVEYZo3TKaL3poD7Yi0WGQgdtZTr4slHRqbcX+VMb8PF93DxEKPZ/LD8Y
 GK7P/VKTHeX/L8UTE+TlZNykduj9oI6/lRxvt1KCbi1/eQo8vActIHyIB7gDL8aR6YOq
 90hb/Jmg4OoLcbq0WCLmSYt4Rtdb+/NrZtpxv+IlwwdUn4WGhVmQXuiSFce66BOKfhfs
 leDu/7+4o3EKXvnlWNa7RKWqad4axhXXcRLb7XlULCfaxFz8QsQZk7CKo/m+geSg9WiF
 epWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713835726; x=1714440526;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+2o9KxjS3yhVC3VeLL1pJdP/3G1++raqIQf26OSKG5o=;
 b=xCRIGbypgbOJZzHwOIlE4X9Xy3b8g8DM90oQws74OeT7FGTB/gNk+beCnnUNN24mzR
 cEXOMDGPZoV+7O60mr+ZFtthiRztGOVp2sISCgx+tkQtBViiCyK+mXuNGH9FfTlP79Iy
 oSYu8ZuxhovUYhsoHUbV7ZT+UeeA4ZfLPS6RyaX6pX1QV45Wql3WzFThNu4PXAl/3eHo
 I7LHStgD6ffRSD7ssKJaX1UUqJw9kPlPmrCSVHyBElMe3na77quZUbVQFMRS6lg743UN
 g+7D1YmDaCHDokNSgRepNDHK0AOFMLIOE76ysSHqn5r1PLvquYFY9T2RF02q1FUVQwBU
 fkOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvJ/kyrE+mdNP80WHfT6K6Ctuq9ukkPBtxpbA9G3xgMJWcp4KIIB3ug+Oy9D+N2M771AN1jAUj99bsDHqSeUZ69h2qROOjoAQgsHpHxsEN
X-Gm-Message-State: AOJu0Yz71bQp2QzZTxWTd0jNY8/CgoBfP2ji4ymuA9EQkOoIqn1tmDst
 GBTHqGf7VMKvq8AYAtHF7qwngBF181Zs2q6k5RQUZPhIRvaCopwgx84dP11HyoTK3gZ3C1fRHAJ
 BnqDfr86L9uUrJDEQxhGssdIJw1rWGhthe2eV2g==
X-Google-Smtp-Source: AGHT+IHFU5BGiHf2KqSN/aOKKrM55z27h9iao4T8jgUe74e11HT9cdIzlPHFni2S/NdIYmNhXSaWt26XI5mwY318190=
X-Received: by 2002:ad4:4689:0:b0:6a0:585c:66c6 with SMTP id
 pl9-20020ad44689000000b006a0585c66c6mr8083229qvb.25.1713835726515; Mon, 22
 Apr 2024 18:28:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240422060811.670693-1-xuxinxiong@huaqin.corp-partner.google.com>
 <CAD=FV=WRLLuOkCJeM6RdAb6xLN-cPH+hfWbOv9-LujB-WMGEFw@mail.gmail.com>
In-Reply-To: <CAD=FV=WRLLuOkCJeM6RdAb6xLN-cPH+hfWbOv9-LujB-WMGEFw@mail.gmail.com>
From: Xuxin Xiong <xuxinxiong@huaqin.corp-partner.google.com>
Date: Tue, 23 Apr 2024 09:28:35 +0800
Message-ID: <CAGoogDB-mj8_xu04w3V2ZxOBTWoXcPKrVR1NRt6BFcpjHX3-7Q@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add panel CSOT MNB601LS1-1
To: Doug Anderson <dianders@chromium.org>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch, 
 hsinyi@google.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: multipart/alternative; boundary="000000000000aece6b0616b9797c"
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

--000000000000aece6b0616b9797c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, I read the edid from the panels, one is CSO and the other is CSW.
The details are as follows, please help check. Thank you!


1. MNC207QS1-1
edid-decode (hex):
00 ff ff ff ff ff ff 00 0e 6f 00 12 e7 00 00 00
1e 21 01 04 a5 1b 12 78 03 8a d5 9c 5e 59 90 25
1b 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 ae 3f 80 18 71 b0 23 40 30 20
36 00 07 a4 10 00 00 1a 00 00 00 fd 00 28 3c 4b
4b 11 01 0a 20 20 20 20 20 20 00 00 00 fe 00 43
53 4f 54 20 54 39 0a 20 20 20 20 20 00 00 00 fe
00 4d 4e 43 32 30 37 51 53 31 2d 31 0a 20 00 32
----------------
Block 0, Base EDID:
EDID Structure Version & Revision: 1.4
Vendor & Product Identification:
Manufacturer: CSO
Model: 4608
Serial Number: 231
Made in: week 30 of 2023
Basic Display Parameters & Features:
Digital display
Bits per primary color channel: 8
DisplayPort interface
Maximum image size: 27 cm x 18 cm
Gamma: 2.20
Supported color formats: RGB 4:4:4
First detailed timing includes the native pixel format and preferred
refresh rate
Display is continuous frequency
Color Characteristics:
Red : 0.6113, 0.3671
Green: 0.3496, 0.5644
Blue : 0.1474, 0.1064
White: 0.3134, 0.3291
Established Timings I & II: none
Standard Timings: none
Detailed Timing Descriptors:
DTD 1: 1920x1200 60.000 Hz 8:5 74.100 kHz 163.020 MHz (263 mm x 164 mm)
Hfront 48 Hsync 32 Hback 200 Hpol P
Vfront 3 Vsync 6 Vback 26 Vpol N
Display Range Limits:
Monitor ranges (Bare Limits): 40-60 Hz V, 75-75 kHz H, max dotclock 170 MHz
Alphanumeric Data String: 'CSOT T9'
Alphanumeric Data String: 'MNC207QS1-1'
Checksum: 0x32

2. MNB601LS1-1
edid-decode (hex):

00 ff ff ff ff ff ff 00 0e 77 00 11 00 00 00 00
00 22 01 04 95 1a 0e 78 03 a1 35 9b 5e 58 91 25
1c 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 09 1e 56 dc 50 00 28 30 30 20
36 00 00 90 10 00 00 1a 00 00 00 fd 00 28 3c 30
30 08 01 0a 20 20 20 20 20 20 00 00 00 fe 00 43
53 4f 54 20 54 39 0a 20 20 20 20 20 00 00 00 fe
00 4d 4e 42 36 30 31 4c 53 31 2d 31 0a 20 00 37
----------------
Block 0, Base EDID:
EDID Structure Version & Revision: 1.4
Vendor & Product Identification:
Manufacturer: CSW
Model: 4352
Made in: 2024
Basic Display Parameters & Features:
Digital display
Bits per primary color channel: 6
DisplayPort interface
Maximum image size: 26 cm x 14 cm
Gamma: 2.20
Supported color formats: RGB 4:4:4
First detailed timing includes the native pixel format and preferred
refresh rate
Display is continuous frequency
Color Characteristics:
Red : 0.6074, 0.3691
Green: 0.3437, 0.5673
Blue : 0.1445, 0.1123
White: 0.3134, 0.3291
Established Timings I & II: none
Standard Timings: none
Detailed Timing Descriptors:
DTD 1: 1366x768 60.001 Hz 683:384 48.480 kHz 76.890 MHz (256 mm x 144 mm)
Hfront 48 Hsync 32 Hback 140 Hpol P
Vfront 3 Vsync 6 Vback 31 Vpol N
Display Range Limits:
Monitor ranges (Bare Limits): 40-60 Hz V, 48-48 kHz H, max dotclock 80 MHz
Alphanumeric Data String: 'CSOT T9'
Alphanumeric Data String: 'MNB601LS1-1'
Checksum: 0x37

Doug Anderson <dianders@chromium.org> =E4=BA=8E2024=E5=B9=B44=E6=9C=8822=E6=
=97=A5=E5=91=A8=E4=B8=80 22:10=E5=86=99=E9=81=93=EF=BC=9A

> Hi,
>
> On Sun, Apr 21, 2024 at 11:09=E2=80=AFPM Xuxin Xiong
> <xuxinxiong@huaqin.corp-partner.google.com> wrote:
> >
> > Add support for the following panel:
> > CSOT MNB601LS1-1
> >
> > Signed-off-by: Xuxin Xiong <xuxinxiong@huaqin.corp-partner.google.com>
> > ---
> >  drivers/gpu/drm/panel/panel-edp.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-edp.c
> b/drivers/gpu/drm/panel/panel-edp.c
> > index d58f90bc48fb..5e0b1c94bc62 100644
> > --- a/drivers/gpu/drm/panel/panel-edp.c
> > +++ b/drivers/gpu/drm/panel/panel-edp.c
> > @@ -2036,6 +2036,8 @@ static const struct edp_panel_entry edp_panels[] =
=3D
> {
> >
> >         EDP_PANEL_ENTRY('C', 'S', 'O', 0x1200, &delay_200_500_e50,
> "MNC207QS1-1"),
> >
> > +       EDP_PANEL_ENTRY('C', 'S', 'W', 0x1100, &delay_200_500_e80_d50,
> "MNB601LS1-1"),
>
> Are you positive that both this panel and the one above it (which you
> also added) are correct? You identified both of them as CSO panels but
> one has "CSO" and one has "CSW". Please double-check and let me know.
>
> -Doug
>

--000000000000aece6b0616b9797c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes, I read the edid from the panels, one is CSO and the o=
ther is CSW.=C2=A0<div>The details are as follows, please help check. Thank=
 you!<div><br></div><div><br>1.=C2=A0<span style=3D"color:rgb(80,0,80)">MNC=
207QS1-1<br></span><div class=3D"gmail-lark-doc" style=3D"white-space:pre">=
edid-decode (hex):
</div><div style=3D"white-space:pre">
</div><div style=3D"white-space:pre">00 ff ff ff ff ff ff 00 0e 6f 00 12 e7=
 00 00 00
</div><div style=3D"white-space:pre">1e 21 01 04 a5 1b 12 78 03 8a d5 9c 5e=
 59 90 25
</div><div style=3D"white-space:pre">1b 50 54 00 00 00 01 01 01 01 01 01 01=
 01 01 01
</div><div style=3D"white-space:pre">01 01 01 01 01 01 ae 3f 80 18 71 b0 23=
 40 30 20
</div><div style=3D"white-space:pre">36 00 07 a4 10 00 00 1a 00 00 00 fd 00=
 28 3c 4b
</div><div style=3D"white-space:pre">4b 11 01 0a 20 20 20 20 20 20 00 00 00=
 fe 00 43
</div><div style=3D"white-space:pre">53 4f 54 20 54 39 0a 20 20 20 20 20 00=
 00 00 fe
</div><div style=3D"white-space:pre">00 4d 4e 43 32 30 37 51 53 31 2d 31 0a=
 20 00 32
</div><div style=3D"white-space:pre">
</div><div style=3D"white-space:pre">----------------
</div><div style=3D"white-space:pre">
</div><div style=3D"white-space:pre">Block 0, Base EDID:
</div><div style=3D"white-space:pre">  EDID Structure Version &amp; Revisio=
n: 1.4
</div><div style=3D"white-space:pre">  Vendor &amp; Product Identification:
</div><div style=3D"white-space:pre">    Manufacturer: CSO
</div><div style=3D"white-space:pre">    Model: 4608
</div><div style=3D"white-space:pre">    Serial Number: 231
</div><div style=3D"white-space:pre">    Made in: week 30 of 2023
</div><div style=3D"white-space:pre">  Basic Display Parameters &amp; Featu=
res:
</div><div style=3D"white-space:pre">    Digital display
</div><div style=3D"white-space:pre">    Bits per primary color channel: 8
</div><div style=3D"white-space:pre">    DisplayPort interface
</div><div style=3D"white-space:pre">    Maximum image size: 27 cm x 18 cm
</div><div style=3D"white-space:pre">    Gamma: 2.20
</div><div style=3D"white-space:pre">    Supported color formats: RGB 4:4:4
</div><div style=3D"white-space:pre">    First detailed timing includes the=
 native pixel format and preferred refresh rate
</div><div style=3D"white-space:pre">    Display is continuous frequency
</div><div style=3D"white-space:pre">  Color Characteristics:
</div><div style=3D"white-space:pre">    Red  : 0.6113, 0.3671
</div><div style=3D"white-space:pre">    Green: 0.3496, 0.5644
</div><div style=3D"white-space:pre">    Blue : 0.1474, 0.1064
</div><div style=3D"white-space:pre">    White: 0.3134, 0.3291
</div><div style=3D"white-space:pre">  Established Timings I &amp; II: none
</div><div style=3D"white-space:pre">  Standard Timings: none
</div><div style=3D"white-space:pre">  Detailed Timing Descriptors:
</div><div style=3D"white-space:pre">    DTD 1:  1920x1200   60.000 Hz   8:=
5    74.100 kHz  163.020 MHz (263 mm x 164 mm)
</div><div style=3D"white-space:pre">                 Hfront   48 Hsync  32=
 Hback 200 Hpol P
</div><div style=3D"white-space:pre">                 Vfront    3 Vsync   6=
 Vback  26 Vpol N
</div><div style=3D"white-space:pre">  Display Range Limits:
</div><div style=3D"white-space:pre">    Monitor ranges (Bare Limits): 40-6=
0 Hz V, 75-75 kHz H, max dotclock 170 MHz
</div><div style=3D"white-space:pre">    Alphanumeric Data String: &#39;CSO=
T T9&#39;
</div><div style=3D"white-space:pre">    Alphanumeric Data String: &#39;MNC=
207QS1-1&#39;
</div><div style=3D"white-space:pre">Checksum: 0x32</div><br>2.=C2=A0<span =
style=3D"color:rgb(80,0,80)">MNB601LS1-1</span></div><div><span style=3D"wh=
ite-space:pre">edid-decode (hex):</span></div><div><span style=3D"white-spa=
ce:pre"><br></span><div class=3D"gmail-lark-doc" style=3D"white-space:pre">=
00 ff ff ff ff ff ff 00 0e 77 00 11 00 00 00 00
</div><div style=3D"white-space:pre">00 22 01 04 95 1a 0e 78 03 a1 35 9b 5e=
 58 91 25
</div><div style=3D"white-space:pre">1c 50 54 00 00 00 01 01 01 01 01 01 01=
 01 01 01
</div><div style=3D"white-space:pre">01 01 01 01 01 01 09 1e 56 dc 50 00 28=
 30 30 20
</div><div style=3D"white-space:pre">36 00 00 90 10 00 00 1a 00 00 00 fd 00=
 28 3c 30
</div><div style=3D"white-space:pre">30 08 01 0a 20 20 20 20 20 20 00 00 00=
 fe 00 43
</div><div style=3D"white-space:pre">53 4f 54 20 54 39 0a 20 20 20 20 20 00=
 00 00 fe
</div><div style=3D"white-space:pre">00 4d 4e 42 36 30 31 4c 53 31 2d 31 0a=
 20 00 37
</div><div style=3D"white-space:pre">
</div><div style=3D"white-space:pre">----------------
</div><div style=3D"white-space:pre">
</div><div style=3D"white-space:pre">Block 0, Base EDID:
</div><div style=3D"white-space:pre">  EDID Structure Version &amp; Revisio=
n: 1.4
</div><div style=3D"white-space:pre">  Vendor &amp; Product Identification:
</div><div style=3D"white-space:pre">    Manufacturer: CSW
</div><div style=3D"white-space:pre">    Model: 4352
</div><div style=3D"white-space:pre">    Made in: 2024
</div><div style=3D"white-space:pre">  Basic Display Parameters &amp; Featu=
res:
</div><div style=3D"white-space:pre">    Digital display
</div><div style=3D"white-space:pre">    Bits per primary color channel: 6
</div><div style=3D"white-space:pre">    DisplayPort interface
</div><div style=3D"white-space:pre">    Maximum image size: 26 cm x 14 cm
</div><div style=3D"white-space:pre">    Gamma: 2.20
</div><div style=3D"white-space:pre">    Supported color formats: RGB 4:4:4
</div><div style=3D"white-space:pre">    First detailed timing includes the=
 native pixel format and preferred refresh rate
</div><div style=3D"white-space:pre">    Display is continuous frequency
</div><div style=3D"white-space:pre">  Color Characteristics:
</div><div style=3D"white-space:pre">    Red  : 0.6074, 0.3691
</div><div style=3D"white-space:pre">    Green: 0.3437, 0.5673
</div><div style=3D"white-space:pre">    Blue : 0.1445, 0.1123
</div><div style=3D"white-space:pre">    White: 0.3134, 0.3291
</div><div style=3D"white-space:pre">  Established Timings I &amp; II: none
</div><div style=3D"white-space:pre">  Standard Timings: none
</div><div style=3D"white-space:pre">  Detailed Timing Descriptors:
</div><div style=3D"white-space:pre">    DTD 1:  1366x768    60.001 Hz 683:=
384  48.480 kHz   76.890 MHz (256 mm x 144 mm)
</div><div style=3D"white-space:pre">                 Hfront   48 Hsync  32=
 Hback 140 Hpol P
</div><div style=3D"white-space:pre">                 Vfront    3 Vsync   6=
 Vback  31 Vpol N
</div><div style=3D"white-space:pre">  Display Range Limits:
</div><div style=3D"white-space:pre">    Monitor ranges (Bare Limits): 40-6=
0 Hz V, 48-48 kHz H, max dotclock 80 MHz
</div><div style=3D"white-space:pre">    Alphanumeric Data String: &#39;CSO=
T T9&#39;
</div><div style=3D"white-space:pre">    Alphanumeric Data String: &#39;MNB=
601LS1-1&#39;
</div><div style=3D"white-space:pre">Checksum: 0x37</div></div></div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Doug A=
nderson &lt;<a href=3D"mailto:dianders@chromium.org">dianders@chromium.org<=
/a>&gt; =E4=BA=8E2024=E5=B9=B44=E6=9C=8822=E6=97=A5=E5=91=A8=E4=B8=80 22:10=
=E5=86=99=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Hi,<br>
<br>
On Sun, Apr 21, 2024 at 11:09=E2=80=AFPM Xuxin Xiong<br>
&lt;<a href=3D"mailto:xuxinxiong@huaqin.corp-partner.google.com" target=3D"=
_blank">xuxinxiong@huaqin.corp-partner.google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Add support for the following panel:<br>
&gt; CSOT MNB601LS1-1<br>
&gt;<br>
&gt; Signed-off-by: Xuxin Xiong &lt;<a href=3D"mailto:xuxinxiong@huaqin.cor=
p-partner.google.com" target=3D"_blank">xuxinxiong@huaqin.corp-partner.goog=
le.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/panel/panel-edp.c | 2 ++<br>
&gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel=
/panel-edp.c<br>
&gt; index d58f90bc48fb..5e0b1c94bc62 100644<br>
&gt; --- a/drivers/gpu/drm/panel/panel-edp.c<br>
&gt; +++ b/drivers/gpu/drm/panel/panel-edp.c<br>
&gt; @@ -2036,6 +2036,8 @@ static const struct edp_panel_entry edp_panels[]=
 =3D {<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0EDP_PANEL_ENTRY(&#39;C&#39;, &#39;S&#=
39;, &#39;O&#39;, 0x1200, &amp;delay_200_500_e50, &quot;MNC207QS1-1&quot;),=
<br>
&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0EDP_PANEL_ENTRY(&#39;C&#39;, &#39;S&#39;, =
&#39;W&#39;, 0x1100, &amp;delay_200_500_e80_d50, &quot;MNB601LS1-1&quot;),<=
br>
<br>
Are you positive that both this panel and the one above it (which you<br>
also added) are correct? You identified both of them as CSO panels but<br>
one has &quot;CSO&quot; and one has &quot;CSW&quot;. Please double-check an=
d let me know.<br>
<br>
-Doug<br>
</blockquote></div>

--000000000000aece6b0616b9797c--
