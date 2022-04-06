Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D020B4F4B3A
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 02:58:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82B6110E0D6;
	Wed,  6 Apr 2022 00:58:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D258710E0D6;
 Wed,  6 Apr 2022 00:58:31 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KY5jd3mCZz4xgX;
 Wed,  6 Apr 2022 10:58:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1649206710;
 bh=pi9XiXNOUCWDkzxj0K1TVRkwxuLVNRPtWNUbObBWuwc=;
 h=Date:From:To:Cc:Subject:From;
 b=lfud6uyclEmjYXOZX/GX/MCHGDXZ0PdazufiH3wBaM4Z9yeBlmq/Ab1gmiG2COzL/
 eevGdFWUWov+Wu2QDnRa+PJkkCVHFqBe94gHNCmaPuaYkeP60E2Rsw2o486RpZBqx+
 jVBoHI4HLmuzfZ/Ob47L6gkCzjh054cV9E2nMS/6sA7g2VfPdECaidfnM+cIX1gUM/
 vklirSaonTk+V/VSxzKHSCb0j6cQBuaFX8l76+C4O1NRZVhN3WiWOObB4Zag+/tIl1
 dS0f1YkM7CC5Y/SHbnsuuItn/b9gLbJhljBMeFkZm8cjERtULNBGaecaKzIPOXPw6/
 TpwyZ9oFxtIKg==
Date: Wed, 6 Apr 2022 10:58:28 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20220406105828.6d238651@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8khWjiccJo17txCVA+lH=D+";
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
Cc: Marek Vasut <marex@denx.de>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/8khWjiccJo17txCVA+lH=D+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

WARNING: modpost: drivers/gpu/drm/bridge/chipone-icn6211.prelink.o(.exit.da=
ta+0x0): Section mismatch in reference from the variable __cfi_jt_cleanup_m=
odule to the function .init.text:cleanup_module()
The variable __exitdata __cfi_jt_cleanup_module references
a function __init cleanup_module().
This is often seen when error handling in the exit function
uses functionality in the init path.
The fix is often to remove the __init annotation of
cleanup_module() so it may be used outside an init section.

Introduced by commit

  8dde6f7452a1 ("drm: bridge: icn6211: Add I2C configuration support")

The chipone_exit function should not be marked __init.

--=20
Cheers,
Stephen Rothwell

--Sig_/8khWjiccJo17txCVA+lH=D+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmJM5bQACgkQAVBC80lX
0Gyl4ggAoejsSpMqlTgpt87ppk4jvpqqjuMoEk7wVlY0xo9FQQvjbxbboiHZUn8v
fIWdbVjL9LTDkiduXGG+1JLMLMqUT8VmPr3dXnbp34Y4/kqS5Vh966ItFTtprmxV
DrA83Q1DXZ1gNJO4XUjjgS62csfi2cqF8BYY099nH9jtJLinxJKWtvkj1+yb8OD/
W33SLXoMxAN1FtlDOZunCeKDImk4+QKQoVV9ORqasGtjNmgOET3ybpGdAzrdhGfw
MYT/B/cRFhfFB+EQIBZLGoCh8/7vcerzj0Kg0LWuMR1YaXVMdr59pliyOFsZCzz9
mnAfCh13W0BGtJ//UJQKQQnqBZojLg==
=/2nT
-----END PGP SIGNATURE-----

--Sig_/8khWjiccJo17txCVA+lH=D+--
