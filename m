Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2DC1EC579
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 01:08:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4484C6E486;
	Tue,  2 Jun 2020 23:08:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 810DF6E484;
 Tue,  2 Jun 2020 23:08:23 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49c74f0J6Gz9sPF;
 Wed,  3 Jun 2020 09:08:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1591139300;
 bh=3X31qWO/1Ul5RhQ1agdJfn/17XFGSliumzUhlLvsTWw=;
 h=Date:From:To:Cc:Subject:From;
 b=h6AqdG8KBXbdaHWJrOK9z/qtFoo9CElq3dh+VR7SUxXU1Oma2WWnHcZ/1EDqPv27C
 N4jxKHzzMFQkvgBDxOgyzoE6uJqgXsbMrSs4qf4PcGuUl6VVZl04yZS5c8t6kYMapE
 dxfLkN8P14p5bFMTV4JB41g5YIwOwYaQ5D/r2a2CTLgjUW7b21ifzklwFU244ETIZr
 r8qpC/bdxVdI0jW07MHuMX8vgVATO9UOkY4MBWWDifE2EiewO1ziRjXWSin8Mapdre
 sCyfwh1qTEQiY9LBKfclN0smKOjf2C0m9TkWwjzej/UTZJTZOJoU4DkadT1KZzPh/J
 ClziuHdVJEyqQ==
Date: Wed, 3 Jun 2020 09:08:16 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm-intel-fixes tree with Linus' tree
Message-ID: <20200603090816.6437acec@canb.auug.org.au>
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
Content-Type: multipart/mixed; boundary="===============1142125004=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1142125004==
Content-Type: multipart/signed; boundary="Sig_/+LWcEw/dTcCMMLWI1+PUaar";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/+LWcEw/dTcCMMLWI1+PUaar
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel-fixes tree got a conflict in:

  drivers/gpu/drm/i915/gt/intel_lrc.c

between commit:

  f53ae29c0ea1 ("drm/i915/gt: Include a few tracek for timeslicing")

from Linus' tree and commit:

  00febf644648 ("drm/i915/gt: Incorporate the virtual engine into timeslici=
ng")

from the drm-intel-fixes tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/i915/gt/intel_lrc.c
index 87e6c5bdd2dc,e77f89b43e5f..000000000000
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@@ -1971,20 -1853,12 +1990,19 @@@ static void set_timeslice(struct intel_
  	if (!intel_engine_has_timeslices(engine))
  		return;
 =20
 -	set_timer_ms(&engine->execlists.timer, active_timeslice(engine));
 +	duration =3D active_timeslice(engine);
 +	ENGINE_TRACE(engine, "bump timeslicing, interval:%lu", duration);
 +
 +	set_timer_ms(&engine->execlists.timer, duration);
  }
 =20
- static void start_timeslice(struct intel_engine_cs *engine)
+ static void start_timeslice(struct intel_engine_cs *engine, int prio)
  {
  	struct intel_engine_execlists *execlists =3D &engine->execlists;
- 	const int prio =3D queue_prio(execlists);
 +	unsigned long duration;
 +
 +	if (!intel_engine_has_timeslices(engine))
 +		return;
 =20
  	WRITE_ONCE(execlists->switch_priority_hint, prio);
  	if (prio =3D=3D INT_MIN)
@@@ -2140,13 -1994,8 +2158,13 @@@ static void execlists_dequeue(struct in
  			__unwind_incomplete_requests(engine);
 =20
  			last =3D NULL;
- 		} else if (need_timeslice(engine, last) &&
+ 		} else if (need_timeslice(engine, last, rb) &&
  			   timeslice_expired(execlists, last)) {
 +			if (i915_request_completed(last)) {
 +				tasklet_hi_schedule(&execlists->tasklet);
 +				return;
 +			}
 +
  			ENGINE_TRACE(engine,
  				     "expired last=3D%llx:%lld, prio=3D%d, hint=3D%d, yield?=3D%s\n",
  				     last->fence.context,

--Sig_/+LWcEw/dTcCMMLWI1+PUaar
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7W2+AACgkQAVBC80lX
0Gzk6Qf+NgipWpAbO9j938t18ykGpgXDxSrAyqX/47f6+DOhTjaz0Ak7P69ECbR5
zBYdNjOevpGH96Cn6EQV615b+1ldZe/7A4V4uxdCLtwPCccekbqoS2vEX4uetMsZ
852YsDvkV/6U0RFgmjHEi2Famrde6hjrfajJ49aP0quHo3RNickZIe5xQj8IbtSC
lX05WBNlr62yWk3aj5KJhVx7fVsC7ul76Yuxq16oqbHAexbJVjrfRaSZ5+xqEE9A
qg0PaE/Ezdk/DtCaOlc51WDCvYwI5teLVjze+pXG8MDtTPVsoWyKLoyoTOwCZt+n
+bU80q9HXJ95BOR6e84+vEgB2Y18vw==
=glNj
-----END PGP SIGNATURE-----

--Sig_/+LWcEw/dTcCMMLWI1+PUaar--

--===============1142125004==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1142125004==--
