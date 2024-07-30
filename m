Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAA09416F1
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 18:05:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0136010E1DD;
	Tue, 30 Jul 2024 16:05:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="AYJqmcJq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 784A710E1DD
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 16:05:29 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-7a1d7a544e7so339885385a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 09:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1722355528; x=1722960328;
 darn=lists.freedesktop.org; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ciJceeDlK4Y/meCsbSLF/LMnhpaQTDx0EUKSZhsR9W4=;
 b=AYJqmcJqVWtCvggGiqJuQbTXJVVB708IHBflwxPkE0g/vh7dOFmm1qeZjQYJ8v2M0O
 vtFEnqsvJU7+eQd3hJdhVS4/LeD7ThV2bAd6EhoSetzbahO8mc8S52iP/t6jEF+BXkjR
 e+HEfx1zlATCbe5uAygMbRzv+hZmWkV/oi5BLr3Py/hzBfN60EqG4vc9xAZe11HrOYAy
 u/QzcqwPWfVmdefRJaSHTDthCvYROCm+hwR1cGTnOX/xdI0wH3U+3ftLwvfZZLuV3m5t
 a5vue2293VuTGUcAue0GptT3u0rj2noxKflVH1aEgbC6Nc8FrYqWHfdujJjG+txGcKXX
 4P4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722355528; x=1722960328;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ciJceeDlK4Y/meCsbSLF/LMnhpaQTDx0EUKSZhsR9W4=;
 b=vS2LY08rLDzffoP+Bn1kledfYps8LpY++7Dr2Kob39oV5IuSLsSe9y9O65ARDpthkw
 mGVV3P/o71yUnxwSxB7Gyfkjp3TBOY9G9C0Exd81ShfZXZ3mFC1n3mwQ5e0E3aSvsdd6
 6/KUOEnG3z8nZCAuz/6aPQGpyGojGNsYHVTgpAeUnf1rfCjKV3xNx5hwxot8VkRSPPuw
 Orq9eYHpfKi6wio+RkMMT+dJaIKrdke9ZZg75YGpAH3y9eOaUB6T0ohCyRqwGvejgYIF
 LiTmIPBUdjbab6URPQmqF/5xIGGdmqdtWmBn11rOdRYhv2GFyVTfpk5ztyaKRkN04+wC
 YoQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUU1qtRGm7rqkD2szM4LOxwf1bd027wW7NoNlrwg/oxnXyMF7I+AhkNGxi5bqkpmbwtAeWOuGRMtU/XNIY8GiEZ3MxUm0dWGfuY68wbuHbw
X-Gm-Message-State: AOJu0YxPFmghcvOh5FR2sSgJTubLHWhqDS800dzSmNr9AbJKil1tXlv7
 slyPR5CCGXpnO6yo96JRChz+61RqW6KaFnUfdPbQxK4fWtgACImI9cjIyu0uS10=
X-Google-Smtp-Source: AGHT+IEqLv3C2h4BQ+3fI7pKVhff0eutIQIkZ2jsV14fbu5lHsoFKAnZxlGiOhZ4pHufize9xVS64Q==
X-Received: by 2002:a05:620a:4090:b0:79b:efe1:1222 with SMTP id
 af79cd13be357-7a1e52fbb32mr1673543485a.63.1722355528312; 
 Tue, 30 Jul 2024 09:05:28 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:15:820c::580])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a1d745f06asm644089685a.134.2024.07.30.09.05.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jul 2024 09:05:28 -0700 (PDT)
Message-ID: <2229769f3a9baf58fbeeed93fa4b0373a02055e3.camel@ndufresne.ca>
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
Date: Tue, 30 Jul 2024 12:05:26 -0400
In-Reply-To: <8aea6cc0-10bf-48b8-add9-eb3f1caa2d66@denx.de>
References: <20240724002044.112544-1-marex@denx.de>
 <20240724002044.112544-2-marex@denx.de>
 <5e5fba4fd6c3c0c9df23697bd328367e5fdfa923.camel@ndufresne.ca>
 <8aea6cc0-10bf-48b8-add9-eb3f1caa2d66@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
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

Not that I only meant to ask if there was a path to combine
CSC/Scaling/Deinterlacing without a memory rountrip. If a rountrip is neede=
d
anyway, I would rather make separate video nodes, and leave it to userspace=
 to
deal with. Though, if we can avoid it, a combined driver should be highly
beneficial.

cheers,
Nicolas
