Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F07D93920B
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 17:49:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 472B110E15E;
	Mon, 22 Jul 2024 15:49:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="E7fcZuwK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF05E10E15E
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 15:49:37 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-79f178e6225so283789185a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 08:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1721663375; x=1722268175;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4M370blDs66N01Bpr2CSSKX57GkmsVaqanqtms3bvVw=;
 b=E7fcZuwKTR9oNvIZtIyEMtcErdAOBRvi2nXZmGapzlZL7xEDDGAzEeFQS8azPivvVE
 hFqKdPZNu4dEqT/dlP0ugoCVCggyIbvWJCl+P/78I/oqc/+YnXYAPgtLHycRnT9oFEfz
 LxFBC2Ms9DsVWRnyVxTwjA3IhJ7NZEdd0WWYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721663375; x=1722268175;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4M370blDs66N01Bpr2CSSKX57GkmsVaqanqtms3bvVw=;
 b=MLZSIOU5f7JgoXydrWnwGn0UeHuzfwowbJ6veb9s/EV6rox2UFgaiT3mx15eZ5us3F
 rWrWLkCbIiPuq4cy91Qps9RC8esZa0usd6l+xg6vuk0FjlG7AKQPIwIyJcR8a3T8dQov
 waLEGbo+54uJv6g55umI3FGWElAkYFLYKFF4H5LHQFS6TOpSESurw7Z2ZqYsAzZQMAG9
 R0gLp9C1qnaFt5vvsKx4Z/pFiuI1T98ijg+EI25sABWQ5veGlDn1ZiJPv4vTSfd0h2Tn
 NQqdO2q5aBWrKllawL99vypqlQNC/3xy9teIiGTfjqX1Q3RipgRzcw39xdYC33gOKA9m
 d1pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkJaVoPgKaibRbXeVlonHW1u4Mc+fPMUk3sU0E1FdZLJXysNgD9urQpGIbdQ2WwNEun+ujJ2b8AuZo4O8AzH9nCBaUMUVmsPh765Ha+7F/
X-Gm-Message-State: AOJu0YzvfJ98f6ZSnq5WqAnEfOcvysEV5CV4ZYhU+cZh/pnHcyv/Qv1Q
 jLCE93N3peR8MCXkFu0gsch/EsE9BsKpNidckUOOd/YckDNrBGUcrAw7a+3gFjqyL929rcsoeW8
 =
X-Google-Smtp-Source: AGHT+IGK8IyBD+SZIp56Ch7civ2VBixDZeqW+swdSsCTDVKFenNXGW8fZheBr67hxDQSFEyR2prgRg==
X-Received: by 2002:a05:620a:178c:b0:79d:59bb:639f with SMTP id
 af79cd13be357-7a1a6680368mr765706985a.65.1721663375162; 
 Mon, 22 Jul 2024 08:49:35 -0700 (PDT)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com.
 [209.85.160.171]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a19905aad0sm370061085a.74.2024.07.22.08.49.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 08:49:34 -0700 (PDT)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-447df43324fso893221cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 08:49:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWI8sv5GOtVIV/R3Ssi79j+SdjLgnOPLi4rVrjH8ph02uJtRtP/zZ9xUAn9Jx5wqZoJkHxf04SwW/sv31X6OEtbZ9Up3prsyB9ieOe7J6Qr
X-Received: by 2002:a05:622a:5b8e:b0:447:e3e3:77c1 with SMTP id
 d75a77b69052e-44faaa81ca5mr4992061cf.29.1721663373472; Mon, 22 Jul 2024
 08:49:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240715-x1e80100-crd-backlight-v2-0-31b7f2f658a3@linaro.org>
 <20240715-x1e80100-crd-backlight-v2-2-31b7f2f658a3@linaro.org>
 <7daa3c0d-cecf-4f50-be32-ae116b920db0@linaro.org>
 <ZpUcI3KkIa58zC55@linaro.org>
 <d1603248-afe8-4594-9e2e-81ba208dff00@linaro.org>
 <CAD=FV=WimxYmDrkfn0+E3MbXp8kS9TicN2kT3AM4eM+SAwYsOg@mail.gmail.com>
In-Reply-To: <CAD=FV=WimxYmDrkfn0+E3MbXp8kS9TicN2kT3AM4eM+SAwYsOg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 22 Jul 2024 08:49:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XfvD1OniNBrCrA8C6XjOB15fye8EdnniNmgpu4DnpH6w@mail.gmail.com>
Message-ID: <CAD=FV=XfvD1OniNBrCrA8C6XjOB15fye8EdnniNmgpu4DnpH6w@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] Revert "drm/panel-edp: Add SDC ATNA45AF01"
To: neil.armstrong@linaro.org
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>
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

On Mon, Jul 15, 2024 at 6:51=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Mon, Jul 15, 2024 at 6:02=E2=80=AFAM Neil Armstrong
> <neil.armstrong@linaro.org> wrote:
> >
> > On 15/07/2024 14:54, Stephan Gerhold wrote:
> > > On Mon, Jul 15, 2024 at 02:42:12PM +0200, Neil Armstrong wrote:
> > >> On 15/07/2024 14:15, Stephan Gerhold wrote:
> > >>> This reverts commit 8ebb1fc2e69ab8b89a425e402c7bd85e053b7b01.
> > >>>
> > >>> The panel should be handled through the samsung-atna33xc20 driver f=
or
> > >>> correct power up timings. Otherwise the backlight does not work cor=
rectly.
> > >>>
> > >>> We have existing users of this panel through the generic "edp-panel=
"
> > >>> compatible (e.g. the Qualcomm X1E80100 CRD), but the screen works o=
nly
> > >>> partially in that configuration: It works after boot but once the s=
creen
> > >>> gets disabled it does not turn on again until after reboot. It beha=
ves the
> > >>> same way with the default "conservative" timings, so we might as we=
ll drop
> > >>> the configuration from the panel-edp driver. That way, users with o=
ld DTBs
> > >>> will get a warning and can move to the new driver.
> > >>>
> > >>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > >>> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> > >>> ---
> > >>>    drivers/gpu/drm/panel/panel-edp.c | 2 --
> > >>>    1 file changed, 2 deletions(-)
> > >>>
> > >>> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/pa=
nel/panel-edp.c
> > >>> index 3a574a9b46e7..d2d682385e89 100644
> > >>> --- a/drivers/gpu/drm/panel/panel-edp.c
> > >>> +++ b/drivers/gpu/drm/panel/panel-edp.c
> > >>> @@ -1960,8 +1960,6 @@ static const struct edp_panel_entry edp_panel=
s[] =3D {
> > >>>     EDP_PANEL_ENTRY('L', 'G', 'D', 0x05af, &delay_200_500_e200_d200=
, "Unknown"),
> > >>>     EDP_PANEL_ENTRY('L', 'G', 'D', 0x05f1, &delay_200_500_e200_d200=
, "Unknown"),
> > >>> -   EDP_PANEL_ENTRY('S', 'D', 'C', 0x416d, &delay_100_500_e200, "AT=
NA45AF01"),
> > >>> -
> > >>>     EDP_PANEL_ENTRY('S', 'H', 'P', 0x1511, &delay_200_500_e50, "LQ1=
40M1JW48"),
> > >>>     EDP_PANEL_ENTRY('S', 'H', 'P', 0x1523, &delay_80_500_e50, "LQ14=
0M1JW46"),
> > >>>     EDP_PANEL_ENTRY('S', 'H', 'P', 0x153a, &delay_200_500_e50, "LQ1=
40T1JH01"),
> > >>>
> > >>
> > >> How will we handle current/old crd DT with new kernels ?
> > >>
> > >
> > > I think this is answered in the commit message:
> > >
> > >>> We have existing users of this panel through the generic "edp-panel=
"
> > >>> compatible (e.g. the Qualcomm X1E80100 CRD), but the screen works o=
nly
> > >>> partially in that configuration: It works after boot but once the s=
creen
> > >>> gets disabled it does not turn on again until after reboot. It beha=
ves the
> > >>> same way with the default "conservative" timings, so we might as we=
ll drop
> > >>> the configuration from the panel-edp driver. That way, users with o=
ld DTBs
> > >>> will get a warning and can move to the new driver.
> > >
> > > Basically with the entry removed, the panel-edp driver will fallback =
to
> > > default "conservative" timings when using old DTBs. There will be a
> > > warning in dmesg, but otherwise the panel will somewhat work just as
> > > before. I think this is a good way to remind users to upgrade.
> >
> > I consider this as a regression
> >
> > >
> > >> Same question for patch 3, thie serie introduces a bindings that won=
't be valid
> > >> if we backport patch 3. I don't think patch should be backported, an=
d this patch
> > >> should be dropped.
> > >
> > > There would be a dtbs_check warning, yeah. Functionally, it would wor=
k
> > > just fine. Is that reason enough to keep display partially broken for
> > > 6.11? We could also apply the minor binding change for 6.11 if needed=
.
> >
> > I don't know how to answer this, I'll let the DT maintainer comment thi=
s.
> >
> > The problem is I do not think we can pass the whole patchset as fixes
> > for v6.11, patches 2 & 3 could, patches 1 & 4 definitely can't.
> >
> > Neil
>
> IMO: patch #3 (dts) and #4 (CONFIG) go through the Qualcomm tree
> whenever those folks agree to it. If we're worried about the
> dtbs_check breakage I personally wouldn't mind "Ack"ing patch #1 to go
> through the Qualcomm tree as long as it made it into 6.11-rc1. I have
> a hunch that there are going to be more Samsung OLED panels in the
> future that will need to touch the same file, but if the change is in
> -rc1 it should make it back into drm-misc quickly, right?
>
> Personally I think patch #2 could go in anytime since, as people have
> said, things are pretty broken today and the worst that happens is
> that someone gets an extra warning. That would be my preference. That
> being said, we could also snooze that patch for a month or two and
> land it later. There's no real hurry.

For now I'm going to snooze this patch for a month just to avoid any
controversy. I'll plan to apply it (to drm-misc-next) when I see the
device tree patch land. Since the device tree patch should land as a
fix that should keep things landing in the correct order. ...and, as
per above, the worst case is that if someone has an old DTS and a new
kernel then a panel that was already not working well will print a fat
warning and startup a bit slower.

If somehow I mess up and forget about this patch, feel free to send me
a poke when the device tree patch is landed.

-Doug
