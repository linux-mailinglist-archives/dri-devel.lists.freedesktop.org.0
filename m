Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D380199F4EF
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 20:13:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1084810E5CD;
	Tue, 15 Oct 2024 18:13:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="d8H0Byao";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com
 [209.85.161.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 200F310E5CD
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 18:13:10 +0000 (UTC)
Received: by mail-oo1-f49.google.com with SMTP id
 006d021491bc7-5e5a0519d00so2321142eaf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 11:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1729015989; x=1729620789;
 darn=lists.freedesktop.org; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=5oxml2lN+ntX74kObb20hwl1g01p5AhViL60OxChXmk=;
 b=d8H0ByaoN7CdFNlq2qW8wYv9OLYKrn+UjOPo87EAGfkVRIYrkKxAV6W/Q2oaRClHOl
 KXcOMx31llYThGsxBfGwOnr4EaEPhrw+OpZqTgJVEMFBs1U3s3XY8/D2ykPiLz0E5qo3
 Imcm+32Z7LqRCl8zD0gBj60czqLacWNChwstODp4P4+vBNEFSTb4rhtxj7UKTqoqhXKw
 QcD6BsVWgQFNCwJ9MhFp9nk2qxZw1QrFLFIragp2usIcBKxVeSI4ySoMH1HBbfAhNPDE
 OHWhaTA9blUm2HDJKyWS0LGWtM+t4ONdSCMPOXTPe3Hxzjy4YJWmyIg14Tg+uZH4JMTD
 xG7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729015989; x=1729620789;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5oxml2lN+ntX74kObb20hwl1g01p5AhViL60OxChXmk=;
 b=kqKecv9nJNvPg7nLia9HHAA9EL64HEj//EKkYqrM4wd7SiN/o91j3EpDvL/ivuaKxX
 1Q+TZkk6PRqUrilT4QUBxdGY/ZY6xzwhMntGR2iYx2rZyptt9f021mHvgFQ0bOkxfdxz
 /HrCCXumjTjh0I5QRHoB1Htk/rvkleJd4wEQNzpbgRq8c2F2rR2E1xU6RSXdnniNvVk/
 fjHvgC9Oh4R0cqv23kkDcEbtauGda072iyjuVCfEheXs2XiatxtkVbWlWxjFwevDjw41
 vlSEaXRxLZZCA6F6sua31YArVJOEr2zjAm7m0Gv4gZOdaqjMHYwGUSnZaM7Jhp85hsde
 aUyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWR5pr3WrIg1wB780X7lg+2y7RU8vLP+1Fzc7pUTpCFYbEM0xP+Gryhx/RHgOaFF/2o3UsdfEEhKOE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwS4X0Mx3hm/wv/dWn8RDQkB+53cxtLNM2paUE/D/IfyLRSSWbA
 U2DrxuKVf5nvscKliyTEeEIj2kao2MAiIc1gZuf1OQVaxbcyCKq2boFOTc83d7E=
X-Google-Smtp-Source: AGHT+IE/1zf76YUX911aLGIJHXfaOZW556q/vVashhOD3oqJyrmYteHGq4kOCjf4Niews2uJm4FHLQ==
X-Received: by 2002:a05:6358:248e:b0:1b8:f18:3e6e with SMTP id
 e5c5f4694b2df-1c340d1aef5mr251119055d.12.1729015988990; 
 Tue, 15 Oct 2024 11:13:08 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:15:862e::7a9])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6cc22959b42sm9345366d6.76.2024.10.15.11.13.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2024 11:13:08 -0700 (PDT)
Message-ID: <5be2dbb2a0a3a7964a064013a5271f585247ec22.camel@ndufresne.ca>
Subject: Re: [PATCH v2 2/2] media: imx: vdic: Introduce mem2mem VDI
 deinterlacer driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Marek Vasut <marex@denx.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-media@vger.kernel.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Fabio
 Estevam <festevam@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo
 <shawnguo@kernel.org>,  Steve Longerbeam <slongerbeam@gmail.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org, 
 linux-staging@lists.linux.dev
Date: Tue, 15 Oct 2024 14:13:06 -0400
In-Reply-To: <0da39b8f-4cca-438f-9a39-40da7c34c895@denx.de>
References: <20240724002044.112544-1-marex@denx.de>
 <20240724002044.112544-2-marex@denx.de>
 <85a5a42667e5867bc45da31baf045d4c9557f5f1.camel@ndufresne.ca>
 <6b45e30c-b215-4f7a-91a4-fde05d78f737@denx.de>
 <b1c5fb155c77355ef2889b6e054a5c0696481ebd.camel@pengutronix.de>
 <0da39b8f-4cca-438f-9a39-40da7c34c895@denx.de>
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

Le jeudi 03 octobre 2024 =C3=A0 16:57 +0200, Marek Vasut a =C3=A9crit=C2=A0=
:
> On 9/26/24 1:16 PM, Philipp Zabel wrote:
> > On Mi, 2024-09-25 at 22:45 +0200, Marek Vasut wrote:
> > [...]
> > > > The driver is not taking ownership of prev_buf, only curr_buf is gu=
aranteed to
> > > > exist until v4l2_m2m_job_finish() is called. Usespace could streamo=
ff, allocate
> > > > new buffers, and then an old freed buffer may endup being used.
> > >=20
> > > So, what should I do about this ? Is there some way to ref the buffer=
 to
> > > keep it around ?
> >=20
> > Have a look how other deinterlacers with temporal filtering do it.
> > sunxi/sun8i-di or ti/vpe look like candidates.
> I don't see exactly what those drivers are doing differently to protect=
=20
> the prev buffer during deinterlacing . Can you be more specific ?

drivers/media/platform/sunxi/sun8i-di/sun8i-di.c:

                src =3D v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
                if (ctx->prev)
                        v4l2_m2m_buf_done(ctx->prev, state);
                ctx->prev =3D src;


What that does is that whenever a src buffer has been processed and needs t=
o be
kept has prev, it is removed from the m2m pending queue
(v4l2_m2m_src_buf_remove()), but not marked done. At the VB2 level it means=
 that
buffer will keep its ACTIVE/QUEUED state, meaning is currently under driver
ownership. I also expect the driver to start producing frame on the second
device run, but I didn't spend the extra time to check if that is the case =
for
sun8i-di driver.

As for GStreamer wrapper, since it does not support deinterlaced, it does n=
ot
always allocate this one extra buffer for prev. If the driver implement the
MIN_BUFFERS_FOR_OUTPUT CID though, it will allocate matching number of extr=
as.
Though, this has a side effect at driver level, since start streaming will =
be
delayed until 2 buffers has been queued and any way you need to queue 2 buf=
fers
before the driver will produces its first buffer.

This comes to the next reason why the wrapper will fail, since for each buf=
fer
that is pushed, it synchronously wait for the output. So it systematically =
stall
on first frame. As the author of that wrapper, I'm well aware of that, but =
never
had a use case where I needed to fix it. I will be happy to accept support =
for
that, though in current mainline state, there is no generic way to actually
know. One way is to thread the transform, but then GstBasetransform class c=
an't
be used, its a lot of work and adds complexity.

We can certainly fix gstv4l2transform.c behaviour with adding
MIN_BUFFERS_FOR_OUTPUT in upstream drivers. That would be easy to handle wi=
th
adding a matching buffering delay. These deinterlacers works for Kodi, sinc=
e the
userspace code they have is not generic and have internal knowledge of the
hardware it is running on.

Nicolas
