Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB0BC71BF0
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 03:00:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4849510E6C6;
	Thu, 20 Nov 2025 02:00:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ISQnHMIC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8122310E6C6
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 02:00:40 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-2953ad5517dso5299565ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 18:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763604040; x=1764208840; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OQcuoAz23WpocvtldfJ8/bl7lxVQqCC9oq0uQ+NIqfU=;
 b=ISQnHMICKF8FwiLhwHGsJV7OaYHgC6oiB7HDYLK8FHebRt2Na9p4oHXS+9zfJoBYLD
 oTrCi4KfhVaBtSZqwgoll2gHPvHnMMA6KhPU5roEKDafcY/aey6dUyc611HyrxG4DXKh
 SwZO264fr46Ityp0tLbi4LpUaDbwCHXJy5BAj7EUgGm7kxEaE8VDBkWYTy/H0Ymi/tTr
 tFkwq9FelF5fa9niKVhxQEtp4lDJ3+wPzLJLAw/2XE1EHCcXPnkJTwTL8fsIYJO+glZ+
 /NSWrPh6oZZaOzgzTHoIdAudwrhNsmVNCEJVc6lw2P6hF3ZIoRbXB8XrU7j8mSTF4yW6
 Enrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763604040; x=1764208840;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OQcuoAz23WpocvtldfJ8/bl7lxVQqCC9oq0uQ+NIqfU=;
 b=ZQ8e7wxwyLIX2EgsRWwOHbejpVkcXXgtQOhGTz2ixQK9RywpMeCOZrwiH1qs75btjD
 d1OzJCtlkBrhkCOHzIwL/QQNBmiX13nlFZsR3JmDSUkyynmAZzHGfyOIp4gRgM8M9oMG
 vkbMaS6NHp2C94EJXjz3CiZ/14nbN9Jw9tBvse1ITlgZm9dFvMG+GV/shSj0EIFfhzrB
 8ame+HA0hBK0dcgT1YOmcuoyDoWr80uL2sly9TnUAohAuzqTaeujyMHvREsZFaVdRkiT
 OzwozWq9EwT8RIpIbM9IFCdF84rPbF0glRohdpS3H3gUh2rm5Xsg4QHuOzPjkyh+0sHH
 QCdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaItwPH/yisl8y5/pKrxGZC6z4UbcZ81qyG85RRd7grIklKJj/rFl3HesXYMLhpDYHGiVxu2woFU0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSrZJrjo21KHFef3HnpBcwI9T3xJvq6wJRtFvyHV19p9yaUhgc
 o/bdSgqFVfk9GbC5KYAILvlHfrkvF7uZ3Uuq4eIy8z8w/Ad7MBTvPviphkfrJSRqW2U=
X-Gm-Gg: ASbGncurFJywjIuh8KC1nxwHW5CFnyp9LGkN+YCcXejBZQ+qNWLIK3DFus8DGEvD/jq
 q1e0xCgZR4rVeBakPrGvq1Xobce24zdY0lnoIuFFfczJIw6i6hmuGDgsz1TBpMPBQ8tKSS8zWmO
 NjVwur3ph6aZSKCMZAlHZwKlagrgT+4Tbzt9XbiopL5Iz1py0JtujYbDK3C56ZnNx6erGDKogi/
 enCQhPD1yUqZjUk7XLk50HxzRrLAZ0fQwJvGo0hd//drWPE4rJR0VaunPnwSMbyF0HiutVDGBDh
 QnxWGuFhCgsU5PjZp3fxe9RKjsmEEM7wT1Vu9RZ1gSp7yJEm+7Tf8PhswIcC1wspQPWXAfI/a+7
 SIzX1Q/X0cuZE/OzdLBxgt6ZGJ/cBLvEaGNhGgm1e/3ULU8TvkXpq75kXmE7juZ3AhkplI0iytD
 zJVuU4AUUqwNGMfnkusTjSzQ==
X-Google-Smtp-Source: AGHT+IHbQpZ2+q/mt2pG/ILLx4gaK6yXqgLuFmD5Z95sVYiEfYeSMAmpOaLjew6k6ZZsgyXz9DZ9kQ==
X-Received: by 2002:a17:902:d48f:b0:295:b46f:a6c2 with SMTP id
 d9443c01a7336-29b5b0f69f8mr17191765ad.37.1763604039731; 
 Wed, 19 Nov 2025 18:00:39 -0800 (PST)
Received: from archie.me ([210.87.74.117]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-bd7604de9f8sm745297a12.19.2025.11.19.18.00.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Nov 2025 18:00:38 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
 id 37D5041E8D3F; Thu, 20 Nov 2025 09:00:36 +0700 (WIB)
Date: Thu, 20 Nov 2025 09:00:36 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: jim.cromie@gmail.com
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, jbaron@akamai.com, ukaszb@chromium.org,
 louis.chauvet@bootlin.com
Subject: Re: [PATCH v6 00/31] drm/dyndbg: Fix dynamic debug classmap regression
Message-ID: <aR52RD4VzizjHYvT@archie.me>
References: <20251118201842.1447666-1-jim.cromie@gmail.com>
 <aR0e0rgrdXWIo8nI@archie.me>
 <CAJfuBxzGKFu9Xd4PhwuBOoEV5uKtrrzeXD9MKLpDAjZL3UqZQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="eQYtkkk89qwvMXZE"
Content-Disposition: inline
In-Reply-To: <CAJfuBxzGKFu9Xd4PhwuBOoEV5uKtrrzeXD9MKLpDAjZL3UqZQw@mail.gmail.com>
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


--eQYtkkk89qwvMXZE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 01:12:08AM -0700, jim.cromie@gmail.com wrote:
> On Tue, Nov 18, 2025 at 6:35=E2=80=AFPM Bagas Sanjaya <bagasdotme@gmail.c=
om> wrote:
> > What commit/tree this series is based on?
> >
>=20
> this is on top of v6.17
> dynamic-debug has been unchanged since then

Pulled for review, thanks!

--=20
An old man doll... just what I always wanted! - Clara

--eQYtkkk89qwvMXZE
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaR52PgAKCRD2uYlJVVFO
o0wTAP9AuaGfzeP05q1sYeHwAK2Pkh6gP20G6vUnmUplaQr2QwD7BjlW8Yr9GJRL
dTTDfGRSr3ef0dajQbJcha4apdv65QI=
=O/37
-----END PGP SIGNATURE-----

--eQYtkkk89qwvMXZE--
