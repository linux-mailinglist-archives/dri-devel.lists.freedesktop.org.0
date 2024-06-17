Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A58AC90A57F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 08:24:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE18510E1AE;
	Mon, 17 Jun 2024 06:24:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gr8vFR08";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 398DA10E1AE
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 06:24:23 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a6f0dc80ab9so614062866b.2
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2024 23:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718605461; x=1719210261; darn=lists.freedesktop.org;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=5BA/TosT1CrxQE3NyCIfG5vCxzPOaTI0joE23Fx2Gqc=;
 b=gr8vFR08GllhQwhZVACF3EgMFU8QpMl8FHMyLsRD9tO1Q2CK+IBRaMJ/uvkGk4WQ32
 CRs+jlOOHNhLUn9zifPsYf07Hjz1HAedgD8QwsQ2OvrPWltR/nRSc96MC6Cu+VT8LiJT
 oPaF6eZU+Lta5VKDXrTjHBgBTrBKzSguUNZeKwpV5hrZefKZNLl/9u0S6JIFIm97fYd1
 7dQziKy1dXo/ugZLhxgUBGqFbURokiWmcjnJC5sq6695mibbFKbcdnFuqU5Ou05s+Dfl
 ZFfN4MpCt9iAxFrTmo6rgOCvFTJ1EgvIuQmcFvVy2V9VygARguoXPxe9RJTQOOsmlJun
 Sotw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718605461; x=1719210261;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5BA/TosT1CrxQE3NyCIfG5vCxzPOaTI0joE23Fx2Gqc=;
 b=oxdblpcCRIw0SqS4gqW2NAcjlSq9hC76nGk0k6nHU6qLJta6wfqQnC5g6sx00bNEgS
 LPnKRbsKHz2/DM3zzBEnfax3zSeSbQJrqv+GVCXwKA/5vBywv/FtuNVBDM1RIP8QOMHs
 muoE0V82qEfAHKIJWcnwStgOi2GDQIVwR5uFpLRfWHHzdIuiLHbjJLTGCnc7Mvr88D76
 9/lM/oVzyai0BksDBsR03YHrOSSq3QZ2xKC2TA1qT6i79Es6Mm7biyUxb1Uz85amtkyq
 y3zea+PblRJWmLkEwf9hYDCnU6o44LywuEYEtZLkZS/huIkLgQP1xTNx4RJg7zXwPCWq
 8H0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWoHF4W4dfVwdzYEWkWYZ04oCvVEjdOm81fTC6MCJ5LlhzGKj3hOrjBuPz9C9EK3pU3R1V5xNKd5vGscrp+mk7MbUeHTA9lTQCejrC5R3+
X-Gm-Message-State: AOJu0YxYTb66675osVui5GiMm5HJL04nWaifoQD+3mVwlWzEhYM5e1Ql
 aVHryP5RiGMEXpmx7Vm/Nyk2mccSzzODW9n8QLXhTRLp5LgrLyX2
X-Google-Smtp-Source: AGHT+IGwPJh8PW95cQ3TUh8Rt+F4WZpn4rbG8t7MJQz99Y0NFynHP5+QpRL00FDtWKBhhin6up50sQ==
X-Received: by 2002:a17:907:c003:b0:a6f:6b6a:e8d2 with SMTP id
 a640c23a62f3a-a6f6b6aec48mr560764166b.11.1718605460884; 
 Sun, 16 Jun 2024 23:24:20 -0700 (PDT)
Received: from nsa.fritz.box ([2001:a61:35f9:9001:40df:88bb:5090:7ab6])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f7c12f7c0sm191184366b.198.2024.06.16.23.24.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jun 2024 23:24:20 -0700 (PDT)
Message-ID: <f0c709e3bf3f1ebfac29274b8f7182df9022376e.camel@gmail.com>
Subject: Re: [PATCH v10 3/6] iio: core: Add new DMABUF interface infrastructure
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Paul Cercueil <paul@crapouillou.net>, Jonathan Cameron <jic23@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>,  Jonathan Corbet <corbet@lwn.net>, Nuno Sa
 <nuno.sa@analog.com>, linux-iio@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dmaengine@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Date: Mon, 17 Jun 2024 08:24:19 +0200
In-Reply-To: <0cdcf83a1ab7c199244d4a00157f6fa8979ef819.camel@crapouillou.net>
References: <20240605110845.86740-1-paul@crapouillou.net>
 <20240605110845.86740-4-paul@crapouillou.net>
 <20240609105302.07de907a@jic23-huawei>
 <0cdcf83a1ab7c199244d4a00157f6fa8979ef819.camel@crapouillou.net>
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

On Sat, 2024-06-15 at 13:07 +0200, Paul Cercueil wrote:
> Le dimanche 09 juin 2024 =C3=A0 10:53 +0100, Jonathan Cameron a =C3=A9cri=
t=C2=A0:
> > On Wed,=C2=A0 5 Jun 2024 13:08:42 +0200
> > Paul Cercueil <paul@crapouillou.net> wrote:
> >=20
> > > Add the necessary infrastructure to the IIO core to support a new
> > > optional DMABUF based interface.
> > >=20
> > > With this new interface, DMABUF objects (externally created) can be
> > > attached to a IIO buffer, and subsequently used for data transfer.
> > >=20
> > > A userspace application can then use this interface to share DMABUF
> > > objects between several interfaces, allowing it to transfer data in
> > > a
> > > zero-copy fashion, for instance between IIO and the USB stack.
> > >=20
> > > The userspace application can also memory-map the DMABUF objects,
> > > and
> > > access the sample data directly. The advantage of doing this vs.
> > > the
> > > read() interface is that it avoids an extra copy of the data
> > > between the
> > > kernel and userspace. This is particularly userful for high-speed
> > > devices which produce several megabytes or even gigabytes of data
> > > per
> > > second.
> > >=20
> > > As part of the interface, 3 new IOCTLs have been added:
> > >=20
> > > IIO_BUFFER_DMABUF_ATTACH_IOCTL(int fd):
> > > =C2=A0Attach the DMABUF object identified by the given file descripto=
r
> > > to the
> > > =C2=A0buffer.
> > >=20
> > > IIO_BUFFER_DMABUF_DETACH_IOCTL(int fd):
> > > =C2=A0Detach the DMABUF object identified by the given file descripto=
r
> > > from
> > > =C2=A0the buffer. Note that closing the IIO buffer's file descriptor
> > > will
> > > =C2=A0automatically detach all previously attached DMABUF objects.
> > >=20
> > > IIO_BUFFER_DMABUF_ENQUEUE_IOCTL(struct iio_dmabuf *):
> > > =C2=A0Request a data transfer to/from the given DMABUF object. Its fi=
le
> > > =C2=A0descriptor, as well as the transfer size and flags are provided=
 in
> > > the
> > > =C2=A0"iio_dmabuf" structure.
> > >=20
> > > These three IOCTLs have to be performed on the IIO buffer's file
> > > descriptor, obtained using the IIO_BUFFER_GET_FD_IOCTL() ioctl.
> > >=20
> > > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> > > Signed-off-by: Nuno Sa <nuno.sa@analog.com>
> >=20
> > Need a brief note on the sign off chain.
> > What is Nuno's role in this series as he's not sending the emails and
> > not
> > marked with Co-developed-by=20
>=20
> That's a good question. I think he sent one revision of the patchset
> (v7 or something like that) so he added his SoB.
>=20
> (Nuno: you confirm?)

exactly...

>=20
> I'll add his Co-developed-by then.

Not sure if that is really deserved :)... Maybe just remove my tag.

- Nuno S=C3=A1


