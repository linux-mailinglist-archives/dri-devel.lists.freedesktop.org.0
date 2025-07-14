Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B3FB03E3E
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 14:08:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42CA310E47F;
	Mon, 14 Jul 2025 12:08:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OZBkJPpS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 492BA10E47F
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 12:08:07 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-32ac42bb4e4so34734741fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 05:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752494885; x=1753099685; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rrTQ1/piU5c3HlEkqsvmHmiT+sRyPTggNbv96TDoEuE=;
 b=OZBkJPpSQpHNjjyGblPIS8h+2kEUmb1mU6eMjPImGwBtOFkyjnFYe8wrJVFMszcgLo
 YldG+HiV0iP9AMpYi9UaiYogH1k/01ySWWH0hQZv/A21ggll0DSZmVg+qWcxM/zqsLoG
 z1N/Pu2L/sxP/MbtHvIsmUn9JoIBKOkpCvQrDquq7TobmRzdTKEmyQVG2GXsS4TqvMlS
 T07A7OUCUbDkCobNAmBgBk+/qIRZHs3qWhOVBFQcpZOO6Y7ku3FvejVkl09JWgvD9ABD
 niInH7+XWLKk52ZtuuoGhYw5hYgJWLMNyO4mUxKcNWunW3wxc6Z27q5CEXK2ti2KD3QV
 JVCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752494885; x=1753099685;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rrTQ1/piU5c3HlEkqsvmHmiT+sRyPTggNbv96TDoEuE=;
 b=gBDyfLxQ/s0iUlVlMNIoUTttlwaJJDEzTB4sYkNQZHwUIfSnUW24udnyeWmElxUFB6
 cCbX44tdmrKOKm43wW659j41U1AYWu6v0JRgZecm9hL9rbG7tbO9hSX1L2ZRPJw8GBx5
 de+7Uq11LGFYkWcS2/fjJUjcglQYmLjP05jJPIixZKcjJ7azp2GzUyHWK4jMXy1AowbX
 v1LuwFWYYEmjqfFSfFPkhUoQSaxdcRXD9hSlGoOs2cr6UI7RdtX3IN7M01CTP7XW99+I
 9B4yV5t4jGIvEXrWm6jcO98IkwZ7QT+JYQiMftcBoP81O/eVR+fRqvN+GKaBNqS2dMCa
 ecdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXllFhQDXpo3f6oc8QTD2I0GHTNUceZh6e6wX61T88RsEMsFII7BtrpBEkZottfI4r468djw5RMjWI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1JTrxDhKoX0RlN+7EExZlivhhSg9t7nSppVex2ag/F3U04EM6
 M5Ch8JYUDEZPaYk3pYqxFVIcYEACOHZfY+01Zt27oex6Xklp+kJmpKGI
X-Gm-Gg: ASbGncv4DpQJKCGefp8CGqhjYnAWTHg+HEYl3K9xlEJ5nbvvSjhaOHuwV5mjAatyYVQ
 Nux1AP05lcDydxe3l4uPdblWHkgY+1bh6KW7XQVK0OaSdc5G6eGhq1P85rW945MhOZ52hUq5Ioh
 FX+5SDw65L2rLa0QNnhA0I9g7AR/tpc9VlInoJ29BlBaErWJFXzGXUjHWSMwk6fpBsielD03uW1
 c2TDp4mmY3Zbw56L/wNE2RhdG+hDdqKSoCAP6ge7k5ZUf27WhUcz61qdslZlRejfuXXYJigifp0
 d0vzuEMF2pCYSj9M7Qh8Gmdv9Qenf9A22szQVbmVbFd+xjQ0E4qrZRq4KcGmVy4QP2PXiA2o6zh
 ohM8p8D21R7tg/j++UgYCWVjfPlYzoOYb6ZpYm8+Ng1A/o8ahtqv+DViAc+sngJyBGRKoRA==
X-Google-Smtp-Source: AGHT+IEzEQDT9SlcMJXRWaUpVIthbB3FTkJ0mV934wHqVQgkTP67sY6GyOX+sERvMFkML4JM1C6sHw==
X-Received: by 2002:a05:651c:419c:b0:32a:81a2:ebb with SMTP id
 38308e7fff4ca-33053293410mr34114811fa.1.1752494885131; 
 Mon, 14 Jul 2025 05:08:05 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32fa29133fcsm15060511fa.3.2025.07.14.05.08.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 05:08:03 -0700 (PDT)
Date: Mon, 14 Jul 2025 14:08:01 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: linux-kernel@vger.kernel.org, ipedrosa@redhat.com,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 3/5] drm/sitronix/st7571-i2c: Add an indirection level
 to parse DT
Message-ID: <aHTzIcxe3Z_j62-X@gmail.com>
References: <20250714104421.323753-1-javierm@redhat.com>
 <20250714104421.323753-4-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4ZunG6Sz0bu+w/YO"
Content-Disposition: inline
In-Reply-To: <20250714104421.323753-4-javierm@redhat.com>
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


--4ZunG6Sz0bu+w/YO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2025 at 12:44:02PM +0200, Javier Martinez Canillas wrote:
> Other Sitronix display controllers might need a different parsing DT
> logic, so lets add a .parse_dt callback to struct st7571_panel_data.
>=20
> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Reviewed-by: Marcus Folkesson <marcus.folkesson@gmail.com>

--4ZunG6Sz0bu+w/YO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmh08xwACgkQiIBOb1ld
UjI3nA/6AhbJzYc14e2kj9qjpjhvgbOUHXl7QmMsJ3Abc63kZe2h1CSouL1ma1on
xVhcpVZTmWnhAi9mtFNdUZ4oaDkUvEuEQDMPC4Ky+nRIl8UIC8MIwH2YGOvv9Nhk
LT9+UmcK0fQSlDGxtTI8v2LHoBMjaJQYYKwrOBO4khDEA8S4nYLnUxF0fVvnbuMJ
SqOLd22GDJMHjGZHPM1a99EAOQDjLS0JYRORQOOljvtKv0bdDpB68TNY+1djaC2D
V13Rl3AXJkBwsQ2QdCKyB9QBdF8fLCh3c2F5OtintxgANurwtM6mTqc71eDuvTA0
yV0yO2APTKZwFBx491C4xqUjjEOxLD3aGErbe8z3czqQ32q0dyDh6WdNSuAX0VGo
l/A0pmxaKCNKZo6Le/DDcaWYWlC42x9FnCIcd7U3J7wZLRGph82bzHiSQizivnX1
AoiZZsro2hAEoxD9rjRxibtuyeSF6H23MTpsey8UP7S6N8P39EE7VeftBp07l/+e
MpX6ZmVf5L8avvtbrT9RKNdcl5LZhA16isAqhGL0/N5tIYgi2kiJD7Kfb14doi38
izpVE+91wWPEXRDc2lxMjAC2pewKB6CwJ0KJRPya7v6/zzMfcApq39fObws9RX+i
q5CM8xY6CGvs2KeF5kVLB3BunhtDMwuI2ZlfvL3/KSZz35EOwyw=
=JGEU
-----END PGP SIGNATURE-----

--4ZunG6Sz0bu+w/YO--
