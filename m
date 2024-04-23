Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C8E8AF4CA
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 19:01:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58A191134E2;
	Tue, 23 Apr 2024 17:01:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="HCOYC4Wj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 780EC1134E2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 17:01:54 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-78d62c1e82bso430174585a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 10:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1713891712; x=1714496512;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/npKp6pnglhDyMQdA7wmpVX4vpQn8igvdQOoUdHXuFA=;
 b=HCOYC4Wjzykd3TZ9y9e2Mh+oL4ijliMwGGaS1Sh0zCMBT8WRoLLg4D4dqZjQYN5TAz
 XLDoMM/dCjpxr1yLglmx5pBU4f12WTDm6xqcB+MPBR0qHi+1cTglRwr94JOLvrZw7joQ
 yEiyAQNSUW4sBVEmggNSlmMsw7ILd404GrWgs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713891712; x=1714496512;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/npKp6pnglhDyMQdA7wmpVX4vpQn8igvdQOoUdHXuFA=;
 b=RSujxCzErnefSqMN9fguB2AVdEH/bTgBBNBKqHA8lcHIFV1QOqh/20KeZz6DCQ+9vW
 bahJTN6TWXfz1o/N0i3FVt8jsdtW7MFn1G+x4WWy3z6jmvWjpaw1fe1ffUuRsU9UMl4U
 ToMUJQCaibVbdUL7zv2Uz/eVLJ6Z8750O9A4cUzdDZOp14ld7/ARhCJ8UO4QMrcDyTWI
 Si39a1usPmQ/RJyfQHamtIil1g9Exkcx/PL8UhjYJSsPSmf9iLdI1RzvPWZCdXGUQ/Iy
 Fxlh7OOFbkc0SflyVyBHtpn44wihaiDlq6CdOx/A8Xi73cWF4mWtr8hHD0kndqYnv380
 7UAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeb43w7UElycBWB92FQs+cfdQ3gobtYfeIQk49KoBmKIMSG+lQwI82pf5dd3ksHYLPBQo0ARr04vY5YINGbElGa+lbi1UQMb1k20upmwmK
X-Gm-Message-State: AOJu0YxOi5g9ts2W7K6phNgpB57c++huj0NQ3wjgzwFLJQvx4ZRjHI/P
 LcRofm+ilo01744+ZZlRsCwN12zxMdcMsvWL7KmmJMIAkNyXXt9n6qy+DCa+lsXvg/0RnMGPqWf
 7sDY7
X-Google-Smtp-Source: AGHT+IGgwi/ykBcN2zMLGBnNrI+kMJpiJwx6iwL7La2pjh4l2YlGgH+YCekcJKUHubRjDbL7V2QEPA==
X-Received: by 2002:a05:620a:bc9:b0:78e:5148:b04f with SMTP id
 s9-20020a05620a0bc900b0078e5148b04fmr44980qki.61.1713891712235; 
 Tue, 23 Apr 2024 10:01:52 -0700 (PDT)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com.
 [209.85.160.169]) by smtp.gmail.com with ESMTPSA id
 8-20020a05620a04c800b0079064d06b7esm3302888qks.22.2024.04.23.10.01.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 10:01:51 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-43989e6ca42so14391cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 10:01:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXwJzKOHI9rPlJRyh9nLEEk4g0/dx29PgvEHQGS0nGVgTx6HTSmRMLkzyXYdvRZ9mPEYZFSNlgcu3F6tNPeDNw3eAmTVy9uvugKIBwqKWOf
X-Received: by 2002:ac8:646:0:b0:437:b429:cb0d with SMTP id
 e6-20020ac80646000000b00437b429cb0dmr287375qth.29.1713891710780; Tue, 23 Apr
 2024 10:01:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240422060811.670693-1-xuxinxiong@huaqin.corp-partner.google.com>
 <CAD=FV=WRLLuOkCJeM6RdAb6xLN-cPH+hfWbOv9-LujB-WMGEFw@mail.gmail.com>
 <CAGoogDB-mj8_xu04w3V2ZxOBTWoXcPKrVR1NRt6BFcpjHX3-7Q@mail.gmail.com>
In-Reply-To: <CAGoogDB-mj8_xu04w3V2ZxOBTWoXcPKrVR1NRt6BFcpjHX3-7Q@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 23 Apr 2024 10:01:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WwsR9e-ZXJRY11FvdUZ66YPy9vqmY_=sGDw5Wqk1eV3w@mail.gmail.com>
Message-ID: <CAD=FV=WwsR9e-ZXJRY11FvdUZ66YPy9vqmY_=sGDw5Wqk1eV3w@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add panel CSOT MNB601LS1-1
To: Xuxin Xiong <xuxinxiong@huaqin.corp-partner.google.com>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch, 
 hsinyi@google.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi,

On Mon, Apr 22, 2024 at 6:28=E2=80=AFPM Xuxin Xiong
<xuxinxiong@huaqin.corp-partner.google.com> wrote:
>
> Yes, I read the edid from the panels, one is CSO and the other is CSW.
> The details are as follows, please help check. Thank you!
>
>
> 1. MNC207QS1-1
> edid-decode (hex):
> 00 ff ff ff ff ff ff 00 0e 6f 00 12 e7 00 00 00
> 1e 21 01 04 a5 1b 12 78 03 8a d5 9c 5e 59 90 25
> 1b 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 ae 3f 80 18 71 b0 23 40 30 20
> 36 00 07 a4 10 00 00 1a 00 00 00 fd 00 28 3c 4b
> 4b 11 01 0a 20 20 20 20 20 20 00 00 00 fe 00 43
> 53 4f 54 20 54 39 0a 20 20 20 20 20 00 00 00 fe
> 00 4d 4e 43 32 30 37 51 53 31 2d 31 0a 20 00 32
> ----------------
> Block 0, Base EDID:
> EDID Structure Version & Revision: 1.4
> Vendor & Product Identification:
> Manufacturer: CSO
> Model: 4608
> Serial Number: 231
> Made in: week 30 of 2023
> Basic Display Parameters & Features:
> Digital display
> Bits per primary color channel: 8
> DisplayPort interface
> Maximum image size: 27 cm x 18 cm
> Gamma: 2.20
> Supported color formats: RGB 4:4:4
> First detailed timing includes the native pixel format and preferred refr=
esh rate
> Display is continuous frequency
> Color Characteristics:
> Red : 0.6113, 0.3671
> Green: 0.3496, 0.5644
> Blue : 0.1474, 0.1064
> White: 0.3134, 0.3291
> Established Timings I & II: none
> Standard Timings: none
> Detailed Timing Descriptors:
> DTD 1: 1920x1200 60.000 Hz 8:5 74.100 kHz 163.020 MHz (263 mm x 164 mm)
> Hfront 48 Hsync 32 Hback 200 Hpol P
> Vfront 3 Vsync 6 Vback 26 Vpol N
> Display Range Limits:
> Monitor ranges (Bare Limits): 40-60 Hz V, 75-75 kHz H, max dotclock 170 M=
Hz
> Alphanumeric Data String: 'CSOT T9'
> Alphanumeric Data String: 'MNC207QS1-1'
> Checksum: 0x32
>
> 2. MNB601LS1-1
> edid-decode (hex):
>
> 00 ff ff ff ff ff ff 00 0e 77 00 11 00 00 00 00
> 00 22 01 04 95 1a 0e 78 03 a1 35 9b 5e 58 91 25
> 1c 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 09 1e 56 dc 50 00 28 30 30 20
> 36 00 00 90 10 00 00 1a 00 00 00 fd 00 28 3c 30
> 30 08 01 0a 20 20 20 20 20 20 00 00 00 fe 00 43
> 53 4f 54 20 54 39 0a 20 20 20 20 20 00 00 00 fe
> 00 4d 4e 42 36 30 31 4c 53 31 2d 31 0a 20 00 37
> ----------------
> Block 0, Base EDID:
> EDID Structure Version & Revision: 1.4
> Vendor & Product Identification:
> Manufacturer: CSW
> Model: 4352
> Made in: 2024
> Basic Display Parameters & Features:
> Digital display
> Bits per primary color channel: 6
> DisplayPort interface
> Maximum image size: 26 cm x 14 cm
> Gamma: 2.20
> Supported color formats: RGB 4:4:4
> First detailed timing includes the native pixel format and preferred refr=
esh rate
> Display is continuous frequency
> Color Characteristics:
> Red : 0.6074, 0.3691
> Green: 0.3437, 0.5673
> Blue : 0.1445, 0.1123
> White: 0.3134, 0.3291
> Established Timings I & II: none
> Standard Timings: none
> Detailed Timing Descriptors:
> DTD 1: 1366x768 60.001 Hz 683:384 48.480 kHz 76.890 MHz (256 mm x 144 mm)
> Hfront 48 Hsync 32 Hback 140 Hpol P
> Vfront 3 Vsync 6 Vback 31 Vpol N
> Display Range Limits:
> Monitor ranges (Bare Limits): 40-60 Hz V, 48-48 kHz H, max dotclock 80 MH=
z
> Alphanumeric Data String: 'CSOT T9'
> Alphanumeric Data String: 'MNB601LS1-1'
> Checksum: 0x37

OK. This made me look a little deeper. I believe that the three-letter
code is managed by UEFI and I found:

https://uefi.org/PNP_ID_List

...as far as I can tell "CSW" is actually correct for CSOT but "CSO"
was _not_. Looks as if CSO was supposed to be for "California
Institute of Technology" (Caltech). :(

We're probably OK with the recent work that Hsin-Yi did in commit
bf201127c1b8 ("drm/panel-edp: Match edp_panels with panel identity")
to match against the panel name even if Caltech does ship a "CSO"
0x1200 in the future since it looks like the string you added matches
the panel.

That being said, is there any chance that it's not too late and you
can get CSOT to fix the EDID on "MNC207QS1-1"? Can you also make sure
that they're aware of this and don't make the same mistake in the
future?


In any case, given this investigation and the EDID I'm going to say
that the panel you've added here is fine.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I've pushed your change to drm-misc-next:

a6325ad47bc8 drm/panel-edp: Add panel CSOT MNB601LS1-1

-Doug
