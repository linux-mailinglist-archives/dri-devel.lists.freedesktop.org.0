Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C1F826964
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 09:25:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8B4710E185;
	Mon,  8 Jan 2024 08:25:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD5F510E185
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 08:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704702327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KZTv9nbes+UUv6ydUaDBh+0jRRVdETkIFavswDy7m5g=;
 b=Y8y6bU7ZPvRLuhb37RqGWdo0noK5WlMG/PuQJkVTpVyRlIxq3VVAxOSRdBAlXKq6xk2p4r
 8JDIfdw3j8/dEsyYe9CuRmpYTdvWUWHCSl32CqTonc92TrWfHgVLoDVjZL9yrWRpe0TuZ+
 p+NnFwAmrM+VyP2269cwvd6HD44rEI4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-362-oy7fotEyMqyZ92y8Lak2kQ-1; Mon, 08 Jan 2024 03:25:26 -0500
X-MC-Unique: oy7fotEyMqyZ92y8Lak2kQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-78130939196so50381185a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jan 2024 00:25:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704702325; x=1705307125;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KZTv9nbes+UUv6ydUaDBh+0jRRVdETkIFavswDy7m5g=;
 b=WEn6Fpuaa94vRCSsDnDNoTNNdVSCXSNG41h5YzQjp/DKlgLYdzLaU7ONFP+/G8U4XM
 j+uTomxC+BZe+Udv9SnOEQSfRUyrgJbNpGSUtpPQoSPEPIavzL6Suty9izEgTp78tmu2
 /BqwKn06bE/E3RPA3IcZp30OrNbXAs4sC1+nzNsMyS29P9lSAVysDcwlDM7vyN9aYhJG
 fr46RbtZE2rvXRSWgaKAbbhiWikjqJ8hHOtkyd9MUxoEs8IbVaAyBxankbOVuJ/mSih5
 Nx7FK+gRDuxXp4T6XKCBgr+o6aq+41foCq67yr28XoSHgp/j5MSBBw6509v/RkSEnWiv
 oEBQ==
X-Gm-Message-State: AOJu0YzQFqD8lhpGsw/dWIlTprJflu3tWBFJeNJDKMwWnoJG8OZLagIe
 66dgusrvuz6kkbq2cYidLrUG0hkNqYzdRrbuRZnXwJc4XotnbbS2ul0glOQ1QEQwjXP4ax0R3jP
 lF70xzUXTjlNu9MzMXF8aJqJts5pPYyWTg1DN
X-Received: by 2002:a05:620a:288e:b0:783:c16:7a16 with SMTP id
 j14-20020a05620a288e00b007830c167a16mr6043904qkp.1.1704702325678; 
 Mon, 08 Jan 2024 00:25:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfw9fsaBrvtnrSiGzHe6+3DxQpSVdE63JJD/cnb6iJsbp5EFyBmCe5Ck8H1SRExu3t2tyTDQ==
X-Received: by 2002:a05:620a:288e:b0:783:c16:7a16 with SMTP id
 j14-20020a05620a288e00b007830c167a16mr6043890qkp.1.1704702325367; 
 Mon, 08 Jan 2024 00:25:25 -0800 (PST)
Received: from pstanner-thinkpadt14sgen1.remote.csb
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 c28-20020a05620a135c00b007831a3aaa0bsm1087803qkl.110.2024.01.08.00.25.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 00:25:25 -0800 (PST)
Message-ID: <3d0e251f0d58f1f8266074973644160d831fa462.camel@redhat.com>
Subject: Re: [PATCH 1/2] platform_device: add devres function region-reqs
From: Philipp Stanner <pstanner@redhat.com>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Date: Mon, 08 Jan 2024 09:25:22 +0100
In-Reply-To: <5k75ed3czl6rqzkykl7xc4dbyih2frunoor4ypfqxx7yzfs2vd@6ieg4dewtgxf>
References: <20240105172218.42457-2-pstanner@redhat.com>
 <20240105172218.42457-3-pstanner@redhat.com>
 <5k75ed3czl6rqzkykl7xc4dbyih2frunoor4ypfqxx7yzfs2vd@6ieg4dewtgxf>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: David Gow <davidgow@google.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

On Fri, 2024-01-05 at 20:11 +0100, Uwe Kleine-K=C3=B6nig wrote:
> On Fri, Jan 05, 2024 at 06:22:18PM +0100, Philipp Stanner wrote:
> > Some drivers want to use (request) a region exclusively but
> > nevertheless
> > create several mappings within that region.
> >=20
> > Currently, there is no managed devres function to request a region
> > without mapping it.
> >=20
> > Add the function devm_platform_get_resource()
> >=20
> > Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> > ---
> > =C2=A0drivers/base/platform.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 37
> > +++++++++++++++++++++++++++++++++
> > =C2=A0include/linux/platform_device.h |=C2=A0 2 ++
> > =C2=A02 files changed, 39 insertions(+)
> >=20
> > diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> > index 10c577963418..243b9ec54d04 100644
> > --- a/drivers/base/platform.c
> > +++ b/drivers/base/platform.c
> > @@ -82,6 +82,43 @@ struct resource *platform_get_mem_or_io(struct
> > platform_device *dev,
> > =C2=A0}
> > =C2=A0EXPORT_SYMBOL_GPL(platform_get_mem_or_io);
> > =C2=A0
> > +/**
> > + * devm_platform_get_and_resource - get and request a resource
>=20
> This function name is wrong.
>=20
> > + *
> > + * @pdev: the platform device to get the resource from
> > + * @type: resource type (either IORESOURCE_MEM or IORESOURCE_IO)
> > + * @num: resource index
> > + * @name: name to be associated with the request
> > + *
> > + * Return: a pointer to the resource on success, an ERR_PTR on
> > failure.
> > + *
> > + * Gets a resource and requests it. Use this instead of
> > + * devm_platform_ioremap_resource() only if you have to create
> > several single
> > + * mappings with devm_ioremap().
> > + */
> > +struct resource *devm_platform_get_resource(struct platform_device
> > *pdev,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0unsigned int type, unsigned int num, const char
> > *name)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct resource *res;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0res =3D platform_get_resourc=
e(pdev, type, num);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!res)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return ERR_PTR(-EINVAL);
>=20
> From devm_platform_get_resource I'd expect that it only does
> platform_get_resource() + register a cleanup function to undo it.
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (type & IORESOURCE_MEM)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0res =3D devm_request_mem_region(&pdev->dev, res-
> > >start, res->end, name);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0else if (type & IORESOURCE_I=
O)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0res =3D devm_request_region(&pdev->dev, res->start,
> > res->end, name);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0else
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return ERR_PTR(-EINVAL);
>=20
> So this part is surprising. IMHO your function's name should include
> "request".

Yes, that sounds very correct to me. I'll address that in v2


Thx for the feedback,

P.

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!res)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return ERR_PTR(-EBUSY);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return res;
> > +}
> > +EXPORT_SYMBOL_GPL(devm_platform_get_resource);
> > +
> > =C2=A0#ifdef CONFIG_HAS_IOMEM
> > =C2=A0/**
> > =C2=A0 * devm_platform_get_and_ioremap_resource - call
> > devm_ioremap_resource() for a
>=20
> Best regards
> Uwe
>=20

