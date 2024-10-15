Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EACB399F415
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 19:31:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7561110E04D;
	Tue, 15 Oct 2024 17:31:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="s0S1K/sV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79CE910E04D
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 17:31:12 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-460391553ecso52162791cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 10:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1729013471; x=1729618271;
 darn=lists.freedesktop.org; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Nlkt2Fthyuj+02wChbrIoEHBospBClzz0I96zymXtIg=;
 b=s0S1K/sVnlBZcoO8ozI1vC2105F4jtVzhoxWPsYFW693ILbhaPT+5TPhuWQXSMfGPY
 Td8M+5PpcwBoIW2hSKo9m75ZGNlMK120qXi6lpagw4yzsB7NVl0QZQ3xUm3n/BONIurs
 p71N1rPTy7cK7nyxCVZlvx9d6egG2Sy/ZX61er9D0MsHdGpp0dlJDmx44uTFxVKXTxtQ
 0flpbDO9L3GN9I0d3yXmWcaQLwkfUByYa6DHIOeFogDNG9lEr8oI7+xjGfFSVod7roh5
 FnWacHrsefv/I/jkbVKk4ZWCDcsc1dWWYxWje3zNWfnrrMGObw+GubDgl2HUP4TddJ0w
 y1wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729013471; x=1729618271;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Nlkt2Fthyuj+02wChbrIoEHBospBClzz0I96zymXtIg=;
 b=Bc4e2Bq5EqF0jC7Ni5BKK4WEJLqsLh0Jggf3Z45VlBdPNrYa3LyIbMwojzkBFLOhcn
 buAk7z1+u9Z1XpFyG6/uCHMG4OkfnGcDkHzBYs2GDZkrcAk3vTxOmQjtYjoGOKTkeszr
 bKwgvz0CcDZVlGeM6KsCw/vtswu/9xSikLh0xyYTMZzpySmJxHILLEW/iXhy9K7xCqN3
 TSP9XU1u5YXCMdX0l8lu6d7WHzMzKT+ugSwsZ915NTnouA8sXpugBw1tykcOlDnYUBdi
 PLWcFyhI+1CX+qmBcAcfN5IPwmmthzUVvBWKV8JZ2sCNsuAOTWX5VQOhj1990ZnjKgBM
 5Fvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJmVTa5s4SVMC0W8nw1HNtNjnsRVbMJBQR1Rlt70puDqossV2izZbJawcNpRq3Go23UJ+x4p/ZGdQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxhKaZMX33UaSI6Yh2HfPVx3mMI62vw0+OSCKI23UfOuF9eZ3wN
 cUerLHzccP47NS1aysWjhucP3dxQJSnsVV5pZVNrvp9mAixjlRI85rT0Yu0M/Tw=
X-Google-Smtp-Source: AGHT+IHQTEqtyG1hqwhDEXmkug0vsLn7tK0TUCZGlPkVwJk5Fmx3FpOukVPbin+a6nZZiv9VlOtyKA==
X-Received: by 2002:a05:6214:33c3:b0:6cc:1dd9:296 with SMTP id
 6a1803df08f44-6cc1dd9048bmr55656576d6.0.1729013471113; 
 Tue, 15 Oct 2024 10:31:11 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:15:862e::7a9])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6cc229245f1sm8990646d6.57.2024.10.15.10.31.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2024 10:31:10 -0700 (PDT)
Message-ID: <c31b33f9c4c0a42e66249e2a108f4eadaf105ce2.camel@ndufresne.ca>
Subject: Re: [PATCH v2 2/2] media: imx: vdic: Introduce mem2mem VDI
 deinterlacer driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Marek Vasut <marex@denx.de>, linux-media@vger.kernel.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Fabio
 Estevam <festevam@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Sascha
 Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Steve
 Longerbeam <slongerbeam@gmail.com>, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org,  linux-staging@lists.linux.dev
Date: Tue, 15 Oct 2024 13:31:09 -0400
In-Reply-To: <8aea6cc0-10bf-48b8-add9-eb3f1caa2d66@denx.de>
References: <20240724002044.112544-1-marex@denx.de>
 <20240724002044.112544-2-marex@denx.de>
 <5e5fba4fd6c3c0c9df23697bd328367e5fdfa923.camel@ndufresne.ca>
 <8aea6cc0-10bf-48b8-add9-eb3f1caa2d66@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
MIME-Version: 1.0
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

Le lundi 29 juillet 2024 =C3=A0 04:16 +0200, Marek Vasut a =C3=A9crit=C2=A0=
:
> On 7/24/24 6:08 PM, Nicolas Dufresne wrote:
> > Hi Marek,
>=20
> Hi,
>=20
> > Le mercredi 24 juillet 2024 =C3=A0 02:19 +0200, Marek Vasut a =C3=A9cri=
t=C2=A0:
> > > Introduce dedicated memory-to-memory IPUv3 VDI deinterlacer driver.
> > > Currently the IPUv3 can operate VDI in DIRECT mode, from sensor to
> > > memory. This only works for single stream, that is, one input from
> > > one camera is deinterlaced on the fly with a helper buffer in DRAM
> > > and the result is written into memory.
> > >=20
> > > The i.MX6Q/QP does support up to four analog cameras via two IPUv3
> > > instances, each containing one VDI deinterlacer block. In order to
> > > deinterlace all four streams from all four analog cameras live, it
> > > is necessary to operate VDI in INDIRECT mode, where the interlaced
> > > streams are written to buffers in memory, and then deinterlaced in
> > > memory using VDI in INDIRECT memory-to-memory mode.
> >=20
> > Just a quick design question. Is it possible to chain the deinterlacer =
and the
> > csc-scaler ?
>=20
> I think you could do that.
>=20
> > If so, it would be much more efficient if all this could be
> > combined into the existing m2m driver, since you could save a memory ro=
untrip
> > when needing to deinterlace, change the colorspace and possibly scale t=
oo.
>=20
> The existing PRP/IC driver is similar to what this driver does, yes, but=
=20
> it uses a different DMA path , I believe it is IDMAC->PRP->IC->IDMAC .=
=20
> This driver uses IDMAC->VDI->IC->IDMAC . I am not convinced mixing the=
=20
> two paths into a single driver would be beneficial, but I am reasonably=
=20
> sure it would be very convoluted. Instead, this driver could be extended=
=20
> to do deinterlacing and scaling using the IC if that was needed. I think=
=20
> that would be the cleaner approach.

No strong opinion, in an ideal world all these hacks are removed and we do =
a
single multi-context / m2m media controller, that let user pick the path th=
ey
need for their task. When I look at the hardware documentation, you can do
inline from VDI to IC, and having IC in both drivers duplicates the CSC
handling. If you allow bypassing the VDI, then you have a duplicated driver=
 and
highly confused users. The fact the ipuv3 (internal) drm driver does not ha=
ve
the VDI already seems because the display controller driver is missing
interlaced video support, but I could be wrong. Same if you want to support=
 IRT
(even though that is not inline, but using a custom memory protocol).

Nicolas
