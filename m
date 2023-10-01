Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C600E7B48A2
	for <lists+dri-devel@lfdr.de>; Sun,  1 Oct 2023 18:32:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D2DB10E028;
	Sun,  1 Oct 2023 16:32:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vulcan.natalenko.name (vulcan.natalenko.name [104.207.131.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8AD610E028
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Oct 2023 16:32:51 +0000 (UTC)
Received: from spock.localnet (unknown [94.142.239.106])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vulcan.natalenko.name (Postfix) with ESMTPSA id 969DA15278A8;
 Sun,  1 Oct 2023 18:32:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=natalenko.name;
 s=dkim-20170712; t=1696177967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=kzlx67CZy1QScrq/jKerHGDJqCFa+KgwdJ4AQpm3+/U=;
 b=wBqt2wD+/+KVgBjumuMHmn7e24m7vh0dC5jcwSmWh+WHGJfdxoit0e8N0UgyRmw0UW66w8
 TjqbY0kuJHHuNvHOC4fbYnt73wJogoap/aGirEUX1vDiKQkno2VY1axPktvNwrbuB21OhG
 8AszvDBNaOI55a6C9VdO1TN3kLWcOps=
From: Oleksandr Natalenko <oleksandr@natalenko.name>
To: linux-kernel@vger.kernel.org
Subject: [REGRESSION] BUG: KFENCE: memory corruption in
 drm_gem_put_pages+0x186/0x250
Date: Sun, 01 Oct 2023 18:32:34 +0200
Message-ID: <13360591.uLZWGnKmhe@natalenko.name>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2904309.e9J7NaK4W3";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
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
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--nextPart2904309.e9J7NaK4W3
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Oleksandr Natalenko <oleksandr@natalenko.name>
To: linux-kernel@vger.kernel.org
Date: Sun, 01 Oct 2023 18:32:34 +0200
Message-ID: <13360591.uLZWGnKmhe@natalenko.name>
MIME-Version: 1.0

Hello.

I've got a VM from a cloud provider, and since v6.5 I observe the following kfence splat in dmesg during boot:

```
BUG: KFENCE: memory corruption in drm_gem_put_pages+0x186/0x250

Corrupted memory at 0x00000000e173a294 [ ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ] (in kfence-#108):
 drm_gem_put_pages+0x186/0x250
 drm_gem_shmem_put_pages_locked+0x43/0xc0
 drm_gem_shmem_object_vunmap+0x83/0xe0
 drm_gem_vunmap_unlocked+0x46/0xb0
 drm_fbdev_generic_helper_fb_dirty+0x1dc/0x310
 drm_fb_helper_damage_work+0x96/0x170
 process_one_work+0x254/0x470
 worker_thread+0x55/0x4f0
 kthread+0xe8/0x120
 ret_from_fork+0x34/0x50
 ret_from_fork_asm+0x1b/0x30

kfence-#108: 0x00000000cda343af-0x00000000aec2c095, size=3072, cache=kmalloc-4k

allocated by task 51 on cpu 0 at 14.668667s:
 drm_gem_get_pages+0x94/0x2b0
 drm_gem_shmem_get_pages+0x5d/0x110
 drm_gem_shmem_object_vmap+0xc4/0x1e0
 drm_gem_vmap_unlocked+0x3c/0x70
 drm_client_buffer_vmap+0x23/0x50
 drm_fbdev_generic_helper_fb_dirty+0xae/0x310
 drm_fb_helper_damage_work+0x96/0x170
 process_one_work+0x254/0x470
 worker_thread+0x55/0x4f0
 kthread+0xe8/0x120
 ret_from_fork+0x34/0x50
 ret_from_fork_asm+0x1b/0x30

freed by task 51 on cpu 0 at 14.668697s:
 drm_gem_put_pages+0x186/0x250
 drm_gem_shmem_put_pages_locked+0x43/0xc0
 drm_gem_shmem_object_vunmap+0x83/0xe0
 drm_gem_vunmap_unlocked+0x46/0xb0
 drm_fbdev_generic_helper_fb_dirty+0x1dc/0x310
 drm_fb_helper_damage_work+0x96/0x170
 process_one_work+0x254/0x470
 worker_thread+0x55/0x4f0
 kthread+0xe8/0x120
 ret_from_fork+0x34/0x50
 ret_from_fork_asm+0x1b/0x30

CPU: 0 PID: 51 Comm: kworker/0:2 Not tainted 6.5.0-pf4 #1 8b557a4173114d86eef7240f7a080080cfc4617e
Hardware name: Red Hat KVM, BIOS 1.11.0-2.el7 04/01/2014
Workqueue: events drm_fb_helper_damage_work
```

This repeats a couple of times and then stops.

Currently, I'm running v6.5.5. So far, there's no impact on how VM functions for me.

The VGA adapter is as follows: 00:02.0 VGA compatible controller: Cirrus Logic GD 5446

Please check.

Thanks.

-- 
Oleksandr Natalenko (post-factum)
--nextPart2904309.e9J7NaK4W3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEZUOOw5ESFLHZZtOKil/iNcg8M0sFAmUZnyIACgkQil/iNcg8
M0tJmQ/8DhTcxuPGXLnGUgCfwyogSk1PChHX3rmyptaGWxzJGH5ztqyjcdoHIYkI
38js69NPzumIuHUMhGF6ipb7ZDkqfhJTzVAWyf7s86Aau9SBWFkUDieoIxqm6CaJ
CyIxgTtVi2FalaIZiRcrJOW4bOy7tujJKlEvz43RBSoHHgBEjSx3dCYiGHNWxvWw
pG3SFZLdDNKzZs1kUdrfwqft6OxOvA85hATzVJDKs7OvMuYDCU2trDspGVs9XVa6
I99s6DJGA2uGENneAlgwti8ACY3xH+IkfNI6Fe/9vIqQYHFHpTnKqyp3HbUN18fS
En8QDtGCNChlHwFEWcB7HaFW9VXg89lpWM9MRyuSixVFijbq/vFt1AJMUEgUhYEu
nGm68xtaE/OktfzsMuOm3VV5pt4Q5MfgbFMql/a1VBpqt+NQH1jf3U6X6Mu3CBrN
QWUaQGgZMfF4y15r+lBKkDr4mrdH5kdWNu2kP5MNG8qixn4XrxCd/EkRvN4QpstC
pP+lpwVuoPpDYnqOm//zhS3p+sJdTN5B9IhBhrFOCdgisLzIyJzyLlTjDi+CRGS9
NXLPrzvFUxfpgy23N41lqYUvShb3WXsHnSWtULbrFv3J1JN/rCQ+I9tk7HuXW6W/
SPJzW28+5hoTrUF7EPl84GYXm0dJBU0BA1atbhfqFJO/AKaWHKo=
=wsqg
-----END PGP SIGNATURE-----

--nextPart2904309.e9J7NaK4W3--



