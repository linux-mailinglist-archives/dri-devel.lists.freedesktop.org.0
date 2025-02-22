Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9C9A406E0
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2025 10:28:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CC4810E256;
	Sat, 22 Feb 2025 09:28:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PmvlA7Hp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7734310E256
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2025 09:28:55 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-38f325dd9e6so1471496f8f.1
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2025 01:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740216534; x=1740821334; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=St1JTstNvtpDJwVJQG8kMHDEmxsx7ifcGkS2W32UHvQ=;
 b=PmvlA7HpYCfBRPUDU8D6tHQp6A4KlRnoxlmULDdLUhTEB5BntyFt6x+ihdVf1VGKYi
 OciR4G70hiIgc26aUt6v1v5LXl8BEkurqqDIbQP+kx1jXvHFItfp01TcBMnNCalniAAT
 FyIaDzDWTw/TvxWP2XQptAoYQQ5Zu653mjnM49VwQ+jaUG2A0Nb4ZIyl5m9rOksDuu4V
 oqMLP7LgqwJvkDBNuSi3jOmajWAFELTyzcvLpFDqb6qTvLCwn55USznnYlwsEFl4Q6Dx
 zmssNg8NXAxJHu/c8eKkQRfsZsx6G7+6MiePzGVz3BEqQgDVxloo9DS2KN8ma3yxoJk5
 ylfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740216534; x=1740821334;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=St1JTstNvtpDJwVJQG8kMHDEmxsx7ifcGkS2W32UHvQ=;
 b=uHpGajYwmrCQ8i9Y2lB7Jt9EoTW6jHoeKzObq5qUzQ4IGnML5bwZNsT2nCEIJeQuKO
 P9jB4mtKidh+VEpyjymzjTAA80QNuUzoBJFhssfRg4flYGW4qGnWjmN6jKYw0qS5lgp7
 RdSv5G7VwtxNVHErqQ7YVp4mu1R5PUdNWNr+PEXyC291DUZc+B4XoLdyDuntJSbEu4uZ
 9NGphThPLESgrvGHaK3quI1Ubgr90m/9vspppyQ61MhBxFBIjzKGzrAGY9ZyClXb9SWo
 1p7sAWXgxf8+jVq+B9+tBvvWfLMu7faHyzCDmDJ7/v4SMwP8pGY7CHkhx46MRW4lIuKK
 kGdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXGDLi9SIAbeBtRPgkYeaAsKdpZtpkSsDYwmVadnZDwdIAGOjK3yRNw1foA+e7GlUVb9mGqUn18n8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZhH1bsHsvao48/Qvdjhf8j1SOnmkGfny5TKdtMoQCcgdT9lOd
 QLWX4DBy1wUMijwyXYyHpPVJidrF0qAiDJDauJ+o8WB7wQn3zjue
X-Gm-Gg: ASbGncuOmEP87uytvgneq25y45Uw1gw0NMkD695jv2q5S/cBYfIaVX3SABWr1XeK5bg
 menBD+vAdOpGViPf2sKtyx6bnOsm4U/ZLWoDyTy8n3/dCN4IcY0Jug0htLrRM7MSSBxUqUyOmcc
 nrpf2Exn4irhbK2B+uNDV6r3KtppN1AkklwdW7GtdorusbE6GcxBTGaj3Emks1qUcB89fhtv063
 QZmiE2XOg+Js9vZdcK7i6s3RftqJDAdE5zo3Y8jaGrWooP4COJQYBoe+CUd1p0kdZ90JqxHP9ML
 BoNfgqw6lAoSSNzmUYNFaUyevyLBt4VVgQbhN9SCvD2qN0Ib7yfVDhYxJl2Ys3xhB23IhnmBr+r
 zCA==
X-Google-Smtp-Source: AGHT+IF6pzVIMqT3bI5J8rbMV0F1AIJ9MBRqLOEPinMndAjfKOv9u7BlBPc4YGBvwr2qQglMbEAZjA==
X-Received: by 2002:a5d:6da2:0:b0:38f:443b:48f4 with SMTP id
 ffacd0b85a97d-38f6f0d0ea0mr4633663f8f.49.1740216533405; 
 Sat, 22 Feb 2025 01:28:53 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net.
 [86.58.6.171]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258b439dsm25488772f8f.8.2025.02.22.01.28.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Feb 2025 01:28:52 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Ryan Walklin <ryan@testtoast.com>
Cc: Andre Przywara <andre.przywara@arm.com>,
 Chris Morgan <macroalpha82@gmail.com>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Philippe Simons <simons.philippe@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH v7 00/27] drm: sun4i: add Display Engine 3.3 (DE33) support
Date: Sat, 22 Feb 2025 10:28:51 +0100
Message-ID: <7770397.EvYhyI6sBW@jernej-laptop>
In-Reply-To: <2a864555-d81f-4048-aa0b-c286544faa50@app.fastmail.com>
References: <20250216183524.12095-1-ryan@testtoast.com>
 <2221204.Mh6RI2rZIc@jernej-laptop>
 <2a864555-d81f-4048-aa0b-c286544faa50@app.fastmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

Dne sobota, 22. februar 2025 ob 03:48:01 Srednjeevropski standardni =C4=8Da=
s je Ryan Walklin napisal(a):
> On Sat, 22 Feb 2025, at 7:57 AM, Jernej =C5=A0krabec wrote:
> > Hi Ryan,
> >
> > sorry for very late review, but here we go...
>=20
> No problem, thanks for the review!
>=20
> > This patchset actually introduces 3 disticnt features, which should IMO=
=20
> > be separated
> > and thus making reviewing patches easier.
> >
> > 1. native 10-bit YUV420 output (without YUV->RGB->YUV conversions) -=20
> > this is used on
> >     HDMI for proper 10-bit 4K@60 HDR output
> > 2. Display Engine 3.3 (DE33) support
> > 3. AFBC modifier/format support (used for more efficient GPU or VPU=20
> > output rendering)
> >
> > If I'm not mistaken, your goal is only DE33 support.=20
>=20
> This is my initial goal, but I would still like good HDMI and video suppo=
rt (including HW decode).=20
>=20
> It took some refactoring and resequencing of (your) existing driver work =
to get to this series, and I have left out the HDMI and separated the TCON =
code for the same reason, that initially I am intending to just support RGB=
 operation to an LCD. I do intend however to use the HDMI code either in or=
 out of tree but think that will be a much bigger/more complex change to ma=
inline given the current HDMI code is more invasive to the generic driver.
>=20
> The YUV and AFBC changes seemed more self-contained and seemed reasonable=
 approaches given that they were both features of the DE3 and up. I am happ=
y either to split these into either 4 or 5 separate patches ie:
>=20
> 1a. refactor CSC code to prepare for YUV
> 1b. add YUV for DE3
> 2. refactor mixer enumeration and regmaps to support DE3+
> 3. add DE33
> 4. Add AFBC
>=20
> My only reluctance is that that adds more work to manage multiple patches=
 which are logically grouped and in terms of ease of review, all these 4 st=
eps are in the current set in that order (apart from AFBC which is complete=
ly standalone), and I don't think submitting them separately reduces comple=
xity. It however will reduce reviewer burden as you suggest, but this has b=
een a slow process already.

Sorry, completely forgot. YUV420 HDMI code relies on my previous work, with=
 which
Maxime wasn't happy with:

https://lore.kernel.org/linux-sunxi/20230924192604.3262187-1-jernej.skrabec=
@gmail.com/

So unless switching HDMI to bridge ops is implemented, which also brings fo=
rmat,
YUV formatter and some other patches just add unused code, which isn't idea=
l,
especially if we decide to rework driver before that code can be put in acc=
eptable
state for all involved.

=46rom quick look, patches 5-13, 26 should be dropped for now. Not sure abo=
ut 1-4.

I'm fine with AFBC support going in, it's just one patch.

>=20
> I am happy to accept either process but this has been some time already n=
ow with lots of stylistic feedback but not much on the correctness of the a=
pproach and code, and I am keen to get this landed.
>=20
> There is are two=20
> > reasons why
> > I've never sent these patches myself:
> >
> > 1. scaling YUV images doesn't work
> >
> > Not a problem for any user who doesn't use video player with DRM plane=
=20
> > rendering,
> > which I assume is most of them. We can get around of this issue to deny=
=20
> > scaling
> > YUV buffers until the issue is sorted out.
>=20
> Good to know, I hadn't appreciated that. Mostly relevant for video as you=
 say and it would be good to land YUV support without scaling, then extend =
subsequently, possibly when we get to the video engine?

Correct.

Just be aware of one thing. Even if YUV buffer is rendered in 1:1 scale, vi=
 scaler
still needs to be configured. That's because U and V planes are subsampled =
and
need to be scaled to Y plane size. For unknown reason, that works just fine=
, but
if Y scale is bigger than 1, it all falls apart.

This should be implemented in atomic check.

>=20
> > 2. plane allocations are hackish
> >
> > DE33 for the first time introduced option to move planes between the=20
> > mixers. DRM
> > has also support for this, but for time being static allocation is=20
> > acceptable and tbh,
> > even dynamic support need appropriate initial setting.
> > As you might guessed this is done in DE33 clock driver using magic=20
> > values. Proper
> > way would be to introduce some kind of connection between mixer/plane=20
> > and clock
> > driver, so initial configuration can be moved to appropriate module=20
> > instead of
> > being thrown into clock driver. I need to check where to put it and how=
=20
> > to properly
> > connect DT nodes. Maybe syscon phandle? I'll do some research.
>=20
> Thanks, I was not aware of this either.

Here you have some pointers how this values are actually set:
https://github.com/orangepi-xunlong/linux-orangepi/blob/orange-pi-5.15-sun5=
5iw3/bsp/drivers/video/sunxi/disp2/disp/de/lowlevel_v33x/de330/de_top.c#L23=
2-L260

I think this is the biggest issue of this code. As soon as we solve it prop=
erly, we
have an ability to implement all remaining features at a later date.

>=20
> > There is one glaring issue (when you work on driver and test every=20
> > aspect of it).
> > DE33 introduced RCQ, which is basically DMA, which copies shadowed=20
> > registers
> > from memory buffer directly to hw registers. IIRC it does that at=20
> > vblank time. This
> > tells you that current concept of writing register values at any time=20
> > userspace feels
> > to do commit is wrong and we've been lucky that it works as well as it=
=20
> > does. So,
> > in order to fix this, driver would need quite a big reorganization.=20
> > Introducing
> > shadow buffers would solve most of the issues, most likely also with=20
> > YUV scaling.
> > Implementing RCQ would be then relatively simple and even improve=20
> > timings.
> > Note that even DE3 has occasional issue with YUV scaler and also=20
> > read-modify-read
> > access to some of its register can produce bogus value and thus corrupt=
=20
> > image
> > until next commit.
>=20
> Thanks, again I wasn't aware. All my testing has shown remarkable stabili=
ty and there are some downstream users out-of-tree with good feedback, but =
would be happy to support an effort to improve this.

Let's land DE33 support first since it's long overdue and then I'm happy to=
 discuss plans for moving forward.

Best regards,
Jernej

>=20
> Regards,
>=20
> Ryan
>=20




