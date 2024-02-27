Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC590869FC9
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 20:03:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63F8510E97D;
	Tue, 27 Feb 2024 19:03:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gKOlvtEs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBB2710E97D
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 19:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709060621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HteyjMkx6tj3ghvatzD33ynQg3T6Y+2uPcpg5I+aJ5w=;
 b=gKOlvtEsmIjcDW1g6Un/49ymR8EYwBVWLUBHqYW6cIqK4ktiaQgeruzYNHuO02/pLbcke9
 dCnSqJtvlUxVQzjgOi2JQA5/07TFgnyOXVQMBi1uFOOOsuG3OK+xorMvOdTnnHYrPsRYiE
 xeqV7bDEW6y1J+3PMvAlti4qwp2MJ1k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-237-lwmS_w60N26vIVSYwONzDQ-1; Tue, 27 Feb 2024 14:03:39 -0500
X-MC-Unique: lwmS_w60N26vIVSYwONzDQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-412a44c72cfso20136685e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 11:03:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709060617; x=1709665417;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HteyjMkx6tj3ghvatzD33ynQg3T6Y+2uPcpg5I+aJ5w=;
 b=bInClVKeOGyDJs7MmprN43dKORnXt833jemb/LxSF/XE375RaY1eVTXIQ46LL4PONF
 XaQJ9vE1KvNkiRf1ntxdzkn/zgMXJIDkAEh0fpmt8jvQuNGqvkD8z+WuaXWP8udmlWoC
 zg0xdXlwHENVii92RQZA5M1rxhITkDMuODQtQIKDV1STg9uaDK9srJ5U96JXZcDcHtj/
 quSuSXsV6hX+04DrPtt0yu03YugYIUULBSWd3fcFzE/voRyoaJQO84dfZAMvlCieFwa8
 04KalizHMoay+/1iCmBn10YpXVc8zGXUoURvR9N+WPAouMYgkRAKCwzsJQ9dh9o9gpTj
 wkHQ==
X-Gm-Message-State: AOJu0YzcsXSRAZrOcTTs/Mfj0dT8z1BsS53BMUBQEq1uTP8j4NaerW1t
 k5qJnDs22GhtjeM8hHALgLG5SDGoKlj3YIcOoLlEL+FdE/PTLyztK0ZACh0GingFEtGyyeBu8AL
 qxuC5V4NcRuARk/riCkWaXFcsp1hHn9qz8RWgHQ5fP1NhKJZNuxrOF0XC0WGYrb9Z6HuLhWmrew
 JFIy8qx8oeeHK+6WD7CRZUpSK4eE9qtBHmKesqwk/MaDvYDV17
X-Received: by 2002:a05:600c:a001:b0:412:a47d:1fc2 with SMTP id
 jg1-20020a05600ca00100b00412a47d1fc2mr5105095wmb.4.1709060617714; 
 Tue, 27 Feb 2024 11:03:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+Ex7h+yGZlwUvK892faEIlzlgEv3foLT06MJ6VSUt6GPAbXrroSkZO8eCOdhjiCpildf+aQ==
X-Received: by 2002:a05:600c:a001:b0:412:a47d:1fc2 with SMTP id
 jg1-20020a05600ca00100b00412a47d1fc2mr5105078wmb.4.1709060617354; 
 Tue, 27 Feb 2024 11:03:37 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 s20-20020a7bc394000000b00412a2831806sm8815354wmj.5.2024.02.27.11.03.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Feb 2024 11:03:37 -0800 (PST)
Date: Tue, 27 Feb 2024 20:03:36 +0100
From: Maxime Ripard <mripard@redhat.com>
To: dri-devel@lists.freedesktop.org, 
 Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>
Cc: Daniel Stone <daniels@collabora.com>
Subject: Re: DRM Migration to Gitlab
Message-ID: <dpfgauil5zvwkmitksv4qxa7vckl46ipp4nfpuzpgwi53j6oby@f2fcg6yj7l37>
References: <k555c7lj3mcj2skzrmc2ywxzz5ndtdgfpitw7fftdlyjjpmfou@7maudk3vdxuf>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3bmnhzoyi5w5ay3f"
Content-Disposition: inline
In-Reply-To: <k555c7lj3mcj2skzrmc2ywxzz5ndtdgfpitw7fftdlyjjpmfou@7maudk3vdxuf>
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


--3bmnhzoyi5w5ay3f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Feb 27, 2024 at 09:16:35AM +0100, Maxime Ripard wrote:
> Sima, after becoming aware of the drm-misc transition to Gitlab in the
> next couple of weeks, to do the same for DRM today.
>=20
> This is now done and all the various bits (nightly.conf, MAINTAINERS,
> doc, etc.) should be there.
>=20
> If all goes well, the only thing you'll notice is that dim will complain
> about the drm remote not having the right URLs.
>=20
> Any dim user should update the URL with either one of the two following
> commands:
>=20
> git remote set-url drm ssh://git@gitlab.freedesktop.org/drm/kernel.git
> git remote set-url drm https://gitlab.freedesktop.org/drm/kernel.git
>=20
> And the rest should be transparent.

So, it turns out it wasn't.

With the help of Lucas, Jani and Sima today we rolled something that
will convert anyone that hasn't changed anything yet automatically. The
only thing you need to do is run `dim ub` *twice* and you'll be prompted
to update the URL on the second run.

If you've followed the instructions above and got stuck somewhere in the
middle, you can get back to the state before today and then start over
like described above by doing:

cd $DIM_PREFIX/drm-rerere
git checkout rerere-cache
git reset --hard 044940a15536

cd $DIM_PREFIX/maintainer-tools
git checkout master
git reset --hard 0c154c094f54

cd $DIM_PREFIX/kernel
git remote set-url drm ssh://git.freedesktop.org/git/drm/drm

dim ub
dim ub

Maxime

--3bmnhzoyi5w5ay3f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZd4yCAAKCRDj7w1vZxhR
xTRKAQCnphgqrfCa3V5whpdP5YaVMvTSQaGNtxSp34yhbOC/OgD/bTiCegon/Wo2
NX53dPS7xqLomJ29q299pBYrykJbiQ4=
=Ak4F
-----END PGP SIGNATURE-----

--3bmnhzoyi5w5ay3f--

