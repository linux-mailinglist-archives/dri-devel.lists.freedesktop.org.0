Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFF97647AA
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 09:05:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B9410E4DC;
	Thu, 27 Jul 2023 07:05:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D922110E4DC
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 07:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690441524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=Sg1RKM+t1E27+cvMfDl0xLHgEF6qP56lVlrDKJA2JG0=;
 b=M0IjRvPhDAHTM1T2pWUQhlS6kikzsOHZNoXYB84zCXI2wpp/pE4+MUjYKZ0y/AXOnZ8/1v
 HL/q9VAIT47pHJmNZoR/+oGhj7zQ1uu0Y9CyRG7Q046sPl4e70SBUTuakpve5x8hGH1izK
 ia+AaVoAGro1Q/n9P1pJODFKrPlO3K8=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-c9V_oFKVMHC_TxEIMUAzPw-1; Thu, 27 Jul 2023 03:05:22 -0400
X-MC-Unique: c9V_oFKVMHC_TxEIMUAzPw-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2b6fbed5189so4828251fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 00:05:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690441520; x=1691046320;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Sg1RKM+t1E27+cvMfDl0xLHgEF6qP56lVlrDKJA2JG0=;
 b=hiermFECJZbApwCXOPr0/39ph2ItQIurdGnX1w3jrPtRaPHfdd0F6hbnpTcaiEn2/l
 MkTtDuhPN2DxCY6IQnPLRGwXuHnI5JNsK/1VYKMs8XVYqY9RxdOZe3kUDY+PugxilgEv
 2G3ylv4BRe3FuBO8Nn6ch9jMmsJrNeWM7p6p34sTM3/lQh4MGZtQR1w5dwrhrkLZA4wY
 MGGzyGTyiJaD1obRGO0v+n9tXDRyKCwjt5XHQcImsPezJVuekkv9WYxGD7ImTR2+Uh31
 Z/hy2G5knvjfI5RTQbfy9oW+lckDnwOCORtrIelvVhhzjR7NbzIPLY56I72H0QY48gxk
 /Mgw==
X-Gm-Message-State: ABy/qLbbf5lkBcjCfXMcW3i02hq8Ds2/a5EN4gX/2YyWkATLT1hY3aGB
 bHgBmTAmYdQQmTCtnUVVUtLycaBBj1IyqelEHLHHEJWCeYizLm0teg1hBO9OPcTaJCce5TB7K3K
 BN+3jBAhPGhn4sOSJIK05w3W6UGdD
X-Received: by 2002:a2e:a317:0:b0:2b5:7a87:a85a with SMTP id
 l23-20020a2ea317000000b002b57a87a85amr1021849lje.13.1690441520646; 
 Thu, 27 Jul 2023 00:05:20 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHVhFlicS+HPifL/pAnegBMYT0IBn1Q1Q0vdNG3/js8oBIKQLt23w7nh+ATmsiozEnVmy+1Tg==
X-Received: by 2002:a2e:a317:0:b0:2b5:7a87:a85a with SMTP id
 l23-20020a2ea317000000b002b57a87a85amr1021825lje.13.1690441520282; 
 Thu, 27 Jul 2023 00:05:20 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 e22-20020a05600c219600b003fbfea1afffsm995746wme.27.2023.07.27.00.05.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 00:05:19 -0700 (PDT)
Date: Thu, 27 Jul 2023 09:05:19 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Dave Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <dqvxednqyab5t7gvwvcq72x6yu7ug5gusmhpgs3kq6z7pf3co6@ofr6s7547gbe>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dmumsurbkx6mmsib"
Content-Disposition: inline
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--dmumsurbkx6mmsib
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Here's this week drm-misc-fixes PR

Maxime

drm-misc-fixes-2023-07-27:
A single patch to remove an unused function.
The following changes since commit ea293f823a8805735d9e00124df81a8f448ed1ae:

  drm/nouveau/kms/nv50-: init hpd_irq_lock for PIOR DP (2023-07-19 11:08:47 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2023-07-27

for you to fetch changes up to 39b1320e5dc2b707dfb5c25b0298ce9d4fc05aea:

  drm/fb-helper: Remove unused inline function drm_fb_helper_defio_init() (2023-07-25 20:38:37 +0200)

----------------------------------------------------------------
A single patch to remove an unused function.

----------------------------------------------------------------
YueHaibing (1):
      drm/fb-helper: Remove unused inline function drm_fb_helper_defio_init()

 include/drm/drm_fb_helper.h | 5 -----
 1 file changed, 5 deletions(-)

--dmumsurbkx6mmsib
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZMIXLwAKCRDj7w1vZxhR
xaykAP43IELI6U33d2tR0hfFiGAnvvw9uqlZ7e2ha2p5zYesLwD/eo4UIKhp6mnX
pObydxayxfbzIKde7ovy/g3oSl6CtwA=
=tQ+g
-----END PGP SIGNATURE-----

--dmumsurbkx6mmsib--

