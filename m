Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FC8B03E33
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 14:07:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF21110E06A;
	Mon, 14 Jul 2025 12:06:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jvhQTIBW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9168E10E06A
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 12:06:58 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-555024588a8so3761865e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 05:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752494817; x=1753099617; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=btwac0BtZLdtrMNOqtTVqB8u6VGbkgwcCfy4SiDo2nY=;
 b=jvhQTIBWk43WV1hjkXjBEtXLuYcUBwec9sCBs6IovsnGpNHqCzi++cQRkp/pXDeu2S
 JZbiQcmNmvuXJkrjmOMurLGmhuvkL1DNOhaP3gUn8BN3Co4IEuXhpZ2jXzezM3GvQZBW
 anw+QgDfLEP4+ht8Fo/VL96w0+LUkpAjBLwVXK333RMjMoIAzKVUt/lSutZzRUf8S6oE
 0DqnzdZwmqNuYQYZT19JvjZaOgucMOuhSyScZNSX1lZbCKkIJvHBgIMeTIRJ8QMmpnW8
 o6j34yRJs9bG3YgyI6IrsuZkfVI9EMUJTuOIkCJqkJ+NA61opQpNIuCEtTlxzNx1Ls2n
 tTJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752494817; x=1753099617;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=btwac0BtZLdtrMNOqtTVqB8u6VGbkgwcCfy4SiDo2nY=;
 b=mZ5YoWKZ7DEgyuHXPKrbZAGCcNSDQgTS60x3MIB0ICU+ZAJLD7lYOcazWGy4y6GxIE
 AqirLsrpWBWo7zKDySk9tnhO+1Za/A1Xf0asRT9npedXvRJAsbKZ0QvbvTj8dh0+18Ot
 CnclpaWcj7rg1m4B6bGgWQjdYZx++k90olPTFwBxtskokHm4tRf+jhOL8uuKXn7oFdX0
 GhNBUC7DGo0ruufPnrfE3oJKE5q10+QEZ1NzFHjV3XsVVsjx3L7jJrOWsbjWa8XnEgWW
 d4NsiS1ZFsr1JllCZjQjKsP4oF8NtfqbP+PB61OIKeZ0dFutTSumV7yWgJEaYMJo/NK9
 AnRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4Wh8KywHlXVw1LpOeLV03EWOdahdD3zNyw13es6AwzJ9k3xgTy2FAUyQP3bztOzo1o49hH3aCX7A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdqaL0czB9L0figynW+ed+5S7VpxuWPO4sciXT3Jm97W85+tIM
 vKgSW/espeImjsZO0oKZx5LUG0lhSGJZ196iE9JFxakuqBSpKXEEbcop
X-Gm-Gg: ASbGncuKAZ/7sWhAMthJ1uGoD4EgjuXec+LX87J0nDjTY58xyYCpUhJCd8JJEBTZ8Zz
 oi5tTdhDMMgldLkhJOhTmDE0g14Rh2T2+izQAcGHIPPKJHg/JFTSvjpckLBfcl/Y5qb3JlhynYW
 n94ClSUUfvb2qFAip4vjdUXWq+dUh9LXqtd/dBVjkrUdj+Wlz29VkyI3M2gj3Q8z55gUlIdn8Jo
 LEcNSIQjU635mkM3WFEMeX8HXgJmXvQ0Yt8TaC3xLjPg+4AVAfV5utkn7vGaGLQiIjldxWIJMXu
 UXJBZz1W4E4aOqKOaNDfs4rr+F0tWQ5si+E9/JwOL7olRcuk+SujwKbTyx7i6jMXjDCTEiPEYLC
 9M1eaGB9VzcMu3QRLEtw2unuChj7cIDqnyYLh09oCygBSNlMtVGtQRBOgKPo=
X-Google-Smtp-Source: AGHT+IGaAzeCNW7Q+hF8O+o801w4IIYVn/OnyZ8n0KIX+S8TZTFaXkE3VXSDB+lDfrzEZMLDYey6ZA==
X-Received: by 2002:a05:6512:31c6:b0:553:37a7:b217 with SMTP id
 2adb3069b0e04-55a046039e1mr3818518e87.35.1752494816696; 
 Mon, 14 Jul 2025 05:06:56 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5593c7bbb16sm1915901e87.11.2025.07.14.05.06.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 05:06:56 -0700 (PDT)
Date: Mon, 14 Jul 2025 14:06:54 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: linux-kernel@vger.kernel.org, ipedrosa@redhat.com,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/5] drm/sitronix/st7571-i2c: Fix encoder callbacks
 function names
Message-ID: <aHTy3tbDKA0QVqBt@gmail.com>
References: <20250714104421.323753-1-javierm@redhat.com>
 <20250714104421.323753-2-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZntHvysbNzK599cl"
Content-Disposition: inline
In-Reply-To: <20250714104421.323753-2-javierm@redhat.com>
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


--ZntHvysbNzK599cl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2025 at 12:44:00PM +0200, Javier Martinez Canillas wrote:
> It seems the driver took some inspiration from ssd130x and some of the
> functions (encoder callbacks) were not renamed to use a st7571_ prefix.

Outch, shame on me.
>=20
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Reviewed-by: Marcus Folkesson <marcus.folkesson@gmail.com>


--ZntHvysbNzK599cl
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmh08tgACgkQiIBOb1ld
UjLl5RAAvKkGSF3gPiEDW7asxdOXyyZ0FyIF9ZcOqQS32YWD4+QvYmLqkjSw7O1l
39arEYVQnwmJavO1EMrOY9hyuUoWb1Hkf4LhV6f/qCZrE4pT2aiJdOf+YUnNH+ee
mVNew2FDhiuo/QFK7Dz7Ffxnse9g/c/mKh7wsiqTIwi5mcbiBIgVAaLzx0C8/BDa
Q8htxvkPWqqauAIP2KE5KznUXDaJp9pK97ljG1m61RgqGUUFGPKrLNkqR5t1jDSU
udnSYqJ7dLCOB/OPFTj2If1QEevMnBZjvnKmYoS9V2UJuFV8AfmiROxfU1ckeIeF
YzMy8MH9z/KeGQh0lDVpJk/xbYpZBWCkvMdQwbHBDDbsTMzMA0mkXpI2MsVv2Z9l
n9NQYdVyzGkuyJwYCNZ/NI0+IuXz3hIB73qwO0G+tfSjMUo7SqBto0hqSDMtB8mz
kTha2puNp9ovLMZ52l0EATnNpRfx8GdW/WKsfzEMpypv/Q1cxjeCqlb0OWvuxjEn
ZtatPZ0SMspbkC96IwCjVHYdMk1g/jSj/t1QLk7A6MCwtYkQRxvn7+BIhUqpYxlQ
YTVj0nxDIOvnOxghxX8bWP9GsaCWrFXG8ay7jtXvRN7Q7JKs9IYnZQwCMjdLiw+F
GRzbdR3VXecn1I+INYamQ4m6bPA4Zn8a30g88Bkd1EvFUGGndLQ=
=5E0a
-----END PGP SIGNATURE-----

--ZntHvysbNzK599cl--
