Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F3C8C10AF
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 15:53:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0584F10E9C3;
	Thu,  9 May 2024 13:53:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="P7roEzRi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9CFB10E9F7
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 13:53:18 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-61816fc256dso9365147b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 06:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1715262798;
 x=1715867598; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wdFa90PddlvioOWqeSbKbQrk9EgH4c2dEjX31dZlhXM=;
 b=P7roEzRirjm66hrAw2PUTfaPpGIk3+1Ioy0RKwg5f1TQbmdWvMUbuL2g75zfLPP84P
 h5IaWBwn9QruvqWdhcMDWtdh1F+mcfcPWHFw7bJk0QsBtip+1+TufvSJv3JffXg3PNI0
 ijNI7biDmaB5o4U9QYLZGnmhRIEUICCw0uOM/dyGzR7K8HrL/tn9c48pQHJ2YbHJjKMh
 CUMHqUlRGFvNncqgMPKEDXUdPGmjb4horuT3Xc2ciaiLRwlQmEMvultqfahT3WckEoTQ
 e88KcBa4luvk8s9wPpr2XWI3TX5Eg4KbKbaL2wZ2k3gHCmXBvvDkJSkrYV2iZkvNFITK
 jsCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715262798; x=1715867598;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wdFa90PddlvioOWqeSbKbQrk9EgH4c2dEjX31dZlhXM=;
 b=XJmbJhM+x+XgkAy7U0IwatOBdgjvSl8NFFiEW52Ta4/5KFAmaB6ong8AFEUUHH2hwX
 1wGCAoDlMJER7sF+AhhSpmBjLSrVv6KbB+X+HrMMAd2IR5qzjftQvuEP2a0k1bCkVCy1
 8T3tctiH5mpX0m8kGhgOpAt8mGEPyo1wYppXPMLvOa+bSWxc6OaI3XZ0Dq7hw5r4RoHd
 8EH6eqtRpopaSZ2QtNoRCfBEyvAAiCbf+bIjnssWkG45HML/KU5lfrEz1UNMhOnEtG8m
 OvFOGgyP+C3QJ9S+B2DiBtywsHbStwxVh8xbZUkWUEbgnpmPrIWAi7j6e9zV9Us8bzNT
 iUkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWy1LcRLaWLhpTm/fodC15kfK1nbSQNDAZT2MVgCqvZGkCZ/DmspoE4yCbrbjzLSVDwwerDzzsaFz9kEANS286yQU+m3czAVswInHaGjjAI
X-Gm-Message-State: AOJu0YyDak6DTaSdWqC0ncphLpuELWFP3zNyYrk7oR+HiKrnH7OWPyoo
 44vFjqqSjzlsk6f7yKpXkijcasMgDyB3X9srF1TcQHUF8g61QEZfwhcu2YLDiuk=
X-Google-Smtp-Source: AGHT+IG0VWC0/MCDkxoSA0Panead6BNhHuKGAmkks8D3WfKkQ3TCl23PcFNjv9qC1q7TDcYhaVq13g==
X-Received: by 2002:a81:4e81:0:b0:618:1960:f59e with SMTP id
 00721157ae682-62085a9a185mr68710357b3.25.1715262797017; 
 Thu, 09 May 2024 06:53:17 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com.
 [209.85.128.174]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-6209e3472acsm2988787b3.76.2024.05.09.06.53.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 May 2024 06:53:13 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-6114c9b4d83so7342007b3.3; 
 Thu, 09 May 2024 06:53:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXOCvHXFuBIOcFMv6wQV8hOZdImsPPsefuJPIeuV/JHzgGzSwKVA3jqx3fy8KAMDkYKRdBwlXAyjnOX3uh9txzH8/IbQSVp2o8dEGrwgwLwF+djqVehwTr1tp+X2rkcXn31S455uKGMbQ0vxpmewQ==
X-Received: by 2002:a25:1303:0:b0:de5:d1cd:b580 with SMTP id
 3f1490d57ef6-debb9db87famr5937174276.36.1715262792938; Thu, 09 May 2024
 06:53:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240424063753.3740664-1-tomeu@tomeuvizoso.net>
 <8c55dba5-6308-685e-13da-e728197d8101@quicinc.com>
 <CAAObsKD4-k7Ya4Mi=vEPaC9DucbnVGDO5SaEUt-_o2_Bg+_FgA@mail.gmail.com>
In-Reply-To: <CAAObsKD4-k7Ya4Mi=vEPaC9DucbnVGDO5SaEUt-_o2_Bg+_FgA@mail.gmail.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Thu, 9 May 2024 15:53:01 +0200
X-Gmail-Original-Message-ID: <CAAObsKCm49y-nUph=m9c+-eG37SaGKG93-1etwOQab4f5MXxOg@mail.gmail.com>
Message-ID: <CAAObsKCm49y-nUph=m9c+-eG37SaGKG93-1etwOQab4f5MXxOg@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: Create an accel device node if compute-only
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: linux-kernel@vger.kernel.org, Oded Gabbay <ogabbay@kernel.org>, 
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, etnaviv@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
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

Oded, Dave,

Do you have an opinion on this?

Thanks,

Tomeu

On Fri, Apr 26, 2024 at 8:10=E2=80=AFAM Tomeu Vizoso <tomeu@tomeuvizoso.net=
> wrote:
>
> On Thu, Apr 25, 2024 at 8:59=E2=80=AFPM Jeffrey Hugo <quic_jhugo@quicinc.=
com> wrote:
> >
> > On 4/24/2024 12:37 AM, Tomeu Vizoso wrote:
> > > If we expose a render node for NPUs without rendering capabilities, t=
he
> > > userspace stack will offer it to compositors and applications for
> > > rendering, which of course won't work.
> > >
> > > Userspace is probably right in not questioning whether a render node
> > > might not be capable of supporting rendering, so change it in the ker=
nel
> > > instead by exposing a /dev/accel node.
> > >
> > > Before we bring the device up we don't know whether it is capable of
> > > rendering or not (depends on the features of its blocks), so first tr=
y
> > > to probe a rendering node, and if we find out that there is no render=
ing
> > > hardware, abort and retry with an accel node.
> > >
> > > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > > Cc: Oded Gabbay <ogabbay@kernel.org>
> >
> > I hope Oded chimes in as Accel maintainer.  I think Airlie/Vetter had
> > also previously mentioned they'd have opinions on what is Accel vs DRM.
> >
> > This gets a nack from me in its current state.  This is not a strong
> > nack, and I don't want to discourage you.  I think there is a path forw=
ard.
> >
> > The Accel subsystem documentation says that accel drivers will reside i=
n
> > drivers/accel/ but this does not.
>
> Indeed, there is that code organization aspect.
>
> > Also, the commit text for "accel: add dedicated minor for accelerator
> > devices" mentions -
> >
> > "for drivers that
> > declare they handle compute accelerator, using a new driver feature
> > flag called DRIVER_COMPUTE_ACCEL. It is important to note that this
> > driver feature is mutually exclusive with DRIVER_RENDER. Devices that
> > want to expose both graphics and compute device char files should be
> > handled by two drivers that are connected using the auxiliary bus
> > framework."
> >
> > I don't see any of that happening here (two drivers connected by aux
> > bus, one in drivers/accel).
>
> Well, the text refers to devices, not drivers. The case we are talking
> about is a driver that wants to sometimes expose an accel node, and
> sometimes a render node, depending on the hardware it is dealing with.
> So there would either be a device exposing a single render node, or a
> device exposing a single accel node.
>
> Though by using the auxiliary bus we could in theory solve the code
> organization problem mentioned above, I'm not quite seeing how to do
> this in a clean way. The driver in /drivers/gpu/drm would have to be a
> DRM driver that doesn't register a DRM device, but registers a device
> in the auxiliary bus for the driver in /drivers/accel to bind to? Or
> are you seeing some possibility that would fit better in the current
> DRM framework?
>
> > I think this is the first case we've had of a combo DRM/Accel usecase,
> > and so there isn't an existing example to refer you to on how to
> > structure things.  I think you are going to be the first example where
> > we figure all of this out.
>
> Yep, I will be grateful for any ideas on how to structure this.
>
> > On a more implementation note, ioctls for Accel devices should not be
> > marked DRM_RENDER_ALLOW.  Seems like your attempt to reuse as much of
> > the code as possible trips over this.
>
> Indeed, thanks.
>
> Cheers,
>
> Tomeu
>
> > -Jeff
