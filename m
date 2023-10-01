Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B30467B4A5F
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 01:45:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0278310E023;
	Sun,  1 Oct 2023 23:45:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA37710E023
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Oct 2023 23:45:48 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-690fa0eea3cso14425555b3a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Oct 2023 16:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696203948; x=1696808748; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8vvjOV/SJHwlBfuAQ9Hpu2fBDMywi9nmiPQcO1/0180=;
 b=Cpj0m0lkGWmxY20MA+B8mGVN4Hc5+vx4mWOGyxXH0rNGvD2ESxzkRjQxfwl8f7QCTF
 a5law6uEHvDh0a4bHEfhTpIGUYIVmIRRPwij6edxTtVxOs90KXjW0DiXHn0UgyfTtDSQ
 qloegcNOV8jOcQhZCnJDdJNXVeFq7SpDb1z8uMIChtt0qtseqjmYVzyxAQEthoD7r4Na
 F/vVjQR/XKkSv6PLq2wHy0NFs5ZbACtGt8CRHYne73TBfrpeprmsmI+vW6Ntqr3EwCMr
 W+m1+RC4pS0/i51UijCJjnbGql0V+w9PDE2eDkAJo1jg9JOKzzPGQtJwQyMbJ6kZSHoP
 OG+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696203948; x=1696808748;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8vvjOV/SJHwlBfuAQ9Hpu2fBDMywi9nmiPQcO1/0180=;
 b=H7nTBpqtqPsgd0SA3+Ymo8ovzUMyM6wfNP6PZB5sSaLfZzYCP+sbSwn6jL3qTUuMGm
 okI4p9sE4dnxFo0/AMLk0TJGmKRKPMGQB8ApYXFyEQg13Jedk6cTD9y2l68STxUMOjug
 bTDmkH/enRT/5J4gDhStqRx6U5ZE5dva5kuQvJo6+qeNamBw4yvm6HviaVUp3a9Kq8+n
 OPk92U4LATBKtogfexNQMxcXM+/XfoKSSoXsbZUVW+werHmrgCg4CYuJlykjGrTcZ/ki
 axMe9mMw3Lfpwd7ZhgqZ4dtAXWltSt5Z1iRS6N/MBNAJJPPkI8enNuXkvkSnpxWZ5IHv
 davw==
X-Gm-Message-State: AOJu0YyUzjbK9PiqiChntLGg2/0tecXGyh0X26D7UG0V59ianQrZock2
 j2naNXw62GGhNkRG+X0d5tA=
X-Google-Smtp-Source: AGHT+IHz8QtBxh5UpcXHxqq1V7wU5Le8vKu+zUqpAxF2dUNjqVwWaUCWgNdN7SxncLebsJNcFYx8tQ==
X-Received: by 2002:a05:6a00:982:b0:68e:36bc:194a with SMTP id
 u2-20020a056a00098200b0068e36bc194amr13053460pfg.15.1696203948274; 
 Sun, 01 Oct 2023 16:45:48 -0700 (PDT)
Received: from debian.me ([103.131.18.64]) by smtp.gmail.com with ESMTPSA id
 f1-20020aa782c1000000b0069305627494sm10416369pfn.165.2023.10.01.16.45.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Oct 2023 16:45:47 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id 0070F8017C4F; Mon,  2 Oct 2023 06:45:44 +0700 (WIB)
Date: Mon, 2 Oct 2023 06:45:44 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Oleksandr Natalenko <oleksandr@natalenko.name>,
 linux-kernel@vger.kernel.org
Subject: Re: [REGRESSION] BUG: KFENCE: memory corruption in
 drm_gem_put_pages+0x186/0x250
Message-ID: <ZRoEqEPxPAz3QlEz@debian.me>
References: <13360591.uLZWGnKmhe@natalenko.name>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yoF7gxy4SjBfUd1U"
Content-Disposition: inline
In-Reply-To: <13360591.uLZWGnKmhe@natalenko.name>
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


--yoF7gxy4SjBfUd1U
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 01, 2023 at 06:32:34PM +0200, Oleksandr Natalenko wrote:
> Hello.
>=20
> I've got a VM from a cloud provider, and since v6.5 I observe the followi=
ng kfence splat in dmesg during boot:
>=20
> ```
> BUG: KFENCE: memory corruption in drm_gem_put_pages+0x186/0x250
>=20
> Corrupted memory at 0x00000000e173a294 [ ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! =
] (in kfence-#108):
>  drm_gem_put_pages+0x186/0x250
>  drm_gem_shmem_put_pages_locked+0x43/0xc0
>  drm_gem_shmem_object_vunmap+0x83/0xe0
>  drm_gem_vunmap_unlocked+0x46/0xb0
>  drm_fbdev_generic_helper_fb_dirty+0x1dc/0x310
>  drm_fb_helper_damage_work+0x96/0x170
>  process_one_work+0x254/0x470
>  worker_thread+0x55/0x4f0
>  kthread+0xe8/0x120
>  ret_from_fork+0x34/0x50
>  ret_from_fork_asm+0x1b/0x30
>=20
> kfence-#108: 0x00000000cda343af-0x00000000aec2c095, size=3D3072, cache=3D=
kmalloc-4k
>=20
> allocated by task 51 on cpu 0 at 14.668667s:
>  drm_gem_get_pages+0x94/0x2b0
>  drm_gem_shmem_get_pages+0x5d/0x110
>  drm_gem_shmem_object_vmap+0xc4/0x1e0
>  drm_gem_vmap_unlocked+0x3c/0x70
>  drm_client_buffer_vmap+0x23/0x50
>  drm_fbdev_generic_helper_fb_dirty+0xae/0x310
>  drm_fb_helper_damage_work+0x96/0x170
>  process_one_work+0x254/0x470
>  worker_thread+0x55/0x4f0
>  kthread+0xe8/0x120
>  ret_from_fork+0x34/0x50
>  ret_from_fork_asm+0x1b/0x30
>=20
> freed by task 51 on cpu 0 at 14.668697s:
>  drm_gem_put_pages+0x186/0x250
>  drm_gem_shmem_put_pages_locked+0x43/0xc0
>  drm_gem_shmem_object_vunmap+0x83/0xe0
>  drm_gem_vunmap_unlocked+0x46/0xb0
>  drm_fbdev_generic_helper_fb_dirty+0x1dc/0x310
>  drm_fb_helper_damage_work+0x96/0x170
>  process_one_work+0x254/0x470
>  worker_thread+0x55/0x4f0
>  kthread+0xe8/0x120
>  ret_from_fork+0x34/0x50
>  ret_from_fork_asm+0x1b/0x30
>=20
> CPU: 0 PID: 51 Comm: kworker/0:2 Not tainted 6.5.0-pf4 #1 8b557a4173114d8=
6eef7240f7a080080cfc4617e
> Hardware name: Red Hat KVM, BIOS 1.11.0-2.el7 04/01/2014
> Workqueue: events drm_fb_helper_damage_work
> ```
>=20
> This repeats a couple of times and then stops.
>=20
> Currently, I'm running v6.5.5. So far, there's no impact on how VM functi=
ons for me.
>=20
> The VGA adapter is as follows: 00:02.0 VGA compatible controller: Cirrus =
Logic GD 5446
>=20

Do you have this issue on v6.4?

--=20
An old man doll... just what I always wanted! - Clara

--yoF7gxy4SjBfUd1U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZRoEoAAKCRD2uYlJVVFO
o9s5AP9kGuHk47ES1xM3sSRWMksEAyOgSfb9PPRtW2GW6eLYrwEAncNNUUPjdgsp
of+ra71dF0EDOM0682RgxNmO1A/YTQw=
=/Uxd
-----END PGP SIGNATURE-----

--yoF7gxy4SjBfUd1U--
