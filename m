Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CD18BCD61
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 14:05:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 940BD10E42C;
	Mon,  6 May 2024 12:05:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="d16nK9/G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3200E10E1BC
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 12:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714997119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wg4P/Pbqq/XpQKnqNmu961tyb2/1PRVK/1FUHgvoSas=;
 b=d16nK9/G9Ue3qNW3Amd5xbym1rD34Qp5PI8lnNlmSrPjRMKMMB6RaKFPyX1RCba+eT0qq5
 YLPAR3bJ62zoFRp0sdQhoRXa9JeqOKNCjG+ipRhqYvRiyI9wQVc8O/PUVlcRIcFDR7s3E5
 5QGQhTCjYEQ8o5uIuMxqasoUeixMoBM=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-151-TGT3a64eOaK3JG_JKyd0lg-1; Mon, 06 May 2024 08:05:15 -0400
X-MC-Unique: TGT3a64eOaK3JG_JKyd0lg-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-51f7929bc5fso1360408e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2024 05:05:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714997114; x=1715601914;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wg4P/Pbqq/XpQKnqNmu961tyb2/1PRVK/1FUHgvoSas=;
 b=iQNUR65svdsw/iUsgwQ482CbXHdcEUpuicrBnpMd1wqF3hRmYX44e2glANR/WkVmv8
 SzJCM4nmJPE23CgfvkYb/NCfFBNjeZg+FRKXK9IMfQUHNLZuSPax1es1obg3dYD1OvaJ
 w6WjjO5UAcqKqVzscH1goQAVpgkXk/z9SMLt6qRjSIIU3H8xv5AIT9rtLKX3RipLC/uS
 VzbQkcoF2Vnhb5iQzHUy6GLAQwkkKgdqAtpnaFfBHXcQTyVLvOtQ0CivstPUmwaBDD1e
 UI78eslLBwfzZQNjHerho58WNBGBjiLP3alF/0e/ag/y7AyQ25LoqPEamLTeFckFo5mM
 72ow==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpuGa3wDrRJcU3mYa8Gsl4Avgadah3+Rio5DBmGtl3osK3UgD40TEhv6cIbqoUVOIxrLq6yY246LJkfhD8B2ivE73HG5T0TF7Fa354bV4H
X-Gm-Message-State: AOJu0YwUlmECic4+u38O/Sb0q3ynZspe7JC5Ku4nxeATX82YhL8yDd67
 K9h6KTMH0/5WlTY3c5cNuTgQBNUT/2sdyyH2Dyv/g8XdZaBhIdEnT5xUWam7ZaaUlWJBDeL1YQy
 fr+wGFaoDp25p6boX3/8GoAIt//AjKY6quewHXjyhAHCdYrqoJdOCqpDUe45jKpKwaQ==
X-Received: by 2002:a05:6512:3ba:b0:51c:d528:c333 with SMTP id
 v26-20020a05651203ba00b0051cd528c333mr5199771lfp.20.1714997113688; 
 Mon, 06 May 2024 05:05:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHphnXY9iSaGnb+HJd4yfUj7KyxshMeIg/OSpxyANFwIkap9NrMHL6tDBSURF261b7+6kCIdw==
X-Received: by 2002:a05:6512:3ba:b0:51c:d528:c333 with SMTP id
 v26-20020a05651203ba00b0051cd528c333mr5199738lfp.20.1714997112973; 
 Mon, 06 May 2024 05:05:12 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 bh10-20020a05600c3d0a00b0041c130520fbsm15791169wmb.46.2024.05.06.05.05.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 05:05:12 -0700 (PDT)
Date: Mon, 6 May 2024 14:05:12 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Lennart Poettering <mzxreary@0pointer.de>, 
 Robert Mader <robert.mader@collabora.com>,
 Sebastien Bacher <sebastien.bacher@canonical.com>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Milan Zamazal <mzamazal@redhat.com>,
 Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present users
 (udev uaccess tag) ?
Message-ID: <20240506-dazzling-nippy-rhino-eabccd@houat>
References: <bb372250-e8b8-4458-bc99-dd8365b06991@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="gbe3pjich3tg5p2e"
Content-Disposition: inline
In-Reply-To: <bb372250-e8b8-4458-bc99-dd8365b06991@redhat.com>
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


--gbe3pjich3tg5p2e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, May 06, 2024 at 01:49:17PM GMT, Hans de Goede wrote:
> Hi dma-buf maintainers, et.al.,
>=20
> Various people have been working on making complex/MIPI cameras work OOTB
> with mainline Linux kernels and an opensource userspace stack.
>=20
> The generic solution adds a software ISP (for Debayering and 3A) to
> libcamera. Libcamera's API guarantees that buffers handed to applications
> using it are dma-bufs so that these can be passed to e.g. a video encoder.
>=20
> In order to meet this API guarantee the libcamera software ISP allocates
> dma-bufs from userspace through one of the /dev/dma_heap/* heaps. For
> the Fedora COPR repo for the PoC of this:
> https://hansdegoede.dreamwidth.org/28153.html

For the record, we're also considering using them for ARM KMS devices,
so it would be better if the solution wasn't only considering v4l2
devices.

> I have added a simple udev rule to give physically present users access
> to the dma_heap-s:
>=20
> KERNEL=3D=3D"system", SUBSYSTEM=3D=3D"dma_heap", TAG+=3D"uaccess"
>=20
> (and on Rasperry Pi devices any users in the video group get access)
>=20
> This was just a quick fix for the PoC. Now that we are ready to move out
> of the PoC phase and start actually integrating this into distributions
> the question becomes if this is an acceptable solution; or if we need some
> other way to deal with this ?
>=20
> Specifically the question is if this will have any negative security
> implications? I can certainly see this being used to do some sort of
> denial of service attack on the system (1). This is especially true for
> the cma heap which generally speaking is a limited resource.

There's plenty of other ways to exhaust CMA, like allocating too much
KMS or v4l2 buffers. I'm not sure we should consider dma-heaps
differently than those if it's part of our threat model.

> But devices tagged for uaccess are only opened up to users who are=20
> physcially present behind the machine and those can just hit
> the powerbutton, so I don't believe that any *on purpose* DOS is part of
> the thread model.=20

How would that work for headless devices?

Maxime

--gbe3pjich3tg5p2e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZjjHcwAKCRAnX84Zoj2+
dtGRAX9KOFTUx08TR6/BPgCjqz6x5kwTQyME2k4EktSNP9VtdPA/QywEsUKG9cMf
YI+IcV8BfA9X629JAJvBtP5fq6/WotSONpmpfH5NFifseTSPHNkYTsgEh02n5sXC
NsrXhvP+8g==
=rIyT
-----END PGP SIGNATURE-----

--gbe3pjich3tg5p2e--

