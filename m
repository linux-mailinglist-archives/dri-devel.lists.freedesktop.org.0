Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A4EA208BB
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 11:41:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C094D10E278;
	Tue, 28 Jan 2025 10:41:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XRXzL/Hy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77FCF10E278
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 10:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738060866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZOl+eQpwIrdLHBYKF3lTvbfellXfiEJhREFnwjWw0M4=;
 b=XRXzL/HyXrnzfWKY4HtkxMCi4cbA+x6UIfQxeXpNTXIxw/jJIKHWUj+hEGfjw3Bk9qo5Y2
 +dDaSJjyRbC56N1zE32iny9kdDkh13uxupbjJ/wNF9BvjfSLkFD1y2Iz4ynmf11728MDbj
 ZQDjI0hmCHbceXJ0B2fmbpbsG9m8l/w=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-EE0XDETmO06hZwSnpL-Kkg-1; Tue, 28 Jan 2025 05:41:04 -0500
X-MC-Unique: EE0XDETmO06hZwSnpL-Kkg-1
X-Mimecast-MFC-AGG-ID: EE0XDETmO06hZwSnpL-Kkg
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43626224274so31307795e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 02:41:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738060863; x=1738665663;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZOl+eQpwIrdLHBYKF3lTvbfellXfiEJhREFnwjWw0M4=;
 b=tg+fJCZC495lUFlTQLq6poRp3XPJm0n6aDAu/dxnZ/lHIHhEgTHq+h+JSghoP6Lud7
 hKuBWI3hTIAlf9kcqz2Jjdgiy0qbYRv2VJ2q7g3Mrkgp5s6YeHlEetopr5ycccGVivIq
 P0NK7afgQSUIQz/5WWvSccpOEPxclBwTdE2FORsWOk8EsJMdggI7qRRJ0/BizhIYbYas
 svem+aQJMFo4+EzAnHz1JmaLuVsef0GJryO5CCgj92PcJisJqm9ORDDWTgBgNP5YR2Kh
 MVVPDXN8u72HDMCbTwECo0Kjbs8InX89wlCm2zNi7082REWdHCnL3w2k37zWPdHCvEmH
 3YGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIOZ2ZJXFIaZGcIir7Cide+s/aHbMmxdJdUx1jY7ft7GL4dTcPjyuZSOvbwhabb6SQHST+oVjuHp4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqvpMVKXPTGx/qu1uJOtqi5FXWv2NNcHGG8Y1//lYYKSGVBP2t
 Owiprjc50JoI/RV8l92nAWYibgs8SSZFNYZFl1hiwYoREkD55Za9YAq0vuZTkHPZ7A7/9ylIE2l
 IKAD8hFDAdswXjSEGfFjpwP4AiO57UdY0H3lmoLCQuYngMMgHLvE+zT22IbEn5iMzBQ==
X-Gm-Gg: ASbGnctYXxjap26WYciJdwQhVP2IBn9988lcBWhOPBIsewC6yQsxbEcpe6WhKFWQ6HP
 tqQYqxa4TtG+ZTf7y7Vmh9sQIt90TT4nNKEr3WWVMlHw/Vq1YUDh0LO8pV26O1tmxQk+djIwSze
 6oKfHKKN8QuYor3n2pxWbsKV6ToZ9CSbu1gccDtvFrCpdoBpKIglaZyaok4FoLLAMRSFpp0Ksox
 wbY2BMLd7fZ2rcUvjvvaKLyNljVpug4Li/oRIsQR4wUmjIPME4D9xN3r6uluj+C5LCWZJZ2kqBI
 9g==
X-Received: by 2002:a5d:64a1:0:b0:385:df84:8496 with SMTP id
 ffacd0b85a97d-38bf56555cfmr41944327f8f.3.1738060863409; 
 Tue, 28 Jan 2025 02:41:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFhAGXomgjS5oC2hRgWmOZgruVAFJJ6uLnpnviIihUjKOIMMVZQTuHLNhTQFbcQClr3d9yJWw==
X-Received: by 2002:a5d:64a1:0:b0:385:df84:8496 with SMTP id
 ffacd0b85a97d-38bf56555cfmr41944304f8f.3.1738060862996; 
 Tue, 28 Jan 2025 02:41:02 -0800 (PST)
Received: from localhost ([195.166.127.210]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1bbd93sm13793498f8f.76.2025.01.28.02.41.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 02:41:02 -0800 (PST)
Date: Tue, 28 Jan 2025 11:41:00 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, 
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Update drm/rcar-du maintainers
Message-ID: <yvdba4secotjc4xvyophckuroywx6nv35kusdj3off3dsrnxr4@7buakt7wvten>
References: <20250128-rcar-du-maintainers-v1-1-c429ca421c52@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="fmcip3tqxlxceqwp"
Content-Disposition: inline
In-Reply-To: <20250128-rcar-du-maintainers-v1-1-c429ca421c52@ideasonboard.com>
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


--fmcip3tqxlxceqwp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] MAINTAINERS: Update drm/rcar-du maintainers
MIME-Version: 1.0

On Tue, Jan 28, 2025 at 12:28:48PM +0200, Tomi Valkeinen wrote:
> Add myself as drm/rcar-du maintainer. Switch Kieran from a maintainer to
> reviewer.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  MAINTAINERS | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ed86d884ee0d..5b1bf5fd56fd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7760,7 +7760,8 @@ F:	include/uapi/drm/tegra_drm.h
> =20
>  DRM DRIVERS FOR RENESAS R-CAR
>  M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> -M:	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> +M:	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> +R:	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>  L:	dri-devel@lists.freedesktop.org
>  L:	linux-renesas-soc@vger.kernel.org
>  S:	Supported

If I understood right that email
https://lore.kernel.org/dri-devel/096e85a5-30d9-4b53-bdcd-a70cde6baa4f@idea=
sonboard.com/

rcar-du is now de-facto under the drm-misc umbrella. It should be documente=
d as well.

Maxime

--fmcip3tqxlxceqwp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ5i0PAAKCRAnX84Zoj2+
djKLAYDWB0cOYJctbYZ69P0K6ttt8S4aQT2ykugYrOrdCCC1E8UI0imexRac/X/O
k6UO5E0BfR2bwQaSeFTD1qEBvWRdrlCjlFFSTO/xW2xr3J6qQU4PLWUsC9iPeITU
s+/XFRAeeQ==
=ZfXR
-----END PGP SIGNATURE-----

--fmcip3tqxlxceqwp--

