Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BDB826B04
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 10:45:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7534110E205;
	Mon,  8 Jan 2024 09:45:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E62110E1F6
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 09:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704707137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tqxtqmVQFTbAQHnUnqvy9W7SxC7kiZQC9RYNbL1/SN8=;
 b=ByVUcC2pBmX1qDlG8+CGLcdC0Jw0bHdAOTMTBC/P48x8VYIp91OU2uyY0+OU9yx21ll2Cr
 G7HbR1XBt9QL2O8wBVLz6MpvsceZPssoKgTweM5pGmNoWLaG4l7niHGNzAjNlngj1rQp2w
 +LMpSznzuvc0b92/2v5eE9jXJI6hV4A=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-496-f0PzqwNXOgqzY0tLlS05cg-1; Mon, 08 Jan 2024 04:45:36 -0500
X-MC-Unique: f0PzqwNXOgqzY0tLlS05cg-1
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4299dfcdc0fso60891cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jan 2024 01:45:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704707136; x=1705311936;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tqxtqmVQFTbAQHnUnqvy9W7SxC7kiZQC9RYNbL1/SN8=;
 b=VouG06M090Dc/AKy3NglmPLHMHPTzCYoAWwQE3Pn6Rt91F3PnzrUpV1Nmfhg4cmvmn
 aptS/6IqLW5t+IjmZN/LaC7hTWCMITuyRai5zZbictjD6aApXk6yB6ur+E8Os3iLJWtZ
 2I/76S1cvpqxMrulCeirgrlKQmHir2jmNqVphY6ez94ZReyCl2yXjO22fzXDrVm0TwPw
 rWN89nGeAY+Cfo1SpmsfgAgFKLIDwGIN4pkiIlXrletJplA0h3b9PLXujiKmceT+N7Xr
 VEhDipZTjtixwRhQlYVhUIwZvG29n0fuoh9xGbFVaXlPZU99fpQqqmH8XLjZvxasGqFM
 yS8Q==
X-Gm-Message-State: AOJu0YyLqLjAXiI/3xrslpJ2lUYv+lNXcvSS/K4y9Uc5Qa6pO+jys1OH
 V4VNm4GlY0ftK/THKiQqZA49+6qQ2xdhQuOkI9CjYZ6M5dYDvrrDIBsIxTADvq6qE6s8VACsm4w
 hPF+CE86nsQsqz9wTKBwE9mzoiFlYEHyAyH4W
X-Received: by 2002:a05:6214:f29:b0:681:7ea:793b with SMTP id
 iw9-20020a0562140f2900b0068107ea793bmr1815929qvb.2.1704707135706; 
 Mon, 08 Jan 2024 01:45:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHF8vpbq+ypVZASjEe2WryjdgrP22ZWA/dGlza8qOORveTvR0ZxEbRZuAu7U0tcbTm1kEaxvw==
X-Received: by 2002:a05:6214:f29:b0:681:7ea:793b with SMTP id
 iw9-20020a0562140f2900b0068107ea793bmr1815902qvb.2.1704707135434; 
 Mon, 08 Jan 2024 01:45:35 -0800 (PST)
Received: from pstanner-thinkpadt14sgen1.remote.csb
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a0cff05000000b0067f635da89esm2724421qvt.124.2024.01.08.01.45.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 01:45:35 -0800 (PST)
Message-ID: <404aea6b7bb7874064153044f04f3b8f6fccb97b.camel@redhat.com>
Subject: Re: [PATCH v2 1/2] platform_device: add devres function region-reqs
From: Philipp Stanner <pstanner@redhat.com>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Date: Mon, 08 Jan 2024 10:45:31 +0100
In-Reply-To: <hywkbwwwkddbd5vye366bhz64dlpet4chv3kzwfu5dx6rvvix6@2jnk3xx6vfiy>
References: <20240108092042.16949-2-pstanner@redhat.com>
 <20240108092042.16949-3-pstanner@redhat.com>
 <hywkbwwwkddbd5vye366bhz64dlpet4chv3kzwfu5dx6rvvix6@2jnk3xx6vfiy>
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
Cc: dri-devel@lists.freedesktop.org, Fabio Estevam <festevam@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Mark Brown <broonie@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, David Gow <davidgow@google.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2024-01-08 at 10:37 +0100, Uwe Kleine-K=C3=B6nig wrote:
> Hello Philipp,
>=20
> the Subject is incomprehensible (to me). Maybe make it:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0platform_device: Add devm=
 function to simplify mem and io
> requests
>=20
> ?
>=20
> On Mon, Jan 08, 2024 at 10:20:42AM +0100, Philipp Stanner wrote:
> > Some drivers want to use (request) a region exclusively but
> > nevertheless
> > create several mappings within that region.
> >=20
> > Currently, there is no managed devres function to request a region
> > without mapping it.
> >=20
> > Add the function devm_platform_get_resource().
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ^
> Still the old function name -'

ACK. Monday morning...

>=20
> Other than that I indifferent if this is a good idea. There are so
> many
> helpers around these functions ...

Around which, the devres functions in general? There are, but that's
kind of the point, unless we'd want everyone to call into the lowest
level region-request functions with their own devres callbacks.

In any case: What would your suggestion be, should parties who can't
(without restructuring very large parts of their code) ioremap() and
request() simultaneously just not use devres? See my patch #2
Or is there another way to reach that goal that I'm not aware of?


P.

>=20
> Best regards
> Uwe
>=20
>=20
>=20

