Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C49E5A1EE5
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 04:37:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAA3510E162;
	Fri, 26 Aug 2022 02:36:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4AA910E10F;
 Fri, 26 Aug 2022 02:36:45 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4MDP9L1bD7z4wgv;
 Fri, 26 Aug 2022 12:36:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1661481400;
 bh=WGwi+ljsDERmTrvD7FgH6btCL+ApehLH36qFOcbf57k=;
 h=Date:From:To:Cc:Subject:From;
 b=WBEzthhTQQs+iXWxKaWDVGI0u9iYD2pChYgPY0IHYbppVAi7Tc6bluR2VIXd2FliO
 WoPTotj0msqCf5JATkcAs1sCATV7iB3CXizarRYPnkOCPBkXSelU0ISpl7FLsLShyO
 M0OAx8nEg8oIN8sIFN5WhUuV0tMXR7y1KCr+YyNZwU8yZylCMVXcsEV8Ib980vgwLk
 rftE65GoVQHzA/e1awr0ZWxzEjynQeXstYna4bSAbyFAy59KbBizRKta3Hd+XNAimX
 rjLOrqlkBcXjwKtwRrqINSlnVeNg0xIsUTwHza13Th9SrAX+I/ziVdYKvstfJ1AoYP
 zb5OFy7jZTBGw==
Date: Fri, 26 Aug 2022 12:36:36 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dave Airlie <airlied@linux.ie>
Subject: linux-next: build failure after merge of the drm-intel tree
Message-ID: <20220826123636.72fbea19@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1fGKZE5_lC.5L6zFZWj1jcL";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 John Harrison <John.C.Harrison@Intel.com>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/1fGKZE5_lC.5L6zFZWj1jcL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-intel tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/i915/gt/uc/intel_guc.c: In function 'intel_guc_dump_time_in=
fo':
drivers/gpu/drm/i915/gt/uc/intel_guc.c:399:9: error: implicit declaration o=
f function 'intel_device_info_print_runtime'; did you mean 'intel_device_in=
fo_print'? [-Werror=3Dimplicit-function-declaration]
  399 |         intel_device_info_print_runtime(RUNTIME_INFO(gt->i915), p);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |         intel_device_info_print

Caused by commit

  c7d3c8447b26 ("drm/i915: combine device info printing into one")

interacting with commit

  368d179adbac ("drm/i915/guc: Add GuC <-> kernel time stamp translation in=
formation")

from the drm tree.

I have applied the following merge fix patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 26 Aug 2022 12:30:19 +1000
Subject: [PATCH] fix up for "drm/i915/guc: Add GuC <-> kernel time stamp tr=
anslation information"

interacting with "drm/i915: combine device info printing into one".

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/=
gt/uc/intel_guc.c
index ab4aacc516aa..977278d71182 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -396,7 +396,7 @@ void intel_guc_dump_time_info(struct intel_guc *guc, st=
ruct drm_printer *p)
 	u32 stamp =3D 0;
 	u64 ktime;
=20
-	intel_device_info_print_runtime(RUNTIME_INFO(gt->i915), p);
+	intel_device_info_print(INTEL_INFO(gt->i915), RUNTIME_INFO(gt->i915), p);
=20
 	with_intel_runtime_pm(&gt->i915->runtime_pm, wakeref)
 		stamp =3D intel_uncore_read(gt->uncore, GUCPMTIMESTAMP);
--=20
2.35.1

--=20
Cheers,
Stephen Rothwell

--Sig_/1fGKZE5_lC.5L6zFZWj1jcL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmMIMbQACgkQAVBC80lX
0GxI3QgAon59yMGf5vKSdI+mDq+GhVj10XuhcnG2AhKKy0M2uPY/CBlzfXqowC8c
AEg5DD0Ey3NnrQxBTIZwXOcjzFSwVjP0+MzcdPKMU0dYer/CXQwGWThxR0adk0NM
d4yzTPxEd3BBWkVYd93OfN9YKZIYHyDjQ/lbrvsMyjrecdxYXiW3FeDbIWfIsTs2
gXtqIZ2m4yUDMG8QaWPzez1zQLt56TplzpT3Dk1KigGLNzNm34wf90OeEI/bBV35
W8UWCATVB98kwrfB/HsjJl+UNL8ALCq2qhqwfKHaBiyyjCahkWaJdCmSIFeulbKH
W0cq4noF+LWw+9k84aztFCZvYSKlsw==
=7x6E
-----END PGP SIGNATURE-----

--Sig_/1fGKZE5_lC.5L6zFZWj1jcL--
