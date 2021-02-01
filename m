Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 817FD30A048
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 03:11:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9503E6E3D6;
	Mon,  1 Feb 2021 02:10:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23BE66E3D6;
 Mon,  1 Feb 2021 02:10:54 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DTWd85N7zz9srY;
 Mon,  1 Feb 2021 13:10:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1612145452;
 bh=RQMWa2ShLO0GqlUDQFlorzJ5Ee+a7zwuQBEVXVbMpbU=;
 h=Date:From:To:Cc:Subject:From;
 b=B/IUWZF1L+NrqoKf4xmPzapI2QMpOV2DmxWWAX1yEgydndyCf9ygtOvWxrWtMd9r7
 fcoiTBDw8Ze8UIRL/AABX6Yxq1Y/kbC+SBptIvzd6epY28noY2eIt7k07P8vvxp2D0
 x1VxvSOVLWful678yBsG5XK2S98cb2FRYyrf6m3qD37ngtmEmukm53TnreGwQiLGTV
 cMh4+7Dk8brvf06RpzylB49uLM9sWPXaenw5xjNEVTjl5TF0bCjaD0SC7Pia1NVLz0
 OLMP0mfDENyhr0IkDHctbwf3Qjv3NSIx3fwoGtB79MMz+ElRPrGxvqR/373wDK6zor
 g6Ng3Ugp2YAGA==
Date: Mon, 1 Feb 2021 13:10:50 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20210201131050.6ac8ea63@canb.auug.org.au>
MIME-Version: 1.0
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============2139541919=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2139541919==
Content-Type: multipart/signed; boundary="Sig_/NK9oM7n=8nY/gN.b/KbjIo/";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/NK9oM7n=8nY/gN.b/KbjIo/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/v3d/v3d_sched.c:263:1: error: return type is an incomplete =
type
  263 | v3d_gpu_reset_for_timeout(struct v3d_dev *v3d, struct drm_sched_job=
 *sched_job)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/v3d/v3d_sched.c: In function 'v3d_gpu_reset_for_timeout':
drivers/gpu/drm/v3d/v3d_sched.c:289:9: error: 'return' with a value, in fun=
ction returning void [-Werror=3Dreturn-type]
  289 |  return DRM_GPU_SCHED_STAT_NOMINAL;
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/v3d/v3d_sched.c:263:1: note: declared here
  263 | v3d_gpu_reset_for_timeout(struct v3d_dev *v3d, struct drm_sched_job=
 *sched_job)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/v3d/v3d_sched.c: At top level:
drivers/gpu/drm/v3d/v3d_sched.c:298:1: error: return type is an incomplete =
type
  298 | v3d_cl_job_timedout(struct drm_sched_job *sched_job, enum v3d_queue=
 q,
      | ^~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/v3d/v3d_sched.c: In function 'v3d_cl_job_timedout':
drivers/gpu/drm/v3d/v3d_sched.c:309:10: error: 'return' with a value, in fu=
nction returning void [-Werror=3Dreturn-type]
  309 |   return DRM_GPU_SCHED_STAT_NOMINAL;
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/v3d/v3d_sched.c:298:1: note: declared here
  298 | v3d_cl_job_timedout(struct drm_sched_job *sched_job, enum v3d_queue=
 q,
      | ^~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/v3d/v3d_sched.c: At top level:
drivers/gpu/drm/v3d/v3d_sched.c:316:1: error: return type is an incomplete =
type
  316 | v3d_bin_job_timedout(struct drm_sched_job *sched_job)
      | ^~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/v3d/v3d_sched.c:325:1: error: return type is an incomplete =
type
  325 | v3d_render_job_timedout(struct drm_sched_job *sched_job)
      | ^~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/v3d/v3d_sched.c:334:1: error: return type is an incomplete =
type
  334 | v3d_generic_job_timedout(struct drm_sched_job *sched_job)
      | ^~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/v3d/v3d_sched.c:342:1: error: return type is an incomplete =
type
  342 | v3d_csd_job_timedout(struct drm_sched_job *sched_job)
      | ^~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/v3d/v3d_sched.c: In function 'v3d_csd_job_timedout':
drivers/gpu/drm/v3d/v3d_sched.c:353:10: error: 'return' with a value, in fu=
nction returning void [-Werror=3Dreturn-type]
  353 |   return DRM_GPU_SCHED_STAT_NOMINAL;
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/v3d/v3d_sched.c:342:1: note: declared here
  342 | v3d_csd_job_timedout(struct drm_sched_job *sched_job)
      | ^~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/v3d/v3d_sched.c: At top level:
drivers/gpu/drm/v3d/v3d_sched.c:362:18: error: initialization of 'enum drm_=
gpu_sched_stat (*)(struct drm_sched_job *)' from incompatible pointer type =
'void (*)(struct drm_sched_job *)' [-Werror=3Dincompatible-pointer-types]
  362 |  .timedout_job =3D v3d_bin_job_timedout,
      |                  ^~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/v3d/v3d_sched.c:362:18: note: (near initialization for 'v3d=
_bin_sched_ops.timedout_job')
drivers/gpu/drm/v3d/v3d_sched.c:369:18: error: initialization of 'enum drm_=
gpu_sched_stat (*)(struct drm_sched_job *)' from incompatible pointer type =
'void (*)(struct drm_sched_job *)' [-Werror=3Dincompatible-pointer-types]
  369 |  .timedout_job =3D v3d_render_job_timedout,
      |                  ^~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/v3d/v3d_sched.c:369:18: note: (near initialization for 'v3d=
_render_sched_ops.timedout_job')
drivers/gpu/drm/v3d/v3d_sched.c:376:18: error: initialization of 'enum drm_=
gpu_sched_stat (*)(struct drm_sched_job *)' from incompatible pointer type =
'void (*)(struct drm_sched_job *)' [-Werror=3Dincompatible-pointer-types]
  376 |  .timedout_job =3D v3d_generic_job_timedout,
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/v3d/v3d_sched.c:376:18: note: (near initialization for 'v3d=
_tfu_sched_ops.timedout_job')
drivers/gpu/drm/v3d/v3d_sched.c:383:18: error: initialization of 'enum drm_=
gpu_sched_stat (*)(struct drm_sched_job *)' from incompatible pointer type =
'void (*)(struct drm_sched_job *)' [-Werror=3Dincompatible-pointer-types]
  383 |  .timedout_job =3D v3d_csd_job_timedout,
      |                  ^~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/v3d/v3d_sched.c:383:18: note: (near initialization for 'v3d=
_csd_sched_ops.timedout_job')
drivers/gpu/drm/v3d/v3d_sched.c:390:18: error: initialization of 'enum drm_=
gpu_sched_stat (*)(struct drm_sched_job *)' from incompatible pointer type =
'void (*)(struct drm_sched_job *)' [-Werror=3Dincompatible-pointer-types]
  390 |  .timedout_job =3D v3d_generic_job_timedout,
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/v3d/v3d_sched.c:390:18: note: (near initialization for 'v3d=
_cache_clean_sched_ops.timedout_job')

Caused by commit

  a6a1f036c74e ("drm/scheduler: Job timeout handler returns status (v3)")

I have used the drm-misc tree from next-20210129 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/NK9oM7n=8nY/gN.b/KbjIo/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAXYyoACgkQAVBC80lX
0GweCQf+LRzJrP4D4Ztpbsb41AJEP7tfUQiMq/HvEqijwOY7wknNHd383hNhM4uB
MN/y8IL4wx+2rd4vPjmPJLkUKF0nhmSrvFK4jRE2CrLfLigqIwPzZfx4LShSlcQO
VBZZLtegJjFuOMDsbWvMAe3Ackr9h9Hv5Yk4Z2Kxmcwvl4xU7B2pQt3zBi1FDs+K
v/ix8xF5A5ap2niEp+3npz3Np2JMVCSaETeHTcEYl8jrqcFybCig4GIf0k9C6F31
pX1WcEL8Atg1vE1wV/dqbAEnQIyhVpwfxrPnr4o1I+Gtp8LjtBtmWzTxdNBK2fAo
2TcdWTo9Eh9WFDF4JP/COAFATUvlsQ==
=GaHe
-----END PGP SIGNATURE-----

--Sig_/NK9oM7n=8nY/gN.b/KbjIo/--

--===============2139541919==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2139541919==--
