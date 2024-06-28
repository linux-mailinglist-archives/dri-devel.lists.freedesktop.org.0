Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2F591C730
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 22:17:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B478810E0D5;
	Fri, 28 Jun 2024 20:17:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="iSqJJ24k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D89610E0D5
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 20:16:58 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-64b5617ba47so7989637b3.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 13:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1719605818; x=1720210618;
 darn=lists.freedesktop.org; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=m2vvGH+Z5PRv9C1/1Kg2WLGJOBKFCREheDNXNwXq490=;
 b=iSqJJ24k87jObYMqQcbSKkoFdduiGJ5as2uwh7CJ+h7PdBiOyaM5K3mpCtVU2EmsXM
 IsU/dEcP1ThT2n5WUqyC7rgLOgSiHPPiFza4g51ake8+Vl/KB8k7bZTDdMPOOQz0haml
 ovfmxwe4I3wGEDD4wyiMRjJXYNYf787qAl9M5TRHkH9xVLLtnnyESU9SQT9jo3YYVGkg
 QUWDNWVmFK54hxm3oHqA68oYpBLFJPaXsKM3WHGO3UZ8VsSuHsm7iK8dOkF7xgL6mL8P
 cppjFzbidU5c2mxYSN+qr0iXfHuTSikEhSAGeulJ59eKrOJ54nfPRu8Ykqifd3F6WGal
 ssmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719605818; x=1720210618;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m2vvGH+Z5PRv9C1/1Kg2WLGJOBKFCREheDNXNwXq490=;
 b=YZBJtgUPpdl5ahbSSAwZOBMQ2Pp5PYzPy8hWOZFdZv5muvLTJ20X7tNPosW5HBfIvm
 cPlZ/wQCzN5hO9Pt9ftoyA7hA3+hb/YOkEVX4vDnb6fdGpXI/GDam/rb1BMbanswiJsZ
 ZjSpcwuUPIYFBje88gAJ911izP9f2cNDvvgv1Ux2ga2rDk+oY3nz0X9S2WB2acMbwsO1
 PZXqaKn89ULwyf/xuyskf9eNc7BOwPatKLM5ez52ldYkdVOOpxztyhC+CTjMPdhRhYXT
 B+VKCKo6rROW46j1rxPaNbX82beAZkHQlTTa+rcVaNkjGQj7nXt1LLlPU4pq4sdocljv
 TMcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAOhyEahMHL0QygGMEl8+a5c1efNnnEfhGtFqmxOdo3q6Xlsi894XaqZXDYMgq7nlU3YaObg20sYrpJV6IYdvBdgR7VCk/SRB7t/tIEWlk
X-Gm-Message-State: AOJu0Yyxb3OPU2JW7jwmpV0odjDlBHTMcZb74RtbEXhHoFU3BemMmSCK
 Y51gj+HjroKa0rG7X9eHmFmz17zCe3+7PieCM0wmE1b6ngC/mtOH+BuoFJt90Vs=
X-Google-Smtp-Source: AGHT+IHH8GNlM8rKewH+h4ANugMUQbUwWJEtQ5rC13yHwJFh9UDtqPw7nNyJ2Z5wwDX2U220J+AoVg==
X-Received: by 2002:a05:690c:95d:b0:647:e079:da73 with SMTP id
 00721157ae682-647e079db0bmr101713777b3.10.1719605817658; 
 Fri, 28 Jun 2024 13:16:57 -0700 (PDT)
Received: from nicolas-tpx395.mtl.collabora.ca (mtl.collabora.ca.
 [66.171.169.34]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-64a9c4fdb78sm4445677b3.145.2024.06.28.13.16.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 13:16:57 -0700 (PDT)
Message-ID: <183f2ae09c2dbcf687e69cd13a9d258fd24fd80c.camel@ndufresne.ca>
Subject: Re: [PATCH v5 2/9] scatterlist: Add a flag for the restricted memory
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 Jason-JH Lin =?UTF-8?Q?=28=E6=9E=97=E7=9D=BF=E7=A5=A5=29?=
 <Jason-JH.Lin@mediatek.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>
Cc: "quic_vjitta@quicinc.com" <quic_vjitta@quicinc.com>, 
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "sumit.semwal@linaro.org"
 <sumit.semwal@linaro.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
 "jkardatzke@google.com" <jkardatzke@google.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "joakim.bech@linaro.org" <joakim.bech@linaro.org>, Youlin Pei
 =?UTF-8?Q?=28=E8=A3=B4=E5=8F=8B=E6=9E=97=29?= <youlin.pei@mediatek.com>,
 "logang@deltatee.com" <logang@deltatee.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Kuohong Wang =?UTF-8?Q?=28=E7=8E=8B=E5=9C=8B=E9=B4=BB=29?=
 <kuohong.wang@mediatek.com>, Jianjiao Zeng
 =?UTF-8?Q?=28=E6=9B=BE=E5=81=A5=E5=A7=A3=29?= <Jianjiao.Zeng@mediatek.com>,
 "contact@emersion.fr" <contact@emersion.fr>, 
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "willy@infradead.org" <willy@infradead.org>,  "pavel@ucw.cz"
 <pavel@ucw.cz>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, 
 "Brian.Starkey@arm.com" <Brian.Starkey@arm.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>,  "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "tjmercier@google.com"
 <tjmercier@google.com>,  "jstultz@google.com" <jstultz@google.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "mripard@kernel.org"
 <mripard@kernel.org>, "robin.murphy@arm.com" <robin.murphy@arm.com>, Yong
 Wu =?UTF-8?Q?=28=E5=90=B4=E5=8B=87=29?= <Yong.Wu@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ppaalanen@gmail.com" <ppaalanen@gmail.com>
Date: Fri, 28 Jun 2024 16:16:55 -0400
In-Reply-To: <5739abdb-0234-412a-9f25-49219411bbc6@amd.com>
References: <20240515112308.10171-1-yong.wu@mediatek.com>
 <20240515112308.10171-3-yong.wu@mediatek.com>
 <98721904-003d-4d0d-8cfe-1cecdd59ce01@amd.com>
 <779ce30a657754ff945ebd32b66e1c644635e84d.camel@mediatek.com>
 <cef8f87d-edab-41d8-8b95-f3fc39ad7f74@amd.com>
 <1050c44512374031d1349b5dced228d0efc3fbde.camel@mediatek.com>
 <3104b765-5666-44e4-8788-f1b1b296fe17@amd.com>
 <98c11bad7f40bcc79ed7a2039ddb3a46f99908f5.camel@mediatek.com>
 <75dc1136-7751-4772-9fa7-dd9124684cd2@amd.com>
 <ZnxWWtdShekGSUif@phenom.ffwll.local>
 <ae73a0203d6acf2878c9e3ae2d7554816b9c66ad.camel@mediatek.com>
 <5739abdb-0234-412a-9f25-49219411bbc6@amd.com>
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

Hi Christian,

Le jeudi 27 juin 2024 =C3=A0 08:57 +0200, Christian K=C3=B6nig a =C3=A9crit=
=C2=A0:
> Am 27.06.24 um 05:21 schrieb Jason-JH Lin (=E6=9E=97=E7=9D=BF=E7=A5=A5):
> >=20
> > On Wed, 2024-06-26 at 19:56 +0200, Daniel Vetter wrote:
> > >  =20
> > > External email : Please do not click links or open attachments until
> > > you have verified the sender or the content.
> > >  On Wed, Jun 26, 2024 at 12:49:02PM +0200, Christian K=C3=B6nig wrote=
:
> > > > Am 26.06.24 um 10:05 schrieb Jason-JH Lin (=E6=9E=97=E7=9D=BF=E7=A5=
=A5):
> > > > > > > I think I have the same problem as the ECC_FLAG mention in:
> > > > > > > > >=20
> > > https://lore.kernel.org/linux-media/20240515-dma-buf-ecc-heap-v1-0-54=
cbbd049511@kernel.org/
> > > > > > > > > I think it would be better to have the user configurable
> > > private
> > > > > > > information in dma-buf, so all the drivers who have the same
> > > > > > > requirement can get their private information from dma-buf
> > > directly
> > > > > > > and
> > > > > > > no need to change or add the interface.
> > > > > > > > > What's your opinion in this point?
> > > > > >  > Well of hand I don't see the need for that.
> > > > > > > What happens if you get a non-secure buffer imported in your
> > > secure
> > > > > > device?
> > > > >=20
> > > > > We use the same mediatek-drm driver for secure and non-secure
> > > buffer.
> > > > > If non-secure buffer imported to mediatek-drm driver, it's go to
> > > the
> > > > > normal flow with normal hardware settings.
> > > > >=20
> > > > > We use different configurations to make hardware have different
> > > > > permission to access the buffer it should access.
> > > > >=20
> > > > > So if we can't get the information of "the buffer is allocated
> > > from
> > > > > restricted_mtk_cma" when importing the buffer into the driver, we
> > > won't
> > > > > be able to configure the hardware correctly.
> > > >=20
> > > > Why can't you get this information from userspace?
> > >=20
> > > Same reason amd and i915/xe also pass this around internally in the
> > > kernel, it's just that for those gpus the render and kms node are the
> > > same
> > > driver so this is easy.
> > >=20
>=20
> The reason I ask is that encryption here looks just like another=20
> parameter for the buffer, e.g. like format, stride, tilling etc..

I'm mostly a reader of the thread here, but I'd like to avoid basic mistake=
s.
The buffer in question are "protected", meaning that the CPU HW does not ha=
ve
access to the underlying pages (or zone in the case of Meditatek).

This is different from encrypted buffers, which don't need this level of
protection, as without the security key to decrypt them, their content is c=
lose
to random data.

>=20
> So instead of this during buffer import:
>=20
> mtk_gem->secure =3D (!strncmp(attach->dmabuf->exp_name, "restricted", 10)=
);
> mtk_gem->dma_addr =3D sg_dma_address(sg->sgl);
> mtk_gem->size =3D attach->dmabuf->size;
> mtk_gem->sg =3D sg;
>=20
> You can trivially say during use hey this buffer is encrypted.
>=20
> At least that's my 10 mile high view, maybe I'm missing some extensive=
=20
> key exchange or something like that.

If we take secure video path as an example, in the context of digital right
management, the handling of user session, retrieval of the device specific =
"key"
is entirely something for userspace to handle and the kernel have no busine=
ss
into that. As long as the data is encrypted, its safe to carry around like =
any
other buffers.

It is only once decryption (usally done by a TF-A) that restricted memory s=
tart
being used. Initially in the form of a compressed video stream, and eventua=
lly
in the format of raw images.

> >  =20
> > > But on arm you have split designs everywhere and dma-buf
> > > import/export, so
> > > something else is needed. And neither current kms uapi nor
> > > protocols/extensions have provisions for this (afaik) because it
> > > works on
> > > the big gpus, and on android it's just hacked up with backchannels.
> > >=20
> > > So yeah essentially I think we probably need something like this, as
> > > much
> > > as it sucks. I see it somewhat similar to handling pcip2pdma
> > > limitations
> > > in the kernel too.
> > >=20
> > > Not sure where/how it should be handled though, and maybe I've missed
> > > something around protocols, in which case I guess we should add some
> > > secure buffer flags to the ADDFB2 ioctl.
> >=20
> > Thanks for your hint, I'll try to add the secure flag to the ADDFB2
> > ioctl. If it works, I'll send the patch.
>=20
> Yeah, exactly what I would suggest as well.
>=20
> I'm not an expert for that part, but as far as I know we already have=20
> bunch of device specific tilling flags in there.
>=20
> Adding an MTK_ENCRYPTED flag should be trivial.

Just to be clear, my comment was just a concept correction, I also think it=
s
nice to give a ADDFB2 flag a try, from my userspace experience, this is an =
easy
place to provide this type of information. Also, the V4L2 proposal for the =
same
endup with a flag at during buffer queue configuration, which is pretty clo=
se.

Nicolas

>=20
> Regards,
> Christian.
>=20
> >=20
> > Regards,
> > Jason-JH.Lin
> >=20
> > > -Sima
> >=20
> > ************* MEDIATEK Confidentiality Notice ********************
> > The information contained in this e-mail message (including any
> > attachments) may be confidential, proprietary, privileged, or otherwise
> > exempt from disclosure under applicable laws. It is intended to be
> > conveyed only to the designated recipient(s). Any use, dissemination,
> > distribution, printing, retaining or copying of this e-mail (including =
its
> > attachments) by unintended recipient(s) is strictly prohibited and may
> > be unlawful. If you are not an intended recipient of this e-mail, or be=
lieve
> > that you have received this e-mail in error, please notify the sender
> > immediately (by replying to this e-mail), delete any and all copies of
> > this e-mail (including any attachments) from your system, and do not
> > disclose the content of this e-mail to any other person. Thank you!
>=20
>=20

