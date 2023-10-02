Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B07DB7B5085
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 12:42:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0466410E03D;
	Mon,  2 Oct 2023 10:42:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A41510E03D
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Oct 2023 10:42:52 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-692c02adeefso10363909b3a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Oct 2023 03:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696243371; x=1696848171; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GMI92IRtHLN/QzcAW884cPXY3nDWtnrgER4ifF4JNpE=;
 b=NI7G2uIxL+U12eGAoBp+nX7GEGndAbaKJv2gt5fO07u7VoxywBUhkwjtz4o5wn7Fvi
 BU/47+lxY35gGdrZqTlUK7LxNiBAf4FFi60/cldcdqSMd8VOmeVZekoqtXnhDguKlqVR
 +rIJbI778HOZ+CpIbIVR7szUXQ0UkJVkDF/x7a7dxIP1srwf69b6+kER4GhB4s9p+jqs
 WsVP2vXZ7cxSPiT4OUTfsNXelz1Cr7U+96n/FYjt+4PfY5wBvmMm7l3mN2nJDWyVi1A4
 PuLtod4uDF5SeJTf2tsdl2L3iPqd8nMBeZKvxwQHWziHNMvCUJUtQED31WilCUPTJB/3
 ugFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696243371; x=1696848171;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GMI92IRtHLN/QzcAW884cPXY3nDWtnrgER4ifF4JNpE=;
 b=ltSilujWOrv6vPoHj0BZ5iaAYTyC7UL1YY5ecfodAhyGWZ1b/bBdDAI6CNnkh9muaP
 YwwcgkBs6bpv1j2zSRAe6zHaJBSG7bfOMGk3SyaB0FWhswDmVVE3+aECEMCgbzUyDBKL
 0lYR3xilBU2166AawCjt7QCb8iojjZqY2uGkKldB+BH+IuvD1bt/g+wNQJyIyBxzZVJw
 /es6mRPtJ/nYkitZIV4MDGA1qBMMXZM/O3PjQ+6yD2xwoDZeP2As8JJcNA+CBWstq/vF
 Lof55hM07WkuB/XfCczaQAPpQ9B7J4VETOW5Us8PTnuYPo4UUA3+2M9TqQTkPTfR2YoV
 4R+Q==
X-Gm-Message-State: AOJu0YxX726ZWw6MQGI6KwL4Cxa+rFcBp/f+erov/Wl2tm7r9RD2A9f0
 T6M986AWHerNv2WBlJvqt+k=
X-Google-Smtp-Source: AGHT+IHXsR9Zxf1BwuGtn07GUyXdN18yKvsJMjQoR62WPOWwKUWuJGmIRqi8gHrrWJWmurokOLeQnA==
X-Received: by 2002:a05:6a00:178f:b0:68e:2eed:5ab0 with SMTP id
 s15-20020a056a00178f00b0068e2eed5ab0mr12390704pfg.7.1696243371433; 
 Mon, 02 Oct 2023 03:42:51 -0700 (PDT)
Received: from debian.me ([103.131.18.64]) by smtp.gmail.com with ESMTPSA id
 d17-20020aa78e51000000b0064d74808738sm19140874pfr.214.2023.10.02.03.42.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 03:42:49 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id CC01688F0C53; Mon,  2 Oct 2023 17:42:42 +0700 (WIB)
Date: Mon, 2 Oct 2023 17:42:42 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Oleksandr Natalenko <oleksandr@natalenko.name>,
 linux-kernel@vger.kernel.org
Subject: Re: [REGRESSION] BUG: KFENCE: memory corruption in
 drm_gem_put_pages+0x186/0x250
Message-ID: <ZRqeoiZ2ayrAR6AV@debian.me>
References: <13360591.uLZWGnKmhe@natalenko.name> <ZRoEqEPxPAz3QlEz@debian.me>
 <2701570.mvXUDI8C0e@natalenko.name>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="+4x4782bxzLSt9mO"
Content-Disposition: inline
In-Reply-To: <2701570.mvXUDI8C0e@natalenko.name>
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
Cc: Linux Regressions <regressions@lists.linux.dev>,
 Maxime Ripard <mripard@kernel.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--+4x4782bxzLSt9mO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 02, 2023 at 08:20:15AM +0200, Oleksandr Natalenko wrote:
> Hello.
>=20
> On pond=C4=9Bl=C3=AD 2. =C5=99=C3=ADjna 2023 1:45:44 CEST Bagas Sanjaya w=
rote:
> > On Sun, Oct 01, 2023 at 06:32:34PM +0200, Oleksandr Natalenko wrote:
> > > Hello.
> > >=20
> > > I've got a VM from a cloud provider, and since v6.5 I observe the fol=
lowing kfence splat in dmesg during boot:
> > >=20
> > > ```
> > > BUG: KFENCE: memory corruption in drm_gem_put_pages+0x186/0x250
> > >=20
> > > Corrupted memory at 0x00000000e173a294 [ ! ! ! ! ! ! ! ! ! ! ! ! ! ! =
! ! ] (in kfence-#108):
> > >  drm_gem_put_pages+0x186/0x250
> > >  drm_gem_shmem_put_pages_locked+0x43/0xc0
> > >  drm_gem_shmem_object_vunmap+0x83/0xe0
> > >  drm_gem_vunmap_unlocked+0x46/0xb0
> > >  drm_fbdev_generic_helper_fb_dirty+0x1dc/0x310
> > >  drm_fb_helper_damage_work+0x96/0x170
> > >  process_one_work+0x254/0x470
> > >  worker_thread+0x55/0x4f0
> > >  kthread+0xe8/0x120
> > >  ret_from_fork+0x34/0x50
> > >  ret_from_fork_asm+0x1b/0x30
> > >=20
> > > kfence-#108: 0x00000000cda343af-0x00000000aec2c095, size=3D3072, cach=
e=3Dkmalloc-4k
> > >=20
> > > allocated by task 51 on cpu 0 at 14.668667s:
> > >  drm_gem_get_pages+0x94/0x2b0
> > >  drm_gem_shmem_get_pages+0x5d/0x110
> > >  drm_gem_shmem_object_vmap+0xc4/0x1e0
> > >  drm_gem_vmap_unlocked+0x3c/0x70
> > >  drm_client_buffer_vmap+0x23/0x50
> > >  drm_fbdev_generic_helper_fb_dirty+0xae/0x310
> > >  drm_fb_helper_damage_work+0x96/0x170
> > >  process_one_work+0x254/0x470
> > >  worker_thread+0x55/0x4f0
> > >  kthread+0xe8/0x120
> > >  ret_from_fork+0x34/0x50
> > >  ret_from_fork_asm+0x1b/0x30
> > >=20
> > > freed by task 51 on cpu 0 at 14.668697s:
> > >  drm_gem_put_pages+0x186/0x250
> > >  drm_gem_shmem_put_pages_locked+0x43/0xc0
> > >  drm_gem_shmem_object_vunmap+0x83/0xe0
> > >  drm_gem_vunmap_unlocked+0x46/0xb0
> > >  drm_fbdev_generic_helper_fb_dirty+0x1dc/0x310
> > >  drm_fb_helper_damage_work+0x96/0x170
> > >  process_one_work+0x254/0x470
> > >  worker_thread+0x55/0x4f0
> > >  kthread+0xe8/0x120
> > >  ret_from_fork+0x34/0x50
> > >  ret_from_fork_asm+0x1b/0x30
> > >=20
> > > CPU: 0 PID: 51 Comm: kworker/0:2 Not tainted 6.5.0-pf4 #1 8b557a41731=
14d86eef7240f7a080080cfc4617e
> > > Hardware name: Red Hat KVM, BIOS 1.11.0-2.el7 04/01/2014
> > > Workqueue: events drm_fb_helper_damage_work
> > > ```
> > >=20
> > > This repeats a couple of times and then stops.
> > >=20
> > > Currently, I'm running v6.5.5. So far, there's no impact on how VM fu=
nctions for me.
> > >=20
> > > The VGA adapter is as follows: 00:02.0 VGA compatible controller: Cir=
rus Logic GD 5446
> > >=20
> >=20
> > Do you have this issue on v6.4?
>=20
> No, I did not have this issue with v6.4.
>=20

Then proceed with kernel bisection. You can refer to
Documentation/admin-guide/bug-bisect.rst in the kernel sources for the
process.

--=20
An old man doll... just what I always wanted! - Clara

--+4x4782bxzLSt9mO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZRqeogAKCRD2uYlJVVFO
o2E/AP4mkPIRMN1pxgfPOxihOOpbAOD45QVbnFzi6dWZJJX9QwD/RduMVyDlPWBa
eprgw5T0M5sCo+65kgP0ZWUTWNGBvQM=
=k2Qb
-----END PGP SIGNATURE-----

--+4x4782bxzLSt9mO--
