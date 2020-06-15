Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF18D1FA475
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 01:39:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F6528997A;
	Mon, 15 Jun 2020 23:39:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66A2D8997A;
 Mon, 15 Jun 2020 23:39:19 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49m78K70Nrz9sRN;
 Tue, 16 Jun 2020 09:39:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1592264356;
 bh=/2A6z48xWuHqvszn1H0AJZqQAd7pEFgoSo04turATSc=;
 h=Date:From:To:Cc:Subject:From;
 b=K7oldSE2ZDHvdCbwaDMfYbKenAmPTRSVWZVx//syq+vgZG7M11J13QkFd9h7HjWK7
 KFToE9vpoQwBPvjmyYQ6zjbpoBBLQwWsrfGaXqgB6EJc4XsRwlVkM/T7K7In5eKj5E
 4iILnfifSZWQC0MjC9AyvFuTPpr9oOOc3uqK7gjs+oHWK93YrNMywhNITet5tEhLQK
 k7XfeTLJC/Em2YmRGx1MqrirWFIt17J9sxqQbs2ZKhpFw858APT5JwCqyf/TRS9bbo
 EaJYYwmE1r5IvN3q5uaI2htxTlQLsViW0z7WtZW8XYinXjOajPCJT/QUn429eWYUXE
 j0zhIJgk3a0aA==
Date: Tue, 16 Jun 2020 09:39:12 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: linux-next: build failure after merge of the drm-intel-fixes tree
Message-ID: <20200616093912.4dffcc71@canb.auug.org.au>
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: multipart/mixed; boundary="===============2026765876=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2026765876==
Content-Type: multipart/signed; boundary="Sig_/VqOrpk6RlFdSODzu2+ucuzS";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/VqOrpk6RlFdSODzu2+ucuzS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-intel-fixes tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from drivers/gpu/drm/i915/gt/intel_lrc.c:5972:
drivers/gpu/drm/i915/gt/selftest_lrc.c: In function 'live_timeslice_nopreem=
pt':
drivers/gpu/drm/i915/gt/selftest_lrc.c:1333:3: error: too few arguments to =
function 'engine_heartbeat_disable'
 1333 |   engine_heartbeat_disable(engine);
      |   ^~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/i915/gt/selftest_lrc.c:54:13: note: declared here
   54 | static void engine_heartbeat_disable(struct intel_engine_cs *engine,
      |             ^~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/i915/gt/selftest_lrc.c:1402:3: error: too few arguments to =
function 'engine_heartbeat_enable'
 1402 |   engine_heartbeat_enable(engine);
      |   ^~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/i915/gt/selftest_lrc.c:64:13: note: declared here
   64 | static void engine_heartbeat_enable(struct intel_engine_cs *engine,
      |             ^~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  04dc41776145 ("drm/i915/gt: Prevent timeslicing into unpreemptable reques=
ts")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/VqOrpk6RlFdSODzu2+ucuzS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7oBqAACgkQAVBC80lX
0Gw+Lwf4qvvDaLMvZoEQxhLYV1+YWuVMXu+VSykGjyiIyzfTj9vVEcvQy3EzhpRy
lGaUSO6Yaap7GG0QUWl2gipYeZDhU9YRJ1HbHP/rizw9u51VC4O7Qmrcaqh4OV8W
/kVPXrR1mIV3xzlayJIGXWITpi9XgfzyhCoyRqU2E+ltRlyWCWISzn6FRJBbYi7P
6bArjdpsCZrvZhVRKwcuVo5nd/Yg086ft3/PLDEMIUG5DkdDYdANXgq7NI1JPE+J
dV1aK7jHnTfcLaRZ4Q4uJDxXBXSFpBiudqrrcGTLMvnGwGqz9rm69zgQLIOKZe5M
vlPbgovyFtUFwTKcO0Ym6A//ImZT
=iqaX
-----END PGP SIGNATURE-----

--Sig_/VqOrpk6RlFdSODzu2+ucuzS--

--===============2026765876==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2026765876==--
